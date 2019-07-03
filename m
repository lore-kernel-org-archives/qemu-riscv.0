Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqN-0006nL-F0
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51831)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaqC-0006b3-AN
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq8-0008Nt-GF
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq8-0008Kp-7U
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:08 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so1442884lje.12
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Ll0IfljzezEKYOWEmbGf9wV1tOe7NCSXkPQeobGClJk=;
 b=QRRzd0ILZl/YMrOZClygfbgTwxONzmS/Agq/0GjmNg+3yqNU1l992jZdDdcYMDaoDx
 vV9Fu9zuCBBpBGC90566t4R0JyAhjrm75BpIoyL+LzQzFnYN7vR1pXm8RYelWlSvAbx1
 Hni7L2O7hTx9po8koLUv2n5K+BgybWZ/G7W4f6U4gGYWiZOzEj5jhf/kX+hYpAlBva+i
 wturruPrIYNFeP9nLNnmk8xyNZx/xpFVJtsvVHprxCLDe7/BaE7NZBKr7KhKFBbqrWHH
 zA2ytIu2k1Vb7SkzqH9VH4QfqzTCfYfKABcJMdLd/5azgxcnHK0B83rOvgLI5oSGXVop
 F0Rg==
X-Gm-Message-State: APjAAAVgYOw4DaIK6Sm3VjFkKr/Bgqg99rv8+m7i10yXLRpl/A2f3a19
 OAHWlPIL0ZwuG2lOB9ZXlTnm3g==
X-Google-Smtp-Source: APXvYqxvE3RURQeDVAH3+lZ+MkxdP4n80wXOGvdatidyeYsNkwqb/YD/aif4p1tmYjqhSIybm4kYDA==
X-Received: by 2002:a2e:994:: with SMTP id 142mr20031421ljj.130.1562143326755; 
 Wed, 03 Jul 2019 01:42:06 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id e13sm339064ljg.102.2019.07.03.01.42.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:42:06 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:48 -0700
Message-Id: <20190703084048.6980-33-palmer@sifive.com>
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
Subject: [Qemu-riscv] [PULL 32/32] hw/riscv: Extend the kernel loading
 support
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

Extend the RISC-V kernel loader to support Image and uImage files.
A Linux kernel can now be booted with:

    qemu-system-riscv64 -machine virt -bios fw_jump.bin -kernel Image

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 883df49a0c65..ff023f42d01d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -56,12 +56,22 @@ target_ulong riscv_load_kernel(const char *kernel_filename)
     uint64_t kernel_entry, kernel_high;
 
     if (load_elf(kernel_filename, NULL, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
-        exit(1);
+                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
+        return kernel_entry;
     }
 
-    return kernel_entry;
+    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
+                       NULL, NULL, NULL) > 0) {
+        return kernel_entry;
+    }
+
+    if (load_image_targphys_as(kernel_filename, KERNEL_BOOT_ADDRESS,
+                               ram_size, NULL) > 0) {
+        return KERNEL_BOOT_ADDRESS;
+    }
+
+    error_report("could not load kernel '%s'", kernel_filename);
+    exit(1);
 }
 
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-- 
2.21.0


