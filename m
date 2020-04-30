Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YC-0005Y3-PN
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y2-0005Bf-EK
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xn-0001KA-UW
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:54 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006Wn-Kj; Thu, 30 Apr 2020 03:21:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1414109|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0183836-0.00115908-0.980457;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03300; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:44 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 3/8] riscv: Define riscv struct reginfo
Date: Thu, 30 Apr 2020 15:21:34 +0800
Message-Id: <20200430072139.4602-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:01 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 risu_reginfo_riscv64.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 risu_reginfo_riscv64.h

diff --git a/risu_reginfo_riscv64.h b/risu_reginfo_riscv64.h
new file mode 100644
index 0000000..7d365a8
--- /dev/null
+++ b/risu_reginfo_riscv64.h
@@ -0,0 +1,29 @@
+/******************************************************************************
+ * Copyright (c) 2020 PingTouGe Semiconductor
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     LIU Zhiwei(PingTouGe) - initial implementation
+ *     based on Peter Maydell's risu_arm.c
+ *****************************************************************************/
+
+#ifndef RISU_REGINFO_RISCV64_H
+#define RISU_REGINFO_RISCV64_H
+
+struct reginfo {
+    uint64_t fault_address;
+    uint64_t regs[32];
+    uint64_t fregs[32];
+    uint64_t sp;
+    uint64_t pc;
+    uint32_t flags;
+    uint32_t faulting_insn;
+
+    /* FP */
+    uint32_t fcsr;
+};
+
+#endif /* RISU_REGINFO_RISCV64_H */
-- 
2.23.0


