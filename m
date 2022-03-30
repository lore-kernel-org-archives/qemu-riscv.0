Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXsv-0007FR-P0
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXse-0006oU-Az; Wed, 30 Mar 2022 08:56:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0004Zb-9m; Wed, 30 Mar 2022 08:56:54 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 10E1621EBF;
 Wed, 30 Mar 2022 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuMqYjKLUiOJpMyaEYbHpLc1NjYNYXkz7u4Bj2qu9+0=;
 b=AF5vgjPKJfLfOCE8JJV0wIHVMssFOH9O+283ap/NOqh3nvzncFwiViz4w2H1j70ovAdUCk
 H6zETNsRK3hmb/k2LH1knxYvkM2faq77tkaDrymyqd8xr8xTI/GixhEENC+/1AMd/14Bwa
 srv/dw8yRP2afosiJbf2Wx2P+i7a9us=
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
Subject: [RFC PATCH 06/18] hw/cpu/cluster: remove cluster_id now that gdbstub
 is updated
Date: Wed, 30 Mar 2022 14:56:27 +0200
Message-Id: <20220330125639.201937-7-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:01 -0000

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cluster.h | 7 -------
 hw/cpu/cluster.c         | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 2125765f21..6704434cc0 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -60,17 +60,10 @@ OBJECT_DECLARE_TYPE(CPUClusterState, CPUClusterClass, CPU_CLUSTER)
 
 /**
  * CPUClusterState:
- * @cluster_id: The cluster ID. This value is for internal use only and should
- *   not be exposed directly to the user or to the guest.
- *
- * State of a CPU cluster.
  */
 struct CPUClusterState {
     /*< private >*/
     CpusState parent_obj;
-
-    /*< public >*/
-    uint32_t cluster_id;
 };
 
 /**
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 3daf897bd9..51da6ce3a9 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -42,7 +42,6 @@ static int add_cpu_to_cluster(Object *obj, void *opaque)
 static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 {
     CPUClusterClass *ccc = CPU_CLUSTER_GET_CLASS(dev);
-    CPUClusterState *cluster = CPU_CLUSTER(dev);
     CpusState *base = CPUS(dev);
     Object *cluster_obj = OBJECT(dev);
 
@@ -64,12 +63,6 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 
     /* realize base class (will set cluster field to true) */
     ccc->parent_realize(dev, errp);
-
-    /*
-     * Temporarily copy the cluster id from the base class as
-     * gdbstub still uses our field.
-     */
-    cluster->cluster_id = base->cluster_index;
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
-- 
2.35.1


