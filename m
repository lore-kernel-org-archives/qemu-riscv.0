Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIcbB-0006IA-7O
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 16:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcb0-0006Fo-Rn
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:21 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcay-0001nz-4n
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:18 -0500
Received: by mail-oi1-x241.google.com with SMTP id p133so2830938oig.8
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2cyku08fqdVqnCSE5BwHBuZAdyuCmWqjhgrF9jsYIo=;
 b=hypyzoApJRVq9NAivJ4Rxtplue/+ny/3WLyg4tgPMAbcbMqrPpH2BhuTWBqaC281zl
 7YaIPFdpGfVArftW2LlR8iTALlCQZCtwHq7PIh+Jhox6dANRafsnUvZDGiLj7LPllkgV
 1PDRje8CSuVMkDPusBh0nEowSIi55NPFTWE2PEfNMHaEO4THnjOKb9sJ7sIw1Sr1kosr
 9vXav49cIbmyQkECz2gY+dU3SKBEajdjF7U2xT+6Vm60lMzMv7ipuvpvun72bd9x9FFU
 O1GLoukseMjPswva7wNEQlM+kL4cvzzz2A+WJbEaFFLPGuLds6L/+K40Eq835E2u3M7m
 0VLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2cyku08fqdVqnCSE5BwHBuZAdyuCmWqjhgrF9jsYIo=;
 b=6TjWWJET0P3KBVjK82rXsD0yxZV1I0At+IIow3NSAPXqmCEuLgxeKaCpfMiJkApcXo
 ol4sO5K8AtmKqqilu0/GaMh/OFsIZ/OYv7qkfd8h2p0KpeznXD3c40UbwpMcTdJ/wux6
 1OcgOuR42FjV0dlo2qKku8ZM9hwQMMM9AucPqLXSShr6DQt3ugpwvJkQYF/n5mVgTZar
 7/CtYWSbk5fbCliJ8O70wU+hEMspntV39veX6Yw5ZnUsgzCrH3L20uuPPOohDFTgWe3y
 9NAmce5myxNjfRQdNsJw/8VPo89LvRDtpk785sRaXVcbPjjWu4uObv4+qUagAQ4Q6+rj
 kjvw==
X-Gm-Message-State: AFqh2koJcFuDHswpV8gTkMa9/JjlFGkHOBWcTPLARcFoiK0pe0S3BnuE
 y0imp7VlBK8a00J9M+NzwCu8mNalyS1dorcJUEE=
X-Google-Smtp-Source: AMrXdXtUU3vPA2w8RIcE0TbyKHu87YTb71iEm9aF7hCb+7VudwLye+tB2ijCcgpUh1hH/KDZlhre5A==
X-Received: by 2002:aca:b483:0:b0:35e:574c:c244 with SMTP id
 d125-20020acab483000000b0035e574cc244mr5364994oif.7.1674164234361; 
 Thu, 19 Jan 2023 13:37:14 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 c132-20020aca358a000000b003646062e83bsm13664472oia.29.2023.01.19.13.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:37:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v9 1/3] hw/riscv: clear kernel_entry higher bits from
 load_elf_ram_sym()
Date: Thu, 19 Jan 2023 18:37:05 -0300
Message-Id: <20230119213707.651533-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119213707.651533-1-dbarboza@ventanamicro.com>
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x241.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 21:37:26 -0000

load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit
QEMU guest happens to be running in a hypervisor that are using 64
bits to encode its address, kernel_entry can be padded with '1's
and create problems [1].

Use a translate_fn() callback to be called by load_elf_ram_sym() and
return only the 32 bits address if we're running a 32 bit CPU.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 20 +++++++++++++++++++-
 hw/riscv/microchip_pfsoc.c |  3 ++-
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        |  3 ++-
 hw/riscv/spike.c           |  3 ++-
 hw/riscv/virt.c            |  3 ++-
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..46fc7adccf 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -173,7 +173,24 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
+static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
+{
+    RISCVHartArrayState *harts = opaque;
+
+    if (riscv_is_32bit(harts)) {
+        /*
+         * For 32 bit CPUs, kernel_load_base is sign-extended
+         * (i.e. it can be padded with '1's) by load_elf().
+         * Remove the sign extension by truncating to 32-bit.
+         */
+        return extract64(addr, 0, 32);
+    }
+
+    return addr;
+}
+
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
@@ -189,7 +206,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
      * the (expected) load address load address. This allows kernels to have
      * separate SBI and ELF entry points (used by FreeBSD, for example).
      */
-    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
+    if (load_elf_ram_sym(kernel_filename, NULL,
+                         translate_kernel_address, harts,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
         return kernel_load_base;
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..bdefeb3cbb 100644
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
index 64d5d435b9..2731138c41 100644
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
index 2fb6ee231f..83dfe09877 100644
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
index badc11ec43..2bcc50d90d 100644
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
index 4a11b4b010..ac173a6ed6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1274,7 +1274,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..105706bf25 100644
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


