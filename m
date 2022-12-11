Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4CpG-0003W0-E0
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpE-0003VV-Rs; Sat, 10 Dec 2022 22:16:24 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpC-0007XT-PH; Sat, 10 Dec 2022 22:16:24 -0500
X-QQ-mid: bizesmtp68t1670728122tisddqwg
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:41 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: 9fp+MOMfZT3gk7kymZjfv0yphUuIY1WxNT3NbK6XuIvNuU8LmEoyk4RSBD8t3
 qUaOOp7vX+YxkWU4fDVyj1sl2SCYADEEE5XekUYzy46IyWP7yzoeu2oWOwrbS5cs6GvjrA7
 3LuvIKc9cQC9NN/+nUxcmaJshBECON2o9vrTtLYVbHjw8JrHdSB7tRIzBfGGwjp/z5l6iF3
 LsJ+Rgr/hjXMJYyq0byEbvW4PbqpJhlfRN/zitezbYbOIES6YPW2IOkLDkViD4pr5ygq+1N
 HB+IwEKASuB/EcF0Aojn2HdmZJM9fS7ZmtZuWEUDH5rkIqn+8cjhH40ndDn9L/mfYb4MLSn
 AmvZHHoI65iAPCLVSn+KbKjsiAPcBZJ3XkF/H9N
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 05/16] hw/riscv: spike: Remove misleading comments
Date: Sun, 11 Dec 2022 11:08:18 +0800
Message-Id: <20221211030829.802437-5-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:25 -0000

PLIC is not included in the 'spike' machine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/spike.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1e1d752c00..13946acf0d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -8,7 +8,6 @@
  *
  * 0) HTIF Console and Poweroff
  * 1) CLINT (Timer and IPI)
- * 2) PLIC (Platform Level Interrupt Controller)
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
-- 
2.34.1


