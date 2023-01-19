Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW1o-0007Pg-1P
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1R-000796-3t
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:15 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1J-0006yw-IW
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:08 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1D-007gSL-Ch; Thu, 19 Jan 2023 14:35:56 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [RFC PATCH 04/39] target/riscv: Add vclmulh.vv decoding,
 translation and execution support
Date: Thu, 19 Jan 2023 14:34:53 +0000
Message-Id: <20230119143528.1290950-5-lawrence.hunter@codethink.co.uk>
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

Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/helper.h                      |  1 +
 target/riscv/insn32.decode                 |  1 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc |  1 +
 target/riscv/vcrypto_helper.c              | 12 ++++++++++++
 4 files changed, 15 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6c786ef6f3..a155272701 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1140,3 +1140,4 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 /* Vector crypto functions */
 DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4a7421354d..e26ea1df08 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -894,3 +894,4 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
 # *** RV64 Zvkb vector crypto extension ***
 vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
+vclmulh_vv      001101 . ..... ..... 010 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 6e8b81136c..19ce4c7431 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -39,6 +39,7 @@ static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
 }
 
 GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
+GEN_VV_MASKED_TRANS(vclmulh_vv, vclmul_vv_check)
 
 #define GEN_VX_MASKED_TRANS(NAME, CHECK)                                \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index c453d348ad..022b941131 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -31,5 +31,17 @@ static void do_vclmul_vx(void *vd, target_long rs1, void *vs2, int i)
     ((uint64_t *)vd)[i] = result;
 }
 
+static void do_vclmulh_vv(void *vd, void *vs1, void *vs2, int i)
+{
+    __uint128_t result = 0;
+    for (int j = 63; j >= 0; j--) {
+        if ((((uint64_t *)vs1)[i] >> j) & 1) {
+            result ^= (((__uint128_t)(((uint64_t *)vs2)[i])) << j);
+        }
+    }
+    ((uint64_t *)vd)[i] = (result >> 64);
+}
+
 GEN_VEXT_VV(vclmul_vv, 8)
 GEN_VEXT_VX(vclmul_vx, 8)
+GEN_VEXT_VV(vclmulh_vv, 8)
-- 
2.39.1


