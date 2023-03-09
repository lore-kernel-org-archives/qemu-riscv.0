Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paNJm-0004P2-B3
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 15:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNJk-0004Nv-95
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:56:52 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNJc-0001C4-A1
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:56:46 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1755e639b65so3701681fac.3
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 12:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678395403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0zJQHOtYWmsd9eAGmuQkk+MsmN6EowRpnDSNN9CLpLo=;
 b=Y/TKdfuSosY483ZbUEXOHcNz+sbd/pVkw5NL1lqBnp71uQkdqcagOqeCmETE+ebpZi
 xUJxs9qZiAu3bRH19hvkF0eEa4FRAOc/rLQHXJk7Czn7xFpvbS28bxRZC1n4MA7VQHmh
 Xr6VIhF9mPlIrMpzbLomAmVK1D2Dl/AjyG5L6nrHyh9B2oHVEmgS716KtOWvASvcXj6T
 HQo9VB6yO600cQ3mK6BITtNblb3SaeegRm3qlpga67KZf8pxKfuusn4gKc1ceYJIxEKs
 Sxa1gWVylY5rnrT5Tf9IlM6WGDzXUClDiA97rQ87X/pMfesGmPo4YmsaeSVp6WNyHAuL
 0+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zJQHOtYWmsd9eAGmuQkk+MsmN6EowRpnDSNN9CLpLo=;
 b=usOMwJmYho6Zrh6/FBIuvGeZkKO8MF2BWAes3hHrdAHDLeCRDxYlRAV5EC/Z+KByQE
 JhhbsBcrrlkvIR+X+O41UO1vh7FsThRALMgDrmoAWnBlrab7ZEFhF0yjn/v7yHRbzyUd
 IqhFLGGidsxqH8iR3PfR7RJHGhnnmbTJRtRTSmrpZYwKNT33mARLFk6rNT3dv/fG7jVn
 p2zHp9H2o5i7ymcNLudUAPyV47/CCLuvdegsmtuHASUVCrAKSlkdKF3taJ3lWsMEFCyy
 nJFkd9O4NiJS3TkTDbJ6H/Opbw9qDo4isRbT4Flcgyq0CcNgNDaLsbP7eGfCYNmVE+Iw
 MY6g==
X-Gm-Message-State: AO0yUKVmWLVKJf8U0QAH2Z22Li6gCxVaeHuRlfmZ//JyeDJ6Go6TAI66
 iam9XH14R/bcCMCBVj/IcZv7XQ==
X-Google-Smtp-Source: AK7set+jCftKkuRBN+dHG6PLbN+B+jkOAMGmFewlAHoiokBJrMP4JG5xAxeA/lYJ+Ew6LdwKMaepEA==
X-Received: by 2002:a05:6870:2412:b0:176:41b0:b0ad with SMTP id
 n18-20020a056870241200b0017641b0b0admr7483oap.15.1678395402960; 
 Thu, 09 Mar 2023 12:56:42 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 eg39-20020a05687098a700b001727d67f2dbsm166912oab.40.2023.03.09.12.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:56:42 -0800 (PST)
Message-ID: <14e95149-5881-2220-b61d-55c75a2864ae@ventanamicro.com>
Date: Thu, 9 Mar 2023 17:56:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] target/riscv: Simplify type conversion for
 CPURISCVState
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-4-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230309071329.45932-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Thu, 09 Mar 2023 20:56:52 -0000



On 3/9/23 04:13, Weiwei Li wrote:
> Use CPURISCVState as argument directly in riscv_cpu_update_mip and
> riscv_timer_write_timecmp, since type converts from CPURISCVState to
> RISCVCPU in many caller of them and then back to CPURISCVState in them.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c         |  6 +++---
>   target/riscv/cpu.h         |  3 ++-
>   target/riscv/cpu_helper.c  |  8 ++++----
>   target/riscv/csr.c         | 35 +++++++++++------------------------
>   target/riscv/pmu.c         |  6 +++---
>   target/riscv/time_helper.c | 15 +++++++--------
>   target/riscv/time_helper.h |  2 +-
>   7 files changed, 31 insertions(+), 44 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..16e465a0ab 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1302,7 +1302,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>               if (kvm_enabled()) {
>                   kvm_riscv_set_irq(cpu, irq, level);
>               } else {
> -                riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +                riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level));
>               }
>                break;
>           case IRQ_S_EXT:
> @@ -1310,7 +1310,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>                   kvm_riscv_set_irq(cpu, irq, level);
>               } else {
>                   env->external_seip = level;
> -                riscv_cpu_update_mip(cpu, 1 << irq,
> +                riscv_cpu_update_mip(env, 1 << irq,
>                                        BOOL_TO_MASK(level | env->software_seip));
>               }
>               break;
> @@ -1336,7 +1336,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>           }
>   
>           /* Update mip.SGEIP bit */
> -        riscv_cpu_update_mip(cpu, MIP_SGEIP,
> +        riscv_cpu_update_mip(env, MIP_SGEIP,
>                                BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
>       } else {
>           g_assert_not_reached();
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..5adefe4ab5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -602,7 +602,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>   void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> -uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> +                              uint64_t value);
>   #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                                void *arg);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e677255f87..824f0cbd92 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -590,7 +590,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>            *
>            * To solve this, we check and inject interrupt after setting V=1.
>            */
> -        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> +        riscv_cpu_update_mip(env, 0, 0);
>       }
>   }
>   
> @@ -610,10 +610,10 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
>       }
>   }
>   
> -uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> +                              uint64_t value)
>   {
> -    CPURISCVState *env = &cpu->env;
> -    CPUState *cs = CPU(cpu);
> +    CPUState *cs = env_cpu(env);
>       uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>   
>       if (riscv_cpu_virt_enabled(env)) {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b453d8e8ca..53143f4d9a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -990,15 +990,13 @@ static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
>   static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
>       } else {
>           env->vstimecmp = val;
>       }
>   
> -    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                 env->htimedelta, MIP_VSTIP);
>   
>       return RISCV_EXCP_NONE;
> @@ -1007,10 +1005,8 @@ static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
>   static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> -    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                 env->htimedelta, MIP_VSTIP);
>   
>       return RISCV_EXCP_NONE;
> @@ -1043,8 +1039,6 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>   static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       if (riscv_cpu_virt_enabled(env)) {
>           if (env->hvictl & HVICTL_VTI) {
>               return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -1058,7 +1052,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>           env->stimecmp = val;
>       }
>   
> -    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
>   
>       return RISCV_EXCP_NONE;
>   }
> @@ -1066,8 +1060,6 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>   static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       if (riscv_cpu_virt_enabled(env)) {
>           if (env->hvictl & HVICTL_VTI) {
>               return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -1076,7 +1068,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>       }
>   
>       env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> -    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
>   
>       return RISCV_EXCP_NONE;
>   }
> @@ -2211,7 +2203,6 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>                                   uint64_t *ret_val,
>                                   uint64_t new_val, uint64_t wr_mask)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
>       uint64_t old_mip, mask = wr_mask & delegable_ints;
>       uint32_t gin;
>   
> @@ -2220,14 +2211,14 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>           new_val |= env->external_seip * MIP_SEIP;
>       }
>   
> -    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
> +    if (riscv_cpu_cfg(env)->ext_sstc && (env->priv == PRV_M) &&
>           get_field(env->menvcfg, MENVCFG_STCE)) {
>           /* sstc extension forbids STIP & VSTIP to be writeable in mip */
>           mask = mask & ~(MIP_STIP | MIP_VSTIP);
>       }
>   
>       if (mask) {
> -        old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
> +        old_mip = riscv_cpu_update_mip(env, mask, (new_val & mask));
>       } else {
>           old_mip = env->mip;
>       }
> @@ -2987,7 +2978,7 @@ static RISCVException write_hgeie(CPURISCVState *env, int csrno,
>       val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
>       env->hgeie = val;
>       /* Update mip.SGEIP bit */
> -    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
> +    riscv_cpu_update_mip(env, MIP_SGEIP,
>                            BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
>       return RISCV_EXCP_NONE;
>   }
> @@ -3056,8 +3047,6 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
>   static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       if (!env->rdtime_fn) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> @@ -3068,8 +3057,8 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
>           env->htimedelta = val;
>       }
>   
> -    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> -        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                     env->htimedelta, MIP_VSTIP);
>       }
>   
> @@ -3090,16 +3079,14 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
>   static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
>                                           target_ulong val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
>       if (!env->rdtime_fn) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
>       env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
>   
> -    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> -        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                     env->htimedelta, MIP_VSTIP);
>       }
>   
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index a200741083..22e2283c76 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -133,7 +133,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
>               /* Generate interrupt only if OF bit is clear */
>               if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
>                   env->mhpmeventh_val[ctr_idx] |= MHPMEVENTH_BIT_OF;
> -                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +                riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>               }
>           } else {
>               counter->mhpmcounterh_val++;
> @@ -172,7 +172,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
>           /* Generate interrupt only if OF bit is clear */
>           if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
>               env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> -            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>           }
>       } else {
>           counter->mhpmcounter_val++;
> @@ -371,7 +371,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
>           /* Generate interrupt only if OF bit is clear */
>           if (!(*mhpmevent_val & of_bit_mask)) {
>               *mhpmevent_val |= of_bit_mask;
> -            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>           }
>       }
>   }
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index b654f91af9..8d245bed3a 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -27,25 +27,24 @@ static void riscv_vstimer_cb(void *opaque)
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>       env->vstime_irq = 1;
> -    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
> +    riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
>   }
>   
>   static void riscv_stimer_cb(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> -    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> +    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
>   }
>   
>   /*
>    * Called when timecmp is written to update the QEMU timer or immediately
>    * trigger timer interrupt if mtimecmp <= current timer value.
>    */
> -void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>                                  uint64_t timecmp, uint64_t delta,
>                                  uint32_t timer_irq)
>   {
>       uint64_t diff, ns_diff, next;
> -    CPURISCVState *env = &cpu->env;
>       RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
>       uint32_t timebase_freq = mtimer->timebase_freq;
>       uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
> @@ -57,9 +56,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>            */
>           if (timer_irq == MIP_VSTIP) {
>               env->vstime_irq = 1;
> -            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
>           } else {
> -            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
>           }
>           return;
>       }
> @@ -67,9 +66,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>       /* Clear the [VS|S]TIP bit in mip */
>       if (timer_irq == MIP_VSTIP) {
>           env->vstime_irq = 0;
> -        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
> +        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
>       } else {
> -        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> +        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
>       }
>   
>       /*
> diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> index 7b3cdcc350..cacd79b80c 100644
> --- a/target/riscv/time_helper.h
> +++ b/target/riscv/time_helper.h
> @@ -22,7 +22,7 @@
>   #include "cpu.h"
>   #include "qemu/timer.h"
>   
> -void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>                                  uint64_t timecmp, uint64_t delta,
>                                  uint32_t timer_irq);
>   void riscv_timer_init(RISCVCPU *cpu);

