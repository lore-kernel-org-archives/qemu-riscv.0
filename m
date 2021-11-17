Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnNtR-0003rk-Tq
	for mharc-qemu-riscv@gnu.org; Wed, 17 Nov 2021 11:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtJ-0003WJ-S6
 for qemu-riscv@nongnu.org; Wed, 17 Nov 2021 11:34:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtD-00088n-I9
 for qemu-riscv@nongnu.org; Wed, 17 Nov 2021 11:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nv7xEc0r9K+UFSB/+bjTC9hP1s8f7mZ1TvPS4t1YCmc=;
 b=eRtR3v/Gk50+JJTgpAtGZYiEaMqnO1IHFGAzZI88UfOTgfX+7ATUba+ZxM6uiENNWFpJ8o
 wKiZi94lbpUJhfAm4QaCrJVBGk00i8QHAK/MqlDPPFPvofLyBTEcfWJgbvGxgZxYS/fWhv
 JC1b/443ETOMLg12hkzeFHM1Y0m1Tc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-yzX-l9IxOD2U8Tr0TBfI3w-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: yzX-l9IxOD2U8Tr0TBfI3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A324810168C0;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0811A179B3;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A80211380B8; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 02/13] hw: Replace trivial drive_get_next() by drive_get()
Date: Wed, 17 Nov 2021 17:33:58 +0100
Message-Id: <20211117163409.3587705-3-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
X-List-Received-Date: Wed, 17 Nov 2021 16:34:36 -0000

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

A number of machines connect just one backend with drive_get_next().
Change them to use drive_get() directly.  This makes the (zero) unit
number explicit in the code.

Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/cubieboard.c        | 2 +-
 hw/arm/integratorcp.c      | 2 +-
 hw/arm/msf2-som.c          | 2 +-
 hw/arm/orangepi.c          | 2 +-
 hw/arm/raspi.c             | 2 +-
 hw/arm/realview.c          | 2 +-
 hw/arm/sabrelite.c         | 2 +-
 hw/misc/sifive_u_otp.c     | 2 +-
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 hw/sparc64/niagara.c       | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

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
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a4ecadaf12..aa74e67889 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -672,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Connect an SPI flash to SPI0 */
     flash_dev = qdev_new("is25wp256");
-    dinfo = drive_get_next(IF_MTD);
+    dinfo = drive_get(IF_MTD, 0, 0);
     if (dinfo) {
         qdev_prop_set_drive_err(flash_dev, "drive",
                                 blk_by_legacy_dinfo(dinfo),
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


