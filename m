Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscg-0006Dg-Fr
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdO-0005Lj-Ju
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdM-0006dw-Ur
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id u185so2394747pfu.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Afn//yuDHYlwmeDLeugD9iFDGG3BuB4CBEbnqgHeFYg=;
 b=hPdkU7hvu27npTw0jN4LwHmB98HXTMPsFOags/K/JWIuTjP16cgnVe25CqTCSEhnN6
 DSt1QLXeVUqXvyDOWHeTgVez3u1KL2/3h3d2dR6xIQsOOo4OSFYaMRlGN/da25EgI/iI
 lmuzgAtkwCBuxqZv1kiP8C4F5NZUOAv1qUDE6tZ36Fnrp0GbbuIeynYiFQUKr+8ZJTWG
 EFrnVkXy42BkK8nIFCi9jlSgPwYje3peYoRZkJEyiP+l3qBzlQd846CHYNDNKqjYd9ZM
 IgCBb8ih1RusqzPTQWrABBKqQHmO6pG9ctrCI6T/BI89l8Y8NVCZQ7eckK9FIwg4u4n2
 1TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Afn//yuDHYlwmeDLeugD9iFDGG3BuB4CBEbnqgHeFYg=;
 b=iWEpC53VnvOgG3xj4HXuokrZu+4HaI3P5fNmZLlHgUPVTMDsRmZswV4EHhR6/B7H+L
 QeE9xsmF9S33ylxr36FB8kI5CmCMNnTo2lHFUhroR1hctFX1EF9jTcG5jRN53OSM7tI7
 /SbzGu6ST3JYYDkyYpE/DZyhoNYHbV6tiCny5sCRoGxJ61vzGz3Tk9HqAj/d6VakCOcI
 TDVmDmCSb0HafsGnRJoBNwgA9hoosZ5yWA/z18MSc5glS2uZOOQ8xXdhhy8dx5h3U9lX
 NvzBKKAeWBLVM9ih0Jl2L7UVyjmnHFIuGctxloJKMpFwITPhApKAnsrpoOP5p7BMnJ8G
 AzoA==
X-Gm-Message-State: AOAM530tLNeVLJ6cSc6JJHb0Qt37I3ZV95ZSwuirbCuQ/AXm/TEohsj+
 cXHo5Rzu1c0zWGXaylhR0CKEqg==
X-Google-Smtp-Source: ABdhPJx6+pE8n65VdgeJNe8e1Z+YPUScTtvnLeYO8AYbaxvH3jCO7GZmnbUxpfoM8YYHZw6tBK7OxA==
X-Received: by 2002:a62:ce46:: with SMTP id y67mr58724222pfg.118.1594378319824; 
 Fri, 10 Jul 2020 03:51:59 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:51:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 21/65] target/riscv: rvv-0.9: take fractional LMUL into vector
 max elements calculation
Date: Fri, 10 Jul 2020 18:48:35 +0800
Message-Id: <20200710104920.13550-22-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 0.9.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 32 +++++++++++++++----------
 target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++++-
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 61393c9e2e..8b4a370572 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,8 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 
+#include "internals.h"
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 #define TYPE_RISCV_CPU "riscv-cpu"
@@ -380,20 +382,14 @@ FIELD(TB_FLAGS, VMA, 12, 1)
 /* Skip MSTATUS_VS (0x6000) fields */
 FIELD(TB_FLAGS, VILL, 15, 1)
 
-/*
- * A simplification for VLMAX
- * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
- * = (VLEN << LMUL) / (8 << SEW)
- * = (VLEN << LMUL) >> (SEW + 3)
- * = VLEN >> (SEW + 3 - LMUL)
- */
 static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
     uint8_t sew, lmul;
-
     sew = FIELD_EX64(vtype, VTYPE, VSEW);
-    lmul = FIELD_EX64(vtype, VTYPE, VLMUL);
-    return cpu->cfg.vlen >> (sew + 3 - lmul);
+    lmul = (FIELD_EX64(vtype, VTYPE, VFLMUL) << 2)
+            | FIELD_EX64(vtype, VTYPE, VLMUL);
+    float flmul = flmul_table[lmul];
+    return cpu->cfg.vlen * flmul / (1 << (sew + 3));
 }
 
 static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
@@ -405,13 +401,23 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
                     (FIELD_EX64(env->vtype, VTYPE, VFLMUL) << 2)
                         | FIELD_EX64(env->vtype, VTYPE, VLMUL));
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7db62053ab..5b061c303b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1060,7 +1060,16 @@ GEN_VEXT_TRANS(vamomaxuei64_v, 64, 8,  rwdvm, amo_op, amo_check)
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


