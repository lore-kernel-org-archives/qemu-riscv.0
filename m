Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgRCs-0007yM-2G
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 10:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgRCq-0007y1-Lj; Sun, 26 Mar 2023 10:18:48 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgRCn-0005D5-Bj; Sun, 26 Mar 2023 10:18:48 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAHDV05VCBkVOZYCg--.64329S2;
 Sun, 26 Mar 2023 22:18:34 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------TN7sg1M7nj7CkvILexHhMImt"
Message-ID: <87d28fb7-df3b-183c-fcac-0e47db3b11a2@iscas.ac.cn>
Date: Sun, 26 Mar 2023 22:18:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, liweiwei@iscas.ac.cn
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
X-CM-TRANSID: zQCowAAHDV05VCBkVOZYCg--.64329S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4ruw1xtw15Ar13GrW8Xrb_yoW5CrW3pr
 yrG3y7AFs5JrZ7Aw4fta1UCry5GF45Wr45A3Z7Zrn5Jw43JrW5Jrs7K347GF1DJFW8Ww12
 k3Wj9343Aw4UJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1g4S7UUUU
 U==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 26 Mar 2023 14:18:49 -0000

This is a multi-part message in MIME format.
--------------TN7sg1M7nj7CkvILexHhMImt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/25 18:54, Richard Henderson wrote:
> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
>
>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
>
>    * Using cpu_mmu_index(env, true) is insufficient to implement
>      HLVX properly.  While that chooses the correct mmu_idx, it
>      does not perform the read with execute permission.
>      I add a new tcg interface to perform a read-for-execute with
>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>      it's closer.
>
>    * Handle mstatus.MPV in cpu_mmu_index.
>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>    * Cleanups for get_physical_address.
>
> While this passes check-avocado, I'm sure that's insufficient.
> Please have a close look.
>
>
> r~
>
>
> Fei Wu (2):
>    target/riscv: Separate priv from mmu_idx
>    target/riscv: Reduce overhead of MSTATUS_SUM change
>
> LIU Zhiwei (4):
>    target/riscv: Extract virt enabled state from tb flags
>    target/riscv: Add a general status enum for extensions
>    target/riscv: Encode the FS and VS on a normal way for tb flags
>    target/riscv: Add a tb flags field for vstart
>
> Richard Henderson (19):
>    target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>    accel/tcg: Add cpu_ld*_code_mmu
>    target/riscv: Use cpu_ld*_code_mmu for HLVX
>    target/riscv: Handle HLV, HSV via helpers
>    target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>    target/riscv: Introduce mmuidx_sum
>    target/riscv: Introduce mmuidx_priv
>    target/riscv: Introduce mmuidx_2stage
>    target/riscv: Move hstatus.spvp check to check_access_hlsv
>    target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>    target/riscv: Check SUM in the correct register
>    target/riscv: Hoist second stage mode change to callers
>    target/riscv: Hoist pbmte and hade out of the level loop
>    target/riscv: Move leaf pte processing out of level loop
>    target/riscv: Suppress pte update with is_debug
>    target/riscv: Don't modify SUM with is_debug
>    target/riscv: Merge checks for reserved pte flags
>    target/riscv: Reorg access check in get_physical_address
>    target/riscv: Reorg sum check in get_physical_address
>
>   include/exec/cpu_ldst.h                       |   9 +
>   target/riscv/cpu.h                            |  47 ++-
>   target/riscv/cpu_bits.h                       |  12 +-
>   target/riscv/helper.h                         |  12 +-
>   target/riscv/internals.h                      |  35 ++
>   accel/tcg/cputlb.c                            |  48 +++
>   accel/tcg/user-exec.c                         |  58 +++
>   target/riscv/cpu.c                            |   2 +-
>   target/riscv/cpu_helper.c                     | 393 +++++++++---------
>   target/riscv/csr.c                            |  21 +-
>   target/riscv/op_helper.c                      | 113 ++++-
>   target/riscv/translate.c                      |  72 ++--
>   .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>   target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>   target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>   target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>   target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>   17 files changed, 595 insertions(+), 395 deletions(-)

This patchset is LGTM.  Patch 16 seems fix a bug in the two_stage 
parameter of raise_mmu_exception

called when translation fails,  it didn't take MPV into consideration in 
original implementation.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>
--------------TN7sg1M7nj7CkvILexHhMImt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/25 18:54, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230325105429.1142530-1-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.

  * Reclaim 5 TB_FLAGS bits, since we nearly ran out.

  * Using cpu_mmu_index(env, true) is insufficient to implement
    HLVX properly.  While that chooses the correct mmu_idx, it
    does not perform the read with execute permission.
    I add a new tcg interface to perform a read-for-execute with
    an arbitrary mmu_idx.  This is still not 100% compliant, but
    it's closer.

  * Handle mstatus.MPV in cpu_mmu_index.
  * Use vsstatus.SUM when required for MMUIdx_S_SUM.
  * Cleanups for get_physical_address.

While this passes check-avocado, I'm sure that's insufficient.
Please have a close look.


r~


Fei Wu (2):
  target/riscv: Separate priv from mmu_idx
  target/riscv: Reduce overhead of MSTATUS_SUM change

LIU Zhiwei (4):
  target/riscv: Extract virt enabled state from tb flags
  target/riscv: Add a general status enum for extensions
  target/riscv: Encode the FS and VS on a normal way for tb flags
  target/riscv: Add a tb flags field for vstart

Richard Henderson (19):
  target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
  accel/tcg: Add cpu_ld*_code_mmu
  target/riscv: Use cpu_ld*_code_mmu for HLVX
  target/riscv: Handle HLV, HSV via helpers
  target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
  target/riscv: Introduce mmuidx_sum
  target/riscv: Introduce mmuidx_priv
  target/riscv: Introduce mmuidx_2stage
  target/riscv: Move hstatus.spvp check to check_access_hlsv
  target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
  target/riscv: Check SUM in the correct register
  target/riscv: Hoist second stage mode change to callers
  target/riscv: Hoist pbmte and hade out of the level loop
  target/riscv: Move leaf pte processing out of level loop
  target/riscv: Suppress pte update with is_debug
  target/riscv: Don't modify SUM with is_debug
  target/riscv: Merge checks for reserved pte flags
  target/riscv: Reorg access check in get_physical_address
  target/riscv: Reorg sum check in get_physical_address

 include/exec/cpu_ldst.h                       |   9 +
 target/riscv/cpu.h                            |  47 ++-
 target/riscv/cpu_bits.h                       |  12 +-
 target/riscv/helper.h                         |  12 +-
 target/riscv/internals.h                      |  35 ++
 accel/tcg/cputlb.c                            |  48 +++
 accel/tcg/user-exec.c                         |  58 +++
 target/riscv/cpu.c                            |   2 +-
 target/riscv/cpu_helper.c                     | 393 +++++++++---------
 target/riscv/csr.c                            |  21 +-
 target/riscv/op_helper.c                      | 113 ++++-
 target/riscv/translate.c                      |  72 ++--
 .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
 target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
 target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
 target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
 17 files changed, 595 insertions(+), 395 deletions(-)</pre>
    </blockquote>
    <p>This patchset is LGTM.  Patch 16 seems fix a bug in the two_stage
      parameter of <span style="color: #000000;">raise_mmu_exception</span></p>
    <p><span style="color: #000000;">called when translation fails</span><span
        style="color: #000000;">,  it didn't take MPV into consideration
        in original implementation.</span><br>
    </p>
    <p>Reviewed-by: Weiwei Li <a class="moz-txt-link-rfc2396E"
        href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a></p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230325105429.1142530-1-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------TN7sg1M7nj7CkvILexHhMImt--


