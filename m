Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX31-0004Rf-DL
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2x-0004DB-Ra
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:39 -0500
Received: from [2607:f8b0:4864:20::636] (port=45967
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2v-0000sa-9S
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id b11so10973843pld.12
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1DppSmqJWZCsNSW9lDBVs4+XrhhG97m9ysSzL/5Yjcg=;
 b=KhMuwVVMvVB2XISqUyB7gizI9aKBHgnHboHAG0PHKyCu3DO6PdHNFsq6+2outvXVkS
 G4WDEIyC6nhhiuf5rtJpjmjpLPGgiMh8kbNN204TPhld4t6+7sCeYa1JxXsljjijXA5w
 TN2KzkS14IWYb4F310r7S4b9gzU9d9/Urxq6TTNO3aArTQesz3l905YyR6r+EjDQRO9P
 UyDbireqcxcHd0sVKO1nQjnd3Kj8gdScA0coy3aVag1x5Zgpl1EX0W9D1X85r3VatF0L
 hdi1jRoch4CpEM5XI8YdsO6bDvQKJZlw7mOLY/b0JndWXnCgG5viMhKbKuIv0BxbbaF3
 ewpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1DppSmqJWZCsNSW9lDBVs4+XrhhG97m9ysSzL/5Yjcg=;
 b=FHq4eH8kKxz5rZBnOnBcRaXpfAbdwJhACrbvvnf68TtQFgYymuorkIzZyOvPeluNYE
 XA/HXdTZ0DQKdRT+in0XL3t4tAcLColpudLzlyufUfvRRO1cl+gY8kskDzwfBnRdy+JE
 YsVQGcUtcDrSNBwVNwAR93vPEA7xkPOWzUc3o647/njDvBzYTPwPsOAlWJ6nE4vA7E4A
 0VIIr43SkGc9/nPwGbzL3aOVsNqjTypUmCc1Qtz7xfkV5hLU9vtoLGNFAjZRuaPDitik
 3DeHSfZSIKT9XVwTmtsaXPhIqc8Y6LbOdB7j6nljO8eqESGv70naeDntyY4bV1K0a+Y9
 y9DQ==
X-Gm-Message-State: AOAM532Z86KnnHS/t14OhebI2bp3HmehL7PivMivZNKb5balArBPTmfI
 ByiGIh0S+MoAfV6pC7neXf/uZA==
X-Google-Smtp-Source: ABdhPJy69aNnpYiVe9zDdoD33dsF7JtosmGT/jFDOXLVmODjMpJSnZqfR+xhx0dBtr9n0fdJ2G4GXA==
X-Received: by 2002:a17:90b:388f:: with SMTP id
 mu15mr35135778pjb.30.1638155376003; 
 Sun, 28 Nov 2021 19:09:36 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 62/77] target/riscv: rvv-1.0: widening
 floating-point/integer type-convert
Date: Mon, 29 Nov 2021 11:03:22 +0800
Message-Id: <20211129030340.429689-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:40 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfwcvt.rtz.xu.f.v
* vfwcvt.rtz.x.f.v

Also adjust GEN_OPFV_WIDEN_TRANS() to accept multiple floating-point
rounding modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              | 13 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 55 +++++++++++++++++++++----
 target/riscv/vector_helper.c            |  7 +++-
 4 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1727075dce4..53cf88cd402 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -928,8 +928,10 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_xu_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_x_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 02064f8ec98..664d0fb3716 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -592,11 +592,14 @@ vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
 vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
 vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
 vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
-vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
-vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
-vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
-vfwcvt_f_x_v    100010 . ..... 01011 001 ..... 1010111 @r2_vm
-vfwcvt_f_f_v    100010 . ..... 01100 001 ..... 1010111 @r2_vm
+
+vfwcvt_xu_f_v      010010 . ..... 01000 001 ..... 1010111 @r2_vm
+vfwcvt_x_f_v       010010 . ..... 01001 001 ..... 1010111 @r2_vm
+vfwcvt_f_xu_v      010010 . ..... 01010 001 ..... 1010111 @r2_vm
+vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
+vfwcvt_f_f_v       010010 . ..... 01100 001 ..... 1010111 @r2_vm
+vfwcvt_rtz_xu_f_v  010010 . ..... 01110 001 ..... 1010111 @r2_vm
+vfwcvt_rtz_x_f_v   010010 . ..... 01111 001 ..... 1010111 @r2_vm
 vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
 vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
 vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4bc4dfa69fc..b4cf044450d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2536,12 +2536,55 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
+#define GEN_OPFV_WIDEN_TRANS(NAME, HELPER, FRM)                    \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_widen_check(s, a)) {                                  \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
+            gen_helper_##HELPER##_h,                               \
+            gen_helper_##HELPER##_w,                               \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, FRM);                                        \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, vfwcvt_x_f_v, RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, vfwcvt_f_f_v, RISCV_FRM_DYN)
+/* Reuse the helper functions from vfwcvt.xu.f.v and vfwcvt.x.f.v */
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, vfwcvt_x_f_v, RISCV_FRM_RTZ)
+
+static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    return require_rvv(s) &&
+           require_scale_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV widening instructions ignore vs1 check */
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
+}
+
+#define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opfxv_widen_check(s, a)) {                                 \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_b,                                 \
             gen_helper_##NAME##_h,                                 \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
@@ -2550,11 +2593,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
-                           fns[s->sew - 1]);                       \
+                           fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
@@ -2562,11 +2604,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_xu_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_x_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
+GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_xu_v)
+GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
 
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cc95b692558..c3b7719291a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3773,6 +3773,7 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
+#define WOP_UU_B uint16_t, uint8_t,  uint8_t
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
 #define WOP_UU_W uint64_t, uint32_t, uint32_t
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
@@ -3788,19 +3789,23 @@ GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8)
 
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
+RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, 1, 2)
 GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8)
 
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
+RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, 1, 2)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8)
 
 /*
- * vfwcvt.f.f.v vd, vs2, vm #
+ * vfwcvt.f.f.v vd, vs2, vm
  * Convert single-width float to double-width float.
  */
 static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
-- 
2.25.1


