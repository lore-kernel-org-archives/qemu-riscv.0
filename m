Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqsAt-0006xz-0o
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAe-0006f9-Lt
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:40 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAb-0001Ks-I8
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a920d484bdso35171295ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327256; x=1684919256;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V1C7OykMpoXKEusMXOtZrF25Xp4T+CZZzfiDcQyz3OQ=;
 b=ZvFWEKDehaVzaau86jVumvsKMXlkiQ2Mu1tO9DD1DtYEddI2PJXMw2aCBWSLqu71LK
 JUW1Y9oU1MP3lIUZYm2Is1HBXy04LtusBQrWaEt7ivIUKObVKPdZ/8BcwccZv/14/cct
 ExZxn/F9fb5CafZytW1jVCvcjoqDXxCdOP8VkVECah9LnXt2AxjhC9Z4cqh/zRYbbJVw
 ewMypNuZmoV8pSmoLZzfc4mONA4g7fmt8tu3iBIhPW0pN9UMHYTWbCV8A1TEhXnR8XWf
 PbkA+seF/DBO/bRXzrqAPNn2/Ntz+z55Ez2lmRnR3OC/aWt7VzCccAQY0I63m5s3z2U6
 nM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327256; x=1684919256;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1C7OykMpoXKEusMXOtZrF25Xp4T+CZZzfiDcQyz3OQ=;
 b=QNmI0lEV32CLhLXxUbaJz6clDPeM44fhpR8KF9VYLhB9JixnZD+6PxWxYFyUHWN65B
 IAIj5nCYJB+M/ShtFl/NMWd9U0DiwJRer0ZVC9t/Dv6b0+S8F/djoLo7u2jJnx7GKXF5
 MUrVyj5aNrid/YzsXM0br785l9wpGGd73Ahvi1e0/Bn97kyoOu7eCIm5GGDBf3qpsGx8
 j5f+J9OKcN4Gae/Z1f5n7IBmutPo0ZHnyUDkPxHdu7kH2NbcwDy98fvpplLLiHJ1DLgs
 mrC937+lkyDUMiEYRBtWl52pT7ws2Pg1FRAqmUq2mcQw2aCCHTu5T8FLoHd9CfpoQXei
 NQdA==
X-Gm-Message-State: AC+VfDw6SnHBYF32TZF321ZE5hN7BW3MTbeFzIo4Y/sYLSCZNlBzqWHP
 F/9JQrMZsQD+5bluMvwY1MDQiw==
X-Google-Smtp-Source: ACHHUZ5aHhBhqVJlpjTFm3CnvGrY8b+Zf8hCcHlhRnS4xUF8o+5w1p6yfB9R54vLFBH32C17LXxVxA==
X-Received: by 2002:a17:902:ec89:b0:1a9:7ffb:5ed0 with SMTP id
 x9-20020a170902ec8900b001a97ffb5ed0mr753168plg.59.1682327256248; 
 Mon, 24 Apr 2023 02:07:36 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:35 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/6] target/riscv: support the AIA device emulateion with KVM
 enabled
Date: Mon, 24 Apr 2023 09:07:04 +0000
Message-Id: <20230424090716.15674-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 09:07:43 -0000

Remove M mode AIA devices when using KVM acceleration

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 204 +++++++++++++++++++++++++-----------------------
 1 file changed, 108 insertions(+), 96 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..18aede7b23 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -511,54 +511,56 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
     imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
 
-    /* M-level IMSIC node */
-    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
-    }
-    imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
-        imsic_addr = memmap[VIRT_IMSIC_M].base +
-                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
-        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
-        imsic_regs[socket * 4 + 2] = 0;
-        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+    if (!kvm_enabled()) {
+        /* M-level IMSIC node */
+        for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+            imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+            imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
         }
-    }
-    imsic_name = g_strdup_printf("/soc/imsics@%lx",
-        (unsigned long)memmap[VIRT_IMSIC_M].base);
-    qemu_fdt_add_subnode(mc->fdt, imsic_name);
-    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
-        "riscv,imsics");
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
-        FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
-        VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
-    if (riscv_socket_count(mc) > 1) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
-            imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
-            IMSIC_MMIO_GROUP_MIN_SHIFT);
-    }
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
+        imsic_max_hart_per_socket = 0;
+        for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+            imsic_addr = memmap[VIRT_IMSIC_M].base +
+                socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+            imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+            imsic_regs[socket * 4 + 0] = 0;
+            imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+            imsic_regs[socket * 4 + 2] = 0;
+            imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+            if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+                imsic_max_hart_per_socket = s->soc[socket].num_harts;
+            }
+        }
+        imsic_name = g_strdup_printf("/soc/imsics@%lx",
+                (unsigned long)memmap[VIRT_IMSIC_M].base);
+        qemu_fdt_add_subnode(mc->fdt, imsic_name);
+        qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+                "riscv,imsics");
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+                FDT_IMSIC_INT_CELLS);
+        qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+                NULL, 0);
+        qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+                NULL, 0);
+        qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+                imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+        qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+                riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+                VIRT_IRQCHIP_NUM_MSIS);
+        qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
+                VIRT_IRQCHIP_IPI_MSI);
+        if (riscv_socket_count(mc) > 1) {
+            qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+                    imsic_num_bits(imsic_max_hart_per_socket));
+            qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+                    imsic_num_bits(riscv_socket_count(mc)));
+            qemu_fdt_setprop_cell(mc->fdt, imsic_name,
+                    "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT);
+        }
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
 
-    g_free(imsic_name);
+        g_free(imsic_name);
+    }
 
     /* S-level IMSIC node */
     for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
@@ -637,37 +639,41 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     aplic_s_phandle = (*phandle)++;
     aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
 
-    /* M-level APLIC node */
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
-        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
-    }
-    aplic_addr = memmap[VIRT_APLIC_M].base +
-                 (memmap[VIRT_APLIC_M].size * socket);
-    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
-    qemu_fdt_add_subnode(mc->fdt, aplic_name);
-    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,aplic");
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
-        "#interrupt-cells", FDT_APLIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
-        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
-    } else {
-        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
-            msi_m_phandle);
+    if (!kvm_enabled()) {
+        /* M-level APLIC node */
+        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+            aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+            aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+        }
+        aplic_addr = memmap[VIRT_APLIC_M].base +
+            (memmap[VIRT_APLIC_M].size * socket);
+        aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+        qemu_fdt_add_subnode(mc->fdt, aplic_name);
+        qemu_fdt_setprop_string(mc->fdt, aplic_name,
+                    "compatible", "riscv,aplic");
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+                "#interrupt-cells", FDT_APLIC_INT_CELLS);
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
+        if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+            qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+                    aplic_cells,
+                    s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+        } else {
+            qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+                    msi_m_phandle);
+        }
+        qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+                0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+                VIRT_IRQCHIP_NUM_SOURCES);
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
+                aplic_s_phandle);
+        qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
+                aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
+        riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
+        g_free(aplic_name);
     }
-    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
-        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
-        VIRT_IRQCHIP_NUM_SOURCES);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
-        aplic_s_phandle);
-    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
-        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
-    g_free(aplic_name);
 
     /* S-level APLIC node */
     for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
@@ -1159,16 +1165,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
     int i;
     hwaddr addr;
     uint32_t guest_bits;
-    DeviceState *aplic_m;
+    DeviceState *aplic_s = NULL;
+    DeviceState *aplic_m = NULL;
     bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
 
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
+                        base_hartid + i, true, 1,
+                        VIRT_IRQCHIP_NUM_MSIS);
+            }
         }
 
         /* Per-socket S-level IMSICs */
@@ -1181,19 +1191,21 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
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
+    if (!kvm_enabled()) {
+        /* Per-socket M-level APLIC */
+        aplic_m = riscv_aplic_create(
+                memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
+                memmap[VIRT_APLIC_M].size,
+                (msimode) ? 0 : base_hartid,
+                (msimode) ? 0 : hart_count,
+                VIRT_IRQCHIP_NUM_SOURCES,
+                VIRT_IRQCHIP_NUM_PRIO_BITS,
+                msimode, true, NULL);
+    }
+
+    if (aplic_m || kvm_enabled()) {
         /* Per-socket S-level APLIC */
-        riscv_aplic_create(
+        aplic_s = riscv_aplic_create(
             memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
             memmap[VIRT_APLIC_S].size,
             (msimode) ? 0 : base_hartid,
@@ -1203,7 +1215,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
             msimode, false, aplic_m);
     }
 
-    return aplic_m;
+    return kvm_enabled() ? aplic_s : aplic_m;
 }
 
 static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
-- 
2.17.1


