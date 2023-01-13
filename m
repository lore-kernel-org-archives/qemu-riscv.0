Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGNhE-0001hl-3J
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 12:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNh5-0001Ta-4g
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:24 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNh2-0001KS-LQ
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:18 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15eec491b40so2015379fac.12
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygYKFtm4JblvuVb94d4UbKLw8e6RiEd3ydsV+Iaa5RQ=;
 b=e6+gJi9V+p1GKK7zP3qNKlKDzp7y3V/EicGWRQV2xBLA5bI0moGRswJ8/yWe8djgkz
 Xik3SATs1RYbHr+bu0wa2KZMoNLeio6yULGp7GpSBs0TOJqinMMZ0m0FWTO/oLanPnSG
 riyh7qV4RjOoBBHAFFydmJ22gTSMZ8Pa6c7A0I04pHHUUuQ7Kj6Vo83loVkIIhmwHrCf
 GQME/PU4EoFiEzORWnt6sw0BOuwcNijHqxM++h+J5KUQUvCMD57aFRx8UzrDYDtG4H8u
 L3yFLb/0wMFyPocBxUrL2QzcYT2nzDdjuYpcdBJzDMXrb7I5K09WDbiHZh69NYTBLLq1
 zgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygYKFtm4JblvuVb94d4UbKLw8e6RiEd3ydsV+Iaa5RQ=;
 b=FbLxjK/bdhwoIU1+sdQy0HmNfNBgb6gGAUbGD7dFmFbIDuqvhF4NLNrt0PtHHuubg2
 dPf45tULS8lx/QcLayKM3ISHF0aXElWviuburbMpiy3O/rZ2UG0e+nxvPG3h/N2HouZ1
 +HdIUPl894fORQWNj5xCg7Jf4YcAt0Cpwg0NoKDwUZp+t357wHQh4j3EtCDsBgbCuIfN
 3WL5OJ14uEs33gtdA98o6l3JAtXJT6U7eZCpfO7CX22Ubavd+KinnsEwz8QHrSc6Ma5c
 95cIAZn8rhGlIc7gOaeEOCG/JXvAly8EA5xwCwl25ccTK08H5MXhfdPq+wBdT6WHTMq0
 Av1A==
X-Gm-Message-State: AFqh2kqHM2wZWjEYmR19yZgKGqlvsWX7PkOTXPe+Unz4SAMBUqG10Gjk
 e0ZczwQqklJGDIID+C0ez4WP8w==
X-Google-Smtp-Source: AMrXdXuOtHcd38y6RchhglW+C8EkXkkQXqLV5yV6zwOsoOsPoqbthU+n6QBrtJh/CjoZexxWaeHM/Q==
X-Received: by 2002:a05:6870:e18:b0:15e:dda6:f905 with SMTP id
 mp24-20020a0568700e1800b0015edda6f905mr1849140oab.14.1673630295342; 
 Fri, 13 Jan 2023 09:18:15 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v25-20020a05683011d900b00683e4084740sm10695872otq.10.2023.01.13.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:18:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v7 2/3] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Fri, 13 Jan 2023 14:18:04 -0300
Message-Id: <20230113171805.470252-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113171805.470252-1-dbarboza@ventanamicro.com>
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 17:18:24 -0000

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c         | 80 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 4888d5c1e0..e868fb6ade 100644
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
                                target_ulong kernel_start_addr,
                                bool load_initrd,
@@ -225,46 +265,6 @@ out:
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
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index c3de897371..cbd131bad7 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,6 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


