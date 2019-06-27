Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWI1-0003bh-T0
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHq-0003Nl-HF
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHk-0000Q3-Kv
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39986)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHh-0007Rm-7x
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so1176668pgj.7
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Ll0IfljzezEKYOWEmbGf9wV1tOe7NCSXkPQeobGClJk=;
 b=NG4J+/SH23zSiFw0OsxNw+3w8YUj0fr5AyNkO9JEMZZ4hGw7XvleOulBthaq0i/pms
 TdxJuZAc8403tQZ3Xw1iAgW/3jo4yFlKT92E7byhxlh55jydzDoSHr7nm97aK4xnCWUD
 gPhMh7+C7wRJetYRj6kdy+lYkVN513o4DiFRzRTESg9Y5vPoS2VAJOf/0bydWOTLK2fF
 S1FZ9Swd+DvNxdukzO6MhI+2wzEw0stkuRqPq6BXq1u2yYfeXSvnaVtIucVPwgWRCOg8
 akj2ABFGRNTlAzx6aVQUkE24fPmMjB8+4iNLEpdKbPGtfX2YOPLvAp/uKLZ/IV6t9FWO
 lOYg==
X-Gm-Message-State: APjAAAUG6Kv8d7T+9hLPDaD2ohKH3bDITE3oqhqtiLefArzLnJF+1aEQ
 TuPHRJAHmD0Xxfxzus8grhFEO+N0tLARwA==
X-Google-Smtp-Source: APXvYqz5wVrouuxE15mqeXUlOn6ssM6cUIxlUE12cqlIIkDNu8mqI3+lGFWABMMIi309vDqdD0MvDQ==
X-Received: by 2002:a63:4006:: with SMTP id n6mr4086210pga.403.1561649081832; 
 Thu, 27 Jun 2019 08:24:41 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id f88sm6614731pjg.5.2019.06.27.08.24.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:41 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:09 -0700
Message-Id: <20190627152011.18686-33-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 32/34] hw/riscv: Extend the kernel loading
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
X-List-Received-Date: Thu, 27 Jun 2019 15:26:14 -0000

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


