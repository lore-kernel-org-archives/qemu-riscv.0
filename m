Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVmc-0005R6-Je
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVmG-0005Lj-BE
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:25 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVmE-0007mW-BN
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:24 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 k7-20020a056830168700b0067832816190so9809948otr.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61FqfFkIXjOYxp0fnkqNCnIUdC+/A6plG1XTPdIxGIw=;
 b=PE4lgfrpV13vVFW9XwFHPOMBJYb1Gw3a2fcPFpvGt3c78U/t7SnTJtCWDBlTKoer9m
 2exbdaXhDcH48X7o5XZlemEPEGsX5cibdFEwgwx9xIWQMs4RZcwDCrmLeyDNpZfd03fG
 L8St0TlLH6BmwBNbJYFvxL5XHoiUDJwBgGxSZCqLBeP5xXRMxX8w7Ekz04M//VWixRyI
 tJ2cznMYT4HQS+292trAHFlMXUxZuQOja7LXPugaBRdAkUPv8H9VqtVWgQLAK23Kw+Yd
 0h2etrXLuTTDJFvF8x9u6ncFZX29ET7O+83/2K9fOaT4T6YylwCF8B1GakepfApePRkd
 xpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61FqfFkIXjOYxp0fnkqNCnIUdC+/A6plG1XTPdIxGIw=;
 b=tOywp11MZo+B0lQcDzV8bdeTaY/GLZ60tOlY75QY8msSnELtWkR6eYCYMPfFmG+An4
 GHOyvsS/jbic0bQ6pN779MHobMhtexeBV9APkUwZ6FfbkciMkZrUoec8Gjx1pkTQ7Mvc
 GXaBEp+MeecK5W5KYKDxBu32/uTIbLFl2WAslRBo2D0OOI4CeKzZHh3Rw+C9mqLbhsrE
 uf8ffRUIIAnzcOj2C8jXoqULGocA2bjqFPRkrvoWinsPBsxYGeZhy2IBp9ufZ2FwVt9z
 ZNAzLFoKunZIEcjAxA+uy9VX3Olujjdb850n4xfIYZwUTOv+UE66veR3R6ndMxRL9RH5
 5hZQ==
X-Gm-Message-State: AFqh2koX47HefCmEVUfwSmZnCNxNL6RF98jFnkmFc6u0YpCTBoZ0QhHt
 pUILPTLbLGJ4U3q7NnHVzoI3nA==
X-Google-Smtp-Source: AMrXdXtBoxb0JwlCJsHRQwLv1m/C00D3MUCU08d1EqVwLEMcfbKnx/ALa9Z9L7+JqGLLYgtTyLQkEg==
X-Received: by 2002:a9d:3c8:0:b0:670:827d:639c with SMTP id
 f66-20020a9d03c8000000b00670827d639cmr12551185otf.33.1672231401397; 
 Wed, 28 Dec 2022 04:43:21 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 10/10] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Wed, 28 Dec 2022 09:42:42 -0300
Message-Id: <20221228124242.184784-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:25 -0000
X-List-Received-Date: Wed, 28 Dec 2022 12:43:25 -0000

The only remaining caller is riscv_load_kernel() which belongs to the
same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c         | 76 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 95f780a228..87c4e5f3a2 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -171,6 +171,44 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
+static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
+{
+    const char *filename = machine->initrd_filename;
+    uint64_t mem_size = machine->ram_size;
+    void *fdt = machine->fdt;
+    hwaddr start, end;
+    ssize_t size;
+
+    /*
+     * We want to put the initrd far enough into RAM that when the
+     * kernel is uncompressed it will not clobber the initrd. However
+     * on boards without much RAM we must ensure that we still leave
+     * enough room for a decent sized initrd, and on boards with large
+     * amounts of RAM we must avoid the initrd being so far up in RAM
+     * that it is outside lowmem and inaccessible to the kernel.
+     * So for boards with less  than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we put
+     * the initrd at 128MB.
+     */
+    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+
+    size = load_ramdisk(filename, start, mem_size - start);
+    if (size == -1) {
+        size = load_image_targphys(filename, start, mem_size - start);
+        if (size == -1) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+
+    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
+    if (fdt) {
+        end = start + size;
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
+    }
+}
+
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
@@ -220,44 +258,6 @@ out:
     return kernel_entry;
 }
 
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
-{
-    const char *filename = machine->initrd_filename;
-    uint64_t mem_size = machine->ram_size;
-    void *fdt = machine->fdt;
-    hwaddr start, end;
-    ssize_t size;
-
-    /*
-     * We want to put the initrd far enough into RAM that when the
-     * kernel is uncompressed it will not clobber the initrd. However
-     * on boards without much RAM we must ensure that we still leave
-     * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
-     */
-    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
-
-    size = load_ramdisk(filename, start, mem_size - start);
-    if (size == -1) {
-        size = load_image_targphys(filename, start, mem_size - start);
-        if (size == -1) {
-            error_report("could not load ramdisk '%s'", filename);
-            exit(1);
-        }
-    }
-
-    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
-    if (fdt) {
-        end = start + size;
-        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
-    }
-}
-
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..afebc50830 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,7 +46,6 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


