Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nINk9-0002Dc-TB
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 23:41:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nINjR-00022S-Mn; Thu, 10 Feb 2022 23:40:30 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:36160 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nINip-0005n4-Is; Thu, 10 Feb 2022 23:40:09 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAA3PvqN6AViFBirAA--.58859S2;
 Fri, 11 Feb 2022 12:39:42 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Fri, 11 Feb 2022 12:39:14 +0800
Message-Id: <20220211043920.28981-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAA3PvqN6AViFBirAA--.58859S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW3try5Cr1fAr4kZFW8JFb_yoW8tF1xpF
 4rG3y3trZ5JFWfXw4ftF1UAr4YqF4rW3y2ywn7Jwn7Aw43ArW5JFZ7Kw1fu3WxGay8Wry2
 93WUAr13uw4UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 fUoOJ5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Feb 2022 04:40:31 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v6

To test this implementation, specify cpu argument with 'zfinx =true,zdinx=true,zhinx=true,zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.

v6:
* rename flags Z*inx to z*inx
* rebase on apply-to-riscv.next

v5:
* put definition of ftemp and nftemp together, add comments for them
* sperate the declare of variable i from loop 

v4:
* combine register pair check for rv32 zdinx
* clear mstatus.FS when RVF is disabled by write_misa

v3:
* delete unused reset for mstatus.FS
* use positive test for RVF instead of negative test for ZFINX
* replace get_ol with get_xl
* use tcg_gen_concat_tl_i64 to unify tcg_gen_concat_i32_i64 and tcg_gen_deposit_i64

v2:
* hardwire mstatus.FS to zero when enable zfinx
* do register-pair check at the begin of translation
* optimize partial implemention as suggested

Weiwei Li (6):
  target/riscv: add cfg properties for zfinx, zdinx and zhinx{min}
  target/riscv: hardwire mstatus.FS to zero when enable zfinx
  target/riscv: add support for zfinx
  target/riscv: add support for zdinx
  target/riscv: add support for zhinx/zhinxmin
  target/riscv: expose zfinx, zdinx, zhinx{min} properties

 target/riscv/cpu.c                        |  17 ++
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_helper.c                 |   6 +-
 target/riscv/csr.c                        |  25 +-
 target/riscv/fpu_helper.c                 | 178 ++++++------
 target/riscv/helper.h                     |   4 +-
 target/riscv/insn_trans/trans_rvd.c.inc   | 285 ++++++++++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc   | 314 +++++++++++++-------
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
 target/riscv/internals.h                  |  32 ++-
 target/riscv/translate.c                  | 149 +++++++++-
 11 files changed, 974 insertions(+), 372 deletions(-)

-- 
2.17.1


