Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6Pb-0008EM-3l
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 11:47:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PY-00088u-5N; Fri, 18 Feb 2022 11:47:12 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PV-0007aA-W4; Fri, 18 Feb 2022 11:47:11 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2D78520898;
 Fri, 18 Feb 2022 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4sr0IJti3TGhgwlPTvOYjRFvSZ9hztg7SR5KFeE83w=;
 b=3FxwdJ1N3Vhgk95zvNrO3bXB0XXz7X4Y/OtOobOZaekrE2szALsF0ZxBiXpONRBpammBai
 6aKzwKeFWy2yVCBzzfq0xph+zOUTTVno0cUYoqSBmGAEVx+0fKiFI66+YjSXMChEuILFmE
 6tO51tLrGLcnzJM4+4seUkybz5plLfE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 5/5] hw/intc/riscv_aclint: mtimer: report errors and free
 allocated memory
Date: Fri, 18 Feb 2022 17:46:46 +0100
Message-Id: <20220218164646.132112-6-damien.hedde@greensocs.com>
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
X-List-Received-Date: Fri, 18 Feb 2022 16:47:12 -0000

Add the instance_finalize() method to free the allocated arrays
and make realize() method report errors instead of exiting.

This commit also move the properties check from
riscv_aclint_mtimer_create() to realize().

code in realize() is re-ordered to first check for errors and leave
the object in a clean state. To achieve this, we do the following:
+ parse_hart_config and char_to_mode are refactored to return errors
  instead of exiting.
+ in case of interrupt claim failure, we now release the succesfully
  claimed ones.

These clean-ups allow the following life-cycle use cases (happening
when user creation is allowed) to execute as expected:
+ init -> finalize
+ init -> realize-failure -> finalize

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/intc/riscv_aclint.c | 58 +++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 4f66eeed0b..bef2e1988b 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -231,21 +231,51 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
     int i;
 
+    if (s->num_harts > RISCV_ACLINT_MAX_HARTS) {
+        error_setg(errp, "invalid 'num-harts': max is %u",
+                   RISCV_ACLINT_MAX_HARTS);
+        return;
+    }
+
+    if (s->timecmp_base & 0x7) {
+        error_setg(errp, "invalid 'timecmp-base': must be aligned on 0x8");
+        return;
+    }
+
+    if (s->time_base & 0x7) {
+        error_setg(errp, "invalid 'time-base': must be aligned on 0x8");
+        return;
+    }
+
+    /* Claim timer interrupt bits */
+    for (i = 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
+            error_setg(errp, "MTIP (hartid %u) already claimed",
+                       (unsigned) (s->hartid_base + i));
+            /* release interrupts we already claimed */
+            while (--i >= 0) {
+                cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+                riscv_cpu_release_claimed_interrupts(cpu, MIP_MTIP);
+            }
+            return;
+        }
+    }
+
     memory_region_init_io(&s->mmio, OBJECT(dev), &riscv_aclint_mtimer_ops,
                           s, TYPE_RISCV_ACLINT_MTIMER, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
     s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
+}
 
-    /* Claim timer interrupt bits */
-    for (i = 0; i < s->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
-        if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
-            error_report("MTIP already claimed");
-            exit(1);
-        }
-    }
+static void riscv_aclint_mtimer_finalize(Object *obj)
+{
+    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(obj);
+
+    /* free allocated area during realize */
+    g_free(s->timer_irqs);
 }
 
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
@@ -256,10 +286,11 @@ static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
-    .name          = TYPE_RISCV_ACLINT_MTIMER,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(RISCVAclintMTimerState),
-    .class_init    = riscv_aclint_mtimer_class_init,
+    .name              = TYPE_RISCV_ACLINT_MTIMER,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(RISCVAclintMTimerState),
+    .class_init        = riscv_aclint_mtimer_class_init,
+    .instance_finalize = riscv_aclint_mtimer_finalize,
 };
 
 /*
@@ -273,10 +304,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
     int i;
     DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
 
-    assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
     assert(!(addr & 0x7));
-    assert(!(timecmp_base & 0x7));
-    assert(!(time_base & 0x7));
 
     qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
     qdev_prop_set_uint32(dev, "num-harts", num_harts);
-- 
2.35.1


