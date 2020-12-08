Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluN-00085w-CZ
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluG-0007zp-0W; Tue, 08 Dec 2020 17:56:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:57375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluC-0004Bi-AR; Tue, 08 Dec 2020 17:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468184; x=1639004184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VLlG3IEJYmfLM9KFrRDFl6mGjm8Pk9XAIIaQdVLiVuY=;
 b=JHmMHcsE+HGT1QAZMF5cD/HmNaxN9uA70wBILfPsIT+PIyr3Io9WDNA4
 46TUNj5RV0wRyMa2CY81j+1DwYjl7fyrdpdicZfM0dtBMY+zWldbBHgCV
 DvkSaHTQwLYxX2ukx/kMXoMHgE5ndVDWrk6wDGXW81u+iLXRxpcd9aju8
 808C+r6Vg2IYqgptVLYd40NXHVdiDoD/X5k9V6JwP/boTaKZSsQED+FDp
 Il/Tf6PumXrIAb02I2slOcAP0CURPiMAuW9wdPX5JSv+c+f5dlomMYSQZ
 X5EY/lKXvHns5iuUg+47nGNic41OjgzVIeAMXeJKNZH8ybQk2KtuZeDkK A==;
IronPort-SDR: ai6aGHUaRc4sMRW8/6tzjlo1bz2ZDt2L5mjZmJoWZVyZdIwUvbXBrB7UMKkzuwRp7UjWkr0q2h
 i1282eTFaI2YQrVYpk1sG596H1f5mtfzpMnxk8wsQixH+ZqP6UY3ibaixL5IObW7/6dTeLPibb
 YMRtaDxC6MVrcAtsy6NdZ0avFXTtKcJ54mdtpEL7L8TiHqGfZlqJq/0BM+2iPeI5TOp69A+IqT
 VrppkSY6qzHbc/zS4HMDdOtlgoyaz9Qjl+s7gXXvlOznG75g74O5C4NGOFvmN3ucKI/ZS/bCXL
 Rgw=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="159184105"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:23 +0800
IronPort-SDR: 2LPLyYxSux+411DpJDAxlyo8V4Geg/ObWYjjH/CtxOkrNqhfqgB5/6r1RY3DeUsWwc2S/ou7fl
 93tyJ2p2HMLrXYtfvg3w25RLmN4eKsovQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:40:23 -0800
IronPort-SDR: K9ShNDooizwldMSjUSNHuBRVC2Is3micfh+zPNkIcsl26LFMWQd8DVxM3R02jKWiojYze7F8St
 rpdfLs0Ry26A==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:23 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 05/15] hw/riscv: boot: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:22 -0800
Message-Id: <64d6afcb62eb7b27b863436219cf1a4e28018de1.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:30 -0000

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
index 4165cc8d32..e5af3001e9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -32,12 +32,6 @@
 
 #include <libfdt.h>
 
-#if defined(TARGET_RISCV32)
-#define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
-#else
-#define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
-#endif
-
 bool riscv_is_32_bit(MachineState *machine)
 {
     fprintf(stderr, "machine->cpu_type[8]: %c\n", machine->cpu_type[8]);
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
+    if (riscv_is_32_bit(machine)) {
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


