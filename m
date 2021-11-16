Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmtV6-0007Ba-Rw
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 03:07:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUp-00079x-Ov; Tue, 16 Nov 2021 03:07:19 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:54550 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUm-00039l-1l; Tue, 16 Nov 2021 03:07:15 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2hZpNhU9VmBw--.50016S2;
 Tue, 16 Nov 2021 16:06:58 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v2 0/7] support subsets of scalar crypto extension
Date: Tue, 16 Nov 2021 16:06:14 +0800
Message-Id: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAC3mO2hZpNhU9VmBw--.50016S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4DAr45Cr1UJFyDuw1kuFg_yoW8tw4UpF
 4rG3y3Gry5Ja9Fkw4ftF18Ar15Xr4rur43Jws3Awn7J3y3ArWfJrsakw13CFnrXF18Wr12
 g3WUCw1fuw4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UZa9-UUUUU=
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
X-List-Received-Date: Tue, 16 Nov 2021 08:07:21 -0000

This patchset implements RISC-V K-extension v1.0.0.rc6 version instructions. 
Partial instructions are reused from B-extension.

Specification:
https://github.com/riscv/riscv-crypto

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v2

To test rvk implementation,  specify cpu argument with 'x-zks=true,x-zkn=true'  
or 
"x-zbkb=true,x-zbkc=true,x-zbkx=true,x-zknd=true,x-zkne=true,x-zknh=true,x-zksed=true,x-zksh=true,x-zkr=true"
 to enable  K-extension support.  This implementation can pass the ACT tests 
for K with our extended act support for qemu (available at 
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v2-with-act)

v2:
* optimize implementation for brev8, xperm, zip, unzip
* use aes related sbox array from crypto/aes.h
* move sm4_sbox to crypto/sm4.c, and share it with target/arm

liweiwei (7):
  target/riscv: rvk: add cfg properties for zbk* and zk*
  target/riscv: rvk: add implementation of instructions for Zbk*
  crypto include/crypto target/arm: move sm4_sbox to crypto
  target/riscv: rvk: add implementation of instructions for Zk*
  target/riscv: rvk: add CSR support for Zkr
  disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
  target/riscv: rvk: expose zbk* and zk* properties

 crypto/meson.build                      |   1 +
 crypto/sm4.c                            |  37 ++
 disas/riscv.c                           | 171 ++++++++-
 include/crypto/sm4.h                    |   6 +
 meson                                   |   2 +-
 target/arm/crypto_helper.c              |  36 +-
 target/riscv/bitmanip_helper.c          |  74 ++++
 target/riscv/cpu.c                      |  36 ++
 target/riscv/cpu.h                      |  13 +
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
 target/riscv/csr.c                      |  70 ++++
 target/riscv/helper.h                   |  48 +++
 target/riscv/insn32.decode              |  94 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc | 127 ++++++-
 target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/pmp.h                      |   8 +-
 target/riscv/translate.c                |   8 +
 19 files changed, 1583 insertions(+), 71 deletions(-)
 create mode 100644 crypto/sm4.c
 create mode 100644 include/crypto/sm4.h
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

-- 
2.17.1


