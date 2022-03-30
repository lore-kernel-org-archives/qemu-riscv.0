Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXsu-0007AX-79
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsf-0006oo-Ui; Wed, 30 Mar 2022 08:56:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0004Zd-HK; Wed, 30 Mar 2022 08:56:55 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6340A21EBE;
 Wed, 30 Mar 2022 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNtuXMP17Wp2ohzLpSDIDcwKal0f30KwuZn+3sGkw34=;
 b=j7cNcWesJw3SwK0OSEqzP8OfWQAuxuBd6W2/1/Rk8xGxye2b2yaVZOjCHsEoQ9z14lCWkB
 ynCy4HfV+8QFG6eAcNDaxePQUM0s95UNZBsnx0cz9DugP8X9z5/a2rHAPSToM8/Y9j5C2F
 Gzvgk3pyIhXFdTmKyq7mevp125SKAiE=
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
Subject: [RFC PATCH 05/18] gdbstub: deal with _cpus_ object instead of
 _cpu-cluster_
Date: Wed, 30 Mar 2022 14:56:26 +0200
Message-Id: <20220330125639.201937-6-damien.hedde@greensocs.com>
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

The gdbstub will only handle _cpus_ object having set
the _is_cluster_ flag.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 gdbstub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c8375e3c3f..0b3e943f95 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -38,7 +38,7 @@
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "hw/cpu/cluster.h"
+#include "hw/cpu/cpus.h"
 #include "hw/boards.h"
 #endif
 
@@ -3458,9 +3458,10 @@ static const TypeInfo char_gdb_type_info = {
 
 static int find_cpu_clusters(Object *child, void *opaque)
 {
-    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
+    if (object_dynamic_cast(child, TYPE_CPUS) &&
+        CPUS(child)->is_cluster) {
         GDBState *s = (GDBState *) opaque;
-        CPUClusterState *cluster = CPU_CLUSTER(child);
+        CpusState *cluster = CPUS(child);
         GDBProcess *process;
 
         s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
@@ -3472,8 +3473,9 @@ static int find_cpu_clusters(Object *child, void *opaque)
          * runtime, we enforce here that the machine does not use a cluster ID
          * that would lead to PID 0.
          */
-        assert(cluster->cluster_id != UINT32_MAX);
-        process->pid = cluster->cluster_id + 1;
+        assert(cluster->cluster_index >= 0 &&
+               cluster->cluster_index < UINT32_MAX);
+        process->pid = cluster->cluster_index + 1;
         process->attached = false;
         process->target_xml[0] = '\0';
 
-- 
2.35.1


