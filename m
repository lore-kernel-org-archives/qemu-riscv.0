Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhXR-0004hw-Jq
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxG-0007IB-Ny
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:35 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxC-0007u3-1I
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301730; x=1661837730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1Q1eyaUKg34qe5BkhYmnC+g3xItY5QViYtDFWipPLs=;
 b=Ib04mmr/r5MbpVVY7UMaPQRRKey2zd8tqgeZHBAcJHC/pcBlhPUFcpWh
 sJ+d2BnO5ZJAGCcTxnWIl79V10pgq4QMYmNHWh1n0OmlVNkKCoRjD7BzB
 QB279ZTK/SAB8gjSGZop+ZtZ3ed+II2ALkDQJjYSV+96kckqyDJnosUww
 y3pMqJPbdf8fFfr9hqID80sFtuT56k2s/1/G9YNO5arkf265TfYg+a25o
 g4270AF9+yRw77exOADNHNWa2XEymwljcz78ZDFb8ZO9cOsSXq2/c3gCD
 8vh8nDTK4mFvPmCx9IfTxKuVn4FuNEKnguA7X6ddxathzhuzimt/0tLLC w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="290336900"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:35:02 +0800
IronPort-SDR: 6syKXhbE8zrRDHslYfPQXJlMunqjPDO57fWR9jul6HCIAFDXgNijI8yGieP0KoeY3lQL9OIcpG
 9FIJw/09M0/dJYfqLL4eFKVIu+Gc3KtolFpSkp3mkHVAqkB6hT58HICbxkGVaZGHIKv/wwjfp4
 U1hR4OMA+y9AL5HAtdxgJuJvSz0ZOksQ2tcZgmB1RZ7fHMS/WVmTpieQKES+MMjotxszpgJZqc
 1QluIkCZxxsQBxEdoMShuXWe/+pAS8gy5NFwnQVGB7I6qdzFU2TKmIftMta5tNHX5VzUiK+M68
 32PDQsx7PMuBMBeJ0HWWEPkO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:11:51 -0700
IronPort-SDR: Rb6To1eD0oXQ2yD3PDRA4XBZ++8AxMl5B+kGUf00cQzjevVBMBJQzr7tOCFcqGJule/c6IdwkL
 tU0FKQYdy4/28OewT85nR+sItQese+0S1S0ZYDrtRocM41klmy7TOLMdxrXBZ0dbhUIwPSWRQc
 BUqayIRLoTEj79i8pT5R0RIg9mk3CgLjdrGR06kAFCVJrvy2ZdCE/HE1Ry22fWzvGSsTzRh0Zq
 5P/LyeSpCDdqwDUicL3e+2JVR3uPTILg158b/+4OBq5FaH6LbVMWgchFJu6EVScL+9m9+sZzhv
 Ut8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:35:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfCm0yPLz1RvlZ
 for <qemu-riscv@nongnu.org>; Sun, 29 Aug 2021 22:35:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630301699; x=1632893700; bh=V1Q1eya
 UKg34qe5BkhYmnC+g3xItY5QViYtDFWipPLs=; b=Wb8qZSxTqqB1hKounZp8A/j
 VfMEd5R6dF2Ie4OeS7O1hxHS9cxIyn24HiMXFKJLWD14rk996XLF2sgwFYXNpBBv
 1M4MxlpEcSe1zULJlriyCAzv+K+D1BaiGr+1LOWnUjR9L5d6zjfOUSrzBhy3JBLP
 4Qh2u1YRe56EaGCsWoRESmZ8C9yx3zDuiBbjxOE04ZYMc9FY/ZARQVlR8sg0/E5T
 5cK2kKjLC2glcoPco09H84dLSdnpL53nV/M7YfZP2Wmh8FGtAaD+IjHaGZmMIHUN
 ey78fG7E304vy9Hgb2U4sgi7HcUzb1NTN/9hHPPBO1QM9xObqqrHNs2xeIz9D9Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GsAJY-eGMBrm for <qemu-riscv@nongnu.org>;
 Sun, 29 Aug 2021 22:34:59 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfCg3FPRz1Rvl9;
 Sun, 29 Aug 2021 22:34:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Mon, 30 Aug 2021 15:34:49 +1000
Message-Id: <0a76946981852f5bd15f0c37ab35b253371027a8.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 30 Aug 2021 05:35:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/ibex_plic.h |  2 ++
 hw/intc/ibex_plic.c         | 17 ++++++-----------
 hw/riscv/opentitan.c        |  8 ++++++++
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 7fc495db99..d596436e06 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -60,6 +60,8 @@ struct IbexPlicState {
     uint32_t threshold_base;
=20
     uint32_t claim_base;
+
+    qemu_irq *external_irqs;
 };
=20
 #endif /* HW_IBEX_PLIC_H */
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index edf76e4f61..ff430356f8 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -27,6 +27,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "target/riscv/cpu.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/irq.h"
=20
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -92,19 +93,10 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, =
uint32_t context)
=20
 static void ibex_plic_update(IbexPlicState *s)
 {
-    CPUState *cpu;
-    int level, i;
+    int i;
=20
     for (i =3D 0; i < s->num_cpus; i++) {
-        cpu =3D qemu_get_cpu(i);
-
-        if (!cpu) {
-            continue;
-        }
-
-        level =3D ibex_plic_irqs_pending(s, 0);
-
-        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(leve=
l));
+        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
     }
 }
=20
@@ -268,6 +260,9 @@ static void ibex_plic_realize(DeviceState *dev, Error=
 **errp)
=20
     qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
=20
+    s->external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_cpus);
+    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
+
     /*
      * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 36a41c8b5b..048aced0ec 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -118,6 +118,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     MachineState *ms =3D MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem =3D get_system_memory();
+    int i;
=20
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
@@ -149,6 +150,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].b=
ase);
=20
+    for (i =3D 0; i < ms->smp.cpus; i++) {
+        CPUState *cpu =3D qemu_get_cpu(i);
+
+        qdev_connect_gpio_out(DEVICE(&s->plic), i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     /* UART */
     qdev_prop_set_chr(DEVICE(&(s->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
--=20
2.31.1


