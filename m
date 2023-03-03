Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zu-0001Jv-3k
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zf-0008Tv-In
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:23 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zd-0007p0-O2
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:23 -0500
Received: by mail-pf1-x42b.google.com with SMTP id fd25so1102316pfb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832940;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9t3N2UJPfcfoD4pGjTXsSm1eTae8jmXFNY8cb9vfdLw=;
 b=3/g0ekRdndJexqm9TtVz45tN+0+V05Sk+0/ONZyKc7FH0bMyXRhdMcIwWCGVOwc/LN
 zt4B/RLcCrGnfOyZrxo8L7a4Eop19p7pv5+qDLSzFy73KHdXHJQVRUUgaplvHzAvvxXo
 5tNZK9/GIIKItzmGT+lp+Qp+9cdXRVq6LfokwR5naBGul+1gWBRQkyRhExNTciAxv7fY
 SyLbUMiCj6+54o6JlDYTQ2O9eqgo9fDkQITpJCBRjJCdsFYIJ3rWXoej9fmagahvdptU
 FKDY669H/kIdS412SrHskVxUJo+q2810Wsd+SHH+hXdpXCjr51S8PCzOrO40vmodA3Aa
 yEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832940;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9t3N2UJPfcfoD4pGjTXsSm1eTae8jmXFNY8cb9vfdLw=;
 b=yI0/wlMDPmAVtVvE7L4hEXV03dbC6MZwYCpIXrhK5H/RuKtAOnvXS41FBdmnmufN1l
 TXLAE1/L6DsuI2sTQYPlYGqjiK5mYvxlq/e8igaEdv8A5ynmTDjJpz9fwGTUM44HTGXd
 urwyDwlYQDCVihdnk/dwVElNSQ0ZHCbjn7b73pXitezzYaIh65L9WEN/RpG3g+n8zTVK
 X7uUPfzKvGWQh6xGEUb22k7Ycc+Ngs56bfsHwvi6yCdO/5TslMv9N+n8XvZRpfuVBE4r
 caRb+IaaW1aJ1eSkZNbMS9jQ8bCyetaGeCgHBPhigZAKRKDkolT9lfjPu5bbA0wF4Uka
 la6g==
X-Gm-Message-State: AO0yUKUyqqO52vCt69OMQJ0Le6dlADRRw3V+gcS83kt4hsFWSpHW7QeI
 EyOVtpPYU67l0AIgPoHxaAweROwpzLP6LgHK
X-Google-Smtp-Source: AK7set/NosIjhB4gLHiILgAz8rl+s0AyDsA5qz33xC+XWL7lnsC1V0ZQzBC4iJiXCnAVmh7kExQuvA==
X-Received: by 2002:aa7:9f1a:0:b0:5dc:2de8:f500 with SMTP id
 g26-20020aa79f1a000000b005dc2de8f500mr1249125pfr.22.1677832940347; 
 Fri, 03 Mar 2023 00:42:20 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 u1-20020aa78381000000b005cd81a74821sm1020965pfm.152.2023.03.03.00.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:19 -0800 (PST)
Subject: [PULL 47/59] hw/riscv: Move the dtb load bits outside of create_fdt()
Date: Fri,  3 Mar 2023 00:37:28 -0800
Message-Id: <20230303083740.12817-48-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:23 -0000

From: Bin Meng <bmeng@tinylab.org>

Move the dtb load bits outside of create_fdt(), and put it explicitly
in sifive_u_machine_init() and virt_machine_init(). With such change
create_fdt() does exactly what its function name tells us.

Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230228074522.1845007-2-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/sifive_u.c         | 31 +++++++++++++++----------------
 hw/riscv/virt.c             | 29 ++++++++++++++---------------
 include/hw/riscv/sifive_u.h |  1 +
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 76db5ed3dd..35a335b8d0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -99,7 +99,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     MachineState *ms = MACHINE(s);
     uint64_t mem_size = ms->ram_size;
     void *fdt;
-    int cpu, fdt_size;
+    int cpu;
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
@@ -112,19 +112,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         "sifive,plic-1.0.0", "riscv,plic0"
     };
 
-    if (ms->dtb) {
-        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
-        if (!fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        return;
-    } else {
-        fdt = ms->fdt = create_device_tree(&fdt_size);
-        if (!fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    fdt = ms->fdt = create_device_tree(&s->fdt_size);
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
     }
 
     qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
@@ -561,8 +552,16 @@ static void sifive_u_machine_init(MachineState *machine)
     qdev_connect_gpio_out(DEVICE(&(s->soc.gpio)), 10,
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
-    /* create device tree */
-    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
+    /* load/create device tree */
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+    } else {
+        create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
+    }
 
     if (s->start_in_flash) {
         /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 981392c0bb..4f8191860b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1009,19 +1009,10 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
     uint8_t rng_seed[32];
 
-    if (ms->dtb) {
-        ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
-        if (!ms->fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        return;
-    } else {
-        ms->fdt = create_device_tree(&s->fdt_size);
-        if (!ms->fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    ms->fdt = create_device_tree(&s->fdt_size);
+    if (!ms->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
     }
 
     qemu_fdt_setprop_string(ms->fdt, "/", "model", "riscv-virtio,qemu");
@@ -1506,8 +1497,16 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
-    /* create device tree */
-    create_fdt(s, memmap);
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
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 65af306963..0696f85942 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -68,6 +68,7 @@ typedef struct SiFiveUState {
 
     /*< public >*/
     SiFiveUSoCState soc;
+    int fdt_size;
 
     bool start_in_flash;
     uint32_t msel;
-- 
2.39.2


