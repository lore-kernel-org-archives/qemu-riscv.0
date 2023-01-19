Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2y-0000Bm-5o
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1j-0007En-5u
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:28 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1e-00072o-0y
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:23 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1P-007gSL-7l; Thu, 19 Jan 2023 14:36:08 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [RFC PATCH 29/39]  target/riscv: Add vsm3me.vv decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:35:18 +0000
Message-Id: <20230119143528.1290950-30-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:29 -0000

Co-authored-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
---
 target/riscv/helper.h                       |  2 +
 target/riscv/insn32.decode                  |  3 ++
 target/riscv/insn_trans/trans_rvzvksh.c.inc | 12 ++++++
 target/riscv/translate.c                    |  1 +
 target/riscv/vcrypto_helper.c               | 43 +++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 911270c387..36e0d8eff3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1196,3 +1196,5 @@ DEF_HELPER_5(vaeskf2_vi, void, ptr, ptr, i32, env, i32)
 DEF_HELPER_5(vsha2ms_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsha2ch_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsha2cl_vv, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2387bc179c..671614e354 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -926,3 +926,6 @@ vaeskf2_vi      101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2ms_vv      101101 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2ch_vv      101110 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsha2cl_vv      101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** RV64 Zvksh vector crypto extensions ***
+vsm3me_vv       100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvksh.c.inc b/target/riscv/insn_trans/trans_rvzvksh.c.inc
new file mode 100644
index 0000000000..2956618d7e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzvksh.c.inc
@@ -0,0 +1,12 @@
+static inline bool vsm3_check(DisasContext *s)
+{
+    return s->cfg_ptr->ext_zvksh == true && require_rvv(s) &&
+           vext_check_isa_ill(s) && s->vstart % 8 == 0 && s->sew == MO_32;
+}
+
+static inline bool vsm3me_check(DisasContext *s, arg_rmrr *a)
+{
+    return vsm3_check(s) && vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
+}
+
+GEN_VV_UNMASKED_TRANS(vsm3me_vv, vsm3me_check)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 924a89de9f..9ca2cec23a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1066,6 +1066,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzvkb.c.inc"
 #include "insn_trans/trans_rvzvkns.c.inc"
 #include "insn_trans/trans_rvzvknh.c.inc"
+#include "insn_trans/trans_rvzvksh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index b73581641a..4dd5920aa4 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -694,3 +694,46 @@ void HELPER(vsha2cl_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
     vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
     env->vstart = 0;
 }
+
+static inline uint32_t p1(uint32_t x)
+{
+    return (x) ^ rol32((x), 15) ^ rol32((x), 23);
+}
+
+static inline uint32_t zvksh_w(uint32_t m16, uint32_t m9, uint32_t m3,
+                               uint32_t m13, uint32_t m6)
+{
+    return p1(m16 ^ m9 ^ rol32(m3, 15)) ^ rol32(m13, 7) ^ m6;
+}
+
+void HELPER(vsm3me_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
+                       CPURISCVState *env, uint32_t desc)
+{
+    uint32_t esz = memop_size(FIELD_EX64(env->vtype, VTYPE, VSEW));
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vta = vext_vta(desc);
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs1 = vs1_vptr;
+    uint32_t *vs2 = vs2_vptr;
+
+    if (env->vl % 8 != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (int i = env->vstart / 8; i < env->vl / 8; i++) {
+        uint32_t w[24];
+        for (int j = 0; j < 8; j++) {
+            w[j] = bswap32(vs1[H4((i * 8) + j)]);
+            w[j + 8] = bswap32(vs2[H4((i * 8) + j)]);
+        }
+        for (int j = 0; j < 8; j++) {
+            w[j + 16] =
+                zvksh_w(w[j], w[j + 7], w[j + 13], w[j + 3], w[j + 10]);
+        }
+        for (int j = 0; j < 8; j++) {
+            vd[(i * 8) + j] = bswap32(w[H4(j + 16)]);
+        }
+    }
+    vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
+    env->vstart = 0;
+}
-- 
2.39.1


