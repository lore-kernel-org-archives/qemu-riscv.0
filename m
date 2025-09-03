Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123D0CA0FF2
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 17:19:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utr8k-0004zY-HS; Wed, 03 Sep 2025 13:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utr8g-0004z9-JM
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 13:19:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utr8d-0007xv-Ti
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 13:19:18 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24456ce0b96so1361635ad.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756919953; x=1757524753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMiuVffIgpE15VRvxm6M0vZ5A6OdLUBM0JnSzEEV5Os=;
 b=msv8ouQ1a3LxY5eWIJVJmO6+D4zIheBvRC7pSBjlgd5btDPwXKZV/n4kw4A3n5++Yt
 +GvqpTOuLksBO8UiuFoHZFP5wP4N2tqHmeCCb20+DJsXkoFGZXimVacp86u1KJDvcCOH
 Xpb2Ejk9W7hQrCAoKiHEqPHP/2J0Lp7UODQntEb5DpjrO7adwKgx7TDVzj0idUWUpUcw
 I5PKwbwhStA9MsO6FTkmU84qds40akboiT7Gq7loDW1FgKXMgs0kkYuAe1EPkdf180Y+
 KiOn5XG6mNYASRly/+NB704D155vfVT3JqNbPIShaeA5Q4pDTvqGDSD9LXlmW8M90yiM
 jPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756919953; x=1757524753;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMiuVffIgpE15VRvxm6M0vZ5A6OdLUBM0JnSzEEV5Os=;
 b=lmdkoiETXRCLFAhUWzV0KSZvnzu9CuJMMOiRsZWEvhj0co0bbIulkvX4dkxz2fLezY
 M6Hm/8EGkvWD5VRmSRomKv5kic32rO5Cre4jOARhub1jK2MwkT6W0NVg4fyDxdmF5rbc
 mTagBVY/sRWO4bG4TuhySzxjp8br0UVdPqfw+IU6Zq/qJTWbY9qjR3P45/9PZs3W2xHj
 r1XUwTA/O6vhkEALpoiqX4f/pfJIBnaSTzMv6KNGujgGafQ+t9L+ZDJmtF7/lwwTZ/SX
 Squz6dm+gjI2WgFnz0HrVdY3Oywhj5SJE0P9cPwhyJ3x40tI3UdfP3Lm1wHXf/B0VlqX
 GjpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJaUfbk1HOU1OrKMzm2BDNXOjMAegdpO8wy/OkcPvFgyU/YIYxzKjsr40rilW4iWneX6c0HB2xEDm2@nongnu.org
X-Gm-Message-State: AOJu0Ywy0BYP8JsvnG4l63PUaTW+5Obz5bRMGqwskTm5TS6lsonmVU16
 fTGNUVfnNkY2yI4eXrVqpzcLYDoCbauIZZnDanQEaHdFVAnRMC7pJ6CLSLCCZuMm4eI=
X-Gm-Gg: ASbGncsZKrwQ9lqxsFZ0mE3l/qz3J3TZm/GcAQIRZBgCYQ22JS6x0F8Tg+eZWGMnYVG
 4E3AaQhCy7dGgjMkyeTAM+HqSU87wZaBXz82rGbyikFxBiaiU84RRxEuENEpA4rgQE90HQCtwGp
 SKrG+I8cLPpmGbULoW8+yK9f2wTsd2ZQeX3pi7Ibf9iKHR2Ua/lELcatuTInXd+L1x5MWJnLoVn
 ME/zBslvwphSEEU9YuJm5fKUtAbq9e7llfpee8K6qBt32xiOjYcEBE3uMZyo7Zv6la+NmSUrtHD
 H/YrzG8yM+CJvdF0iTEE+B3RySWcGAdKwwc9RcqnZX4pX2n310V7YPsRzmjYpUALuM8lJRh8Xl5
 DdZqS1PXQLPK8D+oHN83SZSZbl5ruFPlk4yJRl3tNW7xRisI=
X-Google-Smtp-Source: AGHT+IFFiIfHyaPkcqhvvUlPRFH2dNcM1d7gNp2tcJTXjm+EwPdIakB4C26rMLekxHA9x3IgsAqR9w==
X-Received: by 2002:a17:902:dac7:b0:24b:1585:6350 with SMTP id
 d9443c01a7336-24b158566c4mr99468175ad.11.1756919953056; 
 Wed, 03 Sep 2025 10:19:13 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903705b91sm167974185ad.12.2025.09.03.10.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 10:19:12 -0700 (PDT)
Message-ID: <5cef4d88-9a4c-42a2-a405-debfe3a61497@ventanamicro.com>
Date: Wed, 3 Sep 2025 14:19:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Fix IALIGN check in misa write
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org, Chao Liu <chao.liu@zevorn.cn>,
 Nicholas Joaquin <njoaquin@tenstorrent.com>,
 Ganesh Valliappan <gvalliappan@tenstorrent.com>
References: <20250903030114.274535-1-npiggin@gmail.com>
 <20250903030114.274535-2-npiggin@gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250903030114.274535-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/3/25 12:01 AM, Nicholas Piggin wrote:
> The instruction alignment check for the C extension was inverted.
> The new value should be checked for C bit clear (thus increasing
> IALIGN). If IALIGN is incompatible, then the write to misa should
> be suppressed, not just ignoring the update to the C bit.
> 
>  From the ISA:
> 
>    Writing misa may increase IALIGN, e.g., by disabling the "C"
>    extension. If an instruction that would write misa increases IALIGN,
>    and the subsequent instruction’s address is not IALIGN-bit aligned,
>    the write to misa is suppressed, leaving misa unchanged.
> 
> This was found with a verification test generator based on RiESCUE.
> 
> Reported-by: Nicholas Joaquin <njoaquin@tenstorrent.com>
> Reported-by: Ganesh Valliappan <gvalliappan@tenstorrent.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Fixes: f18637cd61 ("RISC-V: Add misa runtime write support")

> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c                        | 16 ++++-
>   tests/tcg/riscv64/Makefile.softmmu-target |  5 ++
>   tests/tcg/riscv64/misa-ialign.S           | 88 +++++++++++++++++++++++
>   3 files changed, 106 insertions(+), 3 deletions(-)
>   create mode 100644 tests/tcg/riscv64/misa-ialign.S
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8842e07a73..64b55b7add 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2140,9 +2140,19 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>       /* Mask extensions that are not supported by this hart */
>       val &= env->misa_ext_mask;
>   
> -    /* Suppress 'C' if next instruction is not aligned. */
> -    if ((val & RVC) && (get_next_pc(env, ra) & 3) != 0) {
> -        val &= ~RVC;
> +    /*
> +     * misa writes that increase IALIGN beyond alignment of the next
> +     * instruction cause the write to misa to be suppressed. Clearing
> +     * "C" extension increases IALIGN.
> +     */
> +    if (!(val & RVC) && (get_next_pc(env, ra) & 3) != 0) {
> +        /*
> +         * If the next instruction is unaligned mod 4 then "C" must be
> +         * set or this instruction could not be executing, so we know
> +         * this is is clearing "C" (and not just keeping it clear).
> +         */
> +        g_assert(env->misa_ext & RVC);
> +        return RISCV_EXCP_NONE;
>       }
>   
>       /* Disable RVG if any of its dependencies are disabled */
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> index 3ca595335d..6e470a028f 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -24,5 +24,10 @@ EXTRA_RUNS += run-test-mepc-masking
>   run-test-mepc-masking: test-mepc-masking
>   	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
>   
> +EXTRA_RUNS += run-misa-ialign
> +run-misa-ialign: QEMU_OPTS := -cpu rv64,c=true,v=true,x-misa-w=on $(QEMU_OPTS)
> +run-misa-ialign: misa-ialign
> +	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
> +
>   # We don't currently support the multiarch system tests
>   undefine MULTIARCH_TESTS
> diff --git a/tests/tcg/riscv64/misa-ialign.S b/tests/tcg/riscv64/misa-ialign.S
> new file mode 100644
> index 0000000000..7f1eb30023
> --- /dev/null
> +++ b/tests/tcg/riscv64/misa-ialign.S
> @@ -0,0 +1,88 @@
> +/*
> + * Test for MISA changing C and related IALIGN alignment cases
> + *
> + * This test verifies that the "C" extension can be cleared and set in MISA,
> + * that a branch to 2-byte aligned instructions can be executed when "C" is
> + * enabled, and that a write to MISA which would increase IALIGN and cause
> + * the next instruction to be unaligned is ignored.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#define RVC (1 << ('C'-'A'))
> +#define RVV (1 << ('V'-'A'))
> +
> +.option norvc
> +	.text
> +	.global _start
> +_start:
> +	lla	t0, trap
> +	csrw	mtvec, t0
> +
> +	csrr	t0, misa
> +	li	t1, RVC
> +	not	t1, t1
> +	and	t0, t0, t1
> +	csrw	misa, t0
> +	csrr	t1, misa
> +	li	a0, 2 # fail code
> +	bne	t0, t1, _exit # Could not clear RVC in MISA
> +
> +	li	t1, RVC
> +	or	t0, t0, t1
> +	csrw	misa, t0
> +	csrr	t1, misa
> +	li	a0, 3 # fail code
> +	bne	t0, t1, _exit # Could not set RVC in MISA
> +
> +	j	unalign
> +. = . + 2
> +unalign:
> +
> +	li	t1, RVC
> +	not	t1, t1
> +	and	t0, t0, t1
> +	csrw	misa, t0
> +	csrr	t1, misa
> +	li	a0, 4 # fail code
> +	beq	t0, t1, _exit # Was able to clear RVC in MISA
> +
> +	li	t0, (RVC|RVV)
> +	not	t0, t0
> +	and	t0, t0, t1
> +	csrw	misa, t0
> +	csrr	t0, misa
> +	li	a0, 5 # fail code
> +	bne	t0, t1, _exit # MISA write was not ignored (RVV was cleared)
> +
> +	j	realign
> +. = . + 2
> +realign:
> +
> +	# Success!
> +	li	a0, 0
> +	j	_exit
> +
> +trap:
> +	# Any trap is a fail code 1
> +	li	a0, 1
> +
> +# Exit code in a0
> +_exit:
> +	lla	a1, semiargs
> +	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
> +	sd	t0, 0(a1)
> +	sd	a0, 8(a1)
> +	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
> +
> +	# Semihosting call sequence
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.data
> +	.balign	16
> +semiargs:
> +	.space	16


