Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXsr-00070U-Po
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0006mE-4z; Wed, 30 Mar 2022 08:56:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsY-0004Yc-1j; Wed, 30 Mar 2022 08:56:52 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C78A021EBD;
 Wed, 30 Mar 2022 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qMcRfqsf2VMb4SH2mPd35TAbTZeVEgiMZ9x1BDL3IQ=;
 b=b6/5z9hthw543VWfCfDIavYU8c9uDHVEQsj+PxanIuFw9EZeRkI5paMMv54AMfpTiioBHr
 c1fqUuitSBI88gDJuS51wgLQOi3+3hJcv/1cBHlWhV7+MLaSkkiFttZ+pRssQQCGvihYGH
 qzR6xwdsnqq/C62A91DWuQ6yMObSXSE=
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
Subject: [RFC PATCH 03/18] hw/cpu/cpus: prepare to handle cpu clusters
Date: Wed, 30 Mar 2022 14:56:24 +0200
Message-Id: <20220330125639.201937-4-damien.hedde@greensocs.com>
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

Some group of cpus need to form a cpu cluster to be exposed
in gdb as inferiors.

Note: 'is_cluster' field is required at least to
transition the riscv_hart_array (see following commits about that)

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cpus.h | 19 +++++++++++++
 hw/cpu/cpus.c         | 65 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
index c65f568ef8..295d7537e2 100644
--- a/include/hw/cpu/cpus.h
+++ b/include/hw/cpu/cpus.h
@@ -24,6 +24,10 @@
  * This is an abstract class, subclasses are supposed to be created on
  * per-architecture basis to handle the specifics of the cpu architecture.
  * Subclasses are meant to be user-creatable (for cold-plug).
+ *
+ * Optionnaly a group of cpus may correspond to a cpu cluster and be
+ * exposed as a gdbstub's inferior. In that case cpus must have the
+ * same memory view.
  */
 
 #define TYPE_CPUS "cpus"
@@ -37,10 +41,18 @@ OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
  *      order to eventually update this smoothly with a full
  *      CpuTopology structure in the future.
  * @cpus: Array of pointer to cpu objects.
+ * @cluster_node: node in the global cluster list.
+ * @is_cluster: true if the object corresponds to a cpu cluster. It can be
+ *      written before realize in order to enable/disable clustering.
+ * @cluster_index: The cluster ID. This value is for internal use only and
+ *      should not be exposed directly to the user or to the guest.
  */
 struct CpusState {
     /*< private >*/
     DeviceState parent_obj;
+    bool is_cluster;
+    int32_t cluster_index;
+    QLIST_ENTRY(CpusState) cluster_node;
 
     /*< public >*/
     char *cpu_type;
@@ -68,4 +80,11 @@ struct CpusClass {
     bool skip_cpus_creation;
 };
 
+/**
+ * cpus_disable_clustering:
+ * Disable clustering for this object.
+ * Has to be called before realize step.
+ */
+void cpus_disable_clustering(CpusState *s);
+
 #endif /* HW_CPU_CPUS_H */
diff --git a/hw/cpu/cpus.c b/hw/cpu/cpus.c
index 5fad1de2c7..ed9402c100 100644
--- a/hw/cpu/cpus.c
+++ b/hw/cpu/cpus.c
@@ -16,9 +16,17 @@
 #include "hw/resettable.h"
 #include "sysemu/reset.h"
 
+static QLIST_HEAD(, CpusState) clusters =
+    QLIST_HEAD_INITIALIZER(clusters);
+
 static Property cpus_properties[] = {
     DEFINE_PROP_STRING("cpu-type", CpusState, cpu_type),
     DEFINE_PROP_UINT16("num-cpus", CpusState, topology.cpus, 0),
+    /*
+     * Default behavior is to automatically compute a valid index.
+     * FIXME: remove this property to keep it internal ?
+     */
+    DEFINE_PROP_INT32("cluster-id", CpusState, cluster_index, -1),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -30,6 +38,20 @@ static void cpus_reset(Object *obj)
     }
 }
 
+static void cpus_init(Object *obj)
+{
+    CpusState *s = CPUS(obj);
+
+    /* may be overriden by subclasses or code to disable clustering */
+    s->is_cluster = true;
+}
+
+void cpus_disable_clustering(CpusState *s)
+{
+    assert(!DEVICE(s)->realized);
+    s->is_cluster = false;
+}
+
 static void cpus_create_cpus(CpusState *s, Error **errp)
 {
     Error *err = NULL;
@@ -44,6 +66,11 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
         object_property_add_child(OBJECT(s), "cpu[*]", OBJECT(cpu));
         object_unref(OBJECT(cpu));
 
+        /* set index in case of cluster */
+        if (s->is_cluster) {
+            cpu->cluster_index = s->cluster_index;
+        }
+
         /* let subclass configure the cpu */
         if (cgc->configure_cpu) {
             cgc->configure_cpu(s, cpu, i);
@@ -60,7 +87,7 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
 
 static void cpus_realize(DeviceState *dev, Error **errp)
 {
-    CpusState *s = CPUS(dev);
+    CpusState *item, *s = CPUS(dev);
     CpusClass *cgc = CPUS_GET_CLASS(s);
 
     /* if subclass defined a base type, let's check it */
@@ -77,6 +104,38 @@ static void cpus_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->is_cluster) {
+        if (s->cluster_index < 0) {
+            int32_t max = -1;
+            QLIST_FOREACH(item, &clusters, cluster_node) {
+                if (max < item->cluster_index) {
+                    max = item->cluster_index;
+                }
+            }
+            s->cluster_index = max + 1;
+        } else {
+            /*
+             * Check the index is not already taken.
+             */
+            QLIST_FOREACH(item, &clusters, cluster_node) {
+                if (s->cluster_index == item->cluster_index) {
+                    error_setg(errp, "cluster index %d already exists",
+                               s->cluster_index);
+                    return;
+                }
+            }
+        }
+
+        if (s->cluster_index >= MAX_CLUSTERS) {
+            error_setg(errp, "cluster index must be less than %d",
+                       MAX_CLUSTERS);
+            return;
+        }
+
+        /* Put the cpus in the inferior list */
+        QLIST_INSERT_HEAD(&clusters, s, cluster_node);
+    }
+
     /* create the cpus if needed */
     if (!cgc->skip_cpus_creation) {
         cpus_create_cpus(s, errp);
@@ -89,6 +148,9 @@ static void cpus_finalize(Object *obj)
     CpusState *s = CPUS(obj);
 
     g_free(s->cpus);
+
+    /* it may not be in the list */
+    QLIST_SAFE_REMOVE(s, cluster_node);
 }
 
 static void cpus_class_init(ObjectClass *klass, void *data)
@@ -114,6 +176,7 @@ static const TypeInfo cpus_type_info = {
     .parent            = TYPE_DEVICE,
     .abstract          = true,
     .instance_size     = sizeof(CpusState),
+    .instance_init     = cpus_init,
     .instance_finalize = cpus_finalize,
     .class_size        = sizeof(CpusClass),
     .class_init        = cpus_class_init,
-- 
2.35.1


