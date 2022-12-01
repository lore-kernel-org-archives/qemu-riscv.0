Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFA-0008EB-Sf
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-00087t-Ab; Thu, 01 Dec 2022 09:08:46 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kEx-0008Bf-V1; Thu, 01 Dec 2022 09:08:46 -0500
X-QQ-mid: bizesmtp72t1669903701taf31fvj
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:20 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: 3M0okmaRx3i+XNkZi5/pWgKaes2HhddaLJpIUQR86spe3YumVxV41Nf2IIlKO
 goSkSO/ur810YMnH65bW374K6EHn76OA1QvxkhZBhjI5C6fVp41XBTlADowfaxKO0x397k5
 W5JOmPOLzz81p1lxgQl1mu80NnijPgpXC8hk3Um1QX1GH8j07RdQOT7B7zV3IanLoenFYTS
 /MVPXEsw5/qEkpXmYXOllWYhIHFm0jEYqw9V7Xuec98AvI6C+uk2DiAXMAJOLsrHfsyKMAF
 iBUErIcbDBalCRNUBUDTTG12ibDjr15qRRV5ZwYo96rNRksWeAa3IV++iNL/s2fgB8NoGqh
 EZdJWqJfn3SvkeNji8k6kE4E+NIvWfINxGOGr3FnaqRQmQPNis=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 04/15] hw/riscv: Sort machines Kconfig options in alphabetical
 order
Date: Thu,  1 Dec 2022 22:08:00 +0800
Message-Id: <20221201140811.142123-4-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:46 -0000

SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/Kconfig | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1e4b58024f..4550b3b938 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,8 @@ config RISCV_NUMA
 config IBEX
     bool
 
+# RISC-V machines in alphabetical order
+
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
@@ -22,13 +24,6 @@ config OPENTITAN
     select SIFIVE_PLIC
     select UNIMP
 
-config SHAKTI_C
-    bool
-    select UNIMP
-    select SHAKTI_UART
-    select RISCV_ACLINT
-    select SIFIVE_PLIC
-
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
@@ -50,6 +45,13 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
 
+config SHAKTI_C
+    bool
+    select RISCV_ACLINT
+    select SHAKTI_UART
+    select SIFIVE_PLIC
+    select UNIMP
+
 config SIFIVE_E
     bool
     select RISCV_ACLINT
-- 
2.34.1


