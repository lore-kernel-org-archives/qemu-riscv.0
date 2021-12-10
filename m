Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvann-0005ub-Dq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanm-0005rR-2u
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:46 -0500
Received: from [2607:f8b0:4864:20::102c] (port=39570
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanh-0006qN-Cw
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:45 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so8837563pjc.4
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2SANNTcG+wSve47cZfCxV6EZdMApcgKrjabQeT7YkEc=;
 b=NSYtW+e+yU1Pvw/1wansKVRVOIAH12pQvKwa4iPHPWFrFcKyMsElXpDnyo9fJHoOp7
 u6WmisKvyl/NVIa3L8PUkzRoqvE1bSyuZ7wIN6d4VXKgQzTouyhmrac6/5u2xbpeJMEX
 48nlJI7j9dkn6Az3QmvDTxaMlha8ScXxHrJlxyCoWz91g7G7hmB3gNbQ04+/pdZTDjsx
 BwkOZ8SHgGisXtDjVwJsQR1+aC9agPrAgpXKuFn5I9f0VbS9Wyv4IUT9IYGBYEnVfzG6
 rCN/43ivw3i2r8f2nYf49OT1H4Aypn0WfN2/dtkIMBRe0Az7jpSREWbAL2fvPOwyHLXd
 B0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2SANNTcG+wSve47cZfCxV6EZdMApcgKrjabQeT7YkEc=;
 b=45rl31WLwNZwwJvbT9udGesz3lbrUQWU+G0ZKqQuXGmf9v/KTJ3UK8xwRe1gKuVC61
 Z3D84HVgRrci62SE2yk7KlxcZm1E4jrb09AZFZknLsVNP6bMNqBOETsunrFUQa4lk4lp
 6HPxu5iqwl5tXsQW7tKWeenDWX15LJJWRKo2IE/NKpuOKTOXMFNOZNZ8H+Qs7Udeoosb
 cy5dyk02kSJnVVF3GEcmYGZRVoqsmhuEk7JiPoMSscvwVzN4656wmd7elo28jjPEMj7U
 a0amIXP7EnFUwjyAThTMoT66Umx5x3fqGra4fJRmW1vu1XmNTfXl0s+v+RTf5Xeh24YY
 KfuQ==
X-Gm-Message-State: AOAM531RfY8/M+tz9MZC3VCGdNQOFHiTIHBL56689A6wuq3eT6Va4R80
 ezqKky7tMJurLVeJtIqc+bJtxg==
X-Google-Smtp-Source: ABdhPJzip433aSqhuz1VQt0cEjHhPKPaAuMFY6CFCGTvAsmlm08+WvryyxeyH6Wu8/8RO5VKnpAs6g==
X-Received: by 2002:a17:90b:2504:: with SMTP id
 ns4mr21261712pjb.175.1639123120213; 
 Thu, 09 Dec 2021 23:58:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:39 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 26/77] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Fri, 10 Dec 2021 15:56:12 +0800
Message-Id: <20211210075704.23951-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:46 -0000

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
index 709b7c3abb..11a0f41b27 100644
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
index 1b31d0ad47..10f3baba53 100644
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
index e12db9aae8..5c04ac90da 100644
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
2.31.1


