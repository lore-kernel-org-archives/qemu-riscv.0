Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX16a-0000qp-RT
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 07:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kX16V-0000cj-Gi; Mon, 26 Oct 2020 07:55:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kX16P-0000hd-JO; Mon, 26 Oct 2020 07:55:59 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CKYFJ0y2nzkZZh;
 Mon, 26 Oct 2020 19:55:48 +0800 (CST)
Received: from huawei.com (10.174.186.209) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 19:55:33 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <richard.henderson@linaro.org>, <victor.zhangxiaofeng@huawei.com>,
 <wu.wubin@huawei.com>, <zhang.zhanghailiang@huawei.com>,
 <dengkai1@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH V4 0/6] Support RISC-V migration
Date: Mon, 26 Oct 2020 19:55:24 +0800
Message-ID: <20201026115530.304-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.209]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 07:55:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-List-Received-Date: Mon, 26 Oct 2020 11:56:00 -0000

This patches supported RISC-V migration based on tcg accel. And we have
verified related migration features such as snapshot and live migration.

A few weeks ago, we submitted RFC patches about supporting RISC-V migration
based on kvm accel: https://www.spinics.net/lists/kvm/msg223605.html.
And we found that tcg accelerated migration can be supported with a few
changes. Most of the devices have already implemented the migration
interface, so, to achieve the tcg accelerated migration, we just need to
add vmstate of both cpu and sifive_plic.

changes since v3
1. Apply Alistair's patch to exend get/set_field():
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg753575.html
2. Remake the patch: Merge m/vsstatus and m/vsstatush into one uint64_t
   unit.

Changes since v2:
1. Move vmstate_riscv_cpu declaration to internals.h.
2. Merge m/vsstatus and m/vsstatush into one uint64_t unit.

Changes since v1:
1. Add license head to target/riscv/machine.c.
2. Regenerate some state of PMP at post_load hook.

Yifei Jiang (6):
  target/riscv: Merge m/vsstatus and m/vsstatush into one uint64_t unit
  target/riscv: Add basic vmstate description of CPU
  target/riscv: Add PMP state description
  target/riscv: Add H extension state description
  target/riscv: Add V extension state description
  target/riscv: Add sifive_plic vmstate

 hw/intc/sifive_plic.c     |  26 ++++-
 hw/intc/sifive_plic.h     |   1 +
 target/riscv/cpu.c        |  16 ++--
 target/riscv/cpu.h        |  24 +++--
 target/riscv/cpu_bits.h   |  19 +---
 target/riscv/cpu_helper.c |  35 ++-----
 target/riscv/csr.c        |  18 ++--
 target/riscv/internals.h  |   4 +
 target/riscv/machine.c    | 196 ++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build  |   3 +-
 target/riscv/op_helper.c  |  11 +--
 target/riscv/pmp.c        |  29 +++---
 target/riscv/pmp.h        |   2 +
 13 files changed, 290 insertions(+), 94 deletions(-)
 create mode 100644 target/riscv/machine.c

-- 
2.19.1


