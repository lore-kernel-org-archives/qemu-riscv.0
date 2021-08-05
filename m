Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTZj-0000y5-Mq
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTZi-0000uX-Hg; Wed, 04 Aug 2021 22:57:38 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTZg-0007HX-MM; Wed, 04 Aug 2021 22:57:38 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08995347|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.13775-0.000181703-0.862068;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYntve_1628132252; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYntve_1628132252) by smtp.aliyun-inc.com(10.147.40.2);
 Thu, 05 Aug 2021 10:57:32 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 05/13] target/riscv: Support UXL32 for shift instruction
Date: Thu,  5 Aug 2021 10:53:04 +0800
Message-Id: <20210805025312.15720-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
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
X-List-Received-Date: Thu, 05 Aug 2021 02:57:38 -0000

Reuse 32-bit right shift instructions.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6201c07795..698a28731e 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -303,11 +303,17 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
+    if (ctx->uxl32) {
+        return trans_srliw(ctx, a);
+    }
     return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
+    if (ctx->uxl32) {
+        return trans_sraiw(ctx, a);
+    }
     return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
@@ -343,11 +349,17 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
+    if (ctx->uxl32) {
+        return trans_srlw(ctx, a);
+    }
     return gen_shift(ctx, a, &tcg_gen_shr_tl);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
+    if (ctx->uxl32) {
+        return trans_sraw(ctx, a);
+    }
     return gen_shift(ctx, a, &tcg_gen_sar_tl);
 }
 
-- 
2.17.1


