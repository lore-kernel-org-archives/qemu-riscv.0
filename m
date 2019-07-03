Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqP-0006nj-55
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51803)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaqB-0006Z7-Jd
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq7-0008Jm-2O
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq6-0008EV-LA
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so1452398ljc.11
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=e4LpAArqCMZjxsWg9gz2sRwwsdArZOrpMF0nx0rvwxQ=;
 b=WYNSGtPI9ox6t72kmFqDy7pivE0QWvl1TyqrkYaZSgyPVo9koAHzfUP1SKMSPURcNC
 MHSTMbhZcGPygxGj05vweXiPLBOJRsDq/h3QkmF1eYEQL5y78im/QinhFn96cr5NX0R7
 HiuZDpz34nwTBwlKkfQ7NZePzACOURvu+AqyNcs3ZvLtUnK/xF+vU7FlJaA0GmvTsBXX
 ZV5Pt+2pZXYYBSILinCGuK5i9nCLG2s44CIW+YH65iRVZ9a0zpymcDbPTQcjbB9hXP85
 esZ19oSsJDsxtlF7Z0Tk/GWn5Kp7t8BK3KMbGGJfXtDlxImyPLHqiSGmNmlsys43djzU
 o5+A==
X-Gm-Message-State: APjAAAWrsOsPGHpkzVFbwcSOuoIW7tirEigNRAtnDrlJKVoHvqKXkEek
 77/EiLyS0pu+UJ/8ESgBnpFasw==
X-Google-Smtp-Source: APXvYqzPwccajxJHrxV0Iu/+X1aKN2pWD9Cg+Xp+ynhPy4gOdBjUExQ4tZ1nSbLT4uI6h6pooaOTzg==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr20446442ljb.211.1562143325123; 
 Wed, 03 Jul 2019 01:42:05 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id t15sm285203lff.94.2019.07.03.01.42.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:42:04 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:47 -0700
Message-Id: <20190703084048.6980-32-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.193
Subject: [Qemu-riscv] [PULL 31/32] hw/riscv: Add support for loading a
 firmware
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:15 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add support for loading a firmware file for the virt machine and the
SiFive U. This can be run with the following command:

    qemu-system-riscv64 -machine virt -bios fw_jump.bin -kernel vmlinux

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c         | 26 ++++++++++++++++++++++++++
 hw/riscv/sifive_u.c     |  4 ++++
 hw/riscv/virt.c         |  4 ++++
 include/hw/riscv/boot.h |  2 ++
 4 files changed, 36 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0c8e72e455d7..883df49a0c65 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -23,8 +23,34 @@
 #include "exec/cpu-defs.h"
 #include "hw/loader.h"
 #include "hw/riscv/boot.h"
+#include "hw/boards.h"
 #include "elf.h"
 
+#if defined(TARGET_RISCV32)
+# define KERNEL_BOOT_ADDRESS 0x80400000
+#else
+# define KERNEL_BOOT_ADDRESS 0x80200000
+#endif
+
+target_ulong riscv_load_firmware(const char *firmware_filename,
+                                 hwaddr firmware_load_addr)
+{
+    uint64_t firmware_entry, firmware_start, firmware_end;
+
+    if (load_elf(firmware_filename, NULL, NULL, NULL, &firmware_entry,
+                 &firmware_start, &firmware_end, 0, EM_RISCV, 1, 0) > 0) {
+        return firmware_entry;
+    }
+
+    if (load_image_targphys_as(firmware_filename, firmware_load_addr,
+                               ram_size, NULL) > 0) {
+        return firmware_load_addr;
+    }
+
+    error_report("could not load firmware '%s'", firmware_filename);
+    exit(1);
+}
+
 target_ulong riscv_load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f6b9c12e6094..420867155293 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -269,6 +269,10 @@ static void riscv_sifive_u_init(MachineState *machine)
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
+    if (machine->firmware) {
+        riscv_load_firmware(machine->firmware, memmap[SIFIVE_U_DRAM].base);
+    }
+
     if (machine->kernel_filename) {
         riscv_load_kernel(machine->kernel_filename);
     }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 485aefa99523..d8181a4ff18a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -398,6 +398,10 @@ static void riscv_virt_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
+    if (machine->firmware) {
+        riscv_load_firmware(machine->firmware, memmap[VIRT_DRAM].base);
+    }
+
     if (machine->kernel_filename) {
         uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f84fd6c2df5e..daa179b600f4 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -20,6 +20,8 @@
 #ifndef RISCV_BOOT_H
 #define RISCV_BOOT_H
 
+target_ulong riscv_load_firmware(const char *firmware_filename,
+                                 hwaddr firmware_load_addr);
 target_ulong riscv_load_kernel(const char *kernel_filename);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
-- 
2.21.0


