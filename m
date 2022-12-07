Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHa-0004Li-FU
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHX-0004DA-0q; Wed, 07 Dec 2022 05:04:03 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHT-00054q-Qo; Wed, 07 Dec 2022 05:04:02 -0500
X-QQ-mid: bizesmtp63t1670407423tj85ezu2
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:42 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: 7jw2iSiCazppgmdPBDJvDCrTKnNXsO+M/tblZoUphj52pfso7dXzKD8qdiasG
 CkW0xezf9EIo4Hge6qVBrRMza/QWoUaGGZO8d0hAa1LnQAd4t/6Dbski2UKnpyKHej+L8Rz
 5VtdlL1vIxjT7jynLMlWdNG8copuG7eE+fENS5XNbE8Vr+hcsDXGG5IgojmfyK8mSsXuPjV
 sKM32zGzMaa3bXI7XFBTpoR8w6DJ1SteVEvy0BgwTm0sbtONqRX6dxJT+FMmzbES0EVCU/7
 JkkFYFo0SJza+dPuihtQkTi1QYH58PxQbWC9f+Y0pXHWh7lgaXGC1v3ok50fqoaHHVY7rqS
 Rv/3+me9985jSsshxupogyhQEjTJUM1BRsM7NYEZfvYBjeZ4Ps=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 03/16] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Wed,  7 Dec 2022 18:03:22 +0800
Message-Id: <20221207100335.290481-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
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

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest build")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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



