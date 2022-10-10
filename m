Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohu4Z-0008GT-UC
	for mharc-qemu-riscv@gnu.org; Mon, 10 Oct 2022 10:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ohu4U-0008DJ-0K; Mon, 10 Oct 2022 10:47:58 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:37478 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ohu4R-0000Ad-2c; Mon, 10 Oct 2022 10:47:57 -0400
Received: from [192.168.124.8] (unknown [139.227.114.201])
 by APP-05 (Coremail) with SMTP id zQCowAA3PraRMERj0lsmBA--.27396S2;
 Mon, 10 Oct 2022 22:47:45 +0800 (CST)
Message-ID: <773a30ca-66e3-471c-a4c8-1d48f97d72de@iscas.ac.cn>
Date: Mon, 10 Oct 2022 22:47:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v10 3/5] target/riscv: generate virtual instruction
 exception
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
 <20221003114718.30659-4-mchitale@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20221003114718.30659-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3PraRMERj0lsmBA--.27396S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWrGw17tr47tF4UGrWfZrb_yoW8uFy3pF
 4jkry3Kr98XFy3uFZ7JFs0qr17Jw4kKr48Awn29w4rtrsxXrs0kF1DKrWakF4DZrs2gF42
 vFs0yryUuF12vrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWCJPUUUU
 U==
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
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
X-List-Received-Date: Mon, 10 Oct 2022 14:47:58 -0000


On 2022/10/3 19:47, Mayuresh Chitale wrote:
> This patch adds a mechanism to generate a virtual instruction
> instruction exception instead of an illegal instruction exception
> during instruction decode when virt is enabled.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/translate.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..6926b639de 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -76,6 +76,7 @@ typedef struct DisasContext {
>          to reset this known value.  */
>       int frm;
>       RISCVMXL ol;
> +    bool virt_inst_excp;
>       bool virt_enabled;
>       const RISCVCPUConfig *cfg_ptr;
>       bool hlsx;
> @@ -243,7 +244,11 @@ static void gen_exception_illegal(DisasContext *ctx)
>   {
>       tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
>                      offsetof(CPURISCVState, bins));
> -    generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> +    if (ctx->virt_inst_excp) {
> +        generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> +    }
>   }
>   
>   static void gen_exception_inst_addr_mis(DisasContext *ctx)
> @@ -1067,6 +1072,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           if (!has_ext(ctx, RVC)) {
>               gen_exception_illegal(ctx);

I think we should also set virt_inst_excp to false before this gen_exception_illegal.

By the way, why not just put  "ctx->virt_inst_excp = false;" at the 
begin of the decode_opc?

Regards,

Weiwei Li

>           } else {
> +            ctx->virt_inst_excp = false;
>               ctx->opcode = opcode;
>               ctx->pc_succ_insn = ctx->base.pc_next + 2;
>               if (decode_insn16(ctx, opcode)) {
> @@ -1078,6 +1084,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           opcode32 = deposit32(opcode32, 16, 16,
>                                translator_lduw(env, &ctx->base,
>                                                ctx->base.pc_next + 2));
> +        ctx->virt_inst_excp = false;
>           ctx->opcode = opcode32;
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
>   


