Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXv-00011I-5D
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXu-0000y3-0H; Mon, 14 Dec 2020 15:34:14 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXr-0007rg-LC; Mon, 14 Dec 2020 15:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978052; x=1639514052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3X9MRnCNg04HAOmd5WtcTwJoBbcg9pXkXOnNKnGDNQc=;
 b=K4rXelkn86d/CsEpuKAWj1GiEVffk6KXdhQfv8h+TUJY3EzSpJiLqXsx
 61y2joUFrqc6LeZmHdueifH+p35sndOJRVKX8pes8b0DnpesqWRpiVZNk
 kiYjFkMstj0ekMtXCnNfjpqd6iwv5tsVCu0iCitxbMoCcZC/PewvdDLZn
 eOay24+fC2xyUy9SGS8Q0J46/7VC4FK1ROfuRgtx/WODgMZgPXvYDtQaH
 p8B/rW6NA7aq8FQjQQmTeCylXrZPv+oCF5dK9060MPYPpTaZbsEo0e2PP
 cYajq5UUpJdZ7RBMwG2OaB8P9k2TNFCosCPRTPCyZ7s+NRqFzSUvrm7LJ A==;
IronPort-SDR: QKbmggyQvORPvEkPosa7f3foAOI0Jkex8oikWyEA44ysRI0NnTynqeJQUEzNKUzDIdPTyB0Ya2
 UR2NquRrVmgMFpWlb/FeLYfmBfWFgry+yQDgZK+H07iqXH1Z/XoB5dhdfl2mNiLqb2A/2Gb1pg
 ifa7l2BIBnnYLGpTagXRlQcL1nhVycm379yFC7Zx0lGJOWiIJYDqRr2hwjos/rC1cWhQ3ySTRl
 Sp6B0FHrfEvkBc2IzQHTev68GQb30EByaYhp21R3I6qk3HIcD1E3u3kq/xNsk9TKZFVYkJooKx
 FyA=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338128"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:11 +0800
IronPort-SDR: HqwGTafB/E0DFisbpF9TLd6nuY0jlaC0miG+wjlL7NHQCKynFJ9d6j33gh3VQmdbzsB4VOmsnr
 Cej/pMyasIps+CoDTP7EFS8VRAOqOADNw641InPecgP3OA0q1kAVu4SXjb2VdyS3aj1NT0vawx
 vC2oqZoiS5TYkbp6QCuAiD8gG0n2hpigIV8pqc7Bb6eD6lke0UpHOka0tNhmwmjH3R0hKZ0ubV
 8upcLuYobDuWCpxvOuCIuGxGBOnVJeVkTbONLfKrSrapHY+5rGsy8deeTxFbO+CJEYhc94OCF6
 l3IhjkE47SbaKjNbzk5OFBs5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:54 -0800
IronPort-SDR: 2h1Gio4exvUUa0eSlPUEz1uIjdADnmGqmMcHw4jLs4HwgcZ5+M+HTGC3uhuJL50PBrN9ZRhOqZ
 H9cQEEomtQFWXCATWfux8jHbDoVm/0cHWBC6/2emh3pvAk67GmUXTQu1NtjXYSpVxBkrlUHLca
 pXAQzvR5GwqHS5Ndf2qlAhFXCZf6FRvR435obxn0cY9dtbR+90R/Ai89AHvWhrHTs9i4SpoXP9
 K4IUOR2Dx5q3DwLUTCXyVSzmqzldtP1cy3QLy+nH/opgCN0MlRP4bFMl4mzHF/MpnMioVKGNdv
 qjE=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Dec 2020 12:34:11 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 05/15] hw/riscv: boot: Remove compile time XLEN checks
Date: Mon, 14 Dec 2020 12:34:09 -0800
Message-Id: <3ccc2b961153e6d9b2c8f138b31c6bf8b176aad6.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 include/hw/riscv/boot.h |  8 +++---
 hw/riscv/boot.c         | 55 ++++++++++++++++++++++-------------------
 hw/riscv/sifive_u.c     |  2 +-
 hw/riscv/spike.c        |  3 ++-
 hw/riscv/virt.c         |  2 +-
 5 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 0b01988727..b6d37a91d6 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -41,10 +41,12 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
-                               hwaddr rom_size, uint64_t kernel_entry,
+void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr saddr,
+                               hwaddr rom_base, hwaddr rom_size,
+                               uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt);
-void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
+void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
+                                  hwaddr rom_size,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 3c70ac75d7..6bce6fb485 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -33,12 +33,6 @@
 
 #include <libfdt.h>
 
-#if defined(TARGET_RISCV32)
-#define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
-#else
-#define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
-#endif
-
 bool riscv_is_32_bit(MachineState *machine)
 {
     /*
@@ -228,16 +222,24 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     return fdt_addr;
 }
 
-void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
-                              uint32_t reset_vec_size, uint64_t kernel_entry)
+void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
+                                  hwaddr rom_size, uint32_t reset_vec_size,
+                                  uint64_t kernel_entry)
 {
     struct fw_dynamic_info dinfo;
     size_t dinfo_len;
 
-    dinfo.magic = fw_dynamic_info_data(FW_DYNAMIC_INFO_MAGIC_VALUE);
-    dinfo.version = fw_dynamic_info_data(FW_DYNAMIC_INFO_VERSION);
-    dinfo.next_mode = fw_dynamic_info_data(FW_DYNAMIC_INFO_NEXT_MODE_S);
-    dinfo.next_addr = fw_dynamic_info_data(kernel_entry);
+    if (sizeof(dinfo.magic) == 4) {
+        dinfo.magic = cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
+        dinfo.version = cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
+        dinfo.next_mode = cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S);
+        dinfo.next_addr = cpu_to_le32(kernel_entry);
+    } else {
+        dinfo.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
+        dinfo.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
+        dinfo.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
+        dinfo.next_addr = cpu_to_le64(kernel_entry);
+    }
     dinfo.options = 0;
     dinfo.boot_hart = 0;
     dinfo_len = sizeof(dinfo);
@@ -257,28 +259,24 @@ void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
                            &address_space_memory);
 }
 
-void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
-                               hwaddr rom_size, uint64_t kernel_entry,
+void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr start_addr,
+                               hwaddr rom_base, hwaddr rom_size,
+                               uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt)
 {
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
 
-    #if defined(TARGET_RISCV64)
-    start_addr_hi32 = start_addr >> 32;
-    #endif
+    if (!riscv_is_32_bit(machine)) {
+        start_addr_hi32 = start_addr >> 32;
+    }
     /* reset vector */
     uint32_t reset_vec[10] = {
         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
         0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                  /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0202a583,                  /*     lw     a1, 32(t0) */
-        0x0182a283,                  /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0202b583,                  /*     ld     a1, 32(t0) */
-        0x0182b283,                  /*     ld     t0, 24(t0) */
-#endif
+        0,
+        0,
         0x00028067,                  /*     jr     t0 */
         start_addr,                  /* start: .dword */
         start_addr_hi32,
@@ -286,6 +284,13 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
         0x00000000,
                                      /* fw_dyn: */
     };
+    if (riscv_is_32_bit(machine)) {
+        reset_vec[3] = 0x0202a583;   /*     lw     a1, 32(t0) */
+        reset_vec[4] = 0x0182a283;   /*     lw     t0, 24(t0) */
+    } else {
+        reset_vec[3] = 0x0202b583;   /*     ld     a1, 32(t0) */
+        reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
+    }
 
     /* copy in the reset vector in little_endian byte order */
     for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
@@ -293,7 +298,7 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           rom_base, &address_space_memory);
-    riscv_rom_copy_firmware_info(rom_base, rom_size, sizeof(reset_vec),
+    riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 
     return;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2f19a9cda2..d550befadb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -550,7 +550,7 @@ static void sifive_u_machine_init(MachineState *machine)
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           memmap[SIFIVE_U_DEV_MROM].base, &address_space_memory);
 
-    riscv_rom_copy_firmware_info(memmap[SIFIVE_U_DEV_MROM].base,
+    riscv_rom_copy_firmware_info(machine, memmap[SIFIVE_U_DEV_MROM].base,
                                  memmap[SIFIVE_U_DEV_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 29f07f47b1..875f371f0f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -296,7 +296,8 @@ static void spike_board_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
+    riscv_setup_rom_reset_vec(machine, memmap[SPIKE_DRAM].base,
+                              memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 995e1c35f1..f8c5509f13 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -656,7 +656,7 @@ static void virt_machine_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
+    riscv_setup_rom_reset_vec(machine, start_addr, virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
-- 
2.29.2


