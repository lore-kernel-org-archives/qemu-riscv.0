Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrKco-0008V7-R5
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 08:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKcm-0008UJ-Rl; Sun, 28 Nov 2021 08:53:48 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60540 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKch-00046F-6t; Sun, 28 Nov 2021 08:53:46 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXeBXaiaNhLKY9AA--.11553S2;
 Sun, 28 Nov 2021 21:53:32 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH 0/3] support subsets of virtual memory extension
Date: Sun, 28 Nov 2021 21:52:52 +0800
Message-Id: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowACXeBXaiaNhLKY9AA--.11553S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr17Wr4UKrWxGr4UXFWkZwb_yoWkJrg_Gr
 1vgF97uw1q9a15KFZ8Cw1DWrW3KrZ5GFy0qa17tw4Y9a47WryUJwn7tFyDZr1UZF45J3Z2
 yrn3JFyfKr1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 28 Nov 2021 13:53:49 -0000

This patchset implements virtual memory related RISC-V extensions: Svnapot version 0.1, Svinval vesion 0.1, Svpbmt version 0.1. 

Specification:
https://github.com/riscv/virtual-memory/tree/main/specs

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-vritmem-upstream

To test svinval implementation, specify cpu argument with 'x-svinval=true'. Other two extensions are enabled by default.

This implementation can pass the riscv-tests for rv64ssvnapot.

liweiwei (3):
  target/riscv: add support for svnapot extension
  target/riscv: add support for svinval extension
  target/riscv: add support for svpbmt extension

 target/riscv/cpu.c                          |  1 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/cpu_bits.h                     |  5 ++
 target/riscv/cpu_helper.c                   | 25 +++++--
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 108 insertions(+), 7 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

-- 
2.17.1


