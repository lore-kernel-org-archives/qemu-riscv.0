Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQL1-0000Gv-NA
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQKz-0000Fu-TW; Tue, 11 Apr 2023 22:35:57 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQKx-0008Mj-6F; Tue, 11 Apr 2023 22:35:57 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDABGTZkp2E_EQ--.55592S2;
 Wed, 12 Apr 2023 10:35:45 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 0/5] target/riscv: Add support for BF16 extensions
Date: Wed, 12 Apr 2023 10:33:15 +0800
Message-Id: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDABGTZkp2E_EQ--.55592S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtryUKr4fuFW3GF4xAr1kKrg_yoWDJwc_Kr
 W0gr97W34DWay7KFWDAr1UtryUCrZ5GFW7ta17tr4j9Fy7WryUJ3Z7tFy8Ar1UCF4rJ3Z2
 yr17JFyfKr1UujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 12 Apr 2023 02:35:58 -0000

Specification for BF16 extensions can be found in:
https://github.com/riscv/riscv-bfloat16

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-bf16-upstream

Weiwei Li (5):
  target/riscv: Add properties for BF16 extensions
  target/riscv: Add support for Zfbfmin extension
  target/riscv: Add support for Zvfbfmin extension
  target/riscv: Add support for Zvfbfwma extension
  target/riscv: Expose properties for BF16 extensions

 target/riscv/cpu.c                         |  20 +++
 target/riscv/cpu.h                         |   3 +
 target/riscv/fpu_helper.c                  |  12 ++
 target/riscv/helper.h                      |  10 ++
 target/riscv/insn32.decode                 |  12 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 175 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc  |  13 +-
 target/riscv/translate.c                   |   1 +
 target/riscv/vector_helper.c               |  17 ++
 9 files changed, 257 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvbf16.c.inc

-- 
2.25.1


