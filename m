Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juIDN-0007OJ-GU
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jul 2020 12:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDH-0007Eu-IZ; Sat, 11 Jul 2020 12:18:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDD-0001M1-K4; Sat, 11 Jul 2020 12:18:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436351|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.194827-0.000235336-0.804938;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.I0GMGMe_1594484317; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I0GMGMe_1594484317)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 12 Jul 2020 00:18:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com,
 chihmin.chao@sifive.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 08/11] riscv: Add standard test case
Date: Sun, 12 Jul 2020 00:16:52 +0800
Message-Id: <20200711161655.2856-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
References: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 12:18:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 11 Jul 2020 16:18:56 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 test_riscv64.s | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 test_riscv64.s

diff --git a/test_riscv64.s b/test_riscv64.s
new file mode 100644
index 0000000..22a22b6
--- /dev/null
+++ b/test_riscv64.s
@@ -0,0 +1,85 @@
+/*****************************************************************************
+ * Copyright (c) 2020 T-Head Semiconductor Co., Ltd.
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     LIU Zhiwei (T-Head) - initial implementation
+ *     based on test_arm.s by Peter Maydell
+ *****************************************************************************/
+
+/* Initialise the gp regs */
+li x1, 1
+#li x2, 2  # stack pointer
+#li x3, 3  # global pointer
+#li x4, 4  # thread pointer
+li x5, 5
+li x6, 6
+li x7, 7
+li x8, 8
+li x9, 9
+li x10, 10
+li x11, 11
+li x12, 12
+li x13, 13
+li x14, 14
+li x15, 15
+li x16, 16
+li x17, 17
+li x18, 18
+li x19, 19
+li x20, 20
+li x21, 21
+li x22, 22
+li x23, 23
+li x24, 24
+li x25, 25
+li x26, 26
+li x27, 27
+li x28, 28
+li x29, 29
+li x30, 30
+li x31, 30
+
+/* Initialise the fp regs */
+fcvt.d.lu f0, x0
+fcvt.d.lu f1, x1
+fcvt.d.lu f2, x2
+fcvt.d.lu f3, x3
+fcvt.d.lu f4, x4
+fcvt.d.lu f5, x5
+fcvt.d.lu f6, x6
+fcvt.d.lu f7, x7
+fcvt.d.lu f8, x8
+fcvt.d.lu f9, x9
+fcvt.d.lu f10, x10
+fcvt.d.lu f11, x11
+fcvt.d.lu f12, x12
+fcvt.d.lu f13, x13
+fcvt.d.lu f14, x14
+fcvt.d.lu f15, x15
+fcvt.d.lu f16, x16
+fcvt.d.lu f17, x17
+fcvt.d.lu f18, x18
+fcvt.d.lu f19, x19
+fcvt.d.lu f20, x20
+fcvt.d.lu f21, x21
+fcvt.d.lu f22, x22
+fcvt.d.lu f23, x23
+fcvt.d.lu f24, x24
+fcvt.d.lu f25, x25
+fcvt.d.lu f26, x26
+fcvt.d.lu f27, x27
+fcvt.d.lu f28, x28
+fcvt.d.lu f29, x29
+fcvt.d.lu f30, x30
+fcvt.d.lu f31, x31
+
+/* do compare.
+ * The manual says instr with bits (6:0) == 1 1 0 1 0 1 1 are UNALLOCATED
+ */
+.int 0x0000006b
+/* exit test */
+.int 0x0000016b
-- 
2.23.0


