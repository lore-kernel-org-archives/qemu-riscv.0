Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhXR-0004gr-C8
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxB-0007DN-DC
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZx9-0007uV-H1
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301727; x=1661837727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElyS80uppEByNcflPyUirCPKW1PNonQqY0PEvynn4tc=;
 b=LzZAvOJu5VPsRA4ea1t1SYzYfE7kyjCub6YQ5ryBswjB7OytXC8BiUfg
 SGce7p3u6W2IQyR/CYN5k87X0gQOOWHK0z8qcXTACsVhjRBkDTYa7/aUU
 8mWWVSh2mm0ITNiu4u11Nsgu/1WDNFG0QgEktmBuHfBgtmi4qXcPWXoij
 L6jN/8qjIZRBmokel5BsWCuAYvhYvodCjfZObqGYa24QVS9WUZI6hu16g
 UDJBWVygfK++7lFqQEPNlVKrCjvZHBcrNkFBIosU+N1sE3Z7NgcEYfZrt
 SERUSnSJdoAdOYwNjKmToo+KO4mcE1tkNEBuj5OJ4AUKPIGvGvyH2sCc8 w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="178738779"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:35:25 +0800
IronPort-SDR: Ln/xvSN5RjvhcM3pXGJmFeskh9Bm3GpLTSyLBBGlxriU+WYcMgXfDgy1VtcEdrwCcKbGOYDu6O
 PlMuTzCvQYA9+7IhZ9Nvi74LPVHyBAz8CVc4WMB58eemUya4a1b1l8AhuwSRCjHQMJmWrRhB+y
 zNZVwUWLAugnwk2MGIJmo6t6fbC959sgDbl9hDkufgRAa6GMjd4YlBCS77wa2JpRd3mMRq59gc
 5M46eh1L+BtzqqoX+SG+y0tBq+lEqlO3mQyqLgMka6/Hzmurjm1+Qr6ffs3lxMHfd1r4DTdhg8
 H38bkaxO2gQZAJMkIXO8XmLq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:10:34 -0700
IronPort-SDR: UfQBZr4IBONMGKXDEB+yEbToyhFlf1hq9/+VLGAuzT71FCj8Q+XSSE/GZDRs3iVirmurGXZQk+
 z9F3UxeKY3JHh3T9Y/H2b7VKOvIbFrPhb/kWSMc8JF4K+sJ0wgbpsMX4d0QofnAUCgCl0pJWcg
 DxjvP/zcsCqG48U0+VcGzSJz8MZUnkmEWmNNuFe5kPfDHHLRkURy8H9U1A7fZzR/1NY8xpNZQx
 0Oo4VNzySR/UNzhZGukrNSsO9eWIP0/NmbZfk1VNPlMJXlOQQWf+UP5SAmAyrH/9JOFa8mAkJa
 BV0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:35:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfDF4mByz1RvlV
 for <qemu-riscv@nongnu.org>; Sun, 29 Aug 2021 22:35:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630301725; x=1632893726; bh=ElyS80u
 ppEByNcflPyUirCPKW1PNonQqY0PEvynn4tc=; b=CqgYusS8NBz/9jLE2c+viZh
 CKUuwi416ciqy+nvPXvgFWxNZ/1lOzLfTIrU/tseE4SDU6mpdHRRs61VqNBbJL0+
 FTRj5OILMjBVB8QsUMRaYKAevfBOnV+M95Ojl89UpBpxPIQ5UUnML7rKtxK5GGj4
 YvtpK1g7kk8PkBzsZjW8MygG8pRQXq202/1JmgqV2faA3IeTCTYGdEdwNeAD4fXu
 2paU+66YRg/Be8vaMVOgWNXewupQ5reLAg15RKkL0s/7dJljEjSyoUtivMiouik1
 sX5sBuwafaSlroRalKLeiQW1AaG+STR/ErelYIOX9pyDB88I1dyKnFkGYHBtEsA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PjE3DDStSNts for <qemu-riscv@nongnu.org>;
 Sun, 29 Aug 2021 22:35:25 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfD86TSHz1Rvl9;
 Sun, 29 Aug 2021 22:35:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 5/5] hw/intc: ibex_timer: Convert the timer to use RISC-V
 CPU GPIO lines
Date: Mon, 30 Aug 2021 15:35:15 +1000
Message-Id: <84d5b1d5783d2e79eee69a2f7ac480cc0c070db3.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8697c1236=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
CPU GPIO lines to set the timer MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/timer/ibex_timer.h |  2 ++
 hw/riscv/opentitan.c          |  3 +++
 hw/timer/ibex_timer.c         | 17 ++++++++++++-----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.=
h
index 6a43537003..b6f69b38ee 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -48,5 +48,7 @@ struct IbexTimerState {
     uint32_t timebase_freq;
=20
     qemu_irq irq;
+
+    qemu_irq m_timer_irq;
 };
 #endif /* HW_IBEX_TIMER_H */
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 048aced0ec..f7cfcf1c3a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -183,6 +183,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_TIMER_TIMEREXPIRED0_0));
+    qdev_connect_gpio_out(DEVICE(&s->timer), 0,
+                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
+                                           IRQ_M_TIMER));
=20
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
             s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
@@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
=20
     /* Setup a timer to trigger the interrupt in the future */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
=20
     diff =3D cpu->env.timecmp - now;
@@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)
 static void ibex_timer_cb(void *opaque)
 {
     IbexTimerState *s =3D opaque;
-    CPUState *cs =3D qemu_get_cpu(0);
-    RISCVCPU *cpu =3D RISCV_CPU(cs);
=20
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    qemu_irq_raise(s->m_timer_irq);
     if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
         s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
         qemu_set_irq(s->irq, true);
@@ -280,12 +278,21 @@ static void ibex_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
=20
+static void ibex_timer_realize(DeviceState *dev, Error **errp)
+{
+    IbexTimerState *s =3D IBEX_TIMER(dev);
+
+    qdev_init_gpio_out(dev, &s->m_timer_irq, 1);
+}
+
+
 static void ibex_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->reset =3D ibex_timer_reset;
     dc->vmsd =3D &vmstate_ibex_timer;
+    dc->realize =3D ibex_timer_realize;
     device_class_set_props(dc, ibex_timer_properties);
 }
=20
--=20
2.31.1


