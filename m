Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV6kW-0003Z5-M2
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 03:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kV-0003Yl-Im
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kT-0001FY-Rw
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g92Td8QRvrVk+sq1KWvUB3XXi6JuTsKzLd866Am/PBk=;
 b=Qsuc8gjVoezNiwwpPQcZEv0WEl/fOZRPNFBUf0mnplykjTCaxTaKDPpjN+NHHvh9YK0qMu
 tpVNibvpqkJ7TZsBrkEVXomXqBBAwYi1uPXwDCREZQXZWUCGVIZTt43I2Q0P1x6RqeksNl
 OoIvcAk60oUxuEOSsi/HAtExyYYFrKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-11eOUpCuMGidHF106ejm6g-1; Thu, 23 Feb 2023 03:14:37 -0500
X-MC-Unique: 11eOUpCuMGidHF106ejm6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1298101A521;
 Thu, 23 Feb 2023 08:14:35 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96CF118EC1;
 Thu, 23 Feb 2023 08:14:28 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 2/4] numa: Validate socket and NUMA node boundary if
 required
Date: Thu, 23 Feb 2023 16:13:59 +0800
Message-Id: <20230223081401.248835-3-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 08:14:43 -0000

For some architectures like ARM64, multiple CPUs in one socket can't be
associated with different NUMA nodes. Otherwise, the guest kernel is confused
about the CPU topology. For example, the following warning message is observed
from linux guest with the below command lines.

  -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
  -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
  -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
  -numa node,nodeid=2,cpus=4-5,memdev=ram2                \

  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
  pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : build_sched_domains+0x284/0x910
  lr : build_sched_domains+0x184/0x910
  sp : ffff80000804bd50
  x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
  x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
  x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
  x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
  x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
  x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
  x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
  x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
  x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
  x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
  Call trace:
   build_sched_domains+0x284/0x910
   sched_init_domains+0xac/0xe0
   sched_init_smp+0x48/0xc8
   kernel_init_freeable+0x140/0x1ac
   kernel_init+0x28/0x140
   ret_from_fork+0x10/0x20

Improve the sitation to reject the configuration where multiple CPUs
in one socket have been associated with different NUMA nodes. The
newly introduced helper set_numa_socket_boundary() is expected to
called by specific machines (boards) where the boundary is required.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c     | 34 ++++++++++++++++++++++++++++++++++
 hw/core/numa.c        |  7 +++++++
 include/sysemu/numa.h |  4 ++++
 3 files changed, 45 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f73fc4c45c..875a3fe6c4 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1174,6 +1174,36 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     return g_string_free(s, false);
 }
 
+static void numa_validate_socket_boundary(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    NumaState *state = ms->numa_state;
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+    const CPUArchId *cpus = possible_cpus->cpus;
+    int len = possible_cpus->len, i, j;
+
+    if (state->num_nodes <= 1 || len <= 1) {
+        return;
+    }
+
+    for (i = 0; i < len; i++) {
+        for (j = i + 1; j < len; j++) {
+            if (cpus[i].props.has_socket_id &&
+                cpus[i].props.has_node_id &&
+                cpus[j].props.has_socket_id &&
+                cpus[j].props.has_node_id &&
+                cpus[i].props.socket_id == cpus[j].props.socket_id &&
+                cpus[i].props.node_id != cpus[j].props.node_id) {
+                error_report("CPU-%d and CPU-%d in socket-%ld have been "
+                             "associated with node-%ld and node-%ld "
+                             "respectively", i, j, cpus[i].props.socket_id,
+                             cpus[i].props.node_id, cpus[j].props.node_id);
+                exit(1);
+            }
+        }
+    }
+}
+
 static void numa_validate_initiator(NumaState *numa_state)
 {
     int i;
@@ -1239,6 +1269,10 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
         }
     }
 
+    if (machine->numa_state->have_socket_boundary) {
+        numa_validate_socket_boundary(machine);
+    }
+
     if (machine->numa_state->hmat_enabled) {
         numa_validate_initiator(machine->numa_state);
     }
diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..ebdd964ec8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -460,6 +460,13 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
     ms->numa_state->hmat_cache[node->node_id][node->level] = hmat_cache;
 }
 
+void set_numa_socket_boundary(MachineState *ms)
+{
+    if (ms->numa_state) {
+        ms->numa_state->have_socket_boundary = true;
+    }
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     if (!ms->numa_state) {
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 4173ef2afa..160008fff4 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -86,6 +86,9 @@ struct NumaState {
     /* Detect if HMAT support is enabled. */
     bool hmat_enabled;
 
+    /* CPUs in one socket can't break socket boundary */
+    bool have_socket_boundary;
+
     /* NUMA nodes information */
     NodeInfo nodes[MAX_NODES];
 
@@ -97,6 +100,7 @@ struct NumaState {
 };
 typedef struct NumaState NumaState;
 
+void set_numa_socket_boundary(MachineState *ms);
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
-- 
2.23.0


