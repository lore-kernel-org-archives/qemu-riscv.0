Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJo-0001iv-3P
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJm-0001gt-1t
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:18 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJe-0002dk-O0
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ky4so485045plb.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265261;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9n0Y9mrA9q11LFDbHArIq2i6N1FHNLTiYRxrxwVepg=;
 b=pAzb59jogfcV0Y/DGs9fIcvp0PqRhaATXUTyuSS6q2btO5+N78BDAwiMDxto0VRlxK
 MYJY91TlCfe5ol+SQT3lfK+Jl6H9oaNGltGpX8x6/pEclt3JeCCOoB9wQyFbtX5BAn8a
 5IOKoxw79rE5UhUoQNpVEU+PtPix65rZyDo57MzQU1KxeC8Z8tYImxwjR+9AVPDT8Ekx
 L0nCGgxTJn8mgKUEAccEWmVOVuS5voK7FhYlPZGTGO9Ezrtz7XRT0PaAbg2ATdd8JGJ4
 4n1p41+q2s3Rl/stKVjRiRsXAb1tQmwkzwcn6kPi71Xs3l+ybgVxFVw5I+N//5XtkeUK
 ySGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265261;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9n0Y9mrA9q11LFDbHArIq2i6N1FHNLTiYRxrxwVepg=;
 b=WoYCeajTOmOoMLmIpeBjiEMDychgDiy/aocjUTmLBvyXzoIW1jdRpYm5uHxzWMZkUj
 gfPdGrtKtocIjYPX25ys1qWm+wbmFkqYHc3oe8u3mS0zw7IOKaZJOlJL/DyeIOey9MJ4
 E4YYFnhxfC3xoHvyknsUn2n+DCdEEsObq7vBKTVl8/YzPTVb4UEtA+6jkeBtgZoUFF2P
 rkn+RjuXcr02+gBIiNz3QIgQz7nCZ5oU5gc+SM+zikFEtycNVUSJKa2SAoaZRXxYbCfW
 gLPCb5h4n9Ogr4uZ/HquYgutN0zFkVOktgek/eCwGzoHCicOH5rOW42W8C0xNMsCQPlu
 sXLQ==
X-Gm-Message-State: AO0yUKVY6W8kIMrYpm2Yoxf+NBWiPhcBoyBjSnr+ebCFr8Ur17dOuerq
 88h3XpaXp/nvYgXR0NaPlFaqNMWgx60Sw12I
X-Google-Smtp-Source: AK7set+0ZXgq8FpdAx3KAnobRZu+gelRbLfBEx05Z123EaW5IDa8HG//PJV/5ZHNorZ3WoPOxOopCA==
X-Received: by 2002:a17:90b:384d:b0:234:f77:d6d2 with SMTP id
 nl13-20020a17090b384d00b002340f77d6d2mr17882537pjb.45.1677265260788; 
 Fri, 24 Feb 2023 11:01:00 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 bh4-20020a170902a98400b0019cb6222698sm4257825plb.266.2023.02.24.11.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:00 -0800 (PST)
Subject: [PULL 1/8] hw/riscv: handle 32 bit CPUs kernel_entry in
 riscv_load_kernel()
Date: Fri, 24 Feb 2023 10:59:02 -0800
Message-Id: <20230224185908.32706-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:18 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Next patch will move all calls to riscv_load_initrd() to
riscv_load_kernel(). Machines that want to load initrd will be able to
do via an extra flag to riscv_load_kernel().

This change will expose a sign-extend behavior that is happening in
load_elf_ram_sym() when running 32 bit guests [1]. This is currently
obscured by the fact that riscv_load_initrd() is using the return of
riscv_load_kernel(), defined as target_ulong, and this return type will
crop the higher 32 bits that would be padded with 1s by the sign
extension when running in 32 bit targets. The changes to be done will
force riscv_load_initrd() to use an uint64_t instead, exposing it to the
padding when dealing with 32 bit CPUs.

There is a discussion about whether load_elf_ram_sym() should or should
not sign extend the value returned by 'lowaddr'. What we can do is to
prevent the behavior change that the next patch will end up doing.
riscv_load_initrd() wasn't dealing with 64 bit kernel entries when
running 32 bit CPUs, and we want to keep it that way.

One way of doing it is to use target_ulong in 'kernel_entry' in
riscv_load_kernel() and rely on the fact that this var will not be sign
extended for 32 bit targets. Another way is to explictly clear the
higher 32 bits when running 32 bit CPUs for all possibilities of
kernel_entry.

We opted for the later. This will allow us to be clear about the design
choices made in the function, while also allowing us to add a small
comment about what load_elf_ram_sym() is doing. With this change, the
consolation patch can do its job without worrying about unintended
behavioral changes.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230206140022.2748401-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/boot.c            | 20 +++++++++++++++++---
 hw/riscv/microchip_pfsoc.c |  3 ++-
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        |  3 ++-
 hw/riscv/spike.c           |  3 ++-
 hw/riscv/virt.c            |  3 ++-
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index c7e0e50bd8..df6b4a1fba 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -174,6 +174,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 }
 
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
@@ -192,21 +193,34 @@ target_ulong riscv_load_kernel(MachineState *machine,
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+        goto out;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
                        NULL, NULL, NULL) > 0) {
-        return kernel_entry;
+        goto out;
     }
 
     if (load_image_targphys_as(kernel_filename, kernel_start_addr,
                                current_machine->ram_size, NULL) > 0) {
-        return kernel_start_addr;
+        kernel_entry = kernel_start_addr;
+        goto out;
     }
 
     error_report("could not load kernel '%s'", kernel_filename);
     exit(1);
+
+out:
+    /*
+     * For 32 bit CPUs 'kernel_entry' can be sign-extended by
+     * load_elf_ram_sym().
+     */
+    if (riscv_is_32bit(harts)) {
+        kernel_entry = extract64(kernel_entry, 0, 32);
+    }
+
+    return kernel_entry;
 }
 
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561..712625d2a4 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 353f030d80..7fe4fb5628 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..1a7d381514 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda..71be442a50 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..1fa91167ab 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr,
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..797c6084b6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1277,7 +1277,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 511390f60e..6295316afb 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-- 
2.39.0


