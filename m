Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pghuy-0007M4-Nx
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 04:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghuu-0007Ha-1V; Mon, 27 Mar 2023 04:09:24 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghuq-00054Y-9n; Mon, 27 Mar 2023 04:09:23 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACnrWUkTyFksV29Cg--.4754S2;
 Mon, 27 Mar 2023 16:09:09 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 00/10] target/riscv: Simplification for RVH related check
 and code style fix
Date: Mon, 27 Mar 2023 16:08:48 +0800
Message-Id: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrWUkTyFksV29Cg--.4754S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1UWFyUGrW7Kr17WryxGrg_yoW8ZryDpr
 48G3ySy395ArZxGr1ftF4UJr15Jrs8Wr45J3s7Cr18Aa15CrW5Jrn7Kw1IkFyDGFy8Wr1q
 9F1UCF13Cr4UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
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
X-List-Received-Date: Mon, 27 Mar 2023 08:09:24 -0000

This patchset tries to simplify the RVH related check and fix some code style problems, such as problems for indentation, multi-line comments and lines with over 80 characters.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream

v2:
* add comment to specify riscv_cpu_set_virt_enabled() can only be called when RVH is enabled in patch 4 (suggested by Richard Henderson)
* merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>) to patch 5
* use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in patch 6 (suggested by LIU Zhiwei)
* remain the orginal identation for macro name in patch 8 (suggested by LIU Zhiwei)

LIU Zhiwei (1):
  target/riscv: Convert env->virt to a bool env->virt_enabled

Weiwei Li (9):
  target/riscv: Remove redundant call to riscv_cpu_virt_enabled
  target/riscv: Remove redundant check on RVH
  target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
  target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
  target/riscv: Remove riscv_cpu_virt_enabled()
  target/riscv: Remove redundant parentheses
  target/riscv: Fix format for indentation
  target/riscv: Fix format for comments
  target/riscv: Fix lines with over 80 characters

 target/riscv/arch_dump.c                |   7 +-
 target/riscv/cpu.c                      |   8 +-
 target/riscv/cpu.h                      |  29 +--
 target/riscv/cpu_bits.h                 |   5 +-
 target/riscv/cpu_helper.c               | 142 ++++++------
 target/riscv/csr.c                      |  52 ++---
 target/riscv/debug.c                    |  10 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
 target/riscv/machine.c                  |   6 +-
 target/riscv/op_helper.c                |  21 +-
 target/riscv/pmp.c                      |  48 ++--
 target/riscv/pmp.h                      |   9 +-
 target/riscv/pmu.c                      |   7 +-
 target/riscv/sbi_ecall_interface.h      |   8 +-
 target/riscv/translate.c                |  14 +-
 target/riscv/vector_helper.c            | 292 ++++++++++++++----------
 16 files changed, 378 insertions(+), 316 deletions(-)

-- 
2.25.1


