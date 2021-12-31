Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n38Wf-0002ls-Vh
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 22:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n38WX-0002gC-Vk; Thu, 30 Dec 2021 22:24:12 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:34156 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n38WS-0000n0-EY; Thu, 30 Dec 2021 22:24:08 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAD3_i7Id85hSArwBA--.31043S2;
 Fri, 31 Dec 2021 11:23:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Fri, 31 Dec 2021 11:23:31 +0800
Message-Id: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowAD3_i7Id85hSArwBA--.31043S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW3tryfCrW5CrW8Ar1fWFg_yoW8ArW7pr
 4fG3y3KrZ5JFWfXw4ftF4qyw15Xr4rWwsrAwn7Jwn7Aw43ArW5JF1DKw1fW3W8Ja48Wr9F
 9F1UCr13uw4UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
 6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
 uYvjfUoOJ5UUUUU
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
X-List-Received-Date: Fri, 31 Dec 2021 03:24:13 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0.0-rc), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0-rc.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v2

To test this implementation, specify cpu argument with 'Zfinx =true,Zdinx=true,Zhinx=true,Zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/

v2:
* hardwire mstatus.FS to zero when enable zfinx
* do register-pair check at the begin of translation
* optimize partial implemention as suggested 

liweiwei (6):
  target/riscv: add cfg properties for zfinx, zdinx and zhinx{min}
  target/riscv: hardwire mstatus.FS to zero when enable zfinx
  target/riscv: add support for zfinx
  target/riscv: add support for zdinx
  target/riscv: add support for zhinx/zhinxmin
  target/riscv: expose zfinx, zdinx, zhinx{min} properties

 target/riscv/cpu.c                        |  20 ++
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_helper.c                 |   6 +-
 target/riscv/csr.c                        |  24 +-
 target/riscv/fpu_helper.c                 | 178 ++++++------
 target/riscv/helper.h                     |   4 +-
 target/riscv/insn_trans/trans_rvd.c.inc   | 319 ++++++++++++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc   | 314 +++++++++++++-------
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
 target/riscv/internals.h                  |  32 ++-
 target/riscv/translate.c                  | 161 +++++++++++
 11 files changed, 1023 insertions(+), 371 deletions(-)

-- 
2.17.1


