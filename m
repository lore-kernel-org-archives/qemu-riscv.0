Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFA-0008DS-J0
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-00087c-6u; Thu, 01 Dec 2022 09:08:46 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kEy-0008Bd-E7; Thu, 01 Dec 2022 09:08:45 -0500
X-QQ-mid: bizesmtp72t1669903703tbhev609
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:22 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: MepwELf5CyJeS8+6P1YQJrGrqUFfqfG6PoHXty9Gl2kTSdYd5u8Kf1qclfJvT
 wvwlTLxFwJZOcux2nVNCsvfhk3vzTAxi02K7yNiGmWjJBOr6RRCFK65pYFOm5cdQi9OhfqB
 EeG6vUZrpphBZhcnkFcaXKq/wlmQxj2mZWD2fk7DmaTkeiuForhKUFeoN+V8geL+GW0dmbY
 v81l8a9nRSbEXjO+Dw6+O/zRgqpunK26gmGRsehCJGf5bSh0hdseRe1rWwKUhoZruUGhVQj
 557bfpNt50xJsRs7SXGyYjBm10eOyEIxkkVuCFhscjXZznWJqSVmbvLGLCYQhGQSE8Pa44u
 zQqYdln+ed7voQpRVCWCvnyL5UP9nIx173IE3JW
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 05/15] hw/riscv: spike: Remove misleading comments
Date: Thu,  1 Dec 2022 22:08:01 +0800
Message-Id: <20221201140811.142123-5-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:46 -0000

PLIC is not included in the 'spike' machine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

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


