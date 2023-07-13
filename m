Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE33EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 08:44:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJrwJ-0006RR-TN; Thu, 13 Jul 2023 04:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrwI-0006R4-5R
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:42 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrwG-00070e-6I
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:41 -0400
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7656652da3cso47152785a.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689237878; x=1691829878;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=djwjqUPMIlHHN6FZYr+Mw7HTbl7A9BLuFx65r3ISBNo=;
 b=D7GkGVU2bSU3NKD/DQr2QAXUzC50XWeTsIopMCxKNiAPUvJTWj1WqUxvL6QaqJunrL
 zzmIbHKn6HgLQSS0lp9Qmgxym5jAhbxloE6nupc75UX6D6Qoa2i9+Lto+JZYsqdqx/O6
 DW92U7eMjUjlid0q2RGIJGJBMqqdgepV93GkiB/3GeQt0/uvJcN8B6GFUo8sZQlUTKdU
 J/jhYLQaK6BWAiY4RiaF2UjKAhcFDXmlUivjUs78hjS5awa5/HH/ZPsINsucH+fGq3MK
 BNTRNwOvZXwbwKuduyx3ZkUw4LRGZes79wPtdNdOOPRH+Y/2r+viBkstIfNJ/bRsAfLN
 ga2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237878; x=1691829878;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djwjqUPMIlHHN6FZYr+Mw7HTbl7A9BLuFx65r3ISBNo=;
 b=jhGTpAcNFfHZbsyuBOWYV9N4p/RdlShViCpBkqqWILS7JNVWePKyvWhh8A5hTZrQCp
 4NpS+zZRC/BkF80dwk0n3AYAdhhQC3SXwXQuLuWlGNbKpCeN1Rzwt7Iv4WjhC+ZVpw2y
 Oasdh9hb7tCFqj7Yuo9c/+sFqKj5HJj2CzrBRTYDVj+0e0qbUNNS0sbUUAFuu7v4Gw2s
 g+Mvalk27NWK+Z/N6RvRDpvDPyGtlmuNF8/SAJdoudxm37llFbkOq8uJ2W0ebLTEW1ym
 9ShrTpwcM2kj7c9Ed8VmQIXEBx8Rjd0eJcngqAHwja2jJEm1ZxJlvoSelSCdOmBSg+qd
 +0DQ==
X-Gm-Message-State: ABy/qLbys6Tflqd11GlM5luVqFnXWN8VnDOQaRX3CHpCi3JbndnxwQNe
 LaxK+Rp1peHPBt+GLyzuqiCLtQ==
X-Google-Smtp-Source: APBJJlEhb9fc7ih6eqP3c6AXyvLUeig0dUJFa4R2Kz7+l0rx5LWcdB+Zn3QxGj9fi0GE2v6rmqLCcg==
X-Received: by 2002:a05:620a:2546:b0:767:a1ac:3c74 with SMTP id
 s6-20020a05620a254600b00767a1ac3c74mr1120252qko.26.1689237877838; 
 Thu, 13 Jul 2023 01:44:37 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a63724a000000b0055386b1415dsm4989198pgn.51.2023.07.13.01.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 01:44:37 -0700 (PDT)
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
Subject: [PATCH v5 5/5] target/riscv: select KVM AIA in riscv virt machine
Date: Thu, 13 Jul 2023 08:43:57 +0000
Message-Id: <20230713084405.24545-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230713084405.24545-1-yongxuan.wang@sifive.com>
References: <20230713084405.24545-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qk1-x731.google.com
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
---
 hw/riscv/virt.c         | 125 ++++++++++++++++++++++++++++++----------
 include/hw/riscv/virt.h |   1 +
 2 files changed, 97 insertions(+), 29 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 26b3aff28e..b74142d978 100644
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
@@ -632,7 +639,7 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
         qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+            aplic_cells, num_harts * sizeof(uint32_t) * 2);
     } else {
         qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent", msi_phandle);
     }
@@ -662,7 +669,8 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
                                     uint32_t msi_s_phandle,
                                     uint32_t *phandle,
                                     uint32_t *intc_phandles,
-                                    uint32_t *aplic_phandles)
+                                    uint32_t *aplic_phandles,
+                                    int num_harts)
 {
     char *aplic_name;
     unsigned long aplic_addr;
@@ -679,7 +687,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
         create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_M].size,
                              msi_m_phandle, intc_phandles,
                              aplic_m_phandle, aplic_s_phandle,
-                             true);
+                             true, num_harts);
     }
 
     /* S-level APLIC node */
@@ -688,7 +696,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_S].size,
                          msi_s_phandle, intc_phandles,
                          aplic_s_phandle, 0,
-                         false);
+                         false, num_harts);
 
     aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
 
@@ -772,34 +780,48 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         *msi_pcie_phandle = msi_s_phandle;
     }
 
-    phandle_pos = ms->smp.cpus;
-    for (socket = (socket_count - 1); socket >= 0; socket--) {
-        phandle_pos -= s->soc[socket].num_harts;
+    /* KVM AIA only has one APLIC instance */
+    if (virt_use_kvm_aia(s)) {
+        create_fdt_socket_aplic(s, memmap, 0,
+            msi_m_phandle, msi_s_phandle, phandle,
+            &intc_phandles[0], xplic_phandles, ms->smp.cpus);
+    } else {
+        phandle_pos = ms->smp.cpus;
+        for (socket = (socket_count - 1); socket >= 0; socket--) {
+            phandle_pos -= s->soc[socket].num_harts;
 
-        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-            create_fdt_socket_plic(s, memmap, socket, phandle,
-                &intc_phandles[phandle_pos], xplic_phandles);
-        } else {
-            create_fdt_socket_aplic(s, memmap, socket,
-                msi_m_phandle, msi_s_phandle, phandle,
-                &intc_phandles[phandle_pos], xplic_phandles);
+            if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+                create_fdt_socket_plic(s, memmap, socket, phandle,
+                    &intc_phandles[phandle_pos], xplic_phandles);
+            } else {
+                create_fdt_socket_aplic(s, memmap, socket,
+                    msi_m_phandle, msi_s_phandle, phandle,
+                    &intc_phandles[phandle_pos], xplic_phandles,
+                    s->soc[socket].num_harts);
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
 
@@ -1430,6 +1452,14 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (virt_use_kvm_aia(s)) {
+        kvm_riscv_aia_create(
+            machine, s->kvm_aia_mode, IMSIC_MMIO_GROUP_MIN_SHIFT,
+            VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
+            memmap[VIRT_APLIC_S].base, memmap[VIRT_IMSIC_S].base,
+            s->aia_guests);
+    }
+
     if (riscv_is_32bit(&s->soc[0])) {
 #if HOST_LONG_BITS == 64
         /* limit RAM size in a 32-bit system */
@@ -1575,6 +1605,31 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
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
@@ -1685,6 +1740,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


