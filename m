Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3zSE-0006fg-VU
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 07:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m3zSD-0006fM-9H; Thu, 15 Jul 2021 07:22:57 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:54819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m3zS6-00072S-GE; Thu, 15 Jul 2021 07:22:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1078984|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0852865-0.000618155-0.914095;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.Ki2NHAI_1626348158; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Ki2NHAI_1626348158)
 by smtp.aliyun-inc.com(10.147.42.253);
 Thu, 15 Jul 2021 19:22:39 +0800
Subject: Re: [PATCH 00/17] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
Date: Thu, 15 Jul 2021 19:21:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 15 Jul 2021 11:22:57 -0000


On 2021/7/9 下午12:25, Richard Henderson wrote:
> Replace use of tcg_const_*, which makes a copy into a temp
> which must be freed, with direct use of the constant.
>
> Reorg handling of $zero, with different accessors for
> source and destination.
>
> Reorg handling of csrs, passing the actual write_mask
> instead of a regno.
>
> Use more helpers for RVH expansion.

Hi Richard,

In patch 09-17  target/riscv: Reorg csr instruction,  I think the 
parameter name 'rc'  can be renamed to 'csrno'.

Otherwise,
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Also on a side note, could you give me some advice for the following 
question?

I have been supporting  running 32bit application on qemu-riscv64. After 
this patch set,
it is hard to define a  method,  such as gpr_dst_s or gpr_dst_u, to 
extend the destination
register. I can only extend the destination register(ext32s or ext32u) 
in each instruction
with scattered code.

Can we just omit the extension of the destination register?

Best Regards,
Zhiwei



>
> r~
>
>
> Richard Henderson (17):
>    target/riscv: Use tcg_constant_*
>    target/riscv: Introduce gpr_src, gpr_dst
>    target/riscv: Use gpr_{src,dst} in shift operations
>    target/riscv: Use gpr_{src,dst} in word division operations
>    target/riscv: Use gpr_{src,dst} and tcg_constant_tl in gen_grevi
>    target/riscv: Use gpr_src in branches
>    target/riscv: Use gpr_{src,dst} for integer load/store
>    target/riscv: Use gpr_{src,dst} for word shift operations
>    target/riscv: Reorg csr instructions
>    target/riscv: Use gpr_{src,dst} for RVA
>    target/riscv: Use gpr_{src,dst} for RVB
>    target/riscv: Use gpr_{src,dst} for RVF
>    target/riscv: Use gpr_{src,dst} for RVD
>    target/riscv: Tidy trans_rvh.c.inc
>    target/riscv: Use gen_arith for mulh and mulhu
>    target/riscv: Use gpr_{src,dst} for RVV
>    target/riscv: Remove gen_get_gpr
>
>   target/riscv/helper.h                   |   6 +-
>   target/riscv/insn32.decode              |   1 +
>   target/riscv/op_helper.c                |  18 +-
>   target/riscv/translate.c                | 273 +++++++++-----------
>   target/riscv/insn_trans/trans_rva.c.inc |  42 ++--
>   target/riscv/insn_trans/trans_rvb.c.inc |  11 +-
>   target/riscv/insn_trans/trans_rvd.c.inc | 116 ++++-----
>   target/riscv/insn_trans/trans_rvf.c.inc | 134 ++++------
>   target/riscv/insn_trans/trans_rvh.c.inc | 264 ++++---------------
>   target/riscv/insn_trans/trans_rvi.c.inc | 322 ++++++++++++++----------
>   target/riscv/insn_trans/trans_rvm.c.inc |  24 +-
>   target/riscv/insn_trans/trans_rvv.c.inc | 144 ++++-------
>   12 files changed, 534 insertions(+), 821 deletions(-)
>

