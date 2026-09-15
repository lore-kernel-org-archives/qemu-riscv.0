Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6708C88E75
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 02:50:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6JFQ-0001n7-6z; Mon, 14 Sep 2026 22:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1x6JFN-0001mk-H4
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2026 22:50:13 -0400
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1x6JFL-0004af-My
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2026 22:50:13 -0400
Received: by mail-pj2-x01.google.com with SMTP id
 d9443c01a7336-2dae660f31bso28238395ad.1
 for <qemu-riscv@nongnu.org>; Mon, 14 Sep 2026 19:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789440610; x=1790045410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zIfRCXrwFq9A0MguHCRXRlhKTnM48nvriB1y/d3i2Gc=;
 b=mjLtnDr3RQCmv8SeOICrpq1VggJWq/8gl02KZXvZ664fSE1X2wi17BdttRjzdbJtbM
 KKjZzBz9HQ4hBB01bXLsXe8FSQohi+1o598WEftHgQ7q4EVQphgBjt46cDVaUSWLmT8d
 pUqo2TH8Y8ur5L94DBOWvRvwka9jqm3Uez27dUuJo5D/Nfp0v4DC7uOc8bHOCewFU8v4
 ixSuorMoKubqdCM9I8O7qD6oIAZxf1Ytxadat5HbpAuvjLjGJHc8rVnGW7sRGdrQ3755
 wzAoF07Ebmwhvc2HCrIq9OFyhrR8zUsHwoaK0nu78hMUsOAkFeHLQoXVnMGCtM04MM56
 hPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789440610; x=1790045410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zIfRCXrwFq9A0MguHCRXRlhKTnM48nvriB1y/d3i2Gc=;
 b=rDpwRkmLpfUITNRRdHu1pwBp51ICmOmkYHLm228aeg9a4LURowpnpDZQmc+ELvb7z/
 4NcIlZyRVEUNfvCX3ycesB25Z5wO8kgCniXeEr0QzX3xapd00/Z1ab+QK9RLHKmzsjye
 2RTnDDzXcQZhuS/cEmgRh+V826Hz0tk+hPYjvqDTxCg2YAvhNTXWO+yUdSPYLMit2P1N
 wCYk1XiAOszupoMJrTItQtKhevSc2DGK0aUaTFlyylcJyg5Yqb8/cx0iihAh3XFH+1W0
 Cqu7PxlOitHWOkoGhuu3AGXi2GjdzALZFk47ZihcDzR5QOAUfXiSdK8/o/+TcYYvu25O
 2V7A==
X-Gm-Message-State: AFuF++ll4lIyUVB2Hulk+hgTGI95ipGZ+4L4YBZGTuzoe2A/I6LhaYax
 WEIEYYvfyztebKq09jpUJB42CNcelLuz877uV1EoBPW1EMwV9fUHeqYn
X-Gm-Gg: AYBFou3lX0Ad8Xj2TbAQrAFK0X4iR+wYc+4+mtPH/bSfybgI8+80iqnNv08VOpJpHAo
 n+9srSAST5KA54c+gFOaRR3UM2epiUdcM8gCgpooX1NFO74p1LYUbTJVfF9rZ2xp9PsCczQR823
 eeoM6dmN1Npc7dB4yS3uy6KOikxXfbJL6NQiJ/RujEu7affkrfk39O/GfIroE5d0mI/PX5jAsUx
 EtdWT6jKhq/gUNwBrTP00GGaLV3MNwIvUDfEkJ+GZi3/HBazgOR5Q9m5N1NLqIVy0rYJtVeDh0e
 qViJNMs9GQ2gkWetbV4TAGrzXY/S98+r+Q3WRm93/aItyHyLUANnvqAD7sjUZB2HCTpzOVXl8LQ
 ihuL5GOBHWo1NAkRRbhcPddmMNt9xbQvaEK7NGvmdrizHT6BuSxNm3ws01G1JxZyiQD5YLz7CVi
 HSprxFERhsYnOn2sBCYS+V5qtQW7eyrP/cgHdT+N77qGBZpOMtcmLyLnN/gv8uGgLjyIIXmrbvt
 2CUVcIs3T6S+1N1ttp4raRs8akleG38thFCtyk=
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id
 d9443c01a7336-2dd6c5bfba0mr113696665ad.2.1789440609784; 
 Mon, 14 Sep 2026 19:50:09 -0700 (PDT)
Received: from Dell-WorkStation.localdomain ([103.190.179.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd2cfce707sm58445935ad.55.2026.09.14.19.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 19:50:09 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH] target/riscv: mask vsepc according to IALIGN
Date: Tue, 15 Sep 2026 10:49:44 +0800
Message-ID: <20260915024945.32329-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::1;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pj2-x01.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

vsepc is the VS-mode counterpart of sepc and is a WARL register, but
unlike mepc and sepc its accessors do not mask the low address bits
according to IALIGN.  As a result, values with invalid low bits can be
observed through vsepc.

Apply get_xepc_mask() to both vsepc reads and writes, matching the
existing mepc/sepc handling.

Add a TCG regression test covering both IALIGN=16 and IALIGN=32.

Fixes: 8747c9eeb2aa ("target/riscv: Add Hypervisor virtual CSRs accesses")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4420
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/tcg/csr.c                 |  4 +-
 tests/tcg/riscv64/system/meson.build   | 11 ++++++
 tests/tcg/riscv64/test-vsepc-masking.S | 54 ++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-vsepc-masking.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index bd4b6dc114..274c5cfbf4 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5299,14 +5299,14 @@ static RISCVException write_vsscratch(CPURISCVState *env, int csrno,
 static RISCVException read_vsepc(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->vsepc;
+    *val = env->vsepc & get_xepc_mask(env);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_vsepc(CPURISCVState *env, int csrno,
                                   target_ulong val, uintptr_t ra)
 {
-    env->vsepc = val;
+    env->vsepc = val & get_xepc_mask(env);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 8604c2a45a..5d633a266a 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -24,6 +24,17 @@ tests += {
   'test-crc32.S': setup + {'qemu_args': ['-cpu', 'rv64,xlrbr=true', qemu_args]},
   'test-minstret-ecall.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
   'test-misa-w.S': setup + {'qemu_args': ['-cpu', 'rv64,x-misa-w=true,c=true,v=true', qemu_args]},
+  'test-vsepc-masking.S': setup + {
+    'test_name': 'test-vsepc-masking-c',
+    'qemu_args': ['-cpu', 'rv64,h=true,c=true', qemu_args],
+  },
+}
+
+tests += {
+  'test-vsepc-masking.S': {
+    'test_name': 'test-vsepc-masking-no-c',
+    'qemu_args': ['-cpu', 'rv64,h=true,c=false,zca=false', qemu_args],
+  },
 }
 
 tests += {
diff --git a/tests/tcg/riscv64/test-vsepc-masking.S b/tests/tcg/riscv64/test-vsepc-masking.S
new file mode 100644
index 0000000000..e5460f8aee
--- /dev/null
+++ b/tests/tcg/riscv64/test-vsepc-masking.S
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#define MISA_C          (1 << 2)
+
+	.option	norvc
+	.text
+	.global	_start
+_start:
+	csrr	s0, misa
+	andi	s0, s0, MISA_C
+
+	lla	s1, test_addr
+	ori	t0, s1, 3
+	csrw	vsepc, t0
+	csrr	t1, vsepc
+
+	beqz	s0, ialign32
+	addi	t2, s1, 2	/* IALIGN=16: bit 0 reads as zero. */
+	j	check
+
+ialign32:
+	/* IALIGN=32: bits [1:0] read as zero. */
+	mv	t2, s1
+
+check:
+	li	a0, 2
+	bne	t1, t2, _exit
+
+	li	a0, 0
+	j	_exit
+
+	.balign	4
+test_addr:
+	nop
+
+/* Exit code in a0. */
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


