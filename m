Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1polyt-0008F4-TN
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 10:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1polys-0008EE-4c; Tue, 18 Apr 2023 10:06:50 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1polyp-0008Uf-5k; Tue, 18 Apr 2023 10:06:49 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowADX32froz5kHH+IFA--.38119S2;
 Tue, 18 Apr 2023 22:06:37 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 0/8] target/riscv: Fix PMP related problem
Date: Tue, 18 Apr 2023 22:06:24 +0800
Message-Id: <20230418140632.53166-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX32froz5kHH+IFA--.38119S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw18Gr1rtr4UCFW8Gw1kuFg_yoW5JF4fpF
 Z3C343tr4DJrW7Xr1ftr47ur15Ars5WF4UJ3ZIyw1rZ3Wa934rCryvkw409FyUJF95WrW3
 KF4jyr97WF4UZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU5s
 jjDUUUU
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
X-List-Received-Date: Tue, 18 Apr 2023 14:06:50 -0000

This patchset tries to fix the PMP bypass problem issue https://gitlab.com/qemu-project/qemu/-/issues/1542:

- TLB will be cached if the matched PMP entry cover the whole page.  However PMP entries with higher priority may cover part of the page (but not match the access address), which means different regions in this page may have different permission rights. So the TLB also cannot be cached in this case (patch 1).
- Writing to pmpaddr didn't trigger tlb flush (patch 3). 
- The tb isn't flushed when PMP permission changes, so It also may hit  the tb and bypass the changed PMP check for instruction fetch (patch 5). 
- We set the tlb_size to 1 to make the TLB_INVALID_MASK set, and and the next access will again go through tlb_fill. However, this way will not work in tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be cached, and the following instructions can use this host address directly which may lead to the bypass of PMP related check (patch 6).

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix-v2

v2:

- Update commit message for patch 1
- Add default tlb_size when pmp is diabled or there is no rules and only get the tlb size when translation success in patch 2
- Update get_page_addr_code_hostp instead of probe_access_internal to fix the cached host address for instruction fetch in patch 6
- Add patch 7 to make the short up really work in pmp_hart_has_privs
- Add patch 8 to use pmp_update_rule_addr() and pmp_update_rule_nums() separately

Weiwei Li (8):
  target/riscv: Update pmp_get_tlb_size()
  target/riscv: Move pmp_get_tlb_size apart from
    get_physical_address_pmp
  target/riscv: flush tlb when pmpaddr is updated
  target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
  target/riscv: flush tb when PMP entry changes
  accel/tcg: Uncache the host address for instruction fetch when tlb
    size < 1
  target/riscv: Make the short cut really work in pmp_hart_has_privs
  target/riscv: Separate pmp_update_rule() in pmpcfg_csr_write Use
    pmp_update_rule_addr() and pmp_update_rule_nums() separately to
    update rule nums only once for each pmpcfg_csr_write. Then we can
    also move tlb_flush and tb_flush into pmp_update_rule_nums().

 accel/tcg/cputlb.c        |   5 +
 target/riscv/cpu_helper.c |  24 +--
 target/riscv/pmp.c        | 316 ++++++++++++++++++++------------------
 target/riscv/pmp.h        |   3 +-
 4 files changed, 181 insertions(+), 167 deletions(-)

-- 
2.25.1


