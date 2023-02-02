Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNa1j-0001Z1-QR
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1e-0001Wv-0c
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:18 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1Z-0007Y0-Sz
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:17 -0500
Received: by mail-oi1-x22f.google.com with SMTP id dt8so1498884oib.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdzoMAEBJTe3nsL3itLXWDGswEM52iM44T0PgtSJ3ls=;
 b=TH9cuEoDGyyx6tYwNozH5kaJ3J4PqmadwN1YmweYS4BDEh6z/aCRiG4XAjs0MbMlA3
 +7gXiy9Y0D6FMHSVb8HsnDMfwRLRghf/npdlwUgQMDetp6xli54AuCaiguUbwZXsH9mi
 Eir9Yw6o9B421xGjXvKzqFkb6UG3Um8JeTeMbheC6riOuUE5WLvFiW8Ezc5Fq89oTy80
 Cj52LAV815D4RTAZpB7esfMaOk9Ie09EJM2SUvAFKM0o1QHQaRvkZlV4uhxIv16VGFIl
 hvQPf1+YPRA+laKynYpbLp4f+3YTVPH2FVrrsoq6NL9NcTlO7nzujYI9ms/W6VF1oFqJ
 k7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdzoMAEBJTe3nsL3itLXWDGswEM52iM44T0PgtSJ3ls=;
 b=rLOtt75z33UydOhrgbrlt7A1eom2PnT4dXSUNvHi7///ZKEWq1rj+AZWSXkKTWO3Dg
 lbXZwGsK6EOy0oQsUkQTnOJZUmOJvix/TMbwx0UXLlf7+r4CDl7w5ndB3HVCSTCPRPaN
 MTlPodRZ7eru/jzwH+12J2v5qCkKA0Pe5+wDz2fQ7tcy7zf/9burJ4HJFQ+ayahhnn20
 5F6z5PSoPFfAIEA7fPx7HRqQeRWSF3/kdJsPmSKXGvrV/agaXj1eRBLRPVqqQDTbL5oL
 cLDBEqc05NBGhbu+FOkARjiBcyUXD5Pvr3H0335tlTmLCr9pk5ziom+gDKIG6ezhN9JX
 RGsQ==
X-Gm-Message-State: AO0yUKUWimUIpdTncvzehWw3elWysWwIt5mLC9Am6nfJxFEa605aDUFY
 GkNQ4pDIXcw6KX3p/pLQHnfcrg==
X-Google-Smtp-Source: AK7set9LAANoyKMcqAlVOVUZ+8N3vTSYn1WcfEZTZr4Q2FWai8lbwqNpT0XFtJGcdBuEHNMlR0mgOw==
X-Received: by 2002:a05:6808:a:b0:35c:46c8:2638 with SMTP id
 u10-20020a056808000a00b0035c46c82638mr2871633oic.12.1675345992446; 
 Thu, 02 Feb 2023 05:53:12 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 45-20020a9d0330000000b00684e55f4541sm6547416otv.70.2023.02.02.05.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:53:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 3/3] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Thu,  2 Feb 2023 10:52:57 -0300
Message-Id: <20230202135257.1657482-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202135257.1657482-1-dbarboza@ventanamicro.com>
References: <20230202135257.1657482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:53:18 -0000

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c         | 80 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1e32ce1e10..72885e4a6f 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -173,6 +173,46 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
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
+    g_assert(filename != NULL);
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
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
@@ -231,46 +271,6 @@ out:
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
-    g_assert(filename != NULL);
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
 /*
  * This function makes an assumption that the DRAM interval
  * 'dram_base' + 'dram_size' is contiguous.
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index ea1de8b020..a2e4ae9cb0 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,7 +48,6 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
                                 MachineState *ms);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
-- 
2.39.1


