Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5ch-0000Fz-UA
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5ca-0008Jp-9e; Fri, 22 Apr 2022 22:35:40 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39776 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cW-00057v-9s; Fri, 22 Apr 2022 22:35:39 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S2;
 Sat, 23 Apr 2022 10:35:23 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 00/14] support subsets of scalar crypto extension
Date: Sat, 23 Apr 2022 10:34:56 +0800
Message-Id: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy7KryDuw1kKrWUuw1UGFg_yoWrCw4Upr
 4rC3y5CrZ8J397Gryfta18Ar15Ja1rWrW5XwnrJ34kJ39xJrWrJFZak3WYkF1UJF18ur12
 93Wjkr13ua1UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 fUoOJ5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:40 -0000

This patchset implements RISC-V scalar crypto extension v1.0.0 version instructions.
Partial instructions are reused from B-extension.

Specification:
https://github.com/riscv/riscv-crypto

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v12

To test rvk implementation, specify cpu argument with 'zks=true,zkn=true' or "zbkb=true,zbkc=true,zbkx=true,zknd=true,zkne=true,zknh=true,zksed=true,zksh=true,zkr=true" to enable K-extension support. This implementation can pass the ACT tests for K with our extended act support for qemu (available at https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v12-with-act)

Review status:
patch 5 is reviewed by Philippe Mathieu-Daudé
patch 1~14 are acked or reviewed by Alistair Francis
patch 2~11 are reviewed by Richard Henderson (fix new comments on patch 6 and 7)

v12:
* rebase on master and riscv-to-apply.next

v11:
* patch 6: add REQUIRE_32BIT to trans_* function for aes RV32 instruction
* patch 7: add REQUIRE_64BIT to trans_* function for aes RV64 instruction

v10:
(only patch 12 is modified)
* simplify the conditions for the check in seed function
* add NULL check for ret_val in rmw_seed function
* remain the change of MSECCFG_* to align with the added MSECCFG_*SEED

v9:
* check whether seed is accessed by a read-write instruction in helper_csrr.
* fix disas for partial scalar crypto instructions
* rebase on https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00156.html

v8:
* replace large macro for trans function of sha256/512 instructions with parameters to gen_sha* function in patch 8,9,10
* fix tcg_const_tl to tcg_constant_tl
* fix rmw_seed function

v7:
* reuse gen_unary/gen_arith to simplify trans_* functions
* replace DEF_HELPER_* with DEF_HEPER_FLAG_*
* move aes64 related macros from patch 6 to patch 7
* create common helper gen_aes32_sm4 for aes32 and sm4 related instructions
* replace bs with shamt (bs << 3)
* optimize trans function for sha256, sha512 and sm4 instructions to be generated inline

v6:
* add reviewed-by tags
* rebase on upstream

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
 disas/riscv.c                           | 173 ++++++++++-
 include/crypto/sm4.h                    |   6 +
 target/arm/crypto_helper.c              |  36 +--
 target/riscv/bitmanip_helper.c          |  80 +++++
 target/riscv/cpu.c                      |  36 +++
 target/riscv/cpu.h                      |  13 +
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/crypto_helper.c            | 302 ++++++++++++++++++
 target/riscv/csr.c                      |  80 +++++
 target/riscv/helper.h                   |  22 ++
 target/riscv/insn32.decode              |  97 ++++--
 target/riscv/insn_trans/trans_rvb.c.inc | 116 ++++++-
 target/riscv/insn_trans/trans_rvk.c.inc | 391 ++++++++++++++++++++++++
 target/riscv/meson.build                |   3 +-
 target/riscv/op_helper.c                |   9 +
 target/riscv/pmp.h                      |   8 +-
 target/riscv/translate.c                |   8 +
 19 files changed, 1368 insertions(+), 71 deletions(-)
 create mode 100644 crypto/sm4.c
 create mode 100644 include/crypto/sm4.h
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

-- 
2.17.1


