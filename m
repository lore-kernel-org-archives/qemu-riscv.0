Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2p-0008NS-5f
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1e-0007ET-Q4
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:27 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1a-0006zu-KX
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:22 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1H-007gSL-MS; Thu, 19 Jan 2023 14:36:00 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [RFC PATCH 12/39] target/riscv: Add vaesef.vv decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:35:01 +0000
Message-Id: <20230119143528.1290950-13-lawrence.hunter@codethink.co.uk>
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:27 -0000
X-List-Received-Date: Thu, 19 Jan 2023 14:36:27 -0000

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                       |  2 +
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 42 ++++++++++++
 target/riscv/translate.c                    |  1 +
 target/riscv/vcrypto_helper.c               | 75 +++++++++++++++++++++
 5 files changed, 124 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5de615ea78..bdfa63302e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1180,3 +1180,5 @@ DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_4(vaesef_vv, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d6f5e4d198..fdaab9a189 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -74,6 +74,7 @@
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
+@r2_vm_1 ...... . ..... ..... ... ..... ....... &rmr vm=1 %rs2 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -907,3 +908,6 @@ vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
 vandn_vi        000001 . ..... ..... 011 ..... 1010111 @r_vm
 vandn_vv        000001 . ..... ..... 000 ..... 1010111 @r_vm
 vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
+
+# *** RV64 Zvkns vector crypto extension ***
+vaesef_vv       101000 1 ..... 00011 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
new file mode 100644
index 0000000000..f079425614
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -0,0 +1,42 @@
+#define GEN_V_UNMASKED_TRANS(NAME, CHECK)                                 \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
+{                                                                         \
+    if (CHECK(s, a)) {                                                    \
+        TCGv_ptr rd_v, rs2_v;                                             \
+        TCGv_i32 desc;                                                    \
+        uint32_t data = 0;                                                \
+                                                                          \
+        TCGLabel *over = gen_new_label();                                 \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);                 \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
+        rd_v = tcg_temp_new_ptr();                                        \
+        rs2_v = tcg_temp_new_ptr();                                       \
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,           \
+                                          s->cfg_ptr->vlen / 8, data));   \
+        tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
+        tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
+        gen_helper_##NAME(rd_v, rs2_v, cpu_env, desc);                    \
+        tcg_temp_free_ptr(rd_v);                                          \
+        tcg_temp_free_ptr(rs2_v);                                         \
+        mark_vs_dirty(s);                                                 \
+        gen_set_label(over);                                              \
+        return true;                                                      \
+    }                                                                     \
+    return false;                                                         \
+}
+
+
+static bool vaes_check_vv(DisasContext *s, arg_rmr *a)
+{
+    return require_rvv(s) &&
+           s->cfg_ptr->ext_zvkns == true &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) && require_align(a->rs2, s->lmul) &&
+           s->vstart % 4 == 0 && s->sew == MO_32;
+}
+GEN_V_UNMASKED_TRANS(vaesef_vv, vaes_check_vv)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 71684c10f3..8d39743de2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1064,6 +1064,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_rvzvkb.c.inc"
+#include "insn_trans/trans_rvzvkns.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 900e68dfb0..59d7d32a05 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -3,6 +3,7 @@
 #include "qemu/bitops.h"
 #include "qemu/bswap.h"
 #include "cpu.h"
+#include "crypto/aes.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -154,3 +155,77 @@ GEN_VEXT_VX(vandn_vx_b, 1)
 GEN_VEXT_VX(vandn_vx_h, 2)
 GEN_VEXT_VX(vandn_vx_w, 4)
 GEN_VEXT_VX(vandn_vx_d, 8)
+
+static inline void aes_sub_bytes(uint8_t round_state[4][4])
+{
+    for (int j = 0; j < 16; j++) {
+        round_state[j / 4][j % 4] = AES_sbox[round_state[j / 4][j % 4]];
+    }
+}
+
+static inline void aes_shift_bytes(uint8_t round_state[4][4])
+{
+    uint8_t temp;
+    temp = round_state[0][1];
+    round_state[0][1] = round_state[1][1];
+    round_state[1][1] = round_state[2][1];
+    round_state[2][1] = round_state[3][1];
+    round_state[3][1] = temp;
+    temp = round_state[0][2];
+    round_state[0][2] = round_state[2][2];
+    round_state[2][2] = temp;
+    temp = round_state[1][2];
+    round_state[1][2] = round_state[3][2];
+    round_state[3][2] = temp;
+    temp = round_state[0][3];
+    round_state[0][3] = round_state[3][3];
+    round_state[3][3] = round_state[2][3];
+    round_state[2][3] = round_state[1][3];
+    round_state[1][3] = temp;
+}
+
+static inline void xor_round_key(uint8_t round_state[4][4], uint8_t *round_key)
+{
+    for (int j = 0; j < 16; j++) {
+        round_state[j / 4][j % 4] = round_state[j / 4][j % 4] ^ (round_key)[j];
+    }
+}
+
+#define GEN_ZVKNS_HELPER_VV(NAME, ...)                                    \
+void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,      \
+                  uint32_t desc)                                          \
+{                                                                         \
+    uint64_t *vd = vd_vptr;                                               \
+    uint64_t *vs2 = vs2_vptr;                                             \
+    uint32_t vl = env->vl;                                                \
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);            \
+    uint32_t vta = vext_vta(desc);                                        \
+    if (env->vl % 4 != 0) {                                               \
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());     \
+    }                                                                     \
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {            \
+        uint64_t round_key[2] = {                                         \
+            cpu_to_le64(vs2[i * 2 + 0]),                                  \
+            cpu_to_le64(vs2[i * 2 + 1]),                                  \
+        };                                                                \
+        uint8_t round_state[4][4];                                        \
+        cpu_to_le64s(vd + i * 2 + 0);                                     \
+        cpu_to_le64s(vd + i * 2 + 1);                                     \
+        for (int j = 0; j < 16; j++) {                                    \
+            round_state[j / 4][j % 4] = ((uint8_t *)(vd + i * 2))[j];     \
+        }                                                                 \
+        __VA_ARGS__;                                                      \
+        for (int j = 0; j < 16; j++) {                                    \
+            ((uint8_t *)(vd + i * 2))[j] = round_state[j / 4][j % 4];     \
+        }                                                                 \
+        le64_to_cpus(vd + i * 2 + 0);                                     \
+        le64_to_cpus(vd + i * 2 + 1);                                     \
+    }                                                                     \
+    env->vstart = 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);                  \
+}
+
+GEN_ZVKNS_HELPER_VV(vaesef_vv, aes_sub_bytes(round_state);
+                    aes_shift_bytes(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);)
-- 
2.39.1


