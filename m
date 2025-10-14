Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF3BCCD18D
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 12:48:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8eRQ-0003u8-RB; Tue, 14 Oct 2025 08:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8eRP-0003tx-5e
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 08:47:47 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8eRK-0003NP-C4
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 08:47:45 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63b9da76e42so4473756a12.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760446057; x=1761050857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzcCdvqVExjkLrdp+A5jr5Gzjr8KK8VBYoh/fTORjEQ=;
 b=NJaeDfUtaOWuDyWeJZThEhF6i8nVPMPj2vvhaw+8NHFzZl8BR9zxuMr4EQKI0h/cgs
 13M6HlP9SXmwDogfJXr9wq4P7sYC1fFGUIjJbya4ABO5NRS02BNFZtk8QxNCD18wv2mw
 cN7ox5wPA0uyxJR8T+rQXmMPDXxrK41xX1t7HxB1MzCjnMYawG++NlGIaOJd/5Lpsyas
 woEmYzS375I5UZ71SE5cFyyds3D//We9EZ75rYfqd0zxTdnmRiXhvTBG+XkRSfJY/RT2
 nfdlKcht3x22cnsbW4adsN0vKlD/TiIt1l3UO0d0G6SlBD5OaD0WDWLhlTrj8eb4nXu3
 Kk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760446057; x=1761050857;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FzcCdvqVExjkLrdp+A5jr5Gzjr8KK8VBYoh/fTORjEQ=;
 b=vywZa8otJwDCqumCIMEZRDy7fPsC5yV+c5ZtBxAYPKPCeIVRrkJ4xLavl5MMucczYq
 qsWf6CZ7HfdReB8Ev0iYALX6uu08Mb7TuwllVdkyuocFRBHOMLGgKHRZSCKSYxRRYehw
 1dNLhf0LCsikuAaybwfMJttI/satL8+psq+Z36io938j7HRBTSqokuTDfxTjNQU1xlVE
 P2nixjYYTNTkRrAOjZkhYv3seAk1QJ4RjyIV0O+HL6Q0EP3yHCjqN8mUPUY6bePIp8xb
 x1h2ZYFo5ljGfCPYQ4RXRuPcntuWOunfkH8qDvQjxIRwF4OCfcwCEzZ/bZRKRRc0TEKu
 T9Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR+NFlokTPVmzDfyUQ15BG4cpDGHTP5STy91qcOKYb+tkcjOgrHxTTRYq2bQbNEZXdCS7R4I1G7XlQ@nongnu.org
X-Gm-Message-State: AOJu0YxlbDdwYn0aDxuH1Mfs33xA1b16A9s0VMVqCrZfm5s9MR2YpYan
 ZDmncXcHNXyzXpb+y+E+v8Aub/HAhcXR5md7V4hhHtz0AoeAkN53Wp+llYCVGQyS2As=
X-Gm-Gg: ASbGnct3byhDL42azM9aI++iD/J2qh93fGaPRAInuB2j2bVnkJObHDT8szZkhIiZsDb
 VcdkHZGw16xVlx6I5NMN6WK5FpI7tR7W0TyMZjslvjWrkcwRfsrple28y6jw5nV3uUbIQg51EtU
 EanTvg49xhgz9fXg1CNNTYXF8pyiyCQhcgPtK+B8bf7kqUD8dDkO332asGNF875DJXS2hG1GJ5K
 9tyIYvvuzvA3isNc379FwSFfR3WIr7cMq39o1E/WYgqEsjZFQcAJwVsCoUXV7pbl5Sbm5ZVpPDJ
 lkE8pgRGWCKne7ZmPakB7I80pe5H2nzVjh9h/L1jLEeSTQNM/PT46wyi3ZW0NL7WzkeL44/JhG+
 swOsO1WXJouMLOYdns3lTc1pVblZzwHp2TQDzhZh50ImtSxt06ocPuSCC
X-Google-Smtp-Source: AGHT+IFnz6+YfnK3Z8hw9t93tzgf+lO2jkmS8U5hxVB8zl32u0LiOBndlgoGIHbPX2e5A80b2bK/3A==
X-Received: by 2002:a05:6402:2809:b0:639:c9c2:3956 with SMTP id
 4fb4d7f45d1cf-639d5c5a382mr24681592a12.28.1760446055853; 
 Tue, 14 Oct 2025 05:47:35 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5235dca9sm11132257a12.8.2025.10.14.05.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:47:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 617A85F812;
 Tue, 14 Oct 2025 13:47:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julian Ganz <neither@nut.email>
Cc: qemu-devel@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: Re: [PATCH v7 25/25] tests: add test with interrupted memory
 accesses on rv64
In-Reply-To: <729c8db0f4b61033f5a460747ea50fced9dabc1e.1759744337.git.neither@nut.email>
 (Julian Ganz's message of "Mon, 6 Oct 2025 11:59:20 +0200")
References: <cover.1759744337.git.neither@nut.email>
 <729c8db0f4b61033f5a460747ea50fced9dabc1e.1759744337.git.neither@nut.email>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Tue, 14 Oct 2025 13:47:34 +0100
Message-ID: <87frbllkex.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

Julian Ganz <neither@nut.email> writes:

> This test aims at catching API misbehaviour w.r.t. the interaction
> between interrupts and memory accesses, such as the bug fixed in
>
>     27f347e6a1d269c533633c812321cabb249eada8

Even better the abbrev with title:

  27f347e6a1d (accel/tcg: also suppress asynchronous IRQs for cpu_io_recomp=
ile)

> Because the condition for triggering misbehaviour may not be
> deterministic and the cross-section between memory accesses and
> interrupt handlers may be small, we have to place our trust in large
> numbers. Instead of guessing/trying an arbitrary, fixed loop-bound, we
> decided to loop for a fixed amount of real-time. This avoids the test
> running into a time-out on slower machines while enabling a high number
> of possible interactions on faster machines.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Julian Ganz <neither@nut.email>
> ---
>  tests/tcg/riscv64/Makefile.softmmu-target |  6 ++
>  tests/tcg/riscv64/interruptedmemory.S     | 67 +++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 tests/tcg/riscv64/interruptedmemory.S
>
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv6=
4/Makefile.softmmu-target
> index 1a71a78653..d8f92b8e61 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -30,5 +30,11 @@ run-plugin-doubletrap: doubletrap
>  	  $(QEMU) -plugin ../plugins/libdiscons.so -d plugin -D $*.pout \
>  	  $(QEMU_OPTS)$<)
>=20=20
> +EXTRA_RUNS +=3D run-plugin-interruptedmemory
> +run-plugin-interruptedmemory: interruptedmemory
> +	$(call run-test, $<, \
> +	  $(QEMU) -plugin ../plugins/libdiscons.so -d plugin -D $*.pout \
> +	  $(QEMU_OPTS)$<)

Something went wrong with substitutions there because I see:

  timeout -s KILL --foreground 120  /home/alex/lsrc/qemu.git/builds/all/qem=
u-system-riscv64 -plugin ../plugins/libdiscons.so -d plugin -D .pout -M vir=
t -display none -semihosting -device loader,file=3Dinterruptedmemory

There doesn't seem to be any output either when I run it manually -
should we be checking the output and at least confirming we are
detecting the right sort of events?

> +
>  # We don't currently support the multiarch system tests
>  undefine MULTIARCH_TESTS
> diff --git a/tests/tcg/riscv64/interruptedmemory.S b/tests/tcg/riscv64/in=
terruptedmemory.S
> new file mode 100644
> index 0000000000..a32d672849
> --- /dev/null
> +++ b/tests/tcg/riscv64/interruptedmemory.S
> @@ -0,0 +1,67 @@
> +	.option norvc
> +
> +	.text
> +	.global _start
> +_start:
> +	# Set up trap vector
> +	lla	t0, trap
> +	csrw	mtvec, t0
> +
> +	# Set up timer
> +	lui	t1, 0x02004
> +	sd	zero, 0(t1) # MTIMECMP0
> +
> +	# Enable timer interrupts
> +	li	t0, 0x80
> +	csrrs	zero, mie, t0
> +	csrrsi	zero, mstatus, 0x8
> +
> +	# Find out when to stop
> +	call	rtc_get
> +	li	t0, 60
> +	slli	t0, t0, 30 # Approx. 10e9 ns
> +	add	t0, t0, a0

The runtime of 60s seems quite long for a tcg test. Can we not show
stuff happening in a shorter period of time?

> +
> +	# Loop with memory accesses
> +	la	t1, semiargs
> +0:
> +	ld	t2, 0(t1)
> +	sd	t2, 0(t1)
> +	call	rtc_get
> +	bltu	a0, t0, 0b
> +
> +	li	a0, 0
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
> +rtc_get:
> +	# Get current time from the goldfish RTC
> +	lui	t3, 0x0101
> +	lw	a0, 0(t3)
> +	lw	t3, 4(t3)
> +	slli	t3, t3, 32
> +	add	a0, a0, t3
> +	ret
> +
> +trap:
> +	lui	t5, 0x0200c
> +	ld	t6, -0x8(t5) # MTIME
> +	addi	t6, t6, 100
> +	lui	t5, 0x02004
> +	sd	t6, 0(t5) # MTIMECMP
> +	mret
> +
> +	.data
> +	.balign	16
> +semiargs:
> +	.space	16

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

