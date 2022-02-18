Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6Pa-0008DU-Pp
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 11:47:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PW-000860-E5; Fri, 18 Feb 2022 11:47:10 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PU-0007Zn-12; Fri, 18 Feb 2022 11:47:10 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8AD4621CC1;
 Fri, 18 Feb 2022 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rot2Pl1QPDGByt+5HyOTER5H275oBzwReH0SWq5PrKs=;
 b=ad0enHKdjXazMYmfl7gkOLZkNFA5AmNeH9cWul9ZQoLN4NZm07INmG7GNaVgqQDqFXvbNn
 lDzlfqcRy7D1idPBLEIsUr/6Kf88hTxYR3zgBKO9e7AMPtQUeRvJ29XhBkYN4ru7lBXd6j
 Zcu8685gObRlqHc2Xg8osaYmi6JKp60=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 4/5] hw/intc/riscv_aclint: swi: report errors and free
 allocated memory
Date: Fri, 18 Feb 2022 17:46:45 +0100
Message-Id: <20220218164646.132112-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218164646.132112-1-damien.hedde@greensocs.com>
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 16:47:10 -0000

Add the instance_finalize() method to free the allocated arrays
and make realize() method report errors instead of exiting.

This commit also move the 'num-harts' property check from
riscv_aclint_swi_create() to realize().

Code in realize() is re-ordered to first check for errors and leave
the object in a clean state. To achieve this, we do the following:
+ parse_hart_config and char_to_mode are refactored to return errors
  instead of exiting.
+ in case of interrupt claim failure, we release the succesfully
  claimed ones.

These clean-ups allow the following life-cycle use cases (happening
when user creation is allowed) to execute as expected:
+ init -> finalize
+ init -> realize-failure -> finalize

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/intc/riscv_aclint.c | 54 +++++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284..4f66eeed0b 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -389,22 +389,48 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
     RISCVAclintSwiState *swi = RISCV_ACLINT_SWI(dev);
     int i;
 
+    if (swi->num_harts > RISCV_ACLINT_MAX_HARTS) {
+        error_setg(errp, "invalid 'num-harts': max is %u",
+                   RISCV_ACLINT_MAX_HARTS);
+        return;
+    }
+
+    /*
+     * Claim software interrupt bits:
+     * + sswi==false -> MSIP
+     * + sswi==true  -> SSIP
+     * We don't claim mip.SSIP because it is writeable by software
+     */
+    if (!swi->sswi) {
+        for (i = 0; i < swi->num_harts; i++) {
+            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
+            if (riscv_cpu_claim_interrupts(cpu, MIP_MSIP) < 0) {
+                error_setg(errp, "MSIP (hartid %u) already claimed",
+                           (unsigned) (swi->hartid_base + i));
+                /* release interrupts we already claimed */
+                while (--i >= 0) {
+                    cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
+                    riscv_cpu_release_claimed_interrupts(cpu, MIP_MSIP);
+                }
+                return;
+            }
+        }
+    }
+
     memory_region_init_io(&swi->mmio, OBJECT(dev), &riscv_aclint_swi_ops, swi,
                           TYPE_RISCV_ACLINT_SWI, RISCV_ACLINT_SWI_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &swi->mmio);
 
     swi->soft_irqs = g_malloc(sizeof(qemu_irq) * swi->num_harts);
     qdev_init_gpio_out(dev, swi->soft_irqs, swi->num_harts);
+}
 
-    /* Claim software interrupt bits */
-    for (i = 0; i < swi->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
-        /* We don't claim mip.SSIP because it is writeable by software */
-        if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < 0) {
-            error_report("MSIP already claimed");
-            exit(1);
-        }
-    }
+static void riscv_aclint_swi_finalize(Object *obj)
+{
+    RISCVAclintSwiState *swi = RISCV_ACLINT_SWI(obj);
+
+    /* free allocated area during realize */
+    g_free(swi->soft_irqs);
 }
 
 static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
@@ -415,10 +441,11 @@ static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo riscv_aclint_swi_info = {
-    .name          = TYPE_RISCV_ACLINT_SWI,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(RISCVAclintSwiState),
-    .class_init    = riscv_aclint_swi_class_init,
+    .name              = TYPE_RISCV_ACLINT_SWI,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(RISCVAclintSwiState),
+    .class_init        = riscv_aclint_swi_class_init,
+    .instance_finalize = riscv_aclint_swi_finalize,
 };
 
 /*
@@ -430,7 +457,6 @@ DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
     int i;
     DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_SWI);
 
-    assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
     assert(!(addr & 0x3));
 
     qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
-- 
2.35.1


