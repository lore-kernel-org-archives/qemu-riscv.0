Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTaG-0001i9-5V
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTaE-0001dV-H1; Wed, 04 Aug 2021 22:58:10 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTaB-0007iv-FM; Wed, 04 Aug 2021 22:58:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436617|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.042309-0.000835167-0.956856;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYnuF._1628132282; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYnuF._1628132282) by smtp.aliyun-inc.com(10.147.40.2);
 Thu, 05 Aug 2021 10:58:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 06/13] target/riscv: Fix div instructions
Date: Thu,  5 Aug 2021 10:53:05 +0800
Message-Id: <20210805025312.15720-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.172; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-172.mail.aliyun.com
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
X-List-Received-Date: Thu, 05 Aug 2021 02:58:10 -0000

Don't overwrite global source register after
https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00058.html.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/translate.c | 46 +++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 912e5f1061..2892eaa9a7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -265,7 +265,7 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv cond1, cond2, zeroreg, resultopt1, t1, t2;
     /*
      * Handle by altering args to tcg_gen_div to produce req'd results:
      * For overflow: want source1 in source1 and 1 in source2
@@ -275,6 +275,8 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
     cond2 = tcg_temp_new();
     zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
@@ -283,49 +285,52 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
     tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
     /* if div by zero, set source1 to -1, otherwise don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-            resultopt1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, cond2, zeroreg, source1, resultopt1);
     /* if overflow or div by zero, set source2 to 1, else don't change */
     tcg_gen_or_tl(cond1, cond1, cond2);
     tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_div_tl(ret, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t2, cond1, zeroreg, source2, resultopt1);
+    tcg_gen_div_tl(ret, t1, t2);
 
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
     tcg_temp_free(resultopt1);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
+    TCGv cond1, zeroreg, resultopt1, t1, t2;
     cond1 = tcg_temp_new();
 
     zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
 
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
     tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-            resultopt1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, cond1, zeroreg, source1, resultopt1);
     tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_divu_tl(ret, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t2, cond1, zeroreg, source2, resultopt1);
+    tcg_gen_divu_tl(ret, t1, t2);
 
     tcg_temp_free(cond1);
     tcg_temp_free(resultopt1);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv cond1, cond2, zeroreg, resultopt1, t2;
 
     cond1 = tcg_temp_new();
     cond2 = tcg_temp_new();
     zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
+    t2 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, 1L);
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
@@ -335,9 +340,8 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
     /* if overflow or div by zero, set source2 to 1, else don't change */
     tcg_gen_or_tl(cond2, cond1, cond2);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-            resultopt1);
-    tcg_gen_rem_tl(resultopt1, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t2, cond2, zeroreg, source2, resultopt1);
+    tcg_gen_rem_tl(resultopt1, source1, t2);
     /* if div by zero, just return the original dividend */
     tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
             source1);
@@ -345,26 +349,28 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
     tcg_temp_free(resultopt1);
+    tcg_temp_free(t2);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
+    TCGv cond1, zeroreg, resultopt1, t2;
     cond1 = tcg_temp_new();
     zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
+    t2 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, (target_ulong)1);
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_remu_tl(resultopt1, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t2, cond1, zeroreg, source2, resultopt1);
+    tcg_gen_remu_tl(resultopt1, source1, t2);
     /* if div by zero, just return the original dividend */
     tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
             source1);
 
     tcg_temp_free(cond1);
     tcg_temp_free(resultopt1);
+    tcg_temp_free(t2);
 }
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
-- 
2.17.1


