Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6PY-00088x-6t
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 11:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PW-00085z-Ds; Fri, 18 Feb 2022 11:47:10 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PU-0007Zg-0A; Fri, 18 Feb 2022 11:47:10 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 7735020896;
 Fri, 18 Feb 2022 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xAX7SU4pUP9bh0Xw0cTOBSAO2Z9jvzl/Q7RYi9FiL0=;
 b=vB5QzmJQgoa8EfUH73F9HoPzEsDH4rpT73S13B6eCIeNyuvelFTmXkGK869psvcrqVcWro
 KuhTsHlFZa/CNPztWfeLL+tXImKdA+L+0SntDi7TOnh849JWUdIvd5ammGScIg3hW7lopj
 Q8ciccTb3HL6wk5Q6OvILB+SxTQzotw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 3/5] hw/intc/sifive_plic: report errors and free allocated
 memory
Date: Fri, 18 Feb 2022 17:46:44 +0100
Message-Id: <20220218164646.132112-4-damien.hedde@greensocs.com>
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
 hw/intc/sifive_plic.c | 90 +++++++++++++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index eebbcf33d4..8692ea6725 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -37,16 +37,20 @@ static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
     return addr >= base && addr - base < num;
 }
 
-static PLICMode char_to_mode(char c)
+static PLICMode char_to_mode(char c, bool *success)
 {
+    if (success) {
+        *success = true;
+    };
     switch (c) {
     case 'U': return PLICMode_U;
     case 'S': return PLICMode_S;
     case 'H': return PLICMode_H;
     case 'M': return PLICMode_M;
     default:
-        error_report("plic: invalid mode '%c'", c);
-        exit(1);
+        g_assert(success != NULL);
+        *success = false;
+        return 0;
     }
 }
 
@@ -260,7 +264,7 @@ static void sifive_plic_reset(DeviceState *dev)
  * "MS,MS"          2 harts, 0-1 with M and S mode
  * "M,MS,MS,MS,MS"  5 harts, 0 with M mode, 1-5 with M and S mode
  */
-static void parse_hart_config(SiFivePLICState *plic)
+static bool parse_hart_config(SiFivePLICState *plic, Error **errp)
 {
     int addrid, hartid, modes;
     const char *p;
@@ -275,11 +279,16 @@ static void parse_hart_config(SiFivePLICState *plic)
             modes = 0;
             hartid++;
         } else {
-            int m = 1 << char_to_mode(c);
+            bool mode_ok = false;
+            int m = 1 << char_to_mode(c, &mode_ok);
+            if (!mode_ok) {
+                error_setg(errp, "plic: invalid mode '%c'", c);
+                return false;
+            }
             if (modes == (modes | m)) {
-                error_report("plic: duplicate mode '%c' in config: %s",
-                             c, plic->hart_config);
-                exit(1);
+                error_setg(errp, "plic: duplicate mode '%c' in config: %s",
+                           c, plic->hart_config);
+                return false;
             }
             modes |= m;
         }
@@ -302,10 +311,12 @@ static void parse_hart_config(SiFivePLICState *plic)
         } else {
             plic->addr_config[addrid].addrid = addrid;
             plic->addr_config[addrid].hartid = hartid;
-            plic->addr_config[addrid].mode = char_to_mode(c);
+            plic->addr_config[addrid].mode = char_to_mode(c, NULL);
             addrid++;
         }
     }
+
+    return true;
 }
 
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
@@ -321,12 +332,34 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     SiFivePLICState *s = SIFIVE_PLIC(dev);
     int i;
 
+    if (!parse_hart_config(s, errp)) {
+        return;
+    }
+
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow the
+     * supervisor to clear a pending external interrupt which will result in
+     * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
+     * hardware controlled when a PLIC is attached.
+     */
+    for (i = 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
+            error_setg(errp, "SEIP (hartid %u) already claimed",
+                       (unsigned) (s->hartid_base + i));
+            /* release interrupts we already claimed */
+            while (--i >= 0) {
+                cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+                riscv_cpu_release_claimed_interrupts(cpu, MIP_SEIP);
+            }
+            return;
+        }
+    }
+
     memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_plic_ops, s,
                           TYPE_SIFIVE_PLIC, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
-    parse_hart_config(s);
-
     s->bitfield_words = (s->num_sources + 31) >> 5;
     s->num_enables = s->bitfield_words * s->num_addrs;
     s->source_priority = g_new0(uint32_t, s->num_sources);
@@ -343,19 +376,6 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     s->m_external_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
 
-    /* We can't allow the supervisor to control SEIP as this would allow the
-     * supervisor to clear a pending external interrupt which will result in
-     * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
-     * hardware controlled when a PLIC is attached.
-     */
-    for (i = 0; i < s->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
-        if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
-        }
-    }
-
     msi_nonbroken = true;
 }
 
@@ -380,6 +400,19 @@ static const VMStateDescription vmstate_sifive_plic = {
         }
 };
 
+static void sifive_plic_finalize(Object *obj)
+{
+    SiFivePLICState *s = SIFIVE_PLIC(obj);
+
+    /* free allocated arrays during realize */
+    g_free(s->addr_config);
+    g_free(s->source_priority);
+    g_free(s->target_priority);
+    g_free(s->pending);
+    g_free(s->claimed);
+    g_free(s->enable);
+}
+
 static Property sifive_plic_properties[] = {
     DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
     DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
@@ -406,10 +439,11 @@ static void sifive_plic_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo sifive_plic_info = {
-    .name          = TYPE_SIFIVE_PLIC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SiFivePLICState),
-    .class_init    = sifive_plic_class_init,
+    .name              = TYPE_SIFIVE_PLIC,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(SiFivePLICState),
+    .class_init        = sifive_plic_class_init,
+    .instance_finalize = sifive_plic_finalize,
 };
 
 static void sifive_plic_register_types(void)
-- 
2.35.1


