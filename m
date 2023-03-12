Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbI0q-0001rp-Ke
	for mharc-qemu-riscv@gnu.org; Sun, 12 Mar 2023 05:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pbI0d-0001ia-Uq; Sun, 12 Mar 2023 05:28:56 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pbI0Z-0005hw-Nh; Sun, 12 Mar 2023 05:28:55 -0400
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s5Fmw1k2tqbAQ--.14626S2;
 Sun, 12 Mar 2023 17:28:38 +0800 (CST)
Message-ID: <f4034683-bb26-2247-c336-89264d588069@iscas.ac.cn>
Date: Sun, 12 Mar 2023 17:28:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] target/riscv: fix H extension TVM trap
Content-Language: en-US
To: Yi Chen <chenyi2000@zju.edu.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230310164222.173368-1-chenyi2000@zju.edu.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230310164222.173368-1-chenyi2000@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s5Fmw1k2tqbAQ--.14626S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4rJF4xZFyfGr1ftFyxZrb_yoW7ur43pa
 1DG39IkayUXF9rJan3tr1DGF15Aw1xG3yUC3Z7WayrAr4fCr15Cr1DWryv9FykWr4Dur4v
 vFW8uFyDZr4IyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Sun, 12 Mar 2023 09:29:03 -0000


On 2023/3/11 00:42, Yi Chen wrote:
> - Trap satp/hgatp accesses from HS-mode when MSTATUS.TVM is enabled.
> - Trap satp accesses from VS-mode when HSTATUS.VTVM is enabled.
> - Raise RISCV_EXCP_ILLEGAL_INST when U-mode executes SFENCE.VMA/SINVAL.VMA.
> - Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
>    SFENCE.VMA/SINVAL.VMA or VS-mode executes SFENCE.VMA/SINVAL.VMA with
>    HSTATUS.VTVM enabled.
> - Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
>    HFENCE.GVMA/HFENCE.VVMA/HINVAL.GVMA/HINVAL.VVMA.
>
> Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>

I remember I have sent reviewed-by for this patch. Please add the 
Reviewed-by.

> ---
It's better to describe the changes between different versions here.
>   target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
>   target/riscv/op_helper.c | 12 ++++-----
>   2 files changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..26a02e57bd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -443,6 +443,30 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
>       return sstc(env, csrno);
>   }
>   
> +static RISCVException satp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
> +        get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env) &&
> +        get_field(env->hstatus, HSTATUS_VTVM)) {
> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
> +static RISCVException hgatp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
> +        get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return hmode(env, csrno);
> +}
> +
>   /* Checks if PointerMasking registers could be accessed */
>   static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   {
> @@ -2655,13 +2679,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>           *val = 0;
>           return RISCV_EXCP_NONE;
>       }
> -
> -    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    } else {
> -        *val = env->satp;
> -    }
> -
> +    *val = env->satp;
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -2684,18 +2702,14 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>       }
>   
>       if (vm && mask) {
> -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            /*
> -             * The ISA defines SATP.MODE=Bare as "no translation", but we still
> -             * pass these through QEMU's TLB emulation as it improves
> -             * performance.  Flushing the TLB on SATP writes with paging
> -             * enabled avoids leaking those invalid cached mappings.
> -             */
> -            tlb_flush(env_cpu(env));
> -            env->satp = val;
> -        }
> +        /*
> +         * The ISA defines SATP.MODE=Bare as "no translation", but we still
> +         * pass these through QEMU's TLB emulation as it improves
> +         * performance.  Flushing the TLB on SATP writes with paging
> +         * enabled avoids leaking those invalid cached mappings.
> +         */
> +        tlb_flush(env_cpu(env));
> +        env->satp = val;
>       }
>       return RISCV_EXCP_NONE;
>   }
> @@ -4180,7 +4194,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                            .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>       /* Supervisor Protection and Translation */
> -    [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
> +    [CSR_SATP]     = { "satp",     satp, read_satp,     write_satp     },
>   
>       /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>       [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
> @@ -4217,7 +4231,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                             .min_priv_ver = PRIV_VERSION_1_12_0                },
>       [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
>                             .min_priv_ver = PRIV_VERSION_1_12_0                },
> -    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
> +    [CSR_HGATP]       = { "hgatp",       hgatp,   read_hgatp,   write_hgatp,
>                             .min_priv_ver = PRIV_VERSION_1_12_0                },
>       [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
>                             write_htimedelta,
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 84ee018f7d..093c2c6154 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -381,12 +381,12 @@ void helper_wfi(CPURISCVState *env)
>   void helper_tlb_flush(CPURISCVState *env)
>   {
>       CPUState *cs = env_cpu(env);
> -    if (!(env->priv >= PRV_S) ||
> -        (env->priv == PRV_S &&
> -         get_field(env->mstatus, MSTATUS_TVM))) {
> +    if (!riscv_cpu_virt_enabled(env) &&
> +        (env->priv == PRV_U ||
> +         (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
>           riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
> -               get_field(env->hstatus, HSTATUS_VTVM)) {
> +    } else if (riscv_cpu_virt_enabled(env) &&
> +               (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
>           riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>       } else {
>           tlb_flush(cs);
> @@ -403,7 +403,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
>   {
>       CPUState *cs = env_cpu(env);
>   
> -    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
> +    if (env->priv <= PRV_S && riscv_cpu_virt_enabled(env)) {
>           riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>       }

By the way, the check for "env->priv <= PRV_S " is not neccessary when  
riscv_cpu_virt_enabled(env) is true

since only VS/VU mode is supported currently.

Regards,

Weiwei Li

>   


