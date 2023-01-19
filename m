Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2T-00080h-Fg
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1b-0007DE-Pn
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:21 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1a-000710-7Q
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:19 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1L-007gSL-DI; Thu, 19 Jan 2023 14:36:04 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 William Salmon <will.salmon@codethink.co.uk>
Subject: [RFC PATCH 20/39] target/riscv: Add vaesem.vs decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:35:09 +0000
Message-Id: <20230119143528.1290950-21-lawrence.hunter@codethink.co.uk>
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

From: William Salmon <will.salmon@codethink.co.uk>

Signed-off-by: William Salmon <will.salmon@codethink.co.uk>
---
 target/riscv/helper.h                       | 1 +
 target/riscv/insn32.decode                  | 1 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc | 1 +
 target/riscv/vcrypto_helper.c               | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4bfc9a3387..85981f2cad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1186,6 +1186,7 @@ DEF_HELPER_4(vaesef_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdf_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesem_vv, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vaesem_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vv, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f31414f72c..cc91ca8794 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -915,6 +915,7 @@ vaesef_vs       101001 1 ..... 00011 010 ..... 1110111 @r2_vm_1
 vaesdf_vv       101000 1 ..... 00001 010 ..... 1110111 @r2_vm_1
 vaesdf_vs       101001 1 ..... 00001 010 ..... 1110111 @r2_vm_1
 vaesem_vv       101000 1 ..... 00010 010 ..... 1110111 @r2_vm_1
+vaesem_vs       101001 1 ..... 00010 010 ..... 1110111 @r2_vm_1
 vaesdm_vv       101000 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesdm_vs       101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
 vaesz_vs        101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
diff --git a/target/riscv/insn_trans/trans_rvzvkns.c.inc b/target/riscv/insn_trans/trans_rvzvkns.c.inc
index 2e0523ec62..fae48d63dc 100644
--- a/target/riscv/insn_trans/trans_rvzvkns.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkns.c.inc
@@ -64,3 +64,4 @@ GEN_V_UNMASKED_TRANS(vaesdm_vv, vaes_check_vv)
 GEN_V_UNMASKED_TRANS(vaesdm_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesz_vs, vaes_check_vs)
 GEN_V_UNMASKED_TRANS(vaesem_vv, vaes_check_vv)
+GEN_V_UNMASKED_TRANS(vaesem_vs, vaes_check_vs)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index a1d66a64aa..883739f4ac 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -350,6 +350,9 @@ GEN_ZVKNS_HELPER_VS(vaesdf_vs, aes_inv_shift_bytes(round_state);
 GEN_ZVKNS_HELPER_VV(vaesem_vv, aes_shift_bytes(round_state);
                     aes_sub_bytes(round_state); aes_mix_cols(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);)
+GEN_ZVKNS_HELPER_VS(vaesem_vs, aes_shift_bytes(round_state);
+                    aes_sub_bytes(round_state); aes_mix_cols(round_state);
+                    xor_round_key(round_state, (uint8_t *)round_key);)
 GEN_ZVKNS_HELPER_VV(vaesdm_vv, aes_inv_shift_bytes(round_state);
                     aes_inv_sub_bytes(round_state);
                     xor_round_key(round_state, (uint8_t *)round_key);
-- 
2.39.1


