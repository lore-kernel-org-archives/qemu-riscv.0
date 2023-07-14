Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A9CEB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKEQ5-0006Rm-9Y; Fri, 14 Jul 2023 04:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEQ4-0006RV-Gn
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:44:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qKEQ2-0004LC-LG
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 04:44:56 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6831e80080dso1094045b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689324293; x=1691916293;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OULN+wwisoBSnT3VMk9Y7HLLhh5KeELP9Ck02I8dOSM=;
 b=fr8WYa4WtWK17d5wpO49GU/BPJqYACZjtler3t55wgXKjSY8g+cjVSMoUnwvCatXVJ
 V87FYhkEQs6qTyWtb3tOuW84JdL529yvCmdb6K1uj51eLZShuT200nBk8z4GnklgTnHL
 z/jXBB2paf7fegp8B0lZLd7ZSzrbTPo+6tJb5ZNg3/DW6akvm65ZAgk0WEYNG/A7qx3N
 u4jIn4B0xyunIUt11SG6rljzXTGO1nbl+17LS1hm//b/OSTCav1aZgH3bikBxWCZ9EEi
 bA9MbahTz633hTOHUycOIXKg2aLSGmS9kebehjTusKUr7f4KJFdF87RK0XrhuEAEwPKA
 XHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689324293; x=1691916293;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OULN+wwisoBSnT3VMk9Y7HLLhh5KeELP9Ck02I8dOSM=;
 b=NuklF9k9WJftxRFtoEhzacIJ1oL/IkVsc7bIGiLoJw911LaMATWe1mWWX497jTm837
 trONVsqopLsqehV8IrWPbPHeLS9SZFNPhzWLgHK0a2Nkr6YkKNMplH/x+Gv8uNr66jT2
 epxzAtSeum/95kaWlX5YIdqpr57ANh+nasm7Y5HwZnVm1nK19XGn4lbBOXKzrvVC0O3G
 woc9GHjTS3oTQ49YlQYeZfrNfR1D34b5vP9IyI6AQXyj/OTx7wLkcAJsUAn0G7Qjfif0
 1wnIbQCPZWGj+OJAFJJU+kHFlUzCaQeNex7R7WUq9Nu1oE2sDdu1+U0sNFbDl5r1rzKr
 qJpw==
X-Gm-Message-State: ABy/qLb/XSLHpCNF3qtytmuaWVFEZFxySC6QSzCpr3U+2DbYHDd50COv
 AKdr7BsX/px0RNsmS5slQXryzw==
X-Google-Smtp-Source: APBJJlE6uRu51oXuNYp2Kc22teKoiG0KfLQ8WCZa5u9wLDneMxlD+zw8//q0ManqqxoMmNM61hM7GA==
X-Received: by 2002:a05:6a00:1827:b0:67e:bf65:ae61 with SMTP id
 y39-20020a056a00182700b0067ebf65ae61mr4182119pfa.28.1689324293071; 
 Fri, 14 Jul 2023 01:44:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa781d3000000b006829b28b393sm6616305pfn.199.2023.07.14.01.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 01:44:52 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v6 4/5] target/riscv: update APLIC and IMSIC to support KVM AIA
Date: Fri, 14 Jul 2023 08:44:26 +0000
Message-Id: <20230714084429.22349-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230714084429.22349-1-yongxuan.wang@sifive.com>
References: <20230714084429.22349-1-yongxuan.wang@sifive.com>
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
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/intc/riscv_aplic.c | 56 ++++++++++++++++++++++++++++++-------------
 hw/intc/riscv_imsic.c | 25 +++++++++++++++----
 2 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 4bdc6a5d1a..592c3ce768 100644
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
+ * KVM AIA only supports APLIC MSI, fallback to QEMU emulation if we want to use
+ * APLIC Wired.
+ */
+static bool is_kvm_aia(bool msimode)
+{
+    return kvm_irqchip_in_kernel() && msimode;
+}
+
 static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
                                             uint32_t word)
 {
@@ -471,6 +481,11 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
     return topi;
 }
 
+static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
+{
+    kvm_set_irq(kvm_state, irq, !!level);
+}
+
 static void riscv_aplic_request(void *opaque, int irq, int level)
 {
     bool update = false;
@@ -801,29 +816,35 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
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
+                              aplic, TYPE_RISCV_APLIC, aplic->aperture_size);
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
@@ -958,7 +979,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
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
index fea3385b51..760dbddcf7 100644
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
@@ -320,10 +335,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
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


