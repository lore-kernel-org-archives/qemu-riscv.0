Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTkk-00039n-On
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkb-000363-3t
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:10 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkY-0002pt-9L
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:08 -0500
Received: by mail-pj1-x102f.google.com with SMTP id c19so5185564pjq.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o6YmJrVhVCeRd6JXOPvd7XUBEHGbEGXe4MsFy4XOYOM=;
 b=N6WrasbEFFM+gTRgNHp+O3UZ0mPGgN4NJSahaS2/qnpA91RngWdvQ5D7oOGAt33a4e
 5E8GwsaYOL4Yc8TboO1HOolaAGvEVLfxCb2byl65oWG0o2gxy8/qoaj8zhZqS+yrbNJu
 +RzNAny4vkNTvxd/Xoc4DpcP66J7DDJCilM7oE456P9waP+9XDXt+MVqdNTLIcaCXrkz
 RXkaQxzSQQxp/O76sOv9X6BjFxYYsI4g4qtW4EOuHOUTtmpXhcmsL379UJgwX1ZLZjSn
 wHmroaNpBJwalW4E8XmGqVb7LpV6nGSNv1tZlnMDgujfMrfIVIXl14KBqx3tbFNZVmhn
 U7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o6YmJrVhVCeRd6JXOPvd7XUBEHGbEGXe4MsFy4XOYOM=;
 b=SZqYA/n7SUhFCCKUOtUlqpaM/SsuF8JMdg8Ka+SWaqP03mYrAc9V0LBcJ0p93JGeiA
 cVMLAAcg/6pVk88dPWTOW+cvjgRItu3HN4N71XX/1TcGT4OD3Mjl2DtgPDW+nUoE2ddz
 /9vsTqhHxhAuqqcFbTfqD4R763VnXkTBN0ILGqqpuKdSO8kMhDno81RR2iz+ewnDWlZJ
 h/N0+/q7i8tvlbrz9AiCjKSywfWuYuV/G0TPq4bPPxjcRSsiNqgbULdWu4wopb6ZmT8Y
 UaTmzRFl22NnuKBbIgbRPXebLaeiywb0wa9DYBe2Jmdm0cRZRE6yN7OAoBjiaYgYQ/Y/
 7Otg==
X-Gm-Message-State: AOAM532B6Xbciz1qXQYUQz7AYs4rzfc0i6bbfBI2GcAuo5iTdDHlnaps
 ERbui8I5EsT7WbiGiCd+isST6A==
X-Google-Smtp-Source: ABdhPJysr3wMClFazGqMQkIuzbowJ7E2LH6r8h7CiO57uuRGHBLKmkew0N0/YTx1ADPSR2i4qcASpw==
X-Received: by 2002:a17:90a:fd89:: with SMTP id
 cx9mr610437pjb.93.1614309904271; 
 Thu, 25 Feb 2021 19:25:04 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 61/75] target/riscv: rvv-1.0: widening
 floating-point/integer type-convert
Date: Fri, 26 Feb 2021 11:18:45 +0800
Message-Id: <20210226031902.23656-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfwcvt.rtz.xu.f.v
* vfwcvt.rtz.x.f.v

Also adjust GEN_OPFV_WIDEN_TRANS() to accept multiple floating-point
rounding modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              | 13 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 54 +++++++++++++++++++++----
 target/riscv/vector_helper.c            |  7 +++-
 4 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index cdaa21b7008..e11cce3e8ea 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -969,8 +969,10 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
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
index c15ed5d3dbb..34bb062c200 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -567,11 +567,14 @@ vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
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
index 4f5f36aae8f..b134a883bb2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2768,12 +2768,54 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
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
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew - 1]);    \
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
@@ -2782,10 +2824,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           s->vlen / 8, data, fns[s->sew]);        \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
@@ -2793,11 +2834,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
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
index e3056a06fe2..e8de460b29b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3982,6 +3982,7 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
+#define WOP_UU_B uint16_t, uint8_t,  uint8_t
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
 #define WOP_UU_W uint64_t, uint32_t, uint32_t
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
@@ -3997,19 +3998,23 @@ GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4)
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
2.17.1


