Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1putpU-00069S-4H
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 07:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putp3-0005rA-0P
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 07:42:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putoz-00024j-RT
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 07:41:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b5465fc13so1307078b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1683286916; x=1685878916;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bAzyIgvjIiufpVZsq76uLB1NK9sYx+YEmYt5rGZ7Bl4=;
 b=UYlzj11HB6KacHpCtDV4jt0zwM0owFuVD4g2JqTbdhYPG64A3scJHqCFbfSEAA2npp
 LUh6mq1r4Fotz0oZCHpkrX/ErH9JQd5ZZPXmTWlJr3OTqobjHklAeCyapCwkAbH/dH0u
 xZiTcWmB/ux5KppUFiVZPl/HMundIUOVReR0G+Fz1NAv7ITj96oK70abl6YI1ohOUg7r
 /OqpifoR0h0PYtFIQdW51vUE/n+7xx/3iHd3Tehk3TqtZNLM4K4VRhpLPX5+Gzplg+Va
 IDtJNkXKil0pvnsMRJQlC71Fpx5ovv7ARB0qhaLlJBY4Lf7Tx9slypFW6nQ+5a5Zsn4l
 t6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286916; x=1685878916;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAzyIgvjIiufpVZsq76uLB1NK9sYx+YEmYt5rGZ7Bl4=;
 b=aYGeJUXola6pK9sFnuEd26eZUBf4ozoKcuuto+K5cnu3qXqWaBBXgccLE51UiIM4qS
 ame1k7X7bzxJmFGyHl3iYNIEwO4SVxJUmHty1CBJ880cfkdk5a3v7W3Q2gZAM8nqx1r0
 gsd2rzsRzlsEOApb7p0RKZgi/0KpYM1lOPmATyioKk1zLqYLdQUkYj8+x+RaZH5rxTFx
 AH1yHG7U7WBWKfXmSXEgu9CFGS5I927Ib4Oe9/fmPxug89L009XLrKWS/6UsNqPhJ3Sh
 LhqrhP2Jvm6JCgpG8o9NFELfCsWx9vAhsisyJ9DGWIqTk7B3v4U6aw7tvBOq38xrgaC5
 kotA==
X-Gm-Message-State: AC+VfDxLU2DbIRTggdnH+tOx9VkTY2QpHaZlMwBW2ZhoA7S1FmnfNaf4
 xJtKPNj7TMs1ftuOxefNkG/cvg==
X-Google-Smtp-Source: ACHHUZ6H8SXK8qr82XWp5+f7UzuBxc4YJwgVO3xWPxq9O3bt7GOxE7Oy4MSnXsVG4Iv2NihDlETepg==
X-Received: by 2002:a05:6a00:2d97:b0:636:f899:4696 with SMTP id
 fb23-20020a056a002d9700b00636f8994696mr2097067pfb.24.1683286916595; 
 Fri, 05 May 2023 04:41:56 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b0062d859a33d1sm1448171pfm.84.2023.05.05.04.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:41:55 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PTACH v2 5/6] target/riscv: update APLIC and IMSIC to support KVM AIA
Date: Fri,  5 May 2023 11:39:40 +0000
Message-Id: <20230505113946.23433-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230505113946.23433-1-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
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
X-List-Received-Date: Fri, 05 May 2023 11:42:10 -0000

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


