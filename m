Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXtH-0008U6-PM
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtC-00089G-El; Wed, 30 Mar 2022 08:57:30 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtA-0004bO-Ef; Wed, 30 Mar 2022 08:57:30 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9E08721ED3;
 Wed, 30 Mar 2022 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8X72RRBxN8aWz3GWD2e/RMhrzISf6w4fW3q1EpbSkOI=;
 b=y0yyh+R1V8Qxaln8Efr03CkPIx9L6fXXRXd5afrwCTPdNRlNLEJGSKMjuAECXeeqs9ns5y
 p6yHFJB6sseMS9+WA2Yx8pgMb2D3i9jiQC7+WfV4fUaS9dCTfOLmFeKTqzls5DxklUWJsk
 ZQrk8QMLB2Fsl0x17Km5hR5WUJEy1V4=
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
Subject: [RFC PATCH 15/18] hw/riscv/sifive_u&microchip_pfsoc: apply
 riscv_hart_array update
Date: Wed, 30 Mar 2022 14:56:36 +0200
Message-Id: <20220330125639.201937-16-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:31 -0000

These machines were creating 2 explicit clusters of different cpus
(a cluster of 1 cpu and a cluster of N cpus). These are removed as
they are now embedded in the riscv array.

Note: The qom-path of the riscv hart arrays are changed, the cluster
level is removed:
+ "/path/to/e-cluster/e-cpus" to "/path/to/e-cpus"
+ "/path/to/u-cluster/u-cpus" to "/path/to/u-cpus"

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

If keeping the qom-paths is necessary we can add a container as
a replacement of the cluster.
---
 include/hw/riscv/microchip_pfsoc.h |  2 --
 include/hw/riscv/sifive_u.h        |  2 --
 hw/riscv/microchip_pfsoc.c         | 28 ++++++----------------------
 hw/riscv/sifive_u.c                | 27 ++++++---------------------
 4 files changed, 12 insertions(+), 47 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index a0673f5f59..9101c94978 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -35,8 +35,6 @@ typedef struct MicrochipPFSoCState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState e_cluster;
-    CPUClusterState u_cluster;
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8f63a183c4..5439e0d0c3 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -38,8 +38,6 @@ typedef struct SiFiveUSoCState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState e_cluster;
-    CPUClusterState u_cluster;
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82547a53e6..f4b1400ba5 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -133,23 +133,15 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
     MachineState *ms = MACHINE(qdev_get_machine());
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(obj);
 
-    object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
-
-    object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
-                            TYPE_RISCV_HART_ARRAY);
-    qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-harts", 1);
+    object_initialize_child(obj, "e-cpus", &s->e_cpus, TYPE_RISCV_HART_ARRAY);
+    qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-cpus", 1);
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(&s->e_cpus), "cpu-type",
                          TYPE_RISCV_CPU_SIFIVE_E51);
     qdev_prop_set_uint64(DEVICE(&s->e_cpus), "resetvec", RESET_VECTOR);
 
-    object_initialize_child(obj, "u-cluster", &s->u_cluster, TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
-
-    object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
-                            TYPE_RISCV_HART_ARRAY);
-    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
+    object_initialize_child(obj, "u-cpus", &s->u_cpus, TYPE_RISCV_HART_ARRAY);
+    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-cpus", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type",
                          TYPE_RISCV_CPU_SIFIVE_U54);
@@ -190,16 +182,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     NICInfo *nd;
     int i;
 
-    riscv_hart_array_realize(&s->e_cpus, &error_abort);
-    riscv_hart_array_realize(&s->u_cpus, &error_abort);
-    /*
-     * The cluster must be realized after the RISC-V hart array container,
-     * as the container's CPU object is only created on realize, and the
-     * CPU must exist and have been parented into the cluster before the
-     * cluster is realized.
-     */
-    qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
-    qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->e_cpus), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->u_cpus), NULL, &error_abort);
 
     /* Reserved Memory at address 0 */
     memory_region_init_ram(rsvd0_mem, NULL, "microchip.pfsoc.rsvd0_mem",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c99e92a7eb..1d9a7c5bf1 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -44,7 +44,6 @@
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
-#include "hw/cpu/cluster.h"
 #include "hw/misc/unimp.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -786,20 +785,14 @@ static void sifive_u_soc_instance_init(Object *obj)
 {
     SiFiveUSoCState *s = RISCV_U_SOC(obj);
 
-    object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
-
-    object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
+    object_initialize_child(obj, "e-cpus", &s->e_cpus,
                             TYPE_RISCV_HART_ARRAY);
-    qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-harts", 1);
+    qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-cpus", 1);
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(&s->e_cpus), "cpu-type", SIFIVE_E_CPU);
     qdev_prop_set_uint64(DEVICE(&s->e_cpus), "resetvec", 0x1004);
 
-    object_initialize_child(obj, "u-cluster", &s->u_cluster, TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
-
-    object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
+    object_initialize_child(obj, "u-cpus", &s->u_cpus,
                             TYPE_RISCV_HART_ARRAY);
 
     object_initialize_child(obj, "prci", &s->prci, TYPE_SIFIVE_U_PRCI);
@@ -825,21 +818,13 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     int i, j;
     NICInfo *nd = &nd_table[0];
 
-    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
+    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-cpus", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
 
-    riscv_hart_array_realize(&s->e_cpus, &error_abort);
-    riscv_hart_array_realize(&s->u_cpus, &error_abort);
-    /*
-     * The cluster must be realized after the RISC-V hart array container,
-     * as the container's CPU object is only created on realize, and the
-     * CPU must exist and have been parented into the cluster before the
-     * cluster is realized.
-     */
-    qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
-    qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->e_cpus), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->u_cpus), NULL, &error_abort);
 
     /* boot rom */
     memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
-- 
2.35.1


