Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJG-0006sO-Hg
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJD-0006gF-Uc
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ6-0005Iz-IO
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:23 -0500
Received: by mail-pg1-x52a.google.com with SMTP id d6so2860154pgu.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsiT8/XOksduitHrlpP1MGWNlFlr9y0PJN3cA7kqumo=;
 b=N9ThMpRMSlT5f4wQuz1BlI1TBIcPsQbaYdBWJYL77xiQ1E0sbDUT62Bu8fCCOkElpK
 2wSVEh2ze8t8n7TrS+2bLVSSIKnTedxgkG6C1dZ5rwFVv2n/Pzjon3HVKxHLWJkfqig4
 fQIm30F3KnztVHNHoKfO64yPYncClX4Sh7FTcEopEzC5zOGqBMQD9q8CuirrDAIG+iSm
 ay4Uj9GwMMUnPn8fdjsrkq9BGQhbOpQkJ9Sq/4vIn0rRnMqnXZzj7uZN0Nsszgxqh/ZC
 Nw8F7/rBdlcMcHEeynw3+tUZxNFl0QnQwlz+Ge+kY+v76FvGqfsH5kacc5CaHeouXz+4
 hFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AsiT8/XOksduitHrlpP1MGWNlFlr9y0PJN3cA7kqumo=;
 b=X7CcRKBUHnuXmk3xxKJvnpvDY2/xqalnMP7HlWmIcSbHJgiNLRYN5NxFBagaSKnVA7
 y+aOmSigUq5EacLxMIXFx7YENOfaf9I4mgADZ5zODpUNNVT3CMU2Cbxc2oSBNTFksl9q
 jJiMYCkHV3DDCVqpAUsiBIg/sFqDRaae0948hYLOvTS88mujPqoXlx2TiW47yJCTBLM4
 7G6FYC5CFyJ3HRAooxO2Tjt7gBKIAgoBIsUtvA/xqbjTIMWv/wOCe2jtXMqTEhcKYSlO
 j8vaq5bGfPL9op6vfM+RCQL7ETza5XqP/5c+S1SSiFwNtsZpck23SjPvJL/6mPrGSbX/
 SHBw==
X-Gm-Message-State: AO0yUKVV76fbyKnvLZMBXQf7d+ijyZ2rNf0JWkMxQd1PsA1Mr5jtG4gU
 +P2zr9PGdIonuR3ywtX2M83qHg==
X-Google-Smtp-Source: AK7set/wZe/rJJuVTXFCqsszvBd0VZSzn6SGnvCrfGucN3TBHgTh/wOwqeU8WY/evfaPBbnYJFTloA==
X-Received: by 2002:aa7:982e:0:b0:5dc:d34:d9f6 with SMTP id
 q14-20020aa7982e000000b005dc0d34d9f6mr13799435pfl.2.1677476651140; 
 Sun, 26 Feb 2023 21:44:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 33/70] target/mips: Avoid tcg_const_* throughout
Date: Sun, 26 Feb 2023 19:41:56 -1000
Message-Id: <20230227054233.390271-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:24 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c           |  4 +-
 target/mips/tcg/translate.c               | 56 +++++++++++------------
 target/mips/tcg/tx79_translate.c          |  4 +-
 target/mips/tcg/micromips_translate.c.inc |  4 +-
 target/mips/tcg/nanomips_translate.c.inc  | 16 ++++---
 5 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index 8703b0cef4..bdd20709c0 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -1072,7 +1072,7 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do half-word-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
 
         /* the left half-word first */
         tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
@@ -1163,7 +1163,7 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do byte-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
         int32_t i;
 
         /* the leftmost byte (byte 3) first */
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bec0a26c83..7f1f12e0c7 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2099,14 +2099,14 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         gen_store_gpr(t1, rt);
         break;
     case OPC_LDPC:
-        t1 = tcg_const_tl(pc_relative_pc(ctx));
+        t1 = tcg_constant_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
         gen_store_gpr(t0, rt);
         break;
 #endif
     case OPC_LWPC:
-        t1 = tcg_const_tl(pc_relative_pc(ctx));
+        t1 = tcg_constant_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL);
         gen_store_gpr(t0, rt);
@@ -2733,7 +2733,7 @@ static void gen_cond_move(DisasContext *ctx, uint32_t opc,
 
     t0 = tcg_temp_new();
     gen_load_gpr(t0, rt);
-    t1 = tcg_const_tl(0);
+    t1 = tcg_constant_tl(0);
     t2 = tcg_temp_new();
     gen_load_gpr(t2, rs);
     switch (opc) {
@@ -3084,8 +3084,8 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_DIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3095,8 +3095,8 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_MODU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3175,16 +3175,16 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_DDIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
         }
         break;
     case R6_OPC_DMODU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
         }
@@ -3248,8 +3248,8 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
         break;
     case MMI_OPC_DIVU1:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3304,8 +3304,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3355,8 +3355,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DDIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_LO[acc], t0, t1);
             tcg_gen_remu_i64(cpu_HI[acc], t0, t1);
@@ -4908,7 +4908,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_WSBH:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x00FF00FF);
+            TCGv t2 = tcg_constant_tl(0x00FF00FF);
 
             tcg_gen_shri_tl(t1, t0, 8);
             tcg_gen_and_tl(t1, t1, t2);
@@ -4928,7 +4928,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_DSBH:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x00FF00FF00FF00FFULL);
+            TCGv t2 = tcg_constant_tl(0x00FF00FF00FF00FFULL);
 
             tcg_gen_shri_tl(t1, t0, 8);
             tcg_gen_and_tl(t1, t1, t2);
@@ -4940,7 +4940,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_DSHD:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x0000FFFF0000FFFFULL);
+            TCGv t2 = tcg_constant_tl(0x0000FFFF0000FFFFULL);
 
             tcg_gen_shri_tl(t1, t0, 16);
             tcg_gen_and_tl(t1, t1, t2);
@@ -8451,7 +8451,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
             case 5:
             case 6:
             case 7:
-                gen_helper_mftc0_configx(t0, cpu_env, tcg_const_tl(sel));
+                gen_helper_mftc0_configx(t0, cpu_env, tcg_constant_tl(sel));
                 break;
             default:
                 goto die;
@@ -9477,7 +9477,7 @@ static inline void gen_movcf_ps(DisasContext *ctx, int fs, int fd,
 static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
                       int fs)
 {
-    TCGv_i32 t1 = tcg_const_i32(0);
+    TCGv_i32 t1 = tcg_constant_i32(0);
     TCGv_i32 fp0 = tcg_temp_new_i32();
     TCGv_i32 fp1 = tcg_temp_new_i32();
     TCGv_i32 fp2 = tcg_temp_new_i32();
@@ -9510,7 +9510,7 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
 static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
                       int fs)
 {
-    TCGv_i64 t1 = tcg_const_i64(0);
+    TCGv_i64 t1 = tcg_constant_i64(0);
     TCGv_i64 fp0 = tcg_temp_new_i64();
     TCGv_i64 fp1 = tcg_temp_new_i64();
     TCGv_i64 fp2 = tcg_temp_new_i64();
@@ -11508,7 +11508,7 @@ void gen_addiupc(DisasContext *ctx, int rx, int imm,
 static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
                                 int16_t offset)
 {
-    TCGv_i32 t0 = tcg_const_i32(op);
+    TCGv_i32 t0 = tcg_constant_i32(op);
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
@@ -11852,7 +11852,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_PH_W:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_t = tcg_const_i32(v2);
+                TCGv_i32 sa_t = tcg_constant_i32(v2);
                 gen_helper_precr_sra_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                           cpu_gpr[ret]);
                 break;
@@ -11860,7 +11860,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_R_PH_W:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_t = tcg_const_i32(v2);
+                TCGv_i32 sa_t = tcg_constant_i32(v2);
                 gen_helper_precr_sra_r_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                             cpu_gpr[ret]);
                 break;
@@ -12049,14 +12049,14 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_QH_PW:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 ret_t = tcg_const_i32(ret);
+                TCGv_i32 ret_t = tcg_constant_i32(ret);
                 gen_helper_precr_sra_qh_pw(v2_t, v1_t, v2_t, ret_t);
                 break;
             }
         case OPC_PRECR_SRA_R_QH_PW:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_v = tcg_const_i32(ret);
+                TCGv_i32 sa_v = tcg_constant_i32(ret);
                 gen_helper_precr_sra_r_qh_pw(v2_t, v1_t, v2_t, sa_v);
                 break;
             }
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index d46bc73972..3a45a1bfea 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -243,8 +243,8 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
         return true;
     }
 
-    c0 = tcg_const_tl(0);
-    c1 = tcg_const_tl(0xffffffff);
+    c0 = tcg_constant_tl(0);
+    c1 = tcg_constant_tl(0xffffffff);
     ax = tcg_temp_new_i64();
     bx = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 23f80d4315..e8b193aeda 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -704,8 +704,8 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
 
     gen_base_offset_addr(ctx, t0, base, offset);
 
-    t1 = tcg_const_tl(reglist);
-    t2 = tcg_const_i32(ctx->mem_idx);
+    t1 = tcg_constant_tl(reglist);
+    t2 = tcg_constant_i32(ctx->mem_idx);
 
     save_cpu_state(ctx, 1);
     switch (opc) {
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b3df7fec40..9398e28000 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3359,7 +3359,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         case 0:
             /* PRECR_SRA_PH_W */
             {
-                TCGv_i32 sa_t = tcg_const_i32(rd);
+                TCGv_i32 sa_t = tcg_constant_i32(rd);
                 gen_helper_precr_sra_ph_w(v1_t, sa_t, v1_t,
                                           cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
@@ -3368,7 +3368,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         case 1:
             /* PRECR_SRA_R_PH_W */
             {
-                TCGv_i32 sa_t = tcg_const_i32(rd);
+                TCGv_i32 sa_t = tcg_constant_i32(rd);
                 gen_helper_precr_sra_r_ph_w(v1_t, sa_t, v1_t,
                                             cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
@@ -3864,10 +3864,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             check_nms(ctx);
             if (rt != 0) {
                 TCGv t0 = tcg_temp_new();
-                TCGv_i32 shift = tcg_const_i32(extract32(ctx->opcode, 0, 5));
-                TCGv_i32 shiftx = tcg_const_i32(extract32(ctx->opcode, 7, 4)
-                                                << 1);
-                TCGv_i32 stripe = tcg_const_i32(extract32(ctx->opcode, 6, 1));
+                TCGv_i32 shift =
+                    tcg_constant_i32(extract32(ctx->opcode, 0, 5));
+                TCGv_i32 shiftx =
+                    tcg_constant_i32(extract32(ctx->opcode, 7, 4) << 1);
+                TCGv_i32 stripe =
+                    tcg_constant_i32(extract32(ctx->opcode, 6, 1));
 
                 gen_load_gpr(t0, rs);
                 gen_helper_rotx(cpu_gpr[rt], t0, shift, shiftx, stripe);
@@ -4500,7 +4502,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
 
     /* make sure instructions are on a halfword boundary */
     if (ctx->base.pc_next & 0x1) {
-        TCGv tmp = tcg_const_tl(ctx->base.pc_next);
+        TCGv tmp = tcg_constant_tl(ctx->base.pc_next);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPUMIPSState, CP0_BadVAddr));
         generate_exception_end(ctx, EXCP_AdEL);
         return 2;
-- 
2.34.1


