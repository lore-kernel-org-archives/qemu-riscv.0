Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5FAC001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 11:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOyC8-0003iR-TK; Thu, 27 Jul 2023 06:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyBQ-0003XI-8U
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:25:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyBF-0004BY-78
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:25:19 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b89cfb4571so5995625ad.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690453510; x=1691058310;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H7Zt4zM7mdn4Ype868SA62zfOIkFcLwtmRVr8Dp/bb8=;
 b=d9tzBPwHMDWBaO1swiv2Dw3LW7KVWDxxKgrMljO2n2C2ch9bvwjIxo7+wacgc/cECj
 Wa3qPcm1hmYSsevakmq3CWtP7xz2R6J8RdOPwnG3j3CO2Ax6qcPQ3Oqah8vvEfO3sSuB
 0++tlOepW/H4ToxI5Kpwm15vjWw4ZFT7wcwLUBNF2mt0avt0VBXZfF9O7+e7rvdLLB5A
 dk+zUCVyOCc+8BvTu9c3AlePyo/9tNCTJagQcVGfhr/YLCy1NddId0k+lfENaB7rRKsj
 GXinsOu/PC89pdPt01jegja28o9fACrkazgahXzIXXED22YOdFn2ds/le0bImTLEXlZ8
 X5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453510; x=1691058310;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7Zt4zM7mdn4Ype868SA62zfOIkFcLwtmRVr8Dp/bb8=;
 b=WF9hvc+rDv7QU3PSn/grWNl5MBytXobFEFN9XiTPOrdVbe7EHgNGTcBnAoZ+um0RIa
 iUhlLOoUx7kY1XAB1KAo6nUi1mEQ7RzRpON/Lk9YpGVVy52EyKWtVE6ZfkOIr0+7Lg97
 OudP7bloqsOE0sVjPxou5Z4ppSUIPkdkeq68QAtNb43lx1neLw30nO+e8qjQEH8Jd+6g
 c4Wl1JRCfqAZHbEf4e4rFArZ5htgguO50Ne7Ms5EY9sPZ9ozR3tiVI9UF2buymyzzIOW
 yaHbJLkxXBbMDAizqmeAi4uiA/MMWPOf/V4+WKGHrKRoRAIzOYdK3ewUtKKAfoBhxISU
 c4lQ==
X-Gm-Message-State: ABy/qLYnEnBXXPE5tUYjmXBILTGsyAzZYp3CDU8btSUMeS8432E6DffH
 jr42JZpDR5TDCAs6NNYI3hj5WQ==
X-Google-Smtp-Source: APBJJlGAOCc+wbYfEp9OyBp1n97lYyv0gEYX3EEXprsSRTX1yK8rvEb1Kyy5OvsMLmx74uGh/YPsIA==
X-Received: by 2002:a17:902:db09:b0:1b8:8dbd:e1a0 with SMTP id
 m9-20020a170902db0900b001b88dbde1a0mr5968320plx.13.1690453509815; 
 Thu, 27 Jul 2023 03:25:09 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b001b882880550sm1230139ple.282.2023.07.27.03.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:25:09 -0700 (PDT)
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
Subject: [PATCH v7 5/5] target/riscv: select KVM AIA in riscv virt machine
Date: Thu, 27 Jul 2023 10:24:37 +0000
Message-Id: <20230727102439.22554-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230727102439.22554-1-yongxuan.wang@sifive.com>
References: <20230727102439.22554-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 94 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 63 insertions(+), 31 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f595380be1..4af73ac1bb 100644
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
 
@@ -1432,6 +1456,14 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (virt_use_kvm_aia(s)) {
+        kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
+                             VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
+                             memmap[VIRT_APLIC_S].base,
+                             memmap[VIRT_IMSIC_S].base,
+                             s->aia_guests);
+    }
+
     if (riscv_is_32bit(&s->soc[0])) {
 #if HOST_LONG_BITS == 64
         /* limit RAM size in a 32-bit system */
-- 
2.17.1


