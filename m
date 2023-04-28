Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psPOa-00065A-A7
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 10:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOU-0005zx-Bn; Fri, 28 Apr 2023 10:48:19 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOR-0002BJ-Sz; Fri, 28 Apr 2023 10:48:18 -0400
Received: from [167.98.27.226] (helo=lawrence-thinkpad.guest.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1psPOL-005zz5-Bq; Fri, 28 Apr 2023 15:48:09 +0100
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org
Subject: [PATCH v3 06/19] target/riscv: Refactor translation of
 vector-widening instruction
Date: Fri, 28 Apr 2023 15:47:44 +0100
Message-Id: <20230428144757.57530-7-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
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
X-List-Received-Date: Fri, 28 Apr 2023 14:48:19 -0000

From: Dickon Hood <dickon.hood@codethink.co.uk>

Zvbb (implemented in later commit) has a widening instruction, which
requires an extra check on the enabled extensions.  Refactor
GEN_OPIVX_WIDEN_TRANS() to take a check function to avoid reimplementing
it.

Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 52 +++++++++++--------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 21731b784ec..2c2a097b76d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1526,30 +1526,24 @@ static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
-static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
-                           gen_helper_opivx *fn)
-{
-    if (opivx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
-    }
-    return false;
+#define GEN_OPIVX_WIDEN_TRANS(NAME, CHECK) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
+{                                                                         \
+    if (CHECK(s, a)) {                                                    \
+        static gen_helper_opivx * const fns[3] = {                        \
+            gen_helper_##NAME##_b,                                        \
+            gen_helper_##NAME##_h,                                        \
+            gen_helper_##NAME##_w                                         \
+        };                                                                \
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s); \
+    }                                                                     \
+    return false;                                                         \
 }
 
-#define GEN_OPIVX_WIDEN_TRANS(NAME) \
-static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
-{                                                            \
-    static gen_helper_opivx * const fns[3] = {               \
-        gen_helper_##NAME##_b,                               \
-        gen_helper_##NAME##_h,                               \
-        gen_helper_##NAME##_w                                \
-    };                                                       \
-    return do_opivx_widen(s, a, fns[s->sew]);                \
-}
-
-GEN_OPIVX_WIDEN_TRANS(vwaddu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwadd_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsubu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
+GEN_OPIVX_WIDEN_TRANS(vwaddu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwadd_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwsubu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwsub_vx, opivx_widen_check)
 
 /* WIDEN OPIVV with WIDEN */
 static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
@@ -1997,9 +1991,9 @@ GEN_OPIVX_TRANS(vrem_vx, opivx_check)
 GEN_OPIVV_WIDEN_TRANS(vwmul_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmulu_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmulsu_vv, opivv_widen_check)
-GEN_OPIVX_WIDEN_TRANS(vwmul_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmulu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmulsu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmul_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmulu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmulsu_vx, opivx_widen_check)
 
 /* Vector Single-Width Integer Multiply-Add Instructions */
 GEN_OPIVV_TRANS(vmacc_vv, opivv_check)
@@ -2015,10 +2009,10 @@ GEN_OPIVX_TRANS(vnmsub_vx, opivx_check)
 GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_widen_check)
-GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmacc_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx, opivx_widen_check)
 
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
-- 
2.40.1


