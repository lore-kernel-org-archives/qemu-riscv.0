Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTko-0003F0-0c
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkj-00039J-0q
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkf-0002su-UK
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:16 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 201so5331031pfw.5
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qFQmeW5noLf4mClZjUiE8X2ptHE16/RLS8I0lbFdvyU=;
 b=WJwkbV/3DAJ0z6IIXnfb0M5h66f92SHXA8P/k7RJcfSrmccE1ToFsKTM1pQQ1l0m49
 xOA8FGZTGzQx57AI7fPPydNC4Wh54ZNOHkShIQO3vjpMzqOTJ+Jf9ifrpwNiJCWZjdGR
 7qEfomaBHvovxlUCmZ7zsU1lf0M9ea/+M4tGMbbf93aLwmKBbSMAhr3SAbhBVNaxRENN
 LZBLW7hsqWUdiuF9klANwgUxLwmtHZxHx/idGMe2rMm4wx3qNPkkmemkuHXNh3FCUhWF
 Y6cQb1kPwDrBPSLOFRgkji0QkLkJjLcFoWzPpYVx+tVDMgrRowNmadz6FWuBLXTCehNz
 7IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qFQmeW5noLf4mClZjUiE8X2ptHE16/RLS8I0lbFdvyU=;
 b=ncctzvUzjYzsD68/S/hNl7dcsIknQ07kq5n/13AATAgetBSIRQoTD1eMhGchbNlrUT
 VkILO4p6TZB/Qms2mAP8mR1oTrXuanYeamMj2s8qOTA+BbrOl9A5eBfEhRKn0VCoIuJ+
 nrUYpYxzTYMBxL5hkAgmjz7eTDfB59Dmi+8NRWE3vWIsAD/7UPb5GCfwjlsVEuuIliRD
 Tr+GxGtiDbrlxEd6I4Zhshptz8t9MV29qwRro3MTw19+omMIUKL/tknepWyXx00Qe5N3
 RIPY2HsBQ3pi5rB06dwMN4kSQbSOSGqafEqZp3gCCAmhwHIeMQBqCBfvy5hV887GWtpv
 6SDQ==
X-Gm-Message-State: AOAM532P8pqe0B/oZZ1AQD7ijG3vuEH0+sybwZrbcgAb9CeN258N0fe2
 OMPqkuqnj0Pstg6p3e/bn91VPQ==
X-Google-Smtp-Source: ABdhPJylhAxN/AFMevravALvEeBerNk2tO/KcRickNwUEvcOhIODkhPR+vpfs0n20UbmXLfFWPAJSA==
X-Received: by 2002:a65:5c44:: with SMTP id v4mr1007326pgr.362.1614309912169; 
 Thu, 25 Feb 2021 19:25:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:11 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 63/75] target/riscv: rvv-1.0: narrowing
 floating-point/integer type-convert
Date: Fri, 26 Feb 2021 11:18:47 +0800
Message-Id: <20210226031902.23656-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:18 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 22 +++++-----
 target/riscv/insn32.decode              | 15 ++++---
 target/riscv/insn_trans/trans_rvv.c.inc | 58 +++++++++++++++++++++----
 target/riscv/vector_helper.c            | 45 ++++++++++---------
 4 files changed, 96 insertions(+), 44 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1d52936c399..6eb4033d654 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -979,16 +979,18 @@ DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_5(vfncvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
-DEF_HELPER_5(vfncvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_xu_f_w_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_xu_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_xu_f_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_x_f_w_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_x_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_x_f_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_xu_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_xu_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_x_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_x_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_f_w_w, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 34bb062c200..f670c1282d8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -575,11 +575,16 @@ vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
 vfwcvt_f_f_v       010010 . ..... 01100 001 ..... 1010111 @r2_vm
 vfwcvt_rtz_xu_f_v  010010 . ..... 01110 001 ..... 1010111 @r2_vm
 vfwcvt_rtz_x_f_v   010010 . ..... 01111 001 ..... 1010111 @r2_vm
-vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
-vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
-vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
-vfncvt_f_x_v    100010 . ..... 10011 001 ..... 1010111 @r2_vm
-vfncvt_f_f_v    100010 . ..... 10100 001 ..... 1010111 @r2_vm
+
+vfncvt_xu_f_w      010010 . ..... 10000 001 ..... 1010111 @r2_vm
+vfncvt_x_f_w       010010 . ..... 10001 001 ..... 1010111 @r2_vm
+vfncvt_f_xu_w      010010 . ..... 10010 001 ..... 1010111 @r2_vm
+vfncvt_f_x_w       010010 . ..... 10011 001 ..... 1010111 @r2_vm
+vfncvt_f_f_w       010010 . ..... 10100 001 ..... 1010111 @r2_vm
+vfncvt_rod_f_f_w   010010 . ..... 10101 001 ..... 1010111 @r2_vm
+vfncvt_rtz_xu_f_w  010010 . ..... 10110 001 ..... 1010111 @r2_vm
+vfncvt_rtz_x_f_w   010010 . ..... 10111 001 ..... 1010111 @r2_vm
+
 vredsum_vs      000000 . ..... ..... 010 ..... 1010111 @r_vm
 vredand_vs      000001 . ..... ..... 010 ..... 1010111 @r_vm
 vredor_vs       000010 . ..... ..... 010 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b134a883bb2..6f5c48db0e6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2853,17 +2853,17 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
            vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_NARROW_TRANS(NAME)                                \
+#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_narrow_check(s, a)) {                                 \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
-            gen_helper_##NAME##_h,                                 \
-            gen_helper_##NAME##_w,                                 \
+            gen_helper_##HELPER##_h,                               \
+            gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, RISCV_FRM_DYN);                              \
+        gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2878,11 +2878,51 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_NARROW_TRANS(vfncvt_xu_f_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_x_f_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_x_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
+/* Reuse the helper function from vfncvt.f.f.w */
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
+
+static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return require_rvv(s) &&
+           require_scale_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV narrowing instructions ignore vs1 check */
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
+}
+
+#define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opxfv_narrow_check(s, a)) {                                \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[3] = {            \
+            gen_helper_##HELPER##_b,                               \
+            gen_helper_##HELPER##_h,                               \
+            gen_helper_##HELPER##_w,                               \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, FRM);                                        \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew]);        \
+        mark_vs_dirty(s);                                          \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_OPXFV_NARROW_TRANS(vfncvt_xu_f_w, vfncvt_xu_f_w, RISCV_FRM_DYN)
+GEN_OPXFV_NARROW_TRANS(vfncvt_x_f_w, vfncvt_x_f_w, RISCV_FRM_DYN)
+/* Reuse the helper functions from vfncvt.xu.f.w and vfncvt.x.f.w */
+GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_xu_f_w, vfncvt_xu_f_w, RISCV_FRM_RTZ)
+GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_x_f_w, vfncvt_x_f_w, RISCV_FRM_RTZ)
 
 /*
  *** Vector Reduction Operations
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e8de460b29b..8d389af4b78 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4029,31 +4029,36 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8)
 
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
+#define NOP_UU_B uint8_t,  uint16_t, uint32_t
 #define NOP_UU_H uint16_t, uint32_t, uint32_t
 #define NOP_UU_W uint32_t, uint64_t, uint64_t
 /* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
-RVVCALL(OPFVV1, vfncvt_xu_f_v_h, NOP_UU_H, H2, H4, float32_to_uint16)
-RVVCALL(OPFVV1, vfncvt_xu_f_v_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, 1, 1)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, 4, 4)
 
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. */
-RVVCALL(OPFVV1, vfncvt_x_f_v_h, NOP_UU_H, H2, H4, float32_to_int16)
-RVVCALL(OPFVV1, vfncvt_x_f_v_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4)
+RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
+RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
+RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1, 1)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4, 4)
 
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
-RVVCALL(OPFVV1, vfncvt_f_xu_v_h, NOP_UU_H, H2, H4, uint32_to_float16)
-RVVCALL(OPFVV1, vfncvt_f_xu_v_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4)
+RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, 4, 4)
 
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
-RVVCALL(OPFVV1, vfncvt_f_x_v_h, NOP_UU_H, H2, H4, int32_to_float16)
-RVVCALL(OPFVV1, vfncvt_f_x_v_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4)
+RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_w, 4, 4)
 
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4061,10 +4066,10 @@ static uint16_t vfncvtffv16(uint32_t a, float_status *s)
     return float32_to_float16(a, true, s);
 }
 
-RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
-RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4)
+RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
+RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4, 4)
 
 /*
  *** Vector Reduction Operations
-- 
2.17.1


