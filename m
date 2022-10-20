Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olT1L-000107-TQ
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 06:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT13-0000QG-Mm; Thu, 20 Oct 2022 06:43:12 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT11-0003sE-CJ; Thu, 20 Oct 2022 06:43:09 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSeuK2q_1666262579; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSeuK2q_1666262579) by smtp.aliyun-inc.com;
 Thu, 20 Oct 2022 18:43:00 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, lzw194868@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 2/3] tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
Date: Thu, 20 Oct 2022 18:41:53 +0800
Message-Id: <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Oct 2022 10:43:25 -0000

TYPE-I immediate can only represent a signed 12-bit value. If immediate
exceed, mov it to an register.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 32f4bc7bfc..bfdf2bea69 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,
     if (!cbh) {
         tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
     } else if (bh != 0 || ah == rl) {
-        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
+        if (bh == sextract(bh, 0, 12)) {
+            tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
+        } else {
+            tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));
+            tcg_out_opc_reg(s, opc_add, th, ah, th);
+        }
     } else {
         th = ah;
     }
@@ -676,8 +681,14 @@ static void tcg_out_addsub2(TCGContext *s,
     /* Note that tcg optimization should eliminate the bl == 0 case.  */
     if (is_sub) {
         if (cbl) {
-            tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, al, bl);
-            tcg_out_opc_imm(s, opc_addi, rl, al, -bl);
+            if (bl == sextract(bl, 0, 12)) {
+                tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, al, bl);
+                tcg_out_opc_imm(s, opc_addi, rl, al, -bl);
+            } else {
+                tcg_out_movi(s, TCG_TYPE_TL, rl, bl);
+                tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0, al, rl);
+                tcg_out_opc_reg(s, opc_sub, rl, al, TCG_REG_TMP0);
+            }
         } else {
             tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0, al, bl);
             tcg_out_opc_reg(s, opc_sub, rl, al, bl);
@@ -685,8 +696,15 @@ static void tcg_out_addsub2(TCGContext *s,
         tcg_out_opc_reg(s, opc_sub, rh, th, TCG_REG_TMP0);
     } else {
         if (cbl) {
-            tcg_out_opc_imm(s, opc_addi, rl, al, bl);
-            tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
+            if (bl == sextract(bl, 0, 12)) {
+                tcg_out_opc_imm(s, opc_addi, rl, al, bl);
+                tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
+            } else {
+                tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP0, bl);
+                tcg_out_opc_reg(s, opc_add, rl, al, TCG_REG_TMP0);
+                tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
+                                rl, al);
+            }
         } else if (rl == al && rl == bl) {
             tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
             tcg_out_opc_reg(s, opc_addi, rl, al, bl);
-- 
2.25.1


