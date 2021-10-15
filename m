Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHwY-0006l1-GE
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwJ-0006To-9h
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:40 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwD-0002UW-G1
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:39 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c4so5879832pls.6
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mD6S6GWtDJl/QMYf2j7anSDWasizpOBczn4X1/mWr3w=;
 b=JXk7znDZ4S/8qw/+rcbswKp2rDOhCiH0ed9RvaqB76lhnRspxzIIJrL50CvYI52liN
 dXJ2kGVySkWCWT5d9kWBzlf0TNl+NpYPZ/9o+HFHAbEsohaYJzuUv5oL8PVY94Q2rWRz
 rJw3pdH+GUkJ4Uazggco2EzQNc8EwGqEXcDbFMea0xNcMo//V0ilSymj7Pwq2Xa+lFKW
 5C/5zINZ9uPiZxcO86jvBmbYFuNHLz6BqgO/EP5fuasGX1hEV75iSeOc3FxgSRRv1EZZ
 HiAGl9DD30HdkCZujvb28PQI7As7HdRS/kFUAbkMhk5OMj369k8few6y7AvfYj7QrOe6
 wPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mD6S6GWtDJl/QMYf2j7anSDWasizpOBczn4X1/mWr3w=;
 b=upNZ1WmG5zku1ofX1MDXe7GoVUQiqZ6hBpsU4K+5cfxPN24PoUmOfuEkA9EbvSLZH9
 S1q18P2RP45CXPGBBhJfXv//Rv6Lp1PfB6LUOf4N9bl+SPhPTBkiekrgUUUKpmyOm8rW
 A0B2FjRCFuJKRB0BNSWgmiFVho/rhHwtoXXYVUuZlouw/yHNRnfmHtp2RnZBsPef5PPH
 CPKTGmh9SgQteD12ripTlOrir+c924HLFpzWrM227GBnDMKhIjZuMpI98rNMyHIRcCMM
 T/NjwvHwY+mFGv2lbcD5MsEmAIbB/1ePT1oztAqaykVoU/+ekUAPBuEQytY7lr5FK4S+
 YcWA==
X-Gm-Message-State: AOAM531nvIDCV0P4WEhEkFCd/POHTv7JaZGsdU9g5kxKE2KMfJXceOHi
 fmoXhQ/p/uyDAH3bDKCrxv9N7akxzj9pWQ==
X-Google-Smtp-Source: ABdhPJxtvNJrnHCCZxgh4CVb3SAOB1uxhrbd2i1hKD8FKob7Wt08Fysex34j/GW7cKT0Hc9vy0xeLQ==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr11736992pjb.195.1634284052016; 
 Fri, 15 Oct 2021 00:47:32 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 15/78] target/riscv: rvv-1.0: update check functions
Date: Fri, 15 Oct 2021 15:45:16 +0800
Message-Id: <20211015074627.3957162-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:47:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Update check functions with RVV 1.0 rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 715 +++++++++++++++++-------
 1 file changed, 507 insertions(+), 208 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ddf20f02dfa..a03cc8e0781 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -19,11 +19,112 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 
+static inline bool is_overlapped(const int8_t astart, int8_t asize,
+                                 const int8_t bstart, int8_t bsize)
+{
+    const int8_t aend = astart + asize;
+    const int8_t bend = bstart + bsize;
+
+    return MAX(aend, bend) - MIN(astart, bstart) < asize + bsize;
+}
+
+static bool require_rvv(DisasContext *s)
+{
+    return s->mstatus_vs != 0;
+}
+
+static bool require_rvf(DisasContext *s)
+{
+    if (s->mstatus_fs == 0) {
+        return false;
+    }
+
+    switch (s->sew) {
+    case MO_16:
+    case MO_32:
+        return has_ext(s, RVF);
+    case MO_64:
+        return has_ext(s, RVD);
+    default:
+        return false;
+    }
+}
+
+static bool require_scale_rvf(DisasContext *s)
+{
+    if (s->mstatus_fs == 0) {
+        return false;
+    }
+
+    switch (s->sew) {
+    case MO_8:
+    case MO_16:
+        return has_ext(s, RVF);
+    case MO_32:
+        return has_ext(s, RVD);
+    default:
+        return false;
+    }
+}
+
+/* Destination vector register group cannot overlap source mask register. */
+static bool require_vm(int vm, int vd)
+{
+    return (vm != 0 || vd != 0);
+}
+
+/*
+ * Vector register should aligned with the passed-in LMUL (EMUL).
+ * If LMUL < 0, i.e. fractional LMUL, any vector register is allowed.
+ */
+static bool require_align(const int8_t val, const int8_t lmul)
+{
+    return lmul <= 0 || extract32(val, 0, lmul) == 0;
+}
+
+/*
+ * A destination vector register group can overlap a source vector
+ * register group only if one of the following holds:
+ *  1. The destination EEW equals the source EEW.
+ *  2. The destination EEW is smaller than the source EEW and the overlap
+ *     is in the lowest-numbered part of the source register group.
+ *  3. The destination EEW is greater than the source EEW, the source EMUL
+ *     is at least 1, and the overlap is in the highest-numbered part of
+ *     the destination register group.
+ * (Section 5.2)
+ *
+ * This function returns true if one of the following holds:
+ *  * Destination vector register group does not overlap a source vector
+ *    register group.
+ *  * Rule 3 met.
+ * For rule 1, overlap is allowed so this function doesn't need to be called.
+ * For rule 2, (vd == vs). Caller has to check whether: (vd != vs) before
+ * calling this function.
+ */
+static bool require_noover(const int8_t dst, const int8_t dst_lmul,
+                           const int8_t src, const int8_t src_lmul)
+{
+    int8_t dst_size = dst_lmul <= 0 ? 1 : 1 << dst_lmul;
+    int8_t src_size = src_lmul <= 0 ? 1 : 1 << src_lmul;
+
+    /* Destination EEW is greater than the source EEW, check rule 3. */
+    if (dst_size > src_size) {
+        if (dst < src &&
+            src_lmul >= 0 &&
+            is_overlapped(dst, dst_size, src, src_size) &&
+            !is_overlapped(dst, dst_size, src + src_size, src_size)) {
+            return true;
+        }
+    }
+
+    return !is_overlapped(dst, dst_size, src, src_size);
+}
+
 static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
     TCGv s1, s2, dst;
 
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
@@ -51,7 +152,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
 {
     TCGv s1, s2, dst;
 
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
@@ -82,6 +183,237 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
 
 /* check functions */
 
+static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
+{
+    return require_vm(vm, vd) &&
+        require_align(vd, s->lmul) &&
+        require_align(vs, s->lmul);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * single-width result and single-width sources (SEW = SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
+{
+    return vext_check_ss(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul);
+}
+
+static bool vext_check_ms(DisasContext *s, int vd, int vs)
+{
+    bool ret = require_align(vs, s->lmul);
+    if (vd != vs) {
+        ret &= require_noover(vd, 0, vs, s->lmul);
+    }
+    return ret;
+}
+
+/*
+ * Check function for maskable vector instruction with format:
+ * single-width result and single-width sources (SEW = SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ *   3. The destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0),
+ *      unless the destination vector register is being written
+ *      with a mask value (e.g., comparisons) or the scalar result
+ *      of a reduction. (Section 5.3)
+ */
+static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
+{
+    bool ret = vext_check_ms(s, vd, vs2) &&
+        require_align(vs1, s->lmul);
+    if (vd != vs1) {
+        ret &= require_noover(vd, 0, vs1, s->lmul);
+    }
+    return ret;
+}
+
+/*
+ * Common check function for vector widening instructions
+ * of double-width result (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      => LMUL < 8.
+ *      => SEW < 64.
+ *   2. Destination vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
+{
+    return (s->lmul <= 2) &&
+           (s->sew < MO_64) &&
+           require_align(vd, s->lmul + 1) &&
+           require_vm(vm, vd);
+}
+
+/*
+ * Common check function for vector narrowing instructions
+ * of single-width result (SEW) and double-width source (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      => LMUL < 8.
+ *      => SEW < 64.
+ *   2. Source vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   4. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
+                                     int vm)
+{
+    return (s->lmul <= 2) &&
+           (s->sew < MO_64) &&
+           require_align(vs2, s->lmul + 1) &&
+           require_align(vd, s->lmul) &&
+           require_vm(vm, vd);
+}
+
+static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
+{
+    return vext_wide_check_common(s, vd, vm) &&
+        require_align(vs, s->lmul) &&
+        require_noover(vd, s->lmul + 1, vs, s->lmul);
+}
+
+static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
+{
+    return vext_wide_check_common(s, vd, vm) &&
+        require_align(vs, s->lmul + 1);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * double-width result and single-width sources (2*SEW = SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
+{
+    return vext_check_ds(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul) &&
+        require_noover(vd, s->lmul + 1, vs1, s->lmul);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * double-width result and double-width source1 and single-width
+ * source2 (2*SEW = 2*SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source 1 (vs2) vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   4. Destination vector register cannot overlap a source vector
+ *      register (vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2, int vm)
+{
+    return vext_check_ds(s, vd, vs1, vm) &&
+        require_align(vs2, s->lmul + 1);
+}
+
+static bool vext_check_sd(DisasContext *s, int vd, int vs, int vm)
+{
+    bool ret = vext_narrow_check_common(s, vd, vs, vm);
+    if (vd != vs) {
+        ret &= require_noover(vd, s->lmul, vs, s->lmul + 1);
+    }
+    return ret;
+}
+
+/*
+ * Check function for vector instruction with format:
+ * single-width result and double-width source 1 and single-width
+ * source 2 (SEW = 2*SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in narrow common rules are applied.
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2) group.
+ *      (Section 5.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
+{
+    return vext_check_sd(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul);
+}
+
+/*
+ * Check function for vector reduction instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_reduction(DisasContext *s, int vs2)
+{
+    return require_align(vs2, s->lmul);
+}
+
+/*
+ * Check function for vector slide instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   4. The destination vector register group for vslideup, vslide1up,
+ *      vfslide1up, cannot overlap the source vector register (vs2) group.
+ *      (Section 5.2, 16.3.1, 16.3.3)
+ */
+static bool vext_check_slide(DisasContext *s, int vd, int vs2,
+                             int vm, bool is_over)
+{
+    bool ret = require_align(vs2, s->lmul) &&
+               require_align(vd, s->lmul) &&
+               require_vm(vm, vd);
+    if (is_over) {
+        ret &= (vd != vs2);
+    }
+    return ret;
+}
+
 /*
  * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
  * So RVV is also be checked in this function.
@@ -139,6 +471,7 @@ static inline bool vext_check_overlap_group(int rd, int dlen, int rs, int slen)
 {
     return ((rd >= rs + slen) || (rs >= rd + dlen));
 }
+
 /* common translation macro */
 #define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
 static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
@@ -784,11 +1117,9 @@ GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check64)
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
@@ -876,10 +1207,9 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
 
 static bool opivx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t, TCGv_i64,
@@ -1070,16 +1400,9 @@ GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
 /* OPIVV with WIDEN */
 static bool opivv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
@@ -1124,13 +1447,9 @@ GEN_OPIVV_WIDEN_TRANS(vwsub_vv, opivv_widen_check)
 /* OPIVX with WIDEN */
 static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
@@ -1161,14 +1480,9 @@ GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
 /* WIDEN OPIVV with WIDEN */
 static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
@@ -1211,11 +1525,9 @@ GEN_OPIWV_WIDEN_TRANS(vwsub_wv)
 /* WIDEN OPIVX with WIDEN */
 static bool opiwx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
 
 static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
@@ -1277,11 +1589,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((a->rd != 0) || (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd != 0) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vadc_vvm, opivv_vadc_check)
@@ -1293,11 +1604,9 @@ GEN_OPIVV_TRANS(vsbc_vvm, opivv_vadc_check)
  */
 static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
 
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -1305,10 +1614,10 @@ GEN_OPIVV_TRANS(vmsbc_vvm, opivv_vmadc_check)
 
 static bool opivx_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((a->rd != 0) || (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd != 0) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPIVX without GVEC IR */
@@ -1331,9 +1640,9 @@ GEN_OPIVX_TRANS(vsbc_vxm, opivx_vadc_check)
 
 static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
 
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -1421,14 +1730,9 @@ GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPIVV with NARROW */
@@ -1463,13 +1767,9 @@ GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
 
 static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPIVX with NARROW */
@@ -1517,13 +1817,11 @@ GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
  */
 static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
+
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsne_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsltu_vv, opivv_cmp_check)
@@ -1533,10 +1831,9 @@ GEN_OPIVV_TRANS(vmsle_vv, opivv_cmp_check)
 
 static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
 
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -1615,10 +1912,10 @@ GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_reg(s, a->rs1, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.v has rs2 = 0 and vm = 1 */
+        vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
@@ -1645,9 +1942,10 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 typedef void gen_helper_vmv_vx(TCGv_ptr, TCGv_i64, TCGv_env, TCGv_i32);
 static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.x has rs2 = 0 and vm = 1 */
+        vext_check_ss(s, a->rd, 0, 1)) {
         TCGv s1;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -1685,9 +1983,10 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 
 static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.i has rs2 = 0 and vm = 1 */
+        vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm = sextract64(a->rs1, 0, 5);
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
@@ -1787,12 +2086,10 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
  */
 static bool opfvv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV without GVEC IR */
@@ -1857,17 +2154,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     return true;
 }
 
-static bool opfvf_check(DisasContext *s, arg_rmrr *a)
-{
 /*
  * If the current SEW does not correspond to a supported IEEE floating-point
  * type, an illegal instruction exception is raised
  */
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0));
+static bool opfvf_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF without GVEC IR */
@@ -1897,16 +2193,10 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV with WIDEN */
@@ -1941,13 +2231,10 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF with WIDEN */
@@ -1973,14 +2260,10 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2015,11 +2298,10 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2090,11 +2372,11 @@ GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
  */
 static bool opfv_check(DisasContext *s, arg_rmr *a)
 {
-   return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV instructions ignore vs1 check */
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPFV_TRANS(NAME, CHECK)                                \
@@ -2143,13 +2425,10 @@ GEN_OPFVF_TRANS(vfsgnjx_vf, opfvf_check)
 /* Vector Floating-Point Compare Instructions */
 static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew != 0) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2160,11 +2439,10 @@ GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2183,10 +2461,10 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
 
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        (s->sew != 0)) {
-
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, s->lmul)) {
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
@@ -2231,13 +2509,11 @@ GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
  */
 static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
@@ -2280,13 +2556,12 @@ GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
  */
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                                     2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           (s->sew != MO_64) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV narrowing instructions ignore vs1 check */
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME)                                \
@@ -2327,7 +2602,9 @@ GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
 /* Vector Single-Width Integer Reduction Instructions */
 static bool reduction_check(DisasContext *s, arg_rmrr *a)
 {
-    return vext_check_isa_ill(s) && vext_check_reg(s, a->rs2, false);
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_reduction(s, a->rs2);
 }
 
 GEN_OPIVV_TRANS(vredsum_vs, reduction_check)
@@ -2340,8 +2617,13 @@ GEN_OPIVV_TRANS(vredor_vs, reduction_check)
 GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 
 /* Vector Widening Integer Reduction Instructions */
-GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
-GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
+static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) && (s->sew < MO_64);
+}
+
+GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
 GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
@@ -2389,7 +2671,8 @@ GEN_MM_TRANS(vmxnor_mm)
 /* Vector mask population count vmpopc */
 static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2418,7 +2701,8 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 /* vmfirst find-first-set mask bit */
 static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2476,10 +2760,11 @@ GEN_M_TRANS(vmsof_m)
 /* Vector Iota Instruction */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2, 1) &&
-        (a->vm != 0 || a->rd != 0)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        require_vm(a->vm, a->rd) &&
+        require_align(a->rd, s->lmul)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2503,9 +2788,10 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 /* Vector Element Index Instruction */
 static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_mask(s, a->rd, a->vm, false)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, s->lmul) &&
+        require_vm(a->vm, a->rd)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2754,41 +3040,48 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 /* Vector Slide Instructions */
 static bool slideup_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, true);
 }
 
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
 GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
 GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
 
-GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
-GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
-GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
+static bool slidedown_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, false);
+}
+
+GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
+GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
+GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
 
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2) && (a->rd != a->rs1));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs1, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd != a->rs2 && a->rd != a->rs1) &&
+           require_vm(a->vm, a->rd);
 }
 
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
 
 static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd != a->rs2) &&
+           require_vm(a->vm, a->rd);
 }
 
 /* vrgather.vx vd, vs2, rs1, vm # vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
@@ -2849,14 +3142,20 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     return true;
 }
 
-/* Vector Compress Instruction */
+/*
+ * Vector Compress Instruction
+ *
+ * The destination vector register group cannot overlap the
+ * source vector register group or the source mask register.
+ */
 static bool vcompress_vm_check(DisasContext *s, arg_r *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs1, 1) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd != a->rs2) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
-- 
2.25.1


