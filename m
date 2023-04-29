Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psZDo-00070u-4Y
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 21:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psZDm-00070g-Kl; Fri, 28 Apr 2023 21:17:54 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psZDj-0000f2-ON; Fri, 28 Apr 2023 21:17:54 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowAD3_JwtcExkPxOdDA--.13489S2;
 Sat, 29 Apr 2023 09:17:33 +0800 (CST)
Message-ID: <2080f38b-59ad-cb5b-02ee-f78f12a75414@iscas.ac.cn>
Date: Sat, 29 Apr 2023 09:17:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 2/4] target/riscv: Reuse tb->flags.FS
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
 <20230428165212.2800669-3-mchitale@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230428165212.2800669-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAD3_JwtcExkPxOdDA--.13489S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4xuFWxtrWxKF1xuryDJrb_yoW5WF1kpr
 Z7Cr4ayFWDJFZrAa1fKF45JF1xur48Cr1fC3Z7Cw18Wrs8Xr95C3srKa43GF4DXFW8uryj
 kFs0kr1UuF47ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfUOMKZDUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Apr 2023 01:17:55 -0000


On 2023/4/29 00:52, Mayuresh Chitale wrote:
> When misa.F is 0 tb->flags.FS field is unused and can be used to save
> the current state of smstateen0.FCSR check which is needed by the
> floating point translation routines.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu_helper.c |  9 +++++++++
>   target/riscv/translate.c  | 12 +++++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b68dcfe7b6..126ac221a0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -119,6 +119,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
>       }
>   
> +    /*
> +     * If misa.F is 0 then the FS field of the tb->flags can be used to pass
> +     * the current state of the smstateen.FCSR bit which must be checked for
> +     * in the floating point translation routines.
> +     */
> +    if (!riscv_has_ext(env, RVF)) {
> +        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE);
> +    }
> +
>       if (cpu->cfg.debug && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 928da0d3f0..74f624aa62 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -78,6 +78,7 @@ typedef struct DisasContext {
>       int frm;
>       RISCVMXL ol;
>       bool virt_inst_excp;
> +    bool smstateen_fcsr_ok;
>       bool virt_enabled;
>       const RISCVCPUConfig *cfg_ptr;
>       /* vector extension */
> @@ -1155,7 +1156,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->pc_succ_insn = ctx->base.pc_first;
>       ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
> -    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    if (has_ext(ctx, RVF)) {
> +        ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    } else {
> +        ctx->mstatus_fs = 0;
> +    }
>       ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
>       ctx->priv_ver = env->priv_ver;
>       ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
> @@ -1178,6 +1183,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>       ctx->zero = tcg_constant_tl(0);
>       ctx->virt_inst_excp = false;
> +    if (has_ext(ctx, RVF) || !cpu->cfg.ext_smstateen) {
> +        ctx->smstateen_fcsr_ok = 1;
> +    } else {
> +        ctx->smstateen_fcsr_ok = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    }
>   }
>   
>   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)


