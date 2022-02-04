Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFoK5-0005BR-HT
	for mharc-qemu-riscv@gnu.org; Thu, 03 Feb 2022 21:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFoK2-0004zR-4R; Thu, 03 Feb 2022 21:27:38 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:45982 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFoJw-0002wm-M4; Thu, 03 Feb 2022 21:27:37 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAnYEIJj_xhcHpaAA--.48511S2;
 Fri, 04 Feb 2022 10:27:22 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 0/5] support subsets of virtual memory extension
Date: Fri,  4 Feb 2022 10:26:53 +0800
Message-Id: <20220204022658.18097-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAAnYEIJj_xhcHpaAA--.48511S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3Jw1UKw4kGw1UAryrZwb_yoW8ZFy5pr
 45Kw4akFZ8tFZ7Jw4fta18Ar45Ww4rur47Awn3Jwn5Xa13ZrW5trZak3yakryDXFy8Wry2
 9a17Zr13uayUJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 fUoOJ5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 02:27:38 -0000

This patchset implements virtual memory related RISC-V extensions: Svnapot version 1.0, Svinval vesion 1.0, Svpbmt version 1.0. 

Specification:
https://github.com/riscv/virtual-memory/tree/main/specs

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-virtmem-upstream-v9

To test this implementation, specify cpu argument with 'svinval=true,svnapot=true,svpbmt=true'.

This implementation can pass the riscv-tests for rv64ssvnapot.

v9:
* delete cast for PTE bits check

v8:
* rebase on https://lore.kernel.org/qemu-devel/20220131110201.2303275-1-philipp.tomsich@vrull.eu/
* move variables to tops of function
* add ULL for PTE_N and PTE_PMBT
* add mask variable for napot_bits

v7:
* delete definition of PTE_PPN_MASK for TARGET_RISCV32
* make riscv_cpu_sxl works for user mode
* add commit msg for patch 2

v6:
* select ppn mask base on sxl

v5:
* merge patch https://lore.kernel.org/qemu-devel/1569456861-8502-1-git-send-email-guoren@kernel.org/
* relax pte attribute check

v4:
* fix encodings for hinval_vvma and hinval_gvma
* partition inner PTE check into several steps
* improve commit messages to describe changes

v3:
* drop "x-" in exposed properties

v2:
* add extension check for svnapot and svpbmt

Guo Ren (1):
  target/riscv: Ignore reserved bits in PTE for RV64

Weiwei Li (4):
  target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner PTE
  target/riscv: add support for svnapot extension
  target/riscv: add support for svinval extension
  target/riscv: add support for svpbmt extension

 target/riscv/cpu.c                          |  4 ++
 target/riscv/cpu.h                          | 16 +++++
 target/riscv/cpu_bits.h                     |  6 ++
 target/riscv/cpu_helper.c                   | 34 +++++++++-
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

-- 
2.17.1


