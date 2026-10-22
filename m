Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108C606A31D
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20251104.gappssmtp.com header.i=@theorem-dev.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=eIbBX5BF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJsud-0002m6-0p; Thu, 22 Oct 2026 09:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJksD-0005Nw-7Y
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:53 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJksB-0002Op-4g
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6ac76a02368so1483791a12.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792645070; cv=none;
 d=google.com; s=arc-20260327;
 b=cKyAZtQiEarystu067synWHDBVqV0bEn8MyYD7yc8mYBABCURys5+v8WR/Qf6ncSRr
 vAzyxxCAkTmormaQgUENEXYd5AzrEXjIJckEb0+szj/qgFb+PDxjYpBEu9V0Xw5hOCXw
 LjraaHFz/L4F2g+/tg0uTNN4xsU6vJb1fXRr7wsvGEE4o6GPzkZsMsWlKXwpfzIzjS6Q
 LMnaguAbjdtnPWGwTl1Jak2Opu23YfkXbm8Z2gjcz/SvDlpXdOYh14CHMwoZK96Dg34x
 flJ6HFA2ByzDMGDdC/+oc/hruVoXY2nwzW6CzcNteDPuH0pgVa5MhZovSIoYf7RdLNQZ
 Uf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:dkim-signature;
 bh=tfow9+C8NnoeZkW4V4h+bFfrmRtMxOS4aB7+eS0FK+A=;
 fh=KzEVRCrhke8VK+WFAq+Dy0o38BVLmA8ww6Zm36tVw6w=;
 b=UhSlvYv/KyEBCO+8Butf6w3UOEKM8aI5tQYs6VYXPhJou/E881ADOzev3HoQd5gQTQ
 bUmzS8RGU3FLklentz9fKgW1rrrpNcYhmytnh511thHcBC3zIgJM/k+NMI8SVpBBxGpI
 Ax9+RIkkveGYUREwb4Gr+MRXuVKs3EG7mvbUhlXlm3EKl87GmnYGWZPzxgdLB4wX4nNd
 Vgysu5OMRJnd9CqIzq57wcF3lO4l+xP3s/+MI92S6Op6KN3r/jv3vRH6mi6iv8fKaspE
 4DvBLTHBouzP8Yb26vCctQsGukE0C4paBiKmx5U/aLcudXayxaRxpxOS78eEIktDmxeD
 fyrg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20251104.gappssmtp.com; s=20251104; t=1792645070; x=1793249870;
 darn=nongnu.org; 
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tfow9+C8NnoeZkW4V4h+bFfrmRtMxOS4aB7+eS0FK+A=;
 b=eIbBX5BFLljgD87W/w1fOsiWgwpah7BwDgMJCP796zUociE7DkzA72Qj+y8E9lgXZ8
 qFRHDV94JZRCQtFO/pO0Vrind7xxzs2WilT1p2Hvpm6SzGBBwSeu03VfjpyVuuil4kYV
 o2K4U5CKA9DXvAtwLRjCvo8X01Qrxwy5RaC0Aua+m3TzFo2lSmOnGRYZjjWiIM+hErra
 1oHFCgCmKWik41D0kcwViUo3WmBk7mOq0Oc3h3G1fYSRpomdVHXGPXynRffjJuFOiiP1
 B/QKXnfuGtVin+AcdeYHxsF7QVzSNgooY1E2hrkz510Y47ZzrUJFIH5hOJLvN5L5PzRT
 bsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792645070; x=1793249870;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tfow9+C8NnoeZkW4V4h+bFfrmRtMxOS4aB7+eS0FK+A=;
 b=NlQZxdlXWOYgOVKFAcEkCmEiee5YnEZPLjsv4kHj5EsFSP4t81htaoZXqCY2on2kae
 Wyx9tPc/uw6ynU4pvo5eR6TB8uR43s8rl/v1guIwraL3OPIss3nX2AECCFf7X5kKwb/i
 r2HBnt4DY1deDcBBGCIB60h6Z8X6m19QeDU2gF0hsVN9ILUg3qFi14x03I9Xb05THl5Y
 eiBvVORQjRS0H36WyBCKekMRUSnl4VndoBgYo1PRyOQ8z5KY0vFk/PiJtdTG46CUP3tk
 kqS6su7qj2LkqMdN+icSRkREQ3dPuhPv0y9XlEm67xmeEx/BNN6Wh09pSSgCWubERxus
 ru0Q==
X-Gm-Message-State: AFq9FYJUjzhXgpsxQ7u6XWd16zqvWVHGfoBEfV1VXSx5M0WYorWkoCTI
 zLsRd94O6jU1QYst3VoMTSNXM+Gm5b8JuofbAlRAT9dSYgGPW7Zqq21aJ3r8pXpwFwnKV0ldd5U
 ghtjFKZhgSHXSVSrvPatPgvErnmBXVLYfLujTLGQNkA==
X-Gm-Gg: AYBFou3auEm8U653ktgSFdT+eW7gW9oa+p64wgSPXLbSY9FisPBuvtrXFRl61stjQsM
 rOE8Sb+MJzIFiQT08aNP/bzPQmQvQ82CADNP1m0AQExbFxHPgF5D5W/HHDZ7fj3dGl3zwDzWnfc
 vqFhlf+GHGpM5aOX/Uv7VIphrpUt7dQU4O47fNITedHNKtAxp+x505dVn0+2jY3MdTXtJr1b3qc
 A57mL3HPZRevFFTL+j+eVWRov0HSCN7kdZI04MQqqEjqMAgssO/KqRJsNo3uhHhvyZ5VOgGaPlB
 QvQoEozwxq41b6nPqvKIPAvbmf4g5juEYVv+vVOln3n0X5aA72vq86DiMmPqX/KJ31P70OUdbwR
 h5HSAsepd0dDfFJ63BP3SdKTxbKxtroOTWxpWUw==
X-Received: by 2002:a17:907:96a8:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c467965d198mr317222766b.21.1792645069771; Wed, 21 Oct 2026
 21:57:49 -0700 (PDT)
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:49 -0400
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:49 -0400
From: tewaro <tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022045737.67060-1-tewaro@theorem.dev>
References: <20261022045737.67060-1-tewaro@theorem.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 00:57:49 -0400
X-Gm-Features: AclHuK9QrgkVe9pr-MxlXFzTVUm68CFW9rBfvuG57ll1PX3LrHddL2pkzWjRUPQ
Message-ID: <CAEq2Q91Qw6jQC=t17dEoa6mqPbAGErVgdE_jJECkoQ50Dmh9xA@mail.gmail.com>
Subject: [PATCH 2/2] tests/tcg/riscv64: add test for mret to S-mode with no
 PMP entry
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 tewaro <tewaro@theorem.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=tewaro@theorem.dev; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Oct 2026 09:32:31 -0400
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Regression test for the previous commit. With PMP implemented and no
entry configured, the test executes mret to S-mode and checks in the
M-mode trap handler that the fault is an instruction access fault
taken from S-mode on the mret target, with mcause 1, mepc and mtval
equal to the target and MPP equal to S. It exits with 0 on success or
the number of the failed check.

Signed-off-by: tewaro <tewaro@theorem.dev>
---
 tests/tcg/riscv64/system/meson.build |   1 +
 tests/tcg/riscv64/test-mret-nopmp.S  | 100 +++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-mret-nopmp.S

diff --git a/tests/tcg/riscv64/system/meson.build
b/tests/tcg/riscv64/system/meson.build
index c2d7d09887..5e4398f06c 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -24,6 +24,7 @@ tests += {
   'test-crc32.S': setup + {'qemu_args': ['-cpu', 'rv64,xlrbr=true',
qemu_args]},
   'test-minstret-ecall.S': setup + {'qemu_args': ['-icount',
'shift=1', qemu_args]},
   'test-misa-w.S': setup + {'qemu_args': ['-cpu',
'rv64,x-misa-w=true,c=true,v=true', qemu_args]},
+  'test-mret-nopmp.S': setup + {'qemu_args': ['-cpu',
'rv64,pmp=true', qemu_args]},
 }

 tests += {
diff --git a/tests/tcg/riscv64/test-mret-nopmp.S
b/tests/tcg/riscv64/test-mret-nopmp.S
new file mode 100644
index 0000000000..df20f35bc8
--- /dev/null
+++ b/tests/tcg/riscv64/test-mret-nopmp.S
@@ -0,0 +1,100 @@
+/*
+ * Test mret to S-mode when PMP is implemented but no PMP entry is
+ * configured.
+ *
+ * The mret must succeed and the first S-mode fetch must fail [1][2].
+ * The trap is therefore taken from S-mode, with mcause 1, mepc and
+ * mtval equal to the mret target [3][4] and mstatus.MPP equal to S
+ * [5].
+ *
+ * Exit code is 0 on success, otherwise the number of the failed check.
+ *
+ * [1] Privileged ISA v1.12, 3.7.1 "Physical Memory Protection CSRs",
+ *     Priority and Matching Logic
+ * [2] Privileged ISA v1.12, 3.3.2 "Trap-Return Instructions"
+ * [3] Privileged ISA v1.12, 3.1.14 "Machine Exception Program Counter"
+ * [4] Privileged ISA v1.12, 3.1.16 "Machine Trap Value Register"
+ * [5] Privileged ISA v1.12, 3.1.6.1 "Privilege and Global
+ *     Interrupt-Enable Stack in mstatus register"
+ *
+ * Privileged ISA v1.12 (ratified, 2021-12-03):
+ * https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12
+ * Current source, same wording:
+ * https://github.com/riscv/riscv-isa-manual/blob/4877e41a/src/priv/machine.adoc
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+	.option	norvc
+
+	.text
+	.global _start
+_start:
+	/* Set up machine trap vector, handle everything in M-mode */
+	lla	t0, machine_trap_handler
+	csrw	mtvec, t0
+	csrw	medeleg, zero
+
+	/* mstatus.MPP = S */
+	li	t0, 0x1800
+	csrc	mstatus, t0
+	li	t0, 0x0800
+	csrs	mstatus, t0
+
+	/* Return to S-mode at `target` with no PMP entry configured */
+	lla	t0, target
+	csrw	mepc, t0
+	mret
+
+target:
+	/* Should be unreachable with no PMP */
+	li	a0, 5
+	j	_exit
+
+machine_trap_handler:
+	/* 1: mcause is instruction access fault */
+	li	a0, 1
+	csrr	t0, mcause
+	li	t1, 1
+	bne	t0, t1, _exit
+
+	/* 2: mepc == target, not mret in _start */
+	li	a0, 2
+	csrr	t0, mepc
+	lla	t1, target
+	bne	t0, t1, _exit
+
+	/* 3: mtval == target because aligned instructions */
+	li	a0, 3
+	csrr	t0, mtval
+	bne	t0, t1, _exit
+
+	/* 4: trap from S-mode */
+	li	a0, 4
+	csrr	t0, mstatus
+	srli	t0, t0, 11
+	andi	t0, t0, 3
+	li	t1, 1
+	bne	t0, t1, _exit
+
+	li	a0, 0
+	j	_exit
+
+/* Exit with semihosting */
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+
+	/* Semihosting call sequence */
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	8
+semiargs:
+	.space	16
-- 
2.47.3

