Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIYS-0003Ib-I2
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYO-0003I7-Ho
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:10 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYJ-0005l2-8Z
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524743; x=1666060743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UBLyHjHEECUC9xcH6KM9gTj0RdK+i3NW4tI9uSKgHk0=;
 b=Vvd0m8B2hj3KNKWvbf7y6M7iFQDcZ0gv0LYjW2j20TixYsR8gYoGl2XO
 FM/kiB3kqW/oLcF/B52D448LXtEgBC9GgThspeVE5gBeGT7nFU1pTamEP
 cR4PR6sNiNTyMwo/17SiLWDz74h6EeqPtXWny/kra5TOK8oijIeTMIkOC
 YZqP/t15YHba9+gOPnAKSfi0QL/wRP2NEtUA9hPZr7Y/DJNVvD7yVweGN
 XL2P6W/PxSWiwwLbscDngUwDUXnqFt0w10+I8r1mg7UURnVyPVplPZLof
 vDXKxqB5Pl8d7DhCOCSCyGcoNEs4c8yLJQlpRBaTJNDriTCJEjEA5u1lJ w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="294869879"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:38:53 +0800
IronPort-SDR: AMHtFEGZeloX+pcL089E8DQbT+JbWsAHcBQIcaWMWVeHotUuaQRP+O4aTxecWLlOrHV4d+oEyY
 jjMG8m7Eo6zRj6yZ5YJtJfvbJc1fRw5eeNeW69lGAQ4E0EVFy+uTeMcAiV+Jclm/SPLyrlKNRZ
 MEWeNPdURhcFJ/HBTX5MvBDWc4eH+thPMVtzzb0HSrj5gC2rQrLbP7v5p20ir31l44eYTuFoHe
 kqwm6jbhyew7kF/KqErmL4jqxbSQMefygiP/WDEoJeL1bMUQk5zkuDt8wjHeyZg9yxgUlLKwuS
 XAao66v2omOZDLgo6wkcHQal
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:13:01 -0700
IronPort-SDR: kPGIntkisqH6REsjxr8eW73j+/dCCowk8IBGpXax7aO9WSyaiNwEO0nN/4U5zzxQdXizIVcC+h
 oCCNeaJ6UApYcBBxlF5P3Cv+LaTpigo24policm8q+eTPGKD5a/27fnR2FSGH54UtQ/LjntU9P
 HGU96xlySQgglnx8bYn+uFccWcOjRV77qn8u9OqlgalGySrogHn58RAp5/ancerW2Vw2QlcaUD
 08CPhQRI/c29svg4DUfr2XmcSsT5XadcFvYfn6lEs2vRmYgKyKp58XfpcZdPK1L8leF2rSwIzh
 m7o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:38:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXgzw6LM8z1RvmF
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:38:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634524732;
 x=1637116733; bh=UBLyHjHEECUC9xcH6KM9gTj0RdK+i3NW4tI9uSKgHk0=; b=
 DCMrUv6P/kD1bwEFsuzgPnyO1VMtpEBaPg7QuxLHNbLEgg6mmSMCcrnA39r4Dglo
 0v1ZR0VFDGvwRzL5xhEQs/EOaVSK+bLM06LRrvPWJFsh14JjNZqKCPOPSGfYjQuC
 Y8uUlx+oNeYRxX2m43UYtd1jZ0Ekq+ZgFnxSweYPxbklYJF2ZjcAcI9km4mM82eZ
 bijSFWgEx7MvHFPWOuaxUosPkuPx41WcdTIHWbV42nLXOJsWrn1Fib0svO9yU/7d
 WZbZl1JRdBU+DWCB8dPiYfmdd81xlG1AbhYLGOvMMlhoob3Q+KzE/BMgp2MxCwwG
 nQIdvDybK2Xt9os0YoOhnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jRlHAwjQIXHy for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:38:52 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXgzq2BD7z1RvlJ;
 Sun, 17 Oct 2021 19:38:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/9] hw/riscv: opentitan: Update to the latest build
Date: Mon, 18 Oct 2021 12:38:39 +1000
Message-Id: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Mon, 18 Oct 2021 02:39:10 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Update the OpenTitan machine model to match the latest OpenTitan FPGA
design.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h |  6 +++---
 hw/riscv/opentitan.c         | 22 +++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 9f93bebdac..eac35ef590 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -20,7 +20,7 @@
 #define HW_OPENTITAN_H
=20
 #include "hw/riscv/riscv_hart.h"
-#include "hw/intc/ibex_plic.h"
+#include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
 #include "qom/object.h"
@@ -34,7 +34,7 @@ struct LowRISCIbexSoCState {
=20
     /*< public >*/
     RISCVHartArrayState cpus;
-    IbexPlicState plic;
+    SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
=20
@@ -87,7 +87,7 @@ enum {
 };
=20
 enum {
-    IBEX_TIMER_TIMEREXPIRED0_0 =3D 125,
+    IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
     IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
     IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9803ae6d70..601f8deebe 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -46,19 +46,19 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
     [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
-    [IBEX_DEV_PLIC] =3D           {  0x41010000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
     [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
     [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000  },
-    [IBEX_DEV_KEYMGR] =3D         {  0x41130000,  0x1000  },
+    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000 },
+    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x1000  },
     [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x1000  },
     [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
     [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
     [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
     [IBEX_DEV_ALERT_HANDLER] =3D  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
-    [IBEX_DEV_OTBN] =3D           {  0x411d0000,  0x10000 },
     [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000  },
     [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
 };
=20
@@ -105,7 +105,7 @@ static void lowrisc_ibex_soc_init(Object *obj)
=20
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY=
);
=20
-    object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
+    object_initialize_child(obj, "plic", &s->plic, TYPE_SIFIVE_PLIC);
=20
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
=20
@@ -145,6 +145,18 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
                                 &s->flash_alias);
=20
     /* PLIC */
+    qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
+    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
+
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
         return;
     }
@@ -153,7 +165,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     for (i =3D 0; i < ms->smp.cpus; i++) {
         CPUState *cpu =3D qemu_get_cpu(i);
=20
-        qdev_connect_gpio_out(DEVICE(&s->plic), i,
+        qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
                               qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
     }
=20
--=20
2.31.1


