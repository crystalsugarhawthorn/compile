
clang_o0:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 c1 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fc1]        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <clock@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   QWORD PTR [rip+0x2fca]        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    QWORD PTR [rip+0x2fcc]        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <clock@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    QWORD PTR [rip+0x2fca]        # 4000 <clock@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <printf@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    QWORD PTR [rip+0x2fc2]        # 4008 <printf@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <__isoc99_scanf@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    QWORD PTR [rip+0x2fba]        # 4010 <__isoc99_scanf@GLIBC_2.7>
    1056:	68 02 00 00 00       	push   0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	ff 25 7a 2f 00 00    	jmp    QWORD PTR [rip+0x2f7a]        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1066:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	f3 0f 1e fa          	endbr64
    1074:	31 ed                	xor    ebp,ebp
    1076:	49 89 d1             	mov    r9,rdx
    1079:	5e                   	pop    rsi
    107a:	48 89 e2             	mov    rdx,rsp
    107d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1081:	50                   	push   rax
    1082:	54                   	push   rsp
    1083:	45 31 c0             	xor    r8d,r8d
    1086:	31 c9                	xor    ecx,ecx
    1088:	48 8d 3d d1 00 00 00 	lea    rdi,[rip+0xd1]        # 1160 <main>
    108f:	ff 15 2b 2f 00 00    	call   QWORD PTR [rip+0x2f2b]        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1095:	f4                   	hlt
    1096:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    109d:	00 00 00 

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 81 2f 00 00 	lea    rdi,[rip+0x2f81]        # 4028 <__TMC_END__>
    10a7:	48 8d 05 7a 2f 00 00 	lea    rax,[rip+0x2f7a]        # 4028 <__TMC_END__>
    10ae:	48 39 f8             	cmp    rax,rdi
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 0e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f0e]        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   rax,rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    rax
    10c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10c8:	c3                   	ret
    10c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 51 2f 00 00 	lea    rdi,[rip+0x2f51]        # 4028 <__TMC_END__>
    10d7:	48 8d 35 4a 2f 00 00 	lea    rsi,[rip+0x2f4a]        # 4028 <__TMC_END__>
    10de:	48 29 fe             	sub    rsi,rdi
    10e1:	48 89 f0             	mov    rax,rsi
    10e4:	48 c1 ee 3f          	shr    rsi,0x3f
    10e8:	48 c1 f8 03          	sar    rax,0x3
    10ec:	48 01 c6             	add    rsi,rax
    10ef:	48 d1 fe             	sar    rsi,1
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 dd 2e 00 00 	mov    rax,QWORD PTR [rip+0x2edd]        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10fb:	48 85 c0             	test   rax,rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    rax
    1102:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1108:	c3                   	ret
    1109:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64
    1114:	80 3d 0d 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f0d],0x0        # 4028 <__TMC_END__>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   rbp
    111e:	48 83 3d ba 2e 00 00 	cmp    QWORD PTR [rip+0x2eba],0x0        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1125:	00 
    1126:	48 89 e5             	mov    rbp,rsp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d ee 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2eee]        # 4020 <__dso_handle>
    1132:	e8 29 ff ff ff       	call   1060 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 e5 2e 00 00 01 	mov    BYTE PTR [rip+0x2ee5],0x1        # 4028 <__TMC_END__>
    1143:	5d                   	pop    rbp
    1144:	c3                   	ret
    1145:	0f 1f 00             	nop    DWORD PTR [rax]
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>
    1159:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001160 <main>:
    1160:	55                   	push   rbp
    1161:	48 89 e5             	mov    rbp,rsp
    1164:	48 83 ec 30          	sub    rsp,0x30
    1168:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    116f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    1176:	00 
    1177:	48 8d 3d 92 0e 00 00 	lea    rdi,[rip+0xe92]        # 2010 <_IO_stdin_used+0x10>
    117e:	b0 00                	mov    al,0x0
    1180:	e8 bb fe ff ff       	call   1040 <printf@plt>
    1185:	48 8d 3d aa 0e 00 00 	lea    rdi,[rip+0xeaa]        # 2036 <_IO_stdin_used+0x36>
    118c:	48 8d 75 f0          	lea    rsi,[rbp-0x10]
    1190:	b0 00                	mov    al,0x0
    1192:	e8 b9 fe ff ff       	call   1050 <__isoc99_scanf@plt>
    1197:	e8 94 fe ff ff       	call   1030 <clock@plt>
    119c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    11a0:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    11a7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    11aa:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
    11ad:	0f 8d 4e 00 00 00    	jge    1201 <main+0xa1>
    11b3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    11ba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    11bd:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
    11c0:	0f 8d 28 00 00 00    	jge    11ee <main+0x8e>
    11c6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    11c9:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
    11cd:	b9 64 00 00 00       	mov    ecx,0x64
    11d2:	99                   	cdq
    11d3:	f7 f9                	idiv   ecx
    11d5:	48 63 c2             	movsxd rax,edx
    11d8:	48 03 45 e8          	add    rax,QWORD PTR [rbp-0x18]
    11dc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    11e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    11e3:	83 c0 01             	add    eax,0x1
    11e6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    11e9:	e9 cc ff ff ff       	jmp    11ba <main+0x5a>
    11ee:	e9 00 00 00 00       	jmp    11f3 <main+0x93>
    11f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    11f6:	83 c0 01             	add    eax,0x1
    11f9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    11fc:	e9 a6 ff ff ff       	jmp    11a7 <main+0x47>
    1201:	e8 2a fe ff ff       	call   1030 <clock@plt>
    1206:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    120a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    120e:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
    1212:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
    1217:	f2 0f 10 0d e9 0d 00 	movsd  xmm1,QWORD PTR [rip+0xde9]        # 2008 <_IO_stdin_used+0x8>
    121e:	00 
    121f:	f2 0f 5e c1          	divsd  xmm0,xmm1
    1223:	f2 0f 11 45 d0       	movsd  QWORD PTR [rbp-0x30],xmm0
    1228:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
    122c:	48 8d 3d 06 0e 00 00 	lea    rdi,[rip+0xe06]        # 2039 <_IO_stdin_used+0x39>
    1233:	b0 00                	mov    al,0x0
    1235:	e8 06 fe ff ff       	call   1040 <printf@plt>
    123a:	f2 0f 10 45 d0       	movsd  xmm0,QWORD PTR [rbp-0x30]
    123f:	48 8d 3d 07 0e 00 00 	lea    rdi,[rip+0xe07]        # 204d <_IO_stdin_used+0x4d>
    1246:	b0 01                	mov    al,0x1
    1248:	e8 f3 fd ff ff       	call   1040 <printf@plt>
    124d:	31 c0                	xor    eax,eax
    124f:	48 83 c4 30          	add    rsp,0x30
    1253:	5d                   	pop    rbp
    1254:	c3                   	ret

Disassembly of section .fini:

0000000000001258 <_fini>:
    1258:	f3 0f 1e fa          	endbr64
    125c:	48 83 ec 08          	sub    rsp,0x8
    1260:	48 83 c4 08          	add    rsp,0x8
    1264:	c3                   	ret
