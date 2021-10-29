Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNlK-0005yz-Ey
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNl7-0005vM-JB
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNl4-0005vA-3p
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6957056pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0JGgUAb7j4h6kE3HLQsvgPCky6rdoZ/73JgW4BF4j4=;
 b=SfZ6vVsWxWZ/mIlwsjoKypibGDwj0WsHOsUyE3OkMCngPUlCeyXLOCCNxpzNBcZpqN
 sX9x/ztrO68f+U2NIAn6GG18iXg74a6iG2ajCyxqKxyoHPptnWug1Q1zpxejTrUMwhyT
 ChksU/Xde33eU4r1nHltwvRvie7RP3kJ2LYXI7znIrjpZ7FKvv9D8YRKM+eG9yRbL1rF
 Jzgx0OT0NVuKNHfyKNDbBgAIJM1GqG+6CI4x8bGdTiacCVo/wTyDBuuR6wYWJZzMxUIR
 DOd+YMrywETRBHb/IyxxkoP7JACZIcPmGUmykIjzh1VuNKcmKQdjf/8v8PBDQO0n2uRb
 Fjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W0JGgUAb7j4h6kE3HLQsvgPCky6rdoZ/73JgW4BF4j4=;
 b=kaFGRdyJDqhCcv4lzxC8E195VtbuFZ1S6p/rkWCUiiakW9NkaPuQyYTxXko4mZHXPw
 9peFVO10Np/l7sGrVFbMo72sSh4GkLx1p8lAHoMGoUn0+l6rP97fA2KckidFmMvoSBng
 Mok4oq0InxcLgHoMVT3sDdAtYyYlLYUlvkKyZS+U0/V28YbplhIrnui2ND/u5t9JVBzQ
 LRvVEcEWgSxL1oOnCzpJmxwqq3eeBtJAg6hwaflDCjqY30K+hc1K6eXIywRPJWLrGjC6
 pSu8xcKpNgo+r5Ikc6y7K4jtAGhNCOwjv8vF+m29lvhFcR22Y2qIJSrgXsMNvvbh0b+H
 suxA==
X-Gm-Message-State: AOAM532hv8fjxXpJv03GqoJRATEiGUZGACWG77+O2BckCbTpEAIFKsdw
 wFfp4EBFXNVh8akCus1jvJIQ3g==
X-Google-Smtp-Source: ABdhPJymOe961LF2WiNF7RNa0zjQqkmAic1S8GweHI0zndxjPL1QxHize2Yn4xjKDJ0aNgYzrjUGfQ==
X-Received: by 2002:a17:902:f686:b0:140:3913:8342 with SMTP id
 l6-20020a170902f68600b0014039138342mr8715135plg.43.1635498064730; 
 Fri, 29 Oct 2021 02:01:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 25/76] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
Date: Fri, 29 Oct 2021 16:58:30 +0800
Message-Id: <20211029085922.255197-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++--
 target/riscv/vector_helper.c            | 99 ++++++++++++++-----------
 2 files changed, 80 insertions(+), 51 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5e8e49d43f4..e12db9aae8b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -540,6 +540,12 @@ static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
     return false;                                            \
 }
 
+static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
+{
+    int8_t emul = eew - s->sew + s->lmul;
+    return emul < 0 ? 0 : emul;
+}
+
 /*
  *** unit stride load and store
  */
@@ -604,8 +610,14 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
         return false;
     }
 
+    /*
+     * Vector load/store instructions have the EEW encoded
+     * directly in the instructions. The maximum vector size is
+     * calculated with EMUL rather than LMUL.
+     */
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
@@ -640,8 +652,9 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
         return false;
     }
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
@@ -711,8 +724,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
         return false;
     }
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -739,8 +753,9 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
         gen_helper_vsse32_v,  gen_helper_vsse64_v
     };
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     fn = fns[eew];
     if (fn == NULL) {
@@ -836,8 +851,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 
     fn = fns[eew][s->sew];
 
+    uint8_t emul = vext_get_emul(s, s->sew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -887,8 +903,9 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 
     fn = fns[eew][s->sew];
 
+    uint8_t emul = vext_get_emul(s, s->sew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
@@ -949,8 +966,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
         return false;
     }
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9a39a0e2d26..f9919273dca 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -116,14 +117,21 @@ static inline int32_t vext_lmul(uint32_t desc)
 }
 
 /*
- * Get vector group length in bytes. Its range is [64, 2048].
+ * Get the maximum number of elements can be operated.
  *
- * As simd_desc support at most 256, the max vlen is 512 bits.
- * So vlen in bytes is encoded as maxsz.
+ * esz: log2 of element size in bytes.
  */
-static inline uint32_t vext_maxsz(uint32_t desc)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
-    return simd_maxsz(desc) << vext_lmul(desc);
+    /*
+     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * so vlen in bytes (vlenb) is encoded as maxsz.
+     */
+    uint32_t vlenb = simd_maxsz(desc);
+
+    /* Return VLMAX */
+    int scale = vext_lmul(desc) - esz;
+    return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
 
 /*
@@ -216,14 +224,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
+        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
     }
     /* do real access */
     for (i = 0; i < env->vl; i++) {
@@ -232,8 +240,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + stride * i + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr = base + stride * i + (k << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -246,7 +254,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
 }
 
 GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
@@ -261,7 +269,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
 }
 
 GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
@@ -281,16 +289,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* probe every access */
-    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
+    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
         k = 0;
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr = base + ((i * nf + k) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -305,16 +313,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
 }                                                                       \
                                                                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                \
+                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -326,16 +334,16 @@ GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
 }                                                                       \
                                                                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
-                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               \
+                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
 }
 
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
@@ -371,14 +379,14 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
+        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
                     access_type);
     }
     /* load bytes from guest memory */
@@ -388,8 +396,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            abi_ptr addr = get_index_addr(base, i, vs2) + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -400,7 +408,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
                   void *vs2, CPURISCVState *env, uint32_t desc)            \
 {                                                                          \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
-                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
@@ -425,7 +433,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
                   void *vs2, CPURISCVState *env, uint32_t desc)  \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, sizeof(ETYPE),                     \
+                    STORE_FN, ctzl(sizeof(ETYPE)),               \
                     GETPC(), MMU_DATA_STORE);                    \
 }
 
@@ -459,7 +467,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t i, k, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz);
     target_ulong addr, offset, remain;
 
     /* probe every access*/
@@ -467,24 +475,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr = base + nf * i * esz;
+        addr = base + i * (nf << esz);
         if (i == 0) {
-            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint */
-            remain = nf * esz;
+            remain = nf << esz;
             while (remain > 0) {
                 offset = -(addr | TARGET_PAGE_MASK);
                 host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0) {
+                    if (page_check_range(addr, nf << esz, PAGE_READ) < 0) {
                         vl = i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
 #endif
                 } else {
                     vl = i;
@@ -509,8 +517,8 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr = base + ((i * nf + k) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -521,7 +529,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
                   CPURISCVState *env, uint32_t desc)      \
 {                                                         \
     vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
-              sizeof(ETYPE), GETPC());                    \
+              ctzl(sizeof(ETYPE)), GETPC());              \
 }
 
 GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
@@ -986,7 +994,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax = vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1016,7 +1025,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
@@ -1190,7 +1199,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax = vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1242,7 +1252,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3644,7 +3654,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax = vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3671,7 +3682,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4457,7 +4468,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint64_t index;                                                       \
@@ -4486,7 +4497,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint64_t index = s1;                                                  \
-- 
2.25.1


