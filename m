Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ACFC30658
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 06:18:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMLzF-0002xq-Kx; Wed, 26 Jun 2024 02:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sMLzD-0002wF-6r
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 02:18:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sMLzB-0004U2-5z
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 02:18:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2c84df0e2f4so164780a91.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1719382708; x=1719987508; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tvUTObrGOWvExnyGQx06hi8Y7BPevujINPwzFh0TAj4=;
 b=IWniDszAHUDUta2OrJJrMC6e7J35AM6i8L9LzPNQx1Tz4kTBcWTwKxTJ7P7n/nHdag
 1DdzB54HuWUFDwZTf8MgKcDK40aOSXUAWwH4OeWjUPAASeohRDyAfjqyLTHtbz0Z2pwJ
 hxfiZZ0BlRZZx0oGyp1FG8TKRxUlN+/7X4k8FENsZVLzdow6Zn2zf65Um3z/zeqBF7zQ
 uqDOAI9xcyyn3cIRuDBlgilqniNa3h4aZRwaxVlWEhy80hzpcIb0/nif7RGy9jC1uBKO
 psV2pHPDUDPsI+VB7MTd5yLWT+4rrDWph7stN0NjuD9RHuwK2NhXGC37Q6WpXnFY0jWF
 wsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719382708; x=1719987508;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvUTObrGOWvExnyGQx06hi8Y7BPevujINPwzFh0TAj4=;
 b=XGvygPrMS7IsK73a2cdPit/vytx+mMZkwaedNq00p8c7ngDtRNc0zrXQvJL54ntYGv
 GD9qMOzED3AR30JBoqkpXKfeTEj75JCF/gkGpRZNj6em/ieFIdqdx80CBmp5oWMnbmSD
 tq+tMUKGk1DGrVL7N5420fzQ2lFdNJn8nPUeXpmb/bjlcIuvuCCjpEFF00SOXOpM4KR9
 ZZ58kGSk5ePcuV93/WAw5ijFuLALVCtHzd7+rt0d975+fwYukPYiEuKPB7FL3AFuljDf
 xEEwvli3RJ25XUkyvKj/tbPJeCgIZnqxcVF3s8SDJRHsgSSdnOX4ha+P6JLyvR7ULCqN
 mV0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvm4ixh1UmxYV/eY9R1IJNMlCRl02sh5c65FE5utuYg1jnE2lqjBHhZiSXjnQyp1IwS4LNa8bmERMlruLBtZkxNFlcmYM=
X-Gm-Message-State: AOJu0YwAXRdqxDiOchJ/Yl+jP3uAqr0fBoxRi/bNpXvb3W5Uzw25kOrb
 YsZyG6yu9OovegspX5uuacXwViPmXBdiRjis7IhF+/O1g2vremeQQP61Eci0GdBl5yZag+KwtGP
 nF5s=
X-Google-Smtp-Source: AGHT+IHdY8trCm3uHD6vNaCxZnpglw7JKHmnG0scdIiHcQWng2WZqxHcE2nbPFIPIP0URSwWhg3nig==
X-Received: by 2002:a17:90b:118:b0:2c8:dc37:6257 with SMTP id
 98e67ed59e1d1-2c8dc376680mr987904a91.34.1719382707458; 
 Tue, 25 Jun 2024 23:18:27 -0700 (PDT)
Received: from [192.168.100.252] (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d7e5910fsm763725a91.11.2024.06.25.23.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 23:18:27 -0700 (PDT)
Message-ID: <d459e281-9f7d-4c6a-abbb-9f36fb9212f4@sifive.com>
Date: Wed, 26 Jun 2024 14:18:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] target/riscv: Add support for Control Transfer
 Records Ext.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 tech-control-transfer-records@lists.riscv.org
References: <20240619152708.135991-1-rkanwal@rivosinc.com>
Content-Language: en-US
From: Jason Chien <jason.chien@sifive.com>
In-Reply-To: <20240619152708.135991-1-rkanwal@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x102f.google.com
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

Hi Rajnesh,

On 2024/6/19 下午 11:27, Rajnesh Kanwal wrote:
> This series enables Control Transfer Records extension support on riscv
> platform. This extension is similar to Arch LBR in x86 and BRBE in ARM.
> The Extension has been stable and the latest release can be found here [0]
>
> CTR extension depends on couple of other extensions:
>
> 1. S[m|s]csrind : The indirect CSR extension [1] which defines additional
>     ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
>     RISC-V CSR address space. CTR access ctrsource, ctrtartget and ctrdata
>     CSRs using sscsrind extension.
There is no dependency on Smcsrind.
>
> 2. Smstateen: The mstateen bit[54] controls the access to the CTR ext to
>     S-mode.
This bit is missing in write_mstateen0(), write_mstateen0h(), 
write_hstateen0() and write_hstateen0h().
>
> 3. Sscofpmf: Counter overflow and privilege mode filtering. [2]
>
> The series is based on Smcdeleg/Ssccfg counter delegation extension [3]
> patches. CTR itself doesn't depend on counter delegation support. This
> rebase is basically to include the Smcsrind patches.
>
> Due to the dependency of these extensions, the following extensions must be
> enabled to use the control transfer records feature.
>
> "smstateen=true,sscofpmf=true,smcsrind=true,sscsrind=true,smctr=true,ssctr=true"
>
> Here is the link to a quick guide [5] to setup and run a basic perf demo on
> Linux to use CTR Ext.
>
> The Qemu patches can be found here:
> https://github.com/rajnesh-kanwal/qemu/tree/ctr_upstream_v2
>
> The opensbi patch can be found here:
> https://github.com/rajnesh-kanwal/opensbi/tree/ctr_upstream_v2
>
> The Linux kernel patches can be found here:
> https://github.com/rajnesh-kanwal/linux/tree/ctr_upstream_v2
>
> [0]: https://github.com/riscv/riscv-control-transfer-records/release
> [1]: https://github.com/riscv/riscv-indirect-csr-access
> [2]: https://github.com/riscvarchive/riscv-count-overflow/tree/main
> [3]: https://github.com/riscv/riscv-smcdeleg-ssccfg
> [4]: https://lore.kernel.org/all/20240217000134.3634191-1-atishp@rivosinc.com/
> [5]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-QEMU-RISC%E2%80%90V-Virt-machine
>
> Changelog:
>
> v2: Lots of improvements based on Jason Chien's feedback including:
Thank you for mentioning my name!
>    - Added CTR recording for cm.jalt, cm.jt, cm.popret, cm.popretz.
>    - Fixed and added more CTR extension enable checks.
>    - Fixed CTR CSR predicate functions.
>    - Fixed external trap xTE bit checks.
>    - One fix in freeze function for VS-mode.
>    - Lots of minor code improvements.
>    - Added checks in sctrclr instruction helper.
>
> v1:
>    - https://github.com/rajnesh-kanwal/qemu/tree/ctr_upstream
>
>
> Rajnesh Kanwal (6):
>    target/riscv: Remove obsolete sfence.vm instruction
>    target/riscv: Add Control Transfer Records CSR definitions.
>    target/riscv: Add support for Control Transfer Records extension CSRs.
>    target/riscv: Add support to record CTR entries.
>    target/riscv: Add CTR sctrclr instruction.
>    target/riscv: Add support to access ctrsource, ctrtarget, ctrdata
>      regs.
>
>   target/riscv/cpu.c                            |   4 +
>   target/riscv/cpu.h                            |  14 +
>   target/riscv/cpu_bits.h                       | 154 ++++++++++
>   target/riscv/cpu_cfg.h                        |   2 +
>   target/riscv/cpu_helper.c                     | 265 +++++++++++++++++
>   target/riscv/csr.c                            | 276 +++++++++++++++++-
>   target/riscv/helper.h                         |   9 +-
>   target/riscv/insn32.decode                    |   2 +-
>   .../riscv/insn_trans/trans_privileged.c.inc   |  21 +-
>   target/riscv/insn_trans/trans_rvi.c.inc       |  31 ++
>   target/riscv/insn_trans/trans_rvzce.c.inc     |  20 ++
>   target/riscv/op_helper.c                      | 159 +++++++++-
>   target/riscv/tcg/tcg-cpu.c                    |   6 +
>   target/riscv/translate.c                      |  10 +
>   14 files changed, 960 insertions(+), 13 deletions(-)
>

