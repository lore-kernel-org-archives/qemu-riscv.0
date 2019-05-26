Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxX-0003np-PF
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxI-0003Hg-69
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgD-0006LT-03
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgC-0006K4-R2
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:28 -0400
Received: by mail-pl1-f194.google.com with SMTP id g21so5660449plq.0
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=LmHxfevdxrjTuHHyIXa1iRY8rRmXq0z0MCT3zdJKqfI=;
	b=WuTahg/SNz0E1+vFlsP/EWuMwICpj4e84GdRl9EpX8akYdHVj3Pmxi9qvn+2HNVItd
	AlWAO2bVgSrLlPKejfC/JNlOEzWlFlS8quy4iqKxgI8U088dFjHEvt7djWKQRdSJ94FZ
	8dnPnE+kQH3onLL+TS/MmWBrMVTZSj8x4KMdJn1xT7ukfMrFLtnDN48cDGlaehYcHha0
	6grnRFl70wjkONXQhwitZsYHccSIxCUaRf/2aXKzVj8z268+EDq6A9WNNG4UMZRpQtsb
	z3KlkMwzjVdvUi4BmJ6xTy9pmr/Fi2T9anJaDibash6IXlFkxPmvg+B1PaxpZhFRhiCn
	ryUA==
X-Gm-Message-State: APjAAAVYn9ruYMMkVFM0HjI+/kKP0tddNhzQ2IMg+egUQ2LLyGrvbiRt
	ZATkbR2Rpn5vBPQYcvEBqDIYqlVECJ8=
X-Google-Smtp-Source: APXvYqwpbqZBQYCGwG1M0XBY6PU00CSc4N/gaeMtlreIzJ7hC5fXnVcy3aExf/pXv0Cp5g6At0tCSA==
X-Received: by 2002:a17:902:2a69:: with SMTP id
	i96mr21367354plb.218.1558833027310; 
	Sat, 25 May 2019 18:10:27 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	x10sm9085346pfj.136.2019.05.25.18.10.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:26 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:37 -0700
Message-Id: <20190526010948.3923-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Igor Mammedov <imammedo@redhat.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.194
Subject: [Qemu-riscv] [PULL 18/29] riscv: spike: Add a generic spike machine
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 May 2019 01:28:09 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Add a generic spike machine (not tied to a version) and deprecate the
spike mahines that are tied to a specific version. As we can now specify
the CPU via the command line we no londer need specific versions of the
spike machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/spike.c     | 106 ++++++++++++++++++++++++++++++++++++++++++-
 qemu-deprecated.texi |   6 +++
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2a000a58009a..5b33d4be3bbc 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -39,6 +39,7 @@
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "elf.h"
 
@@ -160,7 +161,89 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
         qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
- }
+}
+
+static void spike_board_init(MachineState *machine)
+{
+    const struct MemmapEntry *memmap = spike_memmap;
+
+    SpikeState *s = g_new0(SpikeState, 1);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
+    int i;
+
+    /* Initialize SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
+                            &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized",
+                            &error_abort);
+
+    /* register system main memory (actual RAM) */
+    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
+        main_mem);
+
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+
+    /* boot rom */
+    memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
+                           memmap[SPIKE_MROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
+                                mask_rom);
+
+    if (machine->kernel_filename) {
+        load_kernel(machine->kernel_filename);
+    }
+
+    /* reset vector */
+    uint32_t reset_vec[8] = {
+        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
+        0xf1402573,                  /*     csrr   a0, mhartid  */
+#if defined(TARGET_RISCV32)
+        0x0182a283,                  /*     lw     t0, 24(t0) */
+#elif defined(TARGET_RISCV64)
+        0x0182b283,                  /*     ld     t0, 24(t0) */
+#endif
+        0x00028067,                  /*     jr     t0 */
+        0x00000000,
+        memmap[SPIKE_DRAM].base,     /* start: .dword DRAM_BASE */
+        0x00000000,
+                                     /* dtb: */
+    };
+
+    /* copy in the reset vector in little_endian byte order */
+    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
+        reset_vec[i] = cpu_to_le32(reset_vec[i]);
+    }
+    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
+                          memmap[SPIKE_MROM].base, &address_space_memory);
+
+    /* copy in the device tree */
+    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
+            memmap[SPIKE_MROM].size - sizeof(reset_vec)) {
+        error_report("not enough space to store device-tree");
+        exit(1);
+    }
+    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
+    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
+                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
+                          &address_space_memory);
+
+    /* initialize HTIF using symbols found in load_kernel */
+    htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
+
+    /* Core Local Interruptor (timer and IPI) */
+    sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
+        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+}
 
 static void spike_v1_10_0_board_init(MachineState *machine)
 {
@@ -172,6 +255,12 @@ static void spike_v1_10_0_board_init(MachineState *machine)
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
 
+    if (!qtest_enabled()) {
+        info_report("The Spike v1.10.0 machine has been deprecated. "
+                    "Please use the generic spike machine and specify the ISA "
+                    "versions using -cpu.");
+    }
+
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
@@ -254,6 +343,12 @@ static void spike_v1_09_1_board_init(MachineState *machine)
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
 
+    if (!qtest_enabled()) {
+        info_report("The Spike v1.09.1 machine has been deprecated. "
+                    "Please use the generic spike machine and specify the ISA "
+                    "versions using -cpu.");
+    }
+
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
@@ -359,8 +454,17 @@ static void spike_v1_10_0_machine_init(MachineClass *mc)
     mc->desc = "RISC-V Spike Board (Privileged ISA v1.10)";
     mc->init = spike_v1_10_0_board_init;
     mc->max_cpus = 1;
+}
+
+static void spike_machine_init(MachineClass *mc)
+{
+    mc->desc = "RISC-V Spike Board";
+    mc->init = spike_board_init;
+    mc->max_cpus = 1;
     mc->is_default = 1;
+    mc->default_cpu_type = SPIKE_V1_10_0_CPU;
 }
 
 DEFINE_MACHINE("spike_v1.9.1", spike_v1_09_1_machine_init)
 DEFINE_MACHINE("spike_v1.10", spike_v1_10_0_machine_init)
+DEFINE_MACHINE("spike", spike_machine_init)
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 9dca81f461e3..50292d820b0d 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -175,6 +175,12 @@ This machine type uses an unmaintained firmware, broken in lots of ways,
 and unable to start post-2004 operating systems. 40p machine type should be
 used instead.
 
+@subsection spike_v1.9.1 and spike_v1.10 (since 4.1)
+
+The version specific Spike machines have been deprecated in favour of the
+generic ``spike`` machine. If you need to specify an older version of the RISC-V
+spec you can use the ``-cpu rv64gcsu,priv_spec=v1.9.1`` command line argument.
+
 @section Device options
 
 @subsection Block device options
-- 
2.21.0


