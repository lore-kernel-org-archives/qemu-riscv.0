Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhXS-0004lW-Ed
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 09:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxm-0007SU-FX
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:36:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:59126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxh-0008ME-R3
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301761; x=1661837761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GGWiDACSH03nm/CKhcs0uPyEIjeFOoJwborFbGxLIYQ=;
 b=DBFNgDVf0ghKshVYCBa1qpZULPsSgltltmgRyO+HEA5pw19Rlpl2ddnl
 M0VF0crQsWOml1wa+N8H7gOfA2v1Q8zb5uWJ+MJ+zdymeBpysfai4+4BI
 Eu3B/E1b3+LFKC+efODdJopESIIxaQgSlAV1HLe2l8a6hMGbxoAeD3Swi
 3NRXuPIecwAQUy3ol6E7dNx3bwmfEDw7P03ol20XL23bbiP2IFY7KTumz
 9Hzi6ZhC4/q7N9UkIbalt0lLIAs2QslPnT7+N6ZIkv8LCDzWKG7YRcOtl
 Fzhk7nzZVBD3LFi4V/ENRwxXnkO+zJ9yd1Tq9Z8dGMICab3nL0RY15XYA g==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="282524622"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:35:14 +0800
IronPort-SDR: GEYgFK3c0glqiKZ8ce+WyjaODS9UohcoEmkF5i6u4q1oJ1l7HSch74laBKirFRzTO4SKhbePLu
 YxseNXI0igHWqXwKNct7nXmO/uGlNPlYuiVV5QZaXVxQXqTk9I47RGIcshnwHLiqzTlms5O8nU
 Fkjnxzs/Y5GDwoEZmxT93S94FDP+iZVygygv4d8HstWjWZt4hbGSzUx7Fb/9TQSvk5ZexWyb9F
 S1o+N/lXHoTPEbbFkkFqz4g7dngz1EQJBbFOSNAZW5DevV/WYtv3zMsoeSWT3XKX7DoOdPVu0T
 DRXHYDMyFeo5VDApgyi4Fo9J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:12:04 -0700
IronPort-SDR: 3T9gxjn1s3o+a6BaIqJqMD7TinJAvZokzlDoWJUtmJTbi/l4OPUDG3il7+XFYIVepgE3He7V8/
 g2zeNl49oDwTojle5KfMKMrMT4EP4WIMrbwXyS3zGzRqNMv0Z42jkCbyhtjbJZ8pX4/ytUMtQH
 fV/ZDaAOg8e1YWO0wBliF1RxNRT79XLmi0PsnhNspHUGBYfdD/KX7mWY6j98r3CCx234mb7oRw
 Ta9XPyMV04QotMhwc4Vj6+I+QtvmCCs3XvA84PCZtS/630+0DCp6h7+pXq16fXoXiPfGcCBfJZ
 twQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:35:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfD13pd8z1RvlZ
 for <qemu-riscv@nongnu.org>; Sun, 29 Aug 2021 22:35:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630301712; x=1632893713; bh=GGWiDAC
 SH03nm/CKhcs0uPyEIjeFOoJwborFbGxLIYQ=; b=nN+7SQeoo/mNh3R0rjHaDgA
 j4kPoy1JpeAFpQykag9uNQXtqoKXp7rTEI1sFD9la52826fJRPJvzkZthURNtEiq
 LmMENaebzAqm71VQ4z5i+Laao3hD4HUufBMQMPnxmhWp+6jbgHp6g6AUdRCSNTHX
 hUuH3CXIuXB6fyQQjPlGDMbjRhq5emOkWD1kmI/CX1+zo5IGEV9i7rP4bb+aRb2T
 EgjD8gprbMdXup2/b3FeK4vgLCSV/IK/LeDCOxvd740kvx4eDwkpIQANOz9nn1O9
 kRcO45B13frwJMlCKg61hTQN0p1YZCsL48sj+7EuumjqWKPKD915SEttTTu+jWg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OnrxZuebaWqq for <qemu-riscv@nongnu.org>;
 Sun, 29 Aug 2021 22:35:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfCw6CL5z1Rvl9;
 Sun, 29 Aug 2021 22:35:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 4/5] hw/intc: sifive_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
Date: Mon, 30 Aug 2021 15:35:02 +1000
Message-Id: <0364190bfa935058a845c0fa1ecf650328840ad5.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8697c1236=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:41:23 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Aug 2021 05:36:06 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/hw/intc/sifive_plic.h |  4 ++++
 hw/intc/sifive_plic.c         | 30 +++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c    |  2 +-
 hw/riscv/shakti_c.c           |  3 ++-
 hw/riscv/sifive_e.c           |  2 +-
 hw/riscv/sifive_u.c           |  2 +-
 hw/riscv/virt.c               |  2 +-
 7 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
index 1e451a270c..134cf39a96 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -72,9 +72,13 @@ struct SiFivePLICState {
     uint32_t context_base;
     uint32_t context_stride;
     uint32_t aperture_size;
+
+    qemu_irq *m_external_irqs;
+    qemu_irq *s_external_irqs;
 };
=20
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 78903beb06..9ba36dc0b3 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -29,6 +29,7 @@
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
+#include "hw/irq.h"
=20
 #define RISCV_DEBUG_PLIC 0
=20
@@ -139,18 +140,14 @@ static void sifive_plic_update(SiFivePLICState *pli=
c)
     for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid =3D plic->addr_config[addrid].hartid;
         PLICMode mode =3D plic->addr_config[addrid].mode;
-        CPUState *cpu =3D qemu_get_cpu(hartid);
-        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            continue;
-        }
         int level =3D sifive_plic_irqs_pending(plic, addrid);
+
         switch (mode) {
         case PLICMode_M:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(=
level));
+            qemu_set_irq(plic->m_external_irqs[hartid - plic->hartid_bas=
e], level);
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(=
level));
+            qemu_set_irq(plic->s_external_irqs[hartid - plic->hartid_bas=
e], level);
             break;
         default:
             break;
@@ -456,6 +453,12 @@ static void sifive_plic_realize(DeviceState *dev, Er=
ror **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
=20
+    plic->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
+    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
+
+    plic->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
+    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
+
     /* We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
@@ -520,6 +523,7 @@ type_init(sifive_plic_register_types)
  * Create PLIC device.
  */
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
@@ -527,6 +531,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
+    int i;
+
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
     assert(context_stride =3D=3D (context_stride & -context_stride));
     qdev_prop_set_string(dev, "hart-config", hart_config);
@@ -542,5 +548,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *h=
art_config,
     qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i =3D 0; i < num_harts; i++) {
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
+        qdev_connect_gpio_out(dev, num_harts + i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     return dev;
 }
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eb8e79e0a1..eef55f69fd 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -274,7 +274,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
=20
     /* PLIC */
     s->plic =3D sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
         MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
         MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 18f70fadaa..09d4e1433e 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -106,13 +106,14 @@ type_init(shakti_c_machine_type_info_register)
=20
 static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms =3D MACHINE(qdev_get_machine());
     ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory =3D get_system_memory();
=20
     sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
=20
     sss->plic =3D sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base=
,
-        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SHAKTI_C_PLIC_NUM_SOURCES,
         SHAKTI_C_PLIC_NUM_PRIORITIES,
         SHAKTI_C_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 5b7b245e1f..04265c5640 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -197,7 +197,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
-        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
+        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SIFIVE_E_PLIC_NUM_SOURCES,
         SIFIVE_E_PLIC_NUM_PRIORITIES,
         SIFIVE_E_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6cc1a62b0f..6766edc1d0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -832,7 +832,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         SIFIVE_U_PLIC_NUM_SOURCES,
         SIFIVE_U_PLIC_NUM_PRIORITIES,
         SIFIVE_U_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0e55411045..1ecaa0d9b7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -618,7 +618,7 @@ static void virt_machine_init(MachineState *machine)
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
             memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, base_hartid,
+            plic_hart_config, hart_count, base_hartid,
             VIRT_PLIC_NUM_SOURCES,
             VIRT_PLIC_NUM_PRIORITIES,
             VIRT_PLIC_PRIORITY_BASE,
--=20
2.31.1


