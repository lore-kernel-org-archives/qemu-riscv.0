Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD7sX-0000H3-Lm
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sV-0000CQ-CT; Fri, 19 Feb 2021 10:39:35 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sT-0008NC-4L; Fri, 19 Feb 2021 10:39:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id s11so10687802edd.5;
 Fri, 19 Feb 2021 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6/N7irNLGiWvStxDpMpN01vsIaBwaRHYvGzLGmNrs8=;
 b=ZK1mDzKegkT2GrczXVdffqxh/V9pfVDMokWnXbo3WI7AklrHCuaOhdnA/f96c0FiHY
 XpwDrausSW2aixxd0vQ4nEvliUpxAfJnmd4/ELH0TJeI+8kAcLtSnpf41RLUEVO0Tmlj
 y+8qUJy0FfOPAA6T+/ZdB53q8iTRE43MUBz41g/8vCjqPZNhTUv+xvj3Y0rOvZ+UZxBG
 D38PIuHmGXHOcDlNbdO8Jd63Bj03M9CQJIzIaS19gIH8P46af91qCFVJ2h2EJGHHQilu
 MAUQeOL61dzPZad8qfPS4mIEoWsyavHJ8+ilkPK2tLEGTu1twC0AmkiY2C73oX4f1VYV
 TFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6/N7irNLGiWvStxDpMpN01vsIaBwaRHYvGzLGmNrs8=;
 b=IT4GJP9ObAPZYma62FeMR2T2frRH89ycfIzqLCGuKwFZ1YbUWW7iLkEySOlZPSJvTH
 d/ceB3zxAorEu0YRnc9prUR5998Gmb2BW2NIm3jHYqtvp2D/yK4rZ2L2fexq3ddqKNp1
 6O0qZNllsTHkIwWnPtm3wvkkONRNdSHNAqqE7J71uaMvX9GCJhlqZhkUyGPP4nY7sXg/
 lhVYbWksaVWiYSHL3S8Tjn0VRhspCw0LxNvW1AAVG17qkXvrvjuhfl1ITtEbORwMjLJ3
 5oKHp/Xr5gG7O3+8G7ztQC+f5eJ6DSZdO4w8/HINPlxDc3WZgYtXcX7xIO+V6epuLu1R
 R3Qw==
X-Gm-Message-State: AOAM531X5sfmGaGymCBFJLnDQ+AO18xkFYePXSomMpuylvGvq3upldqu
 cpj1WN72isz2CpUzU/Xm8IQ=
X-Google-Smtp-Source: ABdhPJx22le9Hsu4evTSVFMhkxjFA+jv4eOg+/MScAR7Gmkp6xnXb4LSjNmxlSt+BGPBmg4pYegxtQ==
X-Received: by 2002:aa7:cdd2:: with SMTP id h18mr7374000edw.38.1613749171348; 
 Fri, 19 Feb 2021 07:39:31 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t9sm4580314ejc.51.2021.02.19.07.39.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 07:39:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 1/4] hw/riscv: Drop 'struct MemmapEntry'
Date: Fri, 19 Feb 2021 23:39:12 +0800
Message-Id: <1613749155-84250-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 19 Feb 2021 15:39:35 -0000

From: Bin Meng <bin.meng@windriver.com>

There is already a MemMapEntry type defined in hwaddr.h. Let's drop
the RISC-V defined `struct MemmapEntry` and use the existing one.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/riscv/microchip_pfsoc.c |  9 +++------
 hw/riscv/opentitan.c       |  9 +++------
 hw/riscv/sifive_e.c        |  9 +++------
 hw/riscv/sifive_u.c        | 11 ++++-------
 hw/riscv/spike.c           |  9 +++------
 hw/riscv/virt.c            |  9 +++------
 6 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e952b49..266f1c3 100644
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
index af34569..e168bff 100644
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
index 59bac4c..f939bcf 100644
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
index 6c1158a..7b59942 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -63,10 +63,7 @@
 
 #include <libfdt.h>
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} sifive_u_memmap[] = {
+static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
     [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
     [SIFIVE_U_DEV_CLINT] =    {  0x2000000,    0x10000 },
@@ -91,7 +88,7 @@ static const struct MemmapEntry {
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
-static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -484,7 +481,7 @@ static void sifive_u_machine_reset(void *opaque, int n, int level)
 
 static void sifive_u_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
@@ -766,7 +763,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 56986ec..ed4ca98 100644
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
index 2299b3a..cfd52bc 100644
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
2.7.4


