Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767C1EB64D8
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:56:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBzFA-00028v-V3; Wed, 21 Jun 2023 10:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qBzFA-00028b-29
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 10:55:36 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qBzF8-0006Yx-88
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 10:55:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-668730696a4so2213751b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Jun 2023 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687359333; x=1689951333;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fSQA0ZycXzad4nUUl7nCQROXCbzFYRj68nsh6Culzsc=;
 b=Gyh3wM14ZtsSWyBuIbEVNt9BQXHN6hS8C3qpxdNXswhYn6DO2Jy22FpQL5mcIjgxaO
 Nf8uOEATzYzlBvUXvKq0V49CzP2A/jZ1iDhnEm247/S/eOvCjGZIbG2w71ejZ88xJihc
 FG9T5elr2fD/InSfqDRSOCXAVfFgrXMrYwjCcGV5iTPdvE7o820PxlgKG03hgJdwfgN4
 WXHYrrd3RKNg0a9QvLj2qpRjqE4lLuEa0GEDhWTRbwdomlunj3N9ysHDadh/H/29iktN
 YtxDGs0uyJXCH7A4WdwqU8nCIF71j5c4NZYYbVmOT5P3gp005413wtHVthDLUmEHp36H
 4RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687359333; x=1689951333;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fSQA0ZycXzad4nUUl7nCQROXCbzFYRj68nsh6Culzsc=;
 b=F2VhQknHQlVIBSuF05shqOo7XFqp+l0xc3N8v7kmwb3rVr8F2bgd2ZEkre4xrLJY4i
 AMyfvBvw5GXeEtM1P2r9cDvgYmJpujnxSjm1G4JZA/xYaQrqAsa/xNcXfFV+i7nnDgRN
 FAQBqfkhjNF2OVRG/XD5bUYLKwlB/+IS3pSSjDZTIH6AjohnmTRa84RHVuY/c2eA+Itq
 BMMhL33bgX/FO8gnnDgaSWiueBHLfW7t/yKF+jqc7AuaRINFRLOQty2HC1W0K+0WHzfP
 SgqmPDmJ0v3TDmDyc6nLBP5ToiYWCfvnzBS/pfpCazRlLwng8qrWDZOKD+It7wOrYLhU
 ky1A==
X-Gm-Message-State: AC+VfDxi8bKnuHuSo4N4VEJoaAF+XhbffU1QG5OLWvSYdlZ6w7Pr599t
 XSNo//GXQSqWJYhk7BZdQ/Aseg==
X-Google-Smtp-Source: ACHHUZ6YHDa9mBR4mdfZ0eGuEZEJOMMW6FIItZGwDjb0lohJfiAdd7+dZTGD2WG5sn9ALVLdSwNA4g==
X-Received: by 2002:a05:6a20:ae12:b0:123:8e58:b527 with SMTP id
 dp18-20020a056a20ae1200b001238e58b527mr354087pzb.44.1687359332909; 
 Wed, 21 Jun 2023 07:55:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a62a508000000b0066a4e561beesm356762pfm.173.2023.06.21.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 07:55:32 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v4 5/6] target/riscv: update APLIC and IMSIC to support KVM AIA
Date: Wed, 21 Jun 2023 14:54:55 +0000
Message-Id: <20230621145500.25624-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230621145500.25624-1-yongxuan.wang@sifive.com>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x436.google.com
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

KVM AIA can't emulate APLIC only. When "aia=aplic" parameter is passed,
APLIC devices is emulated by QEMU. For "aia=aplic-imsic", remove the
mmio operations of APLIC when using KVM AIA and send wired interrupt
signal via KVM_IRQ_LINE API.
After KVM AIA enabled, MSI messages are delivered by KVM_SIGNAL_MSI API
when the IMSICs receive mmio write requests.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aplic.c | 58 +++++++++++++++++++++++++++++++------------
 hw/intc/riscv_imsic.c | 26 +++++++++++++++----
 2 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index afc5b54dbb..b1949636b6 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -31,6 +31,7 @@
 #include "hw/irq.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define APLIC_MAX_IDC                  (1UL << 14)
@@ -148,6 +149,15 @@
 
 #define APLIC_IDC_CLAIMI               0x1c
 
+/*
+ * KVM AIA only supports APLIC.m, fallback to QEMU emulation if we want to use
+ * APLIC.w.
+ */
+static bool is_kvm_aia(bool msimode)
+{
+    return kvm_irqchip_in_kernel() && msimode;
+}
+
 static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
                                             uint32_t word)
 {
@@ -471,6 +481,13 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
     return topi;
 }
 
+static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
+{
+    kvm_set_irq(kvm_state, irq, !!level);
+
+    return;
+}
+
 static void riscv_aplic_request(void *opaque, int irq, int level)
 {
     bool update = false;
@@ -801,29 +818,35 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
     uint32_t i;
     RISCVAPLICState *aplic = RISCV_APLIC(dev);
 
-    aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
-    aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
-    aplic->state = g_new0(uint32_t, aplic->num_irqs);
-    aplic->target = g_new0(uint32_t, aplic->num_irqs);
-    if (!aplic->msimode) {
-        for (i = 0; i < aplic->num_irqs; i++) {
-            aplic->target[i] = 1;
+    if (!is_kvm_aia(aplic->msimode)) {
+        aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
+        aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
+        aplic->state = g_new0(uint32_t, aplic->num_irqs);
+        aplic->target = g_new0(uint32_t, aplic->num_irqs);
+        if (!aplic->msimode) {
+            for (i = 0; i < aplic->num_irqs; i++) {
+                aplic->target[i] = 1;
+            }
         }
-    }
-    aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
-    aplic->iforce = g_new0(uint32_t, aplic->num_harts);
-    aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
+        aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
+        aplic->iforce = g_new0(uint32_t, aplic->num_harts);
+        aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
 
-    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
-                          TYPE_RISCV_APLIC, aplic->aperture_size);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+        memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops,
+                             aplic, TYPE_RISCV_APLIC, aplic->aperture_size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+    }
 
     /*
      * Only root APLICs have hardware IRQ lines. All non-root APLICs
      * have IRQ lines delegated by their parent APLIC.
      */
     if (!aplic->parent) {
-        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
+        if (is_kvm_aia(aplic->msimode)) {
+            qdev_init_gpio_in(dev, riscv_kvm_aplic_request, aplic->num_irqs);
+        } else {
+            qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
+        }
     }
 
     /* Create output IRQ lines for non-MSI mode */
@@ -958,7 +981,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
     qdev_prop_set_bit(dev, "mmode", mmode);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (!is_kvm_aia(msimode)) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    }
 
     if (parent) {
         riscv_aplic_add_child(parent, dev);
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index fea3385b51..00fdb60fc6 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -32,6 +32,7 @@
 #include "target/riscv/cpu.h"
 #include "target/riscv/cpu_bits.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define IMSIC_MMIO_PAGE_LE             0x00
@@ -283,6 +284,20 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
         goto err;
     }
 
+#if defined(CONFIG_KVM)
+    if (kvm_irqchip_in_kernel()) {
+        struct kvm_msi msi;
+
+        msi.address_lo = extract64(imsic->mmio.addr + addr, 0, 32);
+        msi.address_hi = extract64(imsic->mmio.addr + addr, 32, 32);
+        msi.data = le32_to_cpu(value);
+
+        kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
+
+        return;
+    }
+#endif
+
     /* Writes only supported for MSI little-endian registers */
     page = addr >> IMSIC_MMIO_PAGE_SHIFT;
     if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) == IMSIC_MMIO_PAGE_LE) {
@@ -296,7 +311,6 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
     riscv_imsic_update(imsic, page);
 
     return;
-
 err:
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
@@ -320,10 +334,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
     CPUState *cpu = cpu_by_arch_id(imsic->hartid);
     CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
 
-    imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
-    imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
-    imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
-    imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
+    if (!kvm_irqchip_in_kernel()) {
+        imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
+        imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
+        imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
+        imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
+    }
 
     memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
                           imsic, TYPE_RISCV_IMSIC,
-- 
2.17.1


