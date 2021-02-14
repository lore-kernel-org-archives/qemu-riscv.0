Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lBMck-0004r7-Ar
	for mharc-qemu-riscv@gnu.org; Sun, 14 Feb 2021 14:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yann@sionneau.net>) id 1lBMcj-0004pf-CV
 for qemu-riscv@nongnu.org; Sun, 14 Feb 2021 14:00:01 -0500
Received: from mx3.sionneau.net ([163.172.183.177]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yann@sionneau.net>) id 1lBMcg-0000yF-MD
 for qemu-riscv@nongnu.org; Sun, 14 Feb 2021 14:00:01 -0500
Received: from mx3.sionneau.net (localhost [127.0.0.1])
 by mx3.sionneau.net. (OpenSMTPD) with ESMTP id 67c86539
 for <qemu-riscv@nongnu.org>; Sun, 14 Feb 2021 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=sionneau.net; h=from:to
 :subject:message-id:date:mime-version:content-type
 :content-transfer-encoding; s=selectormx3; bh=1cg4pFrZ9e7ZHg/q3q
 jsmVuHjxc=; b=YIm5NODdqTD+Sqc8WtLGb2weKCBReQ1Rm+qVKGOCzcp0BbtHpQ
 b7VIgZPfoxX40z5f6mGZ5ahH8iZDcouqo8ezh84Ihe06Ck5HcWHpoo90gaigZ0Oj
 M45u/4eADPr+7Kh76xYrCVftGwv9Qvm9tDvHWRkSU01WxTfK8GAKul3YI=
DomainKey-Signature: a=rsa-sha1; c=simple; d=sionneau.net; h=from:to
 :subject:message-id:date:mime-version:content-type
 :content-transfer-encoding; q=dns; s=selectormx3; b=eZVz3PEesl6J
 ps8ZfTjWbXWNkRtGU3auixpGPqIlFDOhSYPzPF0Mleu8gFn6t0S6r6EhFoj9Iu7R
 5MS83o60TVpgNLjrywsrlyFphf38QtDVmA64kM/YgjDFjPR8vWBwm05h+kTVZO9s
 uKbi1rlS75tY8n/y1oG7Qmye/J4KMHQ=
Received: by mx3.sionneau.net (OpenSMTPD) with ESMTPSA id 81180979
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <qemu-riscv@nongnu.org>; Sun, 14 Feb 2021 18:59:54 +0000 (UTC)
From: Yann Sionneau <yann@sionneau.net>
To: qemu-riscv@nongnu.org
Autocrypt: addr=yann@sionneau.net; prefer-encrypt=mutual; keydata=
 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
 A8nA8PkvEAit
Subject: single stepping with gdb+qemu does not seem to work on SRET
 instruction
Message-ID: <f35f5cde-82e0-80ca-db3c-9a6c13a59c3f@sionneau.net>
Date: Sun, 14 Feb 2021 19:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Received-SPF: pass client-ip=163.172.183.177; envelope-from=yann@sionneau.net;
 helo=mx3.sionneau.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Feb 2021 19:00:01 -0000

Hello RISC-V qemu hackers,

I am trying to debug some uClibc-ng risc-v port issues, and while doing
so I tried to single step the kernel->user space transition.

I realized that when I was breaking on SRET insn in kernel, if I do
"si", I would expect to single step and end up at PC =3D=3D $SEPC but it
does not seem to be the case.

Any idea why? Is it a bug or a known limitation? Or even normal behaviour=
?

Thanks for your insight :)

PS : my qemu --version says 5.2.0

Details of my qemu cmdline and debug session:

#############################

I run qemu like this:

fallen@fallen-ThinkPad-X260:~/dev/buildroot/build_riscv/images$ export
PATH=3D"/home/fallen/dev/buildroot/build_riscv/host/bin:${PATH}"
fallen@fallen-ThinkPad-X260:~/dev/buildroot/build_riscv/images$
qemu-system-riscv64 -M virt -bios fw_jump.elf -kernel Image -append
"rootwait root=3D/dev/vda ro" -drive file=3Drootfs.ext2,format=3Draw,id=3D=
hd0
-device virtio-blk-device,drive=3Dhd0 -netdev user,id=3Dnet0 -device
virtio-net-device,netdev=3Dnet0 -nographic -s -S

Here is my GDB debugging session:

fallen@fallen-ThinkPad-X260:~/dev/buildroot/build_riscv$
=2E/host/bin/riscv64-buildroot-linux-uclibc-gdb build/linux-5.10.7/vmlinu=
x
GNU gdb (GDB) 10.1
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=3Dx86_64-pc-linux-gnu
--target=3Driscv64-buildroot-linux-uclibc".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
=C2=A0=C2=A0=C2=A0 <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from build/linux-5.10.7/vmlinux...
(No debugging symbols found in build/linux-5.10.7/vmlinux)
(gdb) target remote :1234
Remote debugging using :1234
0x0000000000001000 in ?? ()
(gdb) b handle_syscall
Breakpoint 1 at 0xffffffe000201296
(gdb) c
Continuing.

Breakpoint 1, 0xffffffe000201296 in handle_exception ()

(gdb) b *0xffffffe000201350
Breakpoint 2 at 0xffffffe000201350
(gdb) c
Continuing.

Breakpoint 2, 0xffffffe000201350 in handle_exception ()
(gdb) display /i $pc
1: x/i $pc
=3D> 0xffffffe000201350 <handle_exception+412>:=C2=A0=C2=A0=C2=A0 sret
(gdb) p/x $sepc
$1 =3D 0xffffffe0008b6cd6
(gdb) si

Breakpoint 1, 0xffffffe000201296 in handle_exception ()
1: x/i $pc
=3D> 0xffffffe000201296 <handle_exception+226>:=C2=A0=C2=A0=C2=A0 sd=C2=A0=
=C2=A0=C2=A0 a0,280(sp)
(gdb) c
Continuing.

Breakpoint 2, 0xffffffe000201350 in handle_exception ()
1: x/i $pc
=3D> 0xffffffe000201350 <handle_exception+412>:=C2=A0=C2=A0=C2=A0 sret
(gdb) p/x $sepc
$2 =3D 0xffffffe0004a62c0
(gdb) si

Breakpoint 1, 0xffffffe000201296 in handle_exception ()

etc...

Regards,

--=20

Yann



