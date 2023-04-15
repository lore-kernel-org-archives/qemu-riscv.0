Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnUVm-0001sI-Tv
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 21:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pnUVl-0001qw-MA; Fri, 14 Apr 2023 21:15:29 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pnUVi-0005Ha-TA; Fri, 14 Apr 2023 21:15:29 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowADn7kKk+jlkDBbAEg--.11411S2;
 Sat, 15 Apr 2023 09:15:17 +0800 (CST)
Message-ID: <3690a23f-25b3-3e62-4412-9c9c867031aa@iscas.ac.cn>
Date: Sat, 15 Apr 2023 09:15:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH v2 2/4] target/riscv: Reuse TB_FLAGS.MSTATUS_HFS_FS
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-3-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230414160202.1298242-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn7kKk+jlkDBbAEg--.11411S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1rWF1kZw1fKw4UKr45Jrb_yoW8Kw4DpF
 s7Gw4SkFZrGFZrJa1fKF4YqF1xWr4kCr45uwn7Cw10qrs0qrZ5CF97KFW3GFs8JFy8Wryj
 vF4YkryUAr4UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUU
 U==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 15 Apr 2023 01:15:30 -0000


On 2023/4/15 00:02, Mayuresh Chitale wrote:
> When misa.F is clear, TB_FLAGS.MSTATUS_HS_FS field is unused and can
> be used to save the current state of smstateen0.FCSR check which is
> needed by the floating point translation routines.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c | 12 ++++++++++++
>   target/riscv/translate.c  |  7 +++++++
>   2 files changed, 19 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 433ea529b0..fd1731cc39 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -105,6 +105,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>                              get_field(env->mstatus_hs, MSTATUS_VS));
>       }
> +    /*
> +     * If misa.F is 0 then the MSTATUS_HS_FS field of the tb->flags
> +     * can be used to pass the current state of the smstateen.FCSR bit
> +     * which must be checked for in the floating point translation routines
> +     */
> +    if (!riscv_has_ext(env, RVF)) {
> +        if (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE) {
> +            flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 1);
> +        } else {
> +            flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 0);
> +        }
> +    }
>       if (cpu->cfg.debug && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d0094922b6..e29bbb8b70 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -79,6 +79,7 @@ typedef struct DisasContext {
>       int frm;
>       RISCVMXL ol;
>       bool virt_inst_excp;
> +    bool smstateen_fcsr_ok;
>       bool virt_enabled;
>       const RISCVCPUConfig *cfg_ptr;
>       bool hlsx;
> @@ -1202,6 +1203,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>       ctx->zero = tcg_constant_tl(0);
>       ctx->virt_inst_excp = false;
> +    if (has_ext(ctx, RVF)) {
> +        ctx->smstateen_fcsr_ok = 1;
> +    } else {
> +        ctx->smstateen_fcsr_ok = FIELD_EX32(tb_flags, TB_FLAGS,
> +                                             MSTATUS_HS_FS);

Seems unaligned with tb_flags.

Otherwise, LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> +    }
>   }
>   
>   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)


