Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqq1-0000C7-9L
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqpx-00008h-IJ; Tue, 14 Feb 2023 03:38:53 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqps-0001s1-JZ; Tue, 14 Feb 2023 03:38:53 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADHz5uOSOtjHFQsBQ--.41555S12;
 Tue, 14 Feb 2023 16:38:45 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [Patch 10/14] target/riscv: Remove rebundunt check for zve32f and
 zve64f
Date: Tue, 14 Feb 2023 16:38:29 +0800
Message-Id: <20230214083833.44205-11-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHz5uOSOtjHFQsBQ--.41555S12
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4UAr18Gr1kXryDJFyUGFg_yoWfJFWfpw
 1xGr93Zr1UKFW8uw4Fkr4jk3s0kr15WryrKa4rG3Z5Ja4rWr4DGa45Aw43Kr10vas3Wr1f
 Z3s8JrWrAFW2ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 08:38:53 -0000

Require_zve32/64f have been overlapped by require_rvf/require_scale_rvf

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 128 ++++--------------------
 1 file changed, 21 insertions(+), 107 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9b2711b94b..9053759546 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,50 +66,6 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
-static bool require_zve32f(DisasContext *s)
-{
-    /* RVV + Zve32f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
-}
-
-static bool require_scale_zve32f(DisasContext *s)
-{
-    /* RVV + Zve32f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
-}
-
-static bool require_zve64f(DisasContext *s)
-{
-    /* RVV + Zve64f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
-}
-
-static bool require_scale_zve64f(DisasContext *s)
-{
-    /* RVV + Zve64f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
-}
-
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2331,9 +2287,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV without GVEC IR */
@@ -2421,9 +2375,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF without GVEC IR */
@@ -2461,9 +2413,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV with WIDEN */
@@ -2506,9 +2456,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF with WIDEN */
@@ -2540,9 +2488,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2585,9 +2531,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2664,9 +2608,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
-           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 static bool do_opfv(DisasContext *s, arg_rmr *a,
@@ -2731,9 +2673,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2746,9 +2686,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ms(s, a->rd, a->rs2);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2769,9 +2707,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
-        require_align(a->rd, s->lmul) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        require_align(a->rd, s->lmul)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         TCGv_i64 t1;
@@ -2856,18 +2792,14 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           (s->sew != MO_8);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2918,9 +2850,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
@@ -2975,18 +2905,14 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew != MO_64) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           (s->sew != MO_64);
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           (s->sew != MO_8);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -3035,9 +2961,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
@@ -3111,9 +3035,7 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
@@ -3540,9 +3462,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        vext_check_isa_ill(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         unsigned int ofs = (8 << s->sew);
@@ -3568,9 +3488,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        vext_check_isa_ill(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         /* The instructions ignore LMUL and vector register group. */
@@ -3621,17 +3539,13 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
-- 
2.25.1


