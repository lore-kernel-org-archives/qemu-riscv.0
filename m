Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhu0l-0000eO-VX
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 09:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEN-00031o-Js; Mon, 01 Nov 2021 23:13:00 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:34804 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEI-0004mj-VC; Mon, 01 Nov 2021 23:12:59 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2qrIBh7YkSBg--.46962S2;
 Tue, 02 Nov 2021 11:12:43 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: luruibo2000@163.com, lustrew@foxmail.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Subject: [RFC 0/6] support subsets of scalar crypto extension
Date: Tue,  2 Nov 2021 11:11:22 +0800
Message-Id: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAC3mO2qrIBh7YkSBg--.46962S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4DCFWftF43Wr1kZw1xuFg_yoW8ZFWxpF
 4rC3y5Cr98Ja9Fkw4ftF1UAr45Xr4rWr4fJwn3Jwn5t3y5ArW3Jrn7Kw13AF1DJF18Wr1I
 93Wjkr1fCw45AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
 7VUbXdbUUUUUU==
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
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:39:14 -0400
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
X-List-Received-Date: Tue, 02 Nov 2021 03:13:00 -0000

This patchset implements RISC-V K-extension v1.0.0.rc5 version instructions. Partial instructions are reused from B-extension.

Specification:
https://github.com/riscv/riscv-crypto

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-k-upstream

To test rvk implementation,  specify cpu argument with 'x-zks=true,x-zkn=true'  or "x-zbkb=true,x-zbkc=true,x-zbkx=true,x-zknd=true,x-zkne=true,x-zknh=true,x-zksed=true,x-zksh=true,x-zkr=true" to enable  K-extension support.  This implementation can pass the ACT tests for K with our extended act support for qemu (available at https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-with-act)

liweiwei (6):
  target/riscv: rvk: add flag support for Zbk[bcx]
  target/riscv: rvk: add implementation of instructions for Zbk*  -
    reuse partial instructions of Zbb/Zbc extensions  - add brev8 packh,
    unzip, zip, etc.
  target/riscv: rvk: add flag support for
    Zk/Zkn/Zknd/Zknd/Zkne/Zknh/Zks/Zksed/Zksh/Zkr
  target/riscv: rvk: add implementation of instructions for Zk*
  target/riscv: rvk: add CSR support for Zkr:  - add SEED CSR  - add
    USEED, SSEED fields for MSECCFG CSR
  disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions

 disas/riscv.c                           | 171 +++++++-
 target/riscv/bitmanip_helper.c          |  94 +++++
 target/riscv/cpu.c                      |  45 +-
 target/riscv/cpu.h                      |  12 +
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/crypto_helper.c            | 540 ++++++++++++++++++++++++
 target/riscv/csr.c                      |  66 +++
 target/riscv/helper.h                   |  47 +++
 target/riscv/insn32.decode              |  94 ++++-
 target/riscv/insn_trans/trans_rvb.c.inc |  91 +++-
 target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/pmp.h                      |   8 +-
 target/riscv/translate.c                |  83 ++++
 14 files changed, 1690 insertions(+), 38 deletions(-)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

-- 
2.17.1


