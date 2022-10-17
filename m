Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okF4Z-00076G-0d
	for mharc-qemu-riscv@gnu.org; Sun, 16 Oct 2022 21:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1okF4X-00075w-Ts; Sun, 16 Oct 2022 21:37:41 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:33728 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1okF4V-0001y2-8M; Sun, 16 Oct 2022 21:37:41 -0400
Received: from [192.168.124.8] (unknown [139.227.114.201])
 by APP-01 (Coremail) with SMTP id qwCowAC3VmjUsUxjk_LEBQ--.1216S2;
 Mon, 17 Oct 2022 09:37:26 +0800 (CST)
Message-ID: <700b21aa-df1b-6bd1-d560-e12a19f996d6@iscas.ac.cn>
Date: Mon, 17 Oct 2022 09:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v11 3/5] target/riscv: generate virtual instruction
 exception
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-4-mchitale@ventanamicro.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20221016124726.102129-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAC3VmjUsUxjk_LEBQ--.1216S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW5uw1rCrWftw1kZrWUurg_yoW8WFyxpF
 4jkr12krZ5XF9xua9rGan0vr13Jw4kKr4xGwn29w4FqrsavrnYvF1DKFZxKF4kJF4kWrWa
 vFs0yryUur4jvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUU
 UUU
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 17 Oct 2022 01:37:42 -0000


On 2022/10/16 20:47, Mayuresh Chitale wrote:
> This patch adds a mechanism to generate a virtual instruction
> instruction exception instead of an illegal instruction exception
> during instruction decode when virt is enabled.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/translate.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..8b0bd38bb2 100644
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
> @@ -1062,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>       };
>   
> +    ctx->virt_inst_excp = false;
>       /* Check for compressed insn */
>       if (insn_len(opcode) == 2) {
>           if (!has_ext(ctx, RVC)) {
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Regards,
Weiwei Li


