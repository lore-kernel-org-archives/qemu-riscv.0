Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOcq-00007Y-OF
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOco-0008Uz-LQ
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:06 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcm-0003Ie-1w
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id r132so12649276oif.10
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R4qtclHJ1n0/XaLxnevTHDvTqEpS8d67utZqEr3tpBw=;
 b=htuXy9SD87E8R9pP8uRDP3IyBjjuXm3hoc5DGjzLq80oW+k8FFcUr5faLmD04H/dDt
 trBgOxRQzHot0XjrxYCjvqkUJHGkI8QkMoGUdjJYhdmcRBc7v3y7rPPkGpOt6zcxPp8L
 a+0cg/rwQFnrTc9JaGaa9M7EXIXkz5NvB6JqUETu5ugfbmMraJtC86gR15ebyMAOelYx
 FLns4uNQH8dCn6uATc8Qj5GSrM9pahQGOT/zTq704K67BXt+8Z+8gLhDhsN3xNEBSYAa
 2D5o2byp4atJGXww9csS2WXoE8iArDOd65/yyscFJOMpV1wosemUn9JA17ZI5JOchR83
 FHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R4qtclHJ1n0/XaLxnevTHDvTqEpS8d67utZqEr3tpBw=;
 b=xnKASBikcu3MwIdOWK5a4GsN5xCQGHvDDXlmI0D4Cg5wgY+8wK27yxj5Ly9iMSSnMR
 0SNYD0I66OkFwW3QpfG3k/j5wacfQQxkRHR5n57wCulYA7xj0/lEzelzAD6CgmPRrh+T
 sofD7iPq08/l7KjCmQ//INOs/zZKRgp5gLMUzbBygThGp40FDPM9RQHOjuj8tq3GKMMQ
 bXNcE6OoDETxvZyw4xQn7Zh6qK6Clw/vM25QsPOhZ15PHNvUZInT3i0cQYzGsPNTv7Eh
 cf5brZW3ckel4WzFO+UDKUwIUAe+hewmbn9ngIWMnXwVbjSwWcg7GFp+94FFVj/XN+lt
 H+rg==
X-Gm-Message-State: AFqh2koT4awOcTVSDG216p5rlLtAh1JB9EFe0UriYCJYk15niLJ2Zz2T
 +ntBZwt3kvAC2a/UGVjH3tHCyQ==
X-Google-Smtp-Source: AMrXdXul1tSBWV0KSY3iZ5MKWWAvMSMrRvaXaVTrknAUi02w+e8gHs1KvewRhzuiHStfvh+tlh6XAA==
X-Received: by 2002:a05:6808:657:b0:364:914b:2f02 with SMTP id
 z23-20020a056808065700b00364914b2f02mr6929775oih.40.1673872202399; 
 Mon, 16 Jan 2023 04:30:02 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 g21-20020a0568080dd500b00360f68d509csm12814540oic.49.2023.01.16.04.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:30:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Date: Mon, 16 Jan 2023 09:29:48 -0300
Message-Id: <20230116122948.757515-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116122948.757515-1-dbarboza@ventanamicro.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 16 Jan 2023 12:30:07 -0000

Recent hw/risc/boot.c changes caused a regression in an use case with
the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
stopped working. The reason seems to be that Xvisor is using 64 bit to
encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
sign-extending the result with '1's [1].

Use a translate_fn() callback to be called by load_elf_ram_sym() and
return only the 32 bits address if we're running a 32 bit CPU.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 20 +++++++++++++++++++-
 hw/riscv/microchip_pfsoc.c |  4 ++--
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        |  4 ++--
 hw/riscv/spike.c           |  2 +-
 hw/riscv/virt.c            |  4 ++--
 include/hw/riscv/boot.h    |  1 +
 target/riscv/cpu_bits.h    |  1 +
 9 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e868fb6ade..0fd39df7f3 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
     }
 }
 
+static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
+{
+    RISCVHartArrayState *harts = opaque;
+
+    /*
+     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
+     * it can be padded with '1's) if the hypervisor is using
+     * 64 bit addresses with 32 bit guests.
+     */
+    if (riscv_is_32bit(harts)) {
+        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
+    }
+
+    return addr;
+}
+
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb)
@@ -231,7 +248,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
      * the (expected) load address load address. This allows kernels to have
      * separate SBI and ELF entry points (used by FreeBSD, for example).
      */
-    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
+    if (load_elf_ram_sym(kernel_filename, NULL,
+                         translate_kernel_address, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
         kernel_entry = kernel_load_base;
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c45023a2b1..b7e171b605 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,8 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
-                                         true, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, true, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index f6fd9725a5..1404a52da0 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, false, NULL);
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[IBEX_DEV_RAM].base, false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 6835d1c807..04939b60c3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[SIFIVE_E_DEV_DTIM].base,
                           false, NULL);
     }
 }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ccad386920..b0b3e6f03a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,8 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
-                                         true, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 91bf194ec1..3c0ac916c0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -305,7 +305,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0], kernel_start_addr,
                                          true, htif_symbol_callback);
     } else {
        /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e374b58f89..cf64da65bf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,8 +1281,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
-                                         true, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index cbd131bad7..bc9faed397 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..8fcaeae342 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -751,6 +751,7 @@ typedef enum RISCVException {
 #define MENVCFG_STCE                       (1ULL << 63)
 
 /* For RV32 */
+#define RV32_KERNEL_ADDR_LEN               32
 #define MENVCFGH_PBMTE                     BIT(30)
 #define MENVCFGH_STCE                      BIT(31)
 
-- 
2.39.0


