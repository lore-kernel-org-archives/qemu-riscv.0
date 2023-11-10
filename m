Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A10C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 17:26:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r1VGl-0002yW-3Q; Fri, 10 Nov 2023 12:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r1VGj-0002wH-Ng
 for qemu-riscv@nongnu.org; Fri, 10 Nov 2023 12:26:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r1VGh-00023U-MP
 for qemu-riscv@nongnu.org; Fri, 10 Nov 2023 12:26:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-28039ee1587so1879029a91.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Nov 2023 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699637166; x=1700241966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tlkVxuFd/0Fmo5OLApeh3jNXix52/hAaPFJnMyxswes=;
 b=iqNZsAvOa9i4aw9mQO1E4u2HkpKI3aITS/Dc0KTgFjcNyo6BuYLe+l2Qg6Ydnrt0i+
 KYB6dBhe9p4ml629N0zalPlsHggw6a1oqhwIGbfixPFk5r2JCA5U0tO1P7ZrjTg6oAOa
 lqyNfI+jcBjeIiff+RsvfLaUHmtg34jSmw7/Yj7LhyqK7TjPWDd/piWJol5pfS5P3VRB
 EKxaCHMy0I9F+AG7eDbDDXMjZqWNnzZg8rNLHoMSL86hqqNA3WQqKLJPrBD1E2ZBPHcq
 yEnObiGSX6Mj5zMBowhTP+ThQzWuEGQjbWsL6t/BB5zlFdTievCq2yIiSmiV2A8KJW0C
 6qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699637166; x=1700241966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tlkVxuFd/0Fmo5OLApeh3jNXix52/hAaPFJnMyxswes=;
 b=UeL1SKpc4jE4uTo84v9oYrGGbafNVKZFnraqYaP8+LK6hJYXrNAvXhGwmIFHUrOYHr
 eosHaANONavz8ycKMSN6+gXUfAOB8HPq9qVbMlu4rKeoxMLNlx3rqEX7D0NHW5pvJkEi
 zD2+QxgQ9j2SxUfJg0TaArR3qaozlKx0maKeTGN14RKPWCgDfpQl8mXW/j+wbMmDOEzR
 iWbBkU0kd/MC+Y9HuvZ0KGb5GKTz/iyEGOWPk3GNZO8G0wsymzdQl1+wpr3w9Qjup82B
 2VCUINS8okJvoxSW9tOX3jd9NCCfQ4BX1Y3NIpt1tEFw/Si0p/al+qN1Wqh05dLB+h9U
 3npg==
X-Gm-Message-State: AOJu0YwKADKaFdDi8/jUQT9DHQkUSIEk7rrDq1dZ0XxmZ7KVgKlTPOtM
 8dS6pdhK03xglFIFJ1tJD5etfA==
X-Google-Smtp-Source: AGHT+IEY4lom6almW4AAyUR632p8zgAxhXKxyhVK5ztL0g3zD8soD+0Fmm1n92Ka1sSvDFHAnfhCLw==
X-Received: by 2002:a17:90a:5d86:b0:281:3a4a:2e61 with SMTP id
 t6-20020a17090a5d8600b002813a4a2e61mr5078030pji.14.1699637165761; 
 Fri, 10 Nov 2023 09:26:05 -0800 (PST)
Received: from grind.. (201-69-66-14.dial-up.telesp.net.br. [201.69.66.14])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a17090b011300b00282eb74ec9esm1853362pjz.51.2023.11.10.09.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 09:26:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2] hw/riscv/virt.c: do create_fdt() earlier,
 add finalize_fdt()
Date: Fri, 10 Nov 2023 14:25:59 -0300
Message-ID: <20231110172559.73209-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Commit 49554856f0 fixed a problem, where TPM devices were not appearing
in the FDT, by delaying the FDT creation up until virt_machine_done().
This create a side effect (see gitlab #1925) - devices that need access
to the '/chosen' FDT node during realize() stopped working because, at
that point, we don't have a FDT.

This happens because our FDT creation is monolithic, but it doesn't need
to be. We can add the needed FDT components for realize() time and, at
the same time, do another FDT round where we account for dynamic sysbus
devices.  In other words, the problem fixed by 49554856f0 could also be
fixed by postponing only create_fdt_sockets() and its dependencies,
leaving everything else from create_fdt() to be done during init().

Split the FDT creation in two parts:

- create_fdt(), now moved back to virt_machine_init(), will create FDT
  nodes that doesn't depend on additional (dynamic) devices from the
  sysbus;

- a new finalize_fdt() step is added, where create_fdt_sockets() and
  friends is executed, accounting for the dynamic sysbus devices that
  were added during realize().

This will make both use cases happy: TPM devices are still working as
intended, and devices such as 'guest-loader' have a FDT to work on
during realize().

Fixes: 49554856f0 ("riscv: Generate devicetree only after machine initialization is complete")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1925
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 71 +++++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c7fc97e273..d2eac24156 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -962,7 +962,6 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", UART0_IRQ, 0x4);
     }
 
-    qemu_fdt_add_subnode(ms->fdt, "/chosen");
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
     g_free(name);
 }
@@ -1023,11 +1022,29 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(nodename);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
+static void finalize_fdt(RISCVVirtState *s)
 {
-    MachineState *ms = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
+
+    create_fdt_sockets(s, virt_memmap, &phandle, &irq_mmio_phandle,
+                       &irq_pcie_phandle, &irq_virtio_phandle,
+                       &msi_pcie_phandle);
+
+    create_fdt_virtio(s, virt_memmap, irq_virtio_phandle);
+
+    create_fdt_pcie(s, virt_memmap, irq_pcie_phandle, msi_pcie_phandle);
+
+    create_fdt_reset(s, virt_memmap, &phandle);
+
+    create_fdt_uart(s, virt_memmap, irq_mmio_phandle);
+
+    create_fdt_rtc(s, virt_memmap, irq_mmio_phandle);
+}
+
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
+{
+    MachineState *ms = MACHINE(s);
     uint8_t rng_seed[32];
 
     ms->fdt = create_device_tree(&s->fdt_size);
@@ -1047,28 +1064,16 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
     qemu_fdt_setprop_cell(ms->fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(ms->fdt, "/soc", "#address-cells", 0x2);
 
-    create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
-                       &irq_pcie_phandle, &irq_virtio_phandle,
-                       &msi_pcie_phandle);
-
-    create_fdt_virtio(s, memmap, irq_virtio_phandle);
-
-    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
-
-    create_fdt_reset(s, memmap, &phandle);
-
-    create_fdt_uart(s, memmap, irq_mmio_phandle);
-
-    create_fdt_rtc(s, memmap, irq_mmio_phandle);
-
-    create_fdt_flash(s, memmap);
-    create_fdt_fw_cfg(s, memmap);
-    create_fdt_pmu(s);
+    qemu_fdt_add_subnode(ms->fdt, "/chosen");
 
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     qemu_fdt_setprop(ms->fdt, "/chosen", "rng-seed",
                      rng_seed, sizeof(rng_seed));
+
+    create_fdt_flash(s, memmap);
+    create_fdt_fw_cfg(s, memmap);
+    create_fdt_pmu(s);
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
@@ -1257,15 +1262,12 @@ static void virt_machine_done(Notifier *notifier, void *data)
     uint64_t kernel_entry = 0;
     BlockBackend *pflash_blk0;
 
-    /* load/create device tree */
-    if (machine->dtb) {
-        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
-        if (!machine->fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-    } else {
-        create_fdt(s, memmap);
+    /*
+     * An user provided dtb must include everything, including
+     * dynamic sysbus devices. Our FDT needs to be finalized.
+     */
+    if (machine->dtb == NULL) {
+        finalize_fdt(s);
     }
 
     /*
@@ -1541,6 +1543,17 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
+    /* load/create device tree */
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+    } else {
+        create_fdt(s, memmap);
+    }
+
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
 }
-- 
2.41.0


