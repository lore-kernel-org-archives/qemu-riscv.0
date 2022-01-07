Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5nQ0-0004yu-Fv
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 06:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPy-0004sY-JC; Fri, 07 Jan 2022 06:28:22 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:54262 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPu-0006V9-1k; Fri, 07 Jan 2022 06:28:22 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3fS3CI9hh_s5CBQ--.4982S2;
 Fri, 07 Jan 2022 19:28:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Fri,  7 Jan 2022 19:27:43 +0800
Message-Id: <20220107112749.981-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowAB3fS3CI9hh_s5CBQ--.4982S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW3tryfCrW5CrW8Ar1fWFg_yoW8Zr4kpF
 4rGw43KrZ5JFWfXw4ftF1qyw45XF4rW3yjywn7Jwn7Aa13ArW5JFnrKw1fW3W8Jay8Wry2
 93WUAr13ur4UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
 a9aPUUUUU==
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
X-List-Received-Date: Fri, 07 Jan 2022 11:28:22 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0.0-rc), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0-rc.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v3

To test this implementation, specify cpu argument with 'Zfinx =true,Zdinx=true,Zhinx=true,Zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.

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

 target/riscv/cpu.c                        |  16 ++
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_helper.c                 |   6 +-
 target/riscv/csr.c                        |  21 +-
 target/riscv/fpu_helper.c                 | 178 ++++++------
 target/riscv/helper.h                     |   4 +-
 target/riscv/insn_trans/trans_rvd.c.inc   | 319 ++++++++++++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc   | 314 +++++++++++++-------
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
 target/riscv/internals.h                  |  32 ++-
 target/riscv/translate.c                  | 155 ++++++++++
 11 files changed, 1010 insertions(+), 371 deletions(-)

-- 
2.17.1


