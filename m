Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oASEn-0003yR-CE
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEk-0003rI-AR; Sun, 10 Jul 2022 04:24:18 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36382 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEh-0005dz-Ht; Sun, 10 Jul 2022 04:24:18 -0400
Received: from liww-tm.www.tendawifi.com (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAAnLASjjMpiF30+Dg--.38648S2;
 Sun, 10 Jul 2022 16:24:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 0/6] Improve the U/S/H extension related check
Date: Sun, 10 Jul 2022 16:23:54 +0800
Message-Id: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAAnLASjjMpiF30+Dg--.38648S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4UAr15uw4fKF17Aw1DKFg_yoWfurc_KF
 y0gF93X340qa1UJayDAr15tryUKr4rGFy2ya12yrWj9Fy3Wrn5ZanFvFWUZw1UurWxtFn3
 Zwn3Aa4Skw12kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [117.151.235.104]
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
X-List-Received-Date: Sun, 10 Jul 2022 08:24:18 -0000

This patchset tries to improve the U/S/H related check:
* add check for the supported privilege modes conbinations: only supporting M,
S mode is not a suggested combination
* add check for "H extension depends on I extension"
* add check for csrs only existed when U mode is supported
* fix and simplify the checks in hmode/hmode32
Any suggestions are welcome.

Weiwei Li (6):
  target/riscv: add check for supported privilege modes conbinations
  target/riscv: H extension depends on I extension
  target/riscv: fix checkpatch warning may triggered in csr_ops table
  target/riscv: add check for csrs existed with U extension
  target/riscv: fix checks in hmode/hmode32
  target/riscv: simplify the check in hmode to resue the check in
    riscv_csrrw_check

 target/riscv/cpu.c |  12 ++
 target/riscv/csr.c | 412 ++++++++++++++++++++++++---------------------
 2 files changed, 236 insertions(+), 188 deletions(-)

-- 
2.17.1


