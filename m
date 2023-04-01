Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piaW5-0003Y4-Dk
	for mharc-qemu-riscv@gnu.org; Sat, 01 Apr 2023 08:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piaW3-0003Vv-H9; Sat, 01 Apr 2023 08:39:31 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piaVz-0000Bf-Vk; Sat, 01 Apr 2023 08:39:31 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACHj8_3JShkBbjBGQ--.7361S2;
 Sat, 01 Apr 2023 20:39:20 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/6] target/riscv: Fix pointer mask related support
Date: Sat,  1 Apr 2023 20:39:11 +0800
Message-Id: <20230401123917.20471-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHj8_3JShkBbjBGQ--.7361S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1fCw18uryDXFyfWryxAFb_yoW8Ww45pF
 WfC3y3AaykJFZ7Xr4fJa18Ar15GF4fuFWUCwn7Jwn5tw45trWYqrn7K34jkFWUJFyrWry7
 KF1jyr1fuFyUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UdHUDUUUUU=
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
X-List-Received-Date: Sat, 01 Apr 2023 12:39:31 -0000

This patchset tries to fix some problem in current implementation for pointer mask, and add support for pointer mask of instruction fetch.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pm-fix-v5

v2:
* drop some error patchs
* Add patch 2 and 3 to fix the new problems
* Add patch 4 and 5 to use PC-relative translation for pointer mask for instruction fetch

v3:
* use target_pc temp instead of cpu_pc to store into badaddr in patch 3
* use dest_gpr instead of tcg_temp_new() for succ_pc in patch 4
* enable CF_PCREL for system mode in seperate patch 5

v4：
* Fix wrong pc_save value for conditional jump in patch 4
* Fix tcg_cflags overwrite problem to make CF_PCREL really work in new patch 5
* Fix tb mis-matched problem in new patch 6

v5:
* use gen_get_target_pc to compute target address of auipc and successor address of jalr in patch 4.
* separate tcg related fix patches(5, 6) from this patchset

Weiwei Li (6):
  target/riscv: Fix pointer mask transformation for vector address
  target/riscv: Update cur_pmmask/base when xl changes
  target/riscv: Fix target address to update badaddr
  target/riscv: Add support for PC-relative translation
  target/riscv: Enable PC-relative translation in system mode
  target/riscv: Add pointer mask support for instruction fetch

 target/riscv/cpu.c                      | 31 +++++++----
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               | 20 ++++++-
 target/riscv/csr.c                      | 11 ++--
 target/riscv/insn_trans/trans_rvi.c.inc | 37 +++++++++----
 target/riscv/translate.c                | 72 ++++++++++++++++++-------
 target/riscv/vector_helper.c            |  2 +-
 7 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.25.1


