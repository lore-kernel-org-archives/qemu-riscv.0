Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhXR-0004gF-3L
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxB-0007DM-94
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:29 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZx8-0007u3-FM
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301726; x=1661837726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DbvJuxxtAb/ojEOuQffJ+/3nh+9Kr5gmKMWIROe04To=;
 b=Skwiyv3bV9wVJj5xzsuJd/9O02A7YSQMIuuOyipUev2jb9UndeQeqtFz
 hLwt+9doXIVcbQwLuloIwBot/qSKtrRx6wrITlVgmJ++E+qxs7eX4sZtS
 CEMn+07KBRE9e5mLGqJTU+JFtJT9ayUEfi4NpkZIjgPujBHd7BtEOIEi8
 KZz+9M9jTeKQMd4xCHQXwh4iICTTsziGnzu99cS6j62xoaE1R8NVMuyRf
 XpCindmqgOLKjAgb74v/LBKHGv3/Rr9AecT2A0UEQsP6WBFYGK3Xm8Kzw
 5y24YXi23rH0ZVGBvO0/bdSlGSMvTQKV8ml//4YnMrZoKeSNOj1uzN9EO w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="290336875"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:34:48 +0800
IronPort-SDR: nwJOthGug4ixFYWQwEPn/t/KLwfs9+/2jUaNnbLURkSGIOO8zaFx4wAvacKrhVRx9Hiq0C6OzI
 hDftnj09cs4ni66OZON3BeXrUnb/WSp9pRJmJtZbx5cjFMOw+d0NsvdvM9VIrWgHfE7GksgSO9
 XSw2uUT/OSIDL4RD/81Ct0bneuhv0h5cqTF/Y//PshPI/6vLEUhzh0+BCngWXx7Gkao7kqYsuf
 p2S6rDCcNXeXmDm/+R/NuIQKZGSPK38gGYTiaogbaOnMqUhavGl6uOAD80AcsIAu7XV2qmlizb
 9I13tRQI9quIgilBl2XB5Msy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:09:56 -0700
IronPort-SDR: CO/4YI/f37XoM7m1C51MfKWgAXwLC+LW6X0DGFm6YqkSX27jLivLUiwVIpyAvya5CfBsSFlSg9
 xZR5a3gvfMq8ssuXmC3oVVJ2RiXy0qlgH4+jrrqcGGoebIfXSz/yxnklJos3K2ZjXR23SddC0I
 FqUSEJJYz/76EAbatRh+ek/OsxJWs5YFxgEFqLa9xepAERqGlpGeTiAkHyzJj7GlYqdPKX+dqE
 NDJP3yWrH82P3bpwfka1F4Bus/9C5xJLJ02y131TEBuak0QjatPK9/JRNSChU3DKVeKbRUG0KZ
 568=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:34:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfCW4jZPz1RvlT
 for <qemu-riscv@nongnu.org>; Sun, 29 Aug 2021 22:34:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630301686; x=1632893687; bh=DbvJuxxtAb/ojEOuQf
 fJ+/3nh+9Kr5gmKMWIROe04To=; b=bHsefsgr8D8Xot/CEuOqvywd39zvGyK5U8
 zO0Rv+B5/PwIVTPpY5i1ErazLmSpT8IhD6kV9q+jUFnbRGP/QIUrOmus5xft+QpV
 giccUPz9lgQWNxU4MEbqTNSRG2QnFy/ivp3mk2PhdpXRa8RibyLXxVByOpkvDa2O
 MvG/zcA99U69V/0kMqe8fPxWjfQMp1vsGt7yr5TcCwqNE4NeZb3/wny73MudKwZh
 1WX5ENgvRfNaAldx0lDOgZaI8OBFd1u8TxaI3YkMkh9hv5vnxbEewi1t2fnWgroA
 es5VkAOe2Qy4idBh/qakPsx+NUIC6hyswGjy8GAub7HwqJrgSCUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id H1wopOWuI1dV for <qemu-riscv@nongnu.org>;
 Sun, 29 Aug 2021 22:34:46 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfCR09JMz1Rvl9;
 Sun, 29 Aug 2021 22:34:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
Date: Mon, 30 Aug 2021 15:34:36 +1000
Message-Id: <946e1ef5e268b24084c7ddad84c146de62a56736.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=8697c1236=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 30 Aug 2021 05:35:30 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer and soft MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 include/hw/intc/sifive_clint.h |  2 +
 hw/intc/sifive_clint.c         | 68 ++++++++++++++++++++++++----------
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clin=
t.h
index a30be0f3d6..921b1561dd 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
+    qemu_irq *timer_irqs;
+    qemu_irq *soft_irqs;
 } SiFiveCLINTState;
=20
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..b2f83604a6 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -28,6 +28,12 @@
 #include "hw/qdev-properties.h"
 #include "hw/intc/sifive_clint.h"
 #include "qemu/timer.h"
+#include "hw/irq.h"
+
+typedef struct sifive_clint_callback {
+    SiFiveCLINTState *s;
+    int num;
+} sifive_clint_callback;
=20
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
@@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_fr=
eq)
  * Called when timecmp is written to update the QEMU timer or immediatel=
y
  * trigger timer interrupt if mtimecmp <=3D current timer value.
  */
-static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
+static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cp=
u,
+                                       int hartid,
+                                       uint64_t value,
                                        uint32_t timebase_freq)
 {
     uint64_t next;
@@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,=
 uint64_t value,
     if (cpu->env.timecmp <=3D rtc_r) {
         /* if we're setting an MTIMECMP value in the "past",
            immediately raise the timer interrupt */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
         return;
     }
=20
     /* otherwise, set up the future timer interrupt */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
     diff =3D cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
@@ -70,8 +78,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, u=
int64_t value,
  */
 static void sifive_clint_timer_cb(void *opaque)
 {
-    RISCVCPU *cpu =3D opaque;
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    sifive_clint_callback *state =3D opaque;
+
+    qemu_irq_raise(state->s->timer_irqs[state->num]);
 }
=20
 /* CPU wants to read rtc or timecmp register */
@@ -137,7 +146,7 @@ static void sifive_clint_write(void *opaque, hwaddr a=
ddr, uint64_t value,
         if (!env) {
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x3) =3D=3D 0) {
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(=
value));
+            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], =
value);
         } else {
             error_report("clint: invalid sip write: %08x", (uint32_t)add=
r);
         }
@@ -153,13 +162,13 @@ static void sifive_clint_write(void *opaque, hwaddr=
 addr, uint64_t value,
         } else if ((addr & 0x7) =3D=3D 0) {
             /* timecmp_lo */
             uint64_t timecmp_hi =3D env->timecmp >> 32;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase=
_freq);
             return;
         } else if ((addr & 0x7) =3D=3D 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo =3D env->timecmp;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase=
_freq);
         } else {
             error_report("clint: invalid timecmp write: %08x", (uint32_t=
)addr);
@@ -205,6 +214,12 @@ static void sifive_clint_realize(DeviceState *dev, E=
rror **errp)
     memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
                           TYPE_SIFIVE_CLINT, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    s->timer_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
+
+    s->soft_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
 }
=20
 static void sifive_clint_class_init(ObjectClass *klass, void *data)
@@ -228,7 +243,6 @@ static void sifive_clint_register_types(void)
=20
 type_init(sifive_clint_register_types)
=20
-
 /*
  * Create CLINT device.
  */
@@ -238,29 +252,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwadd=
r size,
     bool provide_rdtime)
 {
     int i;
+
+    DeviceState *dev =3D qdev_new(TYPE_SIFIVE_CLINT);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "sip-base", sip_base);
+    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
+    qdev_prop_set_uint32(dev, "time-base", time_base);
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
     for (i =3D 0; i < num_harts; i++) {
         CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+        RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
         CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+        sifive_clint_callback *cb =3D g_malloc0(sizeof(sifive_clint_call=
back));
+
         if (!env) {
+            g_free(cb);
             continue;
         }
         if (provide_rdtime) {
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_fr=
eq);
         }
+
+        cb->s =3D SIFIVE_CLINT(dev);
+        cb->num =3D i;
         env->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cpu);
+                                  &sifive_clint_timer_cb, cb);
         env->timecmp =3D 0;
+
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIME=
R));
+        qdev_connect_gpio_out(dev, num_harts + i,
+                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT=
));
     }
=20
-    DeviceState *dev =3D qdev_new(TYPE_SIFIVE_CLINT);
-    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
-    qdev_prop_set_uint32(dev, "num-harts", num_harts);
-    qdev_prop_set_uint32(dev, "sip-base", sip_base);
-    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
-    qdev_prop_set_uint32(dev, "time-base", time_base);
-    qdev_prop_set_uint32(dev, "aperture-size", size);
-    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
     return dev;
 }
--=20
2.31.1


