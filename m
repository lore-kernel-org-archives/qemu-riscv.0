Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXtL-0000F4-5V
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtE-0008Fi-0B; Wed, 30 Mar 2022 08:57:32 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtA-0004bK-Fg; Wed, 30 Mar 2022 08:57:31 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C363B21ECF;
 Wed, 30 Mar 2022 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nd0l66pK/eqKazwea3zL1B+q/z68d1eWANZjxDruLgA=;
 b=DpL7ux4Fho7/Trlxj2KjAch7Uqcq5FMCJGSF7ohDfZIa0Shqb7lvdRjxLocbRr9tOX0Dr4
 DhZ8LfA0ddZP9EGvqxdgKowkIRxXQJMrVlC2UBZa8+2wSwiUBDocgP5kS7w8g+sM/CSXHk
 WdKvvqLl7PY+FkEbT6aDT8UELAe7WVg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 14/18] hw/riscv/riscv_hart: use cpus as base class
Date: Wed, 30 Mar 2022 14:56:35 +0200
Message-Id: <20220330125639.201937-15-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:33 -0000

This is a drastic update: qom-path of riscv harts are changed
by this patch from "/path/to/array/hart[n]" to "/path/to/array/cpu[n]".

This object is now not anymore a SYS_BUS_DEVICE.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

I expect it is an issue regarding migration of riscv machines.
It is possible to keep an "hart[n]" alias to "cpu[n]" or even
to be able to configure the cpu child basename to "hart".

I'm not sure what we need to keep migration working: Does qom-path
has to stay identical ? Or having aliases is ok ?

Any ideas or comments ?

Any of these changes could be fixed by adding support in the base class
(child name, sysbus device, ...) if needed.
---
 include/hw/riscv/riscv_hart.h | 17 ++++++------
 hw/riscv/riscv_hart.c         | 49 ++++++++++++++---------------------
 2 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 71747bf37c..65ac0d2bc4 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -21,7 +21,7 @@
 #ifndef HW_RISCV_HART_H
 #define HW_RISCV_HART_H
 
-#include "hw/sysbus.h"
+#include "hw/cpu/cpus.h"
 #include "target/riscv/cpu.h"
 #include "qom/object.h"
 
@@ -31,30 +31,29 @@ OBJECT_DECLARE_SIMPLE_TYPE(RISCVHartArrayState, RISCV_HART_ARRAY)
 
 struct RISCVHartArrayState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    CpusState parent_obj;
 
     /*< public >*/
-    uint32_t num_harts;
     uint32_t hartid_base;
-    char *cpu_type;
     uint64_t resetvec;
-    RISCVCPU *harts;
 };
 
 /**
  * riscv_array_get_hart:
+ * Helper to get an hart from the container.
  */
-static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *harts, int i)
+static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *s, int i)
 {
-    return &harts->harts[i];
+    return RISCV_CPU(CPUS(s)->cpus[i]);
 }
 
 /**
  * riscv_array_get_num_harts:
+ * Helper to get the number of harts in the container.
  */
-static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *harts)
+static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *s)
 {
-    return harts->num_harts;
+    return CPUS(s)->topology.cpus;
 }
 
 /* Temporary function until we migrated the riscv hart array to simple device */
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 780fd3a59a..1b4ff7e3c6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -22,67 +22,58 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/reset.h"
-#include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/riscv/riscv_hart.h"
+#include "hw/cpu/cpus.h"
 
 void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
 {
-    sysbus_realize(SYS_BUS_DEVICE(state), errp);
+    /* disable the clustering */
+    cpus_disable_clustering(CPUS(state));
+    qdev_realize(DEVICE(state), NULL, errp);
 }
 
 static Property riscv_harts_props[] = {
-    DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
-    DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
                        DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void riscv_harts_cpu_reset(void *opaque)
+static void riscv_harts_configure_cpu(CpusState *base, CPUState *cpu,
+                                      unsigned i)
 {
-    RISCVCPU *cpu = opaque;
-    cpu_reset(CPU(cpu));
-}
+    RISCVHartArrayState *s = RISCV_HART_ARRAY(base);
+    DeviceState *cpudev = DEVICE(cpu);
+    CPURISCVState *cpuenv = cpu->env_ptr;
 
-static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
-                               char *cpu_type, Error **errp)
-{
-    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
-    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
-    s->harts[idx].env.mhartid = s->hartid_base + idx;
-    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
-    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
+    qdev_prop_set_uint64(cpudev, "resetvec", s->resetvec);
+    cpuenv->mhartid = s->hartid_base + i;
 }
 
-static void riscv_harts_realize(DeviceState *dev, Error **errp)
+static void riscv_harts_init(Object *obj)
 {
-    RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
-    int n;
-
-    s->harts = g_new0(RISCVCPU, s->num_harts);
-
-    for (n = 0; n < s->num_harts; n++) {
-        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
-            return;
-        }
-    }
+    /* add a temporary property to keep num-harts */
+    object_property_add_alias(obj, "num-harts", obj, "num-cpus");
 }
 
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
 
     device_class_set_props(dc, riscv_harts_props);
-    dc->realize = riscv_harts_realize;
+
+    cc->base_cpu_type = TYPE_RISCV_CPU;
+    cc->configure_cpu = riscv_harts_configure_cpu;
 }
 
 static const TypeInfo riscv_harts_info = {
     .name          = TYPE_RISCV_HART_ARRAY,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_CPUS,
     .instance_size = sizeof(RISCVHartArrayState),
+    .instance_init = riscv_harts_init,
     .class_init    = riscv_harts_class_init,
 };
 
-- 
2.35.1


