Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD1EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 10:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGddm-0000n8-U4; Tue, 04 Jul 2023 06:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qGddm-0000jB-2m; Tue, 04 Jul 2023 06:52:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>)
 id 1qGddk-0000hG-Cl; Tue, 04 Jul 2023 06:52:13 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 89A62204E5;
 Tue,  4 Jul 2023 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688467930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7kGrvwvyg0YBvAnAnF9+dRSX8rVW49G9bBFcDZsAtL4=;
 b=fZumZGOGOdA5iPK0q0WuNQPw+WgnGe89fJ4/QnInMQX+K6wnc+lTJ0GqzMacmUiaqgTZQ4
 Nc2qZ1ollfVBu1zH9z89Sj1kEG+J3ZNiJrUn4wEbl2hDlgCscl3LS///29KyU8Rf9ijgCS
 sNo74ab4M8mTYLcIPSxT5V0+f3692o8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688467930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7kGrvwvyg0YBvAnAnF9+dRSX8rVW49G9bBFcDZsAtL4=;
 b=K8AmL7bd+uMM9RclcLWP+CuLQ7Nql/nAWk1aFHJY5UZG25mEU0u+1hvCXW+bEp3Hxqrs72
 baJoYN8WI8NaEBBw==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id F0C292C15A;
 Tue,  4 Jul 2023 10:52:09 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
 id D8CF54AAD7C; Tue,  4 Jul 2023 12:52:09 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Helge Deller <deller@gmx.de>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Bin Meng
 <bin.meng@windriver.com>,  qemu-riscv@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [RISC-V] ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp:
 assertion failed: (cpu == current_cpu)
In-Reply-To: <mvm5y71tbdo.fsf@suse.de> (Andreas Schwab's message of "Mon, 03
 Jul 2023 14:42:11 +0200")
References: <mvmmt0dtosg.fsf@suse.de> <mvma5wdtdiw.fsf@suse.de>
 <87h6qli4au.fsf@linaro.org> <mvm5y71tbdo.fsf@suse.de>
X-Yow: Where's the Coke machine?  Tell me a joke!!
Date: Tue, 04 Jul 2023 12:52:09 +0200
Message-ID: <mvmlefwrlt2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=schwab@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I think the issue is that the value returned from brk(0) is no longer
page aligned.

$ ./qemu-riscv64 -strace ../exe1 
18329 brk(NULL) = 0x0000000000303000
18329 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) = -1 errno=2 (No such file or directory)
18329 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) = 3
18329 newfstatat(3,"",0x00000040007fe900,0x1000) = 0
18329 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) = 0x0000004000824000
18329 close(3) = 0
18329 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) = 3
18329 read(3,0x7fea70,832) = 832
18329 newfstatat(3,"",0x00000040007fe8f0,0x1000) = 0
18329 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,0) = 0x0000004000827000
18329 mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_DENYWRITE|MAP_FIXED,3,0x146000) = 0x000000400096d000
18329 mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED,-1,0) = 0x0000004000972000
18329 close(3) = 0
18329 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0) = 0x000000400097f000
18329 set_tid_address(0x400097f710) = 18329
18329 set_robust_list(0x400097f720,24) = -1 errno=38 (Function not implemented)
18329 mprotect(0x000000400096d000,12288,PROT_READ) = 0
18329 mprotect(0x0000004000820000,4096,PROT_READ) = 0
18329 prlimit64(0,RLIMIT_STACK,NULL,0x00000040007ff4f8) = 0 ({rlim_cur=8388608,rlim_max=-1})
18329 munmap(0x0000004000824000,8799) = 0
18329 newfstatat(1,"",0x00000040007ff658,0x1000) = 0
18329 getrandom(0x4000976a40,8,1) = 8
18329 brk(NULL) = 0x0000000000303000
18329 brk(0x0000000000324000) = 0x0000000000324000
18329 write(1,0x3032a0,12)Hello world
 = 12
18329 exit_group(0)
$ qemu-riscv64 -strace ../exe1 
18369 brk(NULL) = 0x00000000003022e8
18369 faccessat(AT_FDCWD,"/etc/ld.so.preload",R_OK,0x3010d0) = -1 errno=2 (No such file or directory)
18369 openat(AT_FDCWD,"/etc/ld.so.cache",O_RDONLY|O_CLOEXEC) = 3
18369 newfstatat(3,"",0x00000040007fe8f0,0x1000) = 0
18369 mmap(NULL,8799,PROT_READ,MAP_PRIVATE,3,0) = 0x0000004000824000
18369 close(3) = 0
18369 openat(AT_FDCWD,"/lib64/lp64d/libc.so.6",O_RDONLY|O_CLOEXEC) = 3
18369 read(3,0x7fea60,832) = 832
18369 newfstatat(3,"",0x00000040007fe8e0,0x1000) = 0
18369 mmap(NULL,1405128,PROT_EXEC|PROT_READ,MAP_PRIVATE|MAP_DENYWRITE,3,0) = 0x0000004000827000
18369 mmap(0x000000400096d000,20480,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_DENYWRITE|MAP_FIXED,3,0x146000) = 0x000000400096d000
18369 mmap(0x0000004000972000,49352,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED,-1,0) = 0x0000004000972000
18369 close(3) = 0
18369 mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0) = 0x000000400097f000
18369 set_tid_address(0x400097f710) = 18369
18369 set_robust_list(0x400097f720,24) = -1 errno=38 (Function not implemented)
18369 mprotect(0x000000400096d000,12288,PROT_READ) = 0
18369 mprotect(0x0000004000820000,4096,PROT_READ) = 0
18369 prlimit64(0,RLIMIT_STACK,NULL,0x00000040007ff4e8) = 0 ({rlim_cur=8388608,rlim_max=-1})
18369 munmap(0x0000004000824000,8799) = 0
18369 newfstatat(1,"",0x00000040007ff648,0x1000) = 0
18369 getrandom(0x4000976a40,8,1) = 8
18369 brk(NULL) = 0x00000000003022e8
18369 brk(0x00000000003232e8)**
ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)
Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)
**
ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)
Bail out! ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

