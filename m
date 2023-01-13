Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGNhD-0001hh-Ur
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 12:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNh6-0001U6-Ub
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:24 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNh4-0001LG-SC
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:18:20 -0500
Received: by mail-ot1-x341.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso12564297oto.11
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 09:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJlyJ1o5od4U/BnplE74SJL1O7er2wxucdPiZKeQUNo=;
 b=kCavTRxao/t/8iB7/bjyEJglWRNQVIsEIEKYqUFisv6n4aA3U3VadunGKpwjSQPr16
 8zrMmYYROoydZUaekm15yxikcDavsnsQBQokrhYk4IvWOAC0P3wXRYQNxyG/sQEOvt9d
 3w+vivhVqeh3kDq2HgTJ1i4qXUoQPe1OcSoN2ChpD6W/4k9R43Kz2Gg07iVhmTiWCOji
 YEG11JsolMLDSNP/YjEe7adm7PEEFsULacgE9tFrLB9Mpwa9yPQbhVeexsPsYd3d+IDB
 VXjHGoFkkbzmGLBHd0bk/h7Ba/B+rbyLUnSz+cX4xqc3pKAIs2ACcQipL5+ZlZkSPkbc
 g7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJlyJ1o5od4U/BnplE74SJL1O7er2wxucdPiZKeQUNo=;
 b=FvHqtqmrAnusIMFsV5Sezb6EHGxg9nTYFJkl944ROxK7QC52rGm06wzsfXpb1fSejl
 TDF6xdUL0FU233fKdLMOb03CPXNhrHOGY4tzx2fEnScSUOdXoRC7pDnQm5Diw7z3u6Tn
 u8mnudXw8FUjdq6cdA4wZDrqKpovQKu57p6mo4sJD3UULELK/XQOAZimg2cR9gwElwpg
 G54XZ4Ac88w2YtyRqEhplZqhHD/+g8boht2TETOHs9Yfv1mroYPXwr/p7Wz7LDxqx8fb
 CM3uctMWnVw2nf61Iv0auRtdJhBJYKGSPsenF7pOtmYuteA/MYMYqYYnYa+zrNikTjnb
 eS+w==
X-Gm-Message-State: AFqh2kpUpZttmnlxDLTIpf/Y9WzVY3YeAcuRLyrCw/1LMnrBUPNen6CX
 fVw/7Viidpx8/gSaeIOgYIFvBA==
X-Google-Smtp-Source: AMrXdXtitU/hzi7PX6mIz2Iv5c9YRqmR6odx3vfaEWoVELfGwtW+ejnlYDR5J+ldGVcuwP1ihyZCPQ==
X-Received: by 2002:a05:6830:1:b0:684:cbd9:b77c with SMTP id
 c1-20020a056830000100b00684cbd9b77cmr2954861otp.38.1673630297753; 
 Fri, 13 Jan 2023 09:18:17 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v25-20020a05683011d900b00683e4084740sm10695872otq.10.2023.01.13.09.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:18:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Date: Fri, 13 Jan 2023 14:18:05 -0300
Message-Id: <20230113171805.470252-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113171805.470252-1-dbarboza@ventanamicro.com>
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x341.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 17:18:24 -0000

Recent hw/risc/boot.c changes caused a regression in an use case with
the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
stopped working. The reason seems to be that Xvisor is using 64 bit to
encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
sign-extending the result with '1's [1].

This can very well be an issue with Xvisor, but since it's not hard to
amend it in our side we're going for it. Use a translate_fn() callback
to be called by load_elf_ram_sym() and clear the higher bits of the
result if we're running a 32 bit CPU.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 23 ++++++++++++++++++++++-
 hw/riscv/microchip_pfsoc.c |  4 ++--
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        |  4 ++--
 hw/riscv/spike.c           |  2 +-
 hw/riscv/virt.c            |  4 ++--
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e868fb6ade..7f8295bf5e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -213,7 +213,27 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
     }
 }
 
+static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
+{
+    RISCVHartArrayState *harts = opaque;
+
+    /*
+     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
+     * it can be padded with '1's) if the hypervisor, for some
+     * reason, is using 64 bit addresses with 32 bit guests.
+     *
+     * Clear the higher bits to avoid the padding if we're
+     * running a 32 bit CPU.
+     */
+    if (riscv_is_32bit(harts)) {
+        return addr & 0x0fffffff;
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
@@ -231,7 +251,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
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
index 9a75d4aa62..214430d40c 100644
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
index c517885e6e..b3aac2178b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,7 +307,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0], kernel_start_addr,
                                          true, htif_symbol_callback);
     } else {
        /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a931ed05ab..60c8729b5f 100644
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
-- 
2.39.0


