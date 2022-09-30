Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe4lh-0001wP-4S
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 21:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4ld-0001qJ-SJ; Thu, 29 Sep 2022 21:24:41 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39482 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lZ-00080k-O8; Thu, 29 Sep 2022 21:24:41 -0400
Received: from localhost.localdomain (unknown [139.227.114.201])
 by APP-05 (Coremail) with SMTP id zQCowABHOHVJRTZjaraNAg--.3616S2;
 Fri, 30 Sep 2022 09:24:27 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 0/8] support subsets of code size reduction extension
Date: Fri, 30 Sep 2022 09:23:37 +0800
Message-Id: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHOHVJRTZjaraNAg--.3616S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryDKFykCrWDXw4ruw4DArb_yoW8AF45pr
 48G3yakrZ8JFZ7Jw4ftF1UGr15Ars5Wr45Awn7tw18Ja13ArW5JrnrKw13G3W7JF18WrnI
 93WUCr13uw45JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 30 Sep 2022 01:24:42 -0000

This patchset implements RISC-V Zc* extension v1.0.0.RC5.6 version instructions. 

Specification:
https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream

To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true" and "x-zcd=true" (or "x-zcmp=true,x-zcmt=true") to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extension support. 

This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test

Weiwei Li (8):
  target/riscv: add cfg properties for Zc* extension
  target/riscv: add support for Zca, Zcf and Zcd extension
  target/riscv: add support for Zcb extension
  target/riscv: add support for Zcmp extension
  target/riscv: add support for Zcmt extension
  target/riscv: delete redundant check for zcd instructions in
    decode_opc
  target/riscv: expose properties for Zc* extension
  disas/riscv.c: add disasm support for Zc*

 disas/riscv.c                             | 287 +++++++++++++++++++++-
 target/riscv/cpu.c                        |  37 +++
 target/riscv/cpu.h                        |   8 +
 target/riscv/cpu_bits.h                   |   6 +
 target/riscv/csr.c                        |  28 +++
 target/riscv/helper.h                     |   7 +
 target/riscv/insn16.decode                |  52 +++-
 target/riscv/insn_trans/trans_rvi.c.inc   |   5 +-
 target/riscv/insn_trans/trans_rvzce.c.inc | 279 +++++++++++++++++++++
 target/riscv/machine.c                    |  19 ++
 target/riscv/meson.build                  |   3 +-
 target/riscv/translate.c                  |  25 +-
 target/riscv/zce_helper.c                 | 244 ++++++++++++++++++
 13 files changed, 990 insertions(+), 10 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
 create mode 100644 target/riscv/zce_helper.c

-- 
2.25.1


