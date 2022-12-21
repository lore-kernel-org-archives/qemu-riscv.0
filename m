Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83ko-0008MX-2c
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83km-0008Kq-VB
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:44 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kl-0007pB-8l
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:44 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso20095105fac.10
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZdFtJ+Ib6cOG1cjexHN2bKEmyb+yFYcJLvdmuWEz4U=;
 b=d2u5eBq376GcfsWJzOdvL89wnzregggnTUZHLJUOjGDmGzazp8X+V4V79p+pZM/A4m
 p4+LPuzEcRmrLhBn0SLfPfZkSD0UpJ3VaZ/jw7FHTKKF5St8QGlRXrSDhlDXJfZ3tw9/
 huJXdXcDgOB1nSDtZCPsi3NmS76gGR53GiuDrCY6JKgIzjpC6/oHdFUOUsSv8FuKWt/V
 /A7PKhG6s1OhLeIORIvInKx+IAsRNkO/ZyLolBPt9l0RmBWCfS7Wh1VLcWqFWNaWtBPC
 kxHlY4hcnVOwgbX7U9clpf2+xRFXmAx8jD/s+zcQ5rDHYUn4SSEhKzPMHyyE7J3K1rZ1
 wzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZdFtJ+Ib6cOG1cjexHN2bKEmyb+yFYcJLvdmuWEz4U=;
 b=JYHAH9sc8gJ0jaz95VpgOHv6JB/Tz6y3Vi52iWQTTX2BeeSV2KgpPiJywaiwdxEcfs
 Rp4c7wDI+yXq6Cw1p47favAjFbdvo9ZuxqwhXFWAI+vkMFMLqwPxKlMejJrdxwb3i3N0
 N0+T3AdSgp0CvCFhPBeMi7p/iga58i5Ye7BdbdLiXYAFDpFyiPxZOM942wu+bmB6Uqfs
 sOCwtGlujpq3zlGs2vcPWiWlvAChINlNfK9AFLXuHmon+xYsVa2+haPUHgBmVS1r8/9/
 u0Kb5QP7s5sCqIy2vXuM7Y414ZCALzNRNUPlZEUDNpH2loma2ln+aUExWbHaKjX/1v/1
 sl3w==
X-Gm-Message-State: AFqh2kqNXJghDVZBD3EhgjwKAeiWDELmCNvjMeKb19GAzVGsJ8VWOhjw
 SPfknOls//aEj2EvzHeeGjToAQ==
X-Google-Smtp-Source: AMrXdXtTnYS7zDQ8487j8OcgKFMIYeHmr0u5eFlyHtcfUJjKYCnK1hgEk7nZv+G26+aj9RGBC5uJ2g==
X-Received: by 2002:a05:6870:4d03:b0:143:bb26:dd09 with SMTP id
 pn3-20020a0568704d0300b00143bb26dd09mr1409196oab.35.1671647022597; 
 Wed, 21 Dec 2022 10:23:42 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 12/15] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Wed, 21 Dec 2022 15:22:57 -0300
Message-Id: <20221221182300.307900-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:45 -0000

The only remaining caller is riscv_load_kernel() which belongs to the
same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c         | 76 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index afe5bae03d..55a3fc1a51 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -160,6 +160,44 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
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
@@ -209,44 +247,6 @@ out:
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
index 2256b04986..fde0633573 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,7 +44,6 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


