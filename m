Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThE-0008Kw-LZ
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThC-0008Fo-Nt
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:38 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThA-0001Qe-EO
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:38 -0500
Received: by mail-pg1-x529.google.com with SMTP id a4so5375872pgc.11
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=slvNnSfOOMqStV16Kdm2mbEbsrFhdjQ7TW2K/w2z7kw=;
 b=bCphI4g7sisltEyWc3RgN+HWtYOiVreaq7ExKzTnE+tFHxw/DB0yWEhpvnV8WM2BBp
 KPxG2xMIk/XsgqEgO5gqbkbZgYZakP9oAH9VKbuVKnglQODSCfzbjv80zw4q6MOVRIA9
 VoCkn4d0YpOyn4IICOuuoYKbZ7JXZFsBr+HF6qn2fQ3nrHKo4ffBgi5mpqiZ84bCSc2f
 j5q4UInoSrADm6falNXdcyyEx8iEACx+uKjYdRaBv/aaoyLhyOFil62kNf1f87VlISx2
 V634nwQyoxmpMfWUkFrVM9HCjAxQ4ci+YIi18KNXYuMMG0LGVwRVulx0FGHIw30WP6zK
 5yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=slvNnSfOOMqStV16Kdm2mbEbsrFhdjQ7TW2K/w2z7kw=;
 b=RhXMirtkIVRZuG5XmXyDW4GGeYxlOjE2A56UZoSXfvk9p6YCGskLv7M9RR2P2Wuefr
 rgDQ7nuFbWR0GFzDKUGXL68UXCQC5iwF5XBWKHy9lgGmLIAK3ybwowSuz3Kig2FIi3MH
 K8SPyBjPjMYLe4W+5+7bM1eQwE0FaN0tRFDqcQERXW++o48iCDBfYuPcMNOyVMDIPNVN
 ZUG6E6ixFXgOI+lSP2wqINrSDAHdfsm4XYclatQWI5x6NOo7OUc08w5cwc1ApY+4fa8h
 pE/Pe3tw8ViE0cPZC3yLWgzLXhvWDjsSNKpGjyip6cYPnhhZ+75LsOTR09UMzl13NeF+
 OWuA==
X-Gm-Message-State: AOAM533u+8Wx7qWb9yXz08TjFNs9dp/G1U0U3rMy3uTmsldCzMEazL4x
 wJ/V94Nt8yGVA7dFa75VjGa4EQ==
X-Google-Smtp-Source: ABdhPJxdy5COrI5WZClo/mDMc9PBwEAC3AofDGfE096/XfEJPycU8I5xj5+mmq+svkInQfWROHrxZw==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr994141pgl.281.1614309695342; 
 Thu, 25 Feb 2021 19:21:35 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 25/75] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Fri, 26 Feb 2021 11:18:09 +0800
Message-Id: <20210226031902.23656-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:21:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ad79669a2ce..367b182735f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,18 +395,27 @@ FIELD(TB_FLAGS, HLSX, 15, 1)
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
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
 
@@ -419,12 +428,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 367fb28186f..72d0bc109b0 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1268,7 +1268,17 @@ GEN_VEXT_AMO_TRANS(vamomaxuei64_v, MO_64, 35, rwdvm, amo_op, amo_check)
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


