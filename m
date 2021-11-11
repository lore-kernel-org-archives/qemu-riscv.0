Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCQb-0000bl-9c
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCQV-0000U0-Et; Thu, 11 Nov 2021 10:55:47 -0500
Received: from mail142-6.mail.alibaba.com ([198.11.142.6]:10652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCQR-00084O-TO; Thu, 11 Nov 2021 10:55:46 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09542413|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.00303542-0.000152183-0.996812;
 FP=12598256719647133649|2|2|6|0|-1|-1|-1; HT=ay29a033018047187;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJC8Zk_1636646131; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJC8Zk_1636646131)
 by smtp.aliyun-inc.com(10.147.43.95); Thu, 11 Nov 2021 23:55:31 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 07/20] target/riscv: Adjust csr write mask with XLEN
Date: Thu, 11 Nov 2021 23:51:36 +0800
Message-Id: <20211111155149.58172-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.6; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-6.mail.alibaba.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 15:55:51 -0000

Write mask is representing the bits we care about.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 target/riscv/op_helper.c                | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e51dbc41c5..40c81421f2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -486,7 +486,7 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
         return do_csrw(ctx, a->csr, src);
     }
 
-    TCGv mask = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
     return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
@@ -537,7 +537,7 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
         return do_csrw(ctx, a->csr, src);
     }
 
-    TCGv mask = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
     return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 095d39671b..561e156bec 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
 
 void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
+    target_ulong mask = cpu_get_xl(env) == MXL_RV32 ? UINT32_MAX : -1;
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.25.1


