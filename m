Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9CBEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:56:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBzFI-0002B3-EP; Wed, 21 Jun 2023 10:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qBzFE-00029m-P4
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 10:55:42 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qBzFC-0006Zn-9b
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 10:55:40 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-668704a5b5bso3572213b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Jun 2023 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687359337; x=1689951337;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bm3bHXx4XMJAkVaSJSU1IJsxlNn6HtEgEpiQJjVUZmo=;
 b=O8sk7FHInMACG9ySk7R5Lw96Ppq7rfHRj/mfnakudhrcsihKyTrVoWE8r3o+HlyeQn
 6y7yl2qvLuxPQf/NUE0CBwIQ2nSjsfhUxkdhO0GDZL2a9iskMyLyKc6XLJo1YMVYMjHJ
 mcW4tG38ouETfzLhIHWW/QUfbncpbIIxvlTgW5SDXbcipcx6OyxXayPP4eAa3FneE2IM
 tQj4ATcF92hdTWQwtzRKwLI16uJg0n0w1qgBT58S95SaNZelxukpVUOrt/DtZtdYJwCA
 OrNQukMaiDfnmXf8UlpKrXt0MzqzA5FO2J5owya39oNgWPYkrtYSMWP8e+V5DcwPhgfo
 DD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687359337; x=1689951337;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bm3bHXx4XMJAkVaSJSU1IJsxlNn6HtEgEpiQJjVUZmo=;
 b=NLmVxYQ5ILgA/4COA8wDubFP3vsxo2II/nl+QfxVZZaSvISL05ldPwCjq4xJcCcT8F
 HAvQPFJbVUBt+E98Bvq02L3zFDBAEx47ma3vhS9A724q5KvkPuGp/qRma4UvacfKjxeo
 +drgx447t5ayji1NhJVO2PO+d29aFFm4OvKM7mbqvvQ8Q1ipngk1CmDGuFm9oxqP+LBo
 ZCK7kLhj6c9MUMf0PPMBI4e/1pDbmcWSb7hNRkAgCGrd5zUQsI+5t9MTvunnP2Bzq+4f
 CgmA5KGQUPKWAG0oOz00bZN0kBYN4Sx07qWpH1OMXtrfE7AmJGBgSY4Q6crsQ2+VXEL6
 Uydg==
X-Gm-Message-State: AC+VfDxogKBF2OX0lDnKdcfjJp3RODy7gYvLrwkigomHPrpNo+45Yl3G
 iwZ/OKoVQBh9ToeSUzzrfkmpgA==
X-Google-Smtp-Source: ACHHUZ6up53kMxAmR/J4OHLzNHtwCAA9I58DVH7LSPsnrW9SmVLQuy1kHvFRhrjBA4EM/KVPSbfMhg==
X-Received: by 2002:a05:6a20:42a6:b0:122:cd6d:38e with SMTP id
 o38-20020a056a2042a600b00122cd6d038emr4820464pzj.37.1687359336898; 
 Wed, 21 Jun 2023 07:55:36 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a62a508000000b0066a4e561beesm356762pfm.173.2023.06.21.07.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 07:55:36 -0700 (PDT)
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
Subject: [PATCH v4 6/6] target/riscv: select KVM AIA in riscv virt machine
Date: Wed, 21 Jun 2023 14:54:56 +0000
Message-Id: <20230621145500.25624-7-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230621145500.25624-1-yongxuan.wang@sifive.com>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x431.google.com
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
---
 hw/riscv/virt.c         | 92 ++++++++++++++++++++++++++++++++++-------
 include/hw/riscv/virt.h |  1 +
 2 files changed, 79 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a1d29a741..efa176a184 100644
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
@@ -74,6 +75,12 @@
 #error "Can't accomodate all IMSIC groups in address space"
 #endif
 
+/* KVM AIA only supports APLIC.m. APLIC.w is always emulated by QEMU. */
+static bool virt_use_kvm_aia(RISCVVirtState *s)
+{
+    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
+}
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =        {        0x0,         0x100 },
     [VIRT_MROM] =         {     0x1000,        0xf000 },
@@ -642,7 +649,8 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
                                     uint32_t msi_s_phandle,
                                     uint32_t *phandle,
                                     uint32_t *intc_phandles,
-                                    uint32_t *aplic_phandles)
+                                    uint32_t *aplic_phandles,
+                                    int num_harts)
 {
     int cpu;
     char *aplic_name;
@@ -653,11 +661,11 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
 
     aplic_m_phandle = (*phandle)++;
     aplic_s_phandle = (*phandle)++;
-    aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    aplic_cells = g_new0(uint32_t, num_harts * 2);
 
     if (!kvm_enabled()) {
         /* M-level APLIC node */
-        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        for (cpu = 0; cpu < num_harts; cpu++) {
             aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
             aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
         }
@@ -691,7 +699,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     }
 
     /* S-level APLIC node */
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
     }
@@ -798,17 +806,25 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
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
 
@@ -819,6 +835,9 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
             *irq_mmio_phandle = xplic_phandles[socket];
             *irq_virtio_phandle = xplic_phandles[socket];
             *irq_pcie_phandle = xplic_phandles[socket];
+
+            if (virt_use_kvm_aia(s))
+                break;
         }
         if (socket == 1) {
             *irq_virtio_phandle = xplic_phandles[socket];
@@ -1454,6 +1473,14 @@ static void virt_machine_init(MachineState *machine)
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
@@ -1610,6 +1637,31 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
     }
 }
 
+#if defined(CONFIG_KVM)
+static char *virt_get_kvm_aia(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    return kvm_aia_mode_str(s->kvm_aia_mode);
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
@@ -1717,6 +1769,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


