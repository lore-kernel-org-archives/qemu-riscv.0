Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT4vU-00059z-Kt
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 12:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vT-000591-6L
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:39 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vR-0000tF-BK
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d2-20020a17090a498200b00236679bc70cso2951973pjh.4
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 09:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3hxgJioJYDaoMVQqM2mg2oa252Bx0zdrz7vXWPM9MA=;
 b=7HWdanCB8vxeAxFHcV5Cb5q3+S35sI6cnLnFnG00qxHIC+zakD8qI32WfzgbDyghpD
 Q6B4vhaFIWmSGTcwW09ybSgRmXoNQI3AVYG3O35uHPi1kpkUqR55RI6Sd98fFZSP3B73
 mXSV3BvBuNRn8dofljP4V8wnnOUjbAvr6Yy4ZaGqAhAG+Xtnx7FMFtd7AnF6jYoTGhA0
 kIO2ssmESJhlyL+S8ywMSHXuEFkEW9ELvTf2A6N5LriZXZsntqZyuVW9bM1zW2+b7J8K
 uKY2x7DVIVLfH4CNf1oILhutcr2lrLUpM2YMUhBPLG6qoM3ffxxipvJWcuW1WTYGLCIr
 6H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3hxgJioJYDaoMVQqM2mg2oa252Bx0zdrz7vXWPM9MA=;
 b=M/glh8P04EiTNl7/wFj9faN3uEyjRp5wRbekzCX/EcPnMGmyLDvBviEwHSpTnIFI8z
 E0UJm87LM6sFHXmHpPALctKXKGihjRsFI7UdfUE5yTP/iKNv08YjdmhgJydGUBZdJqJt
 et30/xM3dVu6A631WRmEBVbuV+bHpa9yYFxXOErAN3NHcFcKvKPtk4TnqOEEb6hbFR7y
 c0zsnUdYRHtqkocK39dOER1hLc8bvE8k1/s9GvXYIA5Sn9JfGLhw8eD0Wf3XCi8e/P74
 hQBpop+F1opKWyX8oHVttWdyoB8+Lwc5g9aj21UMWaZKpJDDh3cJbSioQ9yHwwDs2hzl
 q6Mg==
X-Gm-Message-State: AO0yUKWaPKDtbcqdv1zfokWJgzYDaC9mO4wY0wz5QG5GgXhjwv5t4L2I
 px+gEsMWYf4d4K53VijsFp9IR0P3HLn0Sg85
X-Google-Smtp-Source: AK7set+g2zKwdoruljwUYqbyQiss/0bDeBRHMDD6NAToHApUIyO1itl/67FLgJD6u7hafNO+wNsIiA==
X-Received: by 2002:a17:902:d4cd:b0:19a:b033:2bb0 with SMTP id
 o13-20020a170902d4cd00b0019ab0332bb0mr192870plg.46.1676656415232; 
 Fri, 17 Feb 2023 09:53:35 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b0019607547f29sm3392166plb.304.2023.02.17.09.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:34 -0800 (PST)
Subject: [PULL 3/9] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Fri, 17 Feb 2023 09:51:57 -0800
Message-Id: <20230217175203.19510-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 17:53:39 -0000

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


