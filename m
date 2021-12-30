Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2wTQ-0000WM-0t
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 09:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTF-0000Hd-TE; Thu, 30 Dec 2021 09:31:57 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:55250 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTA-0004AW-Nk; Thu, 30 Dec 2021 09:31:57 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHzFjJws1h4_TqBA--.24839S2;
 Thu, 30 Dec 2021 22:31:38 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/7] support subsets of scalar crypto extension
Date: Thu, 30 Dec 2021 22:30:51 +0800
Message-Id: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowADHzFjJws1h4_TqBA--.24839S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4DAr45Cr1UJFyDuw1kuFg_yoW8KryDpr
 4rG3y3Gry5Ja9Fkw4ftF18Ar15Xr4rur43Jws3Awn7J3y3ArWrJrsakw13CFnrXF18Wr12
 g3WUCw1fuw4UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 14:31:58 -0000

This patchset implements RISC-V K-extension v1.0.0.rc6 version instructions. 
Partial instructions are reused from B-extension.

Specification:
https://github.com/riscv/riscv-crypto

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v3

To test rvk implementation,  specify cpu argument with 'x-zks=true,x-zkn=true'  
or 
"x-zbkb=true,x-zbkc=true,x-zbkx=true,x-zknd=true,x-zkne=true,x-zknh=true,x-zksed=true,x-zksh=true,x-zkr=true"
 to enable  K-extension support.  This implementation can pass the ACT tests 
for K with our extended act support for qemu (available at 
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v3-with-act)

v3:
* add extension check for SEED csr access

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
 crypto/sm4.c                            |  48 +++
 disas/riscv.c                           | 171 ++++++++-
 include/crypto/sm4.h                    |   6 +
 meson                                   |   2 +-
 target/arm/crypto_helper.c              |  36 +-
 target/riscv/bitmanip_helper.c          |  74 ++++
 target/riscv/cpu.c                      |  36 ++
 target/riscv/cpu.h                      |  13 +
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
 target/riscv/csr.c                      |  73 ++++
 target/riscv/helper.h                   |  48 +++
 target/riscv/insn32.decode              |  94 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc | 127 ++++++-
 target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/pmp.h                      |   8 +-
 target/riscv/translate.c                |   8 +
 19 files changed, 1597 insertions(+), 71 deletions(-)
 create mode 100644 crypto/sm4.c
 create mode 100644 include/crypto/sm4.h
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

-- 
2.17.1


