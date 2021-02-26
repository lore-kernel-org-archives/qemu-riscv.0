Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFUDr-0005u4-Mu
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDn-0005pP-OG; Thu, 25 Feb 2021 22:55:19 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDl-0001Hn-RO; Thu, 25 Feb 2021 22:55:19 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DCE7B5C00CE;
 Thu, 25 Feb 2021 22:55:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Feb 2021 22:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=g4HwZeBfG5usW
 h4rIhXdB6PckL/Z72B+1ri+WPf0R5Q=; b=ntKDvWpkQ7yc1T4sFYjo8Yu209go/
 mtervhnwbZwq+furlAYMFuS8MQv0+krhJDL55KPGrgHN9DiMJ9qJgh92hE400fuR
 rwWHCJk9DSZWWDg+lmDylQB08Y2vEqK5KZyTiM/BF8+cwztubvZPOW2ql7ovicSt
 lHmxxNrYMiMev9AulHqKHtjYFlS5rgNJZ2ffInsA4O21j7hUh+9gZAA+Ydni62c5
 64Mjp6fAi9K7b4igrDqrWD3eKwxljDQxisTtdHYwhCSDE81DuDdLRcfiJKDYDDsh
 gAns18Y0DL6O2KuCjOdIADbaCYGFUyrFG+i4hjcFmVogqydF8VyYUCyEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=g4HwZeBfG5usWh4rIhXdB6PckL/Z72B+1ri+WPf0R5Q=; b=kpsL/Htu
 +FznK2+jBuZPT9srWW+x7xYmQPfw30uc7/VFAkkXwUhn00FRBPmXaAZAHpI/q3t6
 HZcQfKmnnjt/5+rgq/TV8b5woZODW5fi5s+jl9iETe0pov7a3TJOGym+lchqD2le
 Prd9rRpDcyumBcEYjOI6GGvDNWcdy3rhGRzthjPvtHWRAAbTX3+qOIMhmN9rDQVF
 X1Z0m/b61QJyPw8aYIdfUecR+zbXV6mrmVjoE4dO98MCfNjC00X6ImtCxB1ZIlNy
 OeM0v0aREgYfyKYTADd2lpDzQMv4hNvoY8xkAG1SPFnHcn+9Zv1I7Y+1PwrG6/IQ
 WggZfplDRQHYFw==
X-ME-Sender: <xms:JHE4YD6jkLBs-n4hrAG1KTKPxloLGtBhtT_RimrM6PgXM0ZzD-4OXg>
 <xme:JHE4YPywyMvWtVKMEegk7-H6YFReGwczrWpHwDbOZE-yZaUs-1HcoVgn5DSJ0R5La
 mko66TXLaVmCUkfw2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehshhgvrhgr
 hhcuvehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtth
 gvrhhnpeduffekffefveetfeefjeegudeghffgteeiteeltddtkedvgeffudeifeegkeet
 feenucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:JHE4YHZEV86bYeUdvD1YzSpFygSZZQ0jje0YubeSBF6YF3ZsdjH4xQ>
 <xmx:JHE4YBQ0RSFTcXnS_C4j4kRr5366jJ8xsWgFAlsp6O9bO4alwte6VA>
 <xmx:JHE4YBzl3xRbnZkfP2u_XKeqSotq2N4gFUcjnlhVX-Pf4Rcu733ovw>
 <xmx:JHE4YKXYYtv597nhAcP0YqAC4JXbD-vjMEJvjuxeeYiXAeooD2GGtQ>
Received: from localhost.localdomain
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE24E1080064;
 Thu, 25 Feb 2021 22:55:14 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v2 1/2] hw/riscv: Add fw_cfg support to virt
Date: Fri, 26 Feb 2021 14:54:46 +1100
Message-Id: <20210226035447.1252-2-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210226035447.1252-1-ashe@kivikakk.ee>
References: <20210226035447.1252-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=ashe@kivikakk.ee;
 helo=out5-smtp.messagingengine.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:55:20 -0000

Provides fw_cfg for the virt machine on riscv.  This enables
using e.g.  ramfb later.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
---

Changes in v2:
* Add DMA support (needed for writes).

 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 27 +++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  4 +++-
 3 files changed, 31 insertions(+), 1 deletion(-)

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
index 2299b3a6be..a10f218c43 100644
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
@@ -652,6 +675,10 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /* init fw_cfg */
+    s->fw_cfg = create_fw_cfg(s);
+    rom_set_fw(s->fw_cfg);
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..3b81a2e3f6 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ struct RISCVVirtState {
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
+    FWCfgState *fw_cfg;
 
     void *fdt;
     int fdt_size;
@@ -58,7 +59,8 @@ enum {
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
-    VIRT_PCIE_ECAM
+    VIRT_PCIE_ECAM,
+    VIRT_FW_CFG
 };
 
 enum {
-- 
2.24.3 (Apple Git-128)


