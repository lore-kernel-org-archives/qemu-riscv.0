Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXst-00079d-O9
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0006mC-1G; Wed, 30 Mar 2022 08:56:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsY-0004Yk-A9; Wed, 30 Mar 2022 08:56:52 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id CE63B21C73;
 Wed, 30 Mar 2022 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCPBp1rxd0BRI6uj/DUHFvNtQuIDUwFbXBbxFs483vY=;
 b=nKJcCtPaxEONZtKtaky16eXmfZBjJCFDMEzhFmw+sBkyt89HEW5sszhygVqDI71jsnF0N2
 YxfX9oolBJ6A4PgC2KXPv6zotxOAM3xZOrQ5vuTK/8bt/1UrBAeb7mCVDoNVxEUTt8iMGd
 g3TsB122VzbFlEAjD+Ezgc+DxC7mJH4=
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
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH 04/18] hw/cpu/cluster: make _cpu-cluster_ a subclass of
 _cpus_
Date: Wed, 30 Mar 2022 14:56:25 +0200
Message-Id: <20220330125639.201937-5-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:56:59 -0000

Drop the cluster-id property as base class defines one.
cluster_id field is temporarily kept until gdbstub
is updated.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cluster.h | 17 ++++++++++--
 hw/cpu/cluster.c         | 58 +++++++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 09a2b86832..2125765f21 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "qom/object.h"
+#include "hw/cpu/cpus.h"
 
 /*
  * CPU Cluster type
@@ -55,7 +56,7 @@
  */
 
 #define TYPE_CPU_CLUSTER "cpu-cluster"
-OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
+OBJECT_DECLARE_TYPE(CPUClusterState, CPUClusterClass, CPU_CLUSTER)
 
 /**
  * CPUClusterState:
@@ -66,10 +67,22 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
  */
 struct CPUClusterState {
     /*< private >*/
-    DeviceState parent_obj;
+    CpusState parent_obj;
 
     /*< public >*/
     uint32_t cluster_id;
 };
 
+/**
+ * CPUClusterClass:
+ * @parent_realize: to store base class realize method
+ */
+struct CPUClusterClass {
+    /*< private >*/
+    CpusClass parent_class;
+
+    /*< public >*/
+    DeviceRealize parent_realize;
+};
+
 #endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index e444b7c29d..3daf897bd9 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -20,50 +20,39 @@
 
 #include "qemu/osdep.h"
 #include "hw/cpu/cluster.h"
+#include "hw/cpu/cpus.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 
-static Property cpu_cluster_properties[] = {
-    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
-    DEFINE_PROP_END_OF_LIST()
-};
-
-typedef struct CallbackData {
-    CPUClusterState *cluster;
-    int cpu_count;
-} CallbackData;
-
 static int add_cpu_to_cluster(Object *obj, void *opaque)
 {
-    CallbackData *cbdata = opaque;
+    CpusState *base = CPUS(opaque);
     CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
 
     if (cpu) {
-        cpu->cluster_index = cbdata->cluster->cluster_id;
-        cbdata->cpu_count++;
+        cpu->cluster_index = base->cluster_index;
+        base->topology.cpus++;
     }
     return 0;
 }
 
 static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 {
-    /* Iterate through all our CPU children and set their cluster_index */
+    CPUClusterClass *ccc = CPU_CLUSTER_GET_CLASS(dev);
     CPUClusterState *cluster = CPU_CLUSTER(dev);
+    CpusState *base = CPUS(dev);
     Object *cluster_obj = OBJECT(dev);
-    CallbackData cbdata = {
-        .cluster = cluster,
-        .cpu_count = 0,
-    };
 
-    if (cluster->cluster_id >= MAX_CLUSTERS) {
-        error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
-        return;
-    }
+    /* This is a special legacy case */
+    assert(base->topology.cpus == 0);
+    assert(base->cpu_type == NULL);
+    assert(base->is_cluster);
 
-    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, &cbdata);
+    /* Iterate through all our CPU children and set their cluster_index */
+    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, base);
 
     /*
      * A cluster with no CPUs is a bug in the board/SoC code that created it;
@@ -71,24 +60,39 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
      * created the CPUs and parented them into the cluster object before
      * realizing the cluster object.
      */
-    assert(cbdata.cpu_count > 0);
+    assert(base->topology.cpus > 0);
+
+    /* realize base class (will set cluster field to true) */
+    ccc->parent_realize(dev, errp);
+
+    /*
+     * Temporarily copy the cluster id from the base class as
+     * gdbstub still uses our field.
+     */
+    cluster->cluster_id = base->cluster_index;
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CPUClusterClass *ccc = CPU_CLUSTER_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
 
-    device_class_set_props(dc, cpu_cluster_properties);
-    dc->realize = cpu_cluster_realize;
+    device_class_set_parent_realize(dc, cpu_cluster_realize,
+                                    &ccc->parent_realize);
 
     /* This is not directly for users, CPU children must be attached by code */
     dc->user_creatable = false;
+
+    /* Cpus are created by external code */
+    cc->skip_cpus_creation = true;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
     .name = TYPE_CPU_CLUSTER,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPUS,
     .instance_size = sizeof(CPUClusterState),
+    .class_size = sizeof(CPUClusterClass),
     .class_init = cpu_cluster_class_init,
 };
 
-- 
2.35.1


