Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pi80u-0002lm-M6
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 02:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pi80s-0002iG-AM; Fri, 31 Mar 2023 02:13:26 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pi80p-0008Tb-6Z; Fri, 31 Mar 2023 02:13:26 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vf185Xn_1680243191; 
Received: from 30.221.97.117(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vf185Xn_1680243191) by smtp.aliyun-inc.com;
 Fri, 31 Mar 2023 14:13:11 +0800
Message-ID: <5a9ba0aa-ef0c-eeeb-9676-b5c9d3ed98ff@linux.alibaba.com>
Date: Fri, 31 Mar 2023 14:13:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/5] target/riscv: Sync cpu_pc before update badaddr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-4-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230329032346.55185-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 31 Mar 2023 06:13:26 -0000


On 2023/3/29 11:23, Weiwei Li wrote:
> We should sync cpu_pc before storing it into badaddr when mis-aligned
> exception is triggered.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 1 +
>   target/riscv/translate.c                | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 4ad54e8a49..05d8b5d57f 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -171,6 +171,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   
>       if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>           /* misaligned */
> +        gen_set_pc_imm(ctx, ctx->base.pc_next + a->imm);

target_ulong next_pc = ctx->base.pc_next + a->imm;

gen_set_pc_imm(ctx, next_pc);

>           gen_exception_inst_addr_mis(ctx);
>       } else {
>           gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..f7ddf4c50d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -551,6 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>       next_pc = ctx->base.pc_next + imm;
>       if (!has_ext(ctx, RVC)) {
>           if ((next_pc & 0x3) != 0) {
> +            gen_set_pc_imm(ctx, next_pc);

I think this patch is better than it in v6.  So this patch,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>               gen_exception_inst_addr_mis(ctx);
>               return;
>           }

