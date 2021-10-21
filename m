Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZnE-00013f-ST
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZnB-00011O-TV; Thu, 21 Oct 2021 11:15:42 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:29479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZn7-0000Xu-PM; Thu, 21 Oct 2021 11:15:41 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFFJHm089296;
 Thu, 21 Oct 2021 23:15:19 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:15:20 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v1 1/2] riscv: Add preliminary infra for custom
 instrcution handling
Date: Thu, 21 Oct 2021 23:11:35 +0800
Message-ID: <20211021151136.721746-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFFJHm089296
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 15:15:43 -0000

This is inspired by Antmicro's work on their fork of TCG.
We try to decode custom instrucions first - - if the decoders reject
what they encounter, invoke the decoders for standard instructions.

Caveats: the pc_succ_next shall be corrected if custom decoder rejcets
the incoming opcode.

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c       | 25 ++++++++++---
 target/riscv/translate.c | 78 ++++++++++++++++++++++++++++++++--------
 2 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fe63e68b8e..e8ab5734c2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -36,6 +36,14 @@ static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 GHashTable *custom_csr_map = NULL;
 #include "custom_csr_defs.h"
+#include "custom_insn_defs.h"
+
+/* Custom instruction related prototypes/variables */
+bool (*custom_c_insn_handler) (DisasContext *, uint16_t);
+bool (*custom_insn_handler) (DisasContext *, uint32_t);
+__thread bool cpu_has_custom_insns = false;
+/* Custom instruction handlers sometimes needs hart state */
+__thread CPURISCVState *HartState = NULL;
 
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
@@ -151,12 +159,20 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
     env->resetvec = resetvec;
 #endif
 }
+void setup_custom_csr(CPURISCVState *env,
+                             riscv_custom_csr_operations csr_map_struct[]
+                             );
+
+void setup_custom_csr(CPURISCVState *env,
+                             riscv_custom_csr_operations csr_map_struct[]
+                             ) {
+
+    env->custom_csr_map = g_hash_table_new_full(g_direct_hash, \
+                                                g_direct_equal, \
+                                                NULL, NULL);
+
 
-static void setup_custom_csr(CPURISCVState *env,
-                             riscv_custom_csr_operations csr_map_struct[])
-{
     int i;
-    env->custom_csr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
     for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
         if (csr_map_struct[i].csrno != 0) {
             g_hash_table_insert(env->custom_csr_map,
@@ -187,6 +203,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, RV64);
 }
 
+
 static void ax25_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c9..f755749380 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -485,27 +485,77 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
 
-static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
+/* Custom insn related definitions/prototypes */
+extern __thread bool cpu_has_custom_insns;
+/*
+ * These 2 are for indication if decode fails.
+ * We don't want to interfere the following regular extension decoding
+ * We assume MTTCG is 1-1 mapping for now.
+ */
+__thread bool custom_c_insn_decoded;
+__thread bool custom_insn_decoded;
+
+extern bool (*custom_c_insn_handler)(DisasContext *, uint16_t);
+extern bool (*custom_insn_handler)(DisasContext *, uint32_t);
+
+static void try_decode_custom_insn(CPURISCVState *env, DisasContext *ctx,
+                                   uint16_t opcode)
 {
-    /* check for compressed insn */
-    if (extract16(opcode, 0, 2) != 3) {
+    bool is_compressed_custom = false;
+    is_compressed_custom = extract16(opcode, 0, 2) != 3 ? true : false;
+    if (is_compressed_custom) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
+        }
+        ctx->pc_succ_insn = ctx->base.pc_next + 2;
+        custom_c_insn_decoded = custom_c_insn_handler(ctx, opcode);
+        if(custom_c_insn_decoded) {custom_insn_decoded = true;}
+    } else {
+    uint32_t opcode32 = opcode;
+    opcode32 = deposit32(opcode32, 16, 16, translator_lduw(env, &ctx->base,
+                         ctx->base.pc_next + 2));
+    ctx->opcode = opcode32;
+    ctx->pc_succ_insn = ctx->base.pc_next + 4;
+    custom_insn_decoded = custom_insn_handler(ctx, opcode32);
+    }
+}
+
+static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
+{
+    /*
+     * Try to deocde and trans the custom instruction before any others
+     * This is a bad idea which introduces great performance penalties,
+     * but we don't have other choices here ...
+     */
+    custom_insn_decoded = false;
+    custom_c_insn_decoded = false;
+    if (unlikely(cpu_has_custom_insns)) {
+        try_decode_custom_insn(env, ctx, opcode);
+    }
+
+    if (likely(!custom_insn_decoded)) {
+        if(unlikely(cpu_has_custom_insns))
+            ctx->pc_succ_insn = ctx->base.pc_next - !custom_c_insn_decoded ? 4 : 2;
+        /* check for compressed insn */
+        if (extract16(opcode, 0, 2) != 3) {
+            if (!has_ext(ctx, RVC)) {
+                gen_exception_illegal(ctx);
+            } else {
+                ctx->pc_succ_insn = ctx->base.pc_next + 2;
+                if (!decode_insn16(ctx, opcode)) {
+                    gen_exception_illegal(ctx);
+                }
+            }
         } else {
-            ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
+            uint32_t opcode32 = opcode;
+            opcode32 = deposit32(opcode32, 16, 16,
+                                 translator_lduw(env, &ctx->base,
+                                                 ctx->base.pc_next + 2));
+            ctx->pc_succ_insn = ctx->base.pc_next + 4;
+            if (!decode_insn32(ctx, opcode32)) {
                 gen_exception_illegal(ctx);
             }
         }
-    } else {
-        uint32_t opcode32 = opcode;
-        opcode32 = deposit32(opcode32, 16, 16,
-                             translator_lduw(env, &ctx->base,
-                                             ctx->base.pc_next + 2));
-        ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, opcode32)) {
-            gen_exception_illegal(ctx);
-        }
     }
 }
 
-- 
2.25.1


