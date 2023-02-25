Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVoB5-0000aD-Oq
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 01:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoB3-0000ZS-A2
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 01:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoB1-0002p7-ED
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 01:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677307017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=im5MfZrU7VEKWZZ6mGaa4iIiUAnrTabqSTa+gFdJEKs=;
 b=bUb+CGZpfI80IfuXM3ZkiK5kZvu5p7b5PmTIrX8jo9yqeDaWO7lLHltQq6vPGqANB7RCJE
 cS80KrgXPzvD/8ZBD/IPZqJ+uxTYOuA6+rDcLNfxZi9ikOIzCHDRQh2Dr4d6LPwObTidS9
 GJ2L1kXm/fvZJVgniIuhYF4z1mxZqJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-n2cGx3XHMVy1hFP6hI6Ksw-1; Sat, 25 Feb 2023 01:36:54 -0500
X-MC-Unique: n2cGx3XHMVy1hFP6hI6Ksw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B0E6800B23;
 Sat, 25 Feb 2023 06:36:53 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE77440C1423;
 Sat, 25 Feb 2023 06:36:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
Subject: [PATCH v3 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64 and
 riscv machines
Date: Sat, 25 Feb 2023 14:35:24 +0800
Message-Id: <20230225063527.281479-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 06:37:02 -0000

For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
used to populate the CPU topology in the Linux guest. It's required that
the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
scheduling domain can't be sorted out, as the following warning message
indicates. To avoid the unexpected confusion, this series attempts to
warn about such kind of irregular configurations.

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

PATCH[1] Warn about the irregular configuration if required
PATCH[2] Enable the validation for aarch64 machines
PATCH[3] Enable the validation for riscv machines

v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html

Changelog
=========
v3:
  * Validate cluster-to-NUMA instead of socket-to-NUMA
    boundary                                                  (Gavin)
  * Move the switch from MachineState to MachineClass         (Philippe)
  * Warning instead of rejecting the irregular configuration  (Daniel)
  * Comments to mention cluster-to-NUMA is platform instead
    of architectural choice                                   (Drew)
  * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
v2:
  * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
  * Add helper set_numa_socket_boundary() and validate the
    boundary in the generic path                              (Philippe)

Gavin Shan (3):
  numa: Validate cluster and NUMA node boundary if required
  hw/arm: Validate cluster and NUMA node boundary
  hw/riscv: Validate cluster and NUMA node boundary

 hw/arm/sbsa-ref.c   |  2 ++
 hw/arm/virt.c       |  2 ++
 hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/riscv/spike.c    |  2 ++
 hw/riscv/virt.c     |  2 ++
 include/hw/boards.h |  1 +
 6 files changed, 51 insertions(+)

-- 
2.23.0


