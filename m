Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C310C83F03
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 21:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uXR9J-00086h-RK; Thu, 03 Jul 2025 17:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXR9I-00086N-QV
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 17:07:16 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXR9G-0004ol-Ud
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 17:07:16 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7d3cc0017fdso30371085a.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Jul 2025 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751576834; x=1752181634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yAnY07EyCL8o9fgGf3cdrQzSE/PJTZzAdTm7kISpcB4=;
 b=JFku90Oil8dpINln/tl7ky/TJosWN4h/Fbrv4kxqiHpxZCeUmOxZ7/NNFFL3ptTlLW
 OPjzqZII4/CnENZ8qhurBPtwGI4Za6f3oXolwvrXPEVnwLNyIYBSsolBZuKGK5rSr1Z8
 t9npBlIfwZKaOaP0ZTAyZc2AAReszSSATCPBySAlcNJ2WnAhlNFG98wHMocf8HoRJAwN
 tz+/x2BLwfXMh9LynSKtgFfAQpCwxxejI9vC9aW2ciPgvEljXGd7c/NZDBlXyVBaTHkH
 VMwMANUsM/5CB9hPe5chvknT+d+4USht6/imKistCjUWx1Af2etxlKrUrMUU/dndMCID
 Dlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751576834; x=1752181634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yAnY07EyCL8o9fgGf3cdrQzSE/PJTZzAdTm7kISpcB4=;
 b=eAEVYE/ZQb8ucIOT4pNgwGOyqX0Qod07Ff6lSQWtPRL4KFqdQtyxRdxQUZcOyvgQpY
 /GAQEk0tNvhyo+OU4r3/KA7/Lc7uyreHWuHYKK341c6929rs4NJq2p3fpqG5wBkJz6OR
 bDL52tLjDcrjTE5q352ncAELh+nA7zd3duuDKKWdqxaaMY5+BEJaCmh/gvtZ5XcOlmVe
 pVcNzyJdgc0g69y6oXWZzybl1Jjxp5+TVVqf6EsitOEHWQvGiJHgzysSMjS15DzsBdxj
 WRVU47/pVqDL+xqn19R/w9wFK69bZ94nv3jiz4tRwnk4D0NwejrVTn3M1zr8diIEKtjF
 zD2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaO+W5vexo03wJ0DOqjYRV3hbFK2Ax5Ezmf/9qK83WBYMFYB7LGA37eUME6YQIJMK/tlTQLKjDTUW8@nongnu.org
X-Gm-Message-State: AOJu0Yy2kqT+uhJBLeO9XvSFI+3h7pNm6llAm9rDSIrZDdKKKuDBeLQI
 oaecVUoXt5izrLbBbAJAnDLM6RBdtfkviahxcp7fL2bVeOnVKYkqa9N6uPRDv4wbqAPDAJ2ZQPC
 EDMZh
X-Gm-Gg: ASbGncsf9+bm+mW2GW4KKPukr5K3c0b5SviAvXHcGyqTWV0EmKpAQnD50GhF8dAXQJP
 WvKWhi82jf/OJNDJsZqrlLdCGabNfif7c4Qws+MCSy8HK7RmB3+V43UtDHGFf7fYVhPNfdMqE/a
 il3JcYrsH2lTgy49pSBj1GKK+reFTFJiH96+MQSrXvCqfDmOsUwZXqmWJFH/8p96y+gOCeeXnC1
 oB4Wier0b/xPt8EVvkQTgXMyvXOj86PGhn/mc8zc9aJfYWuoy2YesUvzGXPzQrDleCLtftCFID3
 xKETvKqd6FHdr3s2y8wuGZiKpRg70bTRzt+df3ySlGwg4x/Hxx5Nw1KT42p85QeD2zsiFEdALip
 uwl+AkFuH/4Xe
X-Google-Smtp-Source: AGHT+IFJmcHoPIzZ9L264veetB7nxvS2a+7JPWtJfEvBDpSSyE2BpSfEnDiOTdaw54r4hCf2QZIUqw==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7d5dcc7603emr67525685a.11.1751576833609; 
 Thu, 03 Jul 2025 14:07:13 -0700 (PDT)
Received: from [192.168.68.110] ([189.110.107.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d5dbd93e46sm52290885a.13.2025.07.03.14.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 14:07:13 -0700 (PDT)
Message-ID: <bf6c0cc7-114c-4587-80d5-c152e7eef212@ventanamicro.com>
Date: Thu, 3 Jul 2025 18:07:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/tcg/riscv64: Add test for MEPC bit masking
To: Charalampos Mitrodimas <charmitro@posteo.net>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20250703182157.281320-1-charmitro@posteo.net>
 <20250703182157.281320-3-charmitro@posteo.net>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250703182157.281320-3-charmitro@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72f.google.com
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



On 7/3/25 3:21 PM, Charalampos Mitrodimas wrote:
> Add a regression test to verify that MEPC properly masks the lower
> bits when an address with mode bits is written to it, as required by
> the RISC-V Privileged Architecture specification.
> 
> The test sets STVEC to an address with bit 0 set (vectored mode),
> triggers an illegal instruction exception, copies STVEC to MEPC in the
> trap handler, and verifies that MEPC masks bits [1:0] correctly for
> IALIGN=32.
> 
> Without the fix, MEPC retains the mode bits (returns non-zero/FAIL).
> With the fix, MEPC clears bits [1:0] (returns 0/PASS).
> 
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
> ---

The additional test is appreciated. Thanks!


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/tcg/riscv64/Makefile.softmmu-target |  4 ++
>   tests/tcg/riscv64/test-mepc-masking.S     | 73 +++++++++++++++++++++++
>   2 files changed, 77 insertions(+)
>   create mode 100644 tests/tcg/riscv64/test-mepc-masking.S
> 
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> index 7c1d44d3f4..3ca595335d 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -20,5 +20,9 @@ EXTRA_RUNS += run-issue1060
>   run-issue1060: issue1060
>   	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
>   
> +EXTRA_RUNS += run-test-mepc-masking
> +run-test-mepc-masking: test-mepc-masking
> +	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
> +
>   # We don't currently support the multiarch system tests
>   undefine MULTIARCH_TESTS
> diff --git a/tests/tcg/riscv64/test-mepc-masking.S b/tests/tcg/riscv64/test-mepc-masking.S
> new file mode 100644
> index 0000000000..fccd2a7ac4
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-mepc-masking.S
> @@ -0,0 +1,73 @@
> +/*
> + * Test for MEPC masking bug fix
> + *
> + * This test verifies that MEPC properly masks the lower bits according
> + * to the RISC-V specification when vectored mode bits from STVEC are
> + * written to MEPC.
> + */
> +
> +	.option	norvc
> +
> +	.text
> +	.global _start
> +_start:
> +	/* Set up machine trap vector */
> +	lla	t0, machine_trap_handler
> +	csrw	mtvec, t0
> +
> +	/* Set STVEC with vectored mode (mode bits = 01) */
> +	li	t0, 0x80004001
> +	csrw	stvec, t0
> +
> +	/* Clear medeleg to handle exceptions in M-mode */
> +	csrw	medeleg, zero
> +
> +	/* Trigger illegal instruction exception */
> +	.word	0xffffffff
> +
> +test_completed:
> +	/* Exit with result in a0 */
> +	/* a0 = 0: success (bits [1:0] were masked) */
> +	/* a0 != 0: failure (some bits were not masked) */
> +	j	_exit
> +
> +machine_trap_handler:
> +	/* Check if illegal instruction (mcause = 2) */
> +	csrr	t0, mcause
> +	li	t1, 2
> +	bne	t0, t1, skip_test
> +
> +	/* Test: Copy STVEC (with mode bits) to MEPC */
> +	csrr	t0, stvec	/* t0 = 0x80004001 */
> +	csrw	mepc, t0	/* Write to MEPC */
> +	csrr	t1, mepc	/* Read back MEPC */
> +
> +	/* Check if bits [1:0] are masked (IALIGN=32 without RVC) */
> +	andi	a0, t1, 3	/* a0 = 0 if both bits masked correctly */
> +
> +	/* Set correct return address */
> +	lla	t0, test_completed
> +	csrw	mepc, t0
> +
> +skip_test:
> +	mret
> +
> +/* Exit with semihosting */
> +_exit:
> +	lla	a1, semiargs
> +	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
> +	sd	t0, 0(a1)
> +	sd	a0, 8(a1)
> +	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
> +
> +	/* Semihosting call sequence */
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.data
> +	.balign	8
> +semiargs:
> +	.space	16


