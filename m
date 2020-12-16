Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRj-0005Vq-Ts
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRi-0005Sv-AZ; Wed, 16 Dec 2020 13:22:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRf-0000KE-7S; Wed, 16 Dec 2020 13:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143428; x=1639679428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+e4tKfKA2crtvYoeoSfmsm9gsPyoMiD8pikBVFoL9I=;
 b=gK37DhT3huPX+egmFdyNVzSKpwl3HDTKOw8KK2m6NbkKXO/tAklD50O8
 gGPB29SCnHUr5APiAM4WuN/mkpCjFJKHqJHbydta75RZqwSVMV+f+H5Yb
 VLe/n4VxxPTiWwN3HoShwtphcWxHnJUiSFhHmWFenh/yQbGtwZ1LvPPP6
 cLjiDCzwrgTpI84O/t9V11PxWCSofe2NtsGE6C49F6Nx1kMFNSpl8hycr
 DAFdix/Pzw63a3dUBolsz4eXjgnc7hkZWmU8Fx+QYueNMJ/zZAPA3vumQ
 BDf95h36JYAl/ci0aAStA5Ol34EIZftiamIrCIxVKL6ZazzXE8/lE4Fu+ w==;
IronPort-SDR: 2GaFrBXS39sCVS/ShFPvBqdXuvonUI73fIV+4HETmy/4r3JTbBWQHtCGMYvICdxJrsxsPLOGgu
 iblfN93xyLXzCmhqOk16HvPmzEbh+Ky+WSQ1LlT3qOUZcyi9ZVaRPSHg/2dSdR0Tp9RiZdGpOo
 Cbm7BbAo/cyW3ytfD7RwyGK6N+KbvbXMFayh5Epw8wyPMKPqWAYnxtjNFd9v/sJva0DA5wS5Lt
 8/2FIMH1CUz6OzyTm3+mYQ6kRb0uMPrpTMUsQZrORp3Yia+uSJ8G32qlCNVSfGxOe8g3/f9zbV
 1JA=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080358"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:26 +0800
IronPort-SDR: pPCiLSkifIfWAZ5yqUXvh2nnFucnySaLKyIs527Xf102e4S+KGVlfZkRgXor0JDT1neSc1ruIi
 m2u6PsZd55XLWjYGg7pXRs+qCwJcPwisMQg9TmyG8fzlfe04YH/hQgcv4ZmVF5FY/Kr/fQvDf1
 e68FHRMmAcsDXc+VUhR7YRFKUmgRWqOfjI0z5y3HOQgDoxWl24sX5AJ84q+l2BbAb6spyVkJcZ
 3Jm3UX8SbjOsC8OOaBfXwbl9YqqrMrAwUk6vr2iY660z/iszyY2drojDEmLOpN8F4lsx7WLNRx
 8oi9f/dRu6ocdAkuMOza4Dyd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:13 -0800
IronPort-SDR: nLZp2DH9TE8A8/QvKz27XDB+MWwF7pFMS77mSJfFkveyyto0nvzdLrmUrJwgM9sqCSc6WqfSb7
 i2iGeKJwZnnUMH4iQ0L1uCWEQRbKWfSvHK+fddx+QzONRSJk5eYiHZz3YP9y4C0EFzUh9uW8yq
 qWrJewSdLjzEZSSXvZKrTq0L44S3/46Ri3D+6N2jB5fiu8W5x+Mj9d0gy0w4o9GPQ/OF0/TQC7
 Bs+JMt3WRHyIue3q0Vh3ZAX7KOgDPjiagyyaK0KgJPien+sBygxQ2Gj1/wapLkdNegczV27Jkv
 78o=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:22:37 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 05/16] hw/riscv: boot: Remove compile time XLEN checks
Date: Wed, 16 Dec 2020 10:22:37 -0800
Message-Id: <51e9842dbed1acceebad7f97bd3aae69aa1ac19e.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:42 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


