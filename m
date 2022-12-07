Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHc-0004M7-9A
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHX-0004EN-A4; Wed, 07 Dec 2022 05:04:03 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHT-0004vp-Px; Wed, 07 Dec 2022 05:04:03 -0500
X-QQ-mid: bizesmtp63t1670407417tkq1vw0z
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:35 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: C46Rb8GPIEexEfiLwJv0OxyXuNwQCENeWQBpW07fyYQv/mfRLImNHiALkqe9u
 GpDK0o+1xf1CcrG8umQ7hBWMKwL3nMLrMF/iOfofvXEp6GuRCSfA5gmchjnQZIveEaRHB55
 TjETCE2PczrZZZCtmPAMdqVaBirLg2vmIDI1lbV99y5o5WihrfVCENFqsbC0F+k70d61jHu
 B+w0vhIvkhxYFGcAysdkR/OtyBEAWV6Tn40+itJN9dXZKYcXIwdNQTCFBqYC/CpJ3ucohSz
 H8ZMFGBJ40pGk6F9qH0SbL9v/5dfwR4If+KZ+Ph/iclhdimMAVMSVQj1nr/AwYOgMu/9hSc
 GcYgJzOvs2YMeA2NZNT/Tsn6AVUqiDQFgSsGOMKkcEOFTfh1Vk=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 01/16] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Date: Wed,  7 Dec 2022 18:03:20 +0800
Message-Id: <20221207100335.290481-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:03 -0000

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in sifive_plic_realize().

Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
RISC-V machines.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/intc/Kconfig  | 1 +
 hw/riscv/Kconfig | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ecd2883ceb..1d4573e803 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -78,6 +78,7 @@ config RISCV_IMSIC
 
 config SIFIVE_PLIC
     bool
+    select MSI_NONBROKEN
 
 config GOLDFISH_PIC
     bool
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..167dc4cca6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -11,7 +11,6 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_IOSCB
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -37,7 +36,6 @@ config RISCV_VIRT
     imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
-    select MSI_NONBROKEN
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
@@ -53,7 +51,6 @@ config RISCV_VIRT
 
 config SIFIVE_E
     bool
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
@@ -64,7 +61,6 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
@@ -82,6 +78,5 @@ config SPIKE
     bool
     select RISCV_NUMA
     select HTIF
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PLIC
-- 
2.34.1


