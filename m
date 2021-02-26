Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThE-0008K6-AF
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTh9-0008D6-1V
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTh4-0001Ou-Ii
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:34 -0500
Received: by mail-pl1-x634.google.com with SMTP id 17so4542092pli.10
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JlrhWrG4RQC6qMFa4BdjWTNiT2kadiLDsfxCK8EQ+Ks=;
 b=m2sNIcbRk0ewIj+i6W40pfxnVXbvio0FQxwgBKDTKFh9p+vIjcqB4mQ8dBbrolTfKY
 7jQuEpXCP/CzME4z9jCCSGjKLtpJhjNJLQlTaZLLUJ7XdMRKPiuhhqvAyFZwMGP06loF
 B7vOe4a4CQTmSAF66qG1teGDl6/hkBZEHxIEgDQEUJcfgx/KxV5M1qqhKk4lyAx3YYGD
 u+w0cWlamP6wnw2kFVGwSdrE1WhD0VNwm3NtjIBH/inKuvu1MOQXqwU9T6yBPZVLrsN4
 aVG/RyHYxp7yu/5D680wQEklGscxOAq9KN9BUBCasl9AofKePWTmbvNb0OimxLggIEGR
 raDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JlrhWrG4RQC6qMFa4BdjWTNiT2kadiLDsfxCK8EQ+Ks=;
 b=FaAkID24Qt65kJwGajc/7Ev+VjkAu577yBA9rWYaoO4jdNjRHd0secwWZnZHuK8IpR
 OJ/POU3ODBQ2UfOrVN7yUV5Xru6dbf5bQRCLn7ffEekoeLP6ZjNJl0HaPjX1QL1lfuGO
 0s0uWtidDxTGVjn3JnCs2cjBFoyE/w1R9CaflGUaAizaYV6L6TXkInTEX1uiuqjer9y7
 ZnfsQeZ6vc93/YWqUe5uTb3RY6YvQz4SOdqpwyUcbLdDfqWYNcOZKgWH5kvKowJUd6Xj
 vXz2Y3fXlwOkQ78OoRieluDRW6pYIF/6POmaqarRcYjYrsobo/SWXybLwSvjIfxzMgXd
 Ua8g==
X-Gm-Message-State: AOAM531xHEnE6+dAiyV0KFyuM8cb+6ZTR7xQCyw1tHrV0Gqh/Q+cUuoS
 +iCdIQkJhFyBxxtsCI9cnT0n/w==
X-Google-Smtp-Source: ABdhPJz2VwvNxxbXcnolfVMIVVblShJp7GNkr1oZ9fhwpL0mtwzDF+TABmR/iJYZs5ywYE0Ftxi7AQ==
X-Received: by 2002:a17:902:8697:b029:e3:9724:e260 with SMTP id
 g23-20020a1709028697b02900e39724e260mr1214580plo.31.1614309687667; 
 Thu, 25 Feb 2021 19:21:27 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 24/75] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
Date: Fri, 26 Feb 2021 11:18:08 +0800
Message-Id: <20210226031902.23656-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:21:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++--
 target/riscv/vector_helper.c            | 90 ++++++++++++++-----------
 2 files changed, 74 insertions(+), 48 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2b0e0590efc..367fb28186f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -586,6 +586,12 @@ static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
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
@@ -651,8 +657,14 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
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
@@ -687,8 +699,9 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
         return false;
     }
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
@@ -761,8 +774,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
         return false;
     }
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -789,8 +803,9 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
         gen_helper_vsse32_v,  gen_helper_vsse64_v
     };
 
+    uint8_t emul = vext_get_emul(s, eew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     fn = fns[eew];
     if (fn == NULL) {
@@ -887,8 +902,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 
     fn = fns[eew][s->sew];
 
+    uint8_t emul = vext_get_emul(s, s->sew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -938,8 +954,9 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 
     fn = fns[eew][s->sew];
 
+    uint8_t emul = vext_get_emul(s, s->sew);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
@@ -1003,8 +1020,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
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
index 57564c5c0c9..8556ab3b0df 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -121,14 +122,21 @@ static uint32_t vext_wd(uint32_t desc)
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
@@ -221,14 +229,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
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
@@ -237,8 +245,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
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
@@ -251,7 +259,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
 }
 
 GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
@@ -266,7 +274,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
-                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
 }
 
 GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
@@ -286,16 +294,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
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
@@ -310,16 +318,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
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
@@ -331,16 +339,16 @@ GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
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
@@ -376,14 +384,14 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
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
@@ -393,8 +401,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
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
@@ -405,7 +413,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
                   void *vs2, CPURISCVState *env, uint32_t desc)            \
 {                                                                          \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
-                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
@@ -430,7 +438,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
                   void *vs2, CPURISCVState *env, uint32_t desc)  \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, sizeof(ETYPE),                     \
+                    STORE_FN, ctzl(sizeof(ETYPE)),               \
                     GETPC(), MMU_DATA_STORE);                    \
 }
 
@@ -464,7 +472,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t i, k, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz);
     target_ulong addr, offset, remain;
 
     /* probe every access*/
@@ -472,24 +480,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
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
@@ -514,8 +522,8 @@ ProbeSuccess:
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
@@ -526,7 +534,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
                   CPURISCVState *env, uint32_t desc)      \
 {                                                         \
     vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
-              sizeof(ETYPE), GETPC());                    \
+              ctzl(sizeof(ETYPE)), GETPC());              \
 }
 
 GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
@@ -739,7 +747,7 @@ void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
 {                                                               \
     vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
                       INDEX_FN, vext_##NAME##_noatomic_op,      \
-                      sizeof(ETYPE), GETPC());                  \
+                      ctzl(sizeof(ETYPE)), GETPC());            \
 }
 
 GEN_VEXT_AMO(vamoswapei8_32_v,  int32_t, idx_b)
@@ -1225,7 +1233,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
@@ -3880,7 +3888,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4666,7 +4674,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t index, i;                                                    \
@@ -4694,7 +4702,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t index = s1, i;                                               \
-- 
2.17.1


