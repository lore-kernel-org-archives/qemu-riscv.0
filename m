Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAw4-0004oi-Tz
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAw2-0004hB-3P
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:10 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvy-000605-UX
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:09 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k5so868963pjg.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wwBItfECgJTIuDe5vvyT8sv2Edy6E2QEMOkmqSFHsbw=;
 b=Gjah03D70LqulALHsVfmthz9P2hDKg24AU+Oa0NpS7YnLccC2kEuycbO2OLVLhMm4t
 r08i7O+YRgvv4P9qUP6Y2M3l/fVEZ3WIRKxcf1ruKmBH6rEHVSVsf3KQpAxn1+iKsGvd
 AZEPiX9TnqcP5hjvfLL0hqfLro0jP5/DASxltiwPLtLjuLQL4lH9/MTMvPOVZGcqgHqh
 qHgugshIRLqiy0btF+cyerSLvsPvUEENLi1lWvzpksodpc7Rf6Hv9+FxwdgyKZoxeMPS
 txy/S2c0y+wtJsX65OG3u3f0NsRa9wO5jtjCbS4+VNPO9k3Fp5aN4iNvFpSzmFzgC8k3
 CZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wwBItfECgJTIuDe5vvyT8sv2Edy6E2QEMOkmqSFHsbw=;
 b=c4wNC7V5GFLendFPBMC+xQ4wp4bE4fvxVg68uVEBm0Rvnidq8anFZIC1+n0MTZYudY
 34B4Jrx7ePfA74IQbgKvS9U6si78eHepUvjkLjOjANHVnoidXtVGWF08tn6s7b2hVRLR
 Ato4hTXGUQN9wjPEEsWWmY2w2P2pxuwBem1OvWiJGwfXccFqf7DA1HNghAw6k3Oiw8RX
 r46aL+dP9WGXNGPDSWY6aloWM41lEXFGnfrq+DXUE6psnxUNcyqdjHwIYHIxIY3w+NX9
 vJoUJGp6UyiKnkA1QdAsWZ6kHkGppg7Ffp+sqpqZH4yw1fDpmpijJaMKN8KQcaVDnsLL
 +gJQ==
X-Gm-Message-State: AOAM5319PimgKJAi2Q0eYbmwjL0r8CibKzYAjYFoDcXVqm5ra4+u9dgi
 4hL809iAIhjWnyEBF4JiKO3qvikN6OE=
X-Google-Smtp-Source: ABdhPJxji5KB6KXHAv/dSYTUltJGvRTYh1U96MgHsNgW3LFtCv2C19i/J92sKxZSCxzuOguRc9GfeA==
X-Received: by 2002:a17:902:7241:: with SMTP id
 c1mr26687236pll.79.1595409665334; 
 Wed, 22 Jul 2020 02:21:05 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 49/76] target/riscv: rvv-0.9: quad-widening integer
 multiply-add instructions
Date: Wed, 22 Jul 2020 17:16:12 +0800
Message-Id: <20200722091641.8834-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vqmaccu.vv
* vqmaccu.vx
* vqmacc.vv
* vqmacc.vx
* vqmaccsu.vv
* vqmaccsu.vx
* vqmaccus.vx

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  15 ++++
 target/riscv/insn32.decode              |   7 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 101 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            |  40 ++++++++++
 4 files changed, 163 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 02258b42d1..b8a436d3aa 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -622,6 +622,21 @@ DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_6(vqmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+
 DEF_HELPER_6(vmerge_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmerge_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmerge_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c6a7145aa5..acd65cb3a7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -423,6 +423,13 @@ vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
+vqmaccu_vv      111100 . ..... ..... 000 ..... 1010111 @r_vm
+vqmaccu_vx      111100 . ..... ..... 100 ..... 1010111 @r_vm
+vqmacc_vv       111101 . ..... ..... 000 ..... 1010111 @r_vm
+vqmacc_vx       111101 . ..... ..... 100 ..... 1010111 @r_vm
+vqmaccsu_vv     111111 . ..... ..... 000 ..... 1010111 @r_vm
+vqmaccsu_vx     111111 . ..... ..... 100 ..... 1010111 @r_vm
+vqmaccus_vx     111110 . ..... ..... 100 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 451931492d..956ee90745 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -453,6 +453,52 @@ static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2,
     return ret;
 }
 
+/*
+ * Check function for vector instruction with format:
+ * quad-width result and single-width sources (4*SEW = SEW op SEW)
+ *
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      => LMUL < 4.
+ *      => SEW < 32.
+ *   2. Destination vector register number is multiples of 4 * LMUL.
+ *      (Section 3.3.2)
+ *   3. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.3.2)
+ *   4. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ *   5. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_check_qss(DisasContext *s, int vd, int vs1, int vs2,
+                           int vm, bool is_vs1)
+{
+    bool ret = (s->flmul <= 2) &&
+               (s->sew < 2) &&
+               require_align(vd, s->flmul * 4) &&
+               require_align(vs2, s->flmul) &&
+               require_vm(vm, vd);
+    if (s->flmul < 1) {
+        ret &= require_noover(vd, s->flmul * 4, vs2, s->flmul);
+    } else {
+        ret &= require_noover_widen(vd, s->flmul * 4, vs2, s->flmul);
+    }
+    if (is_vs1) {
+        ret &= require_align(vs1, s->flmul);
+        if (s->flmul < 1) {
+            ret &= require_noover(vd, s->flmul * 4, vs1, s->flmul);
+        } else {
+            ret &= require_noover_widen(vd, s->flmul * 4, vs1, s->flmul);
+        }
+    }
+    return ret;
+}
+
 /*
  * Check function for vector instruction with format:
  * double-width result and double-width source1 and single-width
@@ -2134,6 +2180,61 @@ GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 
+/* Vector Quad-Widening Integer Multiply-Add Instructions (Extension Zvqmac) */
+/* OPIVV with QUAD-WIDEN */
+static bool opivv_quad_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_qss(s, a->rd, a->rs1, a->rs2, a->vm, true);
+}
+
+#define GEN_OPIVV_QUAD_WIDEN_TRANS(NAME, CHECK)        \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a) \
+{                                                      \
+    static gen_helper_gvec_4_ptr * const fns[2] = {    \
+        gen_helper_##NAME##_b,                         \
+        gen_helper_##NAME##_h                          \
+    };                                                 \
+    return do_opivv_widen(s, a, fns[s->sew], CHECK);   \
+}
+
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmaccu_vv, opivv_quad_widen_check)
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmacc_vv, opivv_quad_widen_check)
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmaccsu_vv, opivv_quad_widen_check)
+
+/* OPIVX with QUAD-WIDEN */
+static bool opivx_quad_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_qss(s, a->rd, a->rs1, a->rs2, a->vm, false);
+}
+
+static bool do_opivx_quad_widen(DisasContext *s, arg_rmrr *a,
+                                gen_helper_opivx *fn)
+{
+    if (opivx_quad_widen_check(s, a)) {
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    }
+    return false;
+}
+
+#define GEN_OPIVX_QUAD_WIDEN_TRANS(NAME)               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a) \
+{                                                      \
+    static gen_helper_opivx * const fns[3] = {         \
+        gen_helper_##NAME##_b,                         \
+        gen_helper_##NAME##_h                          \
+    };                                                 \
+    return do_opivx_quad_widen(s, a, fns[s->sew]);     \
+}
+
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccu_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmacc_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccsu_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccus_vx)
+
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7de858d65b..420c5f675d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2121,6 +2121,46 @@ GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
 GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
 GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
 
+/* Vector Quad-Widening Integer Multiply-Add Instructions */
+#define QOP_UUU_B uint32_t, uint8_t, uint8_t, uint32_t, uint32_t
+#define QOP_UUU_H uint64_t, uint16_t, uint16_t, uint64_t, uint64_t
+#define QOP_SSS_B int32_t, int8_t, int8_t, int32_t, int32_t
+#define QOP_SSS_H int64_t, int16_t, int16_t, int64_t, int64_t
+#define QOP_SUS_B int32_t, uint8_t, int8_t, uint32_t, int32_t
+#define QOP_SUS_H int64_t, uint16_t, int16_t, uint64_t, int64_t
+#define QOP_SSU_B int32_t, int8_t, uint8_t, int32_t, uint32_t
+#define QOP_SSU_H int64_t, int16_t, uint16_t, int64_t, uint64_t
+
+RVVCALL(OPIVV3, vqmaccu_vv_b,  QOP_UUU_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmaccu_vv_h,  QOP_UUU_H, H8, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vqmacc_vv_b,   QOP_SSS_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmacc_vv_h,   QOP_SSS_H, H8, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vqmaccsu_vv_b, QOP_SSU_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmaccsu_vv_h, QOP_SSU_H, H8, H2, H2, DO_MACC)
+GEN_VEXT_VV(vqmaccu_vv_b,  1, 4, clearl)
+GEN_VEXT_VV(vqmaccu_vv_h,  2, 8, clearq)
+GEN_VEXT_VV(vqmacc_vv_b,   1, 4, clearl)
+GEN_VEXT_VV(vqmacc_vv_h,   2, 8, clearq)
+GEN_VEXT_VV(vqmaccsu_vv_b, 1, 4, clearl)
+GEN_VEXT_VV(vqmaccsu_vv_h, 2, 8, clearq)
+
+RVVCALL(OPIVX3, vqmaccu_vx_b,  QOP_UUU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccu_vx_h,  QOP_UUU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_b,   QOP_SSS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_h,   QOP_SSS_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_b, QOP_SSU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_h, QOP_SSU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_b, QOP_SUS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_h, QOP_SUS_H, H8, H2, DO_MACC)
+GEN_VEXT_VX(vqmaccu_vx_b,  1, 4, clearl)
+GEN_VEXT_VX(vqmaccu_vx_h,  2, 8, clearq)
+GEN_VEXT_VX(vqmacc_vx_b,   1, 4, clearl)
+GEN_VEXT_VX(vqmacc_vx_h,   2, 8, clearq)
+GEN_VEXT_VX(vqmaccsu_vx_b, 1, 4, clearl)
+GEN_VEXT_VX(vqmaccsu_vx_h, 2, 8, clearq)
+GEN_VEXT_VX(vqmaccus_vx_b, 1, 4, clearl)
+GEN_VEXT_VX(vqmaccus_vx_h, 2, 8, clearq)
+
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H, CLEAR_FN)                    \
 void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
-- 
2.17.1


