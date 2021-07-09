Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hEp-0007mY-3q
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEn-0007i3-BQ; Thu, 08 Jul 2021 23:31:37 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEl-0006ec-FG; Thu, 08 Jul 2021 23:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801494; x=1657337494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXIILtZslEpEVdMOElaZ83rBmD2Q9028dbZaS7jZb9Y=;
 b=GQifXc+3u6STj8Neie2X808YrW9XKRRsDkYWiv+Hnf+RwTY9eyKPD7Df
 h3TJ9Kjgz+VP0rIQrrGnBuV0qthctVDGXkTd/HSxJa+3dzoonYjAeAaKQ
 3tpvmVACgeou1+CDV5U/wlthav3r9C66+zFEAWJxSGGFrpTt0SDxh4XMb
 Bhn7hXygFUNj7znnbPsQnuUCPF0QvQ39KibDG1yXNTUKdePsZMcthLAmC
 t9UustVa5aTGJGbfDML74nTSmGbN+kgNCuxdl1rUJIdUcqlLItyHrScyX
 AHBd9YCEHp/QgvziyfvgztBPFhBdBxVwUmeD85/ze1grGSeQ1vg5+wdy2 A==;
IronPort-SDR: x+Hy3P1EbkUzjZz73DQXkgXXgYf0sird2fVjVTGCP1fD5fBKZeCQLCWyx/itL6S57XdC1/TgYc
 A14ccGi6JKVdVU5yGvanxmUIE2EeskbdjdFg8lKP+2dnKWDKZ3h8qxuJ83QATn8SI8xXqV3r3N
 zUO11tCNBAFmuVA88zKQkeqcBY6NOUUoauTuo3qjhCJizIH4Kiohn/3IuTB6Y39cMjpu2vT37W
 TJIglPng/AdbS82wtoL7Mt6GYUVCevSulhRV5o6mWHzPknYvQ7AzRNiLwmBboMqaqcEl//oZfc
 3VE=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="178927543"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:31:31 +0800
IronPort-SDR: hhPFpluprrTcPcNpGvhWDjKmbnVjAMHo8mxRihDAeU/UE/ag4gq1caTriaYR9HjVa5u19Oo9qW
 VIsV9m2D0ZTJ3z3M0C4QUw+JRvNMxZjh82n8oFm47iG92Hlwk4sPM+tMajVh5odPxdr6hbkiFH
 fJtJfy1WoI0sMuvNtuHWme1aBEj8hzVAUIp/AzEfA+zvTdCLILseTQfyblql1XdwI1x465lMon
 GuNTlNFfLc/r4IQiqsbmJdI72b9VvSCmL9nfzFX5m57Kt2/4f9gqzjyMvKcYgypm8s3Eu3G87+
 yBNrmmXP8qLDuhGsP1LKAeJR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:09:45 -0700
IronPort-SDR: 6EN3tfQIvuASYNyBe3pJs7mxinuKB8xJHAGZaCC0DfPDvVWGCrw1lZwdvR3LSLwrorWxSSWJsF
 uGNwhz9j3mZBuH40vRsV3G0jT6ZGhQKpvOsSMUsOsyqZnuX8ZMDqubvxpS3tYQMkB1TFhdOpej
 YhNtTmxbao8Terox73/gDB47C2/jlblerFUaCHp/JMA/VC7KWF9Nr9HmLMoQOdM/6ypWeXmvxj
 LX1hs+6MxalHPFLQUy9YBLPVXPJK1iU8efNlKvG4ZQKC9zlrslYL9mGhdxXUUYBdcfNIRr4xGY
 g7g=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:31:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 5/5] hw/intc: ibex_timer: Convert the timer to use RISC-V
 CPU GPIO lines
Date: Fri,  9 Jul 2021 13:31:26 +1000
Message-Id: <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
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
X-List-Received-Date: Fri, 09 Jul 2021 03:31:37 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/timer/ibex_timer.h |  2 ++
 hw/riscv/opentitan.c          |  3 +++
 hw/timer/ibex_timer.c         | 17 ++++++++++++-----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 6a43537003..b52642316d 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -48,5 +48,7 @@ struct IbexTimerState {
     uint32_t timebase_freq;
 
     qemu_irq irq;
+
+    qemu_irq m_timer_irqs;
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
index 5befb53506..13d6df5c86 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -77,7 +77,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->m_timer_irqs);
         if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
             s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
@@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Setup a timer to trigger the interrupt in the future */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->m_timer_irqs);
     qemu_set_irq(s->irq, false);
 
     diff = cpu->env.timecmp - now;
@@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 static void ibex_timer_cb(void *opaque)
 {
     IbexTimerState *s = opaque;
-    CPUState *cs = qemu_get_cpu(0);
-    RISCVCPU *cpu = RISCV_CPU(cs);
 
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    qemu_irq_raise(s->m_timer_irqs);
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
+    qdev_init_gpio_out(dev, &s->m_timer_irqs, 1);
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


