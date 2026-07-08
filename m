Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59429C44501
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:20:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whUzj-00017Z-SB; Wed, 08 Jul 2026 12:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzi-000174-JM
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzg-000736-TA
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so12111305ad.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783527568; x=1784132368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ig97WpfeXz/888YzMr7xwpyDzcUHfi9CfPRuEEEpI08=;
 b=XQ7cCFCr0Fsu32VuPi/A5f5rjAesY1ZZdmhlx6mosTlc9OwTQMaglVna5OsMeVMdrZ
 dSQf8IDUj9oD0KECJrupslbyeKuz9+PuMCGQs+jJ+h4WbXqqN5Ivc8J653uOvRJMeeFq
 PFA0GBRIx9I8wFEUkEmG2mAehndcSNQhAJJnnfI5xrWe2RSzPqCKtaoF4plZemnnzmuU
 bI6gviWMNInDUN85Xw4SU9qFCrPok+u6Dsfetdfw6+4aIgGCIuWTX5G0D5ptffz/eSjV
 52Y1FMZ8urr5PFtZrqIPw4H2TP/FG2DNwuqzwQJLBMS1wWvl9vM95Cf5j4bEmFkI0jJV
 yNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527568; x=1784132368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ig97WpfeXz/888YzMr7xwpyDzcUHfi9CfPRuEEEpI08=;
 b=KV/OA6btmW60nn2rKY+sb5xxPti0MTpabkQl216CqcruNvozxqukZ4r5nTtPoyFQZn
 Z0ttjv6266AezwnN+0mwnXMW3gXuxsCyTpnDGPMzOTM1UyP/asFZfbzA44QOu15Cq1DD
 FLI3TTXKQocZ2YnXZksFuSeUbgpAmwOQXP9+Q5WUj89OMwQnkUKRzljJn3AJMOBmJYxL
 myr/+OH+K9sZintyP2XzyHPiJY+9f3EXCTcWHFYxCzgFWeAokm8PLVfUebsOxVockGHi
 AiE9uC+BaCws0SS7PtpESBbtutAnfJWtEmRSwA3zW5sLqJIccenSc/b7OMess9dUrbTw
 KFpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYpt896JF8nlUlVS+0fbhnnceysgDJi8tEsBUGROXhERg7p5h3C1rPYO0P8rPjMIzcyKlRZkA8CaqK@nongnu.org
X-Gm-Message-State: AOJu0YzZwH0IZYZEJdjDsmoD5THoFHt9BLk6UEgupGJnajpFp5EWnV8f
 te2ZjtI8C3Epi3JH2eu6Qv0dd1Aph4QZKzQG6GrBuU1Q1W/iqmN4iJG306vDbML61aU=
X-Gm-Gg: AfdE7clMjE+G5otp1gtK+KimyloMBujwe15Vn3SWYbipV6O+Uw68h9W9YMDpkS4l7m8
 tVHyNfYRZF9fdKI5Az51jfmaw1IV5Uq/ep9gO6HvtE01LUARtqZVBvZg0K4mgaefgxgYWzznckI
 GR9TPYZ+YFu61P6JlS95pu0JJCqBEMFo7eP7qtJzxj/MC2L4zq8xAgkAeEa9WuPD7fU962q6DZx
 f+IUyy5hBepglVi9QDDDUaisuwsXrEUhISKFlZTgryudTtKMzeH4qWfTzrbZHkBr3jd7qdmOEQc
 C2hgk1D0+GcpuBrY8DYhoNqP/eKcQ95yo7N6hMN+euDIrEJ6OwzFsWYv3I46TG5wC6TH+Z39cml
 EpjZ5R4gENdgsT2lVvUNotLWIz/c+CFpbNcRT27/zVai4nFMlP/0ZUiC6KlFxMUF0/gGNIj1+qu
 /X5kAJ3YMvJJXYRan8ZFECE/uAKep5Jxik7ROzkiTKrnNRxaOPRkhZiCaluDFWY2XV+1fNd26Ty
 7RgiPSZ9YlMXbVM
X-Received: by 2002:a17:902:db04:b0:2c9:97a7:3278 with SMTP id
 d9443c01a7336-2ccea483c06mr32743835ad.41.1783527567651; 
 Wed, 08 Jul 2026 09:19:27 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb56fsm30789265ad.15.2026.07.08.09.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:19:27 -0700 (PDT)
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
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 7/9] target/riscv: rvv: Add vfncvtbf16.sat.f.f.w
 instruction for Zvfofp8min extension
Date: Thu,  9 Jul 2026 00:18:57 +0800
Message-ID: <20260708161859.1124848-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708161859.1124848-1-max.chou@sifive.com>
References: <20260708161859.1124848-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
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

The vfncvtbf16.sat.f.f.w instruction converts a vector of 16-bit
floating-point numbers to a vector of 8-bit floating-point numbers with
saturation.
The VTYPE.altfmt field is used to select the format of the 8-bit floating-point
numbers.
* altfmt = 0: BF16 to OFP8.e4m3
* altfmt = 1: BF16 to OFP8.e5m2

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn32.decode                    |  3 ++
 .../riscv/tcg/insn_trans/trans_rvofp8.c.inc   | 42 +++++++++++++++++++
 target/riscv/tcg/translate.c                  |  1 +
 3 files changed, 46 insertions(+)
 create mode 100644 target/riscv/tcg/insn_trans/trans_rvofp8.c.inc

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 21272fdb50..d690dc3bc1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -973,6 +973,9 @@ vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010111 @r2_vm
 vfwmaccbf16_vv    111011 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmaccbf16_vf    111011 . ..... ..... 101 ..... 1010111 @r_vm
 
+# *** Zvfofp8min Extension ***
+vfncvtbf16_sat_f_f_w  010010 . ..... 11111 001 ..... 1010111 @r2_vm
+
 # *** Zvbc vector crypto extension ***
 vclmul_vv   001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx   001100 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/tcg/insn_trans/trans_rvofp8.c.inc b/target/riscv/tcg/insn_trans/trans_rvofp8.c.inc
new file mode 100644
index 0000000000..d28f92e050
--- /dev/null
+++ b/target/riscv/tcg/insn_trans/trans_rvofp8.c.inc
@@ -0,0 +1,42 @@
+/*
+ * RISC-V translation routines for the OFP8 Standard Extensions.
+ *
+ * Copyright (C) 2025 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define REQUIRE_ZVFOFP8MIN(ctx) do {        \
+    if (!ctx->cfg_ptr->ext_zvfofp8min) {    \
+        return false;                       \
+    }                                       \
+} while (0)
+
+
+static bool trans_vfncvtbf16_sat_f_f_w(DisasContext *ctx, arg_rmr *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZVFOFP8MIN(ctx);
+
+    if (opfv_narrow_check(ctx, a) && ctx->sew == MO_8) {
+        gen_helper_gvec_3_ptr *fn;
+        uint32_t data = 0;
+
+        fn = ctx->altfmt ? gen_helper_vfncvtbf16_sat_f_f_w_ofp8e5m2 :
+                           gen_helper_vfncvtbf16_sat_f_f_w_ofp8e4m3;
+
+        gen_set_rm_chkfrm(ctx, RISCV_FRM_DYN);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, ctx->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, ctx->vta);
+        data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
+        tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
+                           vreg_ofs(ctx, a->rs2), tcg_env,
+                           ctx->cfg_ptr->vlenb,
+                           ctx->cfg_ptr->vlenb, data, fn);
+        finalize_rvv_inst(ctx);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index 9684dbe752..aa96316a38 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -1213,6 +1213,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_rvbf16.c.inc"
+#include "insn_trans/trans_rvofp8.c.inc"
 #include "decode-xthead.c.inc"
 #include "decode-xmips.c.inc"
 #include "decode-xlrbr.c.inc"
-- 
2.55.0


