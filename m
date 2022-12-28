Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZe-00053E-LC
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZV-0004xS-QQ
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:19 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZS-00080g-Dp
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:17 -0500
Received: by mail-oi1-x231.google.com with SMTP id c133so14862518oif.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URSBFO5Y07ig/B0eN3m2FMoCUzD0Tx0ChZa1jRpi5NI=;
 b=ZWMAqUpqnLpAmp3yObsIqlqO2bzL7V5xc7jFUpjJsMRMuVbbiRd5zT/cq1NM/3sFXF
 Z5NkCI1mIdU+FAiERft25KMkotBuFnsvQplnXVnaKZMrVPz5HSOP2BHs4eLQeTBIdYGH
 MjfEFFQp7UM9LXKUeUmOPLhfJqdfZWAjhvl1a8FYFHocio6uo7YHQRe9Ve3XnxLX0cgH
 7yOriqWyp9wGAEFAEp/BdU++6XD3Sef+1pFI3umy/Am7tJ6KbeV+TAHEvGcJMCpSBmKP
 HbrqE4xnPbrrBgeEfdt7Dq5O/y04HguLXOk9NK+aOw1UJOomW6IYoT+jJ2ClG+2jcC/e
 Xy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URSBFO5Y07ig/B0eN3m2FMoCUzD0Tx0ChZa1jRpi5NI=;
 b=J1oIhH8laHiQzCm2EdDJYBCuHrue5TxasdPaB26sv+6US5/+4QXbJDbv4hKZxVMrnd
 sxdkLUHy6laa0ABTdtI/JhLedwOoO4CNeqPolGfa6gBrNAIcCRMar2xGsMNW7Mjdv0dn
 Njt9AmYjJiAvimaUq+3CqpPSjA0GUFcT/v/IV5KRQGxdkrEbzZW5V6gB1wMJKkyRTDir
 7HS/KIi9xzNlTqcCS/MV/O07vtC9zmu9r7gQGdsNy18l45RIm7y7BjHAMJ+SyjGdqdPH
 oTJlO3/fa7CLXeJx/L5IRdjQgmSY+bK4L2UH1KCWVLwszF7+4BRvWmBl9bZnQioBZZpF
 gFbQ==
X-Gm-Message-State: AFqh2kq+7Iy7uKQhgsxEYkItjXOEzshMpjkrdGk7R8sC79o2VpVExuUa
 tgxSfJFhXa8ydYW1h0hgD668pQ==
X-Google-Smtp-Source: AMrXdXu/bKo1QOuDRFo1nuPOBMnNszEQGeTA9FPR8Zfe+OCqkcnAF7ffG8X9uM0qyDfiK8x0Af3SkA==
X-Received: by 2002:a05:6808:28e:b0:35e:cdd7:d8fe with SMTP id
 z14-20020a056808028e00b0035ecdd7d8femr11851783oic.53.1672234453739; 
 Wed, 28 Dec 2022 05:34:13 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:34:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 10/10] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Wed, 28 Dec 2022 10:33:36 -0300
Message-Id: <20221228133336.197467-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:34:19 -0000

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c         | 76 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 6d1243ad8b..8a46c8e8f8 100644
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
 target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
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
index 16b86450d3..9c2bd92eff 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,7 +46,6 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
                                           target_ulong firmware_end_addr,
                                           symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


