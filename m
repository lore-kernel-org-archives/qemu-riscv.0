Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2z-0000EW-At
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1j-0007Ei-5I
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:28 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1b-00071G-5s
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:23 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1M-007gSL-7S; Thu, 19 Jan 2023 14:36:05 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [RFC PATCH 22/39] target/riscv: Add vaeskf2.vi decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:35:11 +0000
Message-Id: <20230119143528.1290950-23-lawrence.hunter@codethink.co.uk>
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 target/riscv/helper.h                       |  1 +
 target/riscv/insn32.decode                  |  1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc |  9 ++++
 target/riscv/vcrypto_helper.c               | 56 +++++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 2ac02dde01..312f59bb38 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1191,3 +1191,4 @@ DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_5(vaeskf1_vi, void, ptr, ptr, i32, env, i32)
+DEF_HELPER_5(vaeskf2_vi, void, ptr, ptr, i32, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 325e2401c8..1eed0a6b26 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -920,3 +920,4 @@ vaesdm_vv       101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesdm_vs       101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesz_vs        101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
 vaeskf1_vi      100010 1 ..... ..... 010 ..... 1110111 @r_vm_1
+vaeskf2_vi      101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 62c3cd83e7..0abb7811b7 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -109,4 +109,13 @@ static bool vaeskf1_check(DisasContext *s, arg_vaeskf1_vi * a)
            a->rs1 >= 1 && a->rs1 <= 10;
 }
 
+static bool vaeskf2_check(DisasContext *s, arg_vaeskf2_vi *a)
+{
+    return require_rvv(s) && s->cfg_ptr->ext_zvkns == true &&
+           vext_check_isa_ill(s) && s->vstart % 4 == 0 && s->sew == MO_32 &&
+           require_align(a->rd, s->lmul) && require_align(a->rs2, s->lmul) &&
+           a->rs1 >= 2 && a->rs1 <= 14;
+}
+
 GEN_VI_UNMASKED_TRANS(vaeskf1_vi, vaeskf1_check)
+GEN_VI_UNMASKED_TRANS(vaeskf2_vi, vaeskf2_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 13ceb705cd..50207b4ff0 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -405,3 +405,59 @@ void HELPER(vaeskf1_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
     /* set tail elements to 1s */
     vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
 }
+
+void HELPER(vaeskf2_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
+                        CPURISCVState *env, uint32_t desc)
+{
+    uint32_t *vd = vd_vptr;
+    uint32_t *vs2 = vs2_vptr;
+    uint32_t vl = env->vl;
+    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
+    uint32_t vta = vext_vta(desc);
+    if (env->vl % 4 != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
+        uint32_t rk[12];
+        static const uint32_t rcon[] = {
+                0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
+                0x20000000, 0x40000000, 0x80000000, 0x1B000000, 0x36000000,
+        };
+
+        rk[0] = bswap32(vd[i * 4 + H4(0)]);
+        rk[1] = bswap32(vd[i * 4 + H4(1)]);
+        rk[2] = bswap32(vd[i * 4 + H4(2)]);
+        rk[3] = bswap32(vd[i * 4 + H4(3)]);
+        rk[4] = bswap32(vs2[i * 4 + H4(0)]);
+        rk[5] = bswap32(vs2[i * 4 + H4(1)]);
+        rk[6] = bswap32(vs2[i * 4 + H4(2)]);
+        rk[7] = bswap32(vs2[i * 4 + H4(3)]);
+
+        if (uimm % 2 == 0) {
+            rk[8] = rk[0] ^ (AES_Te4[(rk[7] >> 16) & 0xff] & 0xff000000) ^
+                    (AES_Te4[(rk[7] >> 8) & 0xff] & 0x00ff0000) ^
+                    (AES_Te4[(rk[7] >> 0) & 0xff] & 0x0000ff00) ^
+                    (AES_Te4[(rk[7] >> 24) & 0xff] & 0x000000ff) ^
+                    rcon[(uimm - 1) / 2];
+            rk[9] = rk[1] ^ rk[8];
+            rk[10] = rk[2] ^ rk[9];
+            rk[11] = rk[3] ^ rk[10];
+        } else {
+            rk[8] = rk[0] ^ (AES_Te4[(rk[7] >> 24) & 0xff] & 0xff000000) ^
+                    (AES_Te4[(rk[7] >> 16) & 0xff] & 0x00ff0000) ^
+                    (AES_Te4[(rk[7] >> 8) & 0xff] & 0x0000ff00) ^
+                    (AES_Te4[(rk[7] >> 0) & 0xff] & 0x000000ff);
+            rk[9] = rk[1] ^ rk[8];
+            rk[10] = rk[2] ^ rk[9];
+            rk[11] = rk[3] ^ rk[10];
+        }
+
+        vd[i * 4 + H4(0)] = bswap32(rk[8]);
+        vd[i * 4 + H4(1)] = bswap32(rk[9]);
+        vd[i * 4 + H4(2)] = bswap32(rk[10]);
+        vd[i * 4 + H4(3)] = bswap32(rk[11]);
+    }
+    env->vstart = 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
+}
-- 
2.39.1


