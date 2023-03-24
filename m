Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfgib-0004z6-NW
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 08:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgia-0004yd-3d; Fri, 24 Mar 2023 08:40:28 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgiU-0000li-85; Fri, 24 Mar 2023 08:40:27 -0400
Received: from localhost.localdomain (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowACXnVX4mR1kGwsYCQ--.52917S2;
 Fri, 24 Mar 2023 20:39:21 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 0/8] target/riscv: Simplification for RVH related check and
 code style fix
Date: Fri, 24 Mar 2023 20:38:01 +0800
Message-Id: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnVX4mR1kGwsYCQ--.52917S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1UWFyUGF1furWDCF45Wrg_yoW8Jw18pr
 48C3yfA39YyFZ3Gr1ftF1UJw15Xrs5Wr45Aas7Zr1xAa15CrW5Jrn7Kw17CFyDJFy8Wr1q
 kFyUCr13Cr4UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
X-List-Received-Date: Fri, 24 Mar 2023 12:40:28 -0000

This patchset tries to simplify the RVH related check and fix some code style problems, such as problems for indentation, multi-line comments and lines with over 80 characters.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-cleanup-upstream

Weiwei Li (8):
  target/riscv: Remove redundant call to riscv_cpu_virt_enabled
  target/riscv: Remove redundant check on RVH
  target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
  target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
  target/riscv: Remove redundant parentheses
  target/riscv: Fix format for indentation
  target/riscv: Fix format for comments
  target/riscv: Fix lines with over 80 characters

 target/riscv/arch_dump.c                |   7 +-
 target/riscv/cpu.c                      |   6 +-
 target/riscv/cpu.h                      |  26 ++-
 target/riscv/cpu_bits.h                 |   2 +-
 target/riscv/cpu_helper.c               |  86 ++++---
 target/riscv/csr.c                      |   6 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  54 ++---
 target/riscv/op_helper.c                |   7 +-
 target/riscv/pmp.c                      |  48 ++--
 target/riscv/pmp.h                      |   9 +-
 target/riscv/pmu.c                      |   3 +-
 target/riscv/sbi_ecall_interface.h      |   8 +-
 target/riscv/translate.c                |   8 +-
 target/riscv/vector_helper.c            | 292 ++++++++++++++----------
 14 files changed, 316 insertions(+), 246 deletions(-)

-- 
2.25.1


