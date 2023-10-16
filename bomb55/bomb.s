
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 3f 00 00 	mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 ca 3e 00 00    	pushq  0x3eca(%rip)        # 4ef0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 cb 3e 00 00 	bnd jmpq *0x3ecb(%rip)        # 4ef8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	pushq  $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmpq 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	pushq  $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmpq 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	pushq  $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmpq 1020 <.plt>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	pushq  $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmpq 1020 <.plt>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	pushq  $0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmpq 1020 <.plt>
    112f:	90                   	nop
    1130:	f3 0f 1e fa          	endbr64 
    1134:	68 10 00 00 00       	pushq  $0x10
    1139:	f2 e9 e1 fe ff ff    	bnd jmpq 1020 <.plt>
    113f:	90                   	nop
    1140:	f3 0f 1e fa          	endbr64 
    1144:	68 11 00 00 00       	pushq  $0x11
    1149:	f2 e9 d1 fe ff ff    	bnd jmpq 1020 <.plt>
    114f:	90                   	nop
    1150:	f3 0f 1e fa          	endbr64 
    1154:	68 12 00 00 00       	pushq  $0x12
    1159:	f2 e9 c1 fe ff ff    	bnd jmpq 1020 <.plt>
    115f:	90                   	nop
    1160:	f3 0f 1e fa          	endbr64 
    1164:	68 13 00 00 00       	pushq  $0x13
    1169:	f2 e9 b1 fe ff ff    	bnd jmpq 1020 <.plt>
    116f:	90                   	nop
    1170:	f3 0f 1e fa          	endbr64 
    1174:	68 14 00 00 00       	pushq  $0x14
    1179:	f2 e9 a1 fe ff ff    	bnd jmpq 1020 <.plt>
    117f:	90                   	nop
    1180:	f3 0f 1e fa          	endbr64 
    1184:	68 15 00 00 00       	pushq  $0x15
    1189:	f2 e9 91 fe ff ff    	bnd jmpq 1020 <.plt>
    118f:	90                   	nop
    1190:	f3 0f 1e fa          	endbr64 
    1194:	68 16 00 00 00       	pushq  $0x16
    1199:	f2 e9 81 fe ff ff    	bnd jmpq 1020 <.plt>
    119f:	90                   	nop
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	68 17 00 00 00       	pushq  $0x17
    11a9:	f2 e9 71 fe ff ff    	bnd jmpq 1020 <.plt>
    11af:	90                   	nop
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	68 18 00 00 00       	pushq  $0x18
    11b9:	f2 e9 61 fe ff ff    	bnd jmpq 1020 <.plt>
    11bf:	90                   	nop
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	68 19 00 00 00       	pushq  $0x19
    11c9:	f2 e9 51 fe ff ff    	bnd jmpq 1020 <.plt>
    11cf:	90                   	nop
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	68 1a 00 00 00       	pushq  $0x1a
    11d9:	f2 e9 41 fe ff ff    	bnd jmpq 1020 <.plt>
    11df:	90                   	nop

Disassembly of section .plt.got:

00000000000011e0 <__cxa_finalize@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 0d 3e 00 00 	bnd jmpq *0x3e0d(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000011f0 <getenv@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 05 3d 00 00 	bnd jmpq *0x3d05(%rip)        # 4f00 <getenv@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001200 <strcasecmp@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 fd 3c 00 00 	bnd jmpq *0x3cfd(%rip)        # 4f08 <strcasecmp@GLIBC_2.2.5>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <__errno_location@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 f5 3c 00 00 	bnd jmpq *0x3cf5(%rip)        # 4f10 <__errno_location@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001220 <strcpy@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 ed 3c 00 00 	bnd jmpq *0x3ced(%rip)        # 4f18 <strcpy@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001230 <puts@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 e5 3c 00 00 	bnd jmpq *0x3ce5(%rip)        # 4f20 <puts@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001240 <write@plt>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	f2 ff 25 dd 3c 00 00 	bnd jmpq *0x3cdd(%rip)        # 4f28 <write@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001250 <__stack_chk_fail@plt>:
    1250:	f3 0f 1e fa          	endbr64 
    1254:	f2 ff 25 d5 3c 00 00 	bnd jmpq *0x3cd5(%rip)        # 4f30 <__stack_chk_fail@GLIBC_2.4>
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <alarm@plt>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	f2 ff 25 cd 3c 00 00 	bnd jmpq *0x3ccd(%rip)        # 4f38 <alarm@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <close@plt>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	f2 ff 25 c5 3c 00 00 	bnd jmpq *0x3cc5(%rip)        # 4f40 <close@GLIBC_2.2.5>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <read@plt>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	f2 ff 25 bd 3c 00 00 	bnd jmpq *0x3cbd(%rip)        # 4f48 <read@GLIBC_2.2.5>
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <fgets@plt>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	f2 ff 25 b5 3c 00 00 	bnd jmpq *0x3cb5(%rip)        # 4f50 <fgets@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <signal@plt>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	f2 ff 25 ad 3c 00 00 	bnd jmpq *0x3cad(%rip)        # 4f58 <signal@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012b0 <gethostbyname@plt>:
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	f2 ff 25 a5 3c 00 00 	bnd jmpq *0x3ca5(%rip)        # 4f60 <gethostbyname@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012c0 <__memmove_chk@plt>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	f2 ff 25 9d 3c 00 00 	bnd jmpq *0x3c9d(%rip)        # 4f68 <__memmove_chk@GLIBC_2.3.4>
    12cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012d0 <strtol@plt>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	f2 ff 25 95 3c 00 00 	bnd jmpq *0x3c95(%rip)        # 4f70 <strtol@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012e0 <fflush@plt>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	f2 ff 25 8d 3c 00 00 	bnd jmpq *0x3c8d(%rip)        # 4f78 <fflush@GLIBC_2.2.5>
    12eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012f0 <__isoc99_sscanf@plt>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	f2 ff 25 85 3c 00 00 	bnd jmpq *0x3c85(%rip)        # 4f80 <__isoc99_sscanf@GLIBC_2.7>
    12fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001300 <__printf_chk@plt>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	f2 ff 25 7d 3c 00 00 	bnd jmpq *0x3c7d(%rip)        # 4f88 <__printf_chk@GLIBC_2.3.4>
    130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001310 <fopen@plt>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	f2 ff 25 75 3c 00 00 	bnd jmpq *0x3c75(%rip)        # 4f90 <fopen@GLIBC_2.2.5>
    131b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001320 <gethostname@plt>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	f2 ff 25 6d 3c 00 00 	bnd jmpq *0x3c6d(%rip)        # 4f98 <gethostname@GLIBC_2.2.5>
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001330 <exit@plt>:
    1330:	f3 0f 1e fa          	endbr64 
    1334:	f2 ff 25 65 3c 00 00 	bnd jmpq *0x3c65(%rip)        # 4fa0 <exit@GLIBC_2.2.5>
    133b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001340 <connect@plt>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	f2 ff 25 5d 3c 00 00 	bnd jmpq *0x3c5d(%rip)        # 4fa8 <connect@GLIBC_2.2.5>
    134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001350 <__fprintf_chk@plt>:
    1350:	f3 0f 1e fa          	endbr64 
    1354:	f2 ff 25 55 3c 00 00 	bnd jmpq *0x3c55(%rip)        # 4fb0 <__fprintf_chk@GLIBC_2.3.4>
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001360 <sleep@plt>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	f2 ff 25 4d 3c 00 00 	bnd jmpq *0x3c4d(%rip)        # 4fb8 <sleep@GLIBC_2.2.5>
    136b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001370 <__ctype_b_loc@plt>:
    1370:	f3 0f 1e fa          	endbr64 
    1374:	f2 ff 25 45 3c 00 00 	bnd jmpq *0x3c45(%rip)        # 4fc0 <__ctype_b_loc@GLIBC_2.3>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001380 <__sprintf_chk@plt>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	f2 ff 25 3d 3c 00 00 	bnd jmpq *0x3c3d(%rip)        # 4fc8 <__sprintf_chk@GLIBC_2.3.4>
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001390 <socket@plt>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	f2 ff 25 35 3c 00 00 	bnd jmpq *0x3c35(%rip)        # 4fd0 <socket@GLIBC_2.2.5>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000013a0 <_start>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	31 ed                	xor    %ebp,%ebp
    13a6:	49 89 d1             	mov    %rdx,%r9
    13a9:	5e                   	pop    %rsi
    13aa:	48 89 e2             	mov    %rsp,%rdx
    13ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13b1:	50                   	push   %rax
    13b2:	54                   	push   %rsp
    13b3:	4c 8d 05 76 19 00 00 	lea    0x1976(%rip),%r8        # 2d30 <__libc_csu_fini>
    13ba:	48 8d 0d ff 18 00 00 	lea    0x18ff(%rip),%rcx        # 2cc0 <__libc_csu_init>
    13c1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1489 <main>
    13c8:	ff 15 12 3c 00 00    	callq  *0x3c12(%rip)        # 4fe0 <__libc_start_main@GLIBC_2.2.5>
    13ce:	f4                   	hlt    
    13cf:	90                   	nop

00000000000013d0 <deregister_tm_clones>:
    13d0:	48 8d 3d a9 42 00 00 	lea    0x42a9(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    13d7:	48 8d 05 a2 42 00 00 	lea    0x42a2(%rip),%rax        # 5680 <stdout@@GLIBC_2.2.5>
    13de:	48 39 f8             	cmp    %rdi,%rax
    13e1:	74 15                	je     13f8 <deregister_tm_clones+0x28>
    13e3:	48 8b 05 ee 3b 00 00 	mov    0x3bee(%rip),%rax        # 4fd8 <_ITM_deregisterTMCloneTable>
    13ea:	48 85 c0             	test   %rax,%rax
    13ed:	74 09                	je     13f8 <deregister_tm_clones+0x28>
    13ef:	ff e0                	jmpq   *%rax
    13f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13f8:	c3                   	retq   
    13f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001400 <register_tm_clones>:
    1400:	48 8d 3d 79 42 00 00 	lea    0x4279(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    1407:	48 8d 35 72 42 00 00 	lea    0x4272(%rip),%rsi        # 5680 <stdout@@GLIBC_2.2.5>
    140e:	48 29 fe             	sub    %rdi,%rsi
    1411:	48 89 f0             	mov    %rsi,%rax
    1414:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1418:	48 c1 f8 03          	sar    $0x3,%rax
    141c:	48 01 c6             	add    %rax,%rsi
    141f:	48 d1 fe             	sar    %rsi
    1422:	74 14                	je     1438 <register_tm_clones+0x38>
    1424:	48 8b 05 c5 3b 00 00 	mov    0x3bc5(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable>
    142b:	48 85 c0             	test   %rax,%rax
    142e:	74 08                	je     1438 <register_tm_clones+0x38>
    1430:	ff e0                	jmpq   *%rax
    1432:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1438:	c3                   	retq   
    1439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001440 <__do_global_dtors_aux>:
    1440:	f3 0f 1e fa          	endbr64 
    1444:	80 3d 5d 42 00 00 00 	cmpb   $0x0,0x425d(%rip)        # 56a8 <completed.8061>
    144b:	75 2b                	jne    1478 <__do_global_dtors_aux+0x38>
    144d:	55                   	push   %rbp
    144e:	48 83 3d a2 3b 00 00 	cmpq   $0x0,0x3ba2(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    1455:	00 
    1456:	48 89 e5             	mov    %rsp,%rbp
    1459:	74 0c                	je     1467 <__do_global_dtors_aux+0x27>
    145b:	48 8b 3d a6 3b 00 00 	mov    0x3ba6(%rip),%rdi        # 5008 <__dso_handle>
    1462:	e8 79 fd ff ff       	callq  11e0 <__cxa_finalize@plt>
    1467:	e8 64 ff ff ff       	callq  13d0 <deregister_tm_clones>
    146c:	c6 05 35 42 00 00 01 	movb   $0x1,0x4235(%rip)        # 56a8 <completed.8061>
    1473:	5d                   	pop    %rbp
    1474:	c3                   	retq   
    1475:	0f 1f 00             	nopl   (%rax)
    1478:	c3                   	retq   
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <frame_dummy>:
    1480:	f3 0f 1e fa          	endbr64 
    1484:	e9 77 ff ff ff       	jmpq   1400 <register_tm_clones>

0000000000001489 <main>:
    1489:	f3 0f 1e fa          	endbr64 
    148d:	53                   	push   %rbx
    148e:	83 ff 01             	cmp    $0x1,%edi
    1491:	0f 84 f8 00 00 00    	je     158f <main+0x106>
    1497:	48 89 f3             	mov    %rsi,%rbx
    149a:	83 ff 02             	cmp    $0x2,%edi
    149d:	0f 85 21 01 00 00    	jne    15c4 <main+0x13b>
    14a3:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    14a7:	48 8d 35 11 20 00 00 	lea    0x2011(%rip),%rsi        # 34bf <array.3472+0x2df>
    14ae:	e8 5d fe ff ff       	callq  1310 <fopen@plt>
    14b3:	48 89 05 f6 41 00 00 	mov    %rax,0x41f6(%rip)        # 56b0 <infile>
    14ba:	48 85 c0             	test   %rax,%rax
    14bd:	0f 84 df 00 00 00    	je     15a2 <main+0x119>
    14c3:	e8 05 07 00 00       	callq  1bcd <initialize_bomb>
    14c8:	48 8d 3d b9 1b 00 00 	lea    0x1bb9(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    14cf:	e8 5c fd ff ff       	callq  1230 <puts@plt>
    14d4:	48 8d 3d ed 1b 00 00 	lea    0x1bed(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    14db:	e8 50 fd ff ff       	callq  1230 <puts@plt>
    14e0:	e8 ff 09 00 00       	callq  1ee4 <read_line>
    14e5:	48 89 c7             	mov    %rax,%rdi
    14e8:	e8 fa 00 00 00       	callq  15e7 <phase_1>
    14ed:	e8 3a 0b 00 00       	callq  202c <phase_defused>
    14f2:	48 8d 3d ff 1b 00 00 	lea    0x1bff(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    14f9:	e8 32 fd ff ff       	callq  1230 <puts@plt>
    14fe:	e8 e1 09 00 00       	callq  1ee4 <read_line>
    1503:	48 89 c7             	mov    %rax,%rdi
    1506:	e8 00 01 00 00       	callq  160b <phase_2>
    150b:	e8 1c 0b 00 00       	callq  202c <phase_defused>
    1510:	48 8d 3d 24 1b 00 00 	lea    0x1b24(%rip),%rdi        # 303b <_IO_stdin_used+0x3b>
    1517:	e8 14 fd ff ff       	callq  1230 <puts@plt>
    151c:	e8 c3 09 00 00       	callq  1ee4 <read_line>
    1521:	48 89 c7             	mov    %rax,%rdi
    1524:	e8 54 01 00 00       	callq  167d <phase_3>
    1529:	e8 fe 0a 00 00       	callq  202c <phase_defused>
    152e:	48 8d 3d 24 1b 00 00 	lea    0x1b24(%rip),%rdi        # 3059 <_IO_stdin_used+0x59>
    1535:	e8 f6 fc ff ff       	callq  1230 <puts@plt>
    153a:	e8 a5 09 00 00       	callq  1ee4 <read_line>
    153f:	48 89 c7             	mov    %rax,%rdi
    1542:	e8 ef 02 00 00       	callq  1836 <phase_4>
    1547:	e8 e0 0a 00 00       	callq  202c <phase_defused>
    154c:	48 8d 3d d5 1b 00 00 	lea    0x1bd5(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    1553:	e8 d8 fc ff ff       	callq  1230 <puts@plt>
    1558:	e8 87 09 00 00       	callq  1ee4 <read_line>
    155d:	48 89 c7             	mov    %rax,%rdi
    1560:	e8 46 03 00 00       	callq  18ab <phase_5>
    1565:	e8 c2 0a 00 00       	callq  202c <phase_defused>
    156a:	48 8d 3d f7 1a 00 00 	lea    0x1af7(%rip),%rdi        # 3068 <_IO_stdin_used+0x68>
    1571:	e8 ba fc ff ff       	callq  1230 <puts@plt>
    1576:	e8 69 09 00 00       	callq  1ee4 <read_line>
    157b:	48 89 c7             	mov    %rax,%rdi
    157e:	e8 74 03 00 00       	callq  18f7 <phase_6>
    1583:	e8 a4 0a 00 00       	callq  202c <phase_defused>
    1588:	b8 00 00 00 00       	mov    $0x0,%eax
    158d:	5b                   	pop    %rbx
    158e:	c3                   	retq   
    158f:	48 8b 05 fa 40 00 00 	mov    0x40fa(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    1596:	48 89 05 13 41 00 00 	mov    %rax,0x4113(%rip)        # 56b0 <infile>
    159d:	e9 21 ff ff ff       	jmpq   14c3 <main+0x3a>
    15a2:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    15a6:	48 8b 13             	mov    (%rbx),%rdx
    15a9:	48 8d 35 54 1a 00 00 	lea    0x1a54(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    15b0:	bf 01 00 00 00       	mov    $0x1,%edi
    15b5:	e8 46 fd ff ff       	callq  1300 <__printf_chk@plt>
    15ba:	bf 08 00 00 00       	mov    $0x8,%edi
    15bf:	e8 6c fd ff ff       	callq  1330 <exit@plt>
    15c4:	48 8b 16             	mov    (%rsi),%rdx
    15c7:	48 8d 35 53 1a 00 00 	lea    0x1a53(%rip),%rsi        # 3021 <_IO_stdin_used+0x21>
    15ce:	bf 01 00 00 00       	mov    $0x1,%edi
    15d3:	b8 00 00 00 00       	mov    $0x0,%eax
    15d8:	e8 23 fd ff ff       	callq  1300 <__printf_chk@plt>
    15dd:	bf 08 00 00 00       	mov    $0x8,%edi
    15e2:	e8 49 fd ff ff       	callq  1330 <exit@plt>

00000000000015e7 <phase_1>:
    15e7:	f3 0f 1e fa          	endbr64 
    15eb:	48 83 ec 08          	sub    $0x8,%rsp
    15ef:	48 8d 35 5a 1b 00 00 	lea    0x1b5a(%rip),%rsi        # 3150 <_IO_stdin_used+0x150>
    15f6:	e8 72 05 00 00       	callq  1b6d <strings_not_equal>
    15fb:	85 c0                	test   %eax,%eax
    15fd:	75 05                	jne    1604 <phase_1+0x1d>
    15ff:	48 83 c4 08          	add    $0x8,%rsp
    1603:	c3                   	retq   
    1604:	e8 54 08 00 00       	callq  1e5d <explode_bomb>
    1609:	eb f4                	jmp    15ff <phase_1+0x18>

000000000000160b <phase_2>:
    160b:	f3 0f 1e fa          	endbr64 
    160f:	55                   	push   %rbp
    1610:	53                   	push   %rbx
    1611:	48 83 ec 28          	sub    $0x28,%rsp
    1615:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    161c:	00 00 
    161e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1623:	31 c0                	xor    %eax,%eax
    1625:	48 89 e6             	mov    %rsp,%rsi
    1628:	e8 72 08 00 00       	callq  1e9f <read_six_numbers>
    162d:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    1631:	78 0a                	js     163d <phase_2+0x32>
    1633:	48 89 e5             	mov    %rsp,%rbp
    1636:	bb 01 00 00 00       	mov    $0x1,%ebx
    163b:	eb 18                	jmp    1655 <phase_2+0x4a>
    163d:	e8 1b 08 00 00       	callq  1e5d <explode_bomb>
    1642:	eb ef                	jmp    1633 <phase_2+0x28>
    1644:	e8 14 08 00 00       	callq  1e5d <explode_bomb>
    1649:	83 c3 01             	add    $0x1,%ebx
    164c:	48 83 c5 04          	add    $0x4,%rbp
    1650:	83 fb 06             	cmp    $0x6,%ebx
    1653:	74 0c                	je     1661 <phase_2+0x56>
    1655:	89 d8                	mov    %ebx,%eax
    1657:	03 45 00             	add    0x0(%rbp),%eax
    165a:	39 45 04             	cmp    %eax,0x4(%rbp)
    165d:	74 ea                	je     1649 <phase_2+0x3e>
    165f:	eb e3                	jmp    1644 <phase_2+0x39>
    1661:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1666:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    166d:	00 00 
    166f:	75 07                	jne    1678 <phase_2+0x6d>
    1671:	48 83 c4 28          	add    $0x28,%rsp
    1675:	5b                   	pop    %rbx
    1676:	5d                   	pop    %rbp
    1677:	c3                   	retq   
    1678:	e8 d3 fb ff ff       	callq  1250 <__stack_chk_fail@plt>

000000000000167d <phase_3>:
    167d:	f3 0f 1e fa          	endbr64 
    1681:	48 83 ec 28          	sub    $0x28,%rsp
    1685:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    168c:	00 00 
    168e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1693:	31 c0                	xor    %eax,%eax
    1695:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
    169a:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    169f:	4c 8d 44 24 14       	lea    0x14(%rsp),%r8
    16a4:	48 8d 35 f3 1a 00 00 	lea    0x1af3(%rip),%rsi        # 319e <_IO_stdin_used+0x19e>
    16ab:	e8 40 fc ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    16b0:	83 f8 02             	cmp    $0x2,%eax
    16b3:	7e 20                	jle    16d5 <phase_3+0x58>
    16b5:	83 7c 24 10 07       	cmpl   $0x7,0x10(%rsp)
    16ba:	0f 87 0a 01 00 00    	ja     17ca <phase_3+0x14d>
    16c0:	8b 44 24 10          	mov    0x10(%rsp),%eax
    16c4:	48 8d 15 f5 1a 00 00 	lea    0x1af5(%rip),%rdx        # 31c0 <_IO_stdin_used+0x1c0>
    16cb:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    16cf:	48 01 d0             	add    %rdx,%rax
    16d2:	3e ff e0             	notrack jmpq *%rax
    16d5:	e8 83 07 00 00       	callq  1e5d <explode_bomb>
    16da:	eb d9                	jmp    16b5 <phase_3+0x38>
    16dc:	b8 79 00 00 00       	mov    $0x79,%eax
    16e1:	81 7c 24 14 b2 00 00 	cmpl   $0xb2,0x14(%rsp)
    16e8:	00 
    16e9:	0f 84 e5 00 00 00    	je     17d4 <phase_3+0x157>
    16ef:	e8 69 07 00 00       	callq  1e5d <explode_bomb>
    16f4:	b8 79 00 00 00       	mov    $0x79,%eax
    16f9:	e9 d6 00 00 00       	jmpq   17d4 <phase_3+0x157>
    16fe:	b8 70 00 00 00       	mov    $0x70,%eax
    1703:	83 7c 24 14 3b       	cmpl   $0x3b,0x14(%rsp)
    1708:	0f 84 c6 00 00 00    	je     17d4 <phase_3+0x157>
    170e:	e8 4a 07 00 00       	callq  1e5d <explode_bomb>
    1713:	b8 70 00 00 00       	mov    $0x70,%eax
    1718:	e9 b7 00 00 00       	jmpq   17d4 <phase_3+0x157>
    171d:	b8 79 00 00 00       	mov    $0x79,%eax
    1722:	81 7c 24 14 87 02 00 	cmpl   $0x287,0x14(%rsp)
    1729:	00 
    172a:	0f 84 a4 00 00 00    	je     17d4 <phase_3+0x157>
    1730:	e8 28 07 00 00       	callq  1e5d <explode_bomb>
    1735:	b8 79 00 00 00       	mov    $0x79,%eax
    173a:	e9 95 00 00 00       	jmpq   17d4 <phase_3+0x157>
    173f:	b8 78 00 00 00       	mov    $0x78,%eax
    1744:	81 7c 24 14 a2 01 00 	cmpl   $0x1a2,0x14(%rsp)
    174b:	00 
    174c:	0f 84 82 00 00 00    	je     17d4 <phase_3+0x157>
    1752:	e8 06 07 00 00       	callq  1e5d <explode_bomb>
    1757:	b8 78 00 00 00       	mov    $0x78,%eax
    175c:	eb 76                	jmp    17d4 <phase_3+0x157>
    175e:	b8 78 00 00 00       	mov    $0x78,%eax
    1763:	81 7c 24 14 ef 01 00 	cmpl   $0x1ef,0x14(%rsp)
    176a:	00 
    176b:	74 67                	je     17d4 <phase_3+0x157>
    176d:	e8 eb 06 00 00       	callq  1e5d <explode_bomb>
    1772:	b8 78 00 00 00       	mov    $0x78,%eax
    1777:	eb 5b                	jmp    17d4 <phase_3+0x157>
    1779:	b8 72 00 00 00       	mov    $0x72,%eax
    177e:	81 7c 24 14 87 01 00 	cmpl   $0x187,0x14(%rsp)
    1785:	00 
    1786:	74 4c                	je     17d4 <phase_3+0x157>
    1788:	e8 d0 06 00 00       	callq  1e5d <explode_bomb>
    178d:	b8 72 00 00 00       	mov    $0x72,%eax
    1792:	eb 40                	jmp    17d4 <phase_3+0x157>
    1794:	b8 79 00 00 00       	mov    $0x79,%eax
    1799:	81 7c 24 14 84 02 00 	cmpl   $0x284,0x14(%rsp)
    17a0:	00 
    17a1:	74 31                	je     17d4 <phase_3+0x157>
    17a3:	e8 b5 06 00 00       	callq  1e5d <explode_bomb>
    17a8:	b8 79 00 00 00       	mov    $0x79,%eax
    17ad:	eb 25                	jmp    17d4 <phase_3+0x157>
    17af:	b8 6b 00 00 00       	mov    $0x6b,%eax
    17b4:	81 7c 24 14 de 00 00 	cmpl   $0xde,0x14(%rsp)
    17bb:	00 
    17bc:	74 16                	je     17d4 <phase_3+0x157>
    17be:	e8 9a 06 00 00       	callq  1e5d <explode_bomb>
    17c3:	b8 6b 00 00 00       	mov    $0x6b,%eax
    17c8:	eb 0a                	jmp    17d4 <phase_3+0x157>
    17ca:	e8 8e 06 00 00       	callq  1e5d <explode_bomb>
    17cf:	b8 65 00 00 00       	mov    $0x65,%eax
    17d4:	38 44 24 0f          	cmp    %al,0xf(%rsp)
    17d8:	75 15                	jne    17ef <phase_3+0x172>
    17da:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    17df:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    17e6:	00 00 
    17e8:	75 0c                	jne    17f6 <phase_3+0x179>
    17ea:	48 83 c4 28          	add    $0x28,%rsp
    17ee:	c3                   	retq   
    17ef:	e8 69 06 00 00       	callq  1e5d <explode_bomb>
    17f4:	eb e4                	jmp    17da <phase_3+0x15d>
    17f6:	e8 55 fa ff ff       	callq  1250 <__stack_chk_fail@plt>

00000000000017fb <func4>:
    17fb:	f3 0f 1e fa          	endbr64 
    17ff:	b8 00 00 00 00       	mov    $0x0,%eax
    1804:	85 ff                	test   %edi,%edi
    1806:	7e 2d                	jle    1835 <func4+0x3a>
    1808:	41 54                	push   %r12
    180a:	55                   	push   %rbp
    180b:	53                   	push   %rbx
    180c:	89 fb                	mov    %edi,%ebx
    180e:	89 f5                	mov    %esi,%ebp
    1810:	89 f0                	mov    %esi,%eax
    1812:	83 ff 01             	cmp    $0x1,%edi
    1815:	74 19                	je     1830 <func4+0x35>
    1817:	8d 7f ff             	lea    -0x1(%rdi),%edi
    181a:	e8 dc ff ff ff       	callq  17fb <func4>
    181f:	44 8d 24 28          	lea    (%rax,%rbp,1),%r12d
    1823:	8d 7b fe             	lea    -0x2(%rbx),%edi
    1826:	89 ee                	mov    %ebp,%esi
    1828:	e8 ce ff ff ff       	callq  17fb <func4>
    182d:	44 01 e0             	add    %r12d,%eax
    1830:	5b                   	pop    %rbx
    1831:	5d                   	pop    %rbp
    1832:	41 5c                	pop    %r12
    1834:	c3                   	retq   
    1835:	c3                   	retq   

0000000000001836 <phase_4>:
    1836:	f3 0f 1e fa          	endbr64 
    183a:	48 83 ec 18          	sub    $0x18,%rsp
    183e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1845:	00 00 
    1847:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    184c:	31 c0                	xor    %eax,%eax
    184e:	48 89 e1             	mov    %rsp,%rcx
    1851:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    1856:	48 8d 35 e8 1b 00 00 	lea    0x1be8(%rip),%rsi        # 3445 <array.3472+0x265>
    185d:	e8 8e fa ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1862:	83 f8 02             	cmp    $0x2,%eax
    1865:	75 0b                	jne    1872 <phase_4+0x3c>
    1867:	8b 04 24             	mov    (%rsp),%eax
    186a:	83 e8 02             	sub    $0x2,%eax
    186d:	83 f8 02             	cmp    $0x2,%eax
    1870:	76 05                	jbe    1877 <phase_4+0x41>
    1872:	e8 e6 05 00 00       	callq  1e5d <explode_bomb>
    1877:	8b 34 24             	mov    (%rsp),%esi
    187a:	bf 09 00 00 00       	mov    $0x9,%edi
    187f:	e8 77 ff ff ff       	callq  17fb <func4>
    1884:	39 44 24 04          	cmp    %eax,0x4(%rsp)
    1888:	75 15                	jne    189f <phase_4+0x69>
    188a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    188f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1896:	00 00 
    1898:	75 0c                	jne    18a6 <phase_4+0x70>
    189a:	48 83 c4 18          	add    $0x18,%rsp
    189e:	c3                   	retq   
    189f:	e8 b9 05 00 00       	callq  1e5d <explode_bomb>
    18a4:	eb e4                	jmp    188a <phase_4+0x54>
    18a6:	e8 a5 f9 ff ff       	callq  1250 <__stack_chk_fail@plt>

00000000000018ab <phase_5>:
    18ab:	f3 0f 1e fa          	endbr64 
    18af:	53                   	push   %rbx
    18b0:	48 89 fb             	mov    %rdi,%rbx
    18b3:	e8 94 02 00 00       	callq  1b4c <string_length>
    18b8:	83 f8 06             	cmp    $0x6,%eax
    18bb:	75 2c                	jne    18e9 <phase_5+0x3e>
    18bd:	48 89 d8             	mov    %rbx,%rax
    18c0:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
    18c4:	b9 00 00 00 00       	mov    $0x0,%ecx
    18c9:	48 8d 35 10 19 00 00 	lea    0x1910(%rip),%rsi        # 31e0 <array.3472>
    18d0:	0f b6 10             	movzbl (%rax),%edx
    18d3:	83 e2 0f             	and    $0xf,%edx
    18d6:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
    18d9:	48 83 c0 01          	add    $0x1,%rax
    18dd:	48 39 f8             	cmp    %rdi,%rax
    18e0:	75 ee                	jne    18d0 <phase_5+0x25>
    18e2:	83 f9 2b             	cmp    $0x2b,%ecx
    18e5:	75 09                	jne    18f0 <phase_5+0x45>
    18e7:	5b                   	pop    %rbx
    18e8:	c3                   	retq   
    18e9:	e8 6f 05 00 00       	callq  1e5d <explode_bomb>
    18ee:	eb cd                	jmp    18bd <phase_5+0x12>
    18f0:	e8 68 05 00 00       	callq  1e5d <explode_bomb>
    18f5:	eb f0                	jmp    18e7 <phase_5+0x3c>

00000000000018f7 <phase_6>:
    18f7:	f3 0f 1e fa          	endbr64 
    18fb:	41 56                	push   %r14
    18fd:	41 55                	push   %r13
    18ff:	41 54                	push   %r12
    1901:	55                   	push   %rbp
    1902:	53                   	push   %rbx
    1903:	48 83 ec 60          	sub    $0x60,%rsp
    1907:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    190e:	00 00 
    1910:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    1915:	31 c0                	xor    %eax,%eax
    1917:	49 89 e5             	mov    %rsp,%r13
    191a:	4c 89 ee             	mov    %r13,%rsi
    191d:	e8 7d 05 00 00       	callq  1e9f <read_six_numbers>
    1922:	41 be 01 00 00 00    	mov    $0x1,%r14d
    1928:	49 89 e4             	mov    %rsp,%r12
    192b:	eb 28                	jmp    1955 <phase_6+0x5e>
    192d:	e8 2b 05 00 00       	callq  1e5d <explode_bomb>
    1932:	eb 30                	jmp    1964 <phase_6+0x6d>
    1934:	48 83 c3 01          	add    $0x1,%rbx
    1938:	83 fb 05             	cmp    $0x5,%ebx
    193b:	7f 10                	jg     194d <phase_6+0x56>
    193d:	41 8b 04 9c          	mov    (%r12,%rbx,4),%eax
    1941:	39 45 00             	cmp    %eax,0x0(%rbp)
    1944:	75 ee                	jne    1934 <phase_6+0x3d>
    1946:	e8 12 05 00 00       	callq  1e5d <explode_bomb>
    194b:	eb e7                	jmp    1934 <phase_6+0x3d>
    194d:	49 83 c6 01          	add    $0x1,%r14
    1951:	49 83 c5 04          	add    $0x4,%r13
    1955:	4c 89 ed             	mov    %r13,%rbp
    1958:	41 8b 45 00          	mov    0x0(%r13),%eax
    195c:	83 e8 01             	sub    $0x1,%eax
    195f:	83 f8 05             	cmp    $0x5,%eax
    1962:	77 c9                	ja     192d <phase_6+0x36>
    1964:	41 83 fe 05          	cmp    $0x5,%r14d
    1968:	7f 05                	jg     196f <phase_6+0x78>
    196a:	4c 89 f3             	mov    %r14,%rbx
    196d:	eb ce                	jmp    193d <phase_6+0x46>
    196f:	be 00 00 00 00       	mov    $0x0,%esi
    1974:	8b 0c b4             	mov    (%rsp,%rsi,4),%ecx
    1977:	b8 01 00 00 00       	mov    $0x1,%eax
    197c:	48 8d 15 ad 38 00 00 	lea    0x38ad(%rip),%rdx        # 5230 <node1>
    1983:	83 f9 01             	cmp    $0x1,%ecx
    1986:	7e 0b                	jle    1993 <phase_6+0x9c>
    1988:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    198c:	83 c0 01             	add    $0x1,%eax
    198f:	39 c8                	cmp    %ecx,%eax
    1991:	75 f5                	jne    1988 <phase_6+0x91>
    1993:	48 89 54 f4 20       	mov    %rdx,0x20(%rsp,%rsi,8)
    1998:	48 83 c6 01          	add    $0x1,%rsi
    199c:	48 83 fe 06          	cmp    $0x6,%rsi
    19a0:	75 d2                	jne    1974 <phase_6+0x7d>
    19a2:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
    19a7:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    19ac:	48 89 43 08          	mov    %rax,0x8(%rbx)
    19b0:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    19b5:	48 89 50 08          	mov    %rdx,0x8(%rax)
    19b9:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    19be:	48 89 42 08          	mov    %rax,0x8(%rdx)
    19c2:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    19c7:	48 89 50 08          	mov    %rdx,0x8(%rax)
    19cb:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    19d0:	48 89 42 08          	mov    %rax,0x8(%rdx)
    19d4:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    19db:	00 
    19dc:	bd 05 00 00 00       	mov    $0x5,%ebp
    19e1:	eb 09                	jmp    19ec <phase_6+0xf5>
    19e3:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    19e7:	83 ed 01             	sub    $0x1,%ebp
    19ea:	74 11                	je     19fd <phase_6+0x106>
    19ec:	48 8b 43 08          	mov    0x8(%rbx),%rax
    19f0:	8b 00                	mov    (%rax),%eax
    19f2:	39 03                	cmp    %eax,(%rbx)
    19f4:	7d ed                	jge    19e3 <phase_6+0xec>
    19f6:	e8 62 04 00 00       	callq  1e5d <explode_bomb>
    19fb:	eb e6                	jmp    19e3 <phase_6+0xec>
    19fd:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    1a02:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1a09:	00 00 
    1a0b:	75 0d                	jne    1a1a <phase_6+0x123>
    1a0d:	48 83 c4 60          	add    $0x60,%rsp
    1a11:	5b                   	pop    %rbx
    1a12:	5d                   	pop    %rbp
    1a13:	41 5c                	pop    %r12
    1a15:	41 5d                	pop    %r13
    1a17:	41 5e                	pop    %r14
    1a19:	c3                   	retq   
    1a1a:	e8 31 f8 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001a1f <fun7>:
    1a1f:	f3 0f 1e fa          	endbr64 
    1a23:	48 85 ff             	test   %rdi,%rdi
    1a26:	74 32                	je     1a5a <fun7+0x3b>
    1a28:	48 83 ec 08          	sub    $0x8,%rsp
    1a2c:	8b 17                	mov    (%rdi),%edx
    1a2e:	39 f2                	cmp    %esi,%edx
    1a30:	7f 0c                	jg     1a3e <fun7+0x1f>
    1a32:	b8 00 00 00 00       	mov    $0x0,%eax
    1a37:	75 12                	jne    1a4b <fun7+0x2c>
    1a39:	48 83 c4 08          	add    $0x8,%rsp
    1a3d:	c3                   	retq   
    1a3e:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    1a42:	e8 d8 ff ff ff       	callq  1a1f <fun7>
    1a47:	01 c0                	add    %eax,%eax
    1a49:	eb ee                	jmp    1a39 <fun7+0x1a>
    1a4b:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    1a4f:	e8 cb ff ff ff       	callq  1a1f <fun7>
    1a54:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    1a58:	eb df                	jmp    1a39 <fun7+0x1a>
    1a5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1a5f:	c3                   	retq   

0000000000001a60 <secret_phase>:
    1a60:	f3 0f 1e fa          	endbr64 
    1a64:	53                   	push   %rbx
    1a65:	e8 7a 04 00 00       	callq  1ee4 <read_line>
    1a6a:	48 89 c7             	mov    %rax,%rdi
    1a6d:	ba 0a 00 00 00       	mov    $0xa,%edx
    1a72:	be 00 00 00 00       	mov    $0x0,%esi
    1a77:	e8 54 f8 ff ff       	callq  12d0 <strtol@plt>
    1a7c:	48 89 c3             	mov    %rax,%rbx
    1a7f:	8d 40 ff             	lea    -0x1(%rax),%eax
    1a82:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    1a87:	77 26                	ja     1aaf <secret_phase+0x4f>
    1a89:	89 de                	mov    %ebx,%esi
    1a8b:	48 8d 3d be 36 00 00 	lea    0x36be(%rip),%rdi        # 5150 <n1>
    1a92:	e8 88 ff ff ff       	callq  1a1f <fun7>
    1a97:	83 f8 04             	cmp    $0x4,%eax
    1a9a:	75 1a                	jne    1ab6 <secret_phase+0x56>
    1a9c:	48 8d 3d d5 16 00 00 	lea    0x16d5(%rip),%rdi        # 3178 <_IO_stdin_used+0x178>
    1aa3:	e8 88 f7 ff ff       	callq  1230 <puts@plt>
    1aa8:	e8 7f 05 00 00       	callq  202c <phase_defused>
    1aad:	5b                   	pop    %rbx
    1aae:	c3                   	retq   
    1aaf:	e8 a9 03 00 00       	callq  1e5d <explode_bomb>
    1ab4:	eb d3                	jmp    1a89 <secret_phase+0x29>
    1ab6:	e8 a2 03 00 00       	callq  1e5d <explode_bomb>
    1abb:	eb df                	jmp    1a9c <secret_phase+0x3c>

0000000000001abd <sig_handler>:
    1abd:	f3 0f 1e fa          	endbr64 
    1ac1:	50                   	push   %rax
    1ac2:	58                   	pop    %rax
    1ac3:	48 83 ec 08          	sub    $0x8,%rsp
    1ac7:	48 8d 3d 52 17 00 00 	lea    0x1752(%rip),%rdi        # 3220 <array.3472+0x40>
    1ace:	e8 5d f7 ff ff       	callq  1230 <puts@plt>
    1ad3:	bf 03 00 00 00       	mov    $0x3,%edi
    1ad8:	e8 83 f8 ff ff       	callq  1360 <sleep@plt>
    1add:	48 8d 35 dd 18 00 00 	lea    0x18dd(%rip),%rsi        # 33c1 <array.3472+0x1e1>
    1ae4:	bf 01 00 00 00       	mov    $0x1,%edi
    1ae9:	b8 00 00 00 00       	mov    $0x0,%eax
    1aee:	e8 0d f8 ff ff       	callq  1300 <__printf_chk@plt>
    1af3:	48 8b 3d 86 3b 00 00 	mov    0x3b86(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    1afa:	e8 e1 f7 ff ff       	callq  12e0 <fflush@plt>
    1aff:	bf 01 00 00 00       	mov    $0x1,%edi
    1b04:	e8 57 f8 ff ff       	callq  1360 <sleep@plt>
    1b09:	48 8d 3d b9 18 00 00 	lea    0x18b9(%rip),%rdi        # 33c9 <array.3472+0x1e9>
    1b10:	e8 1b f7 ff ff       	callq  1230 <puts@plt>
    1b15:	bf 10 00 00 00       	mov    $0x10,%edi
    1b1a:	e8 11 f8 ff ff       	callq  1330 <exit@plt>

0000000000001b1f <invalid_phase>:
    1b1f:	f3 0f 1e fa          	endbr64 
    1b23:	50                   	push   %rax
    1b24:	58                   	pop    %rax
    1b25:	48 83 ec 08          	sub    $0x8,%rsp
    1b29:	48 89 fa             	mov    %rdi,%rdx
    1b2c:	48 8d 35 9e 18 00 00 	lea    0x189e(%rip),%rsi        # 33d1 <array.3472+0x1f1>
    1b33:	bf 01 00 00 00       	mov    $0x1,%edi
    1b38:	b8 00 00 00 00       	mov    $0x0,%eax
    1b3d:	e8 be f7 ff ff       	callq  1300 <__printf_chk@plt>
    1b42:	bf 08 00 00 00       	mov    $0x8,%edi
    1b47:	e8 e4 f7 ff ff       	callq  1330 <exit@plt>

0000000000001b4c <string_length>:
    1b4c:	f3 0f 1e fa          	endbr64 
    1b50:	80 3f 00             	cmpb   $0x0,(%rdi)
    1b53:	74 12                	je     1b67 <string_length+0x1b>
    1b55:	b8 00 00 00 00       	mov    $0x0,%eax
    1b5a:	48 83 c7 01          	add    $0x1,%rdi
    1b5e:	83 c0 01             	add    $0x1,%eax
    1b61:	80 3f 00             	cmpb   $0x0,(%rdi)
    1b64:	75 f4                	jne    1b5a <string_length+0xe>
    1b66:	c3                   	retq   
    1b67:	b8 00 00 00 00       	mov    $0x0,%eax
    1b6c:	c3                   	retq   

0000000000001b6d <strings_not_equal>:
    1b6d:	f3 0f 1e fa          	endbr64 
    1b71:	41 54                	push   %r12
    1b73:	55                   	push   %rbp
    1b74:	53                   	push   %rbx
    1b75:	48 89 fb             	mov    %rdi,%rbx
    1b78:	48 89 f5             	mov    %rsi,%rbp
    1b7b:	e8 cc ff ff ff       	callq  1b4c <string_length>
    1b80:	41 89 c4             	mov    %eax,%r12d
    1b83:	48 89 ef             	mov    %rbp,%rdi
    1b86:	e8 c1 ff ff ff       	callq  1b4c <string_length>
    1b8b:	89 c2                	mov    %eax,%edx
    1b8d:	b8 01 00 00 00       	mov    $0x1,%eax
    1b92:	41 39 d4             	cmp    %edx,%r12d
    1b95:	75 31                	jne    1bc8 <strings_not_equal+0x5b>
    1b97:	0f b6 13             	movzbl (%rbx),%edx
    1b9a:	84 d2                	test   %dl,%dl
    1b9c:	74 1e                	je     1bbc <strings_not_equal+0x4f>
    1b9e:	b8 00 00 00 00       	mov    $0x0,%eax
    1ba3:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    1ba7:	75 1a                	jne    1bc3 <strings_not_equal+0x56>
    1ba9:	48 83 c0 01          	add    $0x1,%rax
    1bad:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    1bb1:	84 d2                	test   %dl,%dl
    1bb3:	75 ee                	jne    1ba3 <strings_not_equal+0x36>
    1bb5:	b8 00 00 00 00       	mov    $0x0,%eax
    1bba:	eb 0c                	jmp    1bc8 <strings_not_equal+0x5b>
    1bbc:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc1:	eb 05                	jmp    1bc8 <strings_not_equal+0x5b>
    1bc3:	b8 01 00 00 00       	mov    $0x1,%eax
    1bc8:	5b                   	pop    %rbx
    1bc9:	5d                   	pop    %rbp
    1bca:	41 5c                	pop    %r12
    1bcc:	c3                   	retq   

0000000000001bcd <initialize_bomb>:
    1bcd:	f3 0f 1e fa          	endbr64 
    1bd1:	55                   	push   %rbp
    1bd2:	53                   	push   %rbx
    1bd3:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1bda:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1bdf:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1be6:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1beb:	48 83 ec 58          	sub    $0x58,%rsp
    1bef:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1bf6:	00 00 
    1bf8:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    1bff:	00 
    1c00:	31 c0                	xor    %eax,%eax
    1c02:	48 8d 35 b4 fe ff ff 	lea    -0x14c(%rip),%rsi        # 1abd <sig_handler>
    1c09:	bf 02 00 00 00       	mov    $0x2,%edi
    1c0e:	e8 8d f6 ff ff       	callq  12a0 <signal@plt>
    1c13:	48 89 e7             	mov    %rsp,%rdi
    1c16:	be 40 00 00 00       	mov    $0x40,%esi
    1c1b:	e8 00 f7 ff ff       	callq  1320 <gethostname@plt>
    1c20:	85 c0                	test   %eax,%eax
    1c22:	75 45                	jne    1c69 <initialize_bomb+0x9c>
    1c24:	48 8b 3d 55 36 00 00 	mov    0x3655(%rip),%rdi        # 5280 <host_table>
    1c2b:	48 8d 1d 56 36 00 00 	lea    0x3656(%rip),%rbx        # 5288 <host_table+0x8>
    1c32:	48 89 e5             	mov    %rsp,%rbp
    1c35:	48 85 ff             	test   %rdi,%rdi
    1c38:	74 19                	je     1c53 <initialize_bomb+0x86>
    1c3a:	48 89 ee             	mov    %rbp,%rsi
    1c3d:	e8 be f5 ff ff       	callq  1200 <strcasecmp@plt>
    1c42:	85 c0                	test   %eax,%eax
    1c44:	74 5e                	je     1ca4 <initialize_bomb+0xd7>
    1c46:	48 83 c3 08          	add    $0x8,%rbx
    1c4a:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
    1c4e:	48 85 ff             	test   %rdi,%rdi
    1c51:	75 e7                	jne    1c3a <initialize_bomb+0x6d>
    1c53:	48 8d 3d 36 16 00 00 	lea    0x1636(%rip),%rdi        # 3290 <array.3472+0xb0>
    1c5a:	e8 d1 f5 ff ff       	callq  1230 <puts@plt>
    1c5f:	bf 08 00 00 00       	mov    $0x8,%edi
    1c64:	e8 c7 f6 ff ff       	callq  1330 <exit@plt>
    1c69:	48 8d 3d e8 15 00 00 	lea    0x15e8(%rip),%rdi        # 3258 <array.3472+0x78>
    1c70:	e8 bb f5 ff ff       	callq  1230 <puts@plt>
    1c75:	bf 08 00 00 00       	mov    $0x8,%edi
    1c7a:	e8 b1 f6 ff ff       	callq  1330 <exit@plt>
    1c7f:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    1c84:	48 8d 35 57 17 00 00 	lea    0x1757(%rip),%rsi        # 33e2 <array.3472+0x202>
    1c8b:	bf 01 00 00 00       	mov    $0x1,%edi
    1c90:	b8 00 00 00 00       	mov    $0x0,%eax
    1c95:	e8 66 f6 ff ff       	callq  1300 <__printf_chk@plt>
    1c9a:	bf 08 00 00 00       	mov    $0x8,%edi
    1c9f:	e8 8c f6 ff ff       	callq  1330 <exit@plt>
    1ca4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    1ca9:	e8 a2 0d 00 00       	callq  2a50 <init_driver>
    1cae:	85 c0                	test   %eax,%eax
    1cb0:	78 cd                	js     1c7f <initialize_bomb+0xb2>
    1cb2:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
    1cb9:	00 
    1cba:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1cc1:	00 00 
    1cc3:	75 0a                	jne    1ccf <initialize_bomb+0x102>
    1cc5:	48 81 c4 58 20 00 00 	add    $0x2058,%rsp
    1ccc:	5b                   	pop    %rbx
    1ccd:	5d                   	pop    %rbp
    1cce:	c3                   	retq   
    1ccf:	e8 7c f5 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001cd4 <initialize_bomb_solve>:
    1cd4:	f3 0f 1e fa          	endbr64 
    1cd8:	c3                   	retq   

0000000000001cd9 <blank_line>:
    1cd9:	f3 0f 1e fa          	endbr64 
    1cdd:	55                   	push   %rbp
    1cde:	53                   	push   %rbx
    1cdf:	48 83 ec 08          	sub    $0x8,%rsp
    1ce3:	48 89 fd             	mov    %rdi,%rbp
    1ce6:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1cea:	84 db                	test   %bl,%bl
    1cec:	74 1e                	je     1d0c <blank_line+0x33>
    1cee:	e8 7d f6 ff ff       	callq  1370 <__ctype_b_loc@plt>
    1cf3:	48 83 c5 01          	add    $0x1,%rbp
    1cf7:	48 0f be db          	movsbq %bl,%rbx
    1cfb:	48 8b 00             	mov    (%rax),%rax
    1cfe:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1d03:	75 e1                	jne    1ce6 <blank_line+0xd>
    1d05:	b8 00 00 00 00       	mov    $0x0,%eax
    1d0a:	eb 05                	jmp    1d11 <blank_line+0x38>
    1d0c:	b8 01 00 00 00       	mov    $0x1,%eax
    1d11:	48 83 c4 08          	add    $0x8,%rsp
    1d15:	5b                   	pop    %rbx
    1d16:	5d                   	pop    %rbp
    1d17:	c3                   	retq   

0000000000001d18 <skip>:
    1d18:	f3 0f 1e fa          	endbr64 
    1d1c:	55                   	push   %rbp
    1d1d:	53                   	push   %rbx
    1d1e:	48 83 ec 08          	sub    $0x8,%rsp
    1d22:	48 8d 2d 97 39 00 00 	lea    0x3997(%rip),%rbp        # 56c0 <input_strings>
    1d29:	48 63 05 7c 39 00 00 	movslq 0x397c(%rip),%rax        # 56ac <num_input_strings>
    1d30:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    1d34:	48 c1 e7 04          	shl    $0x4,%rdi
    1d38:	48 01 ef             	add    %rbp,%rdi
    1d3b:	48 8b 15 6e 39 00 00 	mov    0x396e(%rip),%rdx        # 56b0 <infile>
    1d42:	be 50 00 00 00       	mov    $0x50,%esi
    1d47:	e8 44 f5 ff ff       	callq  1290 <fgets@plt>
    1d4c:	48 89 c3             	mov    %rax,%rbx
    1d4f:	48 85 c0             	test   %rax,%rax
    1d52:	74 0c                	je     1d60 <skip+0x48>
    1d54:	48 89 c7             	mov    %rax,%rdi
    1d57:	e8 7d ff ff ff       	callq  1cd9 <blank_line>
    1d5c:	85 c0                	test   %eax,%eax
    1d5e:	75 c9                	jne    1d29 <skip+0x11>
    1d60:	48 89 d8             	mov    %rbx,%rax
    1d63:	48 83 c4 08          	add    $0x8,%rsp
    1d67:	5b                   	pop    %rbx
    1d68:	5d                   	pop    %rbp
    1d69:	c3                   	retq   

0000000000001d6a <send_msg>:
    1d6a:	f3 0f 1e fa          	endbr64 
    1d6e:	53                   	push   %rbx
    1d6f:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    1d76:	ff 
    1d77:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1d7e:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1d83:	4c 39 dc             	cmp    %r11,%rsp
    1d86:	75 ef                	jne    1d77 <send_msg+0xd>
    1d88:	48 83 ec 10          	sub    $0x10,%rsp
    1d8c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1d93:	00 00 
    1d95:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    1d9c:	00 
    1d9d:	31 c0                	xor    %eax,%eax
    1d9f:	8b 15 07 39 00 00    	mov    0x3907(%rip),%edx        # 56ac <num_input_strings>
    1da5:	8d 42 ff             	lea    -0x1(%rdx),%eax
    1da8:	48 98                	cltq   
    1daa:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1dae:	48 c1 e0 04          	shl    $0x4,%rax
    1db2:	48 8d 0d 07 39 00 00 	lea    0x3907(%rip),%rcx        # 56c0 <input_strings>
    1db9:	48 01 c8             	add    %rcx,%rax
    1dbc:	85 ff                	test   %edi,%edi
    1dbe:	4c 8d 0d 37 16 00 00 	lea    0x1637(%rip),%r9        # 33fc <array.3472+0x21c>
    1dc5:	48 8d 0d 38 16 00 00 	lea    0x1638(%rip),%rcx        # 3404 <array.3472+0x224>
    1dcc:	4c 0f 44 c9          	cmove  %rcx,%r9
    1dd0:	48 89 e3             	mov    %rsp,%rbx
    1dd3:	50                   	push   %rax
    1dd4:	52                   	push   %rdx
    1dd5:	44 8b 05 68 33 00 00 	mov    0x3368(%rip),%r8d        # 5144 <bomb_id>
    1ddc:	48 8d 0d 2a 16 00 00 	lea    0x162a(%rip),%rcx        # 340d <array.3472+0x22d>
    1de3:	ba 00 20 00 00       	mov    $0x2000,%edx
    1de8:	be 01 00 00 00       	mov    $0x1,%esi
    1ded:	48 89 df             	mov    %rbx,%rdi
    1df0:	b8 00 00 00 00       	mov    $0x0,%eax
    1df5:	e8 86 f5 ff ff       	callq  1380 <__sprintf_chk@plt>
    1dfa:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
    1e01:	00 
    1e02:	b9 00 00 00 00       	mov    $0x0,%ecx
    1e07:	48 89 da             	mov    %rbx,%rdx
    1e0a:	48 8d 35 0f 33 00 00 	lea    0x330f(%rip),%rsi        # 5120 <user_password>
    1e11:	48 8d 3d 20 33 00 00 	lea    0x3320(%rip),%rdi        # 5138 <userid>
    1e18:	e8 28 0e 00 00       	callq  2c45 <driver_post>
    1e1d:	48 83 c4 10          	add    $0x10,%rsp
    1e21:	85 c0                	test   %eax,%eax
    1e23:	78 1c                	js     1e41 <send_msg+0xd7>
    1e25:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    1e2c:	00 
    1e2d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1e34:	00 00 
    1e36:	75 20                	jne    1e58 <send_msg+0xee>
    1e38:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
    1e3f:	5b                   	pop    %rbx
    1e40:	c3                   	retq   
    1e41:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    1e48:	00 
    1e49:	e8 e2 f3 ff ff       	callq  1230 <puts@plt>
    1e4e:	bf 00 00 00 00       	mov    $0x0,%edi
    1e53:	e8 d8 f4 ff ff       	callq  1330 <exit@plt>
    1e58:	e8 f3 f3 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001e5d <explode_bomb>:
    1e5d:	f3 0f 1e fa          	endbr64 
    1e61:	50                   	push   %rax
    1e62:	58                   	pop    %rax
    1e63:	48 83 ec 08          	sub    $0x8,%rsp
    1e67:	48 8d 3d ab 15 00 00 	lea    0x15ab(%rip),%rdi        # 3419 <array.3472+0x239>
    1e6e:	e8 bd f3 ff ff       	callq  1230 <puts@plt>
    1e73:	48 8d 3d a8 15 00 00 	lea    0x15a8(%rip),%rdi        # 3422 <array.3472+0x242>
    1e7a:	e8 b1 f3 ff ff       	callq  1230 <puts@plt>
    1e7f:	bf 00 00 00 00       	mov    $0x0,%edi
    1e84:	e8 e1 fe ff ff       	callq  1d6a <send_msg>
    1e89:	48 8d 3d 38 14 00 00 	lea    0x1438(%rip),%rdi        # 32c8 <array.3472+0xe8>
    1e90:	e8 9b f3 ff ff       	callq  1230 <puts@plt>
    1e95:	bf 08 00 00 00       	mov    $0x8,%edi
    1e9a:	e8 91 f4 ff ff       	callq  1330 <exit@plt>

0000000000001e9f <read_six_numbers>:
    1e9f:	f3 0f 1e fa          	endbr64 
    1ea3:	48 83 ec 08          	sub    $0x8,%rsp
    1ea7:	48 89 f2             	mov    %rsi,%rdx
    1eaa:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1eae:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1eb2:	50                   	push   %rax
    1eb3:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1eb7:	50                   	push   %rax
    1eb8:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1ebc:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1ec0:	48 8d 35 72 15 00 00 	lea    0x1572(%rip),%rsi        # 3439 <array.3472+0x259>
    1ec7:	b8 00 00 00 00       	mov    $0x0,%eax
    1ecc:	e8 1f f4 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1ed1:	48 83 c4 10          	add    $0x10,%rsp
    1ed5:	83 f8 05             	cmp    $0x5,%eax
    1ed8:	7e 05                	jle    1edf <read_six_numbers+0x40>
    1eda:	48 83 c4 08          	add    $0x8,%rsp
    1ede:	c3                   	retq   
    1edf:	e8 79 ff ff ff       	callq  1e5d <explode_bomb>

0000000000001ee4 <read_line>:
    1ee4:	f3 0f 1e fa          	endbr64 
    1ee8:	48 83 ec 08          	sub    $0x8,%rsp
    1eec:	b8 00 00 00 00       	mov    $0x0,%eax
    1ef1:	e8 22 fe ff ff       	callq  1d18 <skip>
    1ef6:	48 85 c0             	test   %rax,%rax
    1ef9:	74 6f                	je     1f6a <read_line+0x86>
    1efb:	8b 35 ab 37 00 00    	mov    0x37ab(%rip),%esi        # 56ac <num_input_strings>
    1f01:	48 63 c6             	movslq %esi,%rax
    1f04:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    1f08:	48 c1 e2 04          	shl    $0x4,%rdx
    1f0c:	48 8d 05 ad 37 00 00 	lea    0x37ad(%rip),%rax        # 56c0 <input_strings>
    1f13:	48 01 c2             	add    %rax,%rdx
    1f16:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    1f1d:	b8 00 00 00 00       	mov    $0x0,%eax
    1f22:	48 89 d7             	mov    %rdx,%rdi
    1f25:	f2 ae                	repnz scas %es:(%rdi),%al
    1f27:	48 f7 d1             	not    %rcx
    1f2a:	48 83 e9 01          	sub    $0x1,%rcx
    1f2e:	83 f9 4e             	cmp    $0x4e,%ecx
    1f31:	0f 8f ab 00 00 00    	jg     1fe2 <read_line+0xfe>
    1f37:	83 e9 01             	sub    $0x1,%ecx
    1f3a:	48 63 c9             	movslq %ecx,%rcx
    1f3d:	48 63 c6             	movslq %esi,%rax
    1f40:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1f44:	48 c1 e0 04          	shl    $0x4,%rax
    1f48:	48 89 c7             	mov    %rax,%rdi
    1f4b:	48 8d 05 6e 37 00 00 	lea    0x376e(%rip),%rax        # 56c0 <input_strings>
    1f52:	48 01 f8             	add    %rdi,%rax
    1f55:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    1f59:	83 c6 01             	add    $0x1,%esi
    1f5c:	89 35 4a 37 00 00    	mov    %esi,0x374a(%rip)        # 56ac <num_input_strings>
    1f62:	48 89 d0             	mov    %rdx,%rax
    1f65:	48 83 c4 08          	add    $0x8,%rsp
    1f69:	c3                   	retq   
    1f6a:	48 8b 05 1f 37 00 00 	mov    0x371f(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    1f71:	48 39 05 38 37 00 00 	cmp    %rax,0x3738(%rip)        # 56b0 <infile>
    1f78:	74 1b                	je     1f95 <read_line+0xb1>
    1f7a:	48 8d 3d e8 14 00 00 	lea    0x14e8(%rip),%rdi        # 3469 <array.3472+0x289>
    1f81:	e8 6a f2 ff ff       	callq  11f0 <getenv@plt>
    1f86:	48 85 c0             	test   %rax,%rax
    1f89:	74 20                	je     1fab <read_line+0xc7>
    1f8b:	bf 00 00 00 00       	mov    $0x0,%edi
    1f90:	e8 9b f3 ff ff       	callq  1330 <exit@plt>
    1f95:	48 8d 3d af 14 00 00 	lea    0x14af(%rip),%rdi        # 344b <array.3472+0x26b>
    1f9c:	e8 8f f2 ff ff       	callq  1230 <puts@plt>
    1fa1:	bf 08 00 00 00       	mov    $0x8,%edi
    1fa6:	e8 85 f3 ff ff       	callq  1330 <exit@plt>
    1fab:	48 8b 05 de 36 00 00 	mov    0x36de(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    1fb2:	48 89 05 f7 36 00 00 	mov    %rax,0x36f7(%rip)        # 56b0 <infile>
    1fb9:	b8 00 00 00 00       	mov    $0x0,%eax
    1fbe:	e8 55 fd ff ff       	callq  1d18 <skip>
    1fc3:	48 85 c0             	test   %rax,%rax
    1fc6:	0f 85 2f ff ff ff    	jne    1efb <read_line+0x17>
    1fcc:	48 8d 3d 78 14 00 00 	lea    0x1478(%rip),%rdi        # 344b <array.3472+0x26b>
    1fd3:	e8 58 f2 ff ff       	callq  1230 <puts@plt>
    1fd8:	bf 00 00 00 00       	mov    $0x0,%edi
    1fdd:	e8 4e f3 ff ff       	callq  1330 <exit@plt>
    1fe2:	48 8d 3d 8b 14 00 00 	lea    0x148b(%rip),%rdi        # 3474 <array.3472+0x294>
    1fe9:	e8 42 f2 ff ff       	callq  1230 <puts@plt>
    1fee:	8b 05 b8 36 00 00    	mov    0x36b8(%rip),%eax        # 56ac <num_input_strings>
    1ff4:	8d 50 01             	lea    0x1(%rax),%edx
    1ff7:	89 15 af 36 00 00    	mov    %edx,0x36af(%rip)        # 56ac <num_input_strings>
    1ffd:	48 98                	cltq   
    1fff:	48 6b c0 50          	imul   $0x50,%rax,%rax
    2003:	48 8d 15 b6 36 00 00 	lea    0x36b6(%rip),%rdx        # 56c0 <input_strings>
    200a:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    2011:	75 6e 63 
    2014:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    201b:	2a 2a 00 
    201e:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    2022:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    2027:	e8 31 fe ff ff       	callq  1e5d <explode_bomb>

000000000000202c <phase_defused>:
    202c:	f3 0f 1e fa          	endbr64 
    2030:	48 83 ec 78          	sub    $0x78,%rsp
    2034:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    203b:	00 00 
    203d:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    2042:	31 c0                	xor    %eax,%eax
    2044:	bf 01 00 00 00       	mov    $0x1,%edi
    2049:	e8 1c fd ff ff       	callq  1d6a <send_msg>
    204e:	83 3d 57 36 00 00 06 	cmpl   $0x6,0x3657(%rip)        # 56ac <num_input_strings>
    2055:	74 19                	je     2070 <phase_defused+0x44>
    2057:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    205c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    2063:	00 00 
    2065:	0f 85 84 00 00 00    	jne    20ef <phase_defused+0xc3>
    206b:	48 83 c4 78          	add    $0x78,%rsp
    206f:	c3                   	retq   
    2070:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    2075:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    207a:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    207f:	48 8d 35 09 14 00 00 	lea    0x1409(%rip),%rsi        # 348f <array.3472+0x2af>
    2086:	48 8d 3d 23 37 00 00 	lea    0x3723(%rip),%rdi        # 57b0 <input_strings+0xf0>
    208d:	b8 00 00 00 00       	mov    $0x0,%eax
    2092:	e8 59 f2 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    2097:	83 f8 03             	cmp    $0x3,%eax
    209a:	74 1a                	je     20b6 <phase_defused+0x8a>
    209c:	48 8d 3d ad 12 00 00 	lea    0x12ad(%rip),%rdi        # 3350 <array.3472+0x170>
    20a3:	e8 88 f1 ff ff       	callq  1230 <puts@plt>
    20a8:	48 8d 3d d1 12 00 00 	lea    0x12d1(%rip),%rdi        # 3380 <array.3472+0x1a0>
    20af:	e8 7c f1 ff ff       	callq  1230 <puts@plt>
    20b4:	eb a1                	jmp    2057 <phase_defused+0x2b>
    20b6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    20bb:	48 8d 35 d6 13 00 00 	lea    0x13d6(%rip),%rsi        # 3498 <array.3472+0x2b8>
    20c2:	e8 a6 fa ff ff       	callq  1b6d <strings_not_equal>
    20c7:	85 c0                	test   %eax,%eax
    20c9:	75 d1                	jne    209c <phase_defused+0x70>
    20cb:	48 8d 3d 1e 12 00 00 	lea    0x121e(%rip),%rdi        # 32f0 <array.3472+0x110>
    20d2:	e8 59 f1 ff ff       	callq  1230 <puts@plt>
    20d7:	48 8d 3d 3a 12 00 00 	lea    0x123a(%rip),%rdi        # 3318 <array.3472+0x138>
    20de:	e8 4d f1 ff ff       	callq  1230 <puts@plt>
    20e3:	b8 00 00 00 00       	mov    $0x0,%eax
    20e8:	e8 73 f9 ff ff       	callq  1a60 <secret_phase>
    20ed:	eb ad                	jmp    209c <phase_defused+0x70>
    20ef:	e8 5c f1 ff ff       	callq  1250 <__stack_chk_fail@plt>

00000000000020f4 <sigalrm_handler>:
    20f4:	f3 0f 1e fa          	endbr64 
    20f8:	50                   	push   %rax
    20f9:	58                   	pop    %rax
    20fa:	48 83 ec 08          	sub    $0x8,%rsp
    20fe:	b9 00 00 00 00       	mov    $0x0,%ecx
    2103:	48 8d 15 be 13 00 00 	lea    0x13be(%rip),%rdx        # 34c8 <array.3472+0x2e8>
    210a:	be 01 00 00 00       	mov    $0x1,%esi
    210f:	48 8b 3d 8a 35 00 00 	mov    0x358a(%rip),%rdi        # 56a0 <stderr@@GLIBC_2.2.5>
    2116:	b8 00 00 00 00       	mov    $0x0,%eax
    211b:	e8 30 f2 ff ff       	callq  1350 <__fprintf_chk@plt>
    2120:	bf 01 00 00 00       	mov    $0x1,%edi
    2125:	e8 06 f2 ff ff       	callq  1330 <exit@plt>

000000000000212a <rio_readlineb>:
    212a:	41 56                	push   %r14
    212c:	41 55                	push   %r13
    212e:	41 54                	push   %r12
    2130:	55                   	push   %rbp
    2131:	53                   	push   %rbx
    2132:	48 89 f5             	mov    %rsi,%rbp
    2135:	48 83 fa 01          	cmp    $0x1,%rdx
    2139:	0f 86 90 00 00 00    	jbe    21cf <rio_readlineb+0xa5>
    213f:	48 89 fb             	mov    %rdi,%rbx
    2142:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    2147:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    214d:	4c 8d 67 10          	lea    0x10(%rdi),%r12
    2151:	eb 54                	jmp    21a7 <rio_readlineb+0x7d>
    2153:	e8 b8 f0 ff ff       	callq  1210 <__errno_location@plt>
    2158:	83 38 04             	cmpl   $0x4,(%rax)
    215b:	75 53                	jne    21b0 <rio_readlineb+0x86>
    215d:	ba 00 20 00 00       	mov    $0x2000,%edx
    2162:	4c 89 e6             	mov    %r12,%rsi
    2165:	8b 3b                	mov    (%rbx),%edi
    2167:	e8 14 f1 ff ff       	callq  1280 <read@plt>
    216c:	89 c2                	mov    %eax,%edx
    216e:	89 43 04             	mov    %eax,0x4(%rbx)
    2171:	85 c0                	test   %eax,%eax
    2173:	78 de                	js     2153 <rio_readlineb+0x29>
    2175:	85 c0                	test   %eax,%eax
    2177:	74 40                	je     21b9 <rio_readlineb+0x8f>
    2179:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    217d:	48 8b 43 08          	mov    0x8(%rbx),%rax
    2181:	0f b6 08             	movzbl (%rax),%ecx
    2184:	48 83 c0 01          	add    $0x1,%rax
    2188:	48 89 43 08          	mov    %rax,0x8(%rbx)
    218c:	83 ea 01             	sub    $0x1,%edx
    218f:	89 53 04             	mov    %edx,0x4(%rbx)
    2192:	48 83 c5 01          	add    $0x1,%rbp
    2196:	88 4d ff             	mov    %cl,-0x1(%rbp)
    2199:	80 f9 0a             	cmp    $0xa,%cl
    219c:	74 3c                	je     21da <rio_readlineb+0xb0>
    219e:	41 83 c5 01          	add    $0x1,%r13d
    21a2:	4c 39 f5             	cmp    %r14,%rbp
    21a5:	74 30                	je     21d7 <rio_readlineb+0xad>
    21a7:	8b 53 04             	mov    0x4(%rbx),%edx
    21aa:	85 d2                	test   %edx,%edx
    21ac:	7e af                	jle    215d <rio_readlineb+0x33>
    21ae:	eb cd                	jmp    217d <rio_readlineb+0x53>
    21b0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    21b7:	eb 05                	jmp    21be <rio_readlineb+0x94>
    21b9:	b8 00 00 00 00       	mov    $0x0,%eax
    21be:	85 c0                	test   %eax,%eax
    21c0:	75 28                	jne    21ea <rio_readlineb+0xc0>
    21c2:	b8 00 00 00 00       	mov    $0x0,%eax
    21c7:	41 83 fd 01          	cmp    $0x1,%r13d
    21cb:	75 0d                	jne    21da <rio_readlineb+0xb0>
    21cd:	eb 12                	jmp    21e1 <rio_readlineb+0xb7>
    21cf:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    21d5:	eb 03                	jmp    21da <rio_readlineb+0xb0>
    21d7:	4c 89 f5             	mov    %r14,%rbp
    21da:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    21de:	49 63 c5             	movslq %r13d,%rax
    21e1:	5b                   	pop    %rbx
    21e2:	5d                   	pop    %rbp
    21e3:	41 5c                	pop    %r12
    21e5:	41 5d                	pop    %r13
    21e7:	41 5e                	pop    %r14
    21e9:	c3                   	retq   
    21ea:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    21f1:	eb ee                	jmp    21e1 <rio_readlineb+0xb7>

00000000000021f3 <submitr>:
    21f3:	f3 0f 1e fa          	endbr64 
    21f7:	41 57                	push   %r15
    21f9:	41 56                	push   %r14
    21fb:	41 55                	push   %r13
    21fd:	41 54                	push   %r12
    21ff:	55                   	push   %rbp
    2200:	53                   	push   %rbx
    2201:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    2208:	ff 
    2209:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2210:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2215:	4c 39 dc             	cmp    %r11,%rsp
    2218:	75 ef                	jne    2209 <submitr+0x16>
    221a:	48 83 ec 68          	sub    $0x68,%rsp
    221e:	49 89 fd             	mov    %rdi,%r13
    2221:	89 f5                	mov    %esi,%ebp
    2223:	48 89 14 24          	mov    %rdx,(%rsp)
    2227:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    222c:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    2231:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    2236:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    223d:	00 
    223e:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    2245:	00 
    2246:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    224d:	00 00 
    224f:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    2256:	00 
    2257:	31 c0                	xor    %eax,%eax
    2259:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    2260:	00 
    2261:	ba 00 00 00 00       	mov    $0x0,%edx
    2266:	be 01 00 00 00       	mov    $0x1,%esi
    226b:	bf 02 00 00 00       	mov    $0x2,%edi
    2270:	e8 1b f1 ff ff       	callq  1390 <socket@plt>
    2275:	85 c0                	test   %eax,%eax
    2277:	0f 88 17 01 00 00    	js     2394 <submitr+0x1a1>
    227d:	41 89 c4             	mov    %eax,%r12d
    2280:	4c 89 ef             	mov    %r13,%rdi
    2283:	e8 28 f0 ff ff       	callq  12b0 <gethostbyname@plt>
    2288:	48 85 c0             	test   %rax,%rax
    228b:	0f 84 53 01 00 00    	je     23e4 <submitr+0x1f1>
    2291:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
    2296:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    229d:	00 00 
    229f:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    22a6:	00 00 
    22a8:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    22af:	48 63 50 14          	movslq 0x14(%rax),%rdx
    22b3:	48 8b 40 18          	mov    0x18(%rax),%rax
    22b7:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    22bc:	b9 0c 00 00 00       	mov    $0xc,%ecx
    22c1:	48 8b 30             	mov    (%rax),%rsi
    22c4:	e8 f7 ef ff ff       	callq  12c0 <__memmove_chk@plt>
    22c9:	66 c1 c5 08          	rol    $0x8,%bp
    22cd:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
    22d2:	ba 10 00 00 00       	mov    $0x10,%edx
    22d7:	4c 89 ee             	mov    %r13,%rsi
    22da:	44 89 e7             	mov    %r12d,%edi
    22dd:	e8 5e f0 ff ff       	callq  1340 <connect@plt>
    22e2:	85 c0                	test   %eax,%eax
    22e4:	0f 88 65 01 00 00    	js     244f <submitr+0x25c>
    22ea:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    22f1:	b8 00 00 00 00       	mov    $0x0,%eax
    22f6:	4c 89 c9             	mov    %r9,%rcx
    22f9:	48 89 df             	mov    %rbx,%rdi
    22fc:	f2 ae                	repnz scas %es:(%rdi),%al
    22fe:	48 f7 d1             	not    %rcx
    2301:	48 89 ce             	mov    %rcx,%rsi
    2304:	4c 89 c9             	mov    %r9,%rcx
    2307:	48 8b 3c 24          	mov    (%rsp),%rdi
    230b:	f2 ae                	repnz scas %es:(%rdi),%al
    230d:	49 89 c8             	mov    %rcx,%r8
    2310:	4c 89 c9             	mov    %r9,%rcx
    2313:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    2318:	f2 ae                	repnz scas %es:(%rdi),%al
    231a:	48 89 ca             	mov    %rcx,%rdx
    231d:	48 f7 d2             	not    %rdx
    2320:	4c 89 c9             	mov    %r9,%rcx
    2323:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2328:	f2 ae                	repnz scas %es:(%rdi),%al
    232a:	4c 29 c2             	sub    %r8,%rdx
    232d:	48 29 ca             	sub    %rcx,%rdx
    2330:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
    2335:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
    233a:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    2340:	0f 87 66 01 00 00    	ja     24ac <submitr+0x2b9>
    2346:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
    234d:	00 
    234e:	b9 00 04 00 00       	mov    $0x400,%ecx
    2353:	b8 00 00 00 00       	mov    $0x0,%eax
    2358:	48 89 d7             	mov    %rdx,%rdi
    235b:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    235e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2365:	48 89 df             	mov    %rbx,%rdi
    2368:	f2 ae                	repnz scas %es:(%rdi),%al
    236a:	48 f7 d1             	not    %rcx
    236d:	48 8d 41 ff          	lea    -0x1(%rcx),%rax
    2371:	83 f9 01             	cmp    $0x1,%ecx
    2374:	0f 84 08 05 00 00    	je     2882 <submitr+0x68f>
    237a:	8d 40 ff             	lea    -0x1(%rax),%eax
    237d:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
    2382:	48 89 d5             	mov    %rdx,%rbp
    2385:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
    238c:	00 20 00 
    238f:	e9 a6 01 00 00       	jmpq   253a <submitr+0x347>
    2394:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    239b:	3a 20 43 
    239e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    23a5:	20 75 6e 
    23a8:	49 89 07             	mov    %rax,(%r15)
    23ab:	49 89 57 08          	mov    %rdx,0x8(%r15)
    23af:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    23b6:	74 6f 20 
    23b9:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    23c0:	65 20 73 
    23c3:	49 89 47 10          	mov    %rax,0x10(%r15)
    23c7:	49 89 57 18          	mov    %rdx,0x18(%r15)
    23cb:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    23d2:	65 
    23d3:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    23da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    23df:	e9 16 03 00 00       	jmpq   26fa <submitr+0x507>
    23e4:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    23eb:	3a 20 44 
    23ee:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    23f5:	20 75 6e 
    23f8:	49 89 07             	mov    %rax,(%r15)
    23fb:	49 89 57 08          	mov    %rdx,0x8(%r15)
    23ff:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2406:	74 6f 20 
    2409:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2410:	76 65 20 
    2413:	49 89 47 10          	mov    %rax,0x10(%r15)
    2417:	49 89 57 18          	mov    %rdx,0x18(%r15)
    241b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2422:	72 20 61 
    2425:	49 89 47 20          	mov    %rax,0x20(%r15)
    2429:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    2430:	65 
    2431:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    2438:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    243d:	44 89 e7             	mov    %r12d,%edi
    2440:	e8 2b ee ff ff       	callq  1270 <close@plt>
    2445:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    244a:	e9 ab 02 00 00       	jmpq   26fa <submitr+0x507>
    244f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    2456:	3a 20 55 
    2459:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    2460:	20 74 6f 
    2463:	49 89 07             	mov    %rax,(%r15)
    2466:	49 89 57 08          	mov    %rdx,0x8(%r15)
    246a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    2471:	65 63 74 
    2474:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    247b:	68 65 20 
    247e:	49 89 47 10          	mov    %rax,0x10(%r15)
    2482:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2486:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    248d:	76 
    248e:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    2495:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    249a:	44 89 e7             	mov    %r12d,%edi
    249d:	e8 ce ed ff ff       	callq  1270 <close@plt>
    24a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24a7:	e9 4e 02 00 00       	jmpq   26fa <submitr+0x507>
    24ac:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    24b3:	3a 20 52 
    24b6:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    24bd:	20 73 74 
    24c0:	49 89 07             	mov    %rax,(%r15)
    24c3:	49 89 57 08          	mov    %rdx,0x8(%r15)
    24c7:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    24ce:	74 6f 6f 
    24d1:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    24d8:	65 2e 20 
    24db:	49 89 47 10          	mov    %rax,0x10(%r15)
    24df:	49 89 57 18          	mov    %rdx,0x18(%r15)
    24e3:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    24ea:	61 73 65 
    24ed:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    24f4:	49 54 52 
    24f7:	49 89 47 20          	mov    %rax,0x20(%r15)
    24fb:	49 89 57 28          	mov    %rdx,0x28(%r15)
    24ff:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2506:	55 46 00 
    2509:	49 89 47 30          	mov    %rax,0x30(%r15)
    250d:	44 89 e7             	mov    %r12d,%edi
    2510:	e8 5b ed ff ff       	callq  1270 <close@plt>
    2515:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    251a:	e9 db 01 00 00       	jmpq   26fa <submitr+0x507>
    251f:	49 0f a3 c5          	bt     %rax,%r13
    2523:	73 21                	jae    2546 <submitr+0x353>
    2525:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    2529:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    252d:	48 83 c3 01          	add    $0x1,%rbx
    2531:	4c 39 f3             	cmp    %r14,%rbx
    2534:	0f 84 48 03 00 00    	je     2882 <submitr+0x68f>
    253a:	44 0f b6 03          	movzbl (%rbx),%r8d
    253e:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
    2542:	3c 35                	cmp    $0x35,%al
    2544:	76 d9                	jbe    251f <submitr+0x32c>
    2546:	44 89 c0             	mov    %r8d,%eax
    2549:	83 e0 df             	and    $0xffffffdf,%eax
    254c:	83 e8 41             	sub    $0x41,%eax
    254f:	3c 19                	cmp    $0x19,%al
    2551:	76 d2                	jbe    2525 <submitr+0x332>
    2553:	41 80 f8 20          	cmp    $0x20,%r8b
    2557:	74 63                	je     25bc <submitr+0x3c9>
    2559:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    255d:	3c 5f                	cmp    $0x5f,%al
    255f:	76 0a                	jbe    256b <submitr+0x378>
    2561:	41 80 f8 09          	cmp    $0x9,%r8b
    2565:	0f 85 8a 02 00 00    	jne    27f5 <submitr+0x602>
    256b:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    2572:	00 
    2573:	45 0f b6 c0          	movzbl %r8b,%r8d
    2577:	48 8d 0d 20 10 00 00 	lea    0x1020(%rip),%rcx        # 359e <array.3472+0x3be>
    257e:	ba 08 00 00 00       	mov    $0x8,%edx
    2583:	be 01 00 00 00       	mov    $0x1,%esi
    2588:	b8 00 00 00 00       	mov    $0x0,%eax
    258d:	e8 ee ed ff ff       	callq  1380 <__sprintf_chk@plt>
    2592:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
    2599:	00 
    259a:	88 45 00             	mov    %al,0x0(%rbp)
    259d:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
    25a4:	00 
    25a5:	88 45 01             	mov    %al,0x1(%rbp)
    25a8:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
    25af:	00 
    25b0:	88 45 02             	mov    %al,0x2(%rbp)
    25b3:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    25b7:	e9 71 ff ff ff       	jmpq   252d <submitr+0x33a>
    25bc:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    25c0:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    25c4:	e9 64 ff ff ff       	jmpq   252d <submitr+0x33a>
    25c9:	48 01 c5             	add    %rax,%rbp
    25cc:	48 29 c3             	sub    %rax,%rbx
    25cf:	0f 84 25 03 00 00    	je     28fa <submitr+0x707>
    25d5:	48 89 da             	mov    %rbx,%rdx
    25d8:	48 89 ee             	mov    %rbp,%rsi
    25db:	44 89 e7             	mov    %r12d,%edi
    25de:	e8 5d ec ff ff       	callq  1240 <write@plt>
    25e3:	48 85 c0             	test   %rax,%rax
    25e6:	7f e1                	jg     25c9 <submitr+0x3d6>
    25e8:	e8 23 ec ff ff       	callq  1210 <__errno_location@plt>
    25ed:	83 38 04             	cmpl   $0x4,(%rax)
    25f0:	0f 85 a0 01 00 00    	jne    2796 <submitr+0x5a3>
    25f6:	4c 89 e8             	mov    %r13,%rax
    25f9:	eb ce                	jmp    25c9 <submitr+0x3d6>
    25fb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2602:	3a 20 43 
    2605:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    260c:	20 75 6e 
    260f:	49 89 07             	mov    %rax,(%r15)
    2612:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2616:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    261d:	74 6f 20 
    2620:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    2627:	66 69 72 
    262a:	49 89 47 10          	mov    %rax,0x10(%r15)
    262e:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2632:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    2639:	61 64 65 
    263c:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    2643:	6d 20 73 
    2646:	49 89 47 20          	mov    %rax,0x20(%r15)
    264a:	49 89 57 28          	mov    %rdx,0x28(%r15)
    264e:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    2655:	65 
    2656:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    265d:	44 89 e7             	mov    %r12d,%edi
    2660:	e8 0b ec ff ff       	callq  1270 <close@plt>
    2665:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    266a:	e9 8b 00 00 00       	jmpq   26fa <submitr+0x507>
    266f:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    2676:	00 
    2677:	48 8d 0d 72 0e 00 00 	lea    0xe72(%rip),%rcx        # 34f0 <array.3472+0x310>
    267e:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2685:	be 01 00 00 00       	mov    $0x1,%esi
    268a:	4c 89 ff             	mov    %r15,%rdi
    268d:	b8 00 00 00 00       	mov    $0x0,%eax
    2692:	e8 e9 ec ff ff       	callq  1380 <__sprintf_chk@plt>
    2697:	44 89 e7             	mov    %r12d,%edi
    269a:	e8 d1 eb ff ff       	callq  1270 <close@plt>
    269f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26a4:	eb 54                	jmp    26fa <submitr+0x507>
    26a6:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    26ad:	00 
    26ae:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    26b3:	ba 00 20 00 00       	mov    $0x2000,%edx
    26b8:	e8 6d fa ff ff       	callq  212a <rio_readlineb>
    26bd:	48 85 c0             	test   %rax,%rax
    26c0:	7e 61                	jle    2723 <submitr+0x530>
    26c2:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    26c9:	00 
    26ca:	4c 89 ff             	mov    %r15,%rdi
    26cd:	e8 4e eb ff ff       	callq  1220 <strcpy@plt>
    26d2:	44 89 e7             	mov    %r12d,%edi
    26d5:	e8 96 eb ff ff       	callq  1270 <close@plt>
    26da:	b9 03 00 00 00       	mov    $0x3,%ecx
    26df:	48 8d 3d d3 0e 00 00 	lea    0xed3(%rip),%rdi        # 35b9 <array.3472+0x3d9>
    26e6:	4c 89 fe             	mov    %r15,%rsi
    26e9:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    26eb:	0f 97 c0             	seta   %al
    26ee:	1c 00                	sbb    $0x0,%al
    26f0:	84 c0                	test   %al,%al
    26f2:	0f 95 c0             	setne  %al
    26f5:	0f b6 c0             	movzbl %al,%eax
    26f8:	f7 d8                	neg    %eax
    26fa:	48 8b 94 24 58 a0 00 	mov    0xa058(%rsp),%rdx
    2701:	00 
    2702:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    2709:	00 00 
    270b:	0f 85 0c 03 00 00    	jne    2a1d <submitr+0x82a>
    2711:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    2718:	5b                   	pop    %rbx
    2719:	5d                   	pop    %rbp
    271a:	41 5c                	pop    %r12
    271c:	41 5d                	pop    %r13
    271e:	41 5e                	pop    %r14
    2720:	41 5f                	pop    %r15
    2722:	c3                   	retq   
    2723:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    272a:	3a 20 43 
    272d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2734:	20 75 6e 
    2737:	49 89 07             	mov    %rax,(%r15)
    273a:	49 89 57 08          	mov    %rdx,0x8(%r15)
    273e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2745:	74 6f 20 
    2748:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    274f:	73 74 61 
    2752:	49 89 47 10          	mov    %rax,0x10(%r15)
    2756:	49 89 57 18          	mov    %rdx,0x18(%r15)
    275a:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    2761:	65 73 73 
    2764:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    276b:	72 6f 6d 
    276e:	49 89 47 20          	mov    %rax,0x20(%r15)
    2772:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2776:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    277d:	65 72 00 
    2780:	49 89 47 30          	mov    %rax,0x30(%r15)
    2784:	44 89 e7             	mov    %r12d,%edi
    2787:	e8 e4 ea ff ff       	callq  1270 <close@plt>
    278c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2791:	e9 64 ff ff ff       	jmpq   26fa <submitr+0x507>
    2796:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    279d:	3a 20 43 
    27a0:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    27a7:	20 75 6e 
    27aa:	49 89 07             	mov    %rax,(%r15)
    27ad:	49 89 57 08          	mov    %rdx,0x8(%r15)
    27b1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    27b8:	74 6f 20 
    27bb:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    27c2:	20 74 6f 
    27c5:	49 89 47 10          	mov    %rax,0x10(%r15)
    27c9:	49 89 57 18          	mov    %rdx,0x18(%r15)
    27cd:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    27d4:	73 65 72 
    27d7:	49 89 47 20          	mov    %rax,0x20(%r15)
    27db:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    27e2:	00 
    27e3:	44 89 e7             	mov    %r12d,%edi
    27e6:	e8 85 ea ff ff       	callq  1270 <close@plt>
    27eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    27f0:	e9 05 ff ff ff       	jmpq   26fa <submitr+0x507>
    27f5:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    27fc:	3a 20 52 
    27ff:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2806:	20 73 74 
    2809:	49 89 07             	mov    %rax,(%r15)
    280c:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2810:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    2817:	63 6f 6e 
    281a:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2821:	20 61 6e 
    2824:	49 89 47 10          	mov    %rax,0x10(%r15)
    2828:	49 89 57 18          	mov    %rdx,0x18(%r15)
    282c:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2833:	67 61 6c 
    2836:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    283d:	6e 70 72 
    2840:	49 89 47 20          	mov    %rax,0x20(%r15)
    2844:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2848:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    284f:	6c 65 20 
    2852:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    2859:	63 74 65 
    285c:	49 89 47 30          	mov    %rax,0x30(%r15)
    2860:	49 89 57 38          	mov    %rdx,0x38(%r15)
    2864:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    286b:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    2870:	44 89 e7             	mov    %r12d,%edi
    2873:	e8 f8 e9 ff ff       	callq  1270 <close@plt>
    2878:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    287d:	e9 78 fe ff ff       	jmpq   26fa <submitr+0x507>
    2882:	48 8d 9c 24 50 20 00 	lea    0x2050(%rsp),%rbx
    2889:	00 
    288a:	48 83 ec 08          	sub    $0x8,%rsp
    288e:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    2895:	00 
    2896:	50                   	push   %rax
    2897:	ff 74 24 20          	pushq  0x20(%rsp)
    289b:	ff 74 24 30          	pushq  0x30(%rsp)
    289f:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    28a4:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    28a9:	48 8d 0d 70 0c 00 00 	lea    0xc70(%rip),%rcx        # 3520 <array.3472+0x340>
    28b0:	ba 00 20 00 00       	mov    $0x2000,%edx
    28b5:	be 01 00 00 00       	mov    $0x1,%esi
    28ba:	48 89 df             	mov    %rbx,%rdi
    28bd:	b8 00 00 00 00       	mov    $0x0,%eax
    28c2:	e8 b9 ea ff ff       	callq  1380 <__sprintf_chk@plt>
    28c7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    28ce:	b8 00 00 00 00       	mov    $0x0,%eax
    28d3:	48 89 df             	mov    %rbx,%rdi
    28d6:	f2 ae                	repnz scas %es:(%rdi),%al
    28d8:	48 f7 d1             	not    %rcx
    28db:	48 83 c4 20          	add    $0x20,%rsp
    28df:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
    28e6:	00 
    28e7:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    28ed:	48 89 cb             	mov    %rcx,%rbx
    28f0:	48 83 eb 01          	sub    $0x1,%rbx
    28f4:	0f 85 db fc ff ff    	jne    25d5 <submitr+0x3e2>
    28fa:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
    28ff:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
    2906:	00 
    2907:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    290c:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
    2911:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    2916:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    291d:	00 
    291e:	ba 00 20 00 00       	mov    $0x2000,%edx
    2923:	e8 02 f8 ff ff       	callq  212a <rio_readlineb>
    2928:	48 85 c0             	test   %rax,%rax
    292b:	0f 8e ca fc ff ff    	jle    25fb <submitr+0x408>
    2931:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    2936:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    293d:	00 
    293e:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    2945:	00 
    2946:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    294d:	00 
    294e:	48 8d 35 50 0c 00 00 	lea    0xc50(%rip),%rsi        # 35a5 <array.3472+0x3c5>
    2955:	b8 00 00 00 00       	mov    $0x0,%eax
    295a:	e8 91 e9 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    295f:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    2964:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    296b:	0f 85 fe fc ff ff    	jne    266f <submitr+0x47c>
    2971:	48 8d 1d 3e 0c 00 00 	lea    0xc3e(%rip),%rbx        # 35b6 <array.3472+0x3d6>
    2978:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    297f:	00 
    2980:	b9 03 00 00 00       	mov    $0x3,%ecx
    2985:	48 89 df             	mov    %rbx,%rdi
    2988:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    298a:	0f 97 c0             	seta   %al
    298d:	1c 00                	sbb    $0x0,%al
    298f:	84 c0                	test   %al,%al
    2991:	0f 84 0f fd ff ff    	je     26a6 <submitr+0x4b3>
    2997:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    299e:	00 
    299f:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    29a4:	ba 00 20 00 00       	mov    $0x2000,%edx
    29a9:	e8 7c f7 ff ff       	callq  212a <rio_readlineb>
    29ae:	48 85 c0             	test   %rax,%rax
    29b1:	7f c5                	jg     2978 <submitr+0x785>
    29b3:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    29ba:	3a 20 43 
    29bd:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    29c4:	20 75 6e 
    29c7:	49 89 07             	mov    %rax,(%r15)
    29ca:	49 89 57 08          	mov    %rdx,0x8(%r15)
    29ce:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    29d5:	74 6f 20 
    29d8:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    29df:	68 65 61 
    29e2:	49 89 47 10          	mov    %rax,0x10(%r15)
    29e6:	49 89 57 18          	mov    %rdx,0x18(%r15)
    29ea:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    29f1:	66 72 6f 
    29f4:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    29fb:	76 65 72 
    29fe:	49 89 47 20          	mov    %rax,0x20(%r15)
    2a02:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2a06:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    2a0b:	44 89 e7             	mov    %r12d,%edi
    2a0e:	e8 5d e8 ff ff       	callq  1270 <close@plt>
    2a13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a18:	e9 dd fc ff ff       	jmpq   26fa <submitr+0x507>
    2a1d:	e8 2e e8 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000002a22 <init_timeout>:
    2a22:	f3 0f 1e fa          	endbr64 
    2a26:	85 ff                	test   %edi,%edi
    2a28:	75 01                	jne    2a2b <init_timeout+0x9>
    2a2a:	c3                   	retq   
    2a2b:	53                   	push   %rbx
    2a2c:	89 fb                	mov    %edi,%ebx
    2a2e:	48 8d 35 bf f6 ff ff 	lea    -0x941(%rip),%rsi        # 20f4 <sigalrm_handler>
    2a35:	bf 0e 00 00 00       	mov    $0xe,%edi
    2a3a:	e8 61 e8 ff ff       	callq  12a0 <signal@plt>
    2a3f:	85 db                	test   %ebx,%ebx
    2a41:	bf 00 00 00 00       	mov    $0x0,%edi
    2a46:	0f 49 fb             	cmovns %ebx,%edi
    2a49:	e8 12 e8 ff ff       	callq  1260 <alarm@plt>
    2a4e:	5b                   	pop    %rbx
    2a4f:	c3                   	retq   

0000000000002a50 <init_driver>:
    2a50:	f3 0f 1e fa          	endbr64 
    2a54:	41 54                	push   %r12
    2a56:	55                   	push   %rbp
    2a57:	53                   	push   %rbx
    2a58:	48 83 ec 20          	sub    $0x20,%rsp
    2a5c:	48 89 fd             	mov    %rdi,%rbp
    2a5f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2a66:	00 00 
    2a68:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2a6d:	31 c0                	xor    %eax,%eax
    2a6f:	be 01 00 00 00       	mov    $0x1,%esi
    2a74:	bf 0d 00 00 00       	mov    $0xd,%edi
    2a79:	e8 22 e8 ff ff       	callq  12a0 <signal@plt>
    2a7e:	be 01 00 00 00       	mov    $0x1,%esi
    2a83:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2a88:	e8 13 e8 ff ff       	callq  12a0 <signal@plt>
    2a8d:	be 01 00 00 00       	mov    $0x1,%esi
    2a92:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2a97:	e8 04 e8 ff ff       	callq  12a0 <signal@plt>
    2a9c:	ba 00 00 00 00       	mov    $0x0,%edx
    2aa1:	be 01 00 00 00       	mov    $0x1,%esi
    2aa6:	bf 02 00 00 00       	mov    $0x2,%edi
    2aab:	e8 e0 e8 ff ff       	callq  1390 <socket@plt>
    2ab0:	85 c0                	test   %eax,%eax
    2ab2:	0f 88 9c 00 00 00    	js     2b54 <init_driver+0x104>
    2ab8:	89 c3                	mov    %eax,%ebx
    2aba:	48 8d 3d ec 09 00 00 	lea    0x9ec(%rip),%rdi        # 34ad <array.3472+0x2cd>
    2ac1:	e8 ea e7 ff ff       	callq  12b0 <gethostbyname@plt>
    2ac6:	48 85 c0             	test   %rax,%rax
    2ac9:	0f 84 d1 00 00 00    	je     2ba0 <init_driver+0x150>
    2acf:	49 89 e4             	mov    %rsp,%r12
    2ad2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2ad9:	00 
    2ada:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2ae1:	00 00 
    2ae3:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2ae9:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2aed:	48 8b 40 18          	mov    0x18(%rax),%rax
    2af1:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2af6:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2afb:	48 8b 30             	mov    (%rax),%rsi
    2afe:	e8 bd e7 ff ff       	callq  12c0 <__memmove_chk@plt>
    2b03:	66 c7 44 24 02 1f 94 	movw   $0x941f,0x2(%rsp)
    2b0a:	ba 10 00 00 00       	mov    $0x10,%edx
    2b0f:	4c 89 e6             	mov    %r12,%rsi
    2b12:	89 df                	mov    %ebx,%edi
    2b14:	e8 27 e8 ff ff       	callq  1340 <connect@plt>
    2b19:	85 c0                	test   %eax,%eax
    2b1b:	0f 88 e7 00 00 00    	js     2c08 <init_driver+0x1b8>
    2b21:	89 df                	mov    %ebx,%edi
    2b23:	e8 48 e7 ff ff       	callq  1270 <close@plt>
    2b28:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    2b2e:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    2b32:	b8 00 00 00 00       	mov    $0x0,%eax
    2b37:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    2b3c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2b43:	00 00 
    2b45:	0f 85 f5 00 00 00    	jne    2c40 <init_driver+0x1f0>
    2b4b:	48 83 c4 20          	add    $0x20,%rsp
    2b4f:	5b                   	pop    %rbx
    2b50:	5d                   	pop    %rbp
    2b51:	41 5c                	pop    %r12
    2b53:	c3                   	retq   
    2b54:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2b5b:	3a 20 43 
    2b5e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2b65:	20 75 6e 
    2b68:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2b6c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2b70:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2b77:	74 6f 20 
    2b7a:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2b81:	65 20 73 
    2b84:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2b88:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2b8c:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2b93:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2b99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b9e:	eb 97                	jmp    2b37 <init_driver+0xe7>
    2ba0:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2ba7:	3a 20 44 
    2baa:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2bb1:	20 75 6e 
    2bb4:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2bb8:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2bbc:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2bc3:	74 6f 20 
    2bc6:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2bcd:	76 65 20 
    2bd0:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2bd4:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2bd8:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2bdf:	72 20 61 
    2be2:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2be6:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    2bed:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    2bf3:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2bf7:	89 df                	mov    %ebx,%edi
    2bf9:	e8 72 e6 ff ff       	callq  1270 <close@plt>
    2bfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2c03:	e9 2f ff ff ff       	jmpq   2b37 <init_driver+0xe7>
    2c08:	4c 8d 05 9e 08 00 00 	lea    0x89e(%rip),%r8        # 34ad <array.3472+0x2cd>
    2c0f:	48 8d 0d 62 09 00 00 	lea    0x962(%rip),%rcx        # 3578 <array.3472+0x398>
    2c16:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2c1d:	be 01 00 00 00       	mov    $0x1,%esi
    2c22:	48 89 ef             	mov    %rbp,%rdi
    2c25:	b8 00 00 00 00       	mov    $0x0,%eax
    2c2a:	e8 51 e7 ff ff       	callq  1380 <__sprintf_chk@plt>
    2c2f:	89 df                	mov    %ebx,%edi
    2c31:	e8 3a e6 ff ff       	callq  1270 <close@plt>
    2c36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2c3b:	e9 f7 fe ff ff       	jmpq   2b37 <init_driver+0xe7>
    2c40:	e8 0b e6 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000002c45 <driver_post>:
    2c45:	f3 0f 1e fa          	endbr64 
    2c49:	53                   	push   %rbx
    2c4a:	4c 89 c3             	mov    %r8,%rbx
    2c4d:	85 c9                	test   %ecx,%ecx
    2c4f:	75 17                	jne    2c68 <driver_post+0x23>
    2c51:	48 85 ff             	test   %rdi,%rdi
    2c54:	74 05                	je     2c5b <driver_post+0x16>
    2c56:	80 3f 00             	cmpb   $0x0,(%rdi)
    2c59:	75 33                	jne    2c8e <driver_post+0x49>
    2c5b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2c60:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2c64:	89 c8                	mov    %ecx,%eax
    2c66:	5b                   	pop    %rbx
    2c67:	c3                   	retq   
    2c68:	48 8d 35 4d 09 00 00 	lea    0x94d(%rip),%rsi        # 35bc <array.3472+0x3dc>
    2c6f:	bf 01 00 00 00       	mov    $0x1,%edi
    2c74:	b8 00 00 00 00       	mov    $0x0,%eax
    2c79:	e8 82 e6 ff ff       	callq  1300 <__printf_chk@plt>
    2c7e:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2c83:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2c87:	b8 00 00 00 00       	mov    $0x0,%eax
    2c8c:	eb d8                	jmp    2c66 <driver_post+0x21>
    2c8e:	41 50                	push   %r8
    2c90:	52                   	push   %rdx
    2c91:	4c 8d 0d 3b 09 00 00 	lea    0x93b(%rip),%r9        # 35d3 <array.3472+0x3f3>
    2c98:	49 89 f0             	mov    %rsi,%r8
    2c9b:	48 89 f9             	mov    %rdi,%rcx
    2c9e:	48 8d 15 32 09 00 00 	lea    0x932(%rip),%rdx        # 35d7 <array.3472+0x3f7>
    2ca5:	be 94 1f 00 00       	mov    $0x1f94,%esi
    2caa:	48 8d 3d fc 07 00 00 	lea    0x7fc(%rip),%rdi        # 34ad <array.3472+0x2cd>
    2cb1:	e8 3d f5 ff ff       	callq  21f3 <submitr>
    2cb6:	48 83 c4 10          	add    $0x10,%rsp
    2cba:	eb aa                	jmp    2c66 <driver_post+0x21>
    2cbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002cc0 <__libc_csu_init>:
    2cc0:	f3 0f 1e fa          	endbr64 
    2cc4:	41 57                	push   %r15
    2cc6:	4c 8d 3d 1b 20 00 00 	lea    0x201b(%rip),%r15        # 4ce8 <__frame_dummy_init_array_entry>
    2ccd:	41 56                	push   %r14
    2ccf:	49 89 d6             	mov    %rdx,%r14
    2cd2:	41 55                	push   %r13
    2cd4:	49 89 f5             	mov    %rsi,%r13
    2cd7:	41 54                	push   %r12
    2cd9:	41 89 fc             	mov    %edi,%r12d
    2cdc:	55                   	push   %rbp
    2cdd:	48 8d 2d 0c 20 00 00 	lea    0x200c(%rip),%rbp        # 4cf0 <__do_global_dtors_aux_fini_array_entry>
    2ce4:	53                   	push   %rbx
    2ce5:	4c 29 fd             	sub    %r15,%rbp
    2ce8:	48 83 ec 08          	sub    $0x8,%rsp
    2cec:	e8 0f e3 ff ff       	callq  1000 <_init>
    2cf1:	48 c1 fd 03          	sar    $0x3,%rbp
    2cf5:	74 1f                	je     2d16 <__libc_csu_init+0x56>
    2cf7:	31 db                	xor    %ebx,%ebx
    2cf9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2d00:	4c 89 f2             	mov    %r14,%rdx
    2d03:	4c 89 ee             	mov    %r13,%rsi
    2d06:	44 89 e7             	mov    %r12d,%edi
    2d09:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    2d0d:	48 83 c3 01          	add    $0x1,%rbx
    2d11:	48 39 dd             	cmp    %rbx,%rbp
    2d14:	75 ea                	jne    2d00 <__libc_csu_init+0x40>
    2d16:	48 83 c4 08          	add    $0x8,%rsp
    2d1a:	5b                   	pop    %rbx
    2d1b:	5d                   	pop    %rbp
    2d1c:	41 5c                	pop    %r12
    2d1e:	41 5d                	pop    %r13
    2d20:	41 5e                	pop    %r14
    2d22:	41 5f                	pop    %r15
    2d24:	c3                   	retq   
    2d25:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    2d2c:	00 00 00 00 

0000000000002d30 <__libc_csu_fini>:
    2d30:	f3 0f 1e fa          	endbr64 
    2d34:	c3                   	retq   

Disassembly of section .fini:

0000000000002d38 <_fini>:
    2d38:	f3 0f 1e fa          	endbr64 
    2d3c:	48 83 ec 08          	sub    $0x8,%rsp
    2d40:	48 83 c4 08          	add    $0x8,%rsp
    2d44:	c3                   	retq   
