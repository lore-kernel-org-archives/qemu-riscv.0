Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECCDEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGemY-0002nS-PC; Tue, 04 Jul 2023 08:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qGemX-0002n2-O3
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 08:05:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qGemV-0003EW-1U
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 08:05:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc244d39dso72823385e9.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Jul 2023 05:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688472317; x=1691064317;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v47u+pCafj/ocPBsOhq+FZWGgHeZdq++iUxJxjHFRwg=;
 b=bpDeyv8r7iL5wj6ejYWwMCR+aNSMP92ookv6+r6ypL0F/bkgMCb7l53Tk05kCFWp5c
 JGAAI3xF5z6ZyvgOqdcKeidng8nK7bX1iDkc+Q4tep0TZMBvZ4G3a97wU/8pn64PVg2u
 USqfxw3hhMsXje1MEwmNN8zMP7PZiB05S6u6+c1b8nfMLIRK6wKJ5Ye8KRFRmda8Jh3U
 Vp4BLfUNQzcrksLSnCcHliyK7BHocdkc3iFj+ylHwbXQsVPMiJeKy0sJ5VlZSv1zxLHV
 uJE2hbmZicAh5SIR+UsGiDl/NjgqnI7AVtCv/one/Ar7GaK57pDcT+dQwzHx6JTJB5ae
 MUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688472317; x=1691064317;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v47u+pCafj/ocPBsOhq+FZWGgHeZdq++iUxJxjHFRwg=;
 b=FHfd7CzfDqyiWSw59acMGB6WRd5UHxLDIsgyUl2Xa9UsHcBo6hRGX5VCUtdEDUBxL8
 y/SLK4knjw2U0YoK3tt0L8VacmWcKYVrxW/7OBL873IVWVjGrabSiiHDJpiyKUdHrD7O
 cih6c++U2VHe5/pker6g6qvdJXIBI6oDuvbuigi0E31DZ5HyT8yl7iZFt+Vr9dqTBoez
 qacC6oCx7swlrFY8NITboc9i47vADy+SmrK1GTFSdyUEHtwSX+RS9wSb0I7Pql2IkbSd
 x154l7foyNrtATTaVyOVp+Slz5k1HKXX148BJUc53vr9oBMUVkROoWBICD75zb1JuCrp
 pNjQ==
X-Gm-Message-State: AC+VfDycL4Ia5lmXo9xW0vAOmAt1RNdBeN5vLWajJDPltCCheXAYopqR
 zWMTbEjwD5k37ERIlocRU3Ih7A==
X-Google-Smtp-Source: ACHHUZ6vvlI55Cciwmw9GbFwBAWZuL0pDrMg550pkxe8uvagp20m8as502oGL06L7Uln1gap8PtlAQ==
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id
 v5-20020a05600c214500b003fb415fa85bmr17372223wml.3.1688472316845; 
 Tue, 04 Jul 2023 05:05:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fbb618f7adsm15777786wml.15.2023.07.04.05.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 05:05:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4B7A1FFBB;
 Tue,  4 Jul 2023 13:05:15 +0100 (BST)
References: <mvmmt0dtosg.fsf@suse.de> <mvma5wdtdiw.fsf@suse.de>
 <87h6qli4au.fsf@linaro.org> <mvm5y71tbdo.fsf@suse.de>
 <mvmlefwrlt2.fsf@suse.de>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RISC-V] ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp:
 assertion failed: (cpu == current_cpu)
Date: Tue, 04 Jul 2023 13:02:42 +0100
In-reply-to: <mvmlefwrlt2.fsf@suse.de>
Message-ID: <87a5wbhog4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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


Andreas Schwab <schwab@suse.de> writes:

> I think the issue is that the value returned from brk(0) is no longer
> page aligned.
>
> $ ./qemu-riscv64 -strace ../exe1=20
> 18329 brk(NULL) =3D 0x0000000000303000
> 18329 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) =3D -1 errno=
=3D2 (No such file or directory)
> 18329 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) =3D 3
> 18329 newfstatat(3,"",0x00000040007fe900,0x1000) =3D 0
> 18329 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) =3D 0x0000004000824000
> 18329 close(3) =3D 0
> 18329 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) =3D 3
> 18329 read(3,0x7fea70,832) =3D 832
> 18329 newfstatat(3,"",0x00000040007fe8f0,0x1000) =3D 0
> 18329 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,0=
) =3D 0x0000004000827000
> 18329
> mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_DENYWR=
ITE|MAP_FIXED,3,0x146000)
> =3D 0x000000400096d000
> 18329
> mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYM=
OUS|MAP_FIXED,-1,0)
> =3D 0x0000004000972000
> 18329 close(3) =3D 0
> 18329 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0)=
 =3D 0x000000400097f000
> 18329 set_tid_address(0x400097f710) =3D 18329
> 18329 set_robust_list(0x400097f720,24) =3D -1 errno=3D38 (Function not im=
plemented)
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
>  =3D 12
> 18329 exit_group(0)
> $ qemu-riscv64 -strace ../exe1=20
> 18369 brk(NULL) =3D 0x00000000003022e8
> 18369 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) =3D -1 errno=
=3D2 (No such file or directory)
> 18369 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) =3D 3
> 18369 newfstatat(3,"",0x00000040007fe8f0,0x1000) =3D 0
> 18369 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) =3D 0x0000004000824000
> 18369 close(3) =3D 0
> 18369 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) =3D 3
> 18369 read(3,0x7fea60,832) =3D 832
> 18369 newfstatat(3,"",0x00000040007fe8e0,0x1000) =3D 0
> 18369 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,0=
) =3D 0x0000004000827000
> 18369
> mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_DENYWR=
ITE|MAP_FIXED,3,0x146000)
> =3D 0x000000400096d000
> 18369
> mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYM=
OUS|MAP_FIXED,-1,0)
> =3D 0x0000004000972000
> 18369 close(3) =3D 0
> 18369 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0)=
 =3D 0x000000400097f000
> 18369 set_tid_address(0x400097f710) =3D 18369
> 18369 set_robust_list(0x400097f720,24) =3D -1 errno=3D38 (Function not im=
plemented)
> 18369 mprotect(0x000000400096d000,12288,PROT_READ) =3D 0
> 18369 mprotect(0x0000004000820000,4096,PROT_READ) =3D 0
> 18369 prlimit64(0,RLIMIT_STACK,NULL,0x00000040007ff4e8) =3D 0 ({rlim_cur=
=3D8388608,rlim_max=3D-1})
> 18369 munmap(0x0000004000824000,8799) =3D 0
> 18369 newfstatat(1,"",0x00000040007ff648,0x1000) =3D 0
> 18369 getrandom(0x4000976a40,8,1) =3D 8
> 18369 brk(NULL) =3D 0x00000000003022e8
> 18369 brk(0x00000000003232e8)**
> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cp=
u =3D=3D current_cpu)
> Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion f=
ailed: (cpu =3D=3D current_cpu)
> **
> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cp=
u =3D=3D current_cpu)
> Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion f=
ailed: (cpu =3D=3D current_cpu)

And I guess a side effect of this is corrupting QEMU's own memory? I
would have hoped our heap was well away from the guest heap space.

It's a shame the only test cases we have for brk() are specialised ones
for cris and aarch64. This could certainly do with something guarding
the functionality.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

