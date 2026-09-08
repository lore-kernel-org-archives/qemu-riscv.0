Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E1EC79F9E
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 02:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3lZM-0004Qr-Ol; Mon, 07 Sep 2026 22:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1x3lZK-0004QI-PG
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 22:28:18 -0400
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1x3lZI-0004Cm-QX
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 22:28:18 -0400
Received: by mail-pj2-x0b.google.com with SMTP id
 98e67ed59e1d1-398a0a87595so3656380a91.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 19:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788834495; x=1789439295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rBvI46ie6sx7winHe5wYtdRLcxqOP4Fkmzc07zx4QGc=;
 b=KP/iXyBy2lv4sZWRaBSGnDh+Zu5HPHpUbVmZOuB9yV9Ta9Bj016Lj7vM/TNtMZlqE3
 y3Lu5WbtE5Noigt/3r8A3mpT8xAHQwnxJUOT9eeZ+o+KDzFRGQ9qKHNBSbV6rhgE/+Nx
 pVBfVXIS5TC+f9Ho1spuaxZ/MgCkVNIgNQfLZRTDyO2T8eCqD0/9Fz9RzEtbcnEvnzm3
 pVsiJdHytcqOWPmYdf27+FNSVSMn35FQjRvZYItD3E6IXZ/5Gf/kmf5sAJXmQYpT/wwa
 ZeaPPgDt7LOIWl/BPtq0Zfrj5C8CuMBdDZBGirfqHshRjlQyqU26moCTBLRDD+41TTWc
 aIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788834495; x=1789439295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rBvI46ie6sx7winHe5wYtdRLcxqOP4Fkmzc07zx4QGc=;
 b=EmrisB5A3Leq9PQEZGCfTvo70XAlIFydH4GVkq9ZolzDzVOKxj9D6p+dNcl+FnRotM
 bOuQZw4Y4ch7efbMD4iHNNSvWrgCBmXiswrewfsbRtD31uSqqa935RArjfrx3X37WRQI
 WNJa3oI7pTGLWjAie0dhUV+6IoMrf0mBziUh37uYHuUlT55W2OhVffdiDhg2jtK3yZsr
 8zAzjHoyl7hi05otCHXa/yc1ZE+o4zh9JudfVlzQRO+2eFbVxh4tMT2Gf1NGxlVv7z3S
 Qd08CjbvOSK2Km95EsqbGF9R9EYAm/EVb+ehTnvJJsQ5Sd2sjKm13t5fc02A5OVvXYqn
 zgFg==
X-Gm-Message-State: AFuF++kgq1zmCtTpfz16pZUCoHZg3PKjqzsw9CK2Ea0A8IbKiMIB0/pE
 O0BzYLT7G3ZYOuPUkH/ko1j2kvtBXIHFxFhFhYxsKtbG6Lf0fyRrg7XdnSYJ2sV9
X-Gm-Gg: AYBFou3a+TiE9Y/93gHWbw4PlM2JABUlyQbJYG1QElxf3E+hgoPhxbvI2nOmtcycHCf
 eRE1CLQzIH3wOqL81Fi0aDX5GaW80kji/p3TEorVSj1jhDVd3R1dIVhcgCJ/1nqNfSckOqNCg0c
 z3MJTr7Fz6J89HDT2ozHIs5HSrmEH7pTidjj6+/k+YQj0Ds6WItjvS9Og5Mn9Zi+MfoC9KwAoho
 5YbXFwTAVJcglj8NIg+G99tKBAGSjM9ypSRZ91Qobl5PDYI0hiN+d66WjLjNox0am3ptIBFMGjD
 Ek3mp7EK+xd/hGlo88VvYMMSDKSKSNgS+Af4fH37XBHXIt6SdTQgr7m7xb9ZNfoev6cYWuDzC+B
 +hCqxZLAtPN3m6pcg8LdYAIgyIpKbnK3k+dTHu030eNKfAZGIy0PQBPjHQrJv8SAFepe95lj97l
 ieMuv/RKkj1+TdCNgc/NDRHKJh6TEiPJawDenZv7iaf/iWBe5/hQR/f9geBmLUjjIinPSJF9iL4
 hwjnyoPe3ZSufKJrA==
X-Received: by 2002:a05:6a20:3ca2:b0:3d1:7238:33d9 with SMTP id
 adf61e73a8af0-3da39d18ce3mr41039314637.3.1788834494243; 
 Mon, 07 Sep 2026 19:28:14 -0700 (PDT)
Received: from Dell-WorkStation.localdomain ([103.190.179.27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-143243bfbe3sm29513613c88.11.2026.09.07.19.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 19:28:13 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH] target/riscv: stop translating after WFI
Date: Tue,  8 Sep 2026 10:27:44 +0800
Message-ID: <20260908022744.20333-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

helper_wfi() never returns to translated code: it either raises an
exception or exits the CPU loop after marking the CPU as halted. However,
trans_wfi() leaves the translation state as DISAS_NEXT, so instructions
following WFI can be included in the same TB.

With icount enabled, this makes the following instruction part of the TB's
instruction count when WFI exits, causing minstret to be incremented once
too many. Set DISAS_NORETURN after emitting the helper.

Add a TCG test for both reported cases: WFI waking for a locally enabled
pending interrupt with mstatus.MIE clear, and WFI taking a timer interrupt.

Fixes: 55c2a12cbcd3 ("RISC-V TCG Code Generation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4230
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 .../tcg/insn_trans/trans_privileged.c.inc     |   1 +
 tests/tcg/riscv64/Makefile.softmmu-target     |   4 +
 tests/tcg/riscv64/test-minstret-wfi.S         | 100 ++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-minstret-wfi.S

diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67..ebbbb01179 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -145,6 +145,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
     decode_save_opc(ctx, 0);
     gen_update_pc(ctx, ctx->cur_insn_len);
     gen_helper_wfi(tcg_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
     return false;
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 6a219c306c..96a3ab32c9 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -28,6 +28,10 @@ EXTRA_RUNS += run-test-minstret-ecall
 run-test-minstret-ecall: test-minstret-ecall
 	$(call run-test, $<, $(QEMU) -icount shift=1 $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-test-minstret-wfi
+run-test-minstret-wfi: test-minstret-wfi
+	$(call run-test, $<, $(QEMU) -icount shift=1 $(QEMU_OPTS)$<)
+
 EXTRA_RUNS += run-plugin-doubletrap
 run-plugin-doubletrap: doubletrap
 	$(call run-test, $<, \
diff --git a/tests/tcg/riscv64/test-minstret-wfi.S b/tests/tcg/riscv64/test-minstret-wfi.S
new file mode 100644
index 0000000000..0fd0158d5b
--- /dev/null
+++ b/tests/tcg/riscv64/test-minstret-wfi.S
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+	.option	norvc
+
+	.text
+	.global	_start
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+	li	s3, 0
+
+	/*
+	 * A pending, locally enabled interrupt wakes WFI even with MIE
+	 * clear.
+	 */
+	li	t0, 0x8		/* MIE_MSIE */
+	csrw	mie, t0
+	csrci	mstatus, 0x8	/* MSTATUS_MIE */
+	li	t0, 0x2000000	/* MSIP0 */
+	li	t1, 1
+	sw	t1, 0(t0)
+
+	/*
+	 * The first CSR read and WFI retire before the second read obtains s1,
+	 * so the expected difference is two.
+	 */
+	csrr	s0, minstret
+	wfi
+	csrr	s1, minstret
+	sub	s1, s1, s0
+	li	t1, 2
+	beq	s1, t1, 1f
+	ori	s3, s3, 1
+1:
+
+	/* Clear the software interrupt before testing the trap path. */
+	sw	zero, 0(t0)
+	csrw	mie, zero
+
+	/* Schedule a timer interrupt far enough ahead to reach WFI first. */
+	li	t0, 0x200bff8	/* MTIME */
+	ld	t1, 0(t0)
+	addi	t1, t1, 100
+	li	t0, 0x2004000	/* MTIMECMP0 */
+	sd	t1, 0(t0)
+	li	t0, 0x80		/* MIE_MTIE */
+	csrw	mie, t0
+	csrsi	mstatus, 0x8	/* MSTATUS_MIE */
+
+	/*
+	 * The first CSR read and WFI retire before the trap handler obtains s1,
+	 * so the expected difference is again two.
+	 */
+	li	s2, 1
+	csrr	s0, minstret
+	wfi
+	beqz	s2, 1f
+	ori	s3, s3, 2
+1:
+	bnez	s3, fail
+	li	a0, 0
+	j	_exit
+
+fail:
+	mv	a0, s3
+
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+
+	/* Semihosting call sequence */
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.balign	4
+trap:
+	/* Read minstret before retiring an instruction in the handler. */
+	csrr	s1, minstret
+	sub	s1, s1, s0
+	addi	s1, s1, -2
+	snez	s2, s1
+
+	/* Disable the timer interrupt before returning past WFI. */
+	li	t0, 0x2004000	/* MTIMECMP0 */
+	li	t1, -1
+	sd	t1, 0(t0)
+	li	t0, 0x80		/* MIE_MTIE */
+	csrc	mie, t0
+	mret
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0


