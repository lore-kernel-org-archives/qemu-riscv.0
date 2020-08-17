Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asN-0001pN-2s
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asL-0001lk-QM
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:17 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asJ-0005Db-Cc
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:17 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o13so7812279pgf.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kG1ZC1+nhLv1mTJe4QQaPZi4lCOzKolAUQgA67W/bb8=;
 b=QC2fE3sdERMUSxT/3lYCjk19vPj9bVO6W0rmSsVG+9oMkQKNDv8E8gVIW2mVUI9MJy
 b5TTx085t0q2x0nWIF1cZs0GZl1tvLWgYQxBc/ppgnHgfStDizKta6aUYzTOYYfqMhq3
 bj8s6Y/3zUL266IZ50ugctI0k1TZeXdSwQoJfw2xXZN2KFNsX0Wy/WEI6s0EMadLPHDx
 fBaiinxcUIcdv3GJRujF7Knt2Af4HgvDwDOhKP2DC1wQlW9l8rQ4VakwXt6/uJdypHfM
 NJwKDSrJIFKov2u6LOqXvyVT1flFBiteQfEtw3GHL7CM4F3cLOe6D3s0AeK9heqm/axX
 RV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kG1ZC1+nhLv1mTJe4QQaPZi4lCOzKolAUQgA67W/bb8=;
 b=TTMoVy/XNqRHWwmn0YmHWhB9ddsSyp76xsag0eIHCtREq7cPyEAdi9qdrZytnpIpMs
 O6GaBAe59wJeS51zMDOF3NkN0QbZ4UvT8LPIy+K++K3Wo6rrlYMIQ+6XKG/A35JJlV+J
 MrNgK55zMAno75r9vUdFa1SJkTh65qJvAn9WCGShq2o0GZar3PbW9H57ifDtGD+hJr8W
 8SGsaa/eg1mBbkQ8bZQVZbpW2OTGQYUVVVcfKoxn1PIl5yuRxJML0atEyBjkDGGVThSq
 uPcD5askgyzSvm54YrM1SS7R/RErMLyDxKpOW0U/a+/WPxO5jzX7ZHAu0YK5n1SBtXcJ
 JRlA==
X-Gm-Message-State: AOAM530M0T3tO9s+8WFYBfSF18kjou9OvPDPo/pe0cMGTKdq1SJhlK1t
 k+haI2yyNkI9m7vpPfvwBVEl0Q==
X-Google-Smtp-Source: ABdhPJwOMCShjEqcOeDewq7xx+Jh4WAH6wQmCAuaoZwewURigtzLDhhViHF9vBFl0UvsPS+tH0GQxw==
X-Received: by 2002:a63:b90a:: with SMTP id z10mr8848069pge.277.1597654334146; 
 Mon, 17 Aug 2020 01:52:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 46/70] target/riscv: rvv-1.0: quad-widening integer
 multiply-add instructions
Date: Mon, 17 Aug 2020 16:49:31 +0800
Message-Id: <20200817084955.28793-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:18 -0000

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
 target/riscv/insn_trans/trans_rvv.inc.c | 109 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            |  40 +++++++++
 4 files changed, 171 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index fe37bd2f4af..6825c15e025 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -640,6 +640,21 @@ DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
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
index 2e305d492d8..b2ecc8dd4d1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -441,6 +441,13 @@ vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
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
index 11dddc3252c..809280f4c5c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -64,6 +64,11 @@ static bool require_rvv(DisasContext *s)
     return true;
 }
 
+static bool require_ext_vqmac(DisasContext *s)
+{
+    return s->ext_vqmac;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int rd)
 {
@@ -461,6 +466,53 @@ static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2,
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
+    bool ret = (s->lmul <= 1) &&
+               (s->sew < 2) &&
+               require_align(vd, 1 << (s->lmul + 2)) &&
+               require_align(vs2, 1 << s->lmul) &&
+               require_vm(vm, vd);
+    if (s->lmul < 0) {
+        ret &= require_noover(vd, 1 << (s->lmul + 2), vs2, 1 << s->lmul);
+    } else {
+        ret &= require_noover_widen(vd, 1 << (s->lmul + 2), vs2, 1 << s->lmul);
+    }
+    if (is_vs1) {
+        ret &= require_align(vs1, 1 << s->lmul);
+        if (s->lmul < 0) {
+            ret &= require_noover(vd, 1 << (s->lmul + 2), vs1, 1 << s->lmul);
+        } else {
+            ret &= require_noover_widen(vd, 1 << (s->lmul + 2),
+                                        vs1, 1 << s->lmul);
+        }
+    }
+    return ret;
+}
+
 /*
  * Check function for vector instruction with format:
  * double-width result and double-width source1 and single-width
@@ -2100,6 +2152,63 @@ GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 
+/* Vector Quad-Widening Integer Multiply-Add Instructions (Extension Zvqmac) */
+/* OPIVV with QUAD-WIDEN */
+static bool opivv_quad_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           require_ext_vqmac(s) &&
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
+           require_ext_vqmac(s) &&
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
index 4734ff88ae6..544c8e38fca 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1983,6 +1983,46 @@ GEN_VEXT_VX(vwmaccus_vx_b, 1, 2)
 GEN_VEXT_VX(vwmaccus_vx_h, 2, 4)
 GEN_VEXT_VX(vwmaccus_vx_w, 4, 8)
 
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
+GEN_VEXT_VV(vqmaccu_vv_b,  1, 4)
+GEN_VEXT_VV(vqmaccu_vv_h,  2, 8)
+GEN_VEXT_VV(vqmacc_vv_b,   1, 4)
+GEN_VEXT_VV(vqmacc_vv_h,   2, 8)
+GEN_VEXT_VV(vqmaccsu_vv_b, 1, 4)
+GEN_VEXT_VV(vqmaccsu_vv_h, 2, 8)
+
+RVVCALL(OPIVX3, vqmaccu_vx_b,  QOP_UUU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccu_vx_h,  QOP_UUU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_b,   QOP_SSS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_h,   QOP_SSS_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_b, QOP_SSU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_h, QOP_SSU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_b, QOP_SUS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_h, QOP_SUS_H, H8, H2, DO_MACC)
+GEN_VEXT_VX(vqmaccu_vx_b,  1, 4)
+GEN_VEXT_VX(vqmaccu_vx_h,  2, 8)
+GEN_VEXT_VX(vqmacc_vx_b,   1, 4)
+GEN_VEXT_VX(vqmacc_vx_h,   2, 8)
+GEN_VEXT_VX(vqmaccsu_vx_b, 1, 4)
+GEN_VEXT_VX(vqmaccsu_vx_h, 2, 8)
+GEN_VEXT_VX(vqmaccus_vx_b, 1, 4)
+GEN_VEXT_VX(vqmaccus_vx_h, 2, 8)
+
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
 void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
-- 
2.17.1


