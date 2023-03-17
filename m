Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd5iT-00017l-3D
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 04:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pd5iL-00014a-Jj; Fri, 17 Mar 2023 04:45:30 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pd5iH-00074v-Rz; Fri, 17 Mar 2023 04:45:29 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R811e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Ve2A8YH_1679042714; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Ve2A8YH_1679042714) by smtp.aliyun-inc.com;
 Fri, 17 Mar 2023 16:45:15 +0800
Message-ID: <f10cd434-343d-49c0-ebd5-304190421327@linux.alibaba.com>
Date: Fri, 17 Mar 2023 16:45:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] target/riscv: fix H extension TVM trap
Content-Language: en-US
To: Yi Chen <chenyi2000@zju.edu.cn>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20230312120538.15286-1-chenyi2000@zju.edu.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230312120538.15286-1-chenyi2000@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 17 Mar 2023 08:45:31 -0000


On 2023/3/12 20:05, Yi Chen wrote:
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
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
> Add reviewed-by
> Replace "env->priv <= PRV_S && riscv_cpu_virt_enabled(env)" with "riscv_cpu_virt_enabled(env)"
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
> index 84ee018f7d..8e16020f8d 100644
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
> +    if (riscv_cpu_virt_enabled(env)) {
>           riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>       }

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   

