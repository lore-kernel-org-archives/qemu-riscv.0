Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poyU0-0007Pw-2K
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 23:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTy-0007OZ-HR; Tue, 18 Apr 2023 23:27:46 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTu-000117-3B; Tue, 18 Apr 2023 23:27:46 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACnrxegXz9kyEroFA--.60284S2;
 Wed, 19 Apr 2023 11:27:29 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/7] target/riscv: Fix PMP related problem
Date: Wed, 19 Apr 2023 11:27:18 +0800
Message-Id: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrxegXz9kyEroFA--.60284S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWxKFWktw4kGr1UuF4kJFb_yoW8tw45pF
 Z3u345tr4Dt39rXw4ftr17Zr1rArs5WFWUJ3WSyr1rZ3WavFyrCrWvkay09Fy7Jr95WrW3
 KF4jyrykuF4UZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
 6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 fUoOJ5UUUUU
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 19 Apr 2023 03:27:46 -0000

This patchset tries to fix the PMP bypass problem issue https://gitlab.com/qemu-project/qemu/-/issues/1542:

TLB will be cached if the matched PMP entry cover the whole page.  However PMP entries with higher priority may cover part of the page (but not match the access address), which means different regions in this page may have different permission rights. So it also cannot be cached (patch 1).

Writing to pmpaddr didn't trigger tlb flush (patch 3). 

We set the tlb_size to 1 to make the TLB_INVALID_MASK set, and and the next access will again go through tlb_fill. However, this way will not work in tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be cached, and the following instructions can use this host address directly which may lead to the bypass of PMP related check (patch 6).

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix-v3

v2:

Update commit message for patch 1

Add default tlb_size when pmp is diabled or there is no rules and only get the tlb size when translation success in patch 2

Update get_page_addr_code_hostp instead of probe_access_internal to fix the cached host address for instruction fetch in patch 6

Add patch 7 to make the short up really work in pmp_hart_has_privs

Add patch 8 to use pmp_update_rule_addr() and pmp_update_rule_nums() separately

v3:

Ignore disabled PMP entry in pmp_get_tlb_size() in Patch 1

Drop Patch 5, since tb jmp cache have been flushed in tlb_flush, so flush tb seems unnecessary.

Fix commit message problems in Patch 8 (Patch 7 in new patchset)

Weiwei Li (7):
  target/riscv: Update pmp_get_tlb_size()
  target/riscv: Move pmp_get_tlb_size apart from
    get_physical_address_pmp
  target/riscv: Flush TLB when pmpaddr is updated
  target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
  accel/tcg: Uncache the host address for instruction fetch when tlb
    size < 1
  target/riscv: Make the short cut really work in pmp_hart_has_privs
  target/riscv: Separate pmp_update_rule() in pmpcfg_csr_write

 accel/tcg/cputlb.c        |   5 +
 target/riscv/cpu_helper.c |  24 +--
 target/riscv/pmp.c        | 318 ++++++++++++++++++++------------------
 target/riscv/pmp.h        |   3 +-
 4 files changed, 183 insertions(+), 167 deletions(-)

-- 
2.25.1


