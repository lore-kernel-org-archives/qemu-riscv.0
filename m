Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2DFC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:46:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDPYi-0004Ey-7M; Wed, 13 Dec 2023 08:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDPYb-00049x-LU; Wed, 13 Dec 2023 08:45:52 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rDPYZ-0006xY-NL; Wed, 13 Dec 2023 08:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RQNtx23A0xZ6yY84siI0xv3MruEvbwc7elg0gTVjf1g=; b=TQX2UyhM66VRgwWelyHyiqcBWo
 erepDb7g+bRr/LxftvSJJfVkp01PlG+fU6vMak8oA45KgGnOdFQnBhZofR1Ho01cu7CdBX0AQ6ozl
 1oKlp1NxnLT3PyiPfK4gN8txaBqnmhE6S2c8NHhkNwUZeFmRCAmxZhGMB95t5VNEk4zM=;
Date: Wed, 13 Dec 2023 14:45:34 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Brian Cain <bcain@quicinc.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 16/23] exec: Move [b]tswapl() declarations to
 'exec/user/tswap-target.h'
Message-ID: <vp7ww4t42h2da6pwozr6l4kgsrhslrrlncirb2jnd42mrj2p6c@aua4egifp56j>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-17-philmd@linaro.org>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 12/12/23, Philippe Mathieu-Daudé wrote:
> tswapl() and bswaptls() are target-dependent and only used
> by user emulation. Move their definitions to a new header:
> "exec/user/tswap-target.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  bsd-user/freebsd/target_os_elf.h   |  1 +
>  bsd-user/freebsd/target_os_stack.h |  1 +
>  bsd-user/netbsd/target_os_elf.h    |  1 +
>  bsd-user/openbsd/target_os_elf.h   |  1 +
>  include/exec/cpu-all.h             |  8 --------
>  include/exec/user/abitypes.h       |  1 +
>  include/exec/user/tswap-target.h   | 22 ++++++++++++++++++++++
>  bsd-user/signal.c                  |  1 +
>  bsd-user/strace.c                  |  1 +
>  linux-user/elfload.c               |  1 +
>  linux-user/i386/signal.c           |  1 +
>  linux-user/ppc/signal.c            |  1 +
>  12 files changed, 32 insertions(+), 8 deletions(-)
>  create mode 100644 include/exec/user/tswap-target.h
> 
> diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
> index 9df17d56d8..27d8ce036c 100644
> --- a/bsd-user/freebsd/target_os_elf.h
> +++ b/bsd-user/freebsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  #define bsd_get_ncpu() 1 /* until we pull in bsd-proc.[hc] */
>  
> diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
> index d15fc3263f..6125208182 100644
> --- a/bsd-user/freebsd/target_os_stack.h
> +++ b/bsd-user/freebsd/target_os_stack.h
> @@ -23,6 +23,7 @@
>  #include <sys/param.h>
>  #include "target_arch_sigtramp.h"
>  #include "qemu/guest-random.h"
> +#include "exec/user/tswap-target.h"
>  
>  /*
>   * The initial FreeBSD stack is as follows:
> diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
> index 2f3cb20871..23b422bfce 100644
> --- a/bsd-user/netbsd/target_os_elf.h
> +++ b/bsd-user/netbsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* this flag is uneffective under linux too, should be deleted */
>  #ifndef MAP_DENYWRITE
> diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
> index 6dca9c5a85..fc1dfa2e49 100644
> --- a/bsd-user/openbsd/target_os_elf.h
> +++ b/bsd-user/openbsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* this flag is uneffective under linux too, should be deleted */
>  #ifndef MAP_DENYWRITE
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index b042d94892..95af418920 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -36,14 +36,6 @@
>  #define BSWAP_NEEDED
>  #endif
>  
> -#if TARGET_LONG_SIZE == 4
> -#define tswapl(s) tswap32(s)
> -#define bswaptls(s) bswap32s(s)
> -#else
> -#define tswapl(s) tswap64(s)
> -#define bswaptls(s) bswap64s(s)
> -#endif
> -
>  /* Target-endianness CPU memory access functions. These fit into the
>   * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
>   */
> diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
> index 6178453d94..ed10d5fe7e 100644
> --- a/include/exec/user/abitypes.h
> +++ b/include/exec/user/abitypes.h
> @@ -2,6 +2,7 @@
>  #define EXEC_USER_ABITYPES_H
>  
>  #include "cpu.h"
> +#include "exec/user/tswap-target.h"
>  
>  #ifdef TARGET_ABI32
>  #define TARGET_ABI_BITS 32
> diff --git a/include/exec/user/tswap-target.h b/include/exec/user/tswap-target.h
> new file mode 100644
> index 0000000000..ff302436fe
> --- /dev/null
> +++ b/include/exec/user/tswap-target.h
> @@ -0,0 +1,22 @@
> +/*
> + * target-specific swap() definitions
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +#ifndef EXEC_USER_TSWAP_H
> +#define EXEC_USER_TSWAP_H
> +
> +#include "exec/cpu-defs.h"
> +#include "exec/tswap.h"
> +
> +#if TARGET_LONG_SIZE == 4
> +#define tswapl(s) tswap32(s)
> +#define bswaptls(s) bswap32s(s)
> +#else
> +#define tswapl(s) tswap64(s)
> +#define bswaptls(s) bswap64s(s)
> +#endif
> +
> +#endif
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ca31470772..7b2d25230a 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  #include "gdbstub/user.h"
>  #include "signal-common.h"
>  #include "trace.h"
> diff --git a/bsd-user/strace.c b/bsd-user/strace.c
> index 96499751eb..a1b738e63c 100644
> --- a/bsd-user/strace.c
> +++ b/bsd-user/strace.c
> @@ -22,6 +22,7 @@
>  #include <sys/ioccom.h>
>  
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  
>  #include "os-strace.h"  /* OS dependent strace print functions */
>  
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index cf9e74468b..debea5c355 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -6,6 +6,7 @@
>  #include <sys/shm.h>
>  
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "loader.h"
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index bc5d45302e..eea1fa68c9 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -21,6 +21,7 @@
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "linux-user/trace.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
>  
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 7e7302823b..988b59a916 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -21,6 +21,7 @@
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "linux-user/trace.h"
> +#include "exec/user/tswap-target.h"
>  #include "vdso-asmoffset.h"
>  
>  /* See arch/powerpc/include/asm/ucontext.h.  Only used for 32-bit PPC;
> -- 
> 2.41.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>

