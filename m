Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2vZy-00057f-Cr
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 07:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZw-00054T-Fa; Fri, 22 Jan 2021 07:30:16 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZu-0003Tw-AH; Fri, 22 Jan 2021 07:30:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id n10so3570516pgl.10;
 Fri, 22 Jan 2021 04:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HFu8/tUmzk0nZabDDiD7Luh0K5cxadMIt8Xz03JvXiM=;
 b=mTRrVXhR4oQW7jsbqq1HK+LyZMjcgV/YDdfqDQtuDfEISBWT20r9W/+f68n4zulN3n
 FGvkquwpLRK/sT4Gyd20m6Nqu650+DmcCicSrQUR7hHPmzYPL8E7uOaPLxAp1erQ/q56
 WxTMTCsYKEA/AxMqRa4fhcFlly1LFcRovDKEWc9VTbFqiMh6sXd5h4UZRb2DW89VSQSq
 7GHEjIP2HBhH9tB9AaJLABHoEQFw9wAMsGg+vzeXb76QluvgEXxaNcOKjccfUlFuowfm
 XiCI1qUvf7pnhayqyiaR28Lwr/rveqrCAgC9R26WJTD0Qju4hqggjlqLOY3D1w7oEED8
 Wvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFu8/tUmzk0nZabDDiD7Luh0K5cxadMIt8Xz03JvXiM=;
 b=QfANdXjJhdc1fqe707e8ECHR5c6CHiDWg7vFbE7v65m0zNu7+W+gQwfguYzDaxZbx+
 /fsX/kHVHxi9j188+hCAocukX9qWoIkNfL7JQxLsllV398mpFAwMyciUu+TfLHg7jzlg
 HuUZM6pZisev6f+ARXVsbEUZDw8lNJiUsIUZM2AbsBseCsJp/88BWZEnAIiaZZKLx01/
 6vHkkoePHd6mJ3GGXvwqkvLdYn0Z5ZX6a2GsSQ93fnm+sha94U3QsoHJ/W6CPWnlMqLd
 m4mSVd/u9YK8xmzQcc7yO7usLRdkim5TDIWgoXHQt+vT3/Q23SPqOkmVkz1KOmCgmxn3
 +2Ug==
X-Gm-Message-State: AOAM532u+x571uGDEzGMH4nq/zMCG6ft1iopBWKCBL51hR/3uaMu2UKf
 weVA7oYXZ6GUeVipV1meElM=
X-Google-Smtp-Source: ABdhPJzhtQ/o5U4zCFucSumPyPVeyFzYqHMUXBpLX4N0EHfCunOJkz+OoPld9FQbHsv98LFmWSSipA==
X-Received: by 2002:a63:e24a:: with SMTP id y10mr4388200pgj.413.1611318612490; 
 Fri, 22 Jan 2021 04:30:12 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 6sm7894996pfd.212.2021.01.22.04.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:30:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/4] hw/riscv: Drop 'struct MemmapEntry'
Date: Fri, 22 Jan 2021 20:29:55 +0800
Message-Id: <20210122122958.12311-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122122958.12311-1-bmeng.cn@gmail.com>
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jan 2021 12:30:16 -0000

From: Bin Meng <bin.meng@windriver.com>

There is already a MemMapEntry type defined in hwaddr.h. Let's drop
the RISC-V defined `struct MemmapEntry` and use the existing one.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/microchip_pfsoc.c |  9 +++------
 hw/riscv/opentitan.c       |  9 +++------
 hw/riscv/sifive_e.c        |  9 +++------
 hw/riscv/sifive_u.c        | 11 ++++-------
 hw/riscv/spike.c           |  9 +++------
 hw/riscv/virt.c            |  9 +++------
 6 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e952b49e8c..266f1c3342 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -86,10 +86,7 @@
  *   - Register Map/PF_SoC_RegMap_V1_1/MPFS250T/mpfs250t_ioscb_memmap_dri.htm
  *     describes the complete IOSCB modules memory maps
  */
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} microchip_pfsoc_memmap[] = {
+static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_RSVD0] =           {        0x0,      0x100 },
     [MICROCHIP_PFSOC_DEBUG] =           {      0x100,      0xf00 },
     [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,     0x2000 },
@@ -182,7 +179,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
-    const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
+    const MemMapEntry *memmap = microchip_pfsoc_memmap;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *rsvd0_mem = g_new(MemoryRegion, 1);
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
@@ -451,7 +448,7 @@ type_init(microchip_pfsoc_soc_register_types)
 static void microchip_icicle_kit_machine_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
+    const MemMapEntry *memmap = microchip_pfsoc_memmap;
     MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mem_low = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index af3456932f..e168bffe69 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -28,10 +28,7 @@
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} ibex_memmap[] = {
+static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
     [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
@@ -66,7 +63,7 @@ static const struct MemmapEntry {
 
 static void opentitan_board_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = ibex_memmap;
+    const MemMapEntry *memmap = ibex_memmap;
     OpenTitanState *s = g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
@@ -114,7 +111,7 @@ static void lowrisc_ibex_soc_init(Object *obj)
 
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 {
-    const struct MemmapEntry *memmap = ibex_memmap;
+    const MemMapEntry *memmap = ibex_memmap;
     MachineState *ms = MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem = get_system_memory();
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 59bac4cc9a..f939bcf9ea 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -50,10 +50,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} sifive_e_memmap[] = {
+static MemMapEntry sifive_e_memmap[] = {
     [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
     [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
     [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
@@ -77,7 +74,7 @@ static const struct MemmapEntry {
 
 static void sifive_e_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = sifive_e_memmap;
+    const MemMapEntry *memmap = sifive_e_memmap;
 
     SiFiveEState *s = RISCV_E_MACHINE(machine);
     MemoryRegion *sys_mem = get_system_memory();
@@ -187,7 +184,7 @@ static void sifive_e_soc_init(Object *obj)
 static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    const struct MemmapEntry *memmap = sifive_e_memmap;
+    const MemMapEntry *memmap = sifive_e_memmap;
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 59b61cea01..51e4132fc4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -60,10 +60,7 @@
 
 #include <libfdt.h>
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} sifive_u_memmap[] = {
+static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
     [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
     [SIFIVE_U_DEV_CLINT] =    {  0x2000000,    0x10000 },
@@ -86,7 +83,7 @@ static const struct MemmapEntry {
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
-static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -428,7 +425,7 @@ static void sifive_u_machine_reset(void *opaque, int n, int level)
 
 static void sifive_u_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
@@ -686,7 +683,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 56986ecfe0..ed4ca9808e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -43,16 +43,13 @@
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} spike_memmap[] = {
+static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
 
-static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
@@ -179,7 +176,7 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
 
 static void spike_board_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = spike_memmap;
+    const MemMapEntry *memmap = spike_memmap;
     SpikeState *s = SPIKE_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..cfd52bc59b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,10 +43,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} virt_memmap[] = {
+static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
     [VIRT_TEST] =        {   0x100000,        0x1000 },
@@ -170,7 +167,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
                            0x1800, 0, 0, 0x7);
 }
 
-static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
@@ -490,7 +487,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
 
 static void virt_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = virt_memmap;
+    const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
-- 
2.25.1


