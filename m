Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAuf-0001nw-Ky
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAue-0001kd-GT
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:44 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAua-0005bi-1p
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:43 -0400
Received: by mail-pf1-x444.google.com with SMTP id j20so867275pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5Wcnm8IqhkmajVRLy3EPsUykg3HluDMA8Ajti6zvwSg=;
 b=RSLfqkWMuS0H0eLGdhX+zJ5A/B5kzIXun1zQejjwJJJ1LidffekShJlYcwEJSD6gCa
 diYBjvEY4NX+HiD92KOyslUqzbNZf5dnuDK/BSuyI6ubyRUlgAl5A64LHKYvBiCEEFeB
 vEOJ8sHidI1q39mLlwjuNtJQkR7V2cqg0diRhFoKXbuBgUbDXmbJIjz7jagzx4PO9vMS
 ZGiu1Gl/xtAvkE2BybJ6sX3n4LUkzuS47msswcm2gPWUmx4yiDJsD5kj66evwp701e16
 rEEBTD3TPYBZlb4yKdD87g54L0z9A6VEgrJVsdghDsmxv9dMrFLDZvUg7tuhH70J71sd
 voQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5Wcnm8IqhkmajVRLy3EPsUykg3HluDMA8Ajti6zvwSg=;
 b=AaCdiyNV9PBJlHNDqXBgfi0+ZK8x8Gp0Q9YDOOAmSny/+Ut4kv4ocNhJlEhR9bFn1h
 MAkgKgacxh1njfbyanaIWPMdVheUopHXbc6mgGjaz6QZ5JmbHhI6dj5QmPJCXm/kEIQ0
 SGdBxn8r3lbiiALmiFSQmwp1sbPvSiDRc/NS4l/7vupXH8vf0ZaRXG+AO5QnQIOPCDUk
 gjBbOXgpH318+DQ+ytbC1grufsdqzMMRdwBVn3iWcBTgvIn42U+iTqkqGjDhxMYmevJ2
 Ati0bzmChlTpy3jijd8Bqm3iSd8vU81EHksWndfMOuXggsJASJ4QamZGy+PYrQ6SpaYK
 HHIg==
X-Gm-Message-State: AOAM533HVUvUSL3j1q0DtC9H0+/myShhPmnAz4XdL2OzsG3pNIgW1RiI
 EqKpSXaD6qsunL5Zec6xPnp0nySBgZI=
X-Google-Smtp-Source: ABdhPJxxDeAmdZc1+eOf9eo+RPH+qR1EnhQEhFETFGpRRSpyOw+lsbxmLIiGy1vBHrvnbnGMdpAYTQ==
X-Received: by 2002:aa7:955a:: with SMTP id w26mr28585277pfq.137.1595409575329; 
 Wed, 22 Jul 2020 02:19:35 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 28/76] target/riscv: rvv-0.9: update vext_max_elems() for
 load/store insns
Date: Wed, 22 Jul 2020 17:15:51 +0800
Message-Id: <20200722091641.8834-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Unlike other vector instructions, load/store vector instructions return
the maximum vector size calculated with EMUL.
For other vector instructions, return VLMAX as the maximum vector size.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 118 ++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 50 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 995e873549..53867a6a2d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -121,14 +121,32 @@ static inline uint32_t vext_vma(uint32_t desc)
 }
 
 /*
- * Get vector group length in bytes. Its range is [64, 2048].
- *
- * As simd_desc support at most 256, the max vlen is 512 bits.
- * So vlen in bytes is encoded as maxsz.
+ * Get the maximum number of elements can be operated.
  */
-static inline uint32_t vext_maxsz(uint32_t desc)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz, bool is_ldst)
 {
-    return simd_maxsz(desc) << vext_lmul(desc);
+    /*
+     * As simd_desc support at most 256, the max vlen is 512 bits,
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
+        uint32_t eew = esz << 3;
+        uint32_t sew = vext_sew(desc);
+        float flmul = vext_vflmul(desc);
+        float emul = (float)eew / sew * flmul;
+        uint32_t emul_r = emul < 1 ? 1 : emul;
+        return vlenb * emul_r / esz;
+    } else {
+        /* Return VLMAX */
+        return vlenb * vext_vflmul(desc) / esz;
+    }
 }
 
 /*
@@ -289,7 +307,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     uint32_t vta = vext_vta(desc);
 
     /* probe every access*/
@@ -307,15 +325,15 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
     /* clear tail elements */
     if (clear_elem) {
         for (k = 0; k < nf; k++) {
-            clear_elem(vd, vta, env->vl + k * vlmax,
-                       env->vl * esz, vlmax * esz);
+            clear_elem(vd, vta, env->vl + k * max_elems,
+                       env->vl * esz, max_elems * esz);
         }
     }
 }
@@ -364,7 +382,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     uint32_t vta = vext_vta(desc);
 
     /* probe every access */
@@ -374,15 +392,15 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
     /* clear tail elements */
     if (clear_elem) {
         for (k = 0; k < nf; k++) {
-            clear_elem(vd, vta, env->vl + k * vlmax,
-                       env->vl * esz, vlmax * esz);
+            clear_elem(vd, vta, env->vl + k * max_elems,
+                       env->vl * esz, max_elems * esz);
         }
     }
 }
@@ -465,7 +483,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     uint32_t vta = vext_vta(desc);
 
     /* probe every access*/
@@ -484,15 +502,15 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
     /* clear tail elements */
     if (clear_elem) {
         for (k = 0; k < nf; k++) {
-            clear_elem(vd, vta, env->vl + k * vlmax,
-                       env->vl * esz, vlmax * esz);
+            clear_elem(vd, vta, env->vl + k * max_elems,
+                       env->vl * esz, max_elems * esz);
         }
     }
 }
@@ -563,7 +581,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t i, k, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     uint32_t vta = vext_vta(desc);
     target_ulong addr, offset, remain;
 
@@ -615,7 +633,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -624,8 +642,8 @@ ProbeSuccess:
         return;
     }
     for (k = 0; k < nf; k++) {
-        clear_elem(vd, vta, env->vl + k * vlmax,
-                   env->vl * esz, vlmax * esz);
+        clear_elem(vd, vta, env->vl + k * max_elems,
+                   env->vl * esz, max_elems * esz);
     }
 }
 
@@ -652,7 +670,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t max_elems = vext_max_elems(desc, esz, true);
     uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
 
     /* probe every access */
@@ -663,7 +681,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -806,7 +824,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
     target_long addr;
     uint32_t wd = vext_wd(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlmax = vext_max_elems(desc, esz, false);
     uint32_t vta = vext_vta(desc);
 
     for (i = 0; i < env->vl; i++) {
@@ -977,7 +995,7 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        uint32_t esz, uint32_t dsz,
                        opivv2_fn *fn, clear_fn *clearfn)
 {
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlmax = vext_max_elems(desc, esz, false);
     uint32_t vm = vext_vm(desc);
     uint32_t vta = vext_vta(desc);
     uint32_t vl = env->vl;
@@ -989,7 +1007,7 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
         }
         fn(vd, vs1, vs2, i);
     }
-    clearfn(vd, vta, vl, vl * dsz,  vlmax * dsz);
+    clearfn(vd, vta, vl, vl * dsz, vlmax * dsz);
 }
 
 /* generate the helpers for OPIVV */
@@ -1042,7 +1060,7 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        uint32_t esz, uint32_t dsz,
                        opivx2_fn fn, clear_fn *clearfn)
 {
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlmax = vext_max_elems(desc, esz, false);
     uint32_t vm = vext_vm(desc);
     uint32_t vta = vext_vta(desc);
     uint32_t vl = env->vl;
@@ -1054,7 +1072,7 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
         }
         fn(vd, s1, vs2, i);
     }
-    clearfn(vd, vta, vl, vl * dsz,  vlmax * dsz);
+    clearfn(vd, vta, vl, vl * dsz, vlmax * dsz);
 }
 
 /* generate the helpers for OPIVX */
@@ -1241,7 +1259,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vl = env->vl;                                    \
     uint32_t esz = sizeof(ETYPE);                             \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                  \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);        \
     uint32_t vta = vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
@@ -1271,7 +1289,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
 {                                                                        \
     uint32_t vl = env->vl;                                               \
     uint32_t esz = sizeof(ETYPE);                                        \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                             \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);                   \
     uint32_t vta = vext_vta(desc);                                       \
     uint32_t i;                                                          \
                                                                          \
@@ -1333,7 +1351,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);\
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
@@ -1421,7 +1439,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t esz = sizeof(TS1);                                           \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                              \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);                    \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
@@ -1459,7 +1477,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
     uint32_t vm = vext_vm(desc);                                      \
     uint32_t vl = env->vl;                                            \
     uint32_t esz = sizeof(TD);                                        \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                          \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);                \
     uint32_t vta = vext_vta(desc);                                    \
     uint32_t i;                                                       \
                                                                       \
@@ -2102,7 +2120,7 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
 {                                                                    \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);               \
     uint32_t vta = vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
@@ -2124,7 +2142,7 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
 {                                                                    \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);               \
     uint32_t vta = vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
@@ -2145,7 +2163,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
 {                                                                    \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);               \
     uint32_t vta = vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
@@ -2167,7 +2185,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
 {                                                                    \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);               \
     uint32_t vta = vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
@@ -2228,7 +2246,7 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              uint32_t desc, uint32_t esz, uint32_t dsz,
              opivv2_rm_fn *fn, clear_fn *clearfn)
 {
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlmax = vext_max_elems(desc, esz, false);
     uint32_t vm = vext_vm(desc);
     uint32_t vta = vext_vta(desc);
     uint32_t vl = env->vl;
@@ -2348,7 +2366,7 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              uint32_t desc, uint32_t esz, uint32_t dsz,
              opivx2_rm_fn *fn, clear_fn *clearfn)
 {
-    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlmax = vext_max_elems(desc, esz, false);
     uint32_t vm = vext_vm(desc);
     uint32_t vta = vext_vta(desc);
     uint32_t vl = env->vl;
@@ -3284,7 +3302,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t vlmax = vext_max_elems(desc, ESZ, false);    \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vta = vext_vta(desc);                        \
     uint32_t vl = env->vl;                                \
@@ -3319,7 +3337,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t vlmax = vext_max_elems(desc, ESZ, false);    \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vta = vext_vta(desc);                        \
     uint32_t vl = env->vl;                                \
@@ -3890,7 +3908,7 @@ static void do_##NAME(void *vd, void *vs2, int i,      \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
-    uint32_t vlmax = vext_maxsz(desc) / ESZ;           \
+    uint32_t vlmax = vext_max_elems(desc, ESZ, false); \
     uint32_t vm = vext_vm(desc);                       \
     uint32_t vta = vext_vta(desc);                     \
     uint32_t vl = env->vl;                             \
@@ -4067,7 +4085,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);    \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4211,7 +4229,7 @@ static void do_##NAME(void *vd, void *vs2, int i)      \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
-    uint32_t vlmax = vext_maxsz(desc) / ESZ;           \
+    uint32_t vlmax = vext_max_elems(desc, ESZ, false); \
     uint32_t vm = vext_vm(desc);                       \
     uint32_t vta = vext_vta(desc);                     \
     uint32_t vl = env->vl;                             \
@@ -4298,7 +4316,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
     uint32_t esz = sizeof(ETYPE);                             \
-    uint32_t vlmax = vext_maxsz(desc) / esz;                  \
+    uint32_t vlmax = vext_max_elems(desc, esz, false);        \
     uint32_t vta = vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
@@ -4798,7 +4816,7 @@ GEN_VEXT_VID_V(vid_v_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t vl = env->vl;                                                \
@@ -4908,7 +4926,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t vl = env->vl;                                                \
@@ -4938,7 +4956,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t vl = env->vl;                                                \
@@ -4968,7 +4986,7 @@ GEN_VEXT_VRGATHER_VX(vrgather_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);          \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t vl = env->vl;                                                \
     uint32_t num = 0, i;                                                  \
-- 
2.17.1


