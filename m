Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJm-0001ha-Hy
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJi-0001eT-Tq
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:14 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJd-0002e1-EF
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:14 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u20so17528pfm.7
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265263;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3hxgJioJYDaoMVQqM2mg2oa252Bx0zdrz7vXWPM9MA=;
 b=Y0Ywx1SQMKzkxzYu99+bch02+hCIsLsmvGLTTcANRMauyh9hKtUbcWTTTr0zJKGY8K
 jVIKkH9WJe/zCop743z9vpQh3iepejefi4oGn7Kh2Pc9/SdVeQqkrXO3rg6rw0jf+/r5
 QJIz8KZCnPRrqeM2OUrdPthdm9d4t0LBMDfla9R1DjfYcL0ov6cM0DRPAMWvtcwoy64J
 Wgmp5aWUaPmCSAJTqIkB2Re2sGrkm/WXXy6KQdVWpPs0Rwi/iJcWuhxMIUxc503kGXLr
 gWpP5qycQbZaJHztxVpGH5oiLCIr1gkUb9b4FrG3mU1LzHmHZ45Ok9uV1N0Pehy/3UJN
 P+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265263;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3hxgJioJYDaoMVQqM2mg2oa252Bx0zdrz7vXWPM9MA=;
 b=ObtraWtOD4roNrjXS4aAliF46o8T+9up4clkILf/nQc6zJZN30vcRbDkYu3gVojaAo
 CXiEPkgAS0joXmfXxftrPV5pCODRhMrOKUHf3k187AsxpBJ66wjxunJfjLqv95wb9TAp
 t+VwVjMsvnKssWo+8JA3a52BFLXaafanuEBJ7gPePB5bV/40/mJ5CYvWwDNlJ+ZktbLO
 Vy0QagP4pd0BjCaAGiCuetbfp3Q5bCSE+C1boApNAJsjBbhLrlvJiRarDZ5UxnBHnfvJ
 ex3dlBjoID00wbE+2zC+qRgaH0v9aIduWE6jOu81P8bAIx6cbuOOPP/5ZRT030Ne8tTz
 bj4g==
X-Gm-Message-State: AO0yUKWZ2E0U62ofUG6YzzzYzt2nq8QN+5j+QodLvnVXv0rZXrpa1At6
 oxkkcv6+4liMzopLAAlA6D5Jm3YsDakBSrT1
X-Google-Smtp-Source: AK7set9V4oh1VqLSXNfzdd7Ykzk1ZGySzElHCuK+SBKuFzHuxeZ/Tqil0w5EgC3XIphj41b56E7wQA==
X-Received: by 2002:aa7:95a4:0:b0:5a8:c6c1:c9ae with SMTP id
 a4-20020aa795a4000000b005a8c6c1c9aemr15022069pfk.30.1677265263265; 
 Fri, 24 Feb 2023 11:01:03 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 d7-20020aa78147000000b00571cdbd0771sm9914700pfn.102.2023.02.24.11.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:02 -0800 (PST)
Subject: [PULL 3/8] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Fri, 24 Feb 2023 10:59:04 -0800
Message-Id: <20230224185908.32706-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:15 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230206140022.2748401-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
2.39.0


