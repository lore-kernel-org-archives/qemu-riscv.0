Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFF-0008H4-UP
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFC-0008FE-G5; Thu, 01 Dec 2022 09:08:54 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFA-0008EV-GM; Thu, 01 Dec 2022 09:08:54 -0500
X-QQ-mid: bizesmtp72t1669903720t5p1cc9u
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:39 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: oGOjGSUjcuBhlTi/fePYdBfOQ1Ad5AYxlrq264TLF4qygLJZBXQlO+8InmazZ
 sL/YBHsBkaqd3oYmTCYhwBQI93k6PCYoQIB9PocFKO7tCxswOVe70BrIcAUf36Bd4kyimIk
 /I4FbB0QN7TaNI2W3eU0CyZ/uk++k+k9XULQGOQinB26OF/ejdvIhuZqvrLoKMkGr8soOyH
 EZ78lxb/un8wXIOCBlxm7bm+H5R2dd9wx/pB35hkCfHQlvmbmwyJHADGLBlJ4AbuT+INpBT
 7l+oeqbKdwI51TTf2eplpO9VtTd4fK7PaPKJ8x/JK3oMIL4meEtKjDQyfm4358IoLfVnh6i
 0COFFx9AEIfgWzomPF6sRV+xoPDgJ6sPmJHy/+wnl56r9unZnc=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 12/15] hw/riscv: virt: Fix the value of "riscv,
 ndev" in the dtb
Date: Thu,  1 Dec 2022 22:08:08 +0800
Message-Id: <20221201140811.142123-12-bmeng@tinylab.org>
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
X-List-Received-Date: Thu, 01 Dec 2022 14:08:55 -0000

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
---

 include/hw/riscv/virt.h | 5 ++---
 hw/riscv/virt.c         | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f..7c23aea4a0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -87,15 +87,14 @@ enum {
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 96 */
-    VIRTIO_NDEV = 96 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 95 */
 };
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
 #define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
-#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
+#define VIRT_IRQCHIP_NUM_SOURCES 96
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..c4ee489a80 100644
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


