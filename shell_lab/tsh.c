/* 
 * tsh - A tiny shell program with job control
 * 
 * Name       : Raehyeon Jeong
 * Student ID : 2020142218
 * Date       : 2023 Dec 04
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

/* Misc manifest constants */
#define MAXLINE    1024   /* max line size */
#define MAXARGS     128   /* max args on a command line */
#define MAXJOBS      16   /* max jobs at any point in time */
#define MAXJID    1<<16   /* max job ID */

/* Job states */
#define UNDEF 0 /* undefined */
#define FG 1    /* running in foreground */
#define BG 2    /* running in background */
#define ST 3    /* stopped */

/*
 * Jobs states: FG (foreground), BG (background), ST (stopped)
 * Job state transitions and enabling actions:
 *     FG -> ST  : ctrl-z
 *     ST -> FG  : fg command
 *     ST -> BG  : bg command
 *     BG -> FG  : fg command
 * At most 1 job can be in the FG state.
 */

/* Global variables */
extern char **environ;      /* defined in libc */
char prompt[] = "tsh> ";    /* command line prompt (DO NOT CHANGE) */
int verbose = 0;            /* if true, print additional output */
int nextjid = 1;            /* next job ID to allocate */
char sbuf[MAXLINE];         /* for composing sprintf messages */

struct job_t {              /* The job struct */
	pid_t pid;              /* job PID */
	int jid;                /* job ID [1, 2, ...] */
	int state;              /* UNDEF, BG, FG, or ST */
	char cmdline[MAXLINE];  /* command line */
};
struct job_t jobs[MAXJOBS]; /* The job list */
/* End global variables */


/* Function prototypes */

/* Here are the functions that you will implement */
void eval(char *cmdline);

int builtin_cmd(char **argv);

void do_bgfg(char **argv);

void waitfg(pid_t pid);

void sigchld_handler(int sig);

void sigtstp_handler(int sig);

void sigint_handler(int sig);

/* Here are helper routines that we've provided for you */
int parseline(const char *cmdline, char **argv);

void sigquit_handler(int sig);

void clearjob(struct job_t *job);

void initjobs(struct job_t *jobs);

int maxjid(struct job_t *jobs);

int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline);

int deletejob(struct job_t *jobs, pid_t pid);

pid_t fgpid(struct job_t *jobs);

struct job_t *getjobpid(struct job_t *jobs, pid_t pid);

struct job_t *getjobjid(struct job_t *jobs, int jid);

int pid2jid(pid_t pid);

void listjobs(struct job_t *jobs);

void usage(void);

void unix_error(char *msg);

void app_error(char *msg);

typedef void handler_t(int);

handler_t *Signal(int signum, handler_t *handler);

/*
 * main - The shell's main routine
 */
int main(int argc, char **argv) {
	char c;
	char cmdline[MAXLINE];
	int emit_prompt = 1; /* emit prompt (default) */

	/* Redirect stderr to stdout (so that driver will get all output
	 * on the pipe connected to stdout) */
	dup2(1, 2);

	/* Parse the command line */
	while ((c = getopt(argc, argv, "hvp")) != EOF) {
		switch (c) {
			case 'h':             /* print help message */
				usage();
				break;
			case 'v':             /* emit additional diagnostic info */
				verbose = 1;
				break;
			case 'p':             /* don't print a prompt */
				emit_prompt = 0;  /* handy for automatic testing */
				break;
			default:
				usage();
		}
	}

	/* Install the signal handlers */

	/* These are the ones you will need to implement */
	Signal(SIGINT, sigint_handler);   /* ctrl-c */
	Signal(SIGTSTP, sigtstp_handler);  /* ctrl-z */
	Signal(SIGCHLD, sigchld_handler);  /* Terminated or stopped child */

	/* This one provides a clean way to kill the shell */
	Signal(SIGQUIT, sigquit_handler);

	/* Initialize the job list */
	initjobs(jobs);

	/* Execute the shell's read/eval loop */
	while (1) {

		/* Read command line */
		if (emit_prompt) {
			printf("%s", prompt);
			fflush(stdout);
		}
		if ((fgets(cmdline, MAXLINE, stdin) == NULL) && ferror(stdin))
			app_error("fgets error");
		if (feof(stdin)) { /* End of file (ctrl-d) */
			fflush(stdout);
			exit(0);
		}

		/* Evaluate the command line */
		eval(cmdline);
		fflush(stdout);
		fflush(stdout);
	}

	exit(0); /* control never reaches here */
}

/*
 * eval - Evaluate the command line that the user has just typed in
 *
 * If the user has requested a built-in command (quit, jobs, bg or fg)
 * then execute it immediately. Otherwise, fork a child process and
 * run the job in the context of the child. If the job is running in
 * the foreground, wait for it to terminate and then return.  Note:
 * each child process must have a unique process group ID so that our
 * background children don't receive SIGINT (SIGTSTP) from the kernel
 * when we type ctrl-c (ctrl-z) at the keyboard.
*/
void eval(char *cmdline) {
	char *argv[MAXARGS]; // char ** type variable  : to store input command
	int is_bg;           // int type variable      : to check if command should run background
	pid_t pid;           // pid_t type variable    : to store pid value from fork() function call
	sigset_t set_full;   // sigset_t type variable : filled set to block all signal
	sigset_t old_set;    // sigset_t type variable : old sigset to restore sigset
	struct job_t *job;   // job_t type variable    : to print info when executed background

	// Parse cmdline and check if command should run background
	is_bg = parseline(cmdline, argv);

	// If no command found, do nothing
	if (!argv[0]) {
		return;
	}

	// Execute and return if command is built-in function
	if (builtin_cmd(argv))
		return;

	// Set full sigset
	if (sigfillset(&set_full)) {
		printf("eval : sigfillset failed\n");
	}

	// Block signal to avoid race condition on job list
	if (sigprocmask(SIG_BLOCK, &set_full, &old_set)) {
		printf("eval : sigprocmask block all failed\n");
	}

	// If it is not built-in function, execute command
	// Child process
	if ((pid = fork()) == 0) {

		// Call setpgid
		if (setpgid(0, 0)) {
			printf("eval : setpgid failed\n");
		}

		// Restore signal set
		if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
			printf("eval : sigprocmask restore failed\n");
		}

		// execute command
		if (execve(argv[0], argv, environ) < 0) {

			// If fail, print and exit
			printf("%s: Command not found\n", argv[0]);
			exit(0);
		}
	}
		// Parent process
	else if (pid > 0) {
		// If command should run background
		if (is_bg) {

			// Add job to job list
			if (!addjob(jobs, pid, BG, cmdline))
				return;

			// Restore signal set
			if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
				printf("eval : sigprocmask restore failed\n");
			}

			// Print background process info
			job = getjobpid(jobs, pid);
			printf("[%d] (%d) %s", job->jid, job->pid, job->cmdline);
		}
			// If command should run foreground
		else {

			// Add job to job list
			if (!addjob(jobs, pid, FG, cmdline))
				return;

			// Restore signal set
			if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
				printf("eval : sigprocmask restore failed\n");
			}

			// Wait until child process ends
			waitfg(pid);
		}
	} // If fork() failed
	else {
		printf("fork failed\n");
	}
	return;
}

/*
 * parseline - Parse the command line and build the argv array.
 *
 * Characters enclosed in single quotes are treated as a single
 * argument.  Return true if the user has requested a BG job, false if
 * the user has requested a FG job.
 */
int parseline(const char *cmdline, char **argv) {
	static char array[MAXLINE]; /* holds local copy of command line */
	char *buf = array;          /* ptr that traverses command line */
	char *delim;                /* points to first space delimiter */
	int argc;                   /* number of args */
	int bg;                     /* background job? */

	strcpy(buf, cmdline);
	buf[strlen(buf) - 1] = ' ';  /* replace trailing '\n' with space */
	while (*buf && (*buf == ' ')) /* ignore leading spaces */
		buf++;

	/* Build the argv list */
	argc = 0;
	if (*buf == '\'') {
		buf++;
		delim = strchr(buf, '\'');
	} else {
		delim = strchr(buf, ' ');
	}

	while (delim) {
		argv[argc++] = buf;
		*delim = '\0';
		buf = delim + 1;
		while (*buf && (*buf == ' ')) /* ignore spaces */
			buf++;

		if (*buf == '\'') {
			buf++;
			delim = strchr(buf, '\'');
		} else {
			delim = strchr(buf, ' ');
		}
	}
	argv[argc] = NULL;

	if (argc == 0)  /* ignore blank line */
		return 1;

	/* should the job run in the background? */
	if ((bg = (*argv[argc - 1] == '&')) != 0) {
		argv[--argc] = NULL;
	}
	return bg;
}

/*
 * builtin_cmd - If the user has typed a built-in command then execute
 *    it immediately.
 */
int builtin_cmd(char **argv) {
	// Execute built-in function : exit
	if (!strncmp(argv[0], "quit", 4) && !argv[1]) {
		exit(0);
	}
	// Execute built-in function : jobs
	if (!strncmp(argv[0], "jobs", 4) && !argv[1]) {
		listjobs(jobs);
		return (1);
	}
	// Execute built-in function : fg and bg
	if (!strncmp(argv[0], "fg", 2) || !strncmp(argv[0], "bg", 2)) {
		do_bgfg(argv);
		return (1);
	}
	return (0);     /* not a builtin command */
}

/*
 * do_bgfg - Execute the builtin bg and fg commands
 */
void do_bgfg(char **argv) {
	struct job_t *job;
	int jid;
	pid_t pid;

	// Initialize variables
	jid = 0;
	pid = 0;

	// If there is no second argument
	if (!argv[1]) {
		printf("%s command requires PID or %%jobid argument\n", argv[0]);
		return;
	}

	// Check if job id or pid
	// job id : argument start with %
	if (argv[1][0] == '%') {
		jid = atoi(&argv[1][1]);
		job = getjobjid(jobs, jid);
	}
		// pid : argument start with number
	else if (('0' <= argv[1][0]) && ('9' >= argv[1][0])) {
		pid = (pid_t)(atoi(argv[1]));
		job = getjobpid(jobs, pid);
	}
		// wrong argument
	else {
		printf("%s: argument must be a PID or %%jobid\n", argv[0]);
		return;
	}

	// Error handling
	if (!job) {
		if (pid)
			printf("(%d): No such process\n", pid);
		else
			printf("%%%d: No such job\n", jid);
		return;
	}

	// 'bg' built-in command
	if (!strncmp(argv[0], "bg", 2)) {

		// Set job state
		job->state = BG;

		// Print job info
		printf("[%d] (%d) %s", job->jid, job->pid, job->cmdline);
	}
		// 'fg' built-in command
	else {

		// Set job state
		job->state = FG;
	}

	// Send SIGCONT signal
	if (kill((job->pid), SIGCONT)) {
		printf("kill function failed.\n");
	}

	// If fg, wait for the process terminate
	if (!strncmp(argv[0], "fg", 2)) {
		waitfg(job->pid);
	}

	return;
}

/*
 * waitfg - Block until process pid is no longer the foreground process
 */
void waitfg(pid_t pid) {
	struct job_t *job;

	job = getjobpid(jobs, pid);

	// Use busy waiting loop
	while (job->state == FG) {
		usleep(1000);
	}

	return;
}

/*****************
 * Signal handlers
 *****************/

/*
 * sigchld_handler - The kernel sends a SIGCHLD to the shell whenever
 *     a child job terminates (becomes a zombie), or stops because it
 *     received a SIGSTOP or SIGTSTP signal. The handler reaps all
 *     available zombie children, but doesn't wait for any other
 *     currently running children to terminate.
 */
void sigchld_handler(int sig) {
	sigset_t set_full;   // sigset_t type variable : filled set to block all signal
	sigset_t old_set;    // sigset_t type variable : old sigset to restore sigset
	int old_errno;       // int type variable      : store errno to restore
	int status;          // int type variable      : to check process status
	pid_t pid;           // pid_t type variable    : to store pid value from fork() function call
	struct job_t *job;   // job_t type variable    : to delete or stop, print info

	// Set full sigset
	if (sigfillset(&set_full)) {
		printf("sigchld handler : sigfillset failed\n");
	}

	// Backup errno
	old_errno = errno;

	while ((pid = waitpid(-1, &status, WNOHANG | WUNTRACED)) > 0) {
		// If process terminated
		if (WIFEXITED(status) || WIFSIGNALED(status)) {

			job = getjobpid(jobs, pid);

			// If received SIGINT
			if (WIFSIGNALED(status) != 0) {
				printf("Job [%d] (%d) terminated by signal 2\n", job->jid, job->pid);
			}

			// Block signal to avoid race condition on job list
			if (sigprocmask(SIG_BLOCK, &set_full, &old_set)) {
				printf("sigchld handler : sigprocmask block all failed\n");
			}

			// Delete job
			if (!deletejob(jobs, pid)) {
				printf("sigchld handler : delete job failed\n");
			}

			// Restore signal
			if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
				printf("sigchld handler : sigprocmask restore sigset failed\n");
			}

		}
			// If process stopped
		else if (WIFSTOPPED(status) != 0) {

			job = getjobpid(jobs, pid);

			// If received SIGTSTP
			printf("Job [%d] (%d) stopped by signal 20\n", job->jid, job->pid);

			// Block signal to avoid race condition on job list
			if (sigprocmask(SIG_BLOCK, &set_full, &old_set)) {
				printf("sigchld handler : sigprocmask block all failed\n");
			}

			// Stop job
			job->state = ST;

			// Restore signal
			if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
				printf("sigchld handler : sigprocmask restore sigset failed\n");
			}

		}
	}

	// Restore errno
	errno = old_errno;

	return;
}

/*
 * sigint_handler - The kernel sends a SIGINT to the shell whenver the
 *    user types ctrl-c at the keyboard.  Catch it and send it along
 *    to the foreground job.
 */
void sigint_handler(int sig) {
	sigset_t set;
	sigset_t old_set;
	int old_errno;
	pid_t pid;

	// Empty sigset
	if (sigemptyset(&set)) {
		printf("sigint handler : sigemptyset failed\n");
	}

	// Add SIGINT to sigset
	if (sigaddset(&set, SIGINT)) {
		printf("sigint handler : sigemptyset failed\n");
	}

	// Backup errno
	old_errno = errno;

	// If current foreground job exist
	if ((pid = fgpid(jobs))) {

		// Block SIGINT to prevent unexpected behavior
		if (sigprocmask(SIG_BLOCK, &set, &old_set)) {
			printf("sigint handler : sigprocmask block SIGINT failed\n");
		}

		// Send SIGINT signal to job
		if (kill(pid, SIGINT)) {
			printf("sigint handler : kill SIGINT to pid %d failed\n", pid);
		}

		// Restore sigset prevent unexpected behavior
		if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
			printf("sigint handler : sigprocmask restore sigset failed\n");
		}
	}

	// Restore errno
	errno = old_errno;

	return;
}

/*
 * sigtstp_handler - The kernel sends a SIGTSTP to the shell whenever
 *     the user types ctrl-z at the keyboard. Catch it and suspend the
 *     foreground job by sending it a SIGTSTP.
 */
void sigtstp_handler(int sig) {
	sigset_t set;
	sigset_t old_set;
	int old_errno;
	pid_t pid;

	// Empty sigset
	if (sigemptyset(&set)) {
		printf("sigtstp handler : sigemptyset failed\n");
	}

	// Add SIGTSTP to sigset
	if (sigaddset(&set, SIGTSTP)) {
		printf("sigtstp handler : sigemptyset failed\n");
	}

	// Backup errno
	old_errno = errno;

	// If current foreground job exist
	if ((pid = fgpid(jobs))) {

		// Block SIGTSTP to prevent unexpected behavior
		if (sigprocmask(SIG_BLOCK, &set, &old_set)) {
			printf("sigtstp handler : sigprocmask block SIGTSTP failed\n");
		}

		// Send SIGTSTP signal to job
		if (kill(pid, SIGTSTP)) {
			printf("sigtstp handler : kill SIGTSTP to pid %d failed\n", pid);
		}

		// Restore sigset prevent unexpected behavior
		if (sigprocmask(SIG_SETMASK, &old_set, NULL)) {
			printf("sigtstp handler : sigprocmask restore sigset failed\n");
		}
	}

	// Restore errno
	errno = old_errno;

	return;
}

/*********************
 * End signal handlers
 *********************/

/***********************************************
 * Helper routines that manipulate the job list
 **********************************************/

/* clearjob - Clear the entries in a job struct */
void clearjob(struct job_t *job) {
	job->pid = 0;
	job->jid = 0;
	job->state = UNDEF;
	job->cmdline[0] = '\0';
}

/* initjobs - Initialize the job list */
void initjobs(struct job_t *jobs) {
	int i;

	for (i = 0; i < MAXJOBS; i++)
		clearjob(&jobs[i]);
}

/* maxjid - Returns largest allocated job ID */
int maxjid(struct job_t *jobs) {
	int i, max = 0;

	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].jid > max)
			max = jobs[i].jid;
	return max;
}

/* addjob - Add a job to the job list */
int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline) {
	int i;

	if (pid < 1)
		return 0;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid == 0) {
			jobs[i].pid = pid;
			jobs[i].state = state;
			jobs[i].jid = nextjid++;
			if (nextjid > MAXJOBS)
				nextjid = 1;
			strcpy(jobs[i].cmdline, cmdline);
			if (verbose) {
				printf("Added job [%d] %d %s\n", jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
			}
			return 1;
		}
	}
	printf("Tried to create too many jobs\n");
	return 0;
}

/* deletejob - Delete a job whose PID=pid from the job list */
int deletejob(struct job_t *jobs, pid_t pid) {
	int i;

	if (pid < 1)
		return 0;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid == pid) {
			clearjob(&jobs[i]);
			nextjid = maxjid(jobs) + 1;
			return 1;
		}
	}
	return 0;
}

/* fgpid - Return PID of current foreground job, 0 if no such job */
pid_t fgpid(struct job_t *jobs) {
	int i;

	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].state == FG)
			return jobs[i].pid;
	return 0;
}

/* getjobpid  - Find a job (by PID) on the job list */
struct job_t *getjobpid(struct job_t *jobs, pid_t pid) {
	int i;

	if (pid < 1)
		return NULL;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].pid == pid)
			return &jobs[i];
	return NULL;
}

/* getjobjid  - Find a job (by JID) on the job list */
struct job_t *getjobjid(struct job_t *jobs, int jid) {
	int i;

	if (jid < 1)
		return NULL;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].jid == jid)
			return &jobs[i];
	return NULL;
}

/* pid2jid - Map process ID to job ID */
int pid2jid(pid_t pid) {
	int i;

	if (pid < 1)
		return 0;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].pid == pid) {
			return jobs[i].jid;
		}
	return 0;
}

/* listjobs - Print the job list */
void listjobs(struct job_t *jobs) {
	int i;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid != 0) {
			printf("[%d] (%d) ", jobs[i].jid, jobs[i].pid);
			switch (jobs[i].state) {
				case BG:
					printf("Running ");
					break;
				case FG:
					printf("Foreground ");
					break;
				case ST:
					printf("Stopped ");
					break;
				default:
					printf("listjobs: Internal error: job[%d].state=%d ",
						   i, jobs[i].state);
			}
			printf("%s", jobs[i].cmdline);
		}
	}
}
/******************************
 * end job list helper routines
 ******************************/


/***********************
 * Other helper routines
 ***********************/

/*
 * usage - print a help message
 */
void usage(void) {
	printf("Usage: shell [-hvp]\n");
	printf("   -h   print this message\n");
	printf("   -v   print additional diagnostic information\n");
	printf("   -p   do not emit a command prompt\n");
	exit(1);
}

/*
 * unix_error - unix-style error routine
 */
void unix_error(char *msg) {
	fprintf(stdout, "%s: %s\n", msg, strerror(errno));
	exit(1);
}

/*
 * app_error - application-style error routine
 */
void app_error(char *msg) {
	fprintf(stdout, "%s\n", msg);
	exit(1);
}

/*
 * Signal - wrapper for the sigaction function
 */
handler_t *Signal(int signum, handler_t *handler) {
	struct sigaction action, old_action;

	action.sa_handler = handler;
	sigemptyset(&action.sa_mask); /* block sigs of type being handled */
	action.sa_flags = SA_RESTART; /* restart syscalls if possible */

	if (sigaction(signum, &action, &old_action) < 0)
		unix_error("Signal error");
	return (old_action.sa_handler);
}

/*
 * sigquit_handler - The driver program can gracefully terminate the
 *    child shell by sending it a SIGQUIT signal.
 */
void sigquit_handler(int sig) {
	printf("Terminating after receipt of SIGQUIT signal\n");
	exit(1);
}