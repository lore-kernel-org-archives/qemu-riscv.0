Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQsKG-0000K2-48
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 11:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq8C-0008Mw-VI; Wed, 24 Aug 2022 09:09:17 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq86-0006iW-Ut; Wed, 24 Aug 2022 09:09:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VN7XDfE_1661346228; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VN7XDfE_1661346228) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 21:03:48 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 2/4] disas/riscv: Move down the struct rv_decode
Date: Wed, 24 Aug 2022 21:03:29 +0800
Message-Id: <20220824130331.21315-3-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:29:47 -0400
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
X-List-Received-Date: Wed, 24 Aug 2022 13:09:17 -0000

We will later add a struct rv_opcode_date filed in struct rv_decode,
which is defined after struct rv_decode.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 disas/riscv.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7af6afc8fa..5c36ae08dc 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -564,25 +564,6 @@ typedef enum {
 
 /* structures */
 
-typedef struct {
-    uint64_t  pc;
-    uint64_t  inst;
-    int32_t   imm;
-    uint16_t  op;
-    uint8_t   codec;
-    uint8_t   rd;
-    uint8_t   rs1;
-    uint8_t   rs2;
-    uint8_t   rs3;
-    uint8_t   rm;
-    uint8_t   pred;
-    uint8_t   succ;
-    uint8_t   aq;
-    uint8_t   rl;
-    uint8_t   bs;
-    uint8_t   rnum;
-} rv_decode;
-
 typedef struct {
     const int op;
     const rvc_constraint *constraints;
@@ -603,6 +584,25 @@ typedef struct {
     const short decomp_data;
 } rv_opcode_data;
 
+typedef struct {
+    uint64_t  pc;
+    uint64_t  inst;
+    int32_t   imm;
+    uint16_t  op;
+    uint8_t   codec;
+    uint8_t   rd;
+    uint8_t   rs1;
+    uint8_t   rs2;
+    uint8_t   rs3;
+    uint8_t   rm;
+    uint8_t   pred;
+    uint8_t   succ;
+    uint8_t   aq;
+    uint8_t   rl;
+    uint8_t   bs;
+    uint8_t   rnum;
+} rv_decode;
+
 /* register names */
 
 static const char rv_ireg_name_sym[32][5] = {
-- 
2.25.1


