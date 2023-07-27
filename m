Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87D1C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 11:44:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOyAw-0003Oo-3c; Thu, 27 Jul 2023 06:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAu-0003OX-6C
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:52 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyAr-0003sv-UW
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:24:51 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b9b52724ccso664619a34.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690453488; x=1691058288;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6yy/ilJ4eRlk81CPTCEAUhyUjpFl7zB/SF7tY6vWp9Q=;
 b=EWgco6mOpnFYnxo2hGYTpZBwktST5G7NjzO3walsp894NZMx26aWQlniKCVYBSn+gX
 ZtZIE1gF6fZa9TQYnlU9YIfslZQibyQ520LLJOik5WaAVlqq7epT7KlpRXpekHZY1AJW
 z6Hf0QBJ6PXywXMxd94fOJymttSkisBeCyLOo5lT1XKrZCDWt+r2+yqGSKAIpxkWltd/
 /G3Fix8LHhG6eS2WJi8KpHUCMIp2u7ANYEldfPDoQaTx7+g08hqofAk05Et1vDJYi+bH
 x842P5ukkuDB9EE9USqx6XWFSs16DtPXtrAgjeG54bYfzlnb7iPpN2pPoWaFpqySCnjt
 ImLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453488; x=1691058288;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yy/ilJ4eRlk81CPTCEAUhyUjpFl7zB/SF7tY6vWp9Q=;
 b=Rs3NH8dBgK5PEY819uuq3KYpagbToQl+HEX+PD3F3SYKbLbXzxC5cleGqCQNqY88Kc
 Ae7NKEo44vcAJ6mSP/+pRS/uzK2HoL3xNb3fjFxKgfru2CM+BUL4E4YUOxwvotgfCSTa
 HAevzGTNd3/7fSrwDyDsEdDSFwXdKbnN272R3CIpps45yC77UZBx1JGqHNSAx/wi3Duh
 F/5RUNEYTLtnhzPJuFmq/aPijNxF6W2zIEeKazG+GpRUKIjscSW5/FqY4LWH5PMEDKO/
 ve1II1SFJSynNwk36zHhkG95AEPbqsCykpSs0numUGCGN9HUk6bchObgBLJowc93ZKcU
 e18A==
X-Gm-Message-State: ABy/qLYRN8L+qQlBEHD6S1w77IOi8dLvgDrq0hsY9Ki1XsVAMkvSWlou
 7+h2skZVOshhUtZSsoxWLDF8LA==
X-Google-Smtp-Source: APBJJlEItx4fGp2NhStoWwWHVczs+3bVjo6yZrBaH71XSwXLXYElZVB+DMliOQsc+NtoHfaYKBZH2A==
X-Received: by 2002:a05:6808:138d:b0:3a4:3192:1627 with SMTP id
 c13-20020a056808138d00b003a431921627mr3005146oiw.42.1690453488502; 
 Thu, 27 Jul 2023 03:24:48 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b001b882880550sm1230139ple.282.2023.07.27.03.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:24:48 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v7 1/5] target/riscv: support the AIA device emulation with
 KVM enabled
Date: Thu, 27 Jul 2023 10:24:33 +0000
Message-Id: <20230727102439.22554-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230727102439.22554-1-yongxuan.wang@sifive.com>
References: <20230727102439.22554-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-ot1-x32f.google.com
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

In this patch, we create the APLIC and IMSIC FDT helper functions and
remove M mode AIA devices when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 290 +++++++++++++++++++++++-------------------------
 1 file changed, 137 insertions(+), 153 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d90286dc46..f595380be1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -516,79 +516,28 @@ static uint32_t imsic_num_bits(uint32_t count)
     return ret;
 }
 
-static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
-                             uint32_t *phandle, uint32_t *intc_phandles,
-                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
+                                 uint32_t *intc_phandles, uint32_t msi_phandle,
+                                 bool m_mode, uint32_t imsic_guest_bits)
 {
     int cpu, socket;
     char *imsic_name;
     MachineState *ms = MACHINE(s);
     int socket_count = riscv_socket_count(ms);
-    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t imsic_max_hart_per_socket;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
 
-    *msi_m_phandle = (*phandle)++;
-    *msi_s_phandle = (*phandle)++;
     imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
     imsic_regs = g_new0(uint32_t, socket_count * 4);
 
-    /* M-level IMSIC node */
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
     }
-    imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < socket_count; socket++) {
-        imsic_addr = memmap[VIRT_IMSIC_M].base +
-                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
-        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
-        imsic_regs[socket * 4 + 2] = 0;
-        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
-        }
-    }
-    imsic_name = g_strdup_printf("/soc/imsics@%lx",
-        (unsigned long)memmap[VIRT_IMSIC_M].base);
-    qemu_fdt_add_subnode(ms->fdt, imsic_name);
-    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
-        "riscv,imsics");
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
-        FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
-        NULL, 0);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
-        NULL, 0);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
-        socket_count * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
-        VIRT_IRQCHIP_NUM_MSIS);
-    if (socket_count > 1) {
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
-            imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(socket_count));
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
-            IMSIC_MMIO_GROUP_MIN_SHIFT);
-    }
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
-
-    g_free(imsic_name);
 
-    /* S-level IMSIC node */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
-    }
-    imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
     imsic_max_hart_per_socket = 0;
     for (socket = 0; socket < socket_count; socket++) {
-        imsic_addr = memmap[VIRT_IMSIC_S].base +
-                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
                      s->soc[socket].num_harts;
         imsic_regs[socket * 4 + 0] = 0;
@@ -599,119 +548,151 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
             imsic_max_hart_per_socket = s->soc[socket].num_harts;
         }
     }
-    imsic_name = g_strdup_printf("/soc/imsics@%lx",
-        (unsigned long)memmap[VIRT_IMSIC_S].base);
+
+    imsic_name = g_strdup_printf("/soc/imsics@%lx", (unsigned long)base_addr);
     qemu_fdt_add_subnode(ms->fdt, imsic_name);
-    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
-        "riscv,imsics");
+    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible", "riscv,imsics");
     qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
-        FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
-        NULL, 0);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
-        NULL, 0);
+                          FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller", NULL, 0);
     qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+                     imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
-        socket_count * sizeof(uint32_t) * 4);
+                     socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
-        VIRT_IRQCHIP_NUM_MSIS);
+                     VIRT_IRQCHIP_NUM_MSIS);
+
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,guest-index-bits",
-            imsic_guest_bits);
+                              imsic_guest_bits);
     }
+
     if (socket_count > 1) {
         qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
-            imsic_num_bits(imsic_max_hart_per_socket));
+                              imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(socket_count));
+                              imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
-            IMSIC_MMIO_GROUP_MIN_SHIFT);
+                              IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_s_phandle);
-    g_free(imsic_name);
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", msi_phandle);
 
+    g_free(imsic_name);
     g_free(imsic_regs);
     g_free(imsic_cells);
 }
 
-static void create_fdt_socket_aplic(RISCVVirtState *s,
-                                    const MemMapEntry *memmap, int socket,
-                                    uint32_t msi_m_phandle,
-                                    uint32_t msi_s_phandle,
-                                    uint32_t *phandle,
-                                    uint32_t *intc_phandles,
-                                    uint32_t *aplic_phandles)
+static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle, uint32_t *intc_phandles,
+                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+
+    if (!kvm_enabled()) {
+        /* M-level IMSIC node */
+        create_fdt_one_imsic(s, memmap[VIRT_IMSIC_M].base, intc_phandles,
+                             *msi_m_phandle, true, 0);
+    }
+
+    /* S-level IMSIC node */
+    create_fdt_one_imsic(s, memmap[VIRT_IMSIC_S].base, intc_phandles,
+                         *msi_s_phandle, false,
+                         imsic_num_bits(s->aia_guests + 1));
+
+}
+
+static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
+                                 unsigned long aplic_addr, uint32_t aplic_size,
+                                 uint32_t msi_phandle,
+                                 uint32_t *intc_phandles,
+                                 uint32_t aplic_phandle,
+                                 uint32_t aplic_child_phandle,
+                                 bool m_mode)
 {
     int cpu;
     char *aplic_name;
     uint32_t *aplic_cells;
-    unsigned long aplic_addr;
     MachineState *ms = MACHINE(s);
-    uint32_t aplic_m_phandle, aplic_s_phandle;
 
-    aplic_m_phandle = (*phandle)++;
-    aplic_s_phandle = (*phandle)++;
     aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
 
-    /* M-level APLIC node */
     for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
         aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+        aplic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
     }
-    aplic_addr = memmap[VIRT_APLIC_M].base +
-                 (memmap[VIRT_APLIC_M].size * socket);
+
     aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
     qemu_fdt_add_subnode(ms->fdt, aplic_name);
     qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
     qemu_fdt_setprop_cell(ms->fdt, aplic_name,
-        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+                          "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
+
     if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
         qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+                         aplic_cells,
+                         s->soc[socket].num_harts * sizeof(uint32_t) * 2);
     } else {
-        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
-            msi_m_phandle);
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent", msi_phandle);
     }
+
     qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
-        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+                           0x0, aplic_addr, 0x0, aplic_size);
     qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
-        VIRT_IRQCHIP_NUM_SOURCES);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
-        aplic_s_phandle);
-    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
-        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
+                          VIRT_IRQCHIP_NUM_SOURCES);
+
+    if (aplic_child_phandle) {
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
+                              aplic_child_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
+                               aplic_child_phandle, 0x1,
+                               VIRT_IRQCHIP_NUM_SOURCES);
+    }
+
     riscv_socket_fdt_write_id(ms, aplic_name, socket);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_phandle);
+
     g_free(aplic_name);
+    g_free(aplic_cells);
+}
 
-    /* S-level APLIC node */
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
-        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+static void create_fdt_socket_aplic(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t msi_m_phandle,
+                                    uint32_t msi_s_phandle,
+                                    uint32_t *phandle,
+                                    uint32_t *intc_phandles,
+                                    uint32_t *aplic_phandles)
+{
+    char *aplic_name;
+    unsigned long aplic_addr;
+    MachineState *ms = MACHINE(s);
+    uint32_t aplic_m_phandle, aplic_s_phandle;
+
+    aplic_m_phandle = (*phandle)++;
+    aplic_s_phandle = (*phandle)++;
+
+    if (!kvm_enabled()) {
+        /* M-level APLIC node */
+        aplic_addr = memmap[VIRT_APLIC_M].base +
+                     (memmap[VIRT_APLIC_M].size * socket);
+        create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_M].size,
+                             msi_m_phandle, intc_phandles,
+                             aplic_m_phandle, aplic_s_phandle,
+                             true);
     }
+
+    /* S-level APLIC node */
     aplic_addr = memmap[VIRT_APLIC_S].base +
                  (memmap[VIRT_APLIC_S].size * socket);
+    create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_S].size,
+                         msi_s_phandle, intc_phandles,
+                         aplic_s_phandle, 0,
+                         false);
+
     aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
-    qemu_fdt_add_subnode(ms->fdt, aplic_name);
-    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
-        "#interrupt-cells", FDT_APLIC_INT_CELLS);
-    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
-        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
-    } else {
-        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
-            msi_s_phandle);
-    }
-    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
-        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
-        VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(ms, aplic_name, socket);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_s_phandle);
 
     if (!socket) {
         platform_bus_add_all_fdt_nodes(ms->fdt, aplic_name,
@@ -722,7 +703,6 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
 
     g_free(aplic_name);
 
-    g_free(aplic_cells);
     aplic_phandles[socket] = aplic_s_phandle;
 }
 
@@ -1163,16 +1143,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
     int i;
     hwaddr addr;
     uint32_t guest_bits;
-    DeviceState *aplic_m;
-    bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
+    DeviceState *aplic_s = NULL;
+    DeviceState *aplic_m = NULL;
+    bool msimode = aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
 
     if (msimode) {
-        /* Per-socket M-level IMSICs */
-        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        for (i = 0; i < hart_count; i++) {
-            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
-                               base_hartid + i, true, 1,
-                               VIRT_IRQCHIP_NUM_MSIS);
+        if (!kvm_enabled()) {
+            /* Per-socket M-level IMSICs */
+            addr = memmap[VIRT_IMSIC_M].base +
+                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+            for (i = 0; i < hart_count; i++) {
+                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                                   base_hartid + i, true, 1,
+                                   VIRT_IRQCHIP_NUM_MSIS);
+            }
         }
 
         /* Per-socket S-level IMSICs */
@@ -1185,29 +1169,29 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
         }
     }
 
-    /* Per-socket M-level APLIC */
-    aplic_m = riscv_aplic_create(
-        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
-        memmap[VIRT_APLIC_M].size,
-        (msimode) ? 0 : base_hartid,
-        (msimode) ? 0 : hart_count,
-        VIRT_IRQCHIP_NUM_SOURCES,
-        VIRT_IRQCHIP_NUM_PRIO_BITS,
-        msimode, true, NULL);
-
-    if (aplic_m) {
-        /* Per-socket S-level APLIC */
-        riscv_aplic_create(
-            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
-            memmap[VIRT_APLIC_S].size,
-            (msimode) ? 0 : base_hartid,
-            (msimode) ? 0 : hart_count,
-            VIRT_IRQCHIP_NUM_SOURCES,
-            VIRT_IRQCHIP_NUM_PRIO_BITS,
-            msimode, false, aplic_m);
+    if (!kvm_enabled()) {
+        /* Per-socket M-level APLIC */
+        aplic_m = riscv_aplic_create(memmap[VIRT_APLIC_M].base +
+                                     socket * memmap[VIRT_APLIC_M].size,
+                                     memmap[VIRT_APLIC_M].size,
+                                     (msimode) ? 0 : base_hartid,
+                                     (msimode) ? 0 : hart_count,
+                                     VIRT_IRQCHIP_NUM_SOURCES,
+                                     VIRT_IRQCHIP_NUM_PRIO_BITS,
+                                     msimode, true, NULL);
     }
 
-    return aplic_m;
+    /* Per-socket S-level APLIC */
+    aplic_s = riscv_aplic_create(memmap[VIRT_APLIC_S].base +
+                                 socket * memmap[VIRT_APLIC_S].size,
+                                 memmap[VIRT_APLIC_S].size,
+                                 (msimode) ? 0 : base_hartid,
+                                 (msimode) ? 0 : hart_count,
+                                 VIRT_IRQCHIP_NUM_SOURCES,
+                                 VIRT_IRQCHIP_NUM_PRIO_BITS,
+                                 msimode, false, aplic_m);
+
+    return kvm_enabled() ? aplic_s : aplic_m;
 }
 
 static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
-- 
2.17.1


