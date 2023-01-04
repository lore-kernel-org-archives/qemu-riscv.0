Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBu5-0001Il-UK
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtv-00019I-GU
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:23 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBts-0005ca-7f
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id kw15so85845792ejc.10
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHv6Wehw0g+45GGNmqAyiTzJjY7rKpnoc/CB10RjduA=;
 b=YXqVHRuRauV2FTHspnWhI7PYHTyp0b6ghk3RspSmeTEuENEJqSVmXR4haMbyMJbxEL
 TDsqLx61IKKuI+nPtwOwYC3CkC6zMczqRYEDfwPtmc6+0vIpxL5o4lHqv1xsq1Y8if96
 5XTLBhr5Goe9C3LjfZ9CxYPp1AS4inL/JCc9xEUwJC/RwqnGB210wgdumbcODEhNZwbj
 3V4kFlxysHZJMF3zV2nWpNOKNyA0U6GO6iY/aedMHqbqA0Ocq6bD7/GVoruh3b9w2jyy
 4i+GZZgJJ6vHW9+g1AwEghIa7uVpdXGLmjZK7+mhceNnDY/Qe8Fo7rNN1N09KcelsGcS
 4xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHv6Wehw0g+45GGNmqAyiTzJjY7rKpnoc/CB10RjduA=;
 b=nRjeX/vQi9nRG7CSIg+Mu2qapxOtS2R4GmAEeFhQFayhk1PF30fjR2FwEd34mt468X
 hs92ySRjQI+cTTE7SEoGbgdhRDR+ftvACauz4SaEOAmSLeq4D9lIGt5zNZkOKbWh2PWX
 64/CAGRMwaGCJLxMBiLd6CwGIKX415CSngLqjd02/5tKz6YpvYBoSjTC7qCEimfqFnOW
 DabcLvqUy4l7EU1mguV7uysmngBEe4GBGxWEZYYdPrQoSYR142ZhIB1Hx0SQMr+MAfkg
 I7xtCwZyRH/29AbwY97xq8SYFUJL4+fDi3wU09AR4/ebOpCI3jx0T3ByElAa0O25UMtU
 sLHg==
X-Gm-Message-State: AFqh2koP2p5MrWBvaGe26J8/O32Xu9w3gkpoRflknVwvU3pqoGVCQebf
 aBc8ssBrwrS+q4f2jKgidSW+Lw==
X-Google-Smtp-Source: AMrXdXuXXaV8YLVZZ+aVLTVjG53pmj4E+cu1/MPnhTlzQD4K6vtc7W/t/doGkw+IvQs3dowqa2rmtA==
X-Received: by 2002:a17:907:d50e:b0:7b1:316c:38f5 with SMTP id
 wb14-20020a170907d50e00b007b1316c38f5mr43308789ejc.30.1672869978920; 
 Wed, 04 Jan 2023 14:06:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15736366ejb.86.2023.01.04.14.06.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 10/20] hw/arm: Open-code pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:39 +0100
Message-Id: <20230104220449.41337-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 04 Jan 2023 22:06:23 -0000

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi01_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c      | 15 +++++++++------
 hw/arm/gumstix.c     | 19 +++++++++++++------
 hw/arm/mainstone.c   | 13 ++++++++-----
 hw/arm/omap_sx1.c    | 22 ++++++++++++++--------
 hw/arm/versatilepb.c | 13 ++++++++-----
 hw/arm/z2.c          | 10 +++++++---
 6 files changed, 59 insertions(+), 33 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e2793..1fbb1a5773 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -39,6 +39,7 @@ static void collie_init(MachineState *machine)
     DriveInfo *dinfo;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     CollieMachineState *cms = COLLIE_MACHINE(machine);
+    DeviceState *dev;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -52,14 +53,16 @@ static void collie_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    dev = pflash_cfi01_create("collie.fl1", 0x02000000,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, SA_CS0);
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", 0x02000000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    dev = pflash_cfi01_create("collie.fl2", 0x02000000,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, SA_CS1);
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c4..7b80a7d0a4 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -40,6 +40,7 @@
 #include "net/net.h"
 #include "hw/block/flash.h"
 #include "hw/net/smc91c111.h"
+#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
@@ -51,6 +52,7 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t connex_rom = 0x01000000;
@@ -65,12 +67,14 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
+    dev = pflash_cfi01_create("connext.rom", connex_rom,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              sector_len, 2, 0, 0, 0, 0, 0);
+    if (!dev) {
         error_report("Error registering flash memory");
         exit(1);
     }
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -81,6 +85,7 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
+    DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t verdex_rom = 0x02000000;
@@ -95,12 +100,14 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, 0)) {
+    dev = pflash_cfi01_create("verdex.rom", verdex_rom,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              sector_len, 2, 0, 0, 0, 0, 0);
+    if (!dev) {
         error_report("Error registering flash memory");
         exit(1);
     }
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 8454b65458..ac34be3709 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -129,15 +129,18 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
 
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
+        DeviceState *dev;
+
         dinfo = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_cfi01_register(mainstone_flash_base[i],
-                                   i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH,
-                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, 0)) {
+        dev = pflash_cfi01_create(i ? "mainstone.flash1" : "mainstone.flash0",
+                                  MAINSTONE_FLASH,
+                                  dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                                  sector_len, 4, 0, 0, 0, 0, 0);
+        if (!dev) {
             error_report("Error registering flash memory");
             exit(1);
         }
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, mainstone_flash_base[i]);
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b3744..718e50c062 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -30,6 +30,7 @@
 #include "ui/console.h"
 #include "hw/arm/omap.h"
 #include "hw/boards.h"
+#include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "sysemu/qtest.h"
@@ -114,6 +115,7 @@ static void sx1_init(MachineState *machine, const int version)
     DriveInfo *dinfo;
     int fl_idx;
     uint32_t flash_size = flash0_size;
+    DeviceState *dev;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -153,10 +155,12 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        if (!pflash_cfi01_register(OMAP_CS0_BASE,
-                                   "omap_sx1.flash0-1", flash_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+        dev = pflash_cfi01_create("omap_sx1.flash0-1", flash_size,
+                                  blk_by_legacy_dinfo(dinfo),
+                                  sector_size, 4, 0, 0, 0, 0, 0);
+        if (dev) {
+            sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, OMAP_CS0_BASE);
+        } else {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -175,10 +179,12 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + flash1_size, &cs[1]);
 
-        if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", flash1_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+        dev = pflash_cfi01_create("omap_sx1.flash1-1", flash1_size,
+                                  blk_by_legacy_dinfo(dinfo),
+                                  sector_size, 4, 0, 0, 0, 0, 0);
+        if (dev) {
+            sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, OMAP_CS1_BASE);
+        } else {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74..c5c7cf6dde 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -385,11 +385,14 @@ static void versatile_init(MachineState *machine, int board_id)
     /* 0x34000000 NOR Flash */
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
-                          VERSATILE_FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          VERSATILE_FLASH_SECT_SIZE,
-                          4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
+    dev = pflash_cfi01_create("versatile.flash",
+                              VERSATILE_FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              VERSATILE_FLASH_SECT_SIZE,
+                              4, 0x0089, 0x0018, 0x0000, 0x0, 0);
+    if (dev) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, VERSATILE_FLASH_ADDR);
+    } else {
         fprintf(stderr, "qemu: Error registering flash memory.\n");
     }
 
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c1e876207..d28d75aa0f 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -18,6 +18,7 @@
 #include "hw/irq.h"
 #include "hw/ssi/ssi.h"
 #include "migration/vmstate.h"
+#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
 #include "ui/console.h"
@@ -306,17 +307,20 @@ static void z2_init(MachineState *machine)
     void *z2_lcd;
     I2CBus *bus;
     DeviceState *wm;
+    DeviceState *dev;
 
     /* Setup CPU & memory */
     mpu = pxa270_init(address_space_mem, z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 4, 0, 0, 0, 0, 0)) {
+    dev = pflash_cfi01_create("z2.flash0", Z2_FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              sector_len, 4, 0, 0, 0, 0, 0);
+    if (!dev) {
         error_report("Error registering flash memory");
         exit(1);
     }
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, Z2_FLASH_BASE);
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
-- 
2.38.1


