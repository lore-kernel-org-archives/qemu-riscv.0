Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kF6-0008A2-LW
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-00087X-2v; Thu, 01 Dec 2022 09:08:46 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kEx-0008Bg-TL; Thu, 01 Dec 2022 09:08:45 -0500
X-QQ-mid: bizesmtp72t1669903698tsfh1n4a
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:17 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: 3M0okmaRx3hNpD0EczZiblpLKWcEK5bsmNTYM6dVs4PtqQnckQVqdhonE0RAC
 kYHRG9OR3rxhlFJSFbhUGswkLpThudTDvrkcKQ7DFhShnxK1ZjvKDRZX6XLxWFx/4HdQRrS
 vASKxW7ooe7GJw4lYenNQG5zO9M5BO5P05Q0H70Xf6ZtKpivdBNHryXs5wD4DDLbApUjrgR
 R624H3Y7J9YW4nkjb3ue3KjBeO2ovOU9z0wtEfpEkRjWzddX+4UuB4jLrTCcXpu2l7qaqKn
 V4F1Bk5bOivwNmkmYCvcKJftZM8w0nz41Ryti0AoGPyztSqVgsM9WxK9QKv+L4TydWBC0M9
 H3TaI8CODx1VW8nXFu3WqMhnOD77nAzBI0fwMSf4K7+eGKGC2c=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 03/15] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Thu,  1 Dec 2022 22:07:59 +0800
Message-Id: <20221201140811.142123-3-bmeng@tinylab.org>
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
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest build")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 167dc4cca6..1e4b58024f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
 config OPENTITAN
     bool
     select IBEX
+    select SIFIVE_PLIC
     select UNIMP
 
 config SHAKTI_C
-- 
2.34.1


