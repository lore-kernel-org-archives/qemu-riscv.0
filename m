Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pP232-0007qi-96
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 09:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP22w-0007od-4Q
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 09:00:39 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP22u-0000fI-Ck
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 09:00:37 -0500
Received: by mail-oi1-x234.google.com with SMTP id r28so9786659oiw.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQ1DGt6dxRvvCfgagSgAnk05yahbN85wZ/YBnPu3ZTQ=;
 b=HC+NUtEqJTNncCMRzh1urqr7TVZNiCHpvxiYAGnLY2P2GsnNujRtFXwaQ3AddqLm//
 eDrKU+DFb8E+lFYcMRCMF1/MJCNyNDl6NC2qptkegYetxmlvUFk5DOmCch7+whwQFEfS
 ViJJPUd79QWJI2ZmEMGqiqUYYTrL3FWoGoiD5l67hWxQF30DSnjavwY1qms/NBvxxsph
 PamcBQXUUNYln6pWr2TDYckJLCwEL0MK8XQPI7vkvV9m/5lOlX0tIo6/AGjag/t1UlJI
 2jiZJAwAD9vWJVhwgrJcCPR1ugu8pajg0P6d9vgUrEliugi5JUJzergF5ULOGNxT7JX+
 5pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQ1DGt6dxRvvCfgagSgAnk05yahbN85wZ/YBnPu3ZTQ=;
 b=ZQD/kIaxMMpMOKYIot4BRs+5jWZgeQLfDSsnyxYQ0nWpPjj8Mvk4mgo5yNokMyNOsY
 fv95dk14C0LJ7wpu9P+ZOIDXOEL9kKH63wqyAdkPm+ktVeOBHfO9OwQUExAtWv0MDJID
 ugiTXEzC9JVsE97WZHRR7Eh2yYW3djxmcEu9p0QTHE7EqqyPUyqOPI/bdipqU5OeCf5a
 2ZexRFFkWQEQv6L3oHm5bn185fb2bC7CqzW0f5NQaPC13MYVoJEGwCKgIKYN2tC07nQB
 C4cmlb7BrWhv0k5Ij5IfoC33Zh2SOSpxdkRX0Nwu1hqfKIW/3p2xboTKFStRZo0j0VKv
 kUAQ==
X-Gm-Message-State: AO0yUKUozQ8hY6Fp7sDBgyDh/+4sGGIa6MUP+PzAKDM53Id0yW/z/yCP
 MB+l+Ydn0Sazm9htJ2n11HGskE2vGri6A4Kuq5M=
X-Google-Smtp-Source: AK7set8x7lt76J/Yy6Qx2LsKLvisXjc0mq9fnW7TRMscyd8hiELCFn/DzsjFt4KLCdogNAgCkV4FCw==
X-Received: by 2002:a05:6808:a98:b0:364:fc2c:687a with SMTP id
 q24-20020a0568080a9800b00364fc2c687amr10910921oij.57.1675692035276; 
 Mon, 06 Feb 2023 06:00:35 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s13-20020a0568080b0d00b00364e8f85c08sm4151177oij.21.2023.02.06.06.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:00:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v11 3/3] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Mon,  6 Feb 2023 11:00:22 -0300
Message-Id: <20230206140022.2748401-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 14:00:39 -0000

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
index 4954bb9d4b..52bf8e67de 100644
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
@@ -234,46 +274,6 @@ out:
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


