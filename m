Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0DvB-0006CU-SM
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 20:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1l0Dv1-0006AQ-1M; Thu, 14 Jan 2021 20:28:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1l0Dus-00029G-RO; Thu, 14 Jan 2021 20:28:50 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DH3Sx5PQmz7VHQ;
 Fri, 15 Jan 2021 09:27:29 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 09:28:22 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <drjones@redhat.com>, <fanliang@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <dengkai1@huawei.com>,
 <limingwang@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH v3 0/1] target-riscv: support QMP dump-guest-memory
Date: Fri, 15 Jan 2021 09:28:18 +0800
Message-ID: <20210115012819.2053-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=jiangyifei@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 15 Jan 2021 01:28:53 -0000

Hi,
This patch supports QMP dump-guest-memory in RISC-V. We tested this
feature by using following command: dump-guest-memory guest.memory.

Then we used the gdb tool to debug guest.memory: gdb vmlinux guest.memory.
The test result is as follow:
1. info registers
ra             0xffffffe0008cb83c	0xffffffe0008cb83c <_raw_spin_lock_irqsave+28>
sp             0xffffffe0012c3f70	0xffffffe0012c3f70
gp             0xffffffe0010d6048	0xffffffe0010d6048 <__compound_literal.109>
tp             0xffffffe00127f200	0xffffffe00127f200
t0             0x1f8	504
t1             0x0	0
t2             0x3fd9bf5c3c	274236136508
fp             0xffffffe0012c3f80	0xffffffe0012c3f80
s1             0xffffffe0010d7228	-137421295064
a0             0x1	1
a1             0xffffffe00127f200	-137419558400
a2             0xffffffe00110a0b8	-137421086536
a3             0x3af32000	989011968
a4             0x35b2	13746
a5             0xffffffe03af6b880	-136449705856
a6             0x1c5d09af00	121820000000
a7             0x54494d45	1414090053
s2             0x1	1
s3             0xffffffe0010d73f0	-137421294608
s4             0x0	0
s5             0x0	0
s6             0x0	0
s7             0xc	12
s8             0x2000	8192
s9             0x80015708	2147571464
s10            0x0	0
s11            0x0	0
t3             0x2257d71	36011377
t4             0x0	0
t5             0x3ab0030	61538352
t6             0x3fffefb3a0	274876838816
pc             0xffffffe000201478	0xffffffe000201478 <arch_cpu_idle+10>

2. x/1024ux 0x80000000
0x80000000:	0x00050433	0x000584b3	0x00060933	0x62c000ef
0x80000010:	0x00050833	0x00040533	0x000485b3	0x00090633
0x80000020:	0x046358fd	0x1d630118	0x08171305	0x08130000
0x80000030:	0x48854868	0x0118282f	0x12081463	0x00000297
0x80000040:	0x48428293	0x00000317	0xfbc30313	0x0062b023
...

Changes since v2
1. Add build-bugs.

Changes since v1
1. Fix the build failure for RISC-V linux user.

Yifei Jiang (1):
  target-riscv: support QMP dump-guest-memory

 target/riscv/arch_dump.c | 202 +++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c       |   2 +
 target/riscv/cpu.h       |   4 +
 target/riscv/cpu_bits.h  |   1 +
 target/riscv/meson.build |   1 +
 5 files changed, 210 insertions(+)
 create mode 100644 target/riscv/arch_dump.c

-- 
2.19.1


