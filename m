Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjyyO-0000gG-9Z
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyM-0000fQ-Bq; Wed, 05 Apr 2023 04:58:30 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyI-0003Cs-PB; Wed, 05 Apr 2023 04:58:30 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BQoOC1kWY5GDg--.24854S2;
 Wed, 05 Apr 2023 16:58:17 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/4] target/riscv: Simplification for RVH related check and
 code style fix
Date: Wed,  5 Apr 2023 16:58:09 +0800
Message-Id: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BQoOC1kWY5GDg--.24854S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1UWFyUGrW7Kr17WryxGrg_yoW8Cry3pF
 WfG3yfA395JrZxGw1ftF1UJwn8Jrs5Wr4Yyas7Ar1kAa15ArW5Jwn7Kw1IkFyDGFW8Wrn0
 kF1UCr13CrWUArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Wed, 05 Apr 2023 08:58:30 -0000

This patchset tries to simplify the RVH related check and fix some code style problems, such as problems for indentation, multi-line comments and lines with over 80 characters.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream

v2:
* add comment to specify riscv_cpu_set_virt_enabled() can only be called when RVH is enabled in patch 4 (suggested by Richard Henderson)
* merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>) to patch 5
* use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in patch 6 (suggested by LIU Zhiwei)
* remain the orginal identation for macro name in patch 8 (suggested by LIU Zhiwei)

v3:
* rebase on riscv-to-apply.next (partial patches in v2 have been applied)
* Fix new found format problem in patch 2,3,4 of v3

Weiwei Li (4):
  target/riscv: Remove riscv_cpu_virt_enabled()
  target/riscv: Fix format for indentation
  target/riscv: Fix format for comments
  target/riscv: Fix lines with over 80 characters

 target/riscv/arch_dump.c                |   7 +-
 target/riscv/cpu.c                      |  47 ++--
 target/riscv/cpu.h                      |  31 +--
 target/riscv/cpu_bits.h                 |   2 +-
 target/riscv/cpu_helper.c               | 274 ++++++++++----------
 target/riscv/csr.c                      |  90 +++----
 target/riscv/debug.c                    |  21 +-
 target/riscv/fpu_helper.c               |  24 +-
 target/riscv/gdbstub.c                  |   3 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
 target/riscv/m128_helper.c              |  16 +-
 target/riscv/machine.c                  |  18 +-
 target/riscv/op_helper.c                |  20 +-
 target/riscv/pmp.c                      |  66 ++---
 target/riscv/pmp.h                      |   9 +-
 target/riscv/pmu.c                      |   7 +-
 target/riscv/sbi_ecall_interface.h      |   8 +-
 target/riscv/translate.c                |  26 +-
 target/riscv/vector_helper.c            | 317 ++++++++++++++----------
 19 files changed, 552 insertions(+), 470 deletions(-)

-- 
2.25.1


