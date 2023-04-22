Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqCul-0007pr-TM
	for mharc-qemu-riscv@gnu.org; Sat, 22 Apr 2023 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pqCuh-0007ms-LE; Sat, 22 Apr 2023 09:04:27 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pqCud-0004Uo-CM; Sat, 22 Apr 2023 09:04:27 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowAAHTJxI20NkLKGxCA--.21573S2;
 Sat, 22 Apr 2023 21:04:09 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 0/7] target/riscv: Fix PMP related problem
Date: Sat, 22 Apr 2023 21:03:22 +0800
Message-Id: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHTJxI20NkLKGxCA--.21573S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWxKFWktw4kGr1UuF4kJFb_yoW5JF48pF
 Z3C345tr4DtrW3Xr43tr17Zr1rArs5WF4Ut3W2kw1rZ3WagFyrCrWvk3yFkFWUJF95WrZx
 KF4jyrWv9F4UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
 DUUUUU=
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 22 Apr 2023 13:04:27 -0000

This patchset tries to fix the PMP bypass problem issue https://gitlab.com/qemu-project/qemu/-/issues/1542:

TLB will be cached if the matched PMP entry cover the whole page.  However PMP entries with higher priority may cover part of the page (but not match the access address), which means different regions in this page may have different permission rights. So it also cannot be cached (patch 1).

Writing to pmpaddr didn't trigger tlb flush (patch 3).

We set the tlb_size to 1 to make the TLB_INVALID_MASK set, and and the next access will again go through tlb_fill. However, this way will not work in tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be cached, and the following instructions can use this host address directly which may lead to the bypass of PMP related check (patch 5).

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix-v4

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

 accel/tcg/cputlb.c        |  5 +++
 target/riscv/cpu_helper.c | 19 +++-----
 target/riscv/pmp.c        | 91 +++++++++++++++++++++++++++++----------
 target/riscv/pmp.h        |  3 +-
 4 files changed, 80 insertions(+), 38 deletions(-)

-- 
2.25.1


