Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqpz-0000Au-Lh
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqpw-00007S-Vh; Tue, 14 Feb 2023 03:38:52 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqpr-0001qx-PF; Tue, 14 Feb 2023 03:38:52 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADHz5uOSOtjHFQsBQ--.41555S2;
 Tue, 14 Feb 2023 16:38:39 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [Patch 00/14] target/riscv: Some updates to float point related
 extensions
Date: Tue, 14 Feb 2023 16:38:19 +0800
Message-Id: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHz5uOSOtjHFQsBQ--.41555S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1UKF1kZr43WFW7ur1fXrb_yoW8XFy5pr
 4fG3y7CrZ5JrW7Jr4SqF4UAw1YqF4rWr4ay3Z2yw1rJFW3ZrW5XrnFk3WfKFyUJFWkGry2
 9a4UAw13Zw47JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [114.95.238.225]
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
X-List-Received-Date: Tue, 14 Feb 2023 08:38:53 -0000

This patchset fixes some relationship for half-precise float point related extensions and vector related extensions. It also adds support for Zvhf{min} and Zve64d extensions.

Specification for Zv* extensions can be found in:

https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zvfh-upstream

Weiwei Li (14):
  target/riscv: Fix the relationship between Zfhmin and Zfh
  target/riscv: Fix the relationship between Zhinxmin and Zhinx
  target/riscv: Simplify the check for Zfhmin and Zhinxmin
  target/riscv: Add cfg properties for Zv* extension
  target/riscv: Fix relationship between V, Zve*, F and  D
  target/riscv: Add propertie check for Zvfh{min} extensions
  target/riscv: Indent fixes in cpu.c
  target/riscv: Simplify check for Zve32f and Zve64f
  target/riscv: Replace check for F/D to Zve32f/Zve64d in
    trans_rvv.c.inc
  target/riscv: Remove rebundunt check for zve32f and zve64f
  target/riscv: Add support for Zvfh/zvfhmin extensions
  target/riscv: Fix check for vectore load/store instructions when
    EEW=64
  target/riscv: Simplify check for EEW = 64 in trans_rvv.c.inc
  target/riscv: Expose properties for Zv* extension

 target/riscv/cpu.c                        |  99 ++++++++----
 target/riscv/cpu.h                        |   3 +
 target/riscv/insn_trans/trans_rvv.c.inc   | 184 +++++++---------------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  25 ++-
 4 files changed, 144 insertions(+), 167 deletions(-)

-- 
2.25.1


