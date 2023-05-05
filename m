Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1putou-0005iQ-7d
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 07:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putom-0005eW-9E
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 07:41:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putoj-000230-Va
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 07:41:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b60366047so1210382b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1683286901; x=1685878901;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ED475K7iTTzezseaGF1kULZD79f2YYYGax7omVv8YxA=;
 b=WRp21FGmiyRWZPBSjrmFQPiS61XVfulzFyIO8ifwr37r++vwBDs37KV6HS8uWXFJ9X
 RWbFCTLz8ahj3qZuy9UcVdq9qXKtF7kPuZrGkR/wfFc2EfjEQpo9NU5VDDXcS/aJypDZ
 UsCGSuUe0wZuYca53Dhwuay6D6VHqu96HZIPNFfTsgjxqVC0gwbd3A9I2EVOvFBPXCRz
 49yTzNh/u9sIB2X17tmsTlgQ4DC9IDke67Ham1f+o4LK6l3Xpver3hp/TA69+FiYFoiX
 HZZF5lIljp1mOjI+rz9vxjdfOo74m1pW+kzg8CJfO3rWc30cNMAnCaMDM9dL73xDENSb
 ltrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286901; x=1685878901;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ED475K7iTTzezseaGF1kULZD79f2YYYGax7omVv8YxA=;
 b=QPJ3Csggv0bg6RP5MW7DKSjnaW33hUbI0ZSpBAm+2q9h9SCNcuYjkRxiXndK8G8xX4
 VIy4ZYFBWvEJ94342nXZR+UhYHn/ae9bRBuvGOM3gCA67md3fZGu46Vaio3ufJWXhe2i
 wg//Clyzdi5fNBVBhsxAtb+rMg1+3na0ue+VZTFE9C7G/WqTD2ZJArYFCQVZzQqXzFmo
 5iLgbEJ9uZJbeJPLLpoxa3dE6z8GhF+L0FpPP/HZvUdlkVXWn2Zu0d7FufF0SCnSaFAl
 p9U8eclt4wfReZrgrKZ8QsaHpIt4e7cHvAiBmtvbLHm2JeoxCK25/dim1BrJQ87N6y4u
 SnlQ==
X-Gm-Message-State: AC+VfDziJ4QTnEq2oh/wQrP3O/Qh60eUfPVn9uyxzaVPK4S1ynC6HOUt
 F5VtdDuL2cTMwqjcgTA8FwZz6A==
X-Google-Smtp-Source: ACHHUZ76/Ku49ox10N+hLXCjtNCLTe3CYfa5qRdyNzYvJb/Srsr0gXijm+bGwoXAkPXKKnGUtKWkjA==
X-Received: by 2002:a05:6a00:1a46:b0:641:d9b:a444 with SMTP id
 h6-20020a056a001a4600b006410d9ba444mr2005103pfv.31.1683286900703; 
 Fri, 05 May 2023 04:41:40 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b0062d859a33d1sm1448171pfm.84.2023.05.05.04.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:41:39 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PTACH v2 2/6] target/riscv: support the AIA device emulateion with
 KVM enabled
Date: Fri,  5 May 2023 11:39:37 +0000
Message-Id: <20230505113946.23433-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230505113946.23433-1-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Fri, 05 May 2023 11:41:47 -0000

Remove M mode AIA devices when using KVM acceleration

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 198 +++++++++++++++++++++++++-----------------------
 1 file changed, 104 insertions(+), 94 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..396025b5a5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -531,52 +531,53 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
     imsic_regs = g_new0(uint32_t, socket_count * 4);
 
-    /* M-level IMSIC node */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
-    }
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
+    if (!kvm_enabled()) {
+        /* M-level IMSIC node */
+        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+            imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+            imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
         }
+        imsic_max_hart_per_socket = 0;
+        for (socket = 0; socket < socket_count; socket++) {
+            imsic_addr = memmap[VIRT_IMSIC_M].base +
+                         socket * VIRT_IMSIC_GROUP_MAX_SIZE;
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
+            (unsigned long)memmap[VIRT_IMSIC_M].base);
+        qemu_fdt_add_subnode(ms->fdt, imsic_name);
+        qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
+            "riscv,imsics");
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
+            FDT_IMSIC_INT_CELLS);
+        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
+            NULL, 0);
+        qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
+            NULL, 0);
+        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
+            imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+        qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
+            socket_count * sizeof(uint32_t) * 4);
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
+            VIRT_IRQCHIP_NUM_MSIS);
+        if (socket_count > 1) {
+            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
+                imsic_num_bits(imsic_max_hart_per_socket));
+            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
+                imsic_num_bits(socket_count));
+            qemu_fdt_setprop_cell(ms->fdt, imsic_name,
+                "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT);
+        }
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
+        g_free(imsic_name);
     }
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
 
     /* S-level IMSIC node */
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
@@ -653,37 +654,40 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
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
-            msi_m_phandle);
+    if (!kvm_enabled()) {
+        /* M-level APLIC node */
+        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+            aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+            aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+        }
+        aplic_addr = memmap[VIRT_APLIC_M].base +
+                     (memmap[VIRT_APLIC_M].size * socket);
+        aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+        qemu_fdt_add_subnode(ms->fdt, aplic_name);
+        qemu_fdt_setprop_string(ms->fdt, aplic_name,
+            "compatible", "riscv,aplic");
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name,
+            "#interrupt-cells", FDT_APLIC_INT_CELLS);
+        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
+        if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+            qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
+                aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+        } else {
+            qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
+                msi_m_phandle);
+        }
+        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
+            0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
+            VIRT_IRQCHIP_NUM_SOURCES);
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
+            aplic_s_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
+            aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
+        riscv_socket_fdt_write_id(ms, aplic_name, socket);
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
+        g_free(aplic_name);
     }
-    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
-        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
-        VIRT_IRQCHIP_NUM_SOURCES);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
-        aplic_s_phandle);
-    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
-        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(ms, aplic_name, socket);
-    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
-    g_free(aplic_name);
 
     /* S-level APLIC node */
     for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
@@ -1162,16 +1166,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
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
@@ -1184,19 +1192,21 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
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
@@ -1206,7 +1216,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
             msimode, false, aplic_m);
     }
 
-    return aplic_m;
+    return kvm_enabled() ? aplic_s : aplic_m;
 }
 
 static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
-- 
2.17.1


