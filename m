Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWzK-0003y7-MI
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzJ-0003sQ-3A
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:53 -0500
Received: from [2607:f8b0:4864:20::102b] (port=56029
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzH-0000QW-CD
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:52 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v23so11485980pjr.5
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOj+WAwR3Y+ZbPHLpBezoiGEudJOTaitId1dfFRvKug=;
 b=Z5UsqwJWr1hwwGUZOX++TPQsti/MKgsRs/FsoAkN7mDrwqVzt2cBjsIyIKF9TPz88q
 NB7sn3ZzEoWdBYJptBwhGa1VmyGNqFlyAoz6MltNkgle63xpw6vmQPVTNY/ZJd6G6Yov
 /S39W6au+NRyot2kNlYiDgV5ZJVVROkVFHLZt1dR19zqBKvLCTOip7csHuKJ22IXzcqV
 kT3nq1ugYC254IJHtGKNDfld5pzhwx3oFqis0QXoTICJBdQNYtk7at8H9XW3JIz9VD+/
 4BnLUXclRl8RrhBbW3LKXwsmKj+Sh5Yq/YsP3UhbjxwvQFBQIIMrpFnq1hgJhTq6TBjx
 QNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOj+WAwR3Y+ZbPHLpBezoiGEudJOTaitId1dfFRvKug=;
 b=ToLKNwRHdmSygxBEXPcblEWz5JqgzlUdb/sUnYOcnhVz4yx9bbIGrizXhCjel3EAMD
 O68aJPE0gliugWWOpq7Jpr/GRs0Sv2CdpW/dtWXuXbRGqu8dG2xC4c9KuyoTZ2moNR77
 9d1xjgTh9ab+EqAYQhr4XnVlB56bQ4QtepuY5yv+wcTFFxr9magXituRzXWy3CWXaPN6
 JiAj5iE4NmViig7YpXSM9o7E4tynRa5/AJ0gmi+d0MEew/NEhDAHYItBskWQznnVRLtZ
 Ty8+G6a4FaZ7tmVJZpFhUIBedEO3v+PtnYWvku1C/u4VOJ6xZ/5GHKeQ9gGq2LJoCVSD
 qulw==
X-Gm-Message-State: AOAM531lUQoP3vCAzVLhl2WK1oamPUQMXNEI7GrMxRXcuKLWNizLAOz1
 6jTUu5SP+WS0VqHiNNQEzKuvZQ==
X-Google-Smtp-Source: ABdhPJzkP5chfoXmTv28SGONjKQpYtqadcuhMRPTmW7qdOnPnyZ0vv/TckXI1LVr3rJiZ9rfeP1Epw==
X-Received: by 2002:a17:902:744b:b0:142:46fe:7fbf with SMTP id
 e11-20020a170902744b00b0014246fe7fbfmr56122189plt.83.1638155149881; 
 Sun, 28 Nov 2021 19:05:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 26/77] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Mon, 29 Nov 2021 11:02:46 +0800
Message-Id: <20211129030340.429689-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:05:53 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 27 ++++++++++++++++---------
 target/riscv/cpu_helper.c               | 16 ++++++++++++---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++-
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 709b7c3abbb..11a0f41b27e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -430,18 +430,27 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 
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
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7149657edf9..cb58b06dfe7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -75,12 +75,22 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
+                           (maxsz >= 8);
         flags = FIELD_DP32(flags, TB_FLAGS, VILL,
                     FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e12db9aae8b..5c04ac90dae 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1049,7 +1049,17 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
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
2.25.1


