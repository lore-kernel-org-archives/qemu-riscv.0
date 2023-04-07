Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkbCp-000739-Dp
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 21:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkbCm-00072I-Sv; Thu, 06 Apr 2023 21:47:56 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkbCk-0007BS-6g; Thu, 06 Apr 2023 21:47:56 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAH6oJAdi9kmEpeAA--.11004S2;
 Fri, 07 Apr 2023 09:47:45 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/3] target/riscv: Fix mstatus.MPP related support
Date: Fri,  7 Apr 2023 09:47:40 +0800
Message-Id: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAH6oJAdi9kmEpeAA--.11004S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF17KFyruFyruw45JF1DZFb_yoWftFg_WF
 WvgFy0gw17W3WDJFWDAr15Kry5GrWruryaya17tF4UCry7u347Wa1vgFyxZr1UZr1kX3Z3
 Arn7XryfWr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Apr 2023 01:47:57 -0000

This patchset tries to fix some problems in current implementation for mstatus.MPP

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-mpp-fix-v3

v3:
* add patch 2 to remove PRV_H, and use PRV_RESERVED instead in some cases
* improve legalize_mpp and assert error message in patch 3

v2:
* Modify commit message and add comment to specify MPP field becomes a WARL field since priv version 1.11 in patch 2
* rebase on riscv-to-apply.next

Weiwei Li (3):
  target/riscv: Fix the mstatus.MPP value after executing MRET
  target/riscv: Use PRV_RESERVED instead of PRV_H
  target/riscv: Legalize MPP value in write_mstatus

 target/riscv/cpu.h        |  2 +-
 target/riscv/cpu_bits.h   |  2 +-
 target/riscv/cpu_helper.c |  8 ++------
 target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c    |  2 +-
 target/riscv/op_helper.c  |  5 +++--
 6 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.25.1


