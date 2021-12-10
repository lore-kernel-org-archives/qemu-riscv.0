Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvanO-00051z-MV
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanG-0004uZ-Eq
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:16 -0500
Received: from [2607:f8b0:4864:20::42f] (port=42779
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanD-0006M3-2d
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:14 -0500
Received: by mail-pf1-x42f.google.com with SMTP id u80so7753314pfc.9
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1X3aOWFzuZ0CXuNQOM7eBf47FxKMJzDw8HfmwoPDGRY=;
 b=erINZebFy1m2ZRNpNkDUvjH/BNIrBekEjJPE8sxmaFjvGWa3TiLxqb5qLFn0D5Ew2a
 qNA29mXXSOlXIqsT43i4zuODNs56JIK0X7yxLiXcRA4oRhSRb4r3xh0DxIU09VLWeFna
 gwwDX9d8wxBFKISHFfO0YciGjYyioEX4h9pVImYDCVIVa0cNeVcR7vz3Go5xs5zZZMef
 bGnc7mMQU1Qlq+qCLi96yw2u3EcDkSQ3jThlBqQg0JeOZk3/bmS4vFXfYHTVb/GyM/rZ
 EIJfNW7QKdlh2WWsqMzMtbTwZYzWeZ8l9s1zDUQfsLqhkDe05aozjTNxM8bvmujU1BmH
 Sm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X3aOWFzuZ0CXuNQOM7eBf47FxKMJzDw8HfmwoPDGRY=;
 b=6NpZpUDunpeK+jS2rfejM40rmiE//otYxxq8grS+afPJIQYjS39sORdImHz2aNmRix
 tYZo1KymhPu2ibHXYd9Ps7RkaW93lvrK9oFpKgId0SD8sajHwQkqCAWjfRaCgIxAd9ch
 WtxQ8umpGnBQjcnAMT4ANRRYzKTmA72db2c19VtpkkhqpwM2aT89qsvC5tCTG60j+WJS
 TmrAWN31H1OZH6rmDfqJ9f7Z7iyx9ZHl6ifjR+C99sYyeOksqI2h7PyugCsm0zCDFluv
 x3Jrwfq6qdQl0irHhysAr+a0QB+rlV+Bt40znMm++LLGUMe4MJFwIUzhRnhxynSnjo+d
 Yc8Q==
X-Gm-Message-State: AOAM530qoAqfApzwheUjpgWn1NVH5FZPV7gYJC7mr9UXpmMcer7qrMD9
 +J9SKdDtvaK95FUS6uQrrUPLYQ==
X-Google-Smtp-Source: ABdhPJwNIqn+16lSd7uMGtdndFBEd4v6DdufD51rVS0GoNgBI/9Gi0OQF/id7UbCtKxKrmYwqwDFrg==
X-Received: by 2002:a63:c154:: with SMTP id p20mr37689455pgi.132.1639123089834; 
 Thu, 09 Dec 2021 23:58:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 16/77] target/riscv: introduce more imm value modes in
 translator functions
Date: Fri, 10 Dec 2021 15:56:02 +0800
Message-Id: <20211210075704.23951-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Immediate value in translator function is extended not only
zero-extended and sign-extended but with more modes to be applicable
with multiple formats of vector instructions.

* IMM_ZX:         Zero-extended
* IMM_SX:         Sign-extended
* IMM_TRUNC_SEW:  Truncate to log(SEW) bit
* IMM_TRUNC_2SEW: Truncate to log(2*SEW) bit

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 115 ++++++++++++++----------
 1 file changed, 66 insertions(+), 49 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bef37dd888..66273afb53 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1313,8 +1313,32 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
 
+typedef enum {
+    IMM_ZX,         /* Zero-extended */
+    IMM_SX,         /* Sign-extended */
+    IMM_TRUNC_SEW,  /* Truncate to log(SEW) bits */
+    IMM_TRUNC_2SEW, /* Truncate to log(2*SEW) bits */
+} imm_mode_t;
+
+static int64_t extract_imm(DisasContext *s, uint32_t imm, imm_mode_t imm_mode)
+{
+    switch (imm_mode) {
+    case IMM_ZX:
+        return extract64(imm, 0, 5);
+    case IMM_SX:
+        return sextract64(imm, 0, 5);
+    case IMM_TRUNC_SEW:
+        return extract64(imm, 0, s->sew + 3);
+    case IMM_TRUNC_2SEW:
+        return extract64(imm, 0, s->sew + 4);
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
-                        gen_helper_opivx *fn, DisasContext *s, int zx)
+                        gen_helper_opivx *fn, DisasContext *s,
+                        imm_mode_t imm_mode)
 {
     TCGv_ptr dest, src2, mask;
     TCGv src1;
@@ -1327,11 +1351,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    if (zx) {
-        src1 = tcg_constant_tl(imm);
-    } else {
-        src1 = tcg_constant_tl(sextract64(imm, 0, 5));
-    }
+    src1 = tcg_constant_tl(extract_imm(s, imm, imm_mode));
+
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
@@ -1355,28 +1376,23 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
 
 static inline bool
 do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
-              gen_helper_opivx *fn, int zx)
+              gen_helper_opivx *fn, imm_mode_t imm_mode)
 {
     if (!opivx_check(s, a)) {
         return false;
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        if (zx) {
-            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
-                    extract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
-        } else {
-            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
-                    sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
-        }
+        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
         mark_vs_dirty(s);
         return true;
     }
-    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, imm_mode);
 }
 
 /* OPIVI with GVEC IR */
-#define GEN_OPIVI_GVEC_TRANS(NAME, ZX, OPIVX, SUF) \
+#define GEN_OPIVI_GVEC_TRANS(NAME, IMM_MODE, OPIVX, SUF) \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 {                                                                  \
     static gen_helper_opivx * const fns[4] = {                     \
@@ -1384,10 +1400,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
     };                                                             \
     return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
-                         fns[s->sew], ZX);                         \
+                         fns[s->sew], IMM_MODE);                   \
 }
 
-GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
+GEN_OPIVI_GVEC_TRANS(vadd_vi, IMM_SX, vadd_vx, addi)
 
 static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
                                int64_t c, uint32_t oprsz, uint32_t maxsz)
@@ -1396,7 +1412,7 @@ static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_rsubs(vece, dofs, aofs, tmp, oprsz, maxsz);
 }
 
-GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
+GEN_OPIVI_GVEC_TRANS(vrsub_vi, IMM_SX, vrsub_vx, rsubi)
 
 /* Vector Widening Integer Add/Subtract */
 
@@ -1652,7 +1668,7 @@ GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
 GEN_OPIVX_TRANS(vmsbc_vxm, opivx_vmadc_check)
 
 /* OPIVI without GVEC IR */
-#define GEN_OPIVI_TRANS(NAME, ZX, OPIVX, CHECK)                          \
+#define GEN_OPIVI_TRANS(NAME, IMM_MODE, OPIVX, CHECK)                    \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
     if (CHECK(s, a)) {                                                   \
@@ -1661,13 +1677,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,              \
         };                                                               \
         return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
-                           fns[s->sew], s, ZX);                          \
+                           fns[s->sew], s, IMM_MODE);                    \
     }                                                                    \
     return false;                                                        \
 }
 
-GEN_OPIVI_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
-GEN_OPIVI_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
+GEN_OPIVI_TRANS(vadc_vim, IMM_SX, vadc_vxm, opivx_vadc_check)
+GEN_OPIVI_TRANS(vmadc_vim, IMM_SX, vmadc_vxm, opivx_vmadc_check)
 
 /* Vector Bitwise Logical Instructions */
 GEN_OPIVV_GVEC_TRANS(vand_vv, and)
@@ -1676,9 +1692,9 @@ GEN_OPIVV_GVEC_TRANS(vxor_vv, xor)
 GEN_OPIVX_GVEC_TRANS(vand_vx, ands)
 GEN_OPIVX_GVEC_TRANS(vor_vx,  ors)
 GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
-GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
-GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
-GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
+GEN_OPIVI_GVEC_TRANS(vand_vi, IMM_SX, vand_vx, andi)
+GEN_OPIVI_GVEC_TRANS(vor_vi, IMM_SX, vor_vx,  ori)
+GEN_OPIVI_GVEC_TRANS(vxor_vi, IMM_SX, vxor_vx, xori)
 
 /* Vector Single-Width Bit Shift Instructions */
 GEN_OPIVV_GVEC_TRANS(vsll_vv,  shlv)
@@ -1726,9 +1742,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
@@ -1794,7 +1810,7 @@ GEN_OPIVX_NARROW_TRANS(vnsra_vx)
 GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
 
 /* OPIVI with NARROW */
-#define GEN_OPIVI_NARROW_TRANS(NAME, ZX, OPIVX)                          \
+#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
     if (opivx_narrow_check(s, a)) {                                      \
@@ -1804,13 +1820,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##OPIVX##_w,                                      \
         };                                                               \
         return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
-                           fns[s->sew], s, ZX);                          \
+                           fns[s->sew], s, IMM_MODE);                    \
     }                                                                    \
     return false;                                                        \
 }
 
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, 1, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
+GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
+GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
 
 /* Vector Integer Comparison Instructions */
 /*
@@ -1848,12 +1864,12 @@ GEN_OPIVX_TRANS(vmsle_vx, opivx_cmp_check)
 GEN_OPIVX_TRANS(vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
-GEN_OPIVI_TRANS(vmseq_vi, 0, vmseq_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsne_vi, 0, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, 1, vmsleu_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsle_vi, 0, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, 1, vmsgtu_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgt_vi, 0, vmsgt_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
 GEN_OPIVV_GVEC_TRANS(vminu_vv, umin)
@@ -2025,7 +2041,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 
 GEN_OPIVV_TRANS(vmerge_vvm, opivv_vadc_check)
 GEN_OPIVX_TRANS(vmerge_vxm, opivx_vadc_check)
-GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vadc_check)
+GEN_OPIVI_TRANS(vmerge_vim, IMM_SX, vmerge_vxm, opivx_vadc_check)
 
 /*
  *** Vector Fixed-Point Arithmetic Instructions
@@ -2040,8 +2056,8 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
-GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
 GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
@@ -2068,16 +2084,16 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
 GEN_OPIVV_NARROW_TRANS(vnclip_vv)
 GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
 GEN_OPIVX_NARROW_TRANS(vnclip_vx)
-GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
-GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
+GEN_OPIVI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
+GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 
 /*
  *** Vector Float Point Arithmetic Instructions
@@ -3051,7 +3067,7 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
 
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
 GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
-GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
+GEN_OPIVI_TRANS(vslideup_vi, IMM_ZX, vslideup_vx, slideup_check)
 
 static bool slidedown_check(DisasContext *s, arg_rmrr *a)
 {
@@ -3062,7 +3078,7 @@ static bool slidedown_check(DisasContext *s, arg_rmrr *a)
 
 GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
-GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
+GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
@@ -3141,7 +3157,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
             gen_helper_vrgather_vx_w, gen_helper_vrgather_vx_d
         };
-        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s, 1);
+        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew],
+                           s, IMM_ZX);
     }
     return true;
 }
-- 
2.31.1


