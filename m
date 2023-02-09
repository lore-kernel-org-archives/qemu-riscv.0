Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPyKV-00013P-SW
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 23:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKU-00012t-Ow; Wed, 08 Feb 2023 23:14:38 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKR-0002WF-Kl; Wed, 08 Feb 2023 23:14:38 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAAnJkIfc+RjuUgtBA--.61796S2;
 Thu, 09 Feb 2023 12:14:24 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 0/9] support subsets of code size reduction extension
Date: Thu,  9 Feb 2023 12:13:43 +0800
Message-Id: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnJkIfc+RjuUgtBA--.61796S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWktF4DJrWkAr4fJr4Dtwb_yoW5Wryrpr
 WrCayakrZ8tFyxJw4Sq3WUJw15AFs5Wr45Awn7Jw1kGa13ArW3Jrs7K3W3G3WxJF1rWrnF
 93WUCw13u3yUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 04:14:39 -0000

This patchset implements RISC-V Zc* extension v1.0.2-1 version instructions.

Specification:
https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v11

To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extensions support.


This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test

v11
* update format and field name based on the latest spec in patch 5, 6, 7 (without other functional changes)
* rebase on riscv-to-apply.next

v10:
* rebase on Daniel's series(riscv-to-apply.next) and adjust riscv-tests to test on sifive related CPUs

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
 target/riscv/insn16.decode                |  62 ++++-
 target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
 target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
 target/riscv/machine.c                    |  19 ++
 target/riscv/meson.build                  |   3 +-
 target/riscv/translate.c                  |  15 +-
 target/riscv/zce_helper.c                 |  55 ++++
 15 files changed, 833 insertions(+), 16 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
 create mode 100644 target/riscv/zce_helper.c

-- 
2.25.1


