Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRn-0002e0-EY
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRl-0002YU-9Z
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRj-0007r6-2Q
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:28 -0400
Received: by mail-pf1-x430.google.com with SMTP id y206so14426552pfb.10
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q5i+VEIPqF6ykHifFjiCNIYQ2nw4dzUnCrY9toVvvaQ=;
 b=I/cluE39bJStpWje25EdWlthF+FHRO5hUQwUGbgAPeBVYDgw4KU+l7zG/W4eC9kO8o
 yoLpHP5EUJJU5NOWrqpWF+0hfem4/OueYB1ISkkw+91r7Yr42Hm4thvSLO8m8X2t4f81
 rSFpVJhjOI7V2plKfa4WlWCWjNdSzgbOw37H9bDanbYpZBsN9awOewSwJzjNpye8exZz
 XWEvrzU2B/X+TK9jJo1wSAOx0y16pyz7/CeqtH12RxpFl+dni354+C9M+8wx8ako6ux9
 6Xbiu5rveBaOy2/4+u7QzwNU7TLCHaXlxO+8rQI4tVjBtnbl3n+7V75Ffj7nt9aKX6lw
 OgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q5i+VEIPqF6ykHifFjiCNIYQ2nw4dzUnCrY9toVvvaQ=;
 b=fXO4vtH7/bfogUsWoMD6pH3GXw4aKG4LTLt2IBKFiF4E7TsCgCNR6pDfnmeIwH78eO
 9A9AK0jgLdpxTGX0qCDGUKuIDWAMulhJTg7A1YSjjdE3ZX5csURBBnbI3bcQwcO0aHl9
 EcZK72uX+4vTOmOqnUoZ0WOCu+wOsOZz1GgNOYtsoflRedx9zWrys43QRDkQGLGE37Wy
 exD6i4yYfJWrffgRzV5URy24O1YvTQcQ8hwRiqCXvgbFAOo2mp5Red82lR5+ETB2Yvvb
 fPL1krIYqD7wjroGdVCTyo6fi+ZsqeKbQ8VXCohW4ZRlrD+jQA08EyoXZ2J6Y6L5UwYF
 r1jg==
X-Gm-Message-State: AOAM532E5JZaCGoE9sJhCX3fZ3NFDOFpb7t5Petn9+0NBdbsHFXak7mp
 S/lm1G+3dlK+/brdPOGkCL27Zw==
X-Google-Smtp-Source: ABdhPJyLrMnwImo03nTzPWMG4tAgK6RQnFOiu7SSzRQctPDWboienJpan9LZtEqN5se5BJpT30dxYg==
X-Received: by 2002:a63:201a:: with SMTP id g26mr6780376pgg.93.1596710905743; 
 Thu, 06 Aug 2020 03:48:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
Date: Thu,  6 Aug 2020 18:46:23 +0800
Message-Id: <20200806104709.13235-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Unlike other vector instructions, load/store vector instructions return
the maximum vector size calculated with EMUL.
For other vector instructions, return VLMAX as the maximum vector size.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 10 +++-
 target/riscv/internals.h                |  5 +-
 target/riscv/vector_helper.c            | 61 ++++++++++++++++++-------
 3 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c7e094b6e5b..725f36fcfcc 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -609,7 +609,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     /*
      * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * the max vector group length is 1024 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
@@ -653,6 +653,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
@@ -689,6 +690,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
@@ -763,6 +765,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -791,6 +794,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     fn = fns[seq];
     if (fn == NULL) {
@@ -889,6 +893,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -940,6 +945,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
@@ -1005,6 +1011,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
@@ -1189,6 +1196,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);
     data = FIELD_DP32(data, VDATA, WD, a->wd);
     return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index bca48297dab..4fb683a7399 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -24,8 +24,9 @@
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
-FIELD(VDATA, NF, 4, 4)
-FIELD(VDATA, WD, 4, 1)
+FIELD(VDATA, SEW, 4, 3)
+FIELD(VDATA, NF, 7, 4)
+FIELD(VDATA, WD, 7, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a58051ded93..77f62c86e02 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -98,6 +99,11 @@ static inline uint32_t vext_vm(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VM);
 }
 
+static inline uint32_t vext_sew(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, SEW);
+}
+
 /*
  * Encode LMUL to lmul as following:
  *     LMUL    vlmul    lmul
@@ -122,14 +128,35 @@ static uint32_t vext_wd(uint32_t desc)
 }
 
 /*
- * Get vector group length in bytes. Its range is [64, 2048].
+ * Get the maximum number of elements can be operated.
  *
- * As simd_desc support at most 256, the max vlen is 512 bits.
- * So vlen in bytes is encoded as maxsz.
+ * Use ctzl() to get log2(esz) and log2(vlenb)
+ * so that we can use shifts for all arithmetics.
  */
-static inline uint32_t vext_maxsz(uint32_t desc)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz, bool is_ldst)
 {
-    return simd_maxsz(desc) << vext_lmul(desc);
+    /*
+     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * so vlen in bytes (vlenb) is encoded as maxsz.
+     */
+    uint32_t vlenb = simd_maxsz(desc);
+
+    if (is_ldst) {
+        /*
+         * Vector load/store instructions have the EEW encoded
+         * directly in the instructions. The maximum vector size is
+         * calculated with EMUL rather than LMUL.
+         */
+        uint32_t eew = ctzl(esz);
+        uint32_t sew = vext_sew(desc);
+        uint32_t lmul = vext_lmul(desc);
+        int32_t emul = eew - sew + lmul;
+        uint32_t emul_r = emul < 0 ? 0 : emul;
+        return 1 << (ctzl(vlenb) + emul_r - ctzl(esz));
+    } else {
+        /* Return VLMAX */
+        return 1 << (ctzl(vlenb) + vext_lmul(desc) - ctzl(esz));
+    }
 }
 
 /*
@@ -224,7 +251,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
@@ -241,7 +268,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -289,7 +316,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
 
     /* probe every access */
     probe_pages(env, base, env->vl * nf * esz, ra, access_type);
@@ -298,7 +325,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -379,7 +406,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
@@ -397,7 +424,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -467,7 +494,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t i, k, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     target_ulong addr, offset, remain;
 
     /* probe every access*/
@@ -518,7 +545,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -1226,7 +1253,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);\
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
@@ -3887,7 +3914,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);    \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4692,7 +4719,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t index, i;                                                    \
@@ -4720,7 +4747,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t index = s1, i;                                               \
-- 
2.17.1


