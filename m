Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxX-0007ue-JT
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxV-0007qE-U0
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:41 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxT-0006FY-IV
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id o13so894779pgf.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9XOTESI9eXA/uC1WDkucmt0i6gkmJBujKi7+z0KtGwA=;
 b=nAMRy9DEgjrqVfEGOsO6MGznuW9V8pSK4iqexcjg+yC5cmN8WdXqEjq9n+5DuKMp7g
 TzKXu0P2UScfVnj0s2YctNlancSx8IYq17NylGarogQrtpCu73VWDpEbbhkLctMduMTm
 pxcJvYv33sxhRtzDjIMy454WWuFLN15DG7YyxjYFS94tLD47iovvAiPJD/Gn/Yuhdozq
 G3k9HoIADnpxgAdkMSnpJTRGFdpjENvpt56q0sh3gtx8auub5XtgSYGFMVC3D7z6T7kX
 7WICg/qaT3coL3jXqyIPr9dLoRelrVbr9K8IANABKyYMOsPc8QqHDC73FCsqKjFgz5qY
 kxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9XOTESI9eXA/uC1WDkucmt0i6gkmJBujKi7+z0KtGwA=;
 b=TE1/Rwd4s1VtctLL+P7wWY/9sF4LXWkVy7US9lA27xM3ZUIJbHcE2Qj/AlZ5hUeXa6
 LGZPgvbojH/8UwHHPTSYb/hQ0EWHCZ0Ek1n3wnV7tVAsi7wp+WgrfsQIMG+0a71+mgVt
 FuJ8i5UMsyP53S/eyMvnx225nDc4jYiaTTJzcCD2hLh3dkoy+9nS8bBcCUxdICHAn5uR
 95fInCUWA9juVGdGty3GpJql+Nsrbhy14tCadr3zpy4Gcp0JKL41rfNQoaxqgHwwGlYR
 rK4Q1L1dAduIaKD6CiERY3dpcO24ssIq4+qP2aw7LtWEaHEwe30UsCgfx4qmZHhLePcQ
 /sDg==
X-Gm-Message-State: AOAM5325ndncVMzc94zoY7orBQPKdGFe5EkdWEq7g2uypmpyIwWXfTsp
 p3RGAR32Qna0DPuazz54dUKotg==
X-Google-Smtp-Source: ABdhPJwFditogk5CvmFL5pAeKr51uez7CR4lVqImYSOTfltMyEe+M+JxLKHgPjuFwxiHOWx4Ssu0Og==
X-Received: by 2002:aa7:9d81:: with SMTP id f1mr27221800pfq.225.1595409758329; 
 Wed, 22 Jul 2020 02:22:38 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 72/76] target/riscv: rvv-0.9: narrowing
 floating-point/integer type-convert
Date: Wed, 22 Jul 2020 17:16:35 +0800
Message-Id: <20200722091641.8834-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 30 +++++---
 target/riscv/insn32.decode              | 15 ++--
 target/riscv/insn_trans/trans_rvv.inc.c | 50 +++++++++++--
 target/riscv/vector_helper.c            | 99 ++++++++++++++++++++-----
 4 files changed, 154 insertions(+), 40 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 03330fa332..a8260072e6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -990,16 +990,26 @@ DEF_HELPER_5(vfwcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
 
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
+DEF_HELPER_5(vfncvt_rod_f_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rod_f_f_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_xu_f_w_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_xu_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_xu_f_w_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_x_f_w_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_x_f_w_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_rtz_x_f_w_w, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 55d7a6f338..17350227c6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -553,11 +553,16 @@ vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
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
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 775811c9f0..7c4f78a065 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3000,11 +3000,51 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_NARROW_TRANS(vfncvt_xu_f_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_x_f_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_x_v)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w)
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w)
+
+static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV narrowing instructions ignore vs1 check */
+           vext_check_sds(s, a->rd, 0, a->rs2, a->vm, false);
+}
+
+#define GEN_OPXFV_NARROW_TRANS(NAME)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opxfv_narrow_check(s, a)) {                                \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_b,                                 \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, 7);                                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
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
+GEN_OPXFV_NARROW_TRANS(vfncvt_xu_f_w)
+GEN_OPXFV_NARROW_TRANS(vfncvt_x_f_w)
+GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_xu_f_w)
+GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_x_f_w)
 
 /*
  *** Vector Reduction Operations
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3d12638c4b..d4563e9091 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4272,6 +4272,16 @@ static DTYPE##_t STYPE##_to_##DTYPE##_rtz(STYPE a, float_status *s) \
     return result;                                                  \
 }
 
+#define FCVT_ROD_F_F(STYPE, DTYPE)                              \
+static DTYPE STYPE##_to_##DTYPE##_rod(STYPE a, float_status *s) \
+{                                                               \
+    signed char frm = s->float_rounding_mode;                   \
+    s->float_rounding_mode = float_round_to_odd;                \
+    DTYPE result = STYPE##_to_##DTYPE(a, s);                    \
+    s->float_rounding_mode = frm;                               \
+    return result;                                              \
+}
+
 /*
  * vfcvt.rtz.xu.f.v vd, vs2, vm
  * Convert float to unsigned integer, truncating.
@@ -4371,31 +4381,36 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
 
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
+#define NOP_UU_B uint8_t,  uint16_t, uint32_t
 #define NOP_UU_H uint16_t, uint32_t, uint32_t
 #define NOP_UU_W uint32_t, uint64_t, uint64_t
 /* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
-RVVCALL(OPFVV1, vfncvt_xu_f_v_h, NOP_UU_H, H2, H4, float32_to_uint16)
-RVVCALL(OPFVV1, vfncvt_xu_f_v_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4, clearl)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
+RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, 1, 1, clearb)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, 4, 4, clearl)
 
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. */
-RVVCALL(OPFVV1, vfncvt_x_f_v_h, NOP_UU_H, H2, H4, float32_to_int16)
-RVVCALL(OPFVV1, vfncvt_x_f_v_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4, clearl)
+RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
+RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
+RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1, 1, clearb)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4, 4, clearl)
 
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
-RVVCALL(OPFVV1, vfncvt_f_xu_v_h, NOP_UU_H, H2, H4, uint32_to_float16)
-RVVCALL(OPFVV1, vfncvt_f_xu_v_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4, clearl)
+RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, 4, 4, clearl)
 
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
-RVVCALL(OPFVV1, vfncvt_f_x_v_h, NOP_UU_H, H2, H4, int32_to_float16)
-RVVCALL(OPFVV1, vfncvt_f_x_v_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4, clearl)
+RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_w, 4, 4, clearl)
 
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4403,10 +4418,54 @@ static uint16_t vfncvtffv16(uint32_t a, float_status *s)
     return float32_to_float16(a, true, s);
 }
 
-RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
-RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
+RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
+RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4, 4, clearl)
+
+/*
+ * vfncvt.rod.f.f.w vd, vs2, vm
+ * Convert double-width float to single-width float, rounding towards odd.
+ */
+static uint16_t vfncvtffv16_rod(uint32_t a, float_status *s)
+{
+    s->float_rounding_mode = float_round_to_odd;
+    return float32_to_float16(a, true, s);
+}
+
+FCVT_ROD_F_F(float64, float32)
+RVVCALL(OPFVV1, vfncvt_rod_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16_rod)
+RVVCALL(OPFVV1, vfncvt_rod_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32_rod)
+GEN_VEXT_V_ENV(vfncvt_rod_f_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_rod_f_f_w_w, 4, 4, clearl)
+
+/*
+ * vfncvt.rtz.xu.f.w vd, vs2, vm
+ * Convert double-width float to unsigned integer, truncating.
+ */
+FCVT_RTZ_F_V(float16, uint8)
+FCVT_RTZ_F_V(float32, uint16)
+FCVT_RTZ_F_V(float64, uint32)
+RVVCALL(OPFVV1, vfncvt_rtz_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8_rtz)
+RVVCALL(OPFVV1, vfncvt_rtz_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16_rtz)
+RVVCALL(OPFVV1, vfncvt_rtz_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32_rtz)
+GEN_VEXT_V_ENV(vfncvt_rtz_xu_f_w_b, 1, 1, clearb)
+GEN_VEXT_V_ENV(vfncvt_rtz_xu_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_rtz_xu_f_w_w, 4, 4, clearl)
+
+/*
+ * vfncvt.rtz.x.f.w  vd, vs2, vm
+ * Convert double-width float to signed integer, truncating.
+ */
+FCVT_RTZ_F_V(float16, int8)
+FCVT_RTZ_F_V(float32, int16)
+FCVT_RTZ_F_V(float64, int32)
+RVVCALL(OPFVV1, vfncvt_rtz_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8_rtz)
+RVVCALL(OPFVV1, vfncvt_rtz_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16_rtz)
+RVVCALL(OPFVV1, vfncvt_rtz_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32_rtz)
+GEN_VEXT_V_ENV(vfncvt_rtz_x_f_w_b, 1, 1, clearb)
+GEN_VEXT_V_ENV(vfncvt_rtz_x_f_w_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_rtz_x_f_w_w, 4, 4, clearl)
 
 /*
  *** Vector Reduction Operations
-- 
2.17.1


