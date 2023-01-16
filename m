Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOcq-00006d-2u
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcm-0008RJ-AU
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:04 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcj-0003HU-15
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:02 -0500
Received: by mail-oi1-x236.google.com with SMTP id p185so2116089oif.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0lm/oJWWa+MhCTCBNn1qSE+0b1IOIjShGN0DTgF9G0=;
 b=h1+4w2EBwnvQF8wqn49/RJfMEkwMYGDou0CpmL1o0Vf/KaZUTyA5ln/1BWC8uSEXMV
 rKKBuN2QA6kGEu9Lhmjqq2Zsuugt9cIM+aCVREde3DYU/XFpF9RAMaupu2B+6Cou2/Ya
 plTDLvB0ZrRXo7xm3oycHNzldUm7R5g9szc/qvCuYqxS/vuNHRZgcn1pXO/hCQIjey/U
 FoWA0YLcfX7LrhMZpanfrjc4qdnf6RpfS87+dpxthTjmw3HIUrC4PZXVdx8bGLvKXp2u
 OYhlf+3ipSUoRwndsg/iel/v8aagJnAJbCTbhXqW5wUbal4RdNbQhcs9TJH5bcqs7UT/
 hKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0lm/oJWWa+MhCTCBNn1qSE+0b1IOIjShGN0DTgF9G0=;
 b=TFMnH1sJbiXTmEsHWPrT1YWPCHE6tDha0CYQ7qA9dIVYJE3fy+afjyithfm/m0ial0
 USKvHx9NGP7D0wh4jfQcCE2/rE7aNppRw4a5dxVpnmCy8J5WgR2ImQAqRs8QzPlcpLPS
 JIbksZHcZPODQufBUzY0eItZ3WIiwKk6agQ0vlBNMxEPxVYtAKq47Ap0hDqMqqYoBwHf
 3XmvrldKWOJPc5zbUjbGSsjpRpZ+lwwoX7N4/FL9f6vCBXtPisfDKpr3oESMmpgGeuS6
 lkVrri+wUjJTegrJvaAG5lgv8nsYj3mlYXznKGJy8Z8lP5xjbT7ybI8oIoevtwf2u6+W
 rJvQ==
X-Gm-Message-State: AFqh2koDsbNSzS/FxQunzCGSMAfnSeKAbn8LVxSjnxALb6NMSTPZ4YPf
 jbbcJCGQsgA04aWlw/2ccCw2RQ==
X-Google-Smtp-Source: AMrXdXsWgbJjcH3qLpHVUENAO3DAbs8UbuOsMr9zpY20u4pAyk/6/Lt9TjT6ozCnGHxjpf/00obJMA==
X-Received: by 2002:a05:6808:21a9:b0:364:5c9b:5f7d with SMTP id
 be41-20020a05680821a900b003645c9b5f7dmr13813466oib.22.1673872200017; 
 Mon, 16 Jan 2023 04:30:00 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 g21-20020a0568080dd500b00360f68d509csm12814540oic.49.2023.01.16.04.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:29:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v8 2/3] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Mon, 16 Jan 2023 09:29:47 -0300
Message-Id: <20230116122948.757515-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116122948.757515-1-dbarboza@ventanamicro.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 12:30:04 -0000

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


