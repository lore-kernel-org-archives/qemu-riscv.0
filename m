Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9IN-0001NG-HK
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IF-0001Hf-Ub; Wed, 19 Jan 2022 06:38:25 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60214 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IC-0002HI-EJ; Wed, 19 Jan 2022 06:38:23 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S2;
 Wed, 19 Jan 2022 19:38:09 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 00/14] support subsets of scalar crypto extension
Date: Wed, 19 Jan 2022 19:37:40 +0800
Message-Id: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy7KryftrWDtF1rXF48Xrb_yoW5WFy7pr
 4rG3yakrZ8J39rGryft3W8Ar45Xr4rWr4fJwn3tw1kJ3y3JrWrJrZaka43CF1UJF18Wry2
 93WUCr13uw4UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 11:38:25 -0000

This patchset implements RISC-V scalar crypto extension v1.0.0 version instructions. 
Partial instructions are reused from B-extension.

Specification:
https://github.com/riscv/riscv-crypto

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v5

To test rvk implementation,  specify cpu argument with 'zks=true,zkn=true'  
or 
"zbkb=true,zbkc=true,zbkx=true,zknd=true,zkne=true,zknh=true,zksed=true,zksh=true,zkr=true" to enable  K-extension support.  This implementation can pass the ACT tests 
for K with our extended act support for qemu (available at 
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v5-with-act)

v5:
* split the big patches

v4:
* drop "x-" in exposed properties
* delete unrelated changes

v3:
* add extension check for SEED csr access

v2:
* optimize implementation for brev8, xperm, zip, unzip
* use aes related sbox array from crypto/aes.h
* move sm4_sbox to crypto/sm4.c, and share it with target/arm

Weiwei Li (14):
  target/riscv: rvk: add cfg properties for zbk* and zk*
  target/riscv: rvk: add support for zbkb extension
  target/riscv: rvk: add support for zbkc extension
  target/riscv: rvk: add support for zbkx extension
  crypto: move sm4_sbox from target/arm
  target/riscv: rvk: add support for zknd/zkne extension in RV32
  target/riscv: rvk: add support for zkne/zknd extension in RV64
  target/riscv: rvk: add support for sha256 related instructions in zknh
    extension
  target/riscv: rvk: add support for sha512 related instructions for
    RV32 in zknh extension
  target/riscv: rvk: add support for sha512 related instructions for
    RV64 in zknh extension
  target/riscv: rvk: add support for zksed/zksh extension
  target/riscv: rvk: add CSR support for Zkr
  disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
  target/riscv: rvk: expose zbk* and zk* properties

 crypto/meson.build                      |   1 +
 crypto/sm4.c                            |  49 +++
 disas/riscv.c                           | 170 +++++++++
 include/crypto/sm4.h                    |   6 +
 target/arm/crypto_helper.c              |  36 +-
 target/riscv/bitmanip_helper.c          |  80 ++++
 target/riscv/cpu.c                      |  36 ++
 target/riscv/cpu.h                      |  13 +
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/crypto_helper.c            | 443 ++++++++++++++++++++++
 target/riscv/csr.c                      |  64 ++++
 target/riscv/helper.h                   |  42 +++
 target/riscv/insn32.decode              |  94 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc | 137 ++++++-
 target/riscv/insn_trans/trans_rvk.c.inc | 472 ++++++++++++++++++++++++
 target/riscv/meson.build                |   3 +-
 target/riscv/pmp.h                      |   8 +-
 target/riscv/translate.c                |   8 +
 18 files changed, 1601 insertions(+), 70 deletions(-)
 create mode 100644 crypto/sm4.c
 create mode 100644 include/crypto/sm4.h
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

-- 
2.17.1


