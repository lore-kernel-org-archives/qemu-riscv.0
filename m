Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXtC-0008BP-TJ
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtA-00082q-Cb; Wed, 30 Mar 2022 08:57:28 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXt8-0004aT-FO; Wed, 30 Mar 2022 08:57:28 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 25A9821EC7;
 Wed, 30 Mar 2022 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4+3Sun2+SPi9wRQB2rZD5KPE6zlGnALJn1V8tn0rq4=;
 b=DvJTNMEViJAwS71iQx3dGKols78k+d1tfMegwp42eAAjjIXQGCuZZWPR7qnTu+8Yd1K61O
 tyX2BfGR+Y1ZzyeJXgPf+KnPZQAxTOiZmL1yz9VbtPQE3CWrczlLRlBgTC9aZlg6CkRnd6
 H1a8Y3BkFL+ay2ZXgKh27whATAAqrTA=
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
Subject: [RFC PATCH 11/18] hw/riscv: prepare riscv_hart transition to cpus
Date: Wed, 30 Mar 2022 14:56:32 +0200
Message-Id: <20220330125639.201937-12-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:29 -0000

+ Use riscv_array_get_hart instead of accessing harts field.
+ Use riscv_hart_array_realize instead of sysbus_realize.

spike and virt machines will be handled separately in following
commits.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/boot.c            | 2 +-
 hw/riscv/microchip_pfsoc.c | 4 ++--
 hw/riscv/opentitan.c       | 2 +-
 hw/riscv/shakti_c.c        | 2 +-
 hw/riscv/sifive_e.c        | 2 +-
 hw/riscv/sifive_u.c        | 8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cae74fcbcd..b21c8f6488 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    return riscv_array_get_hart(harts, 0)->env.misa_mxl_max == MXL_RV32;
 }
 
 /*
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cafd1fc9ae..82547a53e6 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -190,8 +190,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     NICInfo *nd;
     int i;
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    riscv_hart_array_realize(&s->e_cpus, &error_abort);
+    riscv_hart_array_realize(&s->u_cpus, &error_abort);
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 833624d66c..2eb7454d8a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -135,7 +135,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    riscv_hart_array_realize(&s->cpus, &error_abort);
 
     /* Boot ROM */
     memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 90e2cf609f..93e0c8dd68 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -108,7 +108,7 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory = get_system_memory();
 
-    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
+    riscv_hart_array_realize(&sss->cpus, &error_abort);
 
     sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
         (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index dcb87b6cfd..25ba0a8c85 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    riscv_hart_array_realize(&s->cpus, &error_abort);
 
     /* Mask ROM */
     memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..c99e92a7eb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -188,9 +188,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
             }
-            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
+            isa = riscv_isa_string(riscv_array_get_hart(&s->soc.u_cpus, cpu - 1));
         } else {
-            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
+            isa = riscv_isa_string(riscv_array_get_hart(&s->soc.e_cpus, 0));
         }
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
@@ -830,8 +830,8 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    riscv_hart_array_realize(&s->e_cpus, &error_abort);
+    riscv_hart_array_realize(&s->u_cpus, &error_abort);
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
-- 
2.35.1


