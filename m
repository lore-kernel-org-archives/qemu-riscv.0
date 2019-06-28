Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulX-0000kp-TO
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55185)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgulK-0000c7-8G
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgulF-0000zj-Jn
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgulF-0000yP-D0
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so2895776pgl.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=e4LpAArqCMZjxsWg9gz2sRwwsdArZOrpMF0nx0rvwxQ=;
 b=cDF7tM9OnKR4g2RbB1zkzTYqUYUyMe2fhpRMjZn6Ocm1QlKeUDSAUrOpgZCsfsveio
 yGGUvtyMxRdK0xIP32N0chSoJr2PXNWCckqnhVtvXekg7Lf8Mc7ahJr/riFIVw9DzNvE
 5Y5OLpbxdq0V3EIv5WClz7ngBrd/4nzrH3KK48IzkEXiJV5xAb2Uf5huvi/jXGXG5+25
 XDZxINpXULycQ750eQkbLXunT9ldsJ/CjeV9ahJTt0yFnwL6mDig9hwyO+2dfZ9/x2xN
 Ab8UwXYTTZnZ/ic3bO20vObXLHEeEYPcBUao8N77xKj2aCyfLQ3K+EClsQ70kuSXoty3
 y6AQ==
X-Gm-Message-State: APjAAAUdOOSVFw+d7J63G88v5kbueBzODNTv1T7oOiKOzTyXof33Qxqy
 TaliiYgcGpfOtQ4yhNZTjE44Wg==
X-Google-Smtp-Source: APXvYqxSYcyjBNfEe4msc8D99u6Qf3LrlwpFVoBuZHNoEzULQVRAIrkFU7aYxE0EjH5uEXPaebyXqA==
X-Received: by 2002:a63:e24c:: with SMTP id y12mr8553653pgj.81.1561743247429; 
 Fri, 28 Jun 2019 10:34:07 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id o13sm2787513pje.28.2019.06.28.10.34.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:34:06 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:24 -0700
Message-Id: <20190628173227.31925-32-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PULL 31/34] hw/riscv: Add support for loading a
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
X-List-Received-Date: Fri, 28 Jun 2019 17:34:18 -0000

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


