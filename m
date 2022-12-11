Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4Cpe-0003eT-2v
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpZ-0003Zy-4h; Sat, 10 Dec 2022 22:16:45 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpX-0000Gr-4R; Sat, 10 Dec 2022 22:16:44 -0500
X-QQ-mid: bizesmtp68t1670728145t527c6ec
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:09:04 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: jXjag1m6xl4y/hPcg2G9182G4RzQrQHr4Ch+7KbZN7BPyydt5MDu/zOXpg8lI
 8rDaSt37HLWsN2qoXMd+duyeExuvN5qlFlUcoLOUOsVNbUDRa3FT63xG8DBfYCkSNunMds9
 Ep4zGiik03ArSZry4YcIr5+JJ2vl0WGRkSkXRuG90F3Z0N2t1+gIrodjw8gnyv64M823dMD
 N8HoCSOOkbQj47eUu3xf/muFPhW6hlW3COs4rqsDQ3pZXm5WI3Syjyh1hfPzJB+mK0s1uT/
 104IF4XHuw1uBjB7mRmnOQXEjf34q8Mj8cQJJPVKTOhzJQgT0elTB29oSNzUxWsgNNNkrBj
 GcHdpQlPxz8m79j3x7ycvZ+Ma82PhTAuLWC+YxzMu2dKQe36Lc=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 13/16] hw/riscv: virt: Fix the value of "riscv,
 ndev" in the dtb
Date: Sun, 11 Dec 2022 11:08:26 +0800
Message-Id: <20221211030829.802437-13-bmeng@tinylab.org>
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:46 -0000

Commit 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")
changed the value of VIRT_IRQCHIP_NUM_SOURCES from 127 to 53, which
is VIRTIO_NDEV and also used as the value of "riscv,ndev" property
in the dtb. Unfortunately this is wrong as VIRT_IRQCHIP_NUM_SOURCES
should include interrupt source 0 but "riscv,ndev" does not.

While we are here, we also fix the comments of platform bus irq range
which is now "64 to 96", but should be "64 to 95", introduced since
commit 1832b7cb3f64 ("hw/riscv: virt: Create a platform bus").

Fixes: 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/riscv/virt.h | 5 ++---
 hw/riscv/virt.c         | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 62513e075c..e1ce0048af 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -87,14 +87,13 @@ enum {
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 96 */
-    VIRTIO_NDEV = 96 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 95 */
 };
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
 #define VIRT_IRQCHIP_NUM_MSIS 255
-#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
+#define VIRT_IRQCHIP_NUM_SOURCES 96
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6cf9355b99..94ff2a1584 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -468,7 +468,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
+                          VIRT_IRQCHIP_NUM_SOURCES - 1);
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
-- 
2.34.1


