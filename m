Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1L-000786-F9
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW19-0006n9-If
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:43 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW13-00079Z-R9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:43 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so3836611pla.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8j3IPZTVyN+dZUsOhoCKYp0bksAGUAJsCP3IzISZ8Y=;
 b=RwHqMSXBs2NnX6KE/iDfjScxX75nxc703+JON3Zu5OtWd+FH3GYhShlwYzbkLgSqSA
 CLxRDQHFwfYWaPvxRQfOMTwIpIh6XVM/jG9EeNWtzYE5wOB7faIi57jL7wcnJX+FLTwp
 v4LAQsHC2ly5OvdRIJazA9p0NUSBlx+EbKEQbzjxD3APnKRc9Jac26+EUOYV+BwlN4PQ
 tU+CjnV0ipiv+5uHqR1An/BelORrejLY7S3CGBsfuDlDXvj0TzkEdMtmRzn8Nn5otmk7
 5le50ltqTpXS0tg6MnvguseA3zS9fxpzB6KJPFEMFaJSMN9A5ZHne4iZgb5+vSFRePrU
 b/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8j3IPZTVyN+dZUsOhoCKYp0bksAGUAJsCP3IzISZ8Y=;
 b=xZqwXA+emgmrkX6ZGMCku1hsEcjNE9ONQAcy7HtNHDQ3NAIHm2Hwp6ZObTSNww78Dn
 zcTvJcLKdtcwI1KAGkYYuY5xP5G3h67Qws9Ujly0fXy12EFSdNgqi/YqKHcGVWiamCa3
 TRk7cA4J6CT/tG99QjQ1W7cORC1/oOSYRQQn+XwNqC2Ps0kBUOu7t8fbtR6IxCWW1WQn
 lVTJPtD74l9ZdyoaBsm08/Pqb+8muAsLGXx5p9Bd5XeJWKf7KVIazbqsoYjT6A+ar90V
 AyCnO8bZ5GuqIWtjRhytjmJgFEo9DMIZI5stXnt+Q+LF4kjV6girsiJozGK6Vp1dVwMr
 Yg/w==
X-Gm-Message-State: AO0yUKWKckVjzTf9U5iIeZMCIwLIchfrdjbZ78rH8iBsYknDZ/t0Ztmj
 kJWxhxHg4qcb4fZZcNK7073ivg==
X-Google-Smtp-Source: AK7set+Ls4FwnENuYGBxgs8sWzVN9/RkiwPjgkUSvYG73mh2Fd1c6oh+ot02JvyTqN1HmTOuC0FxSg==
X-Received: by 2002:a17:903:28c7:b0:19d:297:f300 with SMTP id
 kv7-20020a17090328c700b0019d0297f300mr3568950plb.45.1677475532203; 
 Sun, 26 Feb 2023 21:25:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 08/76] target/arm: Drop new_tmp_a64
Date: Sun, 26 Feb 2023 19:23:57 -1000
Message-Id: <20230227052505.352889-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:44 -0000

This is now a simple wrapper for tcg_temp_new_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c | 45 +++++++++++++++++---------------------
 target/arm/translate-sve.c | 20 ++++++++---------
 3 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ca24c39dbe..8ac126991f 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,7 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-TCGv_i64 new_tmp_a64(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 98d1bee5d5..04872d9925 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -224,7 +224,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
-    TCGv_i64 clean = new_tmp_a64(s);
+    TCGv_i64 clean = tcg_temp_new_i64();
 #ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
 #else
@@ -269,7 +269,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
 
-        ret = new_tmp_a64(s);
+        ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
@@ -300,7 +300,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
 
-        ret = new_tmp_a64(s);
+        ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
@@ -408,14 +408,9 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-TCGv_i64 new_tmp_a64(DisasContext *s)
-{
-    return tcg_temp_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
-    TCGv_i64 t = new_tmp_a64(s);
+    TCGv_i64 t = tcg_temp_new_i64();
     tcg_gen_movi_i64(t, 0);
     return t;
 }
@@ -456,7 +451,7 @@ TCGv_i64 cpu_reg_sp(DisasContext *s, int reg)
  */
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
 {
-    TCGv_i64 v = new_tmp_a64(s);
+    TCGv_i64 v = tcg_temp_new_i64();
     if (reg != 31) {
         if (sf) {
             tcg_gen_mov_i64(v, cpu_X[reg]);
@@ -471,7 +466,7 @@ TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
 
 TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
 {
-    TCGv_i64 v = new_tmp_a64(s);
+    TCGv_i64 v = tcg_temp_new_i64();
     if (sf) {
         tcg_gen_mov_i64(v, cpu_X[reg]);
     } else {
@@ -1984,7 +1979,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
             desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
 
-            tcg_rt = new_tmp_a64(s);
+            tcg_rt = tcg_temp_new_i64();
             gen_helper_mte_check_zva(tcg_rt, cpu_env,
                                      tcg_constant_i32(desc), cpu_reg(s, rt));
         } else {
@@ -2293,7 +2288,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
                 modifier = new_tmp_a64_zero(s);
             }
             if (s->pauth_active) {
-                dst = new_tmp_a64(s);
+                dst = tcg_temp_new_i64();
                 if (op3 == 2) {
                     gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
                 } else {
@@ -2311,7 +2306,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (opc == 1) {
             TCGv_i64 lr = cpu_reg(s, 30);
             if (dst == lr) {
-                TCGv_i64 tmp = new_tmp_a64(s);
+                TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_mov_i64(tmp, dst);
                 dst = tmp;
             }
@@ -2330,7 +2325,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         }
         btype_mod = opc & 1;
         if (s->pauth_active) {
-            dst = new_tmp_a64(s);
+            dst = tcg_temp_new_i64();
             modifier = cpu_reg_sp(s, op4);
             if (op3 == 2) {
                 gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
@@ -2344,7 +2339,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (opc == 9) {
             TCGv_i64 lr = cpu_reg(s, 30);
             if (dst == lr) {
-                TCGv_i64 tmp = new_tmp_a64(s);
+                TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_mov_i64(tmp, dst);
                 dst = tmp;
             }
@@ -2912,7 +2907,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = new_tmp_a64(s);
+    clean_addr = tcg_temp_new_i64();
     gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
@@ -5167,7 +5162,7 @@ static void disas_adc_sbc(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg(s, rn);
 
     if (op) {
-        tcg_y = new_tmp_a64(s);
+        tcg_y = tcg_temp_new_i64();
         tcg_gen_not_i64(tcg_y, cpu_reg(s, rm));
     } else {
         tcg_y = cpu_reg(s, rm);
@@ -5295,7 +5290,7 @@ static void disas_cc(DisasContext *s, uint32_t insn)
 
     /* Load the arguments for the new comparison.  */
     if (is_imm) {
-        tcg_y = new_tmp_a64(s);
+        tcg_y = tcg_temp_new_i64();
         tcg_gen_movi_i64(tcg_y, y);
     } else {
         tcg_y = cpu_reg(s, y);
@@ -5724,8 +5719,8 @@ static void handle_div(DisasContext *s, bool is_signed, unsigned int sf,
     tcg_rd = cpu_reg(s, rd);
 
     if (!sf && is_signed) {
-        tcg_n = new_tmp_a64(s);
-        tcg_m = new_tmp_a64(s);
+        tcg_n = tcg_temp_new_i64();
+        tcg_m = tcg_temp_new_i64();
         tcg_gen_ext32s_i64(tcg_n, cpu_reg(s, rn));
         tcg_gen_ext32s_i64(tcg_m, cpu_reg(s, rm));
     } else {
@@ -5790,7 +5785,7 @@ static void handle_crc32(DisasContext *s,
         default:
             g_assert_not_reached();
         }
-        tcg_val = new_tmp_a64(s);
+        tcg_val = tcg_temp_new_i64();
         tcg_gen_andi_i64(tcg_val, cpu_reg(s, rm), mask);
     }
 
@@ -7062,7 +7057,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
     if (itof) {
         TCGv_i64 tcg_int = cpu_reg(s, rn);
         if (!sf) {
-            TCGv_i64 tcg_extend = new_tmp_a64(s);
+            TCGv_i64 tcg_extend = tcg_temp_new_i64();
 
             if (is_signed) {
                 tcg_gen_ext32s_i64(tcg_extend, tcg_int);
@@ -10707,8 +10702,8 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
     int dsize = 64;
     int esize = 8 << size;
     int elements = dsize/esize;
-    TCGv_i64 tcg_rn = new_tmp_a64(s);
-    TCGv_i64 tcg_rd = new_tmp_a64(s);
+    TCGv_i64 tcg_rn = tcg_temp_new_i64();
+    TCGv_i64 tcg_rd = tcg_temp_new_i64();
     int i;
 
     if (size >= 3) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 718a5bce1b..2f607a355e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4721,7 +4721,7 @@ static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ld_zpa(s, a->rd, a->pg, addr, a->dtype, a->nreg);
@@ -4737,7 +4737,7 @@ static bool trans_LD_zpri(DisasContext *s, arg_rpri_load *a)
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
                          (a->imm * elements * (a->nreg + 1))
@@ -4840,7 +4840,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
@@ -4945,7 +4945,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
         int off = (a->imm * elements) << dtype_msz(a->dtype);
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
         do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
@@ -5003,7 +5003,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
     }
     if (sve_access_check(s)) {
         int msz = dtype_msz(a->dtype);
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ldrq(s, a->rd, a->pg, addr, a->dtype);
@@ -5017,7 +5017,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
         do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
@@ -5097,7 +5097,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ldro(s, a->rd, a->pg, addr, a->dtype);
@@ -5112,7 +5112,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
         do_ldro(s, a->rd, a->pg, addr, a->dtype);
     }
@@ -5307,7 +5307,7 @@ static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), a->msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_st_zpa(s, a->rd, a->pg, addr, a->msz, a->esz, a->nreg);
@@ -5326,7 +5326,7 @@ static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a)
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> a->esz;
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
                          (a->imm * elements * (a->nreg + 1)) << a->msz);
-- 
2.34.1


