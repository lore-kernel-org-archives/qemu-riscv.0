Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW1n-0007N5-KH
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1R-000798-4r
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:15 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1M-0006zW-LP
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:08 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1F-007gSL-Pz; Thu, 19 Jan 2023 14:35:58 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [RFC PATCH 09/39] target/riscv: Add vandn.[vv, vx, vi] decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:34:58 +0000
Message-Id: <20230119143528.1290950-10-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:16 -0000

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 target/riscv/helper.h                      |  9 +++++++++
 target/riscv/insn32.decode                 |  3 +++
 target/riscv/insn_trans/trans_rvzvkb.c.inc |  5 +++++
 target/riscv/vcrypto_helper.c              | 19 +++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c980d52828..5de615ea78 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1171,3 +1171,12 @@ DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vbrev8_v_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vandn_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 342199abc0..d6f5e4d198 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -904,3 +904,6 @@ vror_vi         010100 . ..... ..... 011 ..... 1010111 @r_vm
 vror_vi2        010101 . ..... ..... 011 ..... 1010111 @r_vm
 vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
 vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
+vandn_vi        000001 . ..... ..... 011 ..... 1010111 @r_vm
+vandn_vv        000001 . ..... ..... 000 ..... 1010111 @r_vm
+vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index b0c8347ab1..9f75bb3d39 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -147,6 +147,11 @@ static bool trans_##NAME(DisasContext *s, arg_rmr * a)                 \
     return false;                                                      \
 }
 
+
+GEN_OPIVV_TRANS(vandn_vv, zvkb_vv_check)
+GEN_OPIVX_TRANS(vandn_vx, zvkb_vx_check)
+GEN_OPIVI_TRANS(vandn_vi, IMM_SX, vandn_vx, zvkb_vx_check)
+
 static bool vxrev8_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index b09fe5fa2a..900e68dfb0 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -135,3 +135,22 @@ GEN_VEXT_V(vrev8_v_b, 1)
 GEN_VEXT_V(vrev8_v_h, 2)
 GEN_VEXT_V(vrev8_v_w, 4)
 GEN_VEXT_V(vrev8_v_d, 8)
+
+#define DO_ANDN(a, b) ((b) & ~(a))
+RVVCALL(OPIVV2, vandn_vv_b, OP_UUU_B, H1, H1, H1, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_h, OP_UUU_H, H2, H2, H2, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_w, OP_UUU_W, H4, H4, H4, DO_ANDN)
+RVVCALL(OPIVV2, vandn_vv_d, OP_UUU_D, H8, H8, H8, DO_ANDN)
+GEN_VEXT_VV(vandn_vv_b, 1)
+GEN_VEXT_VV(vandn_vv_h, 2)
+GEN_VEXT_VV(vandn_vv_w, 4)
+GEN_VEXT_VV(vandn_vv_d, 8)
+
+RVVCALL(OPIVX2, vandn_vx_b, OP_UUU_B, H1, H1, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_h, OP_UUU_H, H2, H2, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_w, OP_UUU_W, H4, H4, DO_ANDN)
+RVVCALL(OPIVX2, vandn_vx_d, OP_UUU_D, H8, H8, DO_ANDN)
+GEN_VEXT_VX(vandn_vx_b, 1)
+GEN_VEXT_VX(vandn_vx_h, 2)
+GEN_VEXT_VX(vandn_vx_w, 4)
+GEN_VEXT_VX(vandn_vx_d, 8)
-- 
2.39.1


