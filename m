Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNGet-0006dG-Q0
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 12:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGeq-0006cD-N3
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 12:12:29 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGeo-0004Ju-O4
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 12:12:28 -0500
Received: by mail-oi1-x231.google.com with SMTP id s66so16283074oib.7
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 09:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcs1yzLvpBWElN3ZJOkxPk7Gw6e8VUiSzo/dfnRmEKA=;
 b=fMkgTGhiv6MTQ6/qvxrWU7/KnsvNJmkVfwuX98qZ+Al8OO6LOB6bIGC3Q0rMD21gEh
 7Jx0KIukDvdnJSgfg82mzJgMcM4LrBOPluK93UVctRp4jxSj/MPzhsm41Ht14a+FvqGt
 6jiMki/4MX06Z1XW2Y3M7a2ark54HJ5KtMP0HDS5B0X/zRZVONGuVfvar4+JvPrLLMGG
 234o+CX02kGmoFyxMn3E428VaRzdDDaFD3TKMG65u7miH9r26YeY4Z9yVF8UzFBI2Hrk
 +XpJHwIOaQCS5GYM0CgaODpotZQn89rKf5nM/G1P9daTyyqxFJkO00bKbEECQTxbTJqS
 iJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcs1yzLvpBWElN3ZJOkxPk7Gw6e8VUiSzo/dfnRmEKA=;
 b=LRij3LRLZSCqrczeuzvCXdUd8i45qJ/KAJazVeZYQOoN1rrLz7IChTzk85JNNbT6jl
 9I3ASKBu1N8ukH33Z2LG2yllTEbgjyeivUcvr87F7UNQFSVMKdSg0xjVpeZkun5/DNrZ
 HUYhE/IOyMnLrSF+hs8gLeUIz0MPKVvWXNqm0wfzW0VjAGwyhY5G24iCdJoI3l3K2SIh
 Mkdo9SRFnJK1tWLBZ253juZgl9n9YnwEwEMvTnLq+6kMq14nuP+o8VUq7D8p/O0U4XxH
 B7aH6WKzoJCiU1SGX+1GcFcWQzRo58gLjn+NGUjDQ3RWgnvXWO1ECe64KSBvQE3mk6Mk
 73Vg==
X-Gm-Message-State: AO0yUKXHzMiaY2xKYKbViOFvrbOvC0df2eG0yjS49vdfcApiFAop6LiH
 VmkLDOlHBojM14bvGvvnd3ucJQ==
X-Google-Smtp-Source: AK7set93CCwBmgxfatdMNvx8m4BbVSeW/byNWmmujOROFgQpIwWTjvcDYN64xjIGoHGRtFMAH2eh4A==
X-Received: by 2002:a05:6808:1448:b0:378:5a94:8b22 with SMTP id
 x8-20020a056808144800b003785a948b22mr1884816oiv.47.1675271545372; 
 Wed, 01 Feb 2023 09:12:25 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056808068c00b003749e231db7sm7100627oig.30.2023.02.01.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:12:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
Date: Wed,  1 Feb 2023 14:12:12 -0300
Message-Id: <20230201171212.1219375-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
References: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 01 Feb 2023 17:12:29 -0000

As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
mem_size (which is defaulted to MachineState::ram_size in all boards)
and the FDT pointer. And it makes a very important assumption: the DRAM
interval dram_base + mem_size is contiguous. This is indeed the case for
most boards that use a FDT.

The Icicle Kit board works with 2 distinct RAM banks that are separated
by a gap. We have a lower bank with 1GiB size, a gap follows, then at
64GiB the high memory starts. MachineClass::default_ram_size for this
board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
size, meaning that there we'll always have at least 512 MiB in the Hi
RAM area.

Using riscv_compute_fdt_addr() in this board is weird because not only
the board has sparse RAM, and it's calling it using the base address of
the Lo RAM area, but it's also using a mem_size that we have guarantees
that it will go up to the Hi RAM. All the function assumptions doesn't
work for this board.

In fact, what makes the function works at all in this case is a
coincidence. Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
(2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
the FDT under a 3Gb address, which happens to be exactly at the end of
DRAM_LO. If the base address of the Lo area started later than 3Gb this
function would be unusable by the board. Changing any assumptions inside
riscv_compute_fdt_addr() can also break it by accident as well.

Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
Icicle Kit board and for future boards that might have sparse RAM
topologies to worry about:

- relieve the condition that the dram_base + mem_size area is contiguous,
since this is already not the case today;

- receive an extra 'dram_size' size attribute that refers to a contiguous
RAM block that the board wants the FDT to reside on.

Together with 'mem_size' and 'fdt', which are now now being consumed by a
MachineState pointer, we're able to make clear assumptions based on the
DRAM block and total mem_size available to ensure that the FDT will be put
in a valid RAM address.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 35 +++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c |  3 ++-
 hw/riscv/sifive_u.c        |  3 ++-
 hw/riscv/spike.c           |  3 ++-
 hw/riscv/virt.c            |  3 ++-
 include/hw/riscv/boot.h    |  2 +-
 6 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2e53494b08..c7e0e50bd8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -250,33 +250,44 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
 }
 
 /*
- * The FDT should be put at the farthest point possible to
- * avoid overwriting it with the kernel/initrd.
+ * This function makes an assumption that the DRAM interval
+ * 'dram_base' + 'dram_size' is contiguous.
  *
- * This function makes an assumption that the DRAM is
- * contiguous. It also cares about 32-bit systems and
- * will limit fdt_addr to be addressable by them even for
- * 64-bit CPUs.
+ * Considering that 'dram_end' is the lowest value between
+ * the end of the DRAM block and MachineState->ram_size, the
+ * FDT location will vary according to 'dram_base':
+ *
+ * - if 'dram_base' is less that 3072 MiB, the FDT will be
+ * put at the lowest value between 3072 MiB and 'dram_end';
+ *
+ * - if 'dram_base' is higher than 3072 MiB, the FDT will be
+ * put at 'dram_end'.
  *
  * The FDT is fdt_packed() during the calculation.
  */
-uint64_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
-                                void *fdt)
+uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
+                                MachineState *ms)
 {
-    uint64_t temp;
-    hwaddr dram_end = dram_base + mem_size;
-    int ret = fdt_pack(fdt);
+    int ret = fdt_pack(ms->fdt);
+    hwaddr dram_end, temp;
     int fdtsize;
 
     /* Should only fail if we've built a corrupted tree */
     g_assert(ret == 0);
 
-    fdtsize = fdt_totalsize(fdt);
+    fdtsize = fdt_totalsize(ms->fdt);
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
         exit(1);
     }
 
+    /*
+     * A dram_size == 0, usually from a MemMapEntry[].size element,
+     * means that the DRAM block goes all the way to ms->ram_size.
+     */
+    dram_end = dram_base;
+    dram_end += dram_size ? MIN(ms->ram_size, dram_size) : ms->ram_size;
+
     /*
      * We should put fdt as far as possible to avoid kernel/initrd overwriting
      * its content. But it should be addressable by 32 bit system as well.
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 17499d4152..2b91e49561 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -642,7 +642,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                               machine->ram_size, machine->fdt);
+                                               memmap[MICROCHIP_PFSOC_DRAM_LO].size,
+                                               machine);
         riscv_load_fdt(fdt_load_addr, machine->fdt);
 
         /* Load the reset vector */
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 626d4dc2f3..d3ab7a9cda 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -617,7 +617,8 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+                                           memmap[SIFIVE_U_DEV_DRAM].size,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index f1114f2c71..cc3f6dac17 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -325,7 +325,8 @@ static void spike_board_init(MachineState *machine)
     }
 
     fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+                                           memmap[SPIKE_DRAM].size,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2e0a0cdb17..a061151a6f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1304,7 +1304,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
     }
 
     fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+                                           memmap[VIRT_DRAM].size,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 46de4ec46b..511390f60e 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,7 +48,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
-                                void *fdt);
+                                MachineState *ms);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.1


