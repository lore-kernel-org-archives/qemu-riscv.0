Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHx-0004eq-B4
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHu-0004bq-IL; Wed, 07 Dec 2022 05:04:27 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHp-0005un-7B; Wed, 07 Dec 2022 05:04:26 -0500
X-QQ-mid: bizesmtp63t1670407443tc0c75sd
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:04:02 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: SFhf6fKhx/8bidPvRp79T99EnDb85XTej85qhf2V9VXu/fNbbqUVXPFcwIBPj
 w/4kW/meWIKy6ucvvAmK1GnTO22qpQduXySxYT0XFIK3nGAPqZ/fvt1tn2xIMmwH+UGtqvh
 LFIJL80J7IjdWDewHAt6BQCKnc1JYUqdESOM2fdhglMnsA6lkvIEJ5wvsj2bCPmeIQThd9A
 i8tLBR7WXBkcQqTa6dh5OTFKFZ8U0+WxBApvqV71wJiOYyc3Ij563LKP980Ck8nOsVz67WS
 ygGD5ZOfcOhcL+414vn6HcMN597E30nE9oTenEYRwltT7FOV2co80mq93ntWd0zkj4tbLkI
 bR4ikgvKY6VpHC9ncURAi15cadBlyBY4551TdDKMPAN1lM/QzdWn7Yw8fMSNg==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 10/16] hw/riscv: microchip_pfsoc: Fix the number of
 interrupt sources of PLIC
Date: Wed,  7 Dec 2022 18:03:29 +0800
Message-Id: <20221207100335.290481-10-bmeng@tinylab.org>
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:28 -0000

Per chapter 6.5.2 in [1], the number of interupt sources including
interrupt source 0 should be 187.

[1] PolarFire SoC MSS TRM:
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Technical_Reference_Manual_VC.pdf

Fixes: 56f6e31e7b7e ("hw/riscv: Initial support for Microchip PolarFire SoC Icicle Kit board")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 include/hw/riscv/microchip_pfsoc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 69a686b54a..577efad0c4 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -153,7 +153,7 @@ enum {
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
 #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
 
-#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
+#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
 #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
-- 
2.34.1


