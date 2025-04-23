Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB402C369CB
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 15:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7bpf-0005zD-Qs; Wed, 23 Apr 2025 11:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u7bpU-0005y7-IA
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 11:16:05 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u7bpR-0000Go-OA
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 11:16:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so814587766b.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745421359; x=1746026159; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rbat1DK4qQopIKLfx3o5jXTbNufsSPfKfedcZCpmQD8=;
 b=kNt+XwJrxEbR6KD0HQcgiAf7BKvMLoD5+rQe9LCpFmXTiQLwGJUvcJrpMkJDmyF2ny
 eBJt6a3FRDKCxtGFI/IrR71p9FB5wNYViRL0wIY4/pQefQ7nik9iPEHF8qe/XObtQ30E
 SDLsER1sglTmRwxtiwW1l3MUbKqgHVhNHzb4IBp7uaLmytf4VPjp55IkdxbewPipa3ou
 O/wNymVH2ZvWqZpQboh0XPQ+P/uLhnlLNcgujk8vg5QH6GdQnPW4Ozdsoq2B0WP4PcFJ
 pHJNlmKZJTOedmocsKUEsi2z6O3XyLE+ex2jtOxvWpcW1hiK/E+DRXJq6t0fH2MB/RSx
 Kjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421359; x=1746026159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbat1DK4qQopIKLfx3o5jXTbNufsSPfKfedcZCpmQD8=;
 b=UEivjTjXs+quHOW+dhqyMMovJOzAgVK5rea5UmKGpFbl2CY6fxU0yLb5ZZ8ffw/V/4
 Uleug15MZ5nXxGeVL/o73bCt5JTvkdYCNvViOt6Jsr2SfC1evEnfmiiACW07xGkKd3kb
 tCHrlDOLVOYSlO2v3FsOeYoh7qSkzUxqch5TOjUOJmIIXew00GdlC8uFGYkMjxBiBaDm
 kS2T8OmcLE0YhDmK2k9c2jkhaEDK3V04NUxWSNnw4r93YpldsOkfBVUXVzobXuQhAJhi
 w1OlIYbsmGhdvV7E/tLUIwtleCKegmgQ0JF5PobHgNnon7XHrE8Ld7ZFN2Pnxf8mNpSV
 TUTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZfawiLZXvrrhuKj4RTcBcemnlDXS17xrNYbFAU0aLK10Jc/q2pjbnaocBsFtRG24MbTsklmAJ+i2K@nongnu.org
X-Gm-Message-State: AOJu0YycA5tPGL0Y0nYKvN2J7d6YtMD8qtK5l2a3zfvTeOhfKB0zxHM3
 Qb0pfaC54fYraiYR8m6BOQSil51/2gbMAFk2ifgRrLq3GV7yXUvawv9sBUVPjHE=
X-Gm-Gg: ASbGncu8eo7fxsLMzRwpgrT1jECc1t17S+IgSKNjKeZj8sIaMd1QyRv4kcr3+irKdpk
 6YSvn+X6FPDqlIwMedL0xaWj22n8/mOb9WbM2bb0W4koaFiL3by5sZfcCgSLC8dDwaAOf4HsCLJ
 3+7w7QEb61dczX+vtGAarkaYrz5GgpD3GkswZmOznYHqMISaQ+w/1uU83WrIEk+j1R61JPvegPO
 qPSJ8rHxsVU/lDWEcWGFVmmXS6BmQImaHvDjFPZCOahiVwl/LFRnLGKVX48r+WW7xqdWqjuIeGT
 PYHdWCE2HmtguL6YvJvj/ixlL9aVfikPVgXsTcg=
X-Google-Smtp-Source: AGHT+IFtU/gppMKdmjnZcIxr6qu1QktTAF09JRVzV+COtc8gT3HxWTqfjSC0Z5RKzH4chDlnvOnEjQ==
X-Received: by 2002:a17:906:478f:b0:ab7:bac4:b321 with SMTP id
 a640c23a62f3a-acb74b80e1fmr1581541466b.29.1745421358564; 
 Wed, 23 Apr 2025 08:15:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec4a1ecsm808584466b.48.2025.04.23.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 08:15:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:15:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 abologna@redhat.com
Subject: Re: [PATCH 4/7] target/riscv/kvm: add kvm_csr_cfgs[]
Message-ID: <20250423-9623c5901480c9e7be10d9e5@orel>
References: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
 <20250417124839.1870494-5-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417124839.1870494-5-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
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

On Thu, Apr 17, 2025 at 09:48:36AM -0300, Daniel Henrique Barboza wrote:
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
>  target/riscv/kvm/kvm-cpu.c | 119 ++++++++++++++++++++++++++-----------
>  2 files changed, 84 insertions(+), 36 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 51e49e03de..7a56666f9a 100644
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
> index 0bcadab977..99a4f01b15 100644
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
> @@ -150,6 +134,7 @@ typedef struct KVMCPUConfig {
>      const char *name;
>      const char *description;
>      target_ulong offset;
> +    uint32_t prop_size;
>      uint64_t kvm_reg_id;
>      bool user_set;
>      bool supported;
> @@ -251,6 +236,54 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +#define KVM_CSR_CFG(_name, _env_prop, _env_prop_size, reg_id) \
> +    {.name = _name, .offset = ENV_CSR_OFFSET(_env_prop), \
> +     .prop_size = _env_prop_size, .kvm_reg_id = reg_id}
> +
> +static KVMCPUConfig kvm_csr_cfgs[] = {
> +    KVM_CSR_CFG("sstatus", mstatus, sizeof(uint64_t), RISCV_CSR_REG(sstatus)),
> +    KVM_CSR_CFG("sie", mie, sizeof(uint64_t), RISCV_CSR_REG(sie)),
> +    KVM_CSR_CFG("stvec", stvec, sizeof(target_ulong), RISCV_CSR_REG(stvec)),
> +    KVM_CSR_CFG("sscratch", sscratch, sizeof(target_ulong),
> +                RISCV_CSR_REG(sscratch)),
> +    KVM_CSR_CFG("sepc", sepc, sizeof(target_ulong), RISCV_CSR_REG(sepc)),
> +    KVM_CSR_CFG("scause", scause, sizeof(target_ulong), RISCV_CSR_REG(scause)),
> +    KVM_CSR_CFG("stval", stval, sizeof(target_ulong), RISCV_CSR_REG(stval)),
> +    KVM_CSR_CFG("sip", mip, sizeof(uint64_t), RISCV_CSR_REG(sip)),
> +    KVM_CSR_CFG("satp", satp, sizeof(target_ulong), RISCV_CSR_REG(satp)),

We don't need to pass in sizeof(env_prop). We can just define KVM_CSR_CFG
to do it for us.

 #define KVM_CSR_CFG(_name, csr, reg_id) \
     { .name = _name, .offset = ENV_CSR_OFFSET(csr), \
       .prop_size = sizeof(((CPURISCVState *)0)->csr), \
       .kvm_reg_id = reg_id, }

But I don't think we need it at all. See below.

> +};
> +
> +static void *kvmconfig_get_env_addr(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)
> +{
> +    return (void *)&cpu->env + csr_cfg->offset;
> +}
> +
> +static uint64_t kvm_cpu_csr_get_u32(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)

This should return a uint32_t.

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
> @@ -598,34 +631,48 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
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
> +        if (csr_cfg->prop_size == sizeof(uint32_t)) {

 if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint32_t)) {
     kvm_cpu_csr_set_u32(cpu, csr_cfg, reg);
 } else if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint64_t)) {
     kvm_cpu_csr_set_u64(cpu, csr_cfg, reg);
 } else {
     uh, oh...
 }

> +            kvm_cpu_csr_set_u32(cpu, csr_cfg, reg);
> +        } else {
> +            kvm_cpu_csr_set_u64(cpu, csr_cfg, reg);
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
> +        if (csr_cfg->prop_size == sizeof(uint32_t)) {
> +            reg = kvm_cpu_csr_get_u32(cpu, csr_cfg);
> +        } else {
> +            reg = kvm_cpu_csr_get_u64(cpu, csr_cfg);
> +        }

same comment as above

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
>

Thanks,
drew

