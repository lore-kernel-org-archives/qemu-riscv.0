Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plSft-0000CG-D7
	for mharc-qemu-riscv@gnu.org; Sun, 09 Apr 2023 06:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfp-0000AU-GH; Sun, 09 Apr 2023 06:53:30 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfl-0002XQ-EE; Sun, 09 Apr 2023 06:53:28 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhYUmTJkVyANEA--.55439S2;
 Sun, 09 Apr 2023 18:53:09 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 0/7] target/riscv: Add support for PC-relative translation
Date: Sun,  9 Apr 2023 18:52:59 +0800
Message-Id: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHHhYUmTJkVyANEA--.55439S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urykWF4ftw4fGr48XrW5Jrb_yoW8Gr45pr
 WrK3yxCrZ8trWfAw4fXF4DAry5GF4rWrWkA3Z2ywn3Jw4YyrW5Jr9rK34fKrsrJFy8Xr1q
 k3WUCw43ur45ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
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
X-List-Received-Date: Sun, 09 Apr 2023 10:53:30 -0000

This patchset tries to add support for PC-relative translation.

The existence of CF_PCREL can improve performance with the guest
kernel's address space randomization.  Each guest process maps libc.so
(et al) at a different virtual address, and this allows those
translations to be shared.

And support of PC-relative translation is the precondition to support
pointer mask for instruction.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pcrel-upstream

Weiwei Li (7):
  target/riscv: Fix target address to update badaddr
  target/riscv: Introduce cur_insn_len into DisasContext
  target/riscv: Change gen_goto_tb to work on displacements
  target/riscv: Change gen_set_pc_imm to gen_update_pc
  target/riscv: Use true diff for gen_pc_plus_diff
  target/riscv: Enable PC-relative translation
  target/riscv: Remove pc_succ_insn from DisasContext

 target/riscv/cpu.c                            | 31 +++++--
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc       | 43 ++++++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  4 +-
 target/riscv/insn_trans/trans_rvzawrs.c.inc   |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc    |  2 +-
 target/riscv/translate.c                      | 92 +++++++++++++------
 7 files changed, 117 insertions(+), 59 deletions(-)

-- 
2.25.1


