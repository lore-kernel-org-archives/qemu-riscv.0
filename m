Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAC9C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2QtX-0005MI-15; Fri, 26 May 2023 02:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtS-0005Hk-Fh
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:42 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtQ-0000rl-Og
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:42 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ae52ce3205so2663355ad.3
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1685082339; x=1687674339;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bAzyIgvjIiufpVZsq76uLB1NK9sYx+YEmYt5rGZ7Bl4=;
 b=Pz33rcH+vRUigxBx7n6Q2BSsHHDISEsLcYk5bwgAxw/YYiKqo4qG4qBdRWmEFy2sed
 QhAo6mrdcRhXJ3ZnUEHJDSgsEXZ0md6sUmJKvMG24SDDBV3pxbnauKtdxmuEoTl8IJ1b
 CzH2DZLHXNLATT0DDXiIMQsrKIQGgeQQ4f34b01ChiXTLTC0tuV2M+tlLaGiuNMGcrf4
 3QX4KDLwdQeQOfskoQt+xkib9zcouwsnkaD/8oBor0cf0aj1dbIKhyGso2hZXYoh2Wta
 3zK6GqQp+L4Clgiq+coh1Keiux5kFKmlqSKAAQit/5eCiYg+DbpqdUuRL8wCEfLlSamc
 5UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685082339; x=1687674339;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAzyIgvjIiufpVZsq76uLB1NK9sYx+YEmYt5rGZ7Bl4=;
 b=Byv/xzWNNSybTCnFm1wS4VOr+ZsYoALWb77ILcrH7oPCkO2nmEIGr9t++C4pYFFsXX
 CnnLaLIoDKT0vz7CSMPFEKGHj1YN2cUPk+mYfaP6QnfjoqbEvWknKJ9v+o3y3GzCKz1x
 3iZ6FYOi3SLR8KXzJuIeIgEMStWXu3DcgwxlN1/YZLrO2yxevfDIZOQMQf8cBoWwdEAW
 Qh6pDoX7hV2Xf+CLaWF6EGde3YhiC4VeDvvdHSveomzqnxAqKUsW7IHVLVEqCWyRMv+/
 hRDfZ+xyNmsaaBRPS6QQlOoasYD79EDPxpdUi67SYhljMo2Kz9YBXuL5wHI9worBxkAo
 rkiA==
X-Gm-Message-State: AC+VfDxETq6F4aZb8M/Mjhb9+O6NIIrJTqHhOoYwJpSpx0xQzE8HHZta
 DojfoaBNc0MvRnbGCBTgeuZZOg==
X-Google-Smtp-Source: ACHHUZ5BbZd83UeGMwutqv7UO9KT+xc9ivgFrg8AGplTiqHLd2wJvwB7J9QoGprt8rVfEFABpt9Grg==
X-Received: by 2002:a17:902:d483:b0:1b0:12e:3bfd with SMTP id
 c3-20020a170902d48300b001b0012e3bfdmr1631788plg.7.1685082339409; 
 Thu, 25 May 2023 23:25:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001a94a497b50sm2429150pls.20.2023.05.25.23.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 23:25:39 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 5/6] target/riscv: update APLIC and IMSIC to support KVM AIA
Date: Fri, 26 May 2023 06:25:05 +0000
Message-Id: <20230526062509.31682-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230526062509.31682-1-yongxuan.wang@sifive.com>
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62f.google.com
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

- Do not set the mmio operations of APLIC and IMSIC when using KVM AIA
- Send interrupt signal to KVM AIA via KVM_IRQ_LINE API

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aplic.c | 19 +++++++++++++++----
 hw/intc/riscv_imsic.c | 16 +++++++++++-----
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index afc5b54dbb..adf5427f22 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -31,6 +31,7 @@
 #include "hw/irq.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define APLIC_MAX_IDC                  (1UL << 14)
@@ -479,6 +480,11 @@ static void riscv_aplic_request(void *opaque, int irq, int level)
 
     assert((0 < irq) && (irq < aplic->num_irqs));
 
+    if (kvm_irqchip_in_kernel()) {
+        kvm_set_irq(kvm_state, irq, !!level);
+        return;
+    }
+
     sourcecfg = aplic->sourcecfg[irq];
     if (sourcecfg & APLIC_SOURCECFG_D) {
         childidx = sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
@@ -814,9 +820,11 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
     aplic->iforce = g_new0(uint32_t, aplic->num_harts);
     aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
 
-    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
-                          TYPE_RISCV_APLIC, aplic->aperture_size);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+    if (!kvm_irqchip_in_kernel()) {
+        memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops,
+                             aplic, TYPE_RISCV_APLIC, aplic->aperture_size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+    }
 
     /*
      * Only root APLICs have hardware IRQ lines. All non-root APLICs
@@ -958,7 +966,10 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
     qdev_prop_set_bit(dev, "mmode", mmode);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (!kvm_irqchip_in_kernel()) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    }
 
     if (parent) {
         riscv_aplic_add_child(parent, dev);
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index fea3385b51..8bfa480f7c 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -32,6 +32,7 @@
 #include "target/riscv/cpu.h"
 #include "target/riscv/cpu_bits.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "migration/vmstate.h"
 
 #define IMSIC_MMIO_PAGE_LE             0x00
@@ -325,10 +326,12 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
     imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
     imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
 
-    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
-                          imsic, TYPE_RISCV_IMSIC,
-                          IMSIC_MMIO_SIZE(imsic->num_pages));
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+    if (!kvm_irqchip_in_kernel()) {
+        memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
+                              imsic, TYPE_RISCV_IMSIC,
+                              IMSIC_MMIO_SIZE(imsic->num_pages));
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+    }
 
     /* Claim the CPU interrupt to be triggered by this IMSIC */
     if (riscv_cpu_claim_interrupts(rcpu,
@@ -432,7 +435,10 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
     qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (!kvm_irqchip_in_kernel()) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    }
 
     for (i = 0; i < num_pages; i++) {
         if (!i) {
-- 
2.17.1


