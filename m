Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7pGx-0003LL-9w
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 20:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGm-00038S-TP; Wed, 12 Jan 2022 20:51:16 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:48588 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGj-0000iP-R7; Wed, 12 Jan 2022 20:51:16 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABXXwODhd9hljodBg--.33470S2;
 Thu, 13 Jan 2022 09:51:00 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Thu, 13 Jan 2022 09:49:53 +0800
Message-Id: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowABXXwODhd9hljodBg--.33470S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWDZFyxXry8Cr43tr1fZwb_yoW8Zw4rpF
 4rG3y3trZ5JFWfXw4ftF1DAw4YqF4rW3y2ywn7Jwn7Aa13ArW5JFnrKw1fu3WxJay8Wry2
 93WUAr13uw4UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
 6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
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
X-List-Received-Date: Thu, 13 Jan 2022 01:51:17 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v4

To test this implementation, specify cpu argument with 'Zfinx =true,Zdinx=true,Zhinx=true,Zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.

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
 target/riscv/translate.c                  | 154 ++++++++++
 11 files changed, 980 insertions(+), 371 deletions(-)

-- 
2.17.1


