Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDR8O-0006Fi-NS
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 08:17:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDR8D-00068G-Fb; Fri, 28 Jan 2022 08:17:39 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:53782 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDR88-0000dg-AA; Fri, 28 Jan 2022 08:17:35 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXd5jL7PNhJ3MVAA--.49965S2;
 Fri, 28 Jan 2022 21:17:00 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 0/6] support subsets of Float-Point in Integer Registers
 extensions
Date: Fri, 28 Jan 2022 21:16:37 +0800
Message-Id: <20220128131643.13938-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowABXd5jL7PNhJ3MVAA--.49965S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWfXFWktrW3tFyxtr1kKrg_yoW8uw4UpF
 4rG3y3KrZ5JFWfXw4ftF1DAr4YqF4rWrW2ywn7Jwn7Aa13ArW5JF9rK34fu3WxWay8Wry2
 93WUAr13uw47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
X-List-Received-Date: Fri, 28 Jan 2022 13:17:42 -0000

This patchset implements RISC-V Float-Point in Integer Registers extensions(Version 1.0), which includes Zfinx, Zdinx, Zhinx and Zhinxmin extension. 

Specification:
https://github.com/riscv/riscv-zfinx/blob/main/zfinx-1.0.0.pdf

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zfinx-upstream-v5

To test this implementation, specify cpu argument with 'Zfinx =true,Zdinx=true,Zhinx=true,Zhinxmin=true' with 'g=false,f=false,d=false,Zfh=false,Zfhmin=false'
This implementation can pass gcc tests, ci result can be found in https://ci.rvperf.org/job/plct-qemu-zfinx-upstream/.

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
 target/riscv/translate.c                  | 157 +++++++++-
 11 files changed, 982 insertions(+), 372 deletions(-)

-- 
2.17.1


