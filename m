Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmuE-0003qk-4D
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 09:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmu9-0003k9-7p
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:28:57 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmu7-0001w5-7Z
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:28:56 -0400
Received: by mail-oi1-x22a.google.com with SMTP id q27so5580763oiw.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679923733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zv7HvMZLSBerHD/Kvw7azBLt4ZK4kS6YZHGzUFBziLI=;
 b=oIQ07pNE2GubpV5kf3O1x/l+xjhkyFbqEjMBl+2EtwmsHOIFhnrp3ft57P0zwnOhnG
 pFciOesTJNLh0IL1O/787CHAVG1eA2Bdu3cF57Zdow+hqCOeQKSoFyRgRhr0sxEqHCxM
 KmkbE1hGqvJe1ZXMd9LC32JHGLM6FfINw/n0UVL4LqVrn7+DQPtzNUwvIl0cckoC4Di1
 FHh/Z0895TgyzTvFjOVpoIL2/b777km3fSpuf40caZDmeJ384XvjzkCV5HdMNrVCmhTT
 6EHj+m633itBtQARXDKVNVgNu21+M1uJRXV/mP0dtt2a4pCtxohqF9V6Y7Wu6FbsRrAj
 GeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zv7HvMZLSBerHD/Kvw7azBLt4ZK4kS6YZHGzUFBziLI=;
 b=UpmEwAnaq+kM7kSLpTdeWf53TaDx/qvskOOn3mb/1M+FL4lLpOPBmOmMFpnEqM1m+h
 H2gpKB4MtxdxLgYG+cDcYyDs0v86xa0N9IMf3QkZowd9EvuKQdVyYY9EsklcVBRYx8zb
 nb6pJuHxrV18MhHAhBKKPGoXs46swulFDeqB+mCbFdZUbyvw6Zr5Xk1ia6W4uQ4OCAOp
 3zGxJZS6t2OhRe6x5pIWSScG3rjpBHPvjABgxiIvPFUDCvIJcJ5MlECXHFERW5B8OrhQ
 s3c0woifo5RP9CpnF8mp22lHB58TOm/uUgSUqqmw2tCOCgkVEIk+NKBxECKlxng21rat
 S3dA==
X-Gm-Message-State: AO0yUKUsNrqzHzxoxcdxJlfkw+KOzTWhSBOSaL4NF9mw9J61SjSnDac/
 3nak3Qb4htF3u61Vu9zXHBW1Yw==
X-Google-Smtp-Source: AK7set8h8H+3MULYSysiOawxV94XF2OAKAayhDflLizo1zj9KlKT9kCMT+UI3ph8wLsVI5zUDo0Rrg==
X-Received: by 2002:a54:4f03:0:b0:386:ef98:e5d5 with SMTP id
 e3-20020a544f03000000b00386ef98e5d5mr5360656oiy.24.1679923733501; 
 Mon, 27 Mar 2023 06:28:53 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0568080f8800b00383b371f2a7sm11000045oiw.42.2023.03.27.06.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:28:53 -0700 (PDT)
Message-ID: <3a6a58c9-3eef-2162-94a6-bc76c066970a@ventanamicro.com>
Date: Mon, 27 Mar 2023 10:28:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 13:29:00 -0000



On 3/27/23 07:00, Weiwei Li wrote:
> Transform the fetch address before page walk when pointer mask is
> enabled for instruction fetch.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++--
>   target/riscv/csr.c        |  2 --
>   3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..57bd9c3279 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,7 @@ struct CPUArchState {
>   #endif
>       target_ulong cur_pmmask;
>       target_ulong cur_pmbase;
> +    bool cur_pminsn;
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..77132a3e0c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -124,6 +124,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   void riscv_cpu_update_mask(CPURISCVState *env)
>   {
>       target_ulong mask = -1, base = 0;
> +    bool insn = false;
>       /*
>        * TODO: Current RVJ spec does not specify
>        * how the extension interacts with XLEN.
> @@ -135,18 +136,21 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>               if (env->mmte & M_PM_ENABLE) {
>                   mask = env->mpmmask;
>                   base = env->mpmbase;
> +                insn = env->mmte & MMTE_M_PM_INSN;
>               }
>               break;
>           case PRV_S:
>               if (env->mmte & S_PM_ENABLE) {
>                   mask = env->spmmask;
>                   base = env->spmbase;
> +                insn = env->mmte & MMTE_S_PM_INSN;
>               }
>               break;
>           case PRV_U:
>               if (env->mmte & U_PM_ENABLE) {
>                   mask = env->upmmask;
>                   base = env->upmbase;
> +                insn = env->mmte & MMTE_U_PM_INSN;
>               }
>               break;
>           default:
> @@ -161,6 +165,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>           env->cur_pmmask = mask;
>           env->cur_pmbase = base;
>       }
> +    env->cur_pminsn = insn;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -1225,6 +1230,17 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
>       riscv_pmu_incr_ctr(cpu, pmu_event_type);
>   }
>   
> +static target_ulong adjust_pc_address(CPURISCVState *env, target_ulong pc)
> +{
> +    target_ulong adjust_pc = pc;
> +
> +    if (env->cur_pminsn) {
> +        adjust_pc = (adjust_pc & ~env->cur_pmmask) | env->cur_pmbase;
> +    }
> +
> +    return adjust_pc;
> +}
> +
>   bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr)
> @@ -1232,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       vaddr im_address;
> +    vaddr orig_address = address;
>       hwaddr pa = 0;
>       int prot, prot2, prot_pmp;
>       bool pmp_violation = false;
> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                     __func__, address, access_type, mmu_idx);
>   
> +    if (access_type == MMU_INST_FETCH) {
> +        address = adjust_pc_address(env, address);
> +    }
> +
>       /* MPRV does not affect the virtual-machine load/store
>          instructions, HLV, HLVX, and HSV. */
>       if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> @@ -1351,13 +1372,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       }
>   
>       if (ret == TRANSLATE_SUCCESS) {
> -        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> +        tlb_set_page(cs, orig_address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
>                        prot, mmu_idx, tlb_size);
>           return true;
>       } else if (probe) {
>           return false;
>       } else {
> -        raise_mmu_exception(env, address, access_type, pmp_violation,
> +        raise_mmu_exception(env, orig_address, access_type, pmp_violation,
>                               first_stage_error,
>                               riscv_cpu_virt_enabled(env) ||
>                                   riscv_cpu_two_stage_lookup(mmu_idx),
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..4544c9d934 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3511,8 +3511,6 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>       /* for machine mode pm.current is hardwired to 1 */
>       wpri_val |= MMTE_M_PM_CURRENT;
>   
> -    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
> -    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
>       env->mmte = wpri_val | PM_EXT_DIRTY;
>       riscv_cpu_update_mask(env);
>   

