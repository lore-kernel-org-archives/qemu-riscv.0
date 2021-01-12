Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBY-0003zN-65
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBV-0003tL-W3
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBO-0007dL-W9
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:53 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v1so1255119pjr.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0ZTAcHxcRWV43mW9cFgxo36O36FOtN4S2TTOgrw8kPA=;
 b=ZcF7MGpdFVfYCcFDUv0xOGSor184osnfd5oA391i8xZTN8UzvbsJhFqmIRfC4i2f8o
 wZjyh3WLwOxe8SIfHnWTG7h7rTa5lkpYjqj8nC+SMI88EvC/pY5m5UNwdBpuWn3gDZRh
 0v4GAhTH3WnLwajGwjQlAyIiTS5epqjJmwY4jaEHJMz1ukV/o0/EK/C8P+lzHjbtwSuO
 d8Gba8q2O5YDChelkwSxULtwqNjmXEO57hflfGaKuLXP9uJQa2u01K5qDuRSuqv92CoF
 56p/m7Zyd7l0/WHo84F9jU2QJ5ckqQRE4/YpGjdv+vmzRRrguu8KGdMGxc8PtKfCtEvh
 mE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0ZTAcHxcRWV43mW9cFgxo36O36FOtN4S2TTOgrw8kPA=;
 b=tA1FfKJMZm+eDJ/IBZYJcCUdcUk+8y19TjVB3iphIZr9/ZhFVMGnJ7uLtD9T+sHall
 iWaJy1AvJMiFVAu0gBYiWhMfrscS45ZKh7hSDaUjs4V8CbmpZb8PIZEt6cyVGoi3Afaf
 bfrQzld5bXX38tX+4BLyJNWMu2o/73WQV3Nd61hbytNlmESHsUeAHT2QOvgaldZMVNvT
 4tu+OifbSPaTM9BXjLvDmSV1BHq8r/mtEyX024dLhwon0kxjG4X9td52LwqC2Osfbafu
 lxxXAJgwl7IqOYynSHywY66PZaRO757u19WTIgABwXRCDtmyLOe655PWFQl2CIjfrjRK
 mzcA==
X-Gm-Message-State: AOAM5324lcSCv5BY3kFeshrdTZSo5607nuWrWNx3cE3jrmVfCgYkCI2b
 XQu4HpwUB0QT0JoEYD5b04djKw==
X-Google-Smtp-Source: ABdhPJxJm8siWwCbRqXBqbQFb8pDHUOaVdmgA4nfrih94jtqIXtz2HeWlYzqxEyThhWEHuC7Pf5owA==
X-Received: by 2002:a17:90a:4a85:: with SMTP id
 f5mr3678996pjh.117.1610444505072; 
 Tue, 12 Jan 2021 01:41:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 25/72] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Tue, 12 Jan 2021 17:38:59 +0800
Message-Id: <20210112093950.17530-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:41:54 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aae3512c33f..993539aed94 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -392,18 +392,27 @@ FIELD(TB_FLAGS, HLSX, 12, 1)
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
 
@@ -416,12 +425,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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


