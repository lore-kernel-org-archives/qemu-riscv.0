Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZGo-00057F-OL
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGi-00054o-Vo; Wed, 14 Jul 2021 03:25:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGg-0007eb-Sk; Wed, 14 Jul 2021 03:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247517; x=1657783517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aK5q1LfWMp0Zj3X51JFq8pt1YpO/bfu94V3Z/HHoSvI=;
 b=G9/SoyboF7MvvF5rPbjzhOrgoJz+q7ADwgzkzpGKKpqVza9fvm9xGnM4
 3I5jDfxkopZqTd5BVVv2SoBMWXDsxebiCCTA7jfoiUUbt9PaOHi1hQSMN
 vV55POg7so73Rpl5kvhpgVFj0P6456wKy38RBi10ljebYnANaO+vvGdmO
 3GEctxy2uPDFTClGaxUgqY+dFd6UkDzGpB5+pFr2ITTaEd3pV5UbF1LDk
 2uHoKNaT1F80kkPnAXs8eX1PJfO33GMRgN7CO3jixCNboJEkRZ2Nn3kCy
 EIUOziFMKwRtVL6C/y1ACwwTbObuNRZxHqy/ijVKSur/waoRr/VeRwNTq w==;
IronPort-SDR: KP/SBNPBVtHld5ySvdXn1BuslhBUJ+LOXOPUMU3RgLRfLcHp1vYOjzTJOwVRqddFpzFqI3AI3n
 eYYKU7eRRmiL9CZr+lLcFEVKy+lscKY1rwOsw6JGBcn9u2HdKYuLe2kwwM6LkHOvBFUHiDqNC4
 PPDRZjIZE3rI292gpniTb9i6lGQMb95GyOmdlpiaoclhYWfSzmbj8YYQur7djgcmyClj+t5k2Y
 dBvsKK+vG3255BDd0efC7X1klToAOjEL05nWj5RF5ffOvJRa6LGZuL3MnqInMTh2yV6dXu6K4H
 F6s=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="179344528"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:25:15 +0800
IronPort-SDR: /m2P4vKkH6K81q7QRVeHJV5qWbdyy4ml3UmYMfgXDnb9UM/LrPiyUex23NS+LHARcJj62PkagW
 mmR3Kx0krc7NG+Y4W+FbUAJ4YkutkUDVCQ9gQttNFxeXh/H2heNodGulEAPXtx5NVQ549KuhkL
 azM/AamOTK/1lb0PqjD5xPYRJLUIJzplrFmrVVMW5Qyevnp6Lx1XsDxnCRE9ywujhRy15BKEBV
 XnXbBJnsM7Sze/5wWwEXxd3Hwh1zbxIlDe6ffQTGPbM6EqZe/s2d/NLhPIfcj14PanQcClG4V2
 30iAFMUrsvKQQaCStBx23biB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:01:59 -0700
IronPort-SDR: 7jT0YsNB27Vu9jALH7fWStT7SujC0L7pjqr3+Fx5yHPj/5mlK6um4xRfvC9L2IMqPeOeJMYCaF
 jhL2qOftSdj6Y2QDPZiQwNAbkvd92cm+2J4ycjYfWzH3iR85F/ZyxRmY1Bbf4VUOOB1pW2r7so
 GfJULDht792Sc0WWklXJtJdsOKkqCRlEDXXuicYqHEysG7V7FRkDM7MceH46RpQ8WlTyAkdeLH
 +rJeKl3FshAbtA/FHhSBDkyk5V5s+W8jhpW3OweVybq/zn88QkrJRdy7aep1vhETYjarG+5Tn9
 WKY=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jul 2021 00:25:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 5/5] hw/intc: ibex_timer: Convert the timer to use RISC-V
 CPU GPIO lines
Date: Wed, 14 Jul 2021 17:25:11 +1000
Message-Id: <78eb66f16d6096a60479759e2c1deb524c39757e.1626247467.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 14 Jul 2021 07:25:22 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/timer/ibex_timer.h |  2 ++
 hw/riscv/opentitan.c          |  3 +++
 hw/timer/ibex_timer.c         | 17 ++++++++++++-----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 6a43537003..b6f69b38ee 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -48,5 +48,7 @@ struct IbexTimerState {
     uint32_t timebase_freq;
 
     qemu_irq irq;
+
+    qemu_irq m_timer_irq;
 };
 #endif /* HW_IBEX_TIMER_H */
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 88a0200972..fb0750c16f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -176,6 +176,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_TIMER_TIMEREXPIRED0_0));
+    qdev_connect_gpio_out_named(DEVICE(&s->timer), NULL, 0,
+                                qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
+                                                 IRQ_M_TIMER));
 
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 5befb53506..66e1f8e48c 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -77,7 +77,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->m_timer_irq);
         if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
             s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
@@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Setup a timer to trigger the interrupt in the future */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
 
     diff = cpu->env.timecmp - now;
@@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 static void ibex_timer_cb(void *opaque)
 {
     IbexTimerState *s = opaque;
-    CPUState *cs = qemu_get_cpu(0);
-    RISCVCPU *cpu = RISCV_CPU(cs);
 
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    qemu_irq_raise(s->m_timer_irq);
     if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
         s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
         qemu_set_irq(s->irq, true);
@@ -280,12 +278,21 @@ static void ibex_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
+static void ibex_timer_realize(DeviceState *dev, Error **errp)
+{
+    IbexTimerState *s = IBEX_TIMER(dev);
+
+    qdev_init_gpio_out(dev, &s->m_timer_irq, 1);
+}
+
+
 static void ibex_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = ibex_timer_reset;
     dc->vmsd = &vmstate_ibex_timer;
+    dc->realize = ibex_timer_realize;
     device_class_set_props(dc, ibex_timer_properties);
 }
 
-- 
2.31.1


