Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB9SO-0003bL-Hz
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 02:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SN-0003Yw-DY; Tue, 12 Jul 2022 02:33:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53760 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SJ-0001bq-CL; Tue, 12 Jul 2022 02:33:15 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowADns1idFc1ijYPeDg--.64613S2;
 Tue, 12 Jul 2022 14:33:03 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 0/6] Improve the U/S/H extension related check
Date: Tue, 12 Jul 2022 14:32:30 +0800
Message-Id: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowADns1idFc1ijYPeDg--.64613S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4UAr15tr47XryUuFykXwb_yoWkAFc_WF
 y8WF9xXa40qa1UJayDAr13try7GrWrGF9rta12yr4j9Fy3WrykZr1DXrWUZr4UZ3yxKFna
 vrn3Ja4Skr1jkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbz8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
 W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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
X-List-Received-Date: Tue, 12 Jul 2022 06:33:15 -0000

This patchset tries to improve the U/S/H related check:
* add check for the supported privilege modes conbinations: only supporting M,
S mode is not a suggested combination
* add check for "H extension depends on I extension"
* add check for "H extension implicitly requires S mode"
* add check for csrs only existed when U mode is supported
* fix and simplify the checks in hmode/hmode32

Any suggestions are welcome.

v2:
* update patch 3 to make the newlines start at the same position as above line
* update patch 5 to add check for "H extension implicitly requires S mode"

Weiwei Li (6):
  target/riscv: add check for supported privilege modes conbinations
  target/riscv: H extension depends on I extension
  target/riscv: fix checkpatch warning may triggered in csr_ops table
  target/riscv: add check for csrs existed with U extension
  target/riscv: fix checks in hmode/hmode32
  target/riscv: simplify the check in hmode to resue the check in
    riscv_csrrw_check

 target/riscv/cpu.c |  17 ++
 target/riscv/csr.c | 491 ++++++++++++++++++++++++---------------------
 2 files changed, 279 insertions(+), 229 deletions(-)

-- 
2.17.1


