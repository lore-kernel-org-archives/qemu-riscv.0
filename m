Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufPs-0000lb-Bm
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58381)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPc-0000L5-4y
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPa-0002qx-IV
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:40 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPX-0002nv-Iv; Mon, 05 Aug 2019 12:00:35 -0400
Received: by mail-pg1-x543.google.com with SMTP id i18so39970963pgl.11;
 Mon, 05 Aug 2019 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=vTD8M9wppJezp9LLzOhrPhOTQtWHw81iTrD7f5DjnVc=;
 b=kNacqSEorUsDvOoY0xiWE5hjW/T/XHaj2UBQx9y4vWQ6YxMTOQEjxhiXB3875sUWdS
 6hfzHhLr1Ag/yJjQLjI/S1hxWlHklanpu0O7ruVVEfvbQmLwrW5GYIJzbLnQigaPKjHC
 qph5RZN/KutWvcWp5cZMTcFBCaL6ax72g76gn4meoNcl7A4S92A/Z06xoMn/Mhc9t5p2
 7rUSXA18/ZICQTZuPjKRCdJAursHuP5bMJu5A9mCSOJ8MBv+DAXD2FQ7712etxE6tJLT
 dhIBcLlBFmZCYdyzdSqtjY8lnM1Zbh6aH2dL8lC19bkLEcb2jK+1mbsxTPm/qJ9KzQSs
 QFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=vTD8M9wppJezp9LLzOhrPhOTQtWHw81iTrD7f5DjnVc=;
 b=WFJQWJmU8vDAn9Nyqoxnoq4zmnMYSaFZkHywr3sFrtqIxQXKty34XJq3W4galDaSIv
 gnXzREbKhajxi4j6uqOAgGOMjRR7cQYflXM+7A+WsX93oqNVpiZff3XfPabiE3R63AWl
 Wtp80MsLn2Ljd1xDGvIwdPSQrdiY2+dhhltEb0erAxAUlQJr6Id9LxcCOYdyfDyvjUb8
 fUHqGO//tqbHzarbDpswU0C8El2Vo4Z4jfas4py37lzqO9HSJCjCtqSVY6VAmwUSc22/
 fY1fn7bgwPCHCPcJxhjdIMzsPw3/OvLO3b3qjaCQ/I0Ka1aRCSRl/Ta3bSOkp35yBmzI
 a4SA==
X-Gm-Message-State: APjAAAUStMHrMGbXuCQiywsQWp7AJDmesSf7bAzBNToftvnJWliB94qa
 BonyO5PeKWzxiDpvZu/a+bc=
X-Google-Smtp-Source: APXvYqxBBsaCq0P44EjK54oVHrv6JtkWu5iSRO4/leCLipV3MLrvYALNqGcwGA6EO7ebeRPuv8PX3Q==
X-Received: by 2002:a62:82c2:: with SMTP id
 w185mr76486250pfd.202.1565020834689; 
 Mon, 05 Aug 2019 09:00:34 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.33
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:01 -0700
Message-Id: <1565020823-24223-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH 06/28] riscv: sifive_u: Update hart
 configuration to reflect the real FU540 SoC
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
X-List-Received-Date: Mon, 05 Aug 2019 16:00:42 -0000

The FU540-C000 includes a 64-bit E51 RISC-V core and four 64-bit U54
RISC-V cores. Currently the sifive_u machine only populates 4 U54
cores. Update the max cpu number to 5 to reflect the real hardware,
and pass "cpu-type" to populate heterogeneous harts.

The cpu nodes in the generated DTS have been updated as well.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 623ee64..08d406f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,7 +10,7 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  *
- * This board currently uses a hardcoded devicetree that indicates one hart.
+ * This board currently uses a hardcoded devicetree that indicates five harts.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -117,7 +118,10 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_add_subnode(fdt, nodename);
         qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
                               SIFIVE_U_CLOCK_FREQ);
-        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+        /* cpu 0 is the management hart that does not have mmu */
+        if (cpu != 0) {
+            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+        }
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
@@ -157,15 +161,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(nodename);
 
     plic_phandle = phandle++;
-    cells =  g_new0(uint32_t, s->soc.cpus.num_harts * 4);
+    cells =  g_new0(uint32_t, s->soc.cpus.num_harts * 4 - 2);
     for (cpu = 0; cpu < s->soc.cpus.num_harts; cpu++) {
         nodename =
             g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
-        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
-        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
+        /* cpu 0 is the management hart that does not have S-mode */
+        if (cpu == 0) {
+            cells[0] = cpu_to_be32(intc_phandle);
+            cells[1] = cpu_to_be32(IRQ_M_EXT);
+        } else {
+            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandle);
+            cells[cpu * 4 - 1] = cpu_to_be32(IRQ_M_EXT);
+            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
+            cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
+        }
         g_free(nodename);
     }
     nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
@@ -315,10 +325,16 @@ static void riscv_sifive_u_soc_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(obj);
+    char cpu_type[64];
+
+    /* create cpu type representing SiFive FU540 SoC */
+    pstrcpy(cpu_type, sizeof(cpu_type), SIFIVE_E_CPU);
+    pstrcat(cpu_type, sizeof(cpu_type), ",");
+    pstrcat(cpu_type, sizeof(cpu_type), SIFIVE_U_CPU);
 
     object_initialize_child(obj, "cpus", &s->cpus, sizeof(s->cpus),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->cpus), SIFIVE_U_CPU, "cpu-type",
+    object_property_set_str(OBJECT(&s->cpus), cpu_type, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
                             &error_abort);
@@ -407,10 +423,11 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
 {
     mc->desc = "RISC-V Board compatible with SiFive U SDK";
     mc->init = riscv_sifive_u_init;
-    /* The real hardware has 5 CPUs, but one of them is a small embedded power
+    /*
+     * The real hardware has 5 CPUs, but one of them is a small embedded power
      * management CPU.
      */
-    mc->max_cpus = 4;
+    mc->max_cpus = 5;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-- 
2.7.4


