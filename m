Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN2Ps-00080W-0C
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 19:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Pq-0007y0-9o; Thu, 18 Mar 2021 19:50:58 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Po-00029X-7Y; Thu, 18 Mar 2021 19:50:58 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 60F125C01BB;
 Thu, 18 Mar 2021 19:50:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Mar 2021 19:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=x13jOv6p5ZKtB
 soiPdNatA0i4cn/Vn7K24BQ9Ry81WM=; b=VBXA5g9VyE9OXYlKIyhbX9SzTtQvP
 ULl6+s3KihcJWwGhycpo4Z5iEWlrWndvDQ+ND7RpALZw1oMvl1URSOINUfpiAeFL
 6cxC5pvW459n79trmrz61TcAyJMRD8HMgmENKpydsRgUOLgXCvIvZAl9GC7d1NMZ
 v5BBrO9HcwlXJpDmB12UTMwjppZWEizYE4E70Ln3oNfy6Br+ee/lZ4+qZemEM2EG
 get4k97PaJlre/1NObxwnlxwwVFiHNg5HObOeTlxLUtfJsbxv+ez04AplAqRgVG1
 z+9u5Zx6qxjMZZUU6+1NXDOjzVfwtho3wve5txiFqgUcfySlo39/Yea3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=x13jOv6p5ZKtBsoiPdNatA0i4cn/Vn7K24BQ9Ry81WM=; b=JC3DZ+Fw
 W0gkF3RoUJEmLEXqdCBv3X8EHDXU+DQBpeOo4apmNOAhCj1uo5Z7gOomV3rCMWyJ
 /ulX7M+GR66GPFO6nKxsfwpOeg36sJ6QCo1C2su0whwqN1MZ+9C+XZvnVV9+RPmE
 AK7j8+662wB+dVHovvmBWPJ+c+wHQBs7l/A0ipAMLOkUCHDK8NsSaYv5/rOTt7up
 O1HAPxWEqxAMB5K6vNqNWQRWCE8p9dgf3M6r8p9h3lmBXjZ4MIfRHBYKkLka8uBn
 IfS3+5kiD/WqLWDdUZCYcC1YytEpSu3Zla8PRwTGVX+4xuEilO1Nt8FKsp3jucGS
 Qmu3ECDt+ry4mg==
X-ME-Sender: <xms:X-dTYFxxet7pOr7uFLmzWndYjWIaboXFtmL6Yblq0132BG30zYHCng>
 <xme:X-dTYFQIwUyn2LnJNxqMr3oMYH_N5S1j0fb-FfEWGvTh-kU22gQn5tIQjmMDD88Xt
 e7SqWkh6xeMA6v7Mww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetshhhvghr
 rghhucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgrkhhkrdgvvgeqnecuggftrfgrth
 htvghrnhepudffkefffeevteeffeejgedugefhgfetieetledttdekvdegffduieefgeek
 teefnecukfhppeduudelrddukedrfedurddufeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghshhgvsehkihhvihhkrghkkhdrvggv
X-ME-Proxy: <xmx:X-dTYPVbfJhl-Bz9WO5f0kGgpvUPJqSVwIqWegsuVER3p-gqIedW9g>
 <xmx:X-dTYHixUChKFbvAH_Zht4hAe-rLfMopJumd1W8vFisvK-_d6jb40Q>
 <xmx:X-dTYHAksZDSsd6tcLXHAhpQBk3TA4PbwHcuVuCfG1wnykLpNKVelQ>
 <xmx:X-dTYC7pelPkS8vmYkFKV5VfW9BaGxqCiVqJgNkE6VmpSfDHuOTLMg>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A81F1080066;
 Thu, 18 Mar 2021 19:50:52 -0400 (EDT)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v4 1/2] hw/riscv: Add fw_cfg support to virt
Date: Fri, 19 Mar 2021 10:50:40 +1100
Message-Id: <20210318235041.17175-2-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318235041.17175-1-ashe@kivikakk.ee>
References: <20210318235041.17175-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=ashe@kivikakk.ee;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Mar 2021 23:50:58 -0000

Provides fw_cfg for the virt machine on riscv.  This enables
using e.g.  ramfb later.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v4:
* Adapt for changes made in c65d7080d8 "hw/riscv: migrate fdt field to
  generic MachineState".

Changes in v3:
* Document why fw_cfg is done when it is.
* Move VIRT_FW_CFG before VIRT_FLASH.

Changes in v2:
* Add DMA support (needed for writes).

 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d139074b02..1de18cdcf1 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -33,6 +33,7 @@ config RISCV_VIRT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
+    select FW_CFG_DMA
 
 config SIFIVE_E
     bool
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0b39101a5e..e96ec4cbbc 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -53,6 +53,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
@@ -507,6 +508,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     return dev;
 }
 
+static FWCfgState *create_fw_cfg(const MachineState *mc)
+{
+    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
+    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
+    FWCfgState *fw_cfg;
+    char *nodename;
+
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
+                                  &address_space_memory);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(mc->fdt, nodename);
+    qemu_fdt_setprop_string(mc->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+    return fw_cfg;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
@@ -688,6 +711,13 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 632da52018..349fee1f89 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ struct RISCVVirtState {
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
+    FWCfgState *fw_cfg;
 
     int fdt_size;
 };
@@ -53,6 +54,7 @@ enum {
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_FW_CFG,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
-- 
2.20.1


