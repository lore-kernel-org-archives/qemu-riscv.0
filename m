Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjW4k-0002ub-T1
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 22:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjW4h-0002te-Rq; Mon, 03 Apr 2023 22:07:07 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjW4e-00014H-8c; Mon, 03 Apr 2023 22:07:06 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s4+hitkdVLLDQ--.57109S2;
 Tue, 04 Apr 2023 10:06:55 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 0/6] target/riscv: Fix pointer mask related support
Date: Tue,  4 Apr 2023 10:06:47 +0800
Message-Id: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s4+hitkdVLLDQ--.57109S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1xKr4UAFWUCw4rGr1xKrg_yoW8CF17pF
 WfC3y3JayDJFZ7Xr4fJa18Ar15GF4fuFWDCwn7Jwn5tw45trWFqrn7K34UCFWkJFyfW347
 KF1jyr1fuF1UArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
 6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UdHUDUUUUU=
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
X-List-Received-Date: Tue, 04 Apr 2023 02:07:08 -0000

This patchset tries to fix some problem in current implementation for pointer mask, and add support for pointer mask of instruction fetch.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pm-fix-v6

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

v6:
* rename gen_get_target_pc as gen_pc_plus_diff in patch 3 and patch 4
* use gen_pc_plus_diff to compute successor address of jal in patch 4
* Mov comments for patch 5 to patch 4

Weiwei Li (6):
  target/riscv: Fix pointer mask transformation for vector address
  target/riscv: Update cur_pmmask/base when xl changes
  target/riscv: Fix target address to update badaddr
  target/riscv: Add support for PC-relative translation
  target/riscv: Enable PC-relative translation in system mode
  target/riscv: Add pointer mask support for instruction fetch

 target/riscv/cpu.c                      | 31 ++++++++----
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               | 20 +++++++-
 target/riscv/csr.c                      | 11 ++--
 target/riscv/insn_trans/trans_rvi.c.inc | 37 ++++++++++----
 target/riscv/translate.c                | 67 ++++++++++++++++++-------
 target/riscv/vector_helper.c            |  2 +-
 7 files changed, 126 insertions(+), 43 deletions(-)

-- 
2.25.1


