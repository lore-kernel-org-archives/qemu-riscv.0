Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIwdG-0002kd-Em
	for mharc-qemu-riscv@gnu.org; Mon, 30 Mar 2020 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIwdC-0002jG-IS
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 11:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIwdB-0003Wt-Cu
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 11:47:18 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:34416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIwd8-00032D-7j; Mon, 30 Mar 2020 11:47:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.9091424|0.4327762; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_system_inform|0.0147872-0.00226515-0.982948;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03310; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=11; RT=11; SR=0; TI=SMTPD_---.H7jjn43_1585583218; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H7jjn43_1585583218) by smtp.aliyun-inc.com(10.147.40.2);
 Mon, 30 Mar 2020 23:46:58 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 05/61] target/riscv: add an internals.h header
Date: Mon, 30 Mar 2020 23:35:37 +0800
Message-Id: <20200330153633.15298-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
References: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
X-List-Received-Date: Mon, 30 Mar 2020 15:47:19 -0000

The internals.h keeps things that are not relevant to the actual architecture,
only to the implementation, separate.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 target/riscv/internals.h

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
new file mode 100644
index 0000000000..0f75634b6c
--- /dev/null
+++ b/target/riscv/internals.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU RISC-V CPU -- internal functions and types
+ *
+ * Copyright (c) 2020 PingTouGe Semiconductor Co., Ltd. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_CPU_INTERNALS_H
+#define RISCV_CPU_INTERNALS_H
+
+#include "hw/registerfields.h"
+
+#endif
-- 
2.23.0


