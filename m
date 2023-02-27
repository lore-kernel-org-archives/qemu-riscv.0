Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7r-0002R4-TO
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6X-0006YZ-0L
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:17 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6T-0000HS-Is
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:16 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8843693pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=nXGrSXZdtgdkXbfg5IY8ejfww8Opdy9Sxtp6hEbDbgHvoKEbl6L3mGK8Fkue4MgGKE
 in/NDYC4khaMTRYAAtnIH1czqFRKOv8s7QkV5veqlUvpGgwJSfdFE+F8KN5lVfMfB3RL
 biIrSPvl/E6mC+hgWKi2l/GrUFxXFKkgwb8fOUlj8x3s+yRrrBfD6NFh9fVSwa+QV8cI
 67pfMRPFnAOjDDVHtWPy5NsBvS138r5Cy17Ar+WO2wpy7gtG1j/ZC9k242QgtoGWYtAD
 NqnRTKupPle0aIOUDZgdiAcOs4glMABVVs9Z1gox98/ZUx3NhfAnEK6pNFceKzlcSqdG
 ab2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=J+Syi1SlCkFzk/ca2vcv+TMvdfCkMVSFTNhFtLz9fQyUpeVJPxrCkzrmpgTJ5Jny6t
 DxK8p6IIP9+7NOVIKLoawKUwqnvNiZR9oIsWkrZ4LuvCn8J3kpaqfpzp5ImIF9TzV3rE
 9m2CfboDjnuSeefNaT6pyivxsVTP4zMivlsbxeoMFppGsUmS6qK9PqZ9ND/tVAGwnFM3
 18OarVSuK640MGK2JmjLiCUfgJhWTGYLkTWeiv/89TcGSsQtvsP/okSsrO4N+WhAYwhi
 B6Q93RdODX8sRU1pVBmoSoJArXueOYhTK2j/0TVC47rMMKeCSEp/Y3iIYpGGtw0EsYIj
 715g==
X-Gm-Message-State: AO0yUKWOoYre9i4vkyN+5p5Ejzv6TbPYG7YByxtZZid4r2NlT+7eSGr1
 +epCw9CZvLBiWCrqnWymEHWNng==
X-Google-Smtp-Source: AK7set9caEI2QJ9ZB1+AyT4slTZJzGuRFGLcS7mYdV8qT7qMt6tnMEPfdFJKbhfKFj6+ZMEE6jM47A==
X-Received: by 2002:a17:90b:1b4e:b0:22c:5360:684e with SMTP id
 nv14-20020a17090b1b4e00b0022c5360684emr26256014pjb.29.1677475872618; 
 Sun, 26 Feb 2023 21:31:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 65/76] target/sparc: Drop get_temp_tl
Date: Sun, 26 Feb 2023 19:24:54 -1000
Message-Id: <20230227052505.352889-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:17 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 53 ++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 3b0044aa66..2b4af692f6 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -85,9 +85,7 @@ typedef struct DisasContext {
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
     TCGv_i32 t32[3];
-    TCGv ttl[5];
     int n_t32;
-    int n_ttl;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -139,14 +137,6 @@ static inline TCGv_i32 get_temp_i32(DisasContext *dc)
     return t;
 }
 
-static inline TCGv get_temp_tl(DisasContext *dc)
-{
-    TCGv t;
-    assert(dc->n_ttl < ARRAY_SIZE(dc->ttl));
-    dc->ttl[dc->n_ttl++] = t = tcg_temp_new();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -301,7 +291,7 @@ static inline TCGv gen_load_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, 0);
         return t;
     }
@@ -321,7 +311,7 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        return get_temp_tl(dc);
+        return tcg_temp_new();
     }
 }
 
@@ -2897,7 +2887,7 @@ static TCGv get_src2(DisasContext *dc, unsigned int insn)
 {
     if (IS_IMM) { /* immediate */
         target_long simm = GET_FIELDs(insn, 19, 31);
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, simm);
         return t;
     } else {      /* register */
@@ -3253,7 +3243,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     case 2:                     /* FPU & Logical Operations */
         {
             unsigned int xop = GET_FIELD(insn, 7, 12);
-            TCGv cpu_dst = get_temp_tl(dc);
+            TCGv cpu_dst = tcg_temp_new();
             TCGv cpu_tmp0;
 
             if (xop == 0x3a) {  /* generate trap */
@@ -3513,7 +3503,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 if (!supervisor(dc)) {
                     goto priv_insn;
                 }
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
 #ifdef TARGET_SPARC64
                 rs1 = GET_FIELD(insn, 13, 17);
                 switch (rs1) {
@@ -4031,7 +4021,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                     } else {
@@ -4053,7 +4043,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_shr_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4077,7 +4067,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_sar_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4263,7 +4253,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shli_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shl_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4274,7 +4264,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shri_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shr_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4285,7 +4275,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_sari_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_sar_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4294,7 +4284,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
                     case 0x30:
                         {
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             switch(rd) {
                             case 0: /* wry */
                                 tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
@@ -4479,7 +4469,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 goto illegal_insn;
                             }
 #else
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             gen_helper_wrpsr(cpu_env, cpu_tmp0);
                             tcg_gen_movi_i32(cpu_cc_op, CC_OP_FLAGS);
@@ -4495,7 +4485,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         {
                             if (!supervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
 #ifdef TARGET_SPARC64
                             switch (rd) {
@@ -4653,7 +4643,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             CHECK_IU_FEATURE(dc, HYPV);
                             if (!hypervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             switch (rd) {
                             case 0: // hpstate
@@ -5227,7 +5217,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             } else if (xop == 0x39) { /* V9 return */
                 save_state(dc);
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5249,7 +5239,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
             } else {
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5344,7 +5334,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             unsigned int xop = GET_FIELD(insn, 7, 12);
             /* ??? gen_address_mask prevents us from using a source
                register directly.  Always generate a temporary.  */
-            TCGv cpu_addr = get_temp_tl(dc);
+            TCGv cpu_addr = tcg_temp_new();
 
             tcg_gen_mov_tl(cpu_addr, get_src1(dc, insn));
             if (xop == 0x3c || xop == 0x3e) {
@@ -5780,13 +5770,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         }
         dc->n_t32 = 0;
     }
-    if (dc->n_ttl != 0) {
-        int i;
-        for (i = dc->n_ttl - 1; i >= 0; --i) {
-            tcg_temp_free(dc->ttl[i]);
-        }
-        dc->n_ttl = 0;
-    }
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


