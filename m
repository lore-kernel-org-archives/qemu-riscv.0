Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5083C369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:59:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Hi0-0007Y0-V8; Fri, 25 Apr 2025 07:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8Hhr-00070p-UF
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:59:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8Hhp-0000vJ-7s
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:58:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso24662265e9.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745582335; x=1746187135; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vY56RVujAEoc12xInC1yMnrFWBOLzAq9GoyRcsOeDCk=;
 b=YSO/jFa5EIpvFOf8riU3OWZPcCbcYrkeYMKZpb84SDMNhbhbO9FLL8TLoecfcqKrMG
 +n1VjNI4CsUkPluuEcvqeD51jQHiU32NBx3IOkNfebuyOmqgSYVNoCa+lf9fiVdVvQv4
 UKB53yOHMInJrsXpFlBdqLXMDC9q9OTejJpPAjHRMAytNXXvu5AY+zzCzzBIAhua4S9s
 o/ZSb+OfYxFSN/+UMPcEdS/Nj3uovUzolXm5SCjTpa0aHpJYG0DvXJpEQ+leVCMX/y2J
 Hmc+lVA7UZ8tJoZgmquRMf2SyJQnvrSgjrSEqxBwwzTrLYjFXXMJvK9OVGf6aH6bxke7
 9ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745582335; x=1746187135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vY56RVujAEoc12xInC1yMnrFWBOLzAq9GoyRcsOeDCk=;
 b=tSX/HTiye/NNGq0ynJ+iAqleCRWAo/v2IxMY42Dd+2Pha+GjbO7DoJq/BHyHpHliZH
 XRj8cOjsYg+Qv7LgO9PNBdptzhpRndMbcT3xu7mYCaANBUsFoODuPtV9Rg0Mq7XBzCfs
 h4lE5YLYor1qbsVRUhXS1CMwIO36qGcBPO8NIc6Wd1LvCmlQzPTP3BE+XNI/npIB6djf
 oUvnNbrXbKM7UkencBZG7/a3wDkWXK6IxOQb1EvBMLfTGvVOmuzJ3BeLs43w+ZMPMPlM
 6KVj9K6ms+/1NYzPkMlYfxSM3DNOwbrRDgQIbIn9NZDVJk82RvKpB5hTY2euRCTbAR8x
 h5kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeY1/F+5NMfDcDsUyN86hserqCtvb6lciBfqV3QdNy8ZPzhAxkQf1zprDnUyCkHstyLqq/oBqmFWzO@nongnu.org
X-Gm-Message-State: AOJu0Yy4BqOGMGHZBVShXTSN/MXdvsMLCxH7+NUrjhkJhs4bPdD8KWxL
 fPx/ZC6/N1SzSFhEEP9pzkZ57/7F9a35kS4op0Via6hAoYcF9mdEhqFCYyJWLF8=
X-Gm-Gg: ASbGncsAKW5KYjZAhVYZEFfDS9lDee41wl1MPRF8kFbBf/omu+Xb4R8QxKYn8nmySC8
 cJ5nBbMzkf2DwJIdtkHl5PjG1QxXfOyRycNN/WNJ/5GCHjXC+/mzBGGi+79/8zZINbObn9b03Nb
 h3/FrJk8VH+f1imTA7ZB3fLB3/6Nu5/dUXzGwBBtXcO5+oYcDO1H7j5cBnwzRp/Dr84Pp/qnT/I
 kOzBUDcrWXvj8WMQBpZtaViL8I8DMNaRsJ+jLoU9LrqprrZsT/oCG1sVJKwxehmLWkbvP+M8IMD
 KRcfx9ekwipGn6fmHJTPD1Ls+y+W
X-Google-Smtp-Source: AGHT+IF6++AlN2iS7BWqGmNLqDc/2BktAwFo8I6deN5GMY8tblV28BpaobYsGA7JfnA617EDQBKWLg==
X-Received: by 2002:a05:600c:5120:b0:43d:22d9:4b8e with SMTP id
 5b1f17b1804b1-440a65d8e5bmr18941015e9.10.1745582335108; 
 Fri, 25 Apr 2025 04:58:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2d86f7sm54221625e9.32.2025.04.25.04.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:58:54 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:58:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v2 5/9] target/riscv/kvm: add kvm_csr_cfgs[]
Message-ID: <20250425-940e765f7d6ff4381ed08367@orel>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
 <20250425113705.2741457-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113705.2741457-6-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Apr 25, 2025 at 08:37:01AM -0300, Daniel Henrique Barboza wrote:
> At this moment we're not checking if the host has support for any
> specific CSR before doing get/put regs. This will cause problems if the
> host KVM doesn't support it (see [1] as an example).
> 
> We'll use the same approach done with the CPU extensions: read all known
> KVM CSRs during init() to check for availability, then read/write them
> if they are present. This will be made by either using get-reglist or by
> directly reading the CSRs.
> 
> For now we'll just convert the CSRs to use a kvm_csr_cfg[] array,
> reusing the same KVMCPUConfig abstraction we use for extensions, and use
> the array in (get|put)_csr_regs() instead of manually listing them. A
> lot of boilerplate will be added but at least we'll automate the get/put
> procedure for CSRs, i.e. adding a new CSR in the future will be a matter
> of adding it in kvm_csr_regs[] and everything else will be taken care
> of.
> 
> Despite all the code changes no behavioral change is made.
> 
> [1] https://lore.kernel.org/qemu-riscv/CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com/
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h         |   1 +
>  target/riscv/kvm/kvm-cpu.c | 121 ++++++++++++++++++++++++++-----------
>  2 files changed, 86 insertions(+), 36 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 679f417336..f5a60d0c52 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -79,6 +79,7 @@ const char *riscv_get_misa_ext_name(uint32_t bit);
>  const char *riscv_get_misa_ext_description(uint32_t bit);
>  
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
> +#define ENV_CSR_OFFSET(_csr) offsetof(CPURISCVState, _csr)
>  
>  typedef struct riscv_cpu_profile {
>      struct riscv_cpu_profile *u_parent;
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index fd66bc1759..7cbe566e5f 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -114,22 +114,6 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
>      KVM_RISCV_REG_ID_ULONG(KVM_REG_RISCV_VECTOR, \
>                             KVM_REG_RISCV_VECTOR_CSR_REG(name))
>  
> -#define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
> -    do { \
> -        int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(csr), &reg); \
> -        if (_ret) { \
> -            return _ret; \
> -        } \
> -    } while (0)
> -
> -#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
> -    do { \
> -        int _ret = kvm_set_one_reg(cs, RISCV_CSR_REG(csr), &reg); \
> -        if (_ret) { \
> -            return _ret; \
> -        } \
> -    } while (0)
> -
>  #define KVM_RISCV_GET_TIMER(cs, name, reg) \
>      do { \
>          int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
> @@ -251,6 +235,53 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +#define KVM_CSR_CFG(_name, _env_prop, reg_id) \
> +    {.name = _name, .offset = ENV_CSR_OFFSET(_env_prop), \
> +     .kvm_reg_id = reg_id}
> +
> +static KVMCPUConfig kvm_csr_cfgs[] = {
> +    KVM_CSR_CFG("sstatus", mstatus, RISCV_CSR_REG(sstatus)),
> +    KVM_CSR_CFG("sie", mie, RISCV_CSR_REG(sie)),
> +    KVM_CSR_CFG("stvec", stvec, RISCV_CSR_REG(stvec)),
> +    KVM_CSR_CFG("sscratch", sscratch, RISCV_CSR_REG(sscratch)),
> +    KVM_CSR_CFG("sepc", sepc, RISCV_CSR_REG(sepc)),
> +    KVM_CSR_CFG("scause", scause, RISCV_CSR_REG(scause)),
> +    KVM_CSR_CFG("stval", stval, RISCV_CSR_REG(stval)),
> +    KVM_CSR_CFG("sip", mip, RISCV_CSR_REG(sip)),
> +    KVM_CSR_CFG("satp", satp, RISCV_CSR_REG(satp)),

nit: could tabulate this

> +};
> +
> +static void *kvmconfig_get_env_addr(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)
> +{
> +    return (void *)&cpu->env + csr_cfg->offset;
> +}
> +
> +static uint64_t kvm_cpu_csr_get_u32(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)

Despite the cover letter stating this was changed to return a uint32_t,
it's not.

> +{
> +    uint32_t *val32 = kvmconfig_get_env_addr(cpu, csr_cfg);
> +    return *val32;
> +}
> +
> +static uint64_t kvm_cpu_csr_get_u64(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)
> +{
> +    uint64_t *val64 = kvmconfig_get_env_addr(cpu, csr_cfg);
> +    return *val64;
> +}
> +
> +static void kvm_cpu_csr_set_u32(RISCVCPU *cpu, KVMCPUConfig *csr_cfg,
> +                                uint32_t val)
> +{
> +    uint32_t *val32 = kvmconfig_get_env_addr(cpu, csr_cfg);
> +    *val32 = val;
> +}
> +
> +static void kvm_cpu_csr_set_u64(RISCVCPU *cpu, KVMCPUConfig *csr_cfg,
> +                                uint64_t val)
> +{
> +    uint64_t *val64 = kvmconfig_get_env_addr(cpu, csr_cfg);
> +    *val64 = val;
> +}
> +
>  #define KVM_EXT_CFG(_name, _prop, _reg_id) \
>      {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>       .kvm_reg_id = _reg_id}
> @@ -598,34 +629,52 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
>  
>  static int kvm_riscv_get_regs_csr(CPUState *cs)
>  {
> -    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    uint64_t reg;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
> +        KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
>  
> -    KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
> -    KVM_RISCV_GET_CSR(cs, env, sie, env->mie);
> -    KVM_RISCV_GET_CSR(cs, env, stvec, env->stvec);
> -    KVM_RISCV_GET_CSR(cs, env, sscratch, env->sscratch);
> -    KVM_RISCV_GET_CSR(cs, env, sepc, env->sepc);
> -    KVM_RISCV_GET_CSR(cs, env, scause, env->scause);
> -    KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
> -    KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
> -    KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
> +        ret = kvm_get_one_reg(cs, csr_cfg->kvm_reg_id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +
> +        if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint32_t)) {
> +            kvm_cpu_csr_set_u32(cpu, csr_cfg, reg);
> +        } else if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint64_t)) {
> +            kvm_cpu_csr_set_u64(cpu, csr_cfg, reg);
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
>  
>      return 0;
>  }
>  
>  static int kvm_riscv_put_regs_csr(CPUState *cs)
>  {
> -    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    uint64_t reg;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
> +        KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
> +
> +        if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint32_t)) {
> +            reg = kvm_cpu_csr_get_u32(cpu, csr_cfg);
> +        } else if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint64_t)) {
> +            reg = kvm_cpu_csr_get_u64(cpu, csr_cfg);
> +        } else {
> +            g_assert_not_reached();
> +        }
>  
> -    KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> -    KVM_RISCV_SET_CSR(cs, env, sie, env->mie);
> -    KVM_RISCV_SET_CSR(cs, env, stvec, env->stvec);
> -    KVM_RISCV_SET_CSR(cs, env, sscratch, env->sscratch);
> -    KVM_RISCV_SET_CSR(cs, env, sepc, env->sepc);
> -    KVM_RISCV_SET_CSR(cs, env, scause, env->scause);
> -    KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
> -    KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
> -    KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
> +        ret = kvm_set_one_reg(cs, csr_cfg->kvm_reg_id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
>  
>      return 0;
>  }
> -- 
> 2.49.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

