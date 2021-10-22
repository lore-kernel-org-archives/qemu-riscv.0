Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdpsb-0002xW-B1
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 04:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mdpsZ-0002x4-19; Fri, 22 Oct 2021 04:26:19 -0400
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mdpsV-0003uS-Pi; Fri, 22 Oct 2021 04:26:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07523525|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00944311-0.000403697-0.990153;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.Lg-xofl_1634891162; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lg-xofl_1634891162)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 22 Oct 2021 16:26:03 +0800
Subject: Re: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20211020031709.359469-1-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <17397bbe-7dfe-ac2e-6033-4ab4840a11bd@c-sky.com>
Date: Fri, 22 Oct 2021 16:26:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.101; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-101.mail.aliyun.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Oct 2021 08:26:19 -0000

Hi Richard,

I am implementing the UXL based on this patch set and have a question
about how to process  the PC register.

As the specification said, "PC bits above XLEN are ignored, and when
the PC is written, it is sign-extended to fill the widest supported XLEN."
We still need special process of PC for exceptions or jump instructions.

I have two methods to implement  PC register access,
but not sure which is the right way.

First, normally process the PC register as the specification points.
That means expanding  the PC when setting the global TCGv variable
cpu_pc, and truncating the pc_first and  pc_next fields in
DisasContextBase before decoding instructions.    I am not sure
whether the sign-extended pc is compatible with QEMU common code.

Second,  ignore ignore the PC special process for jump instructions.
Just expand or truncate the PC register when exception processing,
gdb read, or cpu dump registers. It is not a stright way,  but I think 
it is still right.

Hope to get you advice. Thanks very much.

Best Regards,
Zhiwei

On 2021/10/20 上午11:16, Richard Henderson wrote:
> This is a partial patch set attempting to set things in the
> right direction for both the UXL and RV128 patch sets.
>
>
> r~
>
>
> Changes for v6:
>    * Rebase on riscv-to-apply.next.
>
> Changes for v5:
>    * Fix cpu_dump, which asserted for -accel qtest.
>      Instead of filtering CSRs explicitly in cpu_dump,
>      let the riscv_csr_operations predicate do the job.
>      This means we won't dump S-mode registers when RVS
>      is not enabled, much like we currently filter on RVH.
>
> Changes for v4:
>    * Use riscv_csrrw_debug for cpu_dump.
>      This fixes the issue that Alistair pointed out wrt the
>      MSTATUS.SD bit not being correct in the dump; note that
>      gdbstub already uses riscv_csrrw_debug, and so did not
>      have a problem.
>    * Align the registers in cpu_dump.
>
> Changes for v3:
>    * Fix CONFIG_ typo.
>    * Fix ctzw typo.
>    * Mark get_xlen unused (clang werror)
>    * Compute MSTATUS_SD on demand.
>
> Changes for v2:
>    * Set mxl/sxl/uxl at reset.
>    * Set sxl/uxl in write_mstatus.
>
>
> Richard Henderson (15):
>    target/riscv: Move cpu_get_tb_cpu_state out of line
>    target/riscv: Create RISCVMXL enumeration
>    target/riscv: Split misa.mxl and misa.ext
>    target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
>    target/riscv: Add MXL/SXL/UXL to TB_FLAGS
>    target/riscv: Use REQUIRE_64BIT in amo_check64
>    target/riscv: Properly check SEW in amo_op
>    target/riscv: Replace is_32bit with get_xl/get_xlen
>    target/riscv: Replace DisasContext.w with DisasContext.ol
>    target/riscv: Use gen_arith_per_ol for RVM
>    target/riscv: Adjust trans_rev8_32 for riscv64
>    target/riscv: Use gen_unary_per_ol for RVB
>    target/riscv: Use gen_shift*_per_ol for RVB, RVI
>    target/riscv: Use riscv_csrrw_debug for cpu_dump
>    target/riscv: Compute mstatus.sd on demand
>
>   target/riscv/cpu.h                      |  73 +++------
>   target/riscv/cpu_bits.h                 |   8 +-
>   hw/riscv/boot.c                         |   2 +-
>   linux-user/elfload.c                    |   2 +-
>   linux-user/riscv/cpu_loop.c             |   2 +-
>   semihosting/arm-compat-semi.c           |   2 +-
>   target/riscv/cpu.c                      | 195 +++++++++++++-----------
>   target/riscv/cpu_helper.c               |  92 ++++++++++-
>   target/riscv/csr.c                      | 104 ++++++++-----
>   target/riscv/gdbstub.c                  |  10 +-
>   target/riscv/machine.c                  |  10 +-
>   target/riscv/monitor.c                  |   4 +-
>   target/riscv/translate.c                | 174 +++++++++++++++------
>   target/riscv/insn_trans/trans_rvb.c.inc | 140 +++++++++--------
>   target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
>   target/riscv/insn_trans/trans_rvm.c.inc |  36 ++++-
>   target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
>   17 files changed, 576 insertions(+), 351 deletions(-)
>

