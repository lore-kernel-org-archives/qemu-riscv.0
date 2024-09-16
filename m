Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E739C3ABA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 11:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqABN-0002wc-7v; Mon, 16 Sep 2024 07:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sqABH-0002jc-58
 for qemu-riscv@nongnu.org; Mon, 16 Sep 2024 07:46:12 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sqABC-0005TE-4z
 for qemu-riscv@nongnu.org; Mon, 16 Sep 2024 07:46:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-206e614953aso42985225ad.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Sep 2024 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1726487162; x=1727091962; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tke0RvyTDDTVBrzp6vWBuDMRSH0wP+0EwIzfREkDLbg=;
 b=cBANUOqWybLTvqCi/UxiURVaANpuCRMV4lB7xchKrbyIIefpYYyLoQcVpDtAkLPIct
 fdHcfV0LmgFxGHE2hgANGmKUChRwQN/ki/xRLBRJoH9dhd4gAEbg545NRFNXfChGKXMT
 k+WOqlFN+k+9Zn/q5OdMPEM7ennr3nBjwRhXMZoOLqOAb36dHurKtJ35mP2+n+rbdPHz
 6EGxIndpLPWO+wxYoLX4YRdoLjGUr7h9wqzo4sAjZJSH4tFmd2pW7fsYswCiRTHsNP/R
 AoPoACrlZcJfT6E8+RZLuXLg7oQrjyZIiBHT/fWsgpxau4YSGZI3sX+Zy/1VuHY+xrtW
 v4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726487162; x=1727091962;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tke0RvyTDDTVBrzp6vWBuDMRSH0wP+0EwIzfREkDLbg=;
 b=TWb+B1255FWJb3iL1mBf6fWnSlclklS6+HFESYuw3fu+oS9DnffIy23hhBMCL4mkm1
 01mdOV80X1oudxdYfWsUMTYd4QVyxXjndWk5tRD9BPRQKWr53qQyPUAggww8bi5aeEbL
 S7SmCb8DJj54kPPy+WmLgO9Zt8Ly+aj+tr8N13yIztBdZs4QrjjWFT4Y/zVqyunB/Dxf
 XWIj8j0x74on7NatezkCYwo83iTbPLFPytQyAooqEVRpxcXuootlUXSNS1OkO00t587d
 mEn27d1r920xXI3lND3PBr8rBrnJJHIArMzCGIAtK3oJxUwOKoPNWZsXI+SneMF2YA/f
 DfgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuDs4RsL6e1eCC8GvJzy4ILDkZ0Bc8nR/K6NEA7EdOdtAzXYHrvkgKs/HCJUGItOgc0MYp5nhFHdud@nongnu.org
X-Gm-Message-State: AOJu0Yx6fpvjc+acjqTml9M3XtX6iarD5rEB1PDJ/9tuXjdKSmzQQmw8
 NYbl1SNys4XfLLOXi9O8FS9LNzYsEsfNmbBfhp9KxM5U+ZFEBbcbns1qv6NTDBU=
X-Google-Smtp-Source: AGHT+IGwYQOLLagntUB1A4EWi9OsNB239ajo/q9FJ0dg8m8+9yDM5MnVLaBorz2ycM6A41OhGngRDQ==
X-Received: by 2002:a17:902:ce84:b0:205:6596:9dc7 with SMTP id
 d9443c01a7336-2076e463a12mr194443285ad.58.1726487162070; 
 Mon, 16 Sep 2024 04:46:02 -0700 (PDT)
Received: from [192.168.68.110] (201-68-240-33.dsl.telesp.net.br.
 [201.68.240.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207945da8dfsm34705815ad.46.2024.09.16.04.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:46:01 -0700 (PDT)
Message-ID: <a3c8dc7f-f257-41a8-9fb3-50389052f2e9@ventanamicro.com>
Date: Mon, 16 Sep 2024 08:45:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/17] bsd-user: Comprehensive RISCV Support
To: Ajeet Singh <itachis6234@gmail.com>, qemu-devel@nongnu.org
Cc: Mark Corbin <mark@dibsco.co.uk>, Warner Losh <imp@bsdimp.com>,
 Ajeet Singh <itachis@FreeBSD.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20240915152554.8394-1-itachis@FreeBSD.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240915152554.8394-1-itachis@FreeBSD.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

Please CC the RISC-V maintainer (Alistair, that I just CCed in this reply) in all RISC-V
related patches. It would be nice to also CC qemu-riscv@nongnu.org to get more visibility
from the RISC-V developers too.


This series won't build in a FreeBSD x86_64 host:

In file included from ../bsd-user/main.c:53:
../bsd-user/riscv/target_arch_cpu.h:126:13: error: call to undeclared function 'force_sig_fault'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   126 |             force_sig_fault(signo, code, env->pc);
       |             ^
../bsd-user/riscv/target_arch_cpu.h:129:9: error: call to undeclared function 'process_pending_signals'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   129 |         process_pending_signals(env);
       |         ^
../bsd-user/main.c:608:5: error: call to undeclared function 'signal_init'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   608 |     signal_init();
       |     ^
3 errors generated.


You're missing the following header in patch 2:


diff --git a/bsd-user/riscv/target_arch_cpu.h b/bsd-user/riscv/target_arch_cpu.h
index 57abfbd556..a93ea3915a 100644
--- a/bsd-user/riscv/target_arch_cpu.h
+++ b/bsd-user/riscv/target_arch_cpu.h
@@ -21,6 +21,7 @@
  #define TARGET_ARCH_CPU_H
  
  #include "target_arch.h"
+#include "signal-common.h"
  
  #define TARGET_DEFAULT_CPU_MODEL "max"


Please CC dbarboza@ventanamicro.com in the v7 because I'll compile test this series to avoid
another pipeline fail that will hold the upstreaming of everything else.



Thanks,


Daniel


On 9/15/24 12:25 PM, Ajeet Singh wrote:
> Key Changes Compared to Version 5:
> In target_arch_sigtramp.h removed static const,
> as there was a compile-time constant issue
> 
> Mark Corbin (15):
>    bsd-user: Implement RISC-V CPU initialization and main loop
>    bsd-user: Add RISC-V CPU execution loop and syscall handling
>    bsd-user: Implement RISC-V CPU register cloning and reset functions
>    bsd-user: Implement RISC-V TLS register setup
>    bsd-user: Add RISC-V ELF definitions and hardware capability detection
>    bsd-user: Define RISC-V register structures and register copying
>    bsd-user: Add RISC-V signal trampoline setup function
>    bsd-user: Implement RISC-V sysarch system call emulation
>    bsd-user: Add RISC-V thread setup and initialization support
>    bsd-user: Define RISC-V VM parameters and helper functions
>    bsd-user: Define RISC-V system call structures and constants
>    bsd-user: Define RISC-V signal handling structures and constants
>    bsd-user: Implement RISC-V signal trampoline setup functions
>    bsd-user: Implement 'get_mcontext' for RISC-V
>    bsd-user: Implement set_mcontext and get_ucontext_sigreturn for RISCV
> 
> Warner Losh (2):
>    bsd-user: Add generic RISC-V64 target definitions
>    bsd-user: Add RISC-V 64-bit Target Configuration and Debug XML Files
> 
>   bsd-user/riscv/signal.c               | 170 ++++++++++++++++++++++++++
>   bsd-user/riscv/target.h               |  20 +++
>   bsd-user/riscv/target_arch.h          |  27 ++++
>   bsd-user/riscv/target_arch_cpu.c      |  29 +++++
>   bsd-user/riscv/target_arch_cpu.h      | 147 ++++++++++++++++++++++
>   bsd-user/riscv/target_arch_elf.h      |  42 +++++++
>   bsd-user/riscv/target_arch_reg.h      |  88 +++++++++++++
>   bsd-user/riscv/target_arch_signal.h   |  75 ++++++++++++
>   bsd-user/riscv/target_arch_sigtramp.h |  41 +++++++
>   bsd-user/riscv/target_arch_sysarch.h  |  41 +++++++
>   bsd-user/riscv/target_arch_thread.h   |  47 +++++++
>   bsd-user/riscv/target_arch_vmparam.h  |  53 ++++++++
>   bsd-user/riscv/target_syscall.h       |  38 ++++++
>   configs/targets/riscv64-bsd-user.mak  |   4 +
>   14 files changed, 822 insertions(+)
>   create mode 100644 bsd-user/riscv/signal.c
>   create mode 100644 bsd-user/riscv/target.h
>   create mode 100644 bsd-user/riscv/target_arch.h
>   create mode 100644 bsd-user/riscv/target_arch_cpu.c
>   create mode 100644 bsd-user/riscv/target_arch_cpu.h
>   create mode 100644 bsd-user/riscv/target_arch_elf.h
>   create mode 100644 bsd-user/riscv/target_arch_reg.h
>   create mode 100644 bsd-user/riscv/target_arch_signal.h
>   create mode 100644 bsd-user/riscv/target_arch_sigtramp.h
>   create mode 100644 bsd-user/riscv/target_arch_sysarch.h
>   create mode 100644 bsd-user/riscv/target_arch_thread.h
>   create mode 100644 bsd-user/riscv/target_arch_vmparam.h
>   create mode 100644 bsd-user/riscv/target_syscall.h
>   create mode 100644 configs/targets/riscv64-bsd-user.mak
> 

