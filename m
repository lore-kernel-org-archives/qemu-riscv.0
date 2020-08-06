Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRt-0002lo-PY
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRn-0002dq-Bl
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRl-0007rR-F9
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f9so6276658pju.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nX6MJ9PYiWQKpC5zQpm1pvFGgxZuOcYLJio0AUt2XK8=;
 b=Nqee0zeVycSdmGnb/QA/jFgJ2oLQya+RO1oTsv0A3UhlsOCmVA0C4YlEJ1aRr2e1MZ
 yDLXMFps6HZMUk/MoKtssYkwCRE/gIovOzy7d2N5i0OM0vMb/cbPtObewR4G811WOymQ
 kfLcfEuLRDIzU5wjgxhmBYyfFFMB21EyGcpjg43Po2MWm9eUDl/tDAMi/kRfMm+e9o1q
 aLyKqSv3YDuOz0AOvPVNko7itnTy0shpAtS8LHm+m4D9ObQcxM7AGWccihloDhExd0OI
 vFibhUSRk1pi9Don+bKaH/XfpFhec1lfXXjSMrRMRe3MsaWYkt2kJcBOuOwah6uGwHZd
 dC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nX6MJ9PYiWQKpC5zQpm1pvFGgxZuOcYLJio0AUt2XK8=;
 b=EJZUrpy1rfKE8XATKtHZzLe//oEvIteGTDt3ipeL+FtlHoMRZPGsZUbiTxeMo5smOt
 EMUT2BO1iz2wsgKvjATx+NLzycFLQKvo2gldSRqxi5/uW5TxS2UxNZcuV58tJqn+9rV3
 MjO1iSW+KRY6Q0rsu2FOLAEtQtlIoLln5BZtJ6PtcRwtZZ5ZFmQ24s3EcW3dFTUxnNV7
 +1XhYsrCLjUWmVjSVULmLdMweYvncIUQXeLLn2+NnkFMQTYsydTjJjlabQ9qxv4vL9p7
 eUKzgSrl5nLEbQSvQNQenbKjJDF5jcBp98JkwjbHHbYqLyqg3daKwfoOFg5PTDsxgHTR
 jq5w==
X-Gm-Message-State: AOAM530/ea+kT5GsboA99/7g6megY6gLtKNSeTP/5VlPJpgOUqNkY8Fj
 IlViuJAxHJFr2Itq98bSOz5bQw==
X-Google-Smtp-Source: ABdhPJzh4qsQ2Uc/uwOz6+xvIpv3WuDLqHwNASnpaKpX9obRlkusvSCsxZCIFjhCS8T/KNMMpw+hLg==
X-Received: by 2002:a17:902:368:: with SMTP id
 95mr7355581pld.279.1596710908164; 
 Thu, 06 Aug 2020 03:48:28 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 27/71] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Thu,  6 Aug 2020 18:46:24 +0800
Message-Id: <20200806104709.13235-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 44 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b5e6429015..78264d6ffc4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -376,18 +376,28 @@ FIELD(TB_FLAGS, SEW, 6, 3)
 FIELD(TB_FLAGS, VILL, 11, 1)
 
 /*
- * A simplification for VLMAX
- * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
- * = (VLEN << LMUL) / (8 << SEW)
- * = (VLEN << LMUL) >> (SEW + 3)
- * = VLEN >> (SEW + 3 - LMUL)
+ * Encode LMUL to lmul as following:
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
+    uint8_t vlmul = FIELD_EX64(vtype, VTYPE, VLMUL);
+    int8_t lmul = (int8_t)(vlmul << 5) >> 5;
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
 
@@ -400,12 +410,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
+        uint32_t maxsz = vlmax * (1 << sew);
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
index 725f36fcfcc..82403dff4b9 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1255,7 +1255,16 @@ GEN_VEXT_TRANS(vamomaxuei64_v, 64, 35, rwdvm, amo_op, amo_check)
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
+    return (s->vlen >> 3) * s->flmul;
+}
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.17.1


