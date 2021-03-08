Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJGII-0006pY-LN
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 08:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGIF-0006gJ-5z
 for qemu-riscv@nongnu.org; Mon, 08 Mar 2021 08:51:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI5-0001Fv-68
 for qemu-riscv@nongnu.org; Mon, 08 Mar 2021 08:51:30 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so3847504wmd.5
 for <qemu-riscv@nongnu.org>; Mon, 08 Mar 2021 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ViVWtZ3No3EwiuLvapp181B6jvA1Zl37fC61JHK5PU=;
 b=TJORMraYWiV20w8qDxwleyRNVTbR0TIBeI94ghcyq8tlh79y0d4L7nwo/m3niOq40b
 hXKK7FhGpIhdRB7lomBs4Ho0ubfN2MUOCAzkymSbZPcQGPIGys3hUeX0WYRxKqdQVPqg
 pSqeLwW4OdDG5xCwE0ysa7Z9A0GiCxYS34KpTShrJeWuR0XmLxDqhw1PxK8F2fvBRbbw
 agelcXI94uSbi+BTHoZFP4O8sPC5BhN5AYPXjTpVq3U/cmpCzObRBDuQ6FEfSMBrjGSJ
 B15zYfWEIPmPQYFaq8XJKAdE9OAmANB/1RwOyIgx4UQ8mT0rR2ZVgOdc/Fbv31eF3mio
 g0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ViVWtZ3No3EwiuLvapp181B6jvA1Zl37fC61JHK5PU=;
 b=jSeCSfAxSDLQgr5y2GjR+mCwjLHxSRu4O48Dvj56719LSY8myDsOpc/9DcQPIZ/Wj0
 LRq/KKQuBaFU0/fuKzIhEaAxtZFGZ6s3tP2U8dNp2h6zzEO3qEWNFiHL+czmwHJ0/hnt
 NnP7hjUMAFEFF30RyYXq9zH5ik9p+y2czPypYlz45o0VFiW/NfqqiQn6jKHCFnmP8exw
 dcICKNumAbz88s+YxYYa7aFr/XmSIHQM3QkwrekJuj7t7iXGNrg/XekXBKXNQhvegGHF
 ebT6lrYjZ3pyDKf48rWOQhnAU9d0GrvL41JHePV9bI9vl9T8UetrcX0gn6Iwb6LDuihl
 TOMg==
X-Gm-Message-State: AOAM532fVBnr1G6EhNnTaUyAPjxfkLmimGW/wn7wdZ8ogaD9LlPYVXa2
 XczEmYMII5vvmdqEvufVifSBFw==
X-Google-Smtp-Source: ABdhPJxue4Yz6kyYhmmiB5Vn+HdqZkVx9Qye3KB7dMj0OGCelTgX5k4HApjvnNY/gb0RvaoIQuAXYA==
X-Received: by 2002:a1c:195:: with SMTP id 143mr21688670wmb.81.1615211479644; 
 Mon, 08 Mar 2021 05:51:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm23496842wrd.9.2021.03.08.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4BE61FF9A;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 11/18] hw/riscv: migrate fdt field to generic MachineState
Date: Mon,  8 Mar 2021 13:50:57 +0000
Message-Id: <20210308135104.24903-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 08 Mar 2021 13:51:31 -0000

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210303173642.3805-3-alex.bennee@linaro.org>

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..632da52018 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4f0c2fbca0..0b39101a5e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -195,14 +195,14 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
     if (mc->dtb) {
-        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = mc->fdt = create_device_tree(&s->fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -444,12 +444,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     g_free(name);
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, name);
-    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 
 update_bootargs:
@@ -667,9 +667,9 @@ static void virt_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -690,12 +690,12 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


