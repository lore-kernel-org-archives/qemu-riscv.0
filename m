Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3Rj-00032k-NW
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Rf-0002v3-Ay; Wed, 19 Jan 2022 00:23:43 -0500
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:51076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Rd-0001c5-A2; Wed, 19 Jan 2022 00:23:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07549302|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00456155-0.000179524-0.995259;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCNDHg_1642569816; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCNDHg_1642569816)
 by smtp.aliyun-inc.com(10.147.43.230);
 Wed, 19 Jan 2022 13:23:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 10/22] target/riscv: Adjust csr write mask with XLEN
Date: Wed, 19 Jan 2022 13:18:12 +0800
Message-Id: <20220119051824.17494-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 05:23:45 -0000

Write mask is representing the bits we care about.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 12 ++++++++----
 target/riscv/op_helper.c                |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 04d3ea237f..631bc1f09e 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -924,7 +924,8 @@ static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    if (get_xl(ctx) < MXL_RV128) {
+    RISCVMXL xl = get_xl(ctx);
+    if (xl < MXL_RV128) {
         TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
 
         /*
@@ -935,7 +936,8 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
             return do_csrw(ctx, a->csr, src);
         }
 
-        TCGv mask = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(xl == MXL_RV32 ? UINT32_MAX :
+                                                     (target_ulong)-1);
         return do_csrrw(ctx, a->rd, a->csr, src, mask);
     } else {
         TCGv srcl = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -1013,7 +1015,8 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    if (get_xl(ctx) < MXL_RV128) {
+    RISCVMXL xl = get_xl(ctx);
+    if (xl < MXL_RV128) {
         TCGv src = tcg_constant_tl(a->rs1);
 
         /*
@@ -1024,7 +1027,8 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
             return do_csrw(ctx, a->csr, src);
         }
 
-        TCGv mask = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(xl == MXL_RV32 ? UINT32_MAX :
+                                                     (target_ulong)-1);
         return do_csrrw(ctx, a->rd, a->csr, src, mask);
     } else {
         TCGv src = tcg_constant_tl(a->rs1);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 67693cb42b..1a75ba11e6 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
 
 void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
+    target_ulong mask = env->xl == MXL_RV32 ? UINT32_MAX : (target_ulong)-1;
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.25.1


