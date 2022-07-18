Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDQVu-0002Ju-AO
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 09:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVr-0002HZ-OO; Mon, 18 Jul 2022 09:10:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43136 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVo-0002zd-4d; Mon, 18 Jul 2022 09:10:15 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowABnbweqW9Vi5+hPEQ--.55056S2;
 Mon, 18 Jul 2022 21:10:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH V3 0/6] Improve the U/S/H extension related check
Date: Mon, 18 Jul 2022 21:09:49 +0800
Message-Id: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABnbweqW9Vi5+hPEQ--.55056S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4UAr15tr47Xry8JrWDJwb_yoWkKwb_WF
 y8XF9rXa40q3WUJayDAr13try3GrWrGryDta12yrWj9Fy3WrykZF4DXrWUZw1UZ3yxtFn5
 Zrn3ta4fCr42kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbz8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Mon, 18 Jul 2022 13:10:16 -0000

This patchset tries to improve the U/S/H related check:
* add check for the supported privilege modes conbinations: only supporting M,
S mode is not a suggested combination
* add check for "H extension depends on I extension"
* add check for "H extension implicitly requires S mode"
* add check for csrs only existed when U mode is supported
* fix and simplify the checks in hmode/hmode32

Any suggestions are welcome.

v3:
* Fix the issues suggested by Andrew Jones in commit messages

v2:
* update patch 3 to make the newlines start at the same position as above line
* update patch 5 to add check for "H extension implicitly requires S mode"

Weiwei Li (6):
  target/riscv: Add check for supported privilege mode combinations
  target/riscv: H extension depends on I extension
  target/riscv: Fix checkpatch warning may triggered in csr_ops table
  target/riscv: Add check for csrs existed with U extension
  target/riscv: Fix checks in hmode/hmode32
  target/riscv: Simplify the check in hmode to resue the check in
    riscv_csrrw_check

 target/riscv/cpu.c |  17 ++
 target/riscv/csr.c | 490 ++++++++++++++++++++++++---------------------
 2 files changed, 278 insertions(+), 229 deletions(-)

-- 
2.17.1


