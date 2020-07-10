Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscf-0006Bg-Se
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcs-00058N-JV
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcq-0006Zd-OY
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id w17so2089670ply.11
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9zjuMxsHl1Yz3Vtp5Jd2e1VqCar4pnOkYjAkW0culYI=;
 b=jxbmMS8ws8JdINMM6xHkhi726ku/JdzFzKuOS4wtr5CuTKC9irtYb2ywfzTHg2WeJm
 zfMcsmNDa7Sff76NOdRm0ctkWAkFqPvzQMqTRURmqFq6JQPIYb4xOZka5ywtOQAzPfRD
 xdtvOfLn9u2fKhAeFpUppAODl/RUeYbkR7/lIIzrmjf6DYRn93x79qKRFpzD8bzbLE4g
 9zatBOJZfOQCdsfWR3PJQ6wmn6c2GOxKwMoq+QILRYEZS5nNGmot5JXgYXXOi/wq1qpm
 /i87E+O0A5nHHroMQCt/JxryTcGm256mueQHN2mUh493jn+DkHMiEJ7AGHk52KMnwuoM
 mP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9zjuMxsHl1Yz3Vtp5Jd2e1VqCar4pnOkYjAkW0culYI=;
 b=nCp3EFEog1LgeswZp2Ga3N3dgDGSCn86Eb+aUAiCqvgnJUoMcoImXbVGROGHWAcZjr
 IpX3gZ/zFtj6k9/rLhJKhMbURQ13EF9L45zcya9Tb0mHNvESQ3KqpQMFFH+GwGjHsdQU
 GPGcMUCncSwtZgiK2V10CNvVgnibChI5YlMw9m4uG0+wDBeXO9bXO0c/alApJF5zR45Y
 9oPq6sgVdJSTYq2opzIDgVAi3+aT+D675Fi8uWdimKdkgCD0/qL8NYJz3BOznp2BsJrz
 +UQ1698VR1DvtarpIo8k8jHU/UYuzd9J3k7oqa3mwyx9H9Z7TCerX1w0or9p/fG5/MrF
 Lh4A==
X-Gm-Message-State: AOAM533bshJDkRuf4se/Z2gaGVIPIKVPGSJrrX/RZLiYDupHYu2s1bqW
 MIBC3GIlgAK1tyLyC8npmNd6OQ==
X-Google-Smtp-Source: ABdhPJzBHjdTrsJMvgW7BYutP3y59HRhnjEI6jo4UXcr9kH9vCM4hzTe1HandYuSDCiHTChv50feqQ==
X-Received: by 2002:a17:902:6949:: with SMTP id
 k9mr47748655plt.91.1594378287340; 
 Fri, 10 Jul 2020 03:51:27 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:51:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 13/65] target/riscv: rvv-0.9: configure instructions
Date: Fri, 10 Jul 2020 18:48:27 +0800
Message-Id: <20200710104920.13550-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:51:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 52 ++++++++++++-------------
 target/riscv/vector_helper.c            | 38 ++++++++++++------
 3 files changed, 53 insertions(+), 39 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index acc298219d..5939897a82 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -83,7 +83,7 @@ DEF_HELPER_1(hyp_tlb_flush, void, env)
 #endif
 
 /* Vector functions */
-DEF_HELPER_3(vsetvl, tl, env, tl, tl)
+DEF_HELPER_5(vsetvl, tl, env, i32, i32, tl, tl)
 DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index fc1908389e..da8e7598e9 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -72,33 +72,32 @@ static inline bool is_overlapped_widen(const int astart, int asize,
     }
 }
 
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
+    TCGv_i32 rd, rs1;
     TCGv s1, s2, dst;
 
     REQUIRE_RVV;
-    if (!has_ext(ctx, RVV)) {
+    if (!has_ext(s, RVV)) {
         return false;
     }
 
+    rd = tcg_const_i32(a->rd);
+    rs1 = tcg_const_i32(a->rs1);
+    s1 = tcg_temp_new();
     s2 = tcg_temp_new();
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
-    } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
-    }
+    gen_get_gpr(s1, a->rs1);
     gen_get_gpr(s2, a->rs2);
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, rd, rs1, s1, s2);
     gen_set_gpr(a->rd, dst);
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    lookup_and_goto_ptr(ctx);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    lookup_and_goto_ptr(s);
+    s->base.is_jmp = DISAS_NORETURN;
 
+    tcg_temp_free_i32(rd);
+    tcg_temp_free_i32(rs1);
     tcg_temp_free(s1);
     tcg_temp_free(s2);
     tcg_temp_free(dst);
@@ -106,31 +105,30 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     return true;
 }
 
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
+static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
 {
+    TCGv_i32 rd, rs1;
     TCGv s1, s2, dst;
 
     REQUIRE_RVV;
-    if (!has_ext(ctx, RVV)) {
+    if (!has_ext(s, RVV)) {
         return false;
     }
 
+    rd = tcg_const_i32(a->rd);
+    rs1 = tcg_const_i32(a->rs1);
+    s1 = tcg_temp_new();
     s2 = tcg_const_tl(a->zimm);
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
-    } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_get_gpr(s1, a->rs1);
+    gen_helper_vsetvl(dst, cpu_env, rd, rs1, s1, s2);
     gen_set_gpr(a->rd, dst);
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_goto_tb(s, 0, s->pc_succ_insn);
+    s->base.is_jmp = DISAS_NORETURN;
 
+    tcg_temp_free_i32(rd);
+    tcg_temp_free_i32(rs1);
     tcg_temp_free(s1);
     tcg_temp_free(s2);
     tcg_temp_free(dst);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index db54288c08..1279ef4fb1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -26,33 +26,49 @@
 #include "internals.h"
 #include <math.h>
 
-target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
-                            target_ulong s2)
+target_ulong HELPER(vsetvl)(CPURISCVState *env, uint32_t rd, uint32_t rs1,
+                            target_ulong s1, target_ulong s2)
 {
-    int vlmax, vl;
+    int vlmax;
+    int vl = 0;
+
     RISCVCPU *cpu = env_archcpu(env);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
+    vlmax = vext_get_vlmax(cpu, s2);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    uint64_t lmul = (FIELD_EX64(s2, VTYPE, VFLMUL) << 2)
+        | FIELD_EX64(s2, VTYPE, VLMUL);
+    float vflmul = flmul_table[lmul];
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || vflmul < ((float)sew / cpu->cfg.elen)
+        || (ediv != 0)
+        || (reserved != 0)) {
         /* only set vill bit. */
         env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
-        env->vl = 0;
-        env->vstart = 0;
         return 0;
     }
 
-    vlmax = vext_get_vlmax(cpu, s2);
-    if (s1 <= vlmax) {
-        vl = s1;
-    } else {
+    /* set vl */
+    if (rd == 0 && rs1 == 0) {
+        /* keep existing vl */
+        vl = env->vl > vlmax ? vlmax : env->vl;
+    } else if (rd != 0 && rs1 == 0) {
+        /* set vl to vlmax */
         vl = vlmax;
+    } else if (rs1 != 0) {
+        /* normal stripmining */
+        vl = s1 > vlmax ? vlmax : s1;
     }
-    env->vl = vl;
+
     env->vtype = s2;
     env->vstart = 0;
+    env->vl = vl;
+
     return vl;
 }
 
-- 
2.17.1


