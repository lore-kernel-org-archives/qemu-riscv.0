Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFC-0008F1-Db
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF6-00089t-Ik; Thu, 01 Dec 2022 09:08:48 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-0008D0-JQ; Thu, 01 Dec 2022 09:08:48 -0500
X-QQ-mid: bizesmtp72t1669903713tp90yulj
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:32 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: /rrU+puPB7QnMEvg8moblnERhoszt5L9o/IAJREUSCWcNM2kGuMw7EWaxFQLD
 1xk+c7v/EX85OcnighwLGaP+UKReVNwpUcsAC1bXvoaeVNIq9c2sHUSL+dHkSJiHZ+HBF21
 u3N/hOfF9StPmitCXdIaEA1uSfVoUkuTLDwsTnzkADiJaZpuwKcsO08v5UMJaWYbIcWOcvJ
 uMh1H1NA9XxuUphVQYdNjhyV22GZ/BkTXeI5VNo44AXFHHsqJZH2NAW4lkfDKAmzpFHi4qi
 BgcvEvYrJzalZox3UChBzeYJXQNebyyYnvjJQz2iltxQNf6HhDyfMwFRezj5HfY1H0APkl/
 Sq+yIj4rU/p+VAC2xWgxWoRGotei8Z93kbUL1v6GyIuv1rzxfw=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 09/15] hw/riscv: microchip_pfsoc: Fix the number of interrupt
 sources of PLIC
Date: Thu,  1 Dec 2022 22:08:05 +0800
Message-Id: <20221201140811.142123-9-bmeng@tinylab.org>
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:49 -0000

Per chapter 6.5.2 in [1], the number of interupt sources including
interrupt source 0 should be 187.

[1] PolarFire SoC MSS TRM:
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Technical_Reference_Manual_VC.pdf

Fixes: 56f6e31e7b7e ("hw/riscv: Initial support for Microchip PolarFire SoC Icicle Kit board")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/riscv/microchip_pfsoc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index a757b240e0..9720bac2d5 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -150,7 +150,7 @@ enum {
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
 #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
 
-#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
+#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
 #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
-- 
2.34.1


