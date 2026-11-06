Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9E606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyqOArEN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPBng-0006W1-Hr; Thu, 05 Nov 2026 23:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xPBna-0006UU-AT
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 23:43:36 -0500
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xPBnY-0008R9-5z
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 23:43:34 -0500
Received: by mail-pj2-x0b.google.com with SMTP id
 d9443c01a7336-2ed05e57ffdso109315ad.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 20:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793940210; x=1794545010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cM6LZxuB9wW6WyU10i/I9aAuTKgVAOoLLTIMz8eRvmU=;
 b=KyqOArENdZLs/1SNcV7W6LPE/hOnsCts+Bm2I1GqX3NCPuOV5f5YOXpizbaYkHzT8w
 GwaiU+WYKURXUFir+bYRCqijnrguy9SSc10939tYT0L0U8ft88zAg6h+V+Z2JnxgEfPO
 WVG0yHW/b++eXVBI5kYJgj3eJv3yAnrQJUFRMM/04ZVqp8cAymrvhI4DQxP05Sr9LjIy
 jmnZ0+lgDOzscjaFyezs/YmBzoKbmr7nJzzNNtPNCsfAnBsOrCCE/oh3UMN/aVfWILed
 wLIVnfF4R9n6Cjjqdx+BKAXw9HcGazX0L9afSewwOCf+6ARZds1v438A+ymRf8Qa+2fh
 ibIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793940210; x=1794545010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cM6LZxuB9wW6WyU10i/I9aAuTKgVAOoLLTIMz8eRvmU=;
 b=LNbr4mC/Ipch9Sdet0V7GrInFXvphQCmG7QY3HpMy24GYuIjIrTdOZsQp2KjUgMCsd
 +eJejbqQDsb7FRMfLIkch3Rwu4rK5HGgwE4VVmzci8pgAYpBlVe6mFJ5x3+jxIY03+DG
 dwHcjI+PCahmYHe53p+z6q4i+wGSq1UkuIu5k8PA2e0fxgkIoelws8NopTvy2QVQaQDv
 qPfnRJ4+xY1fF8rabXVWhh1rxoEdtqHEEd8SDx5m6GNvEL63WZKvXd3rOoJDs0A6Q1UT
 0lSd2NUcqJBcdpGYJpN+oJ6OyW93vjLfItD0k9u58+oR72rOj2JgacGUFiz54LwDRZO+
 Ob5w==
X-Gm-Message-State: APuU4Z95GOY6F+10crFT9+w07kVKB2a7MtqKhLZDt8WC97ZR2zsWzWH6
 DWtpt4W6Mhj5JAbkGjpHdm8ZdwlWNr9OawHyKcgRwi8l5hFsn5136urX
X-Gm-Gg: AYBFou3p+wcwELI9WAT2r27wMrC3AdrNWdgWS/YGAgNi4o47dYGBzkiOgSExhlA0R09
 XEgaaxa/8EEwbgihrSZpueSHwOSd6gbJaR8Qk3M1b28feXmh2QLCKzxkcUDoIIQct+vrj3i4cSH
 sF1Ki3rSG6TmjmiqLaTd3bL21gb+FUGcxcwU9PTaqmZq9nfRisdasYuGdvgldSt8yev6oq6JOiY
 kEeRTULYQ0aDQedLlgi1yno/IyGSo7ULfj5lX67tOKzqubj7KBi2XI7U+8FWZk0ZMa4AvTwqdAg
 Z2nNxnuNjrcDA71dOtPfuzbiymzAmx7MbEVIf2eiUBUGHjd3hyd84Su8sBnICxX/k9AeRhNg4K0
 QSnUZZdNKx2piyoPho4hNk9/EOx4WQgpvRlkfg7MjaRoWKkxTc801hhMe9cGarWOmkap5gSOswO
 LSlC8mZ/YUQ0yqYGvXzJwiFyxDNWA+HuyknqQwun/9Vq+ADJrRZruPYix9v2FmAv7H8W+YaAQwW
 m7woUMqS+OOpmP/wG3RHWEfO/I+mO6EM/lMDo/qjeAexzQeF3Qlodpb85wnOyyRbzrmMM9EIF8r
 peFF5UukHQGPu+JxcuKEb67vZWJXVbrJwvvKkHuJJhxkyluIF49W5gM3
X-Received: by 2002:a17:90b:4ecc:b0:3ad:7f4d:2839 with SMTP id
 98e67ed59e1d1-3b0db6b6c71mr706919a91.14.1793940209358; 
 Thu, 05 Nov 2026 20:43:29 -0800 (PST)
Received: from Dell-WorkStation.localdomain ([152.175.67.81])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b3265a52sm5869334a91.10.2026.11.05.20.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 20:43:28 -0800 (PST)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v3] target/riscv: save ELP in MPELP for NMIE=0 exceptions
Date: Fri,  6 Nov 2026 12:43:05 +0800
Message-ID: <20261106044306.90168-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::b;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pj2-x0b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Smrnmi specification, section 8.5, "RNMI Operation", states:

  If the hart encounters an exception while executing in M-mode with the
  mnstatus.NMIE bit clear, the exception is an RNMI exception. Trap state
  is still saved in the regular M-mode CSRs and the handler returns with
  MRET.

riscv_cpu_do_interrupt() instead saves ELP in mnstatus.MNPELP on this
path. MRET restores ELP from mstatus.MPELP, so the expected landing-pad
state is lost.

Always save ELP in mstatus.MPELP for M-mode exceptions. Keep MNPELP for
the actual RNMI interrupt path, which returns with MNRET.

Add a TCG test that checks ELP preservation across an NMIE=0 M-mode
exception and MRET.

Fixes: 0266fd8b56a4 ("target/riscv: Add Zicfilp support for Smrnmi")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4223
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
Changes in v3:
- Rebase onto current master.
- Move test registration from Makefile.softmmu-target to system/meson.build,
  preserving the CPU options and RNMI exception vector.
- Disable the test's build ID so the handler stays at 0x80000100.
- Update the test comment to refer to system/meson.build.

Changes in v2:
- Quote the relevant Smrnmi specification text in the commit message.

 target/riscv/tcg/cpu_helper.c           |  18 +---
 tests/tcg/riscv64/system/meson.build    |  12 +++
 tests/tcg/riscv64/test-zicfilp-smrnmi.S | 117 ++++++++++++++++++++++++
 3 files changed, 131 insertions(+), 16 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-zicfilp-smrnmi.S

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..33d6b41ceb 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -2386,23 +2386,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
         src = env->sepc;
     } else {
-        /*
-         * If the hart encounters an exception while executing in M-mode
-         * with the mnstatus.NMIE bit clear, the exception is an RNMI exception.
-         */
-        nnmi_excep = cpu->cfg.ext_smrnmi &&
-                     !get_field(env->mnstatus, MNSTATUS_NMIE) &&
-                     !async;
-
-        /* handle the trap in M-mode */
-        /* save elp status */
+        /* Save ELP for MRET. */
         if (cpu_get_fcfien(env)) {
-            if (nnmi_excep) {
-                env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP,
-                                          env->elp);
-            } else {
-                env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
-            }
+            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
         }
 
         if (riscv_has_ext(env, RVH)) {
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 3c8b018d9e..ee4680f017 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,18 @@ tests += {
   }
 }
 
+tests += {
+  'test-zicfilp-smrnmi.S': setup + {
+    # Keep .org 0x100 at the configured RNMI exception vector.
+    'cflags': cflags + ['-Wl,--build-id=none'],
+    'qemu_args': [
+      '-cpu', 'rv64,zicsr=true,zicfilp=true,smrnmi=true',
+      '-global', 'rv64-riscv-cpu.rnmi-exception-vector=0x80000100',
+      qemu_args,
+    ],
+  },
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-zicfilp-smrnmi.S b/tests/tcg/riscv64/test-zicfilp-smrnmi.S
new file mode 100644
index 0000000000..1dcd01200c
--- /dev/null
+++ b/tests/tcg/riscv64/test-zicfilp-smrnmi.S
@@ -0,0 +1,117 @@
+/*
+ * Test that an M-mode exception taken with mnstatus.NMIE clear saves ELP in
+ * mstatus.MPELP, so that it is restored by MRET.  MNPELP is reserved for the
+ * actual RNMI path, which returns with MNRET.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+	.option	norvc
+
+	.equ	CSR_MNSTATUS, 0x744
+	.equ	CSR_MSECCFG, 0x747
+	.equ	MNSTATUS_NMIE, 1 << 3
+	.equ	MNSTATUS_MNPELP, 1 << 9
+	.equ	MSECCFG_MLPE, 1 << 10
+	.equ	MSTATUS_MPELP, 1 << 41
+	.equ	EXCP_INST_ACCESS_FAULT, 1
+	.equ	EXCP_SW_CHECK, 18
+	.equ	SW_CHECK_FCFI_TVAL, 2
+
+	.text
+	.global	_start
+_start:
+	/* Verify that NMIE is clear before exercising the exception path. */
+	csrr	t0, CSR_MNSTATUS
+	andi	t0, t0, MNSTATUS_NMIE
+	bnez	t0, fail_nmie
+
+	/* Enable landing-pad checks in M-mode, then start a new TB. */
+	li	t0, MSECCFG_MLPE
+	csrs	CSR_MSECCFG, t0
+	j	tracked_jump
+
+tracked_jump:
+	/* Make a Zicfilp-tracked indirect jump to an address that faults. */
+	li	t1, 0
+	jalr	zero, 0(t1)
+
+	/*
+	 * The instruction access fault should have redirected to the handler.
+	 */
+	li	a0, 1
+	j	_exit
+
+fail_nmie:
+	li	a0, 6
+	j	_exit
+
+	/* Must match rnmi-exception-vector in system/meson.build. */
+	.org	0x100
+rnmi_exception:
+	csrr	t0, mcause
+	li	t1, EXCP_INST_ACCESS_FAULT
+	beq	t0, t1, handle_fetch_fault
+	li	t1, EXCP_SW_CHECK
+	beq	t0, t1, handle_sw_check
+
+	li	a0, 4
+	j	_exit
+
+handle_fetch_fault:
+	/* This is an M-mode exception and will return with MRET. */
+	csrr	t0, mstatus
+	li	t1, MSTATUS_MPELP
+	and	t0, t0, t1
+	beqz	t0, fail_mpelp
+
+	csrr	t0, CSR_MNSTATUS
+	andi	t0, t0, MNSTATUS_MNPELP
+	bnez	t0, fail_mnpelp
+
+	lla	t0, resume_non_lpad
+	csrw	mepc, t0
+	mret
+
+resume_non_lpad:
+	/* MRET must restore ELP, so this instruction must not retire. */
+	li	a0, 1
+	j	_exit
+
+handle_sw_check:
+	csrr	t0, mtval
+	li	t1, SW_CHECK_FCFI_TVAL
+	bne	t0, t1, fail_tval
+
+	li	a0, 0
+	j	_exit
+
+fail_mpelp:
+	li	a0, 2
+	j	_exit
+
+fail_mnpelp:
+	li	a0, 3
+	j	_exit
+
+fail_tval:
+	li	a0, 5
+
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+
+	/* Semihosting call sequence. */
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0


