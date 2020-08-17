Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7arS-0008IE-5A
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arP-0008C1-Po
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arN-000533-OF
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id mt12so7483230pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PeNRirOsAYetV+xE0dMFlxFMaG6kB8KyHDl0oM6vhPg=;
 b=Mi6GU1ZHrB3tXhXAtm5y9Uhbng5e1lOuqdgtvxyLdf8Qz7yEEKp486bEgE87PRZms2
 Sje5dOtup0/XjKJ0WkCa/VzXFGVTuOxYt9iSOl3gWFFXv4wVMpiKHCgXKg3d8PFLS2Y0
 BExNRdQ1mHz+9rRVea4CJJ5QzNMm6LOhe+3dgJko4Yl8oguYjRu0o/+53rrqKmFaky7d
 GOGJLKpb+7wWtDgRNTjbtMAvAguzXfdKOWv/ZSzhGI1h1T0JU38vG3BcRQfocvatt8LY
 43rh5Vy/VdsW9aiCx79oB+tBmexrE9Nfq4s2+y0aaYlcDzw7f6G9/qwAHwJWQB+FR2zv
 Vb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PeNRirOsAYetV+xE0dMFlxFMaG6kB8KyHDl0oM6vhPg=;
 b=e0xhWn61zC1u5jfWmNlYddCeJKrhmeTHgKXliUeePAmQT5AFo1h6hDpc+2rWay/pUm
 Bfhywn77fHkkLy58P/v6kvxOLrlk/yOZ53O753uoPhmEgh7js+eoae1+UUKKQkeSuaWN
 iujgJLXlfNbb4EKlsgdRjEwkK9McwiBlR6UQhFAh2685qUIZ+2LhB9mr2RN5EUua2eXo
 S6j7zyb8/sueSvPtiy1nlwrrQ53l55SuHrk7r51TXCUOwuQ1/eUiw4t9tU/eKJDAOno2
 0BKlLevmFeeQtg3M+fXEu976WOiKZqHgH5wOghOwPCjhAhfuTZ61zTtUZeYEWn93A638
 OHgg==
X-Gm-Message-State: AOAM531PETAfMfXngi4cwmACY7mpOeBcaLxCQ7wdijV/VNAe446qpPAx
 NaNO++qmmZbLkfWlyOBy1XnNzw==
X-Google-Smtp-Source: ABdhPJw66PmA7IeJjOAhKY1a6JX9ieUzL0pqRdA0zJf+BRgjp8zjFA1dWphEiC2hVy9F0EEJCHgA3A==
X-Received: by 2002:a17:90a:c591:: with SMTP id
 l17mr11453226pjt.17.1597654276410; 
 Mon, 17 Aug 2020 01:51:16 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 25/70] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Mon, 17 Aug 2020 16:49:10 +0800
Message-Id: <20200817084955.28793-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2020 08:51:20 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b5e6429015..715faed8824 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -376,18 +376,27 @@ FIELD(TB_FLAGS, SEW, 6, 3)
 FIELD(TB_FLAGS, VILL, 11, 1)
 
 /*
- * A simplification for VLMAX
- * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
- * = (VLEN << LMUL) / (8 << SEW)
- * = (VLEN << LMUL) >> (SEW + 3)
- * = VLEN >> (SEW + 3 - LMUL)
+ * Encode LMUL to lmul as follows:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ *
+ * then, we can calculate VLMAX = vlen >> (vsew + 3 - lmul)
+ * e.g. vlen = 256 bits, SEW = 16, LMUL = 1/8
+ *      => VLMAX = vlen >> (1 + 3 - (-3))
+ *               = 256 >> 7
+ *               = 2
  */
 static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
-    uint8_t sew, lmul;
-
-    sew = FIELD_EX64(vtype, VTYPE, VSEW);
-    lmul = FIELD_EX64(vtype, VTYPE, VLMUL);
+    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
+    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
 
@@ -400,12 +409,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *cs_base = 0;
 
     if (riscv_has_ext(env, RVV)) {
+        /*
+         * If env->vl equals to VLMAX, we can use generic vector operation
+         * expanders (GVEC) to accerlate the vector operations.
+         * However, as LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes,
+         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
+         * only when maxsz >= 8 bytes.
+         */
         uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
+        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t maxsz = vlmax << sew;
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl)
+                           && (maxsz >= 8);
         flags = FIELD_DP32(flags, TB_FLAGS, VILL,
                     FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 334e1fc123b..2c6efce00a7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1268,7 +1268,17 @@ GEN_VEXT_TRANS(vamomaxuei64_v, 64, 35, rwdvm, amo_op, amo_check)
 /*
  *** Vector Integer Arithmetic Instructions
  */
-#define MAXSZ(s) (s->vlen >> (3 - s->lmul))
+
+/*
+ * MAXSZ returns the maximum vector size can be operated in bytes,
+ * which is used in GVEC IR when vl_eq_vlmax flag is set to true
+ * to accerlate vector operation.
+ */
+static inline uint32_t MAXSZ(DisasContext *s)
+{
+    int scale = s->lmul - 3;
+    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+}
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.17.1


