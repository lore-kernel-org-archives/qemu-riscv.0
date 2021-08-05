Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTci-0000zv-AA
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 23:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTcf-0000te-PY; Wed, 04 Aug 2021 23:00:41 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:48057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTcd-0001Oa-VA; Wed, 04 Aug 2021 23:00:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08804092|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0587047-0.000653314-0.940642;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYsTR0_1628132434; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYsTR0_1628132434)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 05 Aug 2021 11:00:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 11/13] target/riscv: Fix srow
Date: Thu,  5 Aug 2021 10:53:10 +0800
Message-Id: <20210805025312.15720-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2021 03:00:42 -0000

Always fill MSB 32 bits with 1s in source register before calling
gen_sro. Otherwise it may not only shift in 1s.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
 target/riscv/translate.c                | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 58921f3224..0bae0a2bbf 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -339,14 +339,14 @@ static bool trans_srow(DisasContext *ctx, arg_srow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_sro);
+    return gen_shiftw(ctx, a, gen_srow);
 }
 
 static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_sro);
+    return gen_shiftiw(ctx, a, gen_srow);
 }
 
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 160a2df629..5ee0feac4b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -669,6 +669,13 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_not_tl(ret, ret);
 }
 
+static void gen_srow(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv ones = tcg_constant_tl(UINT32_MAX);
+    tcg_gen_deposit_tl(arg1, arg1, ones, 32, 32);
+    gen_sro(ret, arg1, arg2);
+}
+
 static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
 {
     TCGv dest = gpr_dst(ctx, a->rd);
-- 
2.17.1


