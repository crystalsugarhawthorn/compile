
gcc_o0:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 82 2f 00 00    	push   QWORD PTR [rip+0x2f82]        # 3fa8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 84 2f 00 00    	jmp    QWORD PTR [rip+0x2f84]        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   0x0
    1039:	e9 e2 ff ff ff       	jmp    1020 <_init+0x20>
    103e:	66 90                	xchg   ax,ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   0x1
    1049:	e9 d2 ff ff ff       	jmp    1020 <_init+0x20>
    104e:	66 90                	xchg   ax,ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   0x2
    1059:	e9 c2 ff ff ff       	jmp    1020 <_init+0x20>
    105e:	66 90                	xchg   ax,ax
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   0x3
    1069:	e9 b2 ff ff ff       	jmp    1020 <_init+0x20>
    106e:	66 90                	xchg   ax,ax

Disassembly of section .plt.got:

0000000000001070 <__cxa_finalize@plt>:
    1070:	f3 0f 1e fa          	endbr64
    1074:	ff 25 7e 2f 00 00    	jmp    QWORD PTR [rip+0x2f7e]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    107a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001080 <clock@plt>:
    1080:	f3 0f 1e fa          	endbr64
    1084:	ff 25 2e 2f 00 00    	jmp    QWORD PTR [rip+0x2f2e]        # 3fb8 <clock@GLIBC_2.2.5>
    108a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001090 <__stack_chk_fail@plt>:
    1090:	f3 0f 1e fa          	endbr64
    1094:	ff 25 26 2f 00 00    	jmp    QWORD PTR [rip+0x2f26]        # 3fc0 <__stack_chk_fail@GLIBC_2.4>
    109a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010a0 <printf@plt>:
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	ff 25 1e 2f 00 00    	jmp    QWORD PTR [rip+0x2f1e]        # 3fc8 <printf@GLIBC_2.2.5>
    10aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000010b0 <__isoc99_scanf@plt>:
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	ff 25 16 2f 00 00    	jmp    QWORD PTR [rip+0x2f16]        # 3fd0 <__isoc99_scanf@GLIBC_2.7>
    10ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000010c0 <_start>:
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	31 ed                	xor    ebp,ebp
    10c6:	49 89 d1             	mov    r9,rdx
    10c9:	5e                   	pop    rsi
    10ca:	48 89 e2             	mov    rdx,rsp
    10cd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    10d1:	50                   	push   rax
    10d2:	54                   	push   rsp
    10d3:	45 31 c0             	xor    r8d,r8d
    10d6:	31 c9                	xor    ecx,ecx
    10d8:	48 8d 3d ca 00 00 00 	lea    rdi,[rip+0xca]        # 11a9 <main>
    10df:	ff 15 f3 2e 00 00    	call   QWORD PTR [rip+0x2ef3]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10e5:	f4                   	hlt
    10e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    10ed:	00 00 00 

00000000000010f0 <deregister_tm_clones>:
    10f0:	48 8d 3d 19 2f 00 00 	lea    rdi,[rip+0x2f19]        # 4010 <__TMC_END__>
    10f7:	48 8d 05 12 2f 00 00 	lea    rax,[rip+0x2f12]        # 4010 <__TMC_END__>
    10fe:	48 39 f8             	cmp    rax,rdi
    1101:	74 15                	je     1118 <deregister_tm_clones+0x28>
    1103:	48 8b 05 d6 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ed6]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    110a:	48 85 c0             	test   rax,rax
    110d:	74 09                	je     1118 <deregister_tm_clones+0x28>
    110f:	ff e0                	jmp    rax
    1111:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1118:	c3                   	ret
    1119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001120 <register_tm_clones>:
    1120:	48 8d 3d e9 2e 00 00 	lea    rdi,[rip+0x2ee9]        # 4010 <__TMC_END__>
    1127:	48 8d 35 e2 2e 00 00 	lea    rsi,[rip+0x2ee2]        # 4010 <__TMC_END__>
    112e:	48 29 fe             	sub    rsi,rdi
    1131:	48 89 f0             	mov    rax,rsi
    1134:	48 c1 ee 3f          	shr    rsi,0x3f
    1138:	48 c1 f8 03          	sar    rax,0x3
    113c:	48 01 c6             	add    rsi,rax
    113f:	48 d1 fe             	sar    rsi,1
    1142:	74 14                	je     1158 <register_tm_clones+0x38>
    1144:	48 8b 05 a5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ea5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    114b:	48 85 c0             	test   rax,rax
    114e:	74 08                	je     1158 <register_tm_clones+0x38>
    1150:	ff e0                	jmp    rax
    1152:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1158:	c3                   	ret
    1159:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	80 3d a5 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ea5],0x0        # 4010 <__TMC_END__>
    116b:	75 2b                	jne    1198 <__do_global_dtors_aux+0x38>
    116d:	55                   	push   rbp
    116e:	48 83 3d 82 2e 00 00 	cmp    QWORD PTR [rip+0x2e82],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1175:	00 
    1176:	48 89 e5             	mov    rbp,rsp
    1179:	74 0c                	je     1187 <__do_global_dtors_aux+0x27>
    117b:	48 8b 3d 86 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2e86]        # 4008 <__dso_handle>
    1182:	e8 e9 fe ff ff       	call   1070 <__cxa_finalize@plt>
    1187:	e8 64 ff ff ff       	call   10f0 <deregister_tm_clones>
    118c:	c6 05 7d 2e 00 00 01 	mov    BYTE PTR [rip+0x2e7d],0x1        # 4010 <__TMC_END__>
    1193:	5d                   	pop    rbp
    1194:	c3                   	ret
    1195:	0f 1f 00             	nop    DWORD PTR [rax]
    1198:	c3                   	ret
    1199:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000011a0 <frame_dummy>:
    11a0:	f3 0f 1e fa          	endbr64
    11a4:	e9 77 ff ff ff       	jmp    1120 <register_tm_clones>

00000000000011a9 <main>:
    11a9:	f3 0f 1e fa          	endbr64
    11ad:	55                   	push   rbp
    11ae:	48 89 e5             	mov    rbp,rsp
    11b1:	48 83 ec 40          	sub    rsp,0x40
    11b5:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    11bc:	00 00 
    11be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    11c2:	31 c0                	xor    eax,eax
    11c4:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    11cb:	00 
    11cc:	48 8d 05 35 0e 00 00 	lea    rax,[rip+0xe35]        # 2008 <_IO_stdin_used+0x8>
    11d3:	48 89 c7             	mov    rdi,rax
    11d6:	b8 00 00 00 00       	mov    eax,0x0
    11db:	e8 c0 fe ff ff       	call   10a0 <printf@plt>
    11e0:	48 8d 45 cc          	lea    rax,[rbp-0x34]
    11e4:	48 89 c6             	mov    rsi,rax
    11e7:	48 8d 05 40 0e 00 00 	lea    rax,[rip+0xe40]        # 202e <_IO_stdin_used+0x2e>
    11ee:	48 89 c7             	mov    rdi,rax
    11f1:	b8 00 00 00 00       	mov    eax,0x0
    11f6:	e8 b5 fe ff ff       	call   10b0 <__isoc99_scanf@plt>
    11fb:	e8 80 fe ff ff       	call   1080 <clock@plt>
    1200:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    1204:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [rbp-0x30],0x0
    120b:	eb 46                	jmp    1253 <main+0xaa>
    120d:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    1214:	eb 31                	jmp    1247 <main+0x9e>
    1216:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
    1219:	0f af 45 d4          	imul   eax,DWORD PTR [rbp-0x2c]
    121d:	48 63 d0             	movsxd rdx,eax
    1220:	48 69 d2 1f 85 eb 51 	imul   rdx,rdx,0x51eb851f
    1227:	48 c1 ea 20          	shr    rdx,0x20
    122b:	c1 fa 05             	sar    edx,0x5
    122e:	89 c1                	mov    ecx,eax
    1230:	c1 f9 1f             	sar    ecx,0x1f
    1233:	29 ca                	sub    edx,ecx
    1235:	6b ca 64             	imul   ecx,edx,0x64
    1238:	29 c8                	sub    eax,ecx
    123a:	89 c2                	mov    edx,eax
    123c:	48 63 c2             	movsxd rax,edx
    123f:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
    1243:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
    1247:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    124a:	39 45 d4             	cmp    DWORD PTR [rbp-0x2c],eax
    124d:	7c c7                	jl     1216 <main+0x6d>
    124f:	83 45 d0 01          	add    DWORD PTR [rbp-0x30],0x1
    1253:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
    1256:	39 45 d0             	cmp    DWORD PTR [rbp-0x30],eax
    1259:	7c b2                	jl     120d <main+0x64>
    125b:	e8 20 fe ff ff       	call   1080 <clock@plt>
    1260:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    1264:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1268:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
    126c:	66 0f ef c0          	pxor   xmm0,xmm0
    1270:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
    1275:	f2 0f 10 0d f3 0d 00 	movsd  xmm1,QWORD PTR [rip+0xdf3]        # 2070 <_IO_stdin_used+0x70>
    127c:	00 
    127d:	f2 0f 5e c1          	divsd  xmm0,xmm1
    1281:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
    1286:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    128a:	48 89 c6             	mov    rsi,rax
    128d:	48 8d 05 9d 0d 00 00 	lea    rax,[rip+0xd9d]        # 2031 <_IO_stdin_used+0x31>
    1294:	48 89 c7             	mov    rdi,rax
    1297:	b8 00 00 00 00       	mov    eax,0x0
    129c:	e8 ff fd ff ff       	call   10a0 <printf@plt>
    12a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    12a5:	66 48 0f 6e c0       	movq   xmm0,rax
    12aa:	48 8d 05 97 0d 00 00 	lea    rax,[rip+0xd97]        # 2048 <_IO_stdin_used+0x48>
    12b1:	48 89 c7             	mov    rdi,rax
    12b4:	b8 01 00 00 00       	mov    eax,0x1
    12b9:	e8 e2 fd ff ff       	call   10a0 <printf@plt>
    12be:	b8 00 00 00 00       	mov    eax,0x0
    12c3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    12c7:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    12ce:	00 00 
    12d0:	74 05                	je     12d7 <main+0x12e>
    12d2:	e8 b9 fd ff ff       	call   1090 <__stack_chk_fail@plt>
    12d7:	c9                   	leave
    12d8:	c3                   	ret

Disassembly of section .fini:

00000000000012dc <_fini>:
    12dc:	f3 0f 1e fa          	endbr64
    12e0:	48 83 ec 08          	sub    rsp,0x8
    12e4:	48 83 c4 08          	add    rsp,0x8
    12e8:	c3                   	ret
