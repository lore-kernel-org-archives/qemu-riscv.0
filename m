Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0bbK-0006vl-1a
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 22:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bb5-0006lo-1o; Thu, 23 Dec 2021 22:50:23 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:49270 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bav-0001ZL-So; Thu, 23 Dec 2021 22:50:20 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNqQ8VheYHIBA--.4261S2;
 Fri, 24 Dec 2021 11:50:02 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Fri, 24 Dec 2021 11:49:09 +0800
Message-Id: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowACHjwNqQ8VheYHIBA--.4261S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW3tryfCryfXrWUCF1rWFg_yoW8XFyDpr
 4rG3y3CrZ5JFWfXw4fJ3WDAr1Yqr4rWw47twn7twn7Aw43AFW5JrnrKw1Sgw18Ja48Wr9F
 93WUCr13Cw45JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.156.147.178]
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
X-List-Received-Date: Fri, 24 Dec 2021 03:50:23 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0.0-rc), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0-rc.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream

To test this implementation, specify cpu argument with 'Zfinx =true,Zdinx=true,Zhinx=true,Zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin-false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.

liweiwei (6):
  target/riscv: add cfg properties for zfinx, zdinx and zhinx{min}
  target/riscv: add support for unique fpr read/write with support for
    zfinx
  target/riscv: add support for zfinx
  target/riscv: add support for zdinx
  target/riscv: add support for zhinx/zhinxmin
  target/riscv: expose zfinx, zdinx, zhinx{min} properties

 roms/SLOF                                 |   2 +-
 target/riscv/cpu.c                        |  16 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/fpu_helper.c                 | 120 ++++----
 target/riscv/helper.h                     |   4 +-
 target/riscv/insn_trans/trans_rvd.c.inc   | 252 +++++++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc   | 330 ++++++++++++++-------
 target/riscv/insn_trans/trans_rvzfh.c.inc | 342 +++++++++++++++-------
 target/riscv/internals.h                  |  12 +-
 target/riscv/translate.c                  | 177 +++++++++++
 10 files changed, 914 insertions(+), 345 deletions(-)

-- 
2.17.1


