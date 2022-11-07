Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os1lq-00059A-MZ
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 08:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os1lp-000589-RM
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 08:02:33 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os1lj-0004Ao-5X
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 08:02:33 -0500
Received: by mail-pf1-x432.google.com with SMTP id y13so10530853pfp.7
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 05:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRFPEI8kvtsy+NGQppELQegZunU3RMiKEpi3ky3RyzI=;
 b=lC0qahGzuR67tbXfwQPc6nnNzduChpd/VQEY7IT9VBEJi3c+WvNa3Zlzis2giAY6dQ
 GU3q+cRMbUwb5omw/1Lyq2PzIf96fHA97pwx9PQo9cspxpUMGm3B9KXuqqVPkiL5E9Gd
 rlnnnpx/jbkaLg2rfVPJQN/E6YSfSrnTnja5Qjr6cPcTCrAkU3bp+AyyiJt23rzZnjzN
 IJlvPc8/4uiuEfkAc+z913id2IwmLWoGBEKPfwySNuU2DYBQuzXQFyiKOfkclXJ/uEfo
 nFpZ6d3WaG13CkXTvyq+dB+G1r/AyvR7Fz6qb+0+HQVnjPI2shraxDzCuqVZnnY7qCmp
 Tflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRFPEI8kvtsy+NGQppELQegZunU3RMiKEpi3ky3RyzI=;
 b=6PGTo+8Wxnx5BtXVBqQdIxLs27wWiE+UkN43uLUNhoTHbBaqknZvN1V57ySKLGxS2N
 Ng25ydfufXjkNTMsh4NRehR2seCEqdeFl5ceCFcSRXKtibcapDPNox/jSdSZsfWs4613
 R/FpDDdcFJF511uNzSWmVB4LPdLaqmHKDBXTit/tQAPoV7VLZkd9DPuzZ/igu1EU2eU+
 8U8R6qRP+yvpQeGo8vCIoTGKr88bG/MjkB6065Cd5dnPBbwR9CZxeYDCniTlANTwEeNE
 dgcJjeupUQR/R+YdRRWicp0qlOssvs+QQ6H9gI5vNG80d1COsRTZBHcqnmNHAsH3fHJK
 mTyQ==
X-Gm-Message-State: ACrzQf2B8klmWhjpJQgBIjrDOu/C6Es78Ep8uJhUWIZkAkbS8yKaPyNx
 fKI85E9ZRApctS4hwuR7kbHEbg==
X-Google-Smtp-Source: AMsMyM50fFp/EvawO6l5zZrr0za64dWV5qlrCHbCgOS4Ut9CBV5WEUPyAFNTpSPV6WlowxzbG12l4g==
X-Received: by 2002:a63:81c2:0:b0:46f:f73e:127e with SMTP id
 t185-20020a6381c2000000b0046ff73e127emr27962639pgd.250.1667826145717; 
 Mon, 07 Nov 2022 05:02:25 -0800 (PST)
Received: from localhost.localdomain ([49.206.12.236])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a4d4800b0021301a63e86sm6076967pjh.18.2022.11.07.05.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 05:02:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Date: Mon,  7 Nov 2022 18:32:17 +0530
Message-Id: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Mon, 07 Nov 2022 13:02:34 -0000

The pflash implementation currently assumes fixed size of the
backend storage. Due to this, the backend storage file needs to be
exactly of size 32M. Otherwise, there will be an error like below.

"device requires 33554432 bytes, block backend provides 4194304 bytes"

Fix this issue by using the actual size of the backing store.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---

Changes since V1:
	1) Handle the case when blk_getlength() returns failure.
	2) Added assertion to check actual size doesn't exceed the limit
	3) Updated virt_machine_done() to find the flash base dynamically
	4) Added code comments as suggested by Drew

 hw/riscv/virt.c | 59 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..b8ab1fd358 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "sysemu/block-backend.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -140,14 +141,32 @@ static void virt_flash_create(RISCVVirtState *s)
 }
 
 static void virt_flash_map1(PFlashCFI01 *flash,
-                            hwaddr base, hwaddr size,
+                            hwaddr base, hwaddr max_size,
                             MemoryRegion *sysmem)
 {
     DeviceState *dev = DEVICE(flash);
+    BlockBackend *blk;
+    int64_t flash_size;
 
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
-    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
+    blk = pflash_cfi01_get_blk(flash);
+
+    if (blk) {
+        flash_size = blk_getlength(blk);
+        if (flash_size < 0) {
+            error_report("can't get size of block device %s: %s",
+                         blk_name(blk), strerror(-flash_size));
+            exit(1);
+        }
+    } else {
+        flash_size = max_size;
+    }
+
+    assert(flash_size > 0);
+    assert(flash_size <= max_size);
+    assert(QEMU_IS_ALIGNED(flash_size, VIRT_FLASH_SECTOR_SIZE));
+    assert(flash_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
+    qdev_prop_set_uint32(dev, "num-blocks",
+                         flash_size / VIRT_FLASH_SECTOR_SIZE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     memory_region_add_subregion(sysmem, base,
@@ -161,6 +180,14 @@ static void virt_flash_map(RISCVVirtState *s,
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
+    /*
+     * The flash devices are created at fixed base addresses passed
+     * to virt_flash_map1().
+     * However, the flashsize passed here to virt_flash_map1()
+     * is the maximum size of the flash possible. The actual size
+     * is determined inside virt_flash_map1() and can be smaller
+     * than this maximum size based on the backend file size.
+     */
     virt_flash_map1(s->flash[0], flashbase, flashsize,
                     sysmem);
     virt_flash_map1(s->flash[1], flashbase + flashsize, flashsize,
@@ -971,15 +998,24 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     char *name;
     MachineState *mc = MACHINE(s);
-    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    MemoryRegion *flash_mem;
+    hwaddr flashsize[2];
+    hwaddr flashbase[2];
+
+    flash_mem = pflash_cfi01_get_memory(s->flash[0]);
+    flashbase[0] = flash_mem->addr;
+    flashsize[0] = flash_mem->size;
+
+    flash_mem = pflash_cfi01_get_memory(s->flash[1]);
+    flashbase[1] = flash_mem->addr;
+    flashsize[1] = flash_mem->size;
 
-    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+    name = g_strdup_printf("/flash@%" PRIx64, flashbase[0]);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
+                                 2, flashbase[0], 2, flashsize[0],
+                                 2, flashbase[1], 2, flashsize[1]);
     qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 }
@@ -1242,6 +1278,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
+    MemoryRegion *flash_mem;
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
@@ -1288,8 +1325,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
          * In either case, the next_addr for opensbi will be the flash address.
          */
         riscv_setup_firmware_boot(machine);
-        kernel_entry = virt_memmap[VIRT_FLASH].base +
-                       virt_memmap[VIRT_FLASH].size / 2;
+        flash_mem = pflash_cfi01_get_memory(s->flash[1]);
+        kernel_entry = flash_mem->addr;
     } else if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
-- 
2.38.0


