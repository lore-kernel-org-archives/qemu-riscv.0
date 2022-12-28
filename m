Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAPoO-0000aF-80
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 01:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pAPo5-0000Sx-JA; Wed, 28 Dec 2022 01:20:53 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pAPo1-0000vH-44; Wed, 28 Dec 2022 01:20:53 -0500
Received: from localhost.localdomain (unknown [61.165.33.198])
 by APP-01 (Coremail) with SMTP id qwCowABX2ewx4KtjqJCSCQ--.53263S2;
 Wed, 28 Dec 2022 14:20:35 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 0/9] support subsets of code size reduction extension
Date: Wed, 28 Dec 2022 14:20:19 +0800
Message-Id: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABX2ewx4KtjqJCSCQ--.53263S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1kZFyfCF1fXw17Gw4Uurg_yoW5Gr47pr
 WrC3yakrZ8tFWxJw4ft3WUJw15AFs5Wr45Awn7Jw1kJay3ArW3Jrs7K3W3G3WxJF1rWrnF
 93WUCw13u3yUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [61.165.33.198]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 28 Dec 2022 06:20:53 -0000

This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instructions.

Specification:
https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v9

To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extensions support.


This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test

v9:
* rebase on riscv-to-apply.next

v8:
* improve disas support in Patch 9

v7:
* Fix description for Zca

v6：
* fix base address for jump table in Patch 7
* rebase on riscv-to-apply.next

v5:
* fix exception unwind problem for cpu_ld*_code in helper of cm_jalt

v4:
* improve Zcmp suggested by Richard
* fix stateen related check for Zcmt

v3:
* update the solution for Zcf to the way of Zcd
* update Zcb to reuse gen_load/store
* use trans function instead of helper for push/pop

v2:
* add check for relationship between Zca/Zcf/Zcd with C/F/D based on related discussion in review of Zc* spec
* separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/zcmt

Weiwei Li (9):
  target/riscv: add cfg properties for Zc* extension
  target/riscv: add support for Zca extension
  target/riscv: add support for Zcf extension
  target/riscv: add support for Zcd extension
  target/riscv: add support for Zcb extension
  target/riscv: add support for Zcmp extension
  target/riscv: add support for Zcmt extension
  target/riscv: expose properties for Zc* extension
  disas/riscv.c: add disasm support for Zc*

 disas/riscv.c                             | 228 +++++++++++++++-
 target/riscv/cpu.c                        |  56 ++++
 target/riscv/cpu.h                        |  10 +
 target/riscv/cpu_bits.h                   |   7 +
 target/riscv/csr.c                        |  38 ++-
 target/riscv/helper.h                     |   3 +
 target/riscv/insn16.decode                |  63 ++++-
 target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
 target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
 target/riscv/machine.c                    |  19 ++
 target/riscv/meson.build                  |   3 +-
 target/riscv/translate.c                  |  15 +-
 target/riscv/zce_helper.c                 |  55 ++++
 15 files changed, 834 insertions(+), 16 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
 create mode 100644 target/riscv/zce_helper.c

-- 
2.25.1


