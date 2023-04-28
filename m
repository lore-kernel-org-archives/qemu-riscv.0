Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psPDN-00027s-G5
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDJ-000248-Oc; Fri, 28 Apr 2023 10:36:45 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDF-0008AS-CV; Fri, 28 Apr 2023 10:36:45 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACHj3vq2UtkrB5ZDA--.57839S2;
 Fri, 28 Apr 2023 22:36:27 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 00/13] target/riscv: Fix PMP related problem
Date: Fri, 28 Apr 2023 22:36:08 +0800
Message-Id: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHj3vq2UtkrB5ZDA--.57839S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr48GF4DWw47Zr48Gr45KFg_yoW5uFW5pF
 WfC345Jrs7trZFqrs3tr17Cr15Ars5WrW7t3WIyw1rA3Wa9F1rCr97Kw109FWUJF95W390
 kF4jyryv9F4jvaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfUO4E_DUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 14:36:46 -0000

This patchset tries to fix the PMP bypass problem issue https://gitlab.com/qemu-project/qemu/-/issues/1542:

TLB will be cached if the matched PMP entry cover the whole page.  However PMP entries with higher priority may cover part of the page (but not match the access address), which means different regions in this page may have different permission rights. So it also cannot be cached (patch 1).

Writing to pmpaddr didn't trigger tlb flush (patch 3). 

We set the tlb_size to 1 to make the TLB_INVALID_MASK set, and and the next access will again go through tlb_fill. However, this way will not work in tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be cached, and the following instructions can use this host address directly which may lead to the bypass of PMP related check (patch 5).

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix-v5

v5:

Mov the original Patch 6 to Patch 3

add Patch 4 to change the return type of pmp_hart_has_privs() to bool 

add Patch 5 to make RLB/MML/MMWP bits writable only when Smepmp is enabled

add Patch 6 to remove unused paramters in pmp_hart_has_privs_default()

add Patch 7 to flush tlb when MMWP or MML bits are changed

add Patch 8 to update the next rule addr in pmpaddr_csr_write()

add Patch 13 to deny access if access is partially inside the PMP entry

v4:

Update comments for Patch 1, and move partial check code from Patch 2 to Patch 1

Restore log message change in Patch 2

Update commit message and the way to improve the problem in Patch 6

v3:

Ignore disabled PMP entry in pmp_get_tlb_size() in Patch 1

Drop Patch 5, since tb jmp cache have been flushed in tlb_flush, so flush tb seems unnecessary.

Fix commit message problems in Patch 8 (Patch 7 in new patchset)

v2:

Update commit message for patch 1

Add default tlb_size when pmp is diabled or there is no rules and only get the tlb size when translation success in patch 2

Update get_page_addr_code_hostp instead of probe_access_internal to fix the cached host address for instruction fetch in patch 6

Add patch 7 to make the short up really work in pmp_hart_has_privs

Add patch 8 to use pmp_update_rule_addr() and pmp_update_rule_nums() separately

Weiwei Li (13):
  target/riscv: Update pmp_get_tlb_size()
  target/riscv: Move pmp_get_tlb_size apart from
    get_physical_address_pmp
  target/riscv: Make the short cut really work in pmp_hart_has_privs
  target/riscv: Change the return type of pmp_hart_has_privs() to bool
  target/riscv: Make RLB/MML/MMWP bits writable only when Smepmp is
    enabled
  target/riscv: Remove unused paramters in pmp_hart_has_privs_default()
  target/riscv: Flush TLB when MMWP or MML bits are changed
  target/riscv: Update the next rule addr in pmpaddr_csr_write()
  target/riscv: Flush TLB when pmpaddr is updated
  target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
  accel/tcg: Uncache the host address for instruction fetch when tlb
    size < 1
  target/riscv: Separate pmp_update_rule() in pmpcfg_csr_write
  target/riscv: Deny access if access is partially inside the PMP entry

 accel/tcg/cputlb.c        |   5 +
 target/riscv/cpu_helper.c |  27 ++----
 target/riscv/pmp.c        | 198 ++++++++++++++++++++++----------------
 target/riscv/pmp.h        |  11 +--
 4 files changed, 135 insertions(+), 106 deletions(-)

-- 
2.25.1


