Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmbWd-0001kB-Pv
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 07:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWa-0001ZC-Hn
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 07:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWU-0005WE-Rr
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 07:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/pCA7skLcr9WEwcKryZbz5+ImrW/pvg5mtnTXT6J9M=;
 b=WNAj9p1pjw/cez0l30hkPAc/SShbOca06jp0d0Fp9FcaptLZSL0/49cwiRYehE+JvkhKMv
 AELss0PVakyHetQHyC/Z/tqXmXBwO9kxjs3VooRpLuneHJSjrzsHgsJdHQJZl1F5gO69VB
 ZY6Vbhx6sfT+LgQg69rf2iDv4NneqcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-jNMhG5HtOUKLuP2_WCbsag-1; Mon, 15 Nov 2021 07:55:42 -0500
X-MC-Unique: jNMhG5HtOUKLuP2_WCbsag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C77A18D6A34;
 Mon, 15 Nov 2021 12:55:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03FE460C7F;
 Mon, 15 Nov 2021 12:55:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D63E11380B8; Mon, 15 Nov 2021 13:55:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 b.galvani@gmail.com, jcd@tribudubois.net, andrew.smirnov@gmail.com,
 sundeep.lkml@gmail.com, hskinnemoen@google.com, kfting@nuvoton.com,
 nieklinnenbank@gmail.com, Andrew.Baumann@microsoft.com, f4bug@amsat.org,
 edgar.iglesias@gmail.com, alistair@alistair23.me, bin.meng@windriver.com,
 palmer@dabbelt.com, atar4qemu@gmail.com, mark.cave-ayland@ilande.co.uk,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Date: Mon, 15 Nov 2021 13:55:36 +0100
Message-Id: <20211115125536.3341681-3-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-1-armbru@redhat.com>
References: <20211115125536.3341681-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 12:55:52 -0000

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Explicit is better than implicit: use drive_get() directly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/sysemu/blockdev.h           |  1 -
 blockdev.c                          | 10 ----------
 hw/arm/aspeed.c                     | 21 +++++++++++++--------
 hw/arm/cubieboard.c                 |  2 +-
 hw/arm/imx25_pdk.c                  |  2 +-
 hw/arm/integratorcp.c               |  2 +-
 hw/arm/mcimx6ul-evk.c               |  2 +-
 hw/arm/mcimx7d-sabre.c              |  2 +-
 hw/arm/msf2-som.c                   |  2 +-
 hw/arm/npcm7xx_boards.c             |  6 +++---
 hw/arm/orangepi.c                   |  2 +-
 hw/arm/raspi.c                      |  2 +-
 hw/arm/realview.c                   |  2 +-
 hw/arm/sabrelite.c                  |  2 +-
 hw/arm/versatilepb.c                |  4 ++--
 hw/arm/vexpress.c                   |  6 +++---
 hw/arm/xilinx_zynq.c                | 16 +++++++++-------
 hw/arm/xlnx-versal-virt.c           |  3 ++-
 hw/arm/xlnx-zcu102.c                |  6 +++---
 hw/microblaze/petalogix_ml605_mmu.c |  2 +-
 hw/misc/sifive_u_otp.c              |  2 +-
 hw/riscv/microchip_pfsoc.c          |  2 +-
 hw/sparc64/niagara.c                |  2 +-
 23 files changed, 49 insertions(+), 52 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..a750f99b79 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -50,7 +50,6 @@ void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
 int drive_get_max_devs(BlockInterfaceType type);
-DriveInfo *drive_get_next(BlockInterfaceType type);
 
 QemuOpts *drive_def(const char *optstr);
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
diff --git a/blockdev.c b/blockdev.c
index b35072644e..0eb2823b1b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -303,16 +303,6 @@ int drive_get_max_bus(BlockInterfaceType type)
     return max_bus;
 }
 
-/* Get a block device.  This should only be used for single-drive devices
-   (e.g. SD/Floppy/MTD).  Multi-disk devices (scsi/ide) should use the
-   appropriate bus.  */
-DriveInfo *drive_get_next(BlockInterfaceType type)
-{
-    static int next_block_unit[IF_COUNT];
-
-    return drive_get(type, 0, next_block_unit[type]++);
-}
-
 static void bdrv_format_print(void *opaque, const char *name)
 {
     qemu_printf(" %s", name);
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a77f46b3ad..cf20ae0db5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -284,12 +284,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
 }
 
 static void aspeed_board_init_flashes(AspeedSMCState *s,
-                                      const char *flashtype)
+                                      const char *flashtype,
+                                      int unit0)
 {
     int i ;
 
     for (i = 0; i < s->num_cs; ++i) {
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
         qemu_irq cs_line;
         DeviceState *dev;
 
@@ -382,10 +383,12 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - machine->ram_size);
     memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
-                              bmc->fmc_model : amc->fmc_model);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], bmc->spi_model ?
-                              bmc->spi_model : amc->spi_model);
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              0);
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              bmc->soc.fmc.num_cs);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
@@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
     }
 
     for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
-        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
+                           drive_get(IF_SD, 0, i));
     }
 
     if (bmc->soc.emmc.num_slots) {
-        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
+                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
     }
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 294ba5de6e..5e3372a3c7 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -81,7 +81,7 @@ static void cubieboard_init(MachineState *machine)
     }
 
     /* Retrieve SD bus */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(a10), "sd-bus");
 
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index bd16acd4d9..6dff000163 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -123,7 +123,7 @@ static void imx25_pdk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->soc.esdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 16e8985953..b109ece3ae 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -649,7 +649,7 @@ static void integratorcp_init(MachineState *machine)
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_WPROT, 0));
     qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDIN, 0));
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 77fae874b1..28b4886f48 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -52,7 +52,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 935d4b0f1c..50a5ecde31 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -52,7 +52,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 396e8b9913..d9f881690e 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -45,7 +45,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     DeviceState *spi_flash;
     MSF2State *soc;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    DriveInfo *dinfo = drive_get(IF_MTD, 0, 0);
     qemu_irq cs_line;
     BusState *spi_bus;
     MemoryRegion *sysmem = get_system_memory();
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae5..d8a49e4e85 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci)
+static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
 {
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, unit);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
 
         BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
@@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
-    sdhci_attach_drive(&soc->mmc.sdhci);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 0cf9895ce7..e796382236 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -85,7 +85,7 @@ static void orangepi_init(MachineState *machine)
     qdev_realize(DEVICE(h3), NULL, &error_abort);
 
     /* Retrieve SD bus */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(h3), "sd-bus");
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 146d35382b..b4dd6c1e99 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -284,7 +284,7 @@ static void raspi_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
     if (bus == NULL) {
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 1c54316ba3..ddc70b54a5 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -237,7 +237,7 @@ static void realview_init(MachineState *machine,
         qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
     qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
     qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 553608e583..cce49aa25c 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -76,7 +76,7 @@ static void sabrelite_init(MachineState *machine)
             if (spi_bus) {
                 DeviceState *flash_dev;
                 qemu_irq cs_line;
-                DriveInfo *dinfo = drive_get_next(IF_MTD);
+                DriveInfo *dinfo = drive_get(IF_MTD, 0, 0);
 
                 flash_dev = qdev_new("sst25vf016b");
                 if (dinfo) {
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 575399c4fc..ecc1f6cf74 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -310,7 +310,7 @@ static void versatile_init(MachineState *machine, int board_id)
     qdev_connect_gpio_out(sysctl, 0, qdev_get_gpio_in(dev, 0));
 
     dev = sysbus_create_varargs("pl181", 0x10005000, sic[22], sic[1], NULL);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
@@ -322,7 +322,7 @@ static void versatile_init(MachineState *machine, int board_id)
     }
 
     dev = sysbus_create_varargs("pl181", 0x1000b000, sic[23], sic[2], NULL);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 1);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58481c0762..966758cf82 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -625,7 +625,7 @@ static void vexpress_common_init(MachineState *machine)
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT));
     qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN));
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
@@ -657,7 +657,7 @@ static void vexpress_common_init(MachineState *machine)
 
     sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
 
-    dinfo = drive_get_next(IF_PFLASH);
+    dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
                                        dinfo);
     if (!pflash0) {
@@ -673,7 +673,7 @@ static void vexpress_common_init(MachineState *machine)
         memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
     }
 
-    dinfo = drive_get_next(IF_PFLASH);
+    dinfo = drive_get(IF_PFLASH, 0, 1);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
         error_report("vexpress: error registering flash 1");
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 69c333e91b..50e7268396 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -125,9 +125,10 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
     sysbus_connect_irq(s, 0, irq);
 }
 
-static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
-                                         bool is_qspi)
+static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
+                                        bool is_qspi, int unit0)
 {
+    int unit = unit0;
     DeviceState *dev;
     SysBusDevice *busdev;
     SSIBus *spi;
@@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
 
         for (j = 0; j < num_ss; ++j) {
-            DriveInfo *dinfo = drive_get_next(IF_MTD);
+            DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);
             flash_dev = qdev_new("n25q128");
             if (dinfo) {
                 qdev_prop_set_drive_err(flash_dev, "drive",
@@ -170,6 +171,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         }
     }
 
+    return unit;
 }
 
 static void zynq_init(MachineState *machine)
@@ -247,9 +249,9 @@ static void zynq_init(MachineState *machine)
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-    zynq_init_spi_flashes(0xE0006000, pic[58-IRQ_OFFSET], false);
-    zynq_init_spi_flashes(0xE0007000, pic[81-IRQ_OFFSET], false);
-    zynq_init_spi_flashes(0xE000D000, pic[51-IRQ_OFFSET], true);
+    n = zynq_init_spi_flashes(0xE0006000, pic[58 - IRQ_OFFSET], false, 0);
+    n = zynq_init_spi_flashes(0xE0007000, pic[81 - IRQ_OFFSET], false, n);
+    n = zynq_init_spi_flashes(0xE000D000, pic[51 - IRQ_OFFSET], true, n);
 
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);
@@ -298,7 +300,7 @@ static void zynq_init(MachineState *machine)
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, n);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         carddev = qdev_new(TYPE_SD_CARD);
         qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d2f55e29b6..0c5edc898e 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -669,7 +669,8 @@ static void versal_virt_init(MachineState *machine)
 
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
+        sd_plugin_card(&s->soc.pmc.iou.sd[i],
+                       drive_get(IF_SD, 0, i));
     }
 
     s->binfo.ram_size = machine->ram_size;
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 3dc2b5e8ca..45eb19ab3b 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -169,7 +169,7 @@ static void xlnx_zcu102_init(MachineState *machine)
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, i);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
         DeviceState *carddev;
         char *bus_name;
@@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
         gchar *bus_name = g_strdup_printf("spi%d", i);
 
         spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
@@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);
         int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
         gchar *bus_name = g_strdup_printf("qspi%d", bus);
 
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 159db6cbe2..a24fadddca 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -183,7 +183,7 @@ petalogix_ml605_init(MachineState *machine)
         spi = (SSIBus *)qdev_get_child_bus(dev, "spi");
 
         for (i = 0; i < NUM_SPI_FLASHES; i++) {
-            DriveInfo *dinfo = drive_get_next(IF_MTD);
+            DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
             qemu_irq cs_line;
 
             dev = qdev_new("n25q128");
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 18aa0bd55d..5d5a8c8a90 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -209,7 +209,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                           TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
-    dinfo = drive_get_next(IF_NONE);
+    dinfo = drive_get(IF_NONE, 0, 0);
     if (dinfo) {
         int ret;
         uint64_t perm;
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 57d779fb55..d1d065efbc 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -458,7 +458,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     target_ulong firmware_end_addr, kernel_start_addr;
     uint64_t kernel_entry;
     uint32_t fdt_load_addr;
-    DriveInfo *dinfo = drive_get_next(IF_SD);
+    DriveInfo *dinfo = drive_get(IF_SD, 0, 0);
 
     /* Sanity check on RAM size */
     if (machine->ram_size < mc->default_ram_size) {
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index f3e42d0326..ccad2c43a3 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -98,7 +98,7 @@ static void add_rom_or_fail(const char *file, const hwaddr addr)
 static void niagara_init(MachineState *machine)
 {
     NiagaraBoardState *s = g_new(NiagaraBoardState, 1);
-    DriveInfo *dinfo = drive_get_next(IF_PFLASH);
+    DriveInfo *dinfo = drive_get(IF_PFLASH, 0, 0);
     MemoryRegion *sysmem = get_system_memory();
 
     /* init CPUs */
-- 
2.31.1


