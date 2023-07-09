Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D265EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 13:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIULM-0007qU-7V; Sun, 09 Jul 2023 09:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qINfB-0000NV-P2; Sun, 09 Jul 2023 02:12:53 -0400
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qINf9-0004uy-JP; Sun, 09 Jul 2023 02:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688883162; x=1689487962; i=deller@gmx.de;
 bh=MP46eJGgmOsVQKva/vc/DskV13RMn3M9zzV3+pJeoIw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QpyRBzK9my/gFYjZZr9b6Za7pohBan+oLYYERzcaZnq8IkoxwtA6+LReuCxlCF0XFDsE+Gx
 k+esMYkqWwaqnwK/znlpcbUimlEUgJwoiOsscgcbqogmn1iXLCXyxdMQQmT3wz8ju5LZKMV1s
 5sMsO8KZncE43COBkd1DKYXZDJ1RzJis9s+K+rE0kT5jHnkFu83CyByxKwRnFVTgzDyCAIh0t
 NNQojqt+R6oVkWy5amsuIhHu6bLU4gPS306pLFR9MuO6Fi7J2702j6IZUggaYFX9Ht0VSmKvO
 QNWcp+8y+u9YihqOUqe/glvFaz7cuSg7Wy/NUh98u3Sp8ktRtqtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.9]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1qVYvi08ga-00UtnT; Sun, 09
 Jul 2023 08:12:42 +0200
Message-ID: <d8028a5f-19c4-2b4a-41aa-9c01420005c5@gmx.de>
Date: Sun, 9 Jul 2023 08:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RISC-V] ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp:
 assertion failed: (cpu == current_cpu)
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <mvmmt0dtosg.fsf@suse.de> <mvma5wdtdiw.fsf@suse.de>
 <87h6qli4au.fsf@linaro.org> <mvm5y71tbdo.fsf@suse.de>
 <mvmlefwrlt2.fsf@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <mvmlefwrlt2.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yFrOaCT1WxRTFRALblQHg+ITz33H1ZX6YO4dwosXY759dGTL+m2
 FH45utszwyuYi2HZlCwNnpd67f2zzhl5KszRYyJfuQlw+QhD5U5WydGt2uCxIjJdQRbuGKy
 pqAHagax93uRz5I8qFNTEhSV+tuqWKFWLXIojjyX4Bqj8AJfRnzMswohBmixO7MEXpoX+xZ
 e3eGv0vLnI517KR31Q5uQ==
UI-OutboundReport: notjunk:1;M01:P0:EDNaRbnZmMM=;im+U21Ue78hLP6PFuREhCYqtw8o
 XvyrL4GBwmCxkLkpIxsS1f5sAzYUEnIDXh4YO9gU6eSw+/16PXeqyCeF1Y72xZ9GZfAzC1Jqv
 gAfJRqSbBVmk8nnO2TYi5mnrpOc8dXllYV+uPNX9vuJcqNcVE7PlmA52WgB7+IJGHCFuqZVCQ
 oCBI/O9vQ4X16KxL/ouM5+cRjUydRuDQ/22hD6bgtj0YQNRZ6VzCMCGotSAKE2c4bUh8NkfNm
 64JpQxvih8jHlGIGLETVtNDewG/pE3c0nXTENrvJN9o+Wzlj93fw34n5/mZcsE4X2RPRT7kKt
 sor6ZnMa7Y6Ll2WJoGhguRnE0XYMCVXpFSP2NwBuu8pTKRY3UnXrDNx/l4JZKmvSvD+x+fChA
 kgSpDtnUVKYRi4SxiUCDDuuhEXZLqPiarD8fy/bcsHkm/FAlyS2F2q/GkJfvMLrMafkWNZzKu
 Q0SoZcaQ/dWd+hGVB2YF4jNIpwRS71fwHG+9AElN4pjEJe/1gh9V29OzM8Vd1j3mFL1+TBmbm
 yaFU2IsqA/3JOHXIZeTHSlqPusbATGN5UqP+b0M/qhImAgZFqr+/B5GcMksW3gUL6x6hjPMR5
 vBqRDDY6p5W7+62SJM2NtyIha8zbmXCnZ1MipDKfECFthr6Er7as+FDB0jTPI7sTr/Gwf5DoK
 E/7Gt/jw2nqgPedWsbLTH6y/hvMFHlQRONYvcWJHxFtiPjDGVliLEupnO7tptUTeaD5hLnNRC
 3RyzvWwFXkVYk1lIMYfatjh11YM/J7uD65suOV8cUAYxPgpanIfp085MEyVzAlE4MNhVOCzbm
 /6VBf3TQSQ42pY4cgvcMSNIAfWxhoK0QRdG0jOGkXLkjX9iPKgaCN03C3fXkKND8pQ/egHFYp
 HZq/SQjWD/TfboltRtJW+qC0wpbhIdOxwiiHsQXxEDQ9WLH8OphEwWZJF4Kn3KH+8Sry2PR2v
 DR4+tA==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Jul 2023 09:20:48 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/4/23 12:52, Andreas Schwab wrote:
> I think the issue is that the value returned from brk(0) is no longer
> page aligned.

> $ ./qemu-riscv64 -strace ../exe1
> 18329 brk(NULL) =3D 0x0000000000303000
> 18329 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) =3D -1 errn=
o=3D2 (No such file or directory)
> 18329 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) =3D 3
> 18329 newfstatat(3,"",0x00000040007fe900,0x1000) =3D 0
> 18329 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) =3D 0x0000004000824000
> 18329 close(3) =3D 0
> 18329 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) =3D 3
> 18329 read(3,0x7fea70,832) =3D 832
> 18329 newfstatat(3,"",0x00000040007fe8f0,0x1000) =3D 0
> 18329 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,=
0) =3D 0x0000004000827000
> 18329 mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP=
_DENYWRITE|MAP_FIXED,3,0x146000) =3D 0x000000400096d000
> 18329 mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP=
_ANONYMOUS|MAP_FIXED,-1,0) =3D 0x0000004000972000
> 18329 close(3) =3D 0
> 18329 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0=
) =3D 0x000000400097f000
> 18329 set_tid_address(0x400097f710) =3D 18329
> 18329 set_robust_list(0x400097f720,24) =3D -1 errno=3D38 (Function not i=
mplemented)
> 18329 mprotect(0x000000400096d000,12288,PROT_READ) =3D 0
> 18329 mprotect(0x0000004000820000,4096,PROT_READ) =3D 0
> 18329 prlimit64(0,RLIMIT_STACK,NULL,0x00000040007ff4f8) =3D 0 ({rlim_cur=
=3D8388608,rlim_max=3D-1})
> 18329 munmap(0x0000004000824000,8799) =3D 0
> 18329 newfstatat(1,"",0x00000040007ff658,0x1000) =3D 0
> 18329 getrandom(0x4000976a40,8,1) =3D 8
> 18329 brk(NULL) =3D 0x0000000000303000
> 18329 brk(0x0000000000324000) =3D 0x0000000000324000
> 18329 write(1,0x3032a0,12)Hello world
>   =3D 12
> 18329 exit_group(0)

> $ qemu-riscv64 -strace ../exe1
> 18369 brk(NULL) =3D 0x00000000003022e8
> 18369 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) =3D -1 errn=
o=3D2 (No such file or directory)
> 18369 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) =3D 3
> 18369 newfstatat(3,"",0x00000040007fe8f0,0x1000) =3D 0
> 18369 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) =3D 0x0000004000824000
> 18369 close(3) =3D 0
> 18369 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) =3D 3
> 18369 read(3,0x7fea60,832) =3D 832
> 18369 newfstatat(3,"",0x00000040007fe8e0,0x1000) =3D 0
> 18369 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,=
0) =3D 0x0000004000827000
> 18369 mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP=
_DENYWRITE|MAP_FIXED,3,0x146000) =3D 0x000000400096d000
> 18369 mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP=
_ANONYMOUS|MAP_FIXED,-1,0) =3D 0x0000004000972000
> 18369 close(3) =3D 0
> 18369 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0=
) =3D 0x000000400097f000
> 18369 set_tid_address(0x400097f710) =3D 18369
> 18369 set_robust_list(0x400097f720,24) =3D -1 errno=3D38 (Function not i=
mplemented)
> 18369 mprotect(0x000000400096d000,12288,PROT_READ) =3D 0
> 18369 mprotect(0x0000004000820000,4096,PROT_READ) =3D 0
> 18369 prlimit64(0,RLIMIT_STACK,NULL,0x00000040007ff4e8) =3D 0 ({rlim_cur=
=3D8388608,rlim_max=3D-1})
> 18369 munmap(0x0000004000824000,8799) =3D 0
> 18369 newfstatat(1,"",0x00000040007ff648,0x1000) =3D 0
> 18369 getrandom(0x4000976a40,8,1) =3D 8
> 18369 brk(NULL) =3D 0x00000000003022e8
> 18369 brk(0x00000000003232e8)**
> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (c=
pu =3D=3D current_cpu)
> Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion =
failed: (cpu =3D=3D current_cpu)
> **
> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (c=
pu =3D=3D current_cpu)
> Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion =
failed: (cpu =3D=3D current_cpu)

This reminds me on a failure I once saw on the hppa target.
See commit bd4b7fd6ba98 ("linux-user/hppa: Fix segfaults on page zero").

Maybe the not-page-aligned brk address triggers the glibc or application i=
n the
guest  to jump somewhere else (see cpu_exec_setjmp)?
The example in my commit message jumped to address 0, which isn't writeabl=
e
for applications in the target machine and qemu was missing to trigger/han=
dle
the correct target exception handling.

I think your patch to page-align the initial brk() is correct, but it prob=
ably
just hides the real problem.

Maybe you are able to test what happens with exe1 on a physical risc-v mac=
hine
if the brk-adress wouldn't be page aligned?
Maybe you are missing some exception handling for risc-v in qemu too?

Helge

