Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPNY-0001o2-Ab
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 09:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1poPNX-0001mw-7M; Mon, 17 Apr 2023 09:58:47 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1poPNT-0002gK-QT; Mon, 17 Apr 2023 09:58:46 -0400
Received: from [167.98.27.226] (helo=lawrence-thinkpad.guest.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1poPNO-0034ER-95; Mon, 17 Apr 2023 14:58:38 +0100
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 06/17] target/riscv: Refactor some of the generic vector
 functionality
Date: Mon, 17 Apr 2023 14:58:10 +0100
Message-Id: <20230417135821.609964-7-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 13:58:47 -0000

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

Move some macros out of `vector_helper` and into `vector_internals`.
This ensures they can be used by both vector and vector-crypto helpers
(latter implemented in proceeding commits).

Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
---
 target/riscv/vector_helper.c    | 42 ------------------------------
 target/riscv/vector_internals.h | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 27fefef10ec..a438f5d95e1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -646,9 +646,6 @@ GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
 #define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
 #define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
 #define OP_SUS_D int64_t, uint64_t, int64_t, uint64_t, int64_t
-#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
-#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
-#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
 #define WOP_SSS_B int16_t, int8_t, int8_t, int16_t, int16_t
 #define WOP_SSS_H int32_t, int16_t, int16_t, int32_t, int32_t
 #define WOP_SSS_W int64_t, int32_t, int32_t, int64_t, int64_t
@@ -3412,11 +3409,6 @@ GEN_VEXT_VF(vfwnmsac_vf_h, 4)
 GEN_VEXT_VF(vfwnmsac_vf_w, 8)
 
 /* Vector Floating-Point Square-Root Instruction */
-/* (TD, T2, TX2) */
-#define OP_UU_H uint16_t, uint16_t, uint16_t
-#define OP_UU_W uint32_t, uint32_t, uint32_t
-#define OP_UU_D uint64_t, uint64_t, uint64_t
-
 #define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)        \
 static void do_##NAME(void *vd, void *vs2, int i,      \
         CPURISCVState *env)                            \
@@ -4109,40 +4101,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
 /* Vector Floating-Point Classify Instruction */
-#define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
-static void do_##NAME(void *vd, void *vs2, int i)      \
-{                                                      \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
-    *((TD *)vd + HD(i)) = OP(s2);                      \
-}
-
-#define GEN_VEXT_V(NAME, ESZ)                          \
-void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
-                  CPURISCVState *env, uint32_t desc)   \
-{                                                      \
-    uint32_t vm = vext_vm(desc);                       \
-    uint32_t vl = env->vl;                             \
-    uint32_t total_elems =                             \
-        vext_get_total_elems(env, desc, ESZ);          \
-    uint32_t vta = vext_vta(desc);                     \
-    uint32_t vma = vext_vma(desc);                     \
-    uint32_t i;                                        \
-                                                       \
-    for (i = env->vstart; i < vl; i++) {               \
-        if (!vm && !vext_elem_mask(v0, i)) {           \
-            /* set masked-off elements to 1s */        \
-            vext_set_elems_1s(vd, vma, i * ESZ,        \
-                              (i + 1) * ESZ);          \
-            continue;                                  \
-        }                                              \
-        do_##NAME(vd, vs2, i);                         \
-    }                                                  \
-    env->vstart = 0;                                   \
-    /* set tail elements to 1s */                      \
-    vext_set_elems_1s(vd, vta, vl * ESZ,               \
-                      total_elems * ESZ);              \
-}
-
 target_ulong fclass_h(uint64_t frs1)
 {
     float16 f = frs1;
diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
index 749d138bebe..8133111e5f6 100644
--- a/target/riscv/vector_internals.h
+++ b/target/riscv/vector_internals.h
@@ -121,12 +121,52 @@ void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
 /* expand macro args before macro */
 #define RVVCALL(macro, ...)  macro(__VA_ARGS__)
 
+/* (TD, T2, TX2) */
+#define OP_UU_B uint8_t, uint8_t, uint8_t
+#define OP_UU_H uint16_t, uint16_t, uint16_t
+#define OP_UU_W uint32_t, uint32_t, uint32_t
+#define OP_UU_D uint64_t, uint64_t, uint64_t
+
 /* (TD, T1, T2, TX1, TX2) */
 #define OP_UUU_B uint8_t, uint8_t, uint8_t, uint8_t, uint8_t
 #define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
 #define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
 #define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
 
+#define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
+static void do_##NAME(void *vd, void *vs2, int i)      \
+{                                                      \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
+    *((TD *)vd + HD(i)) = OP(s2);                      \
+}
+
+#define GEN_VEXT_V(NAME, ESZ)                          \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
+                  CPURISCVState *env, uint32_t desc)   \
+{                                                      \
+    uint32_t vm = vext_vm(desc);                       \
+    uint32_t vl = env->vl;                             \
+    uint32_t total_elems =                             \
+        vext_get_total_elems(env, desc, ESZ);          \
+    uint32_t vta = vext_vta(desc);                     \
+    uint32_t vma = vext_vma(desc);                     \
+    uint32_t i;                                        \
+                                                       \
+    for (i = env->vstart; i < vl; i++) {               \
+        if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
+            continue;                                  \
+        }                                              \
+        do_##NAME(vd, vs2, i);                         \
+    }                                                  \
+    env->vstart = 0;                                   \
+    /* set tail elements to 1s */                      \
+    vext_set_elems_1s(vd, vta, vl * ESZ,               \
+                      total_elems * ESZ);              \
+}
+
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
 
@@ -179,4 +219,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                do_##NAME, ESZ);                           \
 }
 
+/* Three of the widening shortening macros: */
+/* (TD, T1, T2, TX1, TX2) */
+#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
+#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
+#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
+
 #endif /* TARGET_RISCV_VECTOR_INTERNALS_H */
-- 
2.40.0


