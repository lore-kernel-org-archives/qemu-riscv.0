Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ug9-0004ep-2L
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ug7-0004ZC-JT
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:37:07 -0500
Received: from [2607:f8b0:4864:20::52b] (port=35609
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ug4-0003VU-3V
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:37:07 -0500
Received: by mail-pg1-x52b.google.com with SMTP id v25so21337243pge.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KGCBs3wiW3EOrvs3R2SIhX2iTL4kPZOB5dG5yg9/wfE=;
 b=WcX2QJO3MwDfLZtXb3ohEx20Sow30RFBSWYrrnxc2ZB7UKpuo+V8zCq5CmYvrMe9rI
 i2CgEPFNXNFQK5uSxcHwxgtAXGoidvTpFGlKl6M3KYemMJ4IzVcyQWZX+JLB5KMGFa+B
 kmeh/lUMjTFlBPdl0kL3P0yLN6wnanL+3Pd4jj7Oo10KWNwTgCIUbk9hit9yxFpzNoDc
 Lthu2UK7LYuOF+YBU4KzD8C2s/lc4dqlz71K1SLPzMJS2de3FvqvCE2LXY1g46N11+EV
 GJJExL10lvn8JoiLt7h7N8IMtm4zBIlpYnwSLkpTX79wiItmOJFnfpdYJ+m6lAT+KR0n
 EgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGCBs3wiW3EOrvs3R2SIhX2iTL4kPZOB5dG5yg9/wfE=;
 b=qzExvY4izxwIfg2O9/1O6bFQUiB/Tahenl8z9WrOfDyKYlT0Oa5vNX8Bb5dvjF6RMN
 2sIDyLYTRzxC11HU3BSjXkv4HuAizDs/Qz9XoQB8WiCASoLAch2wSfMl+wvBpDlAvlam
 gJ7E+19OSLB+bSI/1/tU7Ipr5+iVqHM6Yn8O2yE7DZ6ccd0jRy9yy3EttyH3EE5ZEhEn
 iQvJdy5ZByhMna9Il+3MEvdvaJKYO23t8pC7ESZRKQOTwL9KpdczB5X6SoopVduxcQ53
 MBWpeMofU6JSyA0glaP1Q322wJ8gGDYLwH5U0DGz0OOQjAUaUu13G+oj0eJ30N6nWr08
 Ri/w==
X-Gm-Message-State: AOAM532XLcRbkG5/f0RWXHn8ETAg7dohzwYlHl1Kif/uX8gYxcwxv1Pz
 yE17yblPJg9SCUpQAgUwB+iqEA==
X-Google-Smtp-Source: ABdhPJzGxe8RmuyiDP2p3ET9Xi7K1imKHvFY0LFiv1wKPhGRVxmAFHZYZVn5Zigi/Z3F2HOte/FwoQ==
X-Received: by 2002:aa7:8c17:0:b0:4ba:7f42:68de with SMTP id
 c23-20020aa78c17000000b004ba7f4268demr31626246pfd.18.1640867822682; 
 Thu, 30 Dec 2021 04:37:02 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:37:01 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 21/23] hw/riscv: virt: Add optional AIA IMSIC support to
 virt machine
Date: Thu, 30 Dec 2021 18:05:37 +0530
Message-Id: <20211230123539.52786-22-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:37:07 -0000

From: Anup Patel <anup.patel@wdc.com>

We extend virt machine to emulate both AIA IMSIC and AIA APLIC
devices only when "aia=aplic-imsic" parameter is passed along
with machine name in the QEMU command-line. The AIA IMSIC is
only a per-HART MSI controller so we use AIA APLIC in MSI-mode
to forward all wired interrupts as MSIs to the AIA IMSIC.

We also provide "aia-guests=<xyz>" parameter which can be used
to specify number of VS-level AIA IMSIC Guests MMIO pages for
each HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 434 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  18 +-
 3 files changed, 369 insertions(+), 84 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index c30bb7cb6c..91bb9d21c4 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV_VIRT
     select SERIAL
     select RISCV_ACLINT
     select RISCV_APLIC
+    select RISCV_IMSIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 45d85d274f..7579f7b41f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
+#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -43,6 +44,18 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
@@ -58,6 +71,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =     { 0x24000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_IMSIC_S] =     { 0x28000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
@@ -309,7 +324,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
 {
     int cpu;
     char *name;
-    unsigned long addr;
+    unsigned long addr, size;
     uint32_t aclint_cells_size;
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
@@ -330,29 +345,38 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     }
     aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
 
-    addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
-    name = g_strdup_printf("/soc/mswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-mswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_mswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+        name = g_strdup_printf("/soc/mswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-mswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
-    addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-        (memmap[VIRT_CLINT].size * socket);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
+        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+            (memmap[VIRT_CLINT].size * socket);
+        size = memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
+    }
     name = g_strdup_printf("/soc/mtimer@%lx", addr);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible",
         "riscv,aclint-mtimer");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
-             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, size - RISCV_ACLINT_DEFAULT_MTIME,
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
@@ -360,19 +384,22 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
     g_free(name);
 
-    addr = memmap[VIRT_ACLINT_SSWI].base +
-        (memmap[VIRT_ACLINT_SSWI].size * socket);
-    name = g_strdup_printf("/soc/sswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-sswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_sswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_ACLINT_SSWI].base +
+            (memmap[VIRT_ACLINT_SSWI].size * socket);
+        name = g_strdup_printf("/soc/sswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
     g_free(aclint_mswi_cells);
     g_free(aclint_mtimer_cells);
@@ -425,10 +452,145 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static void create_fdt_socket_aia(RISCVVirtState *s,
-                                  const MemMapEntry *memmap, int socket,
-                                  uint32_t *phandle, uint32_t *intc_phandles,
-                                  uint32_t *aplic_phandles)
+static uint32_t imsic_num_bits(uint32_t count)
+{
+    uint32_t ret = 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle, uint32_t *intc_phandles,
+                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    int cpu, socket;
+    char *imsic_name;
+    MachineState *mc = MACHINE(s);
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+    imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+
+    /* M-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_M].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_M].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
+    g_free(imsic_name);
+
+    /* S-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_S].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                     s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_S].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle);
+    g_free(imsic_name);
+
+    g_free(imsic_regs);
+    g_free(imsic_cells);
+}
+
+static void create_fdt_socket_aplic(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t msi_m_phandle,
+                                    uint32_t msi_s_phandle,
+                                    uint32_t *phandle,
+                                    uint32_t *intc_phandles,
+                                    uint32_t *aplic_phandles)
 {
     int cpu;
     char *aplic_name;
@@ -454,8 +616,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_m_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -481,8 +648,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_s_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -499,13 +671,14 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
-                               uint32_t *irq_virtio_phandle)
+                               uint32_t *irq_virtio_phandle,
+                               uint32_t *msi_pcie_phandle)
 {
-    int socket;
     char *clust_name;
-    uint32_t *intc_phandles;
+    int socket, phandle_pos;
     MachineState *mc = MACHINE(s);
-    uint32_t xplic_phandles[MAX_NODES];
+    uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
+    uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -514,35 +687,53 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
 
+    intc_phandles = g_new0(uint32_t, mc->smp.cpus);
+
+    phandle_pos = mc->smp.cpus;
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
+
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
 
-        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
-
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, intc_phandles);
+            is_32_bit, &intc_phandles[phandle_pos]);
 
         create_fdt_socket_memory(s, memmap, socket);
 
+        g_free(clust_name);
+
         if (s->have_aclint) {
-            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_aclint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         } else {
-            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_clint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         }
+    }
+
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        create_fdt_imsic(s, memmap, phandle, intc_phandles,
+            &msi_m_phandle, &msi_s_phandle);
+        *msi_pcie_phandle = msi_s_phandle;
+    }
+
+    phandle_pos = mc->smp.cpus;
+    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
             create_fdt_socket_plic(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+                &intc_phandles[phandle_pos], xplic_phandles);
         } else {
-            create_fdt_socket_aia(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+            create_fdt_socket_aplic(s, memmap, socket,
+                msi_m_phandle, msi_s_phandle, phandle,
+                &intc_phandles[phandle_pos], xplic_phandles);
         }
-
-        g_free(intc_phandles);
-        g_free(clust_name);
     }
 
+    g_free(intc_phandles);
+
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
         if (socket == 0) {
             *irq_mmio_phandle = xplic_phandles[socket];
@@ -590,7 +781,8 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
 }
 
 static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
-                            uint32_t irq_pcie_phandle)
+                            uint32_t irq_pcie_phandle,
+                            uint32_t msi_pcie_phandle)
 {
     char *name;
     MachineState *mc = MACHINE(s);
@@ -610,6 +802,9 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
@@ -735,7 +930,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
-    uint32_t phandle = 1, irq_mmio_phandle = 1;
+    uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
 
     if (mc->dtb) {
@@ -765,11 +960,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
 
     create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
+        &msi_pcie_phandle);
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
-    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
 
     create_fdt_reset(s, memmap, &phandle);
 
@@ -884,30 +1080,55 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
     return ret;
 }
 
-static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
                                     const MemMapEntry *memmap, int socket,
                                     int base_hartid, int hart_count)
 {
+    int i;
+    hwaddr addr;
+    uint32_t guest_bits;
     DeviceState *aplic_m;
+    bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
+
+    if (msimode) {
+        /* Per-socket M-level IMSICs */
+        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                               base_hartid + i, true, 1,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+
+        /* Per-socket S-level IMSICs */
+        guest_bits = imsic_num_bits(aia_guests + 1);
+        addr = memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                               base_hartid + i, false, 1 + aia_guests,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+    }
 
     /* Per-socket M-level APLIC */
     aplic_m = riscv_aplic_create(
         memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
         memmap[VIRT_APLIC_M].size,
-        base_hartid, hart_count,
+        (msimode) ? 0 : base_hartid,
+        (msimode) ? 0 : hart_count,
         VIRT_IRQCHIP_NUM_SOURCES,
         VIRT_IRQCHIP_NUM_PRIO_BITS,
-        false, true, NULL);
+        msimode, true, NULL);
 
     if (aplic_m) {
         /* Per-socket S-level APLIC */
         riscv_aplic_create(
             memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
             memmap[VIRT_APLIC_S].size,
-            base_hartid, hart_count,
+            (msimode) ? 0 : base_hartid,
+            (msimode) ? 0 : hart_count,
             VIRT_IRQCHIP_NUM_SOURCES,
             VIRT_IRQCHIP_NUM_PRIO_BITS,
-            false, false, aplic_m);
+            msimode, false, aplic_m);
     }
 
     return aplic_m;
@@ -966,23 +1187,38 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
-        /* Per-socket CLINT */
-        riscv_aclint_swi_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            base_hartid, hart_count, false);
-        riscv_aclint_mtimer_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
-                RISCV_ACLINT_SWI_SIZE,
-            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
-            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
-
-        /* Per-socket ACLINT SSWI */
         if (s->have_aclint) {
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+                /* Per-socket ACLINT MTIMER */
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+            } else {
+                /* Per-socket ACLINT MSWI, MTIMER, and SSWI */
+                riscv_aclint_swi_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size,
+                    base_hartid, hart_count, false);
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+                riscv_aclint_swi_create(memmap[VIRT_ACLINT_SSWI].base +
+                        i * memmap[VIRT_ACLINT_SSWI].size,
+                    base_hartid, hart_count, true);
+            }
+        } else {
+            /* Per-socket SiFive CLINT */
             riscv_aclint_swi_create(
-                memmap[VIRT_ACLINT_SSWI].base +
-                    i * memmap[VIRT_ACLINT_SSWI].size,
-                base_hartid, hart_count, true);
+                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
+                base_hartid, hart_count, false);
+            riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                    i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
         }
 
         /* Per-socket interrupt controller */
@@ -990,8 +1226,9 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(memmap, i,
                                              base_hartid, hart_count);
         } else {
-            s->irqchip[i] = virt_create_aia(s->aia_type, memmap, i,
-                                            base_hartid, hart_count);
+            s->irqchip[i] = virt_create_aia(s->aia_type, s->aia_guests,
+                                            memmap, i, base_hartid,
+                                            hart_count);
         }
 
         /* Try to use different IRQCHIP instance based device type */
@@ -1138,6 +1375,27 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static char *virt_get_aia_guests(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    char val[32];
+
+    sprintf(val, "%d", s->aia_guests);
+    return g_strdup(val);
+}
+
+static void virt_set_aia_guests(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->aia_guests = atoi(val);
+    if (s->aia_guests < 0 || s->aia_guests > VIRT_IRQCHIP_MAX_GUESTS) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and %d.\n",
+                          VIRT_IRQCHIP_MAX_GUESTS);
+    }
+}
+
 static char *virt_get_aia(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
@@ -1147,6 +1405,9 @@ static char *virt_get_aia(Object *obj, Error **errp)
     case VIRT_AIA_TYPE_APLIC:
         val = "aplic";
         break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        val = "aplic-imsic";
+        break;
     default:
         val = "none";
         break;
@@ -1163,9 +1424,12 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
         s->aia_type = VIRT_AIA_TYPE_NONE;
     } else if (!strcmp(val, "aplic")) {
         s->aia_type = VIRT_AIA_TYPE_APLIC;
+    } else if (!strcmp(val, "aplic-imsic")) {
+        s->aia_type = VIRT_AIA_TYPE_APLIC_IMSIC;
     } else {
         error_setg(errp, "Invalid AIA interrupt controller type");
-        error_append_hint(errp, "Valid values are none, and aplic.\n");
+        error_append_hint(errp, "Valid values are none, aplic, and "
+                          "aplic-imsic.\n");
     }
 }
 
@@ -1187,6 +1451,7 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
+    char str[128];
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "RISC-V VirtIO board";
@@ -1213,7 +1478,14 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
                                           "conttoller. Valid values are "
-                                          "none, and aplic.");
+                                          "none, aplic, and aplic-imsic.");
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  virt_get_aia_guests,
+                                  virt_set_aia_guests);
+    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
+                 "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
+    object_class_property_set_description(oc, "aia-guests", str);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 43603a769c..e12e8ddcae 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,8 +24,10 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX 8
-#define VIRT_SOCKETS_MAX 8
+#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
+#define VIRT_SOCKETS_MAX_BITS          2
+#define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 typedef struct RISCVVirtState RISCVVirtState;
@@ -35,6 +37,7 @@ DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
 typedef enum RISCVVirtAIAType {
     VIRT_AIA_TYPE_NONE=0,
     VIRT_AIA_TYPE_APLIC,
+    VIRT_AIA_TYPE_APLIC_IMSIC,
 } RISCVVirtAIAType;
 
 struct RISCVVirtState {
@@ -50,6 +53,7 @@ struct RISCVVirtState {
     int fdt_size;
     bool have_aclint;
     RISCVVirtAIAType aia_type;
+    int aia_guests;
 };
 
 enum {
@@ -65,6 +69,8 @@ enum {
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
+    VIRT_IMSIC_M,
+    VIRT_IMSIC_S,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
@@ -81,8 +87,13 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_BASE_IPI 1
+#define VIRT_IRQCHIP_NUM_IPIS 7
+#define VIRT_IRQCHIP_NUM_MSIS 255
+#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
 
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
@@ -97,6 +108,7 @@ enum {
 #define FDT_PCI_INT_CELLS     1
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_MAX_INT_CELLS)
-- 
2.25.1


