Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F8607382A
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FMaR5l7o
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOguF-0006sv-HQ; Wed, 04 Nov 2026 14:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOguA-0006ZB-I0
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:18 -0500
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgu7-0002i8-Cw
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:17 -0500
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so2222681c88.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821454; x=1794426254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JQDX0/TKOp3b6vjy3Rl0bo9AkbHlzgihMDugSDBnVKM=;
 b=FMaR5l7oKOrSLrkvUw1p2r1syTjDiiHNRu7lHUU00v0x0fOkMMlFjzI8k11BTBlxKg
 U1OXDahsZW75NWKb3iy4JxqstK1YM3eYdQRNEUIE1KQxBA1/v7cddOpO0b3LTbmJlLB5
 yWICVRQWwkBd0y1oFsb1GqWwo6g5i2h9aIHg+xzlAlx5AWX5j+ATdwS9QSoPZSdCztpb
 /f9Lo6RD3JkqFlomI/MyQbqbV8dHXmQfZ490KMNutZ0KukWu2/Zl6tnKUF1DuAncTQb6
 icpAEHBFDw292yfZW/4xFtzaPisLflDxV6bZjVESFcPs1lwUpvIo1pITkU5KS3rLgjbP
 rKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821454; x=1794426254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JQDX0/TKOp3b6vjy3Rl0bo9AkbHlzgihMDugSDBnVKM=;
 b=NuybdVGZpGFBT6wUuFMR2KPJq0uMfoVs2y7sR2ZsfNayk0mFkhyuqTHGloOzqKML/f
 pp9ZCCOBXjJ4Srb5K8azHCkTb0F+MIj5NvO6vJjzVwLPru7lwGhZ7COKfnhAaUB/V5KZ
 TLEYRMtjxItsrla4eSNQDO8lK1RtYhSqSRqLedYAQCdG5JjhV+HV7Aj7D7V+YZzWEeYo
 tm62w6r4IJNcjGhYGWK+ThnjhhXXHSRWdVdmK8qSRoyx5sosG7S/X2UrrbYao8PxCXdJ
 ISeGxXf3BOtkCCarFmxT5XBODVs9YzhGPm2fJ6NlacolLz6ZwLso6DwLOIMz+9++3au8
 dOJw==
X-Forwarded-Encrypted: i=1;
 AKwUvByyjgjwcDsjyeqTmTPFTbk4xWAIRC6EQ/5u0IM1CXlPQFWcLHnyonNUNWjc/KbB+XjDVvlyv2obnL5E@nongnu.org
X-Gm-Message-State: APuU4Z95IRf4Ctch8xRPEEEfH2ixr5Plp03zUeFhzOoc1epwj0wXWQT0
 ebX+Z9KGt8mkZeq7l1fPf7aBCHq7ALe62isZCEVmv7oB5goK0AWw+F7tmMDNA+Z6s5Q=
X-Gm-Gg: AYBFou0blX/GZ+7fDGVCuIs+/jkc7D5228Nm+AkQmGdaCALUvOJ40IUwuD49+eJYIM+
 73KCPuqZdE6abAuZRjKm/k6vvgd37vt1jEGAovIUxqWkpEakLqAJ682kkihagwt6tn+wd+iUjZ0
 WXQVjM+6JkZOdNxxi0qEgXFwYqzQ3tCNPb+DV+Xu8TGC/3l9PVndh/SClxkm+ZOvofStwspahUP
 2wJcMP5MO+8XMDB8PPuVeHdMGi3ZEVX3zgkWPEh/F7pFGcpGEGdp7nsxoz4/LDk+PAPdtimpMVw
 TtWoDTz2LUY2/3kEPZJvEO7LYi7z89TaWZlwV5g24xZkROcRK35q03fZ1h4hdvY7yQ/dZjy8EGW
 DnVEuJZaQvIEV9toxd72zMfEi9F7ZPd75O9TmAB4Kws53GDq+msIDpDKa2IRlvWJZzz36w8f4F8
 XPB26g5K9gHD4iayT5DjqEm9zXpDVNk4/bi1pF8dhAgDzHnZv/gwdClSwOaBg+0S/hQK742Ks7q
 SFJYUuHYL9mSm7IxWwHoSSQNGaU0sE4e6/UFtFO7e6jvqIc+JGhgscJERvQngtGTFOuiT79fl9F
 petq1O3dkiNhaHKFwaH8uTkrWk9LKXfsqcARKD7hvtMeWy6P4y+wVKNQjpPInzSCMc+bYnxlqtJ
 6eQgwXCqBOxY2yJ+qAWwYG//gDOBh
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id
 a92af1059eb24-1ade9e3e335mr24473074c88.31.1793821453533; 
 Wed, 04 Nov 2026 11:44:13 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:44:13 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 38/38] tests/tcg/riscv64: Add test for Zvdota/Zvbdota
 extensions
Date: Thu,  5 Nov 2026 03:41:53 +0800
Message-ID: <20261104194155.679241-39-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=max.chou@sifive.com; helo=mail-dl1-x1236.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a test that exercises the RISC-V Zvdota/Zvbdota instructions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tests/tcg/riscv64/system/meson.build |  12 +
 tests/tcg/riscv64/test-zvdota.S      | 343 +++++++++++++++++++++++++++
 2 files changed, 355 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-zvdota.S

diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 3c8b018d9e9..01370badb0d 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,18 @@ tests += {
   }
 }
 
+dot_cpu = ('rv64,v=true,vlen=512' +
+           ',x-zvqwdota8i=true,x-zvqwdota16i=true' +
+           ',x-zvqwbdota8i=true,x-zvqwbdota16i=true' +
+           ',x-zvfwdota16bf=true,x-zvfwbdota16bf=true' +
+           ',x-zvfqwdota8f=true,x-zvfqwbdota8f=true,x-zvfbdota32f=true')
+tests += {
+  'test-zvdota.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', dot_cpu, qemu_args],
+  }
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-zvdota.S b/tests/tcg/riscv64/test-zvdota.S
new file mode 100644
index 00000000000..eefb615088f
--- /dev/null
+++ b/tests/tcg/riscv64/test-zvdota.S
@@ -0,0 +1,343 @@
+/*
+ * Test the Zvdota/Zvbdota extensions
+ *
+ * Each dot has four input pairs. Integer inputs distinguish all four
+ * signedness combinations; the -7 accumulator also exercises wraparound.
+ * Floating inputs represent A = [1, -2, 0.5, 4] and column n of B =
+ * [n + 1, -2, 3, 0.5]. With accumulator 1.5, C[n] = n + 10 exactly.
+ * Separate BF16 cases check round-to-odd in the final accumulator addition.
+ *
+ * Poisoned source tails must not contribute. Destination prestart/tail
+ * elements and masked-off batched outputs must remain undisturbed (tu/mu).
+ * The test requires VLEN 512, which also exercises ci = 8.
+ *
+ * Exit status is zero on success or the numbered check on failure, including
+ * unexpected traps.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+	.option arch, +v
+	.option norvc
+	.option norelax
+
+/* ci is an element index; its encoding is the index divided by eight. */
+#define DOT(f6, f3, vm, ci) \
+    (((f6) << 26) | ((vm) << 25) | ((8 | ((ci) / 8)) << 20) | \
+     (1 << 15) | ((f3) << 12) | (16 << 7) | 0x77)
+
+	.text
+
+/* Load four elements per source, leaving all remaining elements poisoned. */
+.macro LOAD_INPUT sew, a, b
+	vsetvli t0, zero, e\sew, m1, tu, mu
+	vmv.v.i v1, -1
+	.irp reg, 8, 9, 10, 11, 12, 13, 14, 15
+	vmv.v.i v\reg, -1
+	.endr
+	li	t0, 4
+	vsetvli t0, t0, e\sew, m1, tu, mu
+	la	t1, \a
+	vle\sew\().v v1, (t1)
+	la	t1, \b
+	.irp reg, 8, 9, 10, 11, 12, 13, 14, 15
+	vle\sew\().v v\reg, (t1)
+	addi	t1, t1, \sew / 2
+	.endr
+.endm
+
+/*
+ * Initialize an m4 destination at its output width, execute with the input
+ * vtype, and compare the whole m4 group (including untouched registers).
+ * v0 contains repeating 0xaa55: scalar dots mask inputs, batched dots outputs.
+ * Nonzero-ci cases give prestart elements a different accumulator seed.
+ */
+.macro RUN id, f6, f3, type, eew, exp, batch=0, vm=1, vl=4, ci=0
+	li	t6, \id
+	vsetvli s0, zero, e\eew, m4, tu, mu
+	.if \f3
+	li	s1, 0x3fc00000	/* FP32 accumulator = 1.5. */
+	.else
+	li	s1, -7
+	.endif
+	vmv.v.x v16, s1
+	.if \ci
+	li	t0, \ci
+	vsetvli t0, t0, e\eew, m4, tu, mu
+	addi	t0, s1, 1
+	vmv.v.x v16, t0
+	.endif
+	li	t1, \vl
+	li	t2, \type
+	vsetvl	t0, t1, t2
+	bne	t0, t1, fail
+	.word	DOT(\f6, \f3, \vm, \ci)
+	csrr	t0, vstart
+	bnez	t0, fail
+	csrr	t0, fflags
+	bnez	t0, fail
+	vsetvli t0, zero, e\eew, m4, tu, mu
+	la	a0, result
+	vse\eew\().v v16, (a0)
+	la	a1, \exp
+	mv	a2, s0
+	li	a3, \ci
+	.if \vl == 0
+	li	a4, 0
+	.elseif \batch
+	li	a4, 8
+	.else
+	li	a4, 1
+	.endif
+	li	a5, \eew / 8
+	mv	a6, s1
+	.if \batch && !\vm
+	li	a7, (0xaa55 >> \ci) & 0xff
+	.else
+	li	a7, 0xff
+	.endif
+	call	check_result
+.endm
+
+/* The trap handler verifies the cause, faulting PC and instruction bits. */
+.macro ILLEGAL id, f6, f3, type, start=0
+	li	t6, \id
+	li	t1, 4
+	li	t2, \type
+	vsetvl	t0, t1, t2
+	li	t0, \start
+	csrw	vstart, t0
+	la	s2, 1f
+	li	s3, DOT(\f6, \f3, 1, 0)
+1:	.word	DOT(\f6, \f3, 1, 0)
+	bnez	s2, fail	/* Must have taken the expected trap. */
+.endm
+
+	.global _start
+_start:
+	li	t6, 44		/* Setup failure. */
+	li	s2, 0		/* No trap expected outside ILLEGAL. */
+	la	t0, trap_handler
+	csrw	mtvec, t0
+	li	t0, (1 << 9) | (1 << 13)
+	csrs	mstatus, t0
+	csrw	fcsr, zero
+	csrr	t0, vlenb
+	li	t1, 64		/* VLEN 512 only. */
+	bne	t0, t1, fail
+	vsetvli t0, zero, e16, m1, tu, mu
+	li	t0, 0xaa55
+	vmv.v.x v0, t0
+
+	/* Integer scalar dots: vs2 signedness in opcode, vs1 in altfmt. */
+	LOAD_INPUT 8, a_i8, b_i8
+	RUN	1, 0x26, 0, 0x000, 32, exp_i8_uu
+	RUN	2, 0x27, 0, 0x000, 32, exp_i8_us
+	RUN	3, 0x26, 0, 0x100, 32, exp_i8_su
+	RUN	4, 0x27, 0, 0x100, 32, exp_i8_ss
+	RUN	5, 0x26, 0, 0x000, 32, exp_i8_mask, vm=0
+	RUN	6, 0x26, 0, 0x000, 32, exp_i8_uu, vl=0
+	LOAD_INPUT 16, a_i16, b_i16
+	RUN	7, 0x26, 0, 0x008, 64, exp_i16_uu
+	RUN	8, 0x27, 0, 0x008, 64, exp_i16_us
+	RUN	9, 0x26, 0, 0x108, 64, exp_i16_su
+	RUN	10, 0x27, 0, 0x108, 64, exp_i16_ss
+
+	/* Batched dots use all eight columns, even though vl is only four. */
+	LOAD_INPUT 8, a_i8, b_i8
+	RUN	11, 0x2e, 0, 0x000, 32, exp_i8_uu, batch=1
+	RUN	12, 0x2f, 0, 0x000, 32, exp_i8_us, batch=1
+	RUN	13, 0x2e, 0, 0x100, 32, exp_i8_su, batch=1
+	RUN	14, 0x2f, 0, 0x100, 32, exp_i8_ss, batch=1
+	RUN	15, 0x2e, 0, 0x000, 32, exp_i8_uu, batch=1, vm=0
+	RUN	16, 0x2e, 0, 0x000, 32, exp_i8_uu, batch=1, vl=0
+	LOAD_INPUT 16, a_i16, b_i16
+	RUN	17, 0x2e, 0, 0x008, 64, exp_i16_uu, batch=1
+	RUN	18, 0x2f, 0, 0x008, 64, exp_i16_us, batch=1
+	RUN	19, 0x2e, 0, 0x108, 64, exp_i16_su, batch=1
+	RUN	20, 0x2f, 0, 0x108, 64, exp_i16_ss, batch=1
+
+	/* BF16 requires SEW=16, altfmt=1. */
+	LOAD_INPUT 16, a_bf16, b_bf16
+	RUN	21, 0x24, 1, 0x108, 32, exp_fp
+	RUN	22, 0x24, 1, 0x108, 32, exp_fp_mask, vm=0
+	RUN	23, 0x2c, 1, 0x108, 32, exp_fp, batch=1
+	RUN	24, 0x2c, 1, 0x108, 32, exp_fp, batch=1, vm=0
+
+	/* OFP8: ordinary/alt opcode selects vs2, altfmt selects vs1. */
+	LOAD_INPUT 8, a_e4m3, b_e4m3
+	RUN	25, 0x26, 1, 0x000, 32, exp_fp
+	RUN	29, 0x26, 1, 0x000, 32, exp_fp_mask, vm=0
+	RUN	30, 0x2e, 1, 0x000, 32, exp_fp, batch=1
+	RUN	34, 0x2e, 1, 0x000, 32, exp_fp, batch=1, vm=0
+	LOAD_INPUT 8, a_e4m3, b_e5m2
+	RUN	26, 0x27, 1, 0x000, 32, exp_fp
+	RUN	31, 0x2f, 1, 0x000, 32, exp_fp, batch=1
+	LOAD_INPUT 8, a_e5m2, b_e4m3
+	RUN	27, 0x26, 1, 0x100, 32, exp_fp
+	RUN	32, 0x2e, 1, 0x100, 32, exp_fp, batch=1
+	LOAD_INPUT 8, a_e5m2, b_e5m2
+	RUN	28, 0x27, 1, 0x100, 32, exp_fp
+	RUN	33, 0x2f, 1, 0x100, 32, exp_fp, batch=1
+
+	LOAD_INPUT 32, a_fp32, b_fp32
+	RUN	35, 0x2b, 1, 0x010, 32, exp_fp, batch=1
+	RUN	36, 0x2b, 1, 0x010, 32, exp_fp, batch=1, vm=0
+
+	/* 1.5 + 2^-24 rounds to odd (0x3fc00001), without setting NX. */
+	LOAD_INPUT 16, a_tiny, b_tiny
+	RUN	37, 0x24, 1, 0x108, 32, exp_odd
+	RUN	38, 0x2c, 1, 0x108, 32, exp_odd, batch=1
+
+	LOAD_INPUT 8, a_i8, b_i8
+	RUN	39, 0x2e, 0, 0x000, 32, exp_i8_uu, batch=1, ci=8
+	RUN	40, 0x2e, 0, 0x000, 32, exp_i8_uu, batch=1, vm=0, ci=8
+	ILLEGAL 41, 0x26, 0, 0x000, start=1	/* Nonzero vstart. */
+	ILLEGAL 42, 0x2e, 0, 0x001		/* Batched LMUL=2. */
+	ILLEGAL 43, 0x24, 1, 0x008		/* BF16 altfmt=0. */
+	li	a0, 0
+	j	_exit
+
+	.balign 4
+trap_handler:
+	beqz	s2, fail
+	csrr	t0, mcause
+	li	t1, 2		/* Illegal instruction. */
+	bne	t0, t1, fail
+	csrr	t0, mtval
+	bne	t0, s3, fail
+	csrr	t0, mepc
+	bne	t0, s2, fail
+	addi	t0, t0, 4
+	csrw	mepc, t0
+	csrw	vstart, zero
+	li	s2, 0
+	mret
+
+/*
+ * a0=result, a1=expected body, a2=total elements, a3=first body element,
+ * a4=body count, a5=element bytes, a6=seed, a7=active body mask.
+ * Prestart elements use seed + 1; masked-off body and tail elements use seed.
+ */
+check_result:
+	li	t0, 0
+1:	mv	t3, a6
+	bltu	t0, a3, 6f
+	sub	t1, t0, a3
+	bgeu	t1, a4, 3f
+	srl	t2, a7, t1
+	andi	t2, t2, 1
+	beqz	t2, 3f
+	mul	t2, t1, a5
+	add	t2, a1, t2
+	li	t3, 8
+	beq	a5, t3, 2f
+	lw	t3, 0(t2)
+	j	3f
+2:	ld	t3, 0(t2)
+3:	li	t2, 8
+	beq	a5, t2, 4f
+	lw	t2, 0(a0)
+	j	5f
+4:	ld	t2, 0(a0)
+5:	bne	t2, t3, fail
+	add	a0, a0, a5
+	addi	t0, t0, 1
+	bltu	t0, a2, 1b
+	ret
+6:	addi	t3, a6, 1
+	j	3b
+
+fail:
+	mv	a0, t6
+_exit:
+	la	a1, semiargs
+	li	t0, 0x20026
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20
+	.balign 16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign 8
+semiargs:
+	.space 16
+result:
+	.space 256	/* m4 at VLEN 512. */
+
+a_i8:
+	.byte 0xfe, 0x82, 2, 3
+b_i8:
+	.irp n, 0, 1, 2, 3, 4, 5, 6, 7
+	.byte 0xff - \n, 0x80 + \n, 3, 7
+	.endr
+	.balign 2
+a_i16:
+	.half 0xfffe, 0x8002, 2, 3
+b_i16:
+	.irp n, 0, 1, 2, 3, 4, 5, 6, 7
+	.half 0xffff - \n, 0x8000 + \n, 3, 7
+	.endr
+
+a_bf16:
+	.half 0x3f80, 0xc000, 0x3f00, 0x4080
+b_bf16:
+	.irp bits,0x3f80,0x4000,0x4040,0x4080,0x40a0,0x40c0,0x40e0,0x4100
+	.half \bits, 0xc000, 0x4040, 0x3f00
+	.endr
+a_e4m3:
+	.byte 0x38, 0xc0, 0x30, 0x48
+b_e4m3:
+	.irp bits, 0x38, 0x40, 0x44, 0x48, 0x4a, 0x4c, 0x4e, 0x50
+	.byte \bits, 0xc0, 0x44, 0x30
+	.endr
+a_e5m2:
+	.byte 0x3c, 0xc0, 0x38, 0x44
+b_e5m2:
+	.irp bits, 0x3c, 0x40, 0x42, 0x44, 0x45, 0x46, 0x47, 0x48
+	.byte \bits, 0xc0, 0x42, 0x38
+	.endr
+	.balign 4
+a_fp32:
+	.float 1.0, -2.0, 0.5, 4.0
+b_fp32:
+	.irp n, 1, 2, 3, 4, 5, 6, 7, 8
+	.float \n, -2.0, 3.0, 0.5
+	.endr
+a_tiny:
+	.half 0x3f80, 0, 0, 0
+b_tiny:
+	.rept 8
+	.half 0x3380, 0, 0, 0
+	.endr
+
+/* Suffixes describe vs1 then vs2; -7 + A dot B, modulo output width. */
+.macro EXPECT_INT name, width, a0, a1, b0, b1
+\name:
+	.irp n, 0, 1, 2, 3, 4, 5, 6, 7
+	.\width -7 + (\a0) * ((\b0) - \n) + (\a1) * ((\b1) + \n) + 2 * 3 + 3 * 7
+	.endr
+.endm
+	.balign 8
+	EXPECT_INT exp_i8_uu, word, 254, 130, 255, 128
+	EXPECT_INT exp_i8_us, word, 254, 130, -1, -128
+	EXPECT_INT exp_i8_su, word, -2, -126, 255, 128
+	EXPECT_INT exp_i8_ss, word, -2, -126, -1, -128
+	EXPECT_INT exp_i16_uu, dword, 65534, 32770, 65535, 32768
+	EXPECT_INT exp_i16_us, dword, 65534, 32770, -1, -32768
+	EXPECT_INT exp_i16_su, dword, -2, -32766, 65535, 32768
+	EXPECT_INT exp_i16_ss, dword, -2, -32766, -1, -32768
+exp_i8_mask:
+	.word -7 + 254 * 255 + 2 * 3
+exp_fp:
+	.float 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0
+exp_fp_mask:
+	.float 4.0
+exp_odd:
+	.rept 8
+	.word 0x3fc00001
+	.endr
-- 
2.56.0


