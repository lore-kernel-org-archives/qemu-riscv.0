Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B4DC53219
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 08:42:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woGuz-0002KQ-Ok; Mon, 27 Jul 2026 04:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1woGuy-0002K1-Q8
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 04:42:36 -0400
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1woGuw-0005df-U2
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 04:42:36 -0400
Received: by mail-pj2-x00.google.com with SMTP id
 d9443c01a7336-2cc6bb7476dso3818075ad.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785141753; x=1785746553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7JHbtJerH3/rQGbPisECyh5JnAIvKEhV7En67m13MGo=;
 b=nWRlwCpNtpAhRZyNG6YJwiUdEuKcw4Iih20w6gNowzkr3hIXG7FOh1L2QvJ2wuI/55
 QPJ6baJQFWjydRQbnHw9MVFR7tcE4Ou3O42vDRbuK5qW7SfvVzPwNshR1xPRZXDTnm0q
 hiQYl6M9yqeBtjtv2p73vd/TwbxUP8XS6kfVePKbTJJCzTA7kIQ1hZinb9f18jLZj1sb
 wU7Ecd9OGOaL4XeoZpfkT3WyVv/gZ8wHmXZHJKaPwWqXVIqbQ/p7aKR68mKA2l1+qcgm
 kqN/SQf8oY/8vsA6Q1IAHyMAYp0YNRQ4kVh07hnrpbnIGdgeWKb5+j+UqpZCmw4g2hEy
 hlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785141753; x=1785746553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7JHbtJerH3/rQGbPisECyh5JnAIvKEhV7En67m13MGo=;
 b=rZ0K3lv87jHt7Eo3zXOkfOetrU+XkiiI7kxKzuYeX8Yp9mFwBEhXP0McMmyQHGmnM0
 20KFNE1AuZOwubCNN4h758gjvHiDZMs/ACA2RAipLx7N/AcobtfbzVD5GOavaZDwMG4t
 Dq5AmLYKhxwRFOA7VrXdm5xmjbF7PErAEbmnfl+e0FkdMii73ilCYBcNCYDVBZ/QQoEY
 XiBXGGQ9cxmHwZLRRIoZgTKQHAKRJQcMu3yEaN+Vs/gj2HAFmsgoZVEDaAzgFKokMP5d
 tJ19QuZgB4Mf2DtJUVCdv7oqmHwxD0JR5dkCdGEQk34lKim/4elsG4dz84OfAlek6AuS
 wDVQ==
X-Gm-Message-State: AOJu0YwTAGP3EzTs7HNkGTtuczaOKmsUM6VY0AG4L/q3nmZLoD4P+bTb
 2R+hpH+0TJ4oM7SWSFBvHk0NHTVOjMeICtzu+oyY1nNAhfLVSHojsqW7
X-Gm-Gg: AR+sD12drEAhfOSjxSd5lxqwkXtwv2B0HSeVDrzG46VHegKVXi/g9EWCS9ybHqnRu8N
 FI07CosBIxzD1CdmyJuz4MgmPkPGP6/q7DEyvKnfTlXrKpOaEbPk0oWvccsB1drvs23OLLfw7Eh
 hBnx2zYwjqkOJ12cNXK2Qm3Tqs5zzni5zEJFOoZ236dVkEACHTf8CVQq9n0DWQclJBJPHBaCYsi
 Ii6fqY3s9tvTEzlp8ij3s21jXqqo4U6AsGScvRECoDupTDopSE3usMdEpircErMNV6cEgsVoFN3
 h5Px+oEZuwZtKp5p5lUxVfrovJ/t30Hq1nMnHJS5vqu22WeMGVIrbNATpCXKaaAzrHWLtcll4vK
 oemiSsz1aUyMMV7pRLYFISL6eMDAoWD/BsSh/QbHYsfYBRDRXAoMo2NOYXeXZo+oYReOipKZcJz
 RrQidzxMsD/1eq6aW6FJPZYyeOuBkGRJE=
X-Received: by 2002:a17:902:e803:b0:2bf:13af:b077 with SMTP id
 d9443c01a7336-2cfdf3f056amr64493725ad.14.1785141752522; 
 Mon, 27 Jul 2026 01:42:32 -0700 (PDT)
Received: from Dell-WorkStation.localdomain ([139.59.245.192])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde59bc68sm30767175ad.2.2026.07.27.01.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 01:42:31 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v2] target/riscv: preserve vl on element-zero fault
Date: Mon, 27 Jul 2026 16:42:03 +0800
Message-ID: <20260727084203.881580-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724030145.14778-1-fritchleybohrer@gmail.com>
References: <20260724030145.14778-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pj2-x00.google.com
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

A unit-stride fault-only-first load must leave vl unchanged when element
zero raises a synchronous exception. Keep the shortened value in a local
bound until all loads complete, and only then update the architectural vl.

Add a bare-metal RVV regression test which faults vle32ff.v on element zero
and checks that vl remains unchanged in the trap handler.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3544
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
Changes in v2:
- Fix commit message formatting.
- Enable vector state in the bare-metal test.
- Use an aligned unmapped address and compare against the vsetvli result.
- Express the mstatus.VS setting as a field shift.

 target/riscv/tcg/vector_helper.c          | 23 +++++----
 tests/tcg/riscv64/Makefile.softmmu-target |  5 ++
 tests/tcg/riscv64/test-vle32ff.S          | 57 +++++++++++++++++++++++
 3 files changed, 76 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-vle32ff.S

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index e321ca2616..5a310822b7 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -686,7 +686,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
           uint32_t desc, vext_ldst_elem_fn_tlb *ldst_tlb,
           vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz, uintptr_t ra)
 {
-    uint32_t i, k, vl = 0;
+    uint32_t i, k, vl = 0, load_vl;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
@@ -752,22 +752,24 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
         }
     }
 ProbeSuccess:
-    /* load bytes from guest memory */
-    if (vl != 0) {
-        env->vl = vl;
-    }
+    /*
+     * Keep a shortened vl local until all loads complete. In particular,
+     * an exception from element zero must leave the architectural vl alone.
+     */
+    load_vl = vl ? vl : env->vl;
 
-    if (env->vstart < env->vl) {
+    if (env->vstart < load_vl) {
         if (vm) {
             /* Load/store elements in the first page */
             if (likely(elems)) {
+                elems = MIN(elems, load_vl - env->vstart);
                 vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,
                                   log2_esz, true, mmu_index, ldst_tlb,
                                   ldst_host, ra);
             }
 
             /* Load/store elements in the second page */
-            if (unlikely(env->vstart < env->vl)) {
+            if (unlikely(env->vstart < load_vl)) {
                 /* Cross page element */
                 if (unlikely(page_split % msize)) {
                     for (k = 0; k < nf; k++) {
@@ -780,7 +782,7 @@ ProbeSuccess:
 
                 addr = base + ((env->vstart * nf) << log2_esz);
                 /* Get number of elements of second page */
-                elems = env->vl - env->vstart;
+                elems = load_vl - env->vstart;
 
                 /* Load/store elements in the second page */
                 vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,
@@ -788,7 +790,7 @@ ProbeSuccess:
                                   ldst_host, ra);
             }
         } else {
-            for (i = env->vstart; i < env->vl; i++) {
+            for (i = env->vstart; i < load_vl; i++) {
                 k = 0;
                 while (k < nf) {
                     if (!vext_elem_mask(v0, i)) {
@@ -806,6 +808,9 @@ ProbeSuccess:
             }
         }
     }
+    if (vl != 0) {
+        env->vl = vl;
+    }
     env->vstart = 0;
 
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 82be8a2c91..7ae225bd73 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -41,5 +41,10 @@ comma:= ,
 run-test-crc32: test-crc32
 	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)xlrbr=true $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-test-vle32ff
+run-test-vle32ff: test-vle32ff
+	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)v=true $(QEMU_OPTS)$<)
+test-vle32ff: CFLAGS += -march=rv64gcv
+
 # We don't currently support the multiarch system tests
 undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/test-vle32ff.S b/tests/tcg/riscv64/test-vle32ff.S
new file mode 100644
index 0000000000..f510960c05
--- /dev/null
+++ b/tests/tcg/riscv64/test-vle32ff.S
@@ -0,0 +1,57 @@
+/*
+ * Verify that a fault-only-first load keeps vl unchanged when element zero
+ * raises a synchronous exception.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+	.option norvc
+
+	.text
+	.globl _start
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	li	t0, (1 << 9)	/* Set mstatus.VS to Initial. */
+	csrs	mstatus, t0
+	li	t1, 4
+	vsetvli	t2, t1, e32, m1, ta, ma
+	li	t0, 0x18000000	/* Unmapped gap in the virt memory map. */
+	vle32ff.v	v1, (t0)
+
+	/* Element zero did not trap. */
+	li	a0, 1
+	j	_exit
+
+trap:
+	csrr	t0, mcause
+	li	t1, 5		/* Load access fault. */
+	bne	t0, t1, trap_fail
+
+	csrr	t0, vl
+	bne	t0, t2, trap_fail
+
+	li	a0, 0
+	j	_exit
+
+trap_fail:
+	li	a0, 1
+
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	8
+semiargs:
+	.space	16

