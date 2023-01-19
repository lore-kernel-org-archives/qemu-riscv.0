Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIWJs-00044P-OQ
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIWJr-000443-CE
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:55:11 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIWJp-0002ix-Mi
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:55:11 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1R-007gSL-FA; Thu, 19 Jan 2023 14:36:10 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [RFC PATCH 33/39] target/riscv: Add vghmac.vv decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:35:22 +0000
Message-Id: <20230119143528.1290950-34-lawrence.hunter@codethink.co.uk>
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
X-List-Received-Date: Thu, 19 Jan 2023 14:55:11 -0000

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                      |  2 +
 target/riscv/insn32.decode                 |  3 ++
 target/riscv/insn_trans/trans_rvzvkg.c.inc |  8 ++++
 target/riscv/translate.c                   |  1 +
 target/riscv/vcrypto_helper.c              | 45 ++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a82103ead9..6272294d50 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1199,3 +1199,5 @@ DEF_HELPER_5(vsha2cl_vv, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
+
+DEF_HELPER_5(vghmac_vv, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4a50114e92..ff044f8288 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -930,3 +930,6 @@ vsha2cl_vv      101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
 # *** RV64 Zvksh vector crypto extensions ***
 vsm3me_vv       100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsm3c_vi        101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
+
+# *** RV64 Zvkg vector crypto extension ***
+vghmac_vv       101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkg.c.inc b/target/riscv/insn_trans/trans_rvzvkg.c.inc
new file mode 100644
index 0000000000..576f5d39c4
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzvkg.c.inc
@@ -0,0 +1,8 @@
+static bool vghmac_check(DisasContext *s, arg_rmrr *a)
+{
+    return opivv_check(s, a) &&
+           s->vstart % 4 == 0 &&
+           s->sew == MO_32;
+}
+
+GEN_VV_UNMASKED_TRANS(vghmac_vv, vghmac_check)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9ca2cec23a..0bc1c9db65 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1067,6 +1067,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzvkns.c.inc"
 #include "insn_trans/trans_rvzvknh.c.inc"
 #include "insn_trans/trans_rvzvksh.c.inc"
+#include "insn_trans/trans_rvzvkg.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 478e652c9b..a309ac3f03 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -827,3 +827,48 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
     vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
     env->vstart = 0;
 }
+
+void HELPER(vghmac_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
+                       CPURISCVState *env, uint32_t desc)
+{
+    uint64_t *vd = vd_vptr;
+    uint64_t *vs1 = vs1_vptr;
+    uint64_t *vs2 = vs2_vptr;
+    uint32_t vta = vext_vta(desc);
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+
+    if (env->vl % 4 != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        __uint128_t Y = reverse_bits_byte_8(vd[i * 2 + 0]) |
+                        ((__uint128_t)reverse_bits_byte_8(vd[i * 2 + 1]) << 64);
+        __uint128_t H = reverse_bits_byte_8(vs1[i * 2 + 0]) |
+                        ((__uint128_t)reverse_bits_byte_8(vs1[i * 2 + 1]) << 64);
+        __uint128_t X = vs2[i * 2 + 0] | ((__uint128_t)vs2[i * 2 + 1] << 64);
+        __uint128_t Z = 0;
+
+        for (uint j = 0; j < 128; j++) {
+            if ((Y >> j) & 1) {
+                Z ^= H;
+            }
+            bool reduce = ((H >> 127) & 1);
+            H = H << 1;
+            if (reduce) {
+                H ^= 0x87;
+            }
+        }
+
+        Z = reverse_bits_byte_8(Z & UINT64_MAX) |
+            ((__uint128_t)reverse_bits_byte_8((Z >> 64) & UINT64_MAX) << 64);
+
+        Z = Z ^ X;
+
+        vd[i * 2 + 0] = Z & UINT64_MAX;
+        vd[i * 2 + 1] = (Z >> 64) & UINT64_MAX;
+    }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
+    env->vstart = 0;
+}
-- 
2.39.1


