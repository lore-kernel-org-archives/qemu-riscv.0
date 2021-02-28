Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGK4a-0003Tn-Cn
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4Z-0003SU-5N; Sun, 28 Feb 2021 06:17:15 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4X-0000Xq-Ab; Sun, 28 Feb 2021 06:17:14 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 81E555C00A6;
 Sun, 28 Feb 2021 06:17:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 28 Feb 2021 06:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VFaDZ2B55DCIX
 JWBUH1pw2+DSFlBdVC81Rotn3LfkZI=; b=h1i72mi0WkphXJ0J7qbbc0Dq5tGzw
 enwvqZ3iw7sORO4EnVs/jf3G/OSunWYAv+wa5goXwLWA1wKyhbw4JM/LrvYxKQYR
 nJNWbgMCXAnNtDO30ozq8OQ17fPd9tGpyzOHZ0EcxeDxT+eh5RDkDVs37Tdq0SKY
 oQbVgqVjV9O9xIYxkYmRyt+IG2/wwbcCHP3unJCldrKcbYuzNWxeAouj0w5PNWMs
 yQ0BfakyLOYDOikNsYFhvIQUlfsC1DWWXWz786wIjZD2qZsFJe06FZy7n46NOhx6
 4OamWwoeYN/6cEU/+Qhb4BfJ95wZLzMd4E0dk+0WRngJ9s1DQc25wXSjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VFaDZ2B55DCIXJWBUH1pw2+DSFlBdVC81Rotn3LfkZI=; b=JRjwkajb
 4dpBOW2fzpwPc48h4gf1K+XmUu+7RazAnjw9RA9+r1Iy66P7RAN9G3tob9el03Oy
 GjbwbwP/HVnY7/hB2KimjAEvLo+7HQfb6DaVFWHofASWTCYCV8AAs6JhzfkVLc5H
 RlAFdYaBHO89FV/cyY4UX6VJXGH8D4pVoNJzqo+IeAhIXmppV3JtKwzyCOrP0Ine
 BixWcwqB3VyITErYDIKTQvjBOnI1V3i0rKNgiSpVu3WDwa4Z+KekDLS8K8V9EZNq
 Orlak+58NH563ZaGcJoUtSzMx7m18d8/DEo7RVb/rz3CFAhzec52ZQVzOGbzFWYa
 XYjZcWwXiK0KWA==
X-ME-Sender: <xms:uHs7YO8o6IT8CtCZuo24gQKnf5436d33PZkX4f6a7UbasTP40iTOLg>
 <xme:uHs7YOtD6nGKKSQ0yQHmXylCUO0ATATcJFF91a65MM6AI-gN_uoNmI_1-0bJImtIJ
 -ABonTvrzGtZql60EI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleeigddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehshhgvrhgr
 hhcuvehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtth
 gvrhhnpeduffekffefveetfeefjeegudeghffgteeiteeltddtkedvgeffudeifeegkeet
 feenucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:uHs7YEBlyFd6LL-iRUiA7U6iYEJvYf9hNeh8lWNowLfKPJUWpekkog>
 <xmx:uHs7YGcILofuGNNx8Y3a0kXT15uyScMawC4TkANLq77g3Sh2hMehnA>
 <xmx:uHs7YDPiXTenCRJbg6N8FQ2fweC0Wx6vzXzj88c-CDDdgoUt4O-jYw>
 <xmx:uHs7YO28wp5kbbsXuoJnNSa1NB0yYlTPrnYDei-lbb77UK0lr8bqZA>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC59D1080054;
 Sun, 28 Feb 2021 06:17:09 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v3 1/2] hw/riscv: Add fw_cfg support to virt
Date: Sun, 28 Feb 2021 22:16:56 +1100
Message-Id: <20210228111657.23240-2-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210228111657.23240-1-ashe@kivikakk.ee>
References: <20210228111657.23240-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=ashe@kivikakk.ee;
 helo=out3-smtp.messagingengine.com
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
X-List-Received-Date: Sun, 28 Feb 2021 11:17:15 -0000

Provides fw_cfg for the virt machine on riscv.  This enables
using e.g.  ramfb later.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
---

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
index facb0cbacc..afaa5e58bb 100644
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
index 2299b3a6be..82eff42c37 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -56,6 +56,7 @@ static const struct MemmapEntry {
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
@@ -488,6 +489,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     return dev;
 }
 
+static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
+{
+    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
+    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
+    FWCfgState *fw_cfg;
+    char *nodename;
+
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
+                                  &address_space_memory);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.cpus);
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(s->fdt, nodename);
+    qemu_fdt_setprop_string(s->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(s->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+    return fw_cfg;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = virt_memmap;
@@ -652,6 +675,13 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(s);
+    rom_set_fw(s->fw_cfg);
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..b0ded3fc55 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ struct RISCVVirtState {
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
+    FWCfgState *fw_cfg;
 
     void *fdt;
     int fdt_size;
@@ -54,6 +55,7 @@ enum {
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_FW_CFG,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
-- 
2.20.1


