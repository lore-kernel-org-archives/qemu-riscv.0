Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCFcO-0005da-Ik
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 01:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCFbX-0005Qd-Hk; Tue, 25 Jan 2022 01:47:01 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:38584 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCFbT-0005ca-SA; Tue, 25 Jan 2022 01:46:58 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3v1ecnO9hd+nyBg--.63247S2;
 Tue, 25 Jan 2022 14:45:49 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 0/5] support subsets of virtual memory extension
Date: Tue, 25 Jan 2022 14:45:31 +0800
Message-Id: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAC3v1ecnO9hd+nyBg--.63247S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3Jw1UKw4kGw1rCr43GFg_yoW8WF1xpF
 4rK3yakFZ8tFZ7Jw4ftF48Ar45Xw48ur43Jwn3Aw1kXa13ZrZ8Jrnak3y3AryUXFy0gr9F
 9F4Y9r13uayUJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Tue, 25 Jan 2022 06:47:01 -0000

This patchset implements virtual memory related RISC-V extensions: Svnapot version 1.0, Svinval vesion 1.0, Svpbmt version 1.0. 

Specification:
https://github.com/riscv/virtual-memory/tree/main/specs

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-virtmem-upstream-v6

To test this implementation, specify cpu argument with 'svinval=true,svnapot=true,svpbmt=true'.

This implementation can pass the riscv-tests for rv64ssvnapot.

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
 target/riscv/cpu.h                          | 14 ++++
 target/riscv/cpu_bits.h                     | 10 +++
 target/riscv/cpu_helper.c                   | 34 +++++++++-
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 142 insertions(+), 3 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

-- 
2.17.1


