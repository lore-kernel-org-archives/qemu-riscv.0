Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHh-0004R5-7p
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHX-0004DF-17; Wed, 07 Dec 2022 05:04:03 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHT-0005Dy-Sh; Wed, 07 Dec 2022 05:04:02 -0500
X-QQ-mid: bizesmtp63t1670407426tis0p0de
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:45 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: gTLdG/Pttc2gZn3DQQ1zn2Kac7Ugc5YJ5uVC4V2Lx7s9ODGpunB8F9UC9EYkW
 2HpkJr77nKvdcOQsOzXV+PQntbbxKQDuO40miXjmfodrd/j99dSYdU6FwlH8ZnfX25uQFEV
 nuYruR69BsoqRK2k83LTyedOKR8xHVhbrmiIBFLbWRrY7TDS70SsXmxJDqdSZ8A1tX7aD0N
 Y+5DXT4CQ8ygwo/OUvJVJM7oXx4wu1vxvWUl/qRa/41E7trr76pPoWXJMVCtuYg4IhYBoWY
 wSlNgRKlgR2HUIKrdV1TPDsTOnZfI5L8AUjqs/m1v495ELDuShdwD4xhqX970bhvymfssKe
 jDP9i8ZL5YBiPj5UjO4QDmvqwDR1ILWyTPgEthj
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 04/16] hw/riscv: Sort machines Kconfig options in
 alphabetical order
Date: Wed,  7 Dec 2022 18:03:23 +0800
Message-Id: <20221207100335.290481-4-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:03 -0000

SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


