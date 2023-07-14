Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6145CEB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKEQC-0006TZ-GK; Fri, 14 Jul 2023 04:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEQ9-0006Sf-Uq
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:45:02 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEQ7-0004MC-Rp
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:45:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-666edfc50deso1046630b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689324297; x=1691916297;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hOUzebb3M7Aonn5aL7x/q8bGS8g66tEKQGDg4CNDNCU=;
 b=FN3e9yhz7hDeG2wPzHa5AqPP8rrxz+0mCVsdoUl2U43XuySgMmcN9KjO83as2TXu4R
 43e8PvCnuuXYUN+1VI6Ew2VzshY1Eq8Ut+sLX2bc/P/AS8LRMdD0d/szZx1cNx21hv2e
 c4cfwedsJ9T+MKpTAVwi2KnzUsrsIEOwEzVbABK0kjHfP48VvCZq1g56NAb6k2dY4GQ+
 JQXbgh3DULI7y2xx2U9Zvt3g67115kLNBP5LndZ/ZFJE5vlELZUvcg5uyI8pGdCvcb2u
 p4bZALXjfA3eJ0oEFAOWAzkARkcXaz31pXLC0Z3c4vfFqbtVS4VRGKb1HqFCKLVMAABN
 Isog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689324297; x=1691916297;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hOUzebb3M7Aonn5aL7x/q8bGS8g66tEKQGDg4CNDNCU=;
 b=Lk8phwj1r0uqbYwwSprMPzhCSFI8r91Edm6yCkH8bQSN7EaUz11LdbXp9h/Yw2L9fl
 zWSSdt3dOMwi4qERTVUIDFP3vBiNxhZ7J/o27SzMXJxNtjBl4vXIbCAZT0kUHnlA0xSa
 jGySmVPYLHQx42owr6lM1JrMzzZUIryfOPPB4USoS6hwIMlrcA6F+P+Ne2wnL7nkdGkm
 29prxSs67MUuNv+xpMrZtZf0UVijSGrc53Cwmh+vaJ2ShHWl2IaCkVMK5rBtgTD1l8J4
 wbhkXN7QMM7UOI231RB1sbxt4L4jHbjovUnMYtDvIHfKfyBO+n0DBSsf93wN2JqRmULW
 YaCg==
X-Gm-Message-State: ABy/qLastaFPp4e9vSUmgdoSOP8VPQINboGSyOl6T/tu36aNQ0zfbNdf
 r352YDa6KtZVzMOX9rsotMFv0Q==
X-Google-Smtp-Source: APBJJlHGAXcp2I5mIJuFrhdQ92jAP7DYFfYmWAqYbHPLDLsDoTEzSarYx7+Sz7jhagz8SiXLBY79qw==
X-Received: by 2002:a05:6a00:8ce:b0:681:919f:bf69 with SMTP id
 s14-20020a056a0008ce00b00681919fbf69mr3334059pfu.0.1689324297371; 
 Fri, 14 Jul 2023 01:44:57 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa781d3000000b006829b28b393sm6616305pfn.199.2023.07.14.01.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 01:44:57 -0700 (PDT)
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
Subject: [PATCH v6 5/5] target/riscv: select KVM AIA in riscv virt machine
Date: Fri, 14 Jul 2023 08:44:27 +0000
Message-Id: <20230714084429.22349-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230714084429.22349-1-yongxuan.wang@sifive.com>
References: <20230714084429.22349-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x433.google.com
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

Select KVM AIA when the host kernel has in-kernel AIA chip support.
Since KVM AIA only has one APLIC instance, we map the QEMU APLIC
devices to KVM APLIC.
We also extend virt machine to specify the KVM AIA mode. The "kvm-aia"
parameter is passed along with machine name in QEMU command-line.
1) "kvm-aia=emul": IMSIC is emulated by hypervisor
2) "kvm-aia=hwaccel": use hardware guest IMSIC
3) "kvm-aia=auto": use the hardware guest IMSICs whenever available
                   otherwise we fallback to software emulation.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 132 ++++++++++++++++++++++++++++++----------
 include/hw/riscv/virt.h |   1 +
 2 files changed, 102 insertions(+), 31 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f595380be1..6367597dfa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "kvm_riscv.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -75,6 +76,12 @@
 #error "Can't accomodate all IMSIC groups in address space"
 #endif
 
+/* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
+static bool virt_use_kvm_aia(RISCVVirtState *s)
+{
+    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
+}
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =        {        0x0,         0x100 },
     [VIRT_MROM] =         {     0x1000,        0xf000 },
@@ -609,16 +616,16 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
                                  uint32_t *intc_phandles,
                                  uint32_t aplic_phandle,
                                  uint32_t aplic_child_phandle,
-                                 bool m_mode)
+                                 bool m_mode, int num_harts)
 {
     int cpu;
     char *aplic_name;
     uint32_t *aplic_cells;
     MachineState *ms = MACHINE(s);
 
-    aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    aplic_cells = g_new0(uint32_t, num_harts * 2);
 
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aplic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
     }
@@ -632,8 +639,7 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
         qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
-                         aplic_cells,
-                         s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+                         aplic_cells, num_harts * sizeof(uint32_t) * 2);
     } else {
         qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent", msi_phandle);
     }
@@ -664,7 +670,8 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
                                     uint32_t msi_s_phandle,
                                     uint32_t *phandle,
                                     uint32_t *intc_phandles,
-                                    uint32_t *aplic_phandles)
+                                    uint32_t *aplic_phandles,
+                                    int num_harts)
 {
     char *aplic_name;
     unsigned long aplic_addr;
@@ -681,7 +688,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
         create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_M].size,
                              msi_m_phandle, intc_phandles,
                              aplic_m_phandle, aplic_s_phandle,
-                             true);
+                             true, num_harts);
     }
 
     /* S-level APLIC node */
@@ -690,7 +697,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_S].size,
                          msi_s_phandle, intc_phandles,
                          aplic_s_phandle, 0,
-                         false);
+                         false, num_harts);
 
     aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
 
@@ -774,34 +781,51 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         *msi_pcie_phandle = msi_s_phandle;
     }
 
-    phandle_pos = ms->smp.cpus;
-    for (socket = (socket_count - 1); socket >= 0; socket--) {
-        phandle_pos -= s->soc[socket].num_harts;
-
-        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-            create_fdt_socket_plic(s, memmap, socket, phandle,
-                &intc_phandles[phandle_pos], xplic_phandles);
-        } else {
-            create_fdt_socket_aplic(s, memmap, socket,
-                msi_m_phandle, msi_s_phandle, phandle,
-                &intc_phandles[phandle_pos], xplic_phandles);
+    /* KVM AIA only has one APLIC instance */
+    if (virt_use_kvm_aia(s)) {
+        create_fdt_socket_aplic(s, memmap, 0,
+                                msi_m_phandle, msi_s_phandle, phandle,
+                                &intc_phandles[0], xplic_phandles,
+                                ms->smp.cpus);
+    } else {
+        phandle_pos = ms->smp.cpus;
+        for (socket = (socket_count - 1); socket >= 0; socket--) {
+            phandle_pos -= s->soc[socket].num_harts;
+
+            if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+                create_fdt_socket_plic(s, memmap, socket, phandle,
+                                       &intc_phandles[phandle_pos],
+                                       xplic_phandles);
+            } else {
+                create_fdt_socket_aplic(s, memmap, socket,
+                                        msi_m_phandle, msi_s_phandle, phandle,
+                                        &intc_phandles[phandle_pos],
+                                        xplic_phandles,
+                                        s->soc[socket].num_harts);
+            }
         }
     }
 
     g_free(intc_phandles);
 
-    for (socket = 0; socket < socket_count; socket++) {
-        if (socket == 0) {
-            *irq_mmio_phandle = xplic_phandles[socket];
-            *irq_virtio_phandle = xplic_phandles[socket];
-            *irq_pcie_phandle = xplic_phandles[socket];
-        }
-        if (socket == 1) {
-            *irq_virtio_phandle = xplic_phandles[socket];
-            *irq_pcie_phandle = xplic_phandles[socket];
-        }
-        if (socket == 2) {
-            *irq_pcie_phandle = xplic_phandles[socket];
+    if (virt_use_kvm_aia(s)) {
+        *irq_mmio_phandle = xplic_phandles[0];
+        *irq_virtio_phandle = xplic_phandles[0];
+        *irq_pcie_phandle = xplic_phandles[0];
+    } else {
+        for (socket = 0; socket < socket_count; socket++) {
+            if (socket == 0) {
+                *irq_mmio_phandle = xplic_phandles[socket];
+                *irq_virtio_phandle = xplic_phandles[socket];
+                *irq_pcie_phandle = xplic_phandles[socket];
+            }
+            if (socket == 1) {
+                *irq_virtio_phandle = xplic_phandles[socket];
+                *irq_pcie_phandle = xplic_phandles[socket];
+            }
+            if (socket == 2) {
+                *irq_pcie_phandle = xplic_phandles[socket];
+            }
         }
     }
 
@@ -1432,6 +1456,15 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (virt_use_kvm_aia(s)) {
+        kvm_riscv_aia_create(machine, s->kvm_aia_mode,
+                             IMSIC_MMIO_GROUP_MIN_SHIFT,
+                             VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
+                             memmap[VIRT_APLIC_S].base,
+                             memmap[VIRT_IMSIC_S].base,
+                             s->aia_guests);
+    }
+
     if (riscv_is_32bit(&s->soc[0])) {
 #if HOST_LONG_BITS == 64
         /* limit RAM size in a 32-bit system */
@@ -1577,6 +1610,31 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
     }
 }
 
+#if defined(CONFIG_KVM)
+static char *virt_get_kvm_aia(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    return g_strdup(kvm_aia_mode_str(s->kvm_aia_mode));
+}
+
+static void virt_set_kvm_aia(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    if (!strcmp(val, "emul")) {
+        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_EMUL;
+    } else if (!strcmp(val, "hwaccel")) {
+        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
+    } else if (!strcmp(val, "auto")) {
+        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_AUTO;
+    } else {
+        error_setg(errp, "Invalid KVM AIA mode");
+        error_append_hint(errp, "Valid values are emul, hwaccel, and auto.\n");
+    }
+}
+#endif
+
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
@@ -1687,6 +1745,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
                  "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
+
+#if defined(CONFIG_KVM)
+    object_class_property_add_str(oc, "kvm-aia", virt_get_kvm_aia,
+                                  virt_set_kvm_aia);
+    object_class_property_set_description(oc, "kvm-aia",
+                                          "Set KVM AIA mode. Valid values are "
+                                          "emul, hwaccel, and auto. Default "
+                                          "is auto.");
+    object_property_set_default_str(object_class_property_find(oc, "kvm-aia"),
+                                    "auto");
+
+#endif
     object_class_property_add(oc, "acpi", "OnOffAuto",
                               virt_get_acpi, virt_set_acpi,
                               NULL, NULL);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..d0140feeff 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -56,6 +56,7 @@ struct RISCVVirtState {
     bool have_aclint;
     RISCVVirtAIAType aia_type;
     int aia_guests;
+    uint64_t kvm_aia_mode;
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
-- 
2.17.1


