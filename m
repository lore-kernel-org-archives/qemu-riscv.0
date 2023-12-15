Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FDCC35274
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:19:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE86U-0001R6-Ld; Fri, 15 Dec 2023 08:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE86S-0001QY-Ti
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:19:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE86O-0004YI-Oy
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:19:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so6785625e9.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 05:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702646379; x=1703251179; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aftn2uaV37T5bWxlLd5cesnbqw5JlTkzghxCLW+9Q70=;
 b=hhVwnqKrf6IQt7eS52ld60dLNQh/kuodcdywG/FQXJPiUY2AandklEpxhcawIDF1VX
 SnyuV6RRug3C3pqAa/qSgU+I++QWbh0o24305tGWr0OGEgRsacfoGL4rhY4hSgt89U1t
 bbw8o4TBxBoj4XWa/VjO2Y/r32r8oYajhdFbyCeepeu77tgPzBlDW9V/FRuZpSthi1sE
 1M3a6MERjVUsZszuqx6jFjASIRyQhVaKsBhBwYrRjlSwwxhyBSdMcBHwVAptXAyiC3BK
 TZUtkWkvD3WYxu+1GsMN0KRdylXo8+PSEY9tlDjm6aVRd/mDbACeW14+V177MvCfzPQQ
 ISwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702646379; x=1703251179;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aftn2uaV37T5bWxlLd5cesnbqw5JlTkzghxCLW+9Q70=;
 b=wnm3nmbOJHfi4Yn6f7YwV9ICLbCZUEbQv70OTNxJN0orl8wkgEVamJsX3A2dKI7GHN
 TA5nMUmcTLZRIhl9zVU7ygEEPekALkxFkiTT6BNfhXrJrFYIB+fmmbJVfpXipErof3uf
 HbdDp6wHi16SNmdKzJPM4BrVRrw7IgrsTm4/rAmMfTq2MvQDw7ak7RsbgAHa5xlOgFzA
 1rFelhMeZQJARXySyZFmDcbgKAenVy5EJTuOlSy7U1Q7XHutZphRFK2eNiTZ8VBFQNpK
 vAghU4UpieIUcmBL1PHg+/r6zdkNWPgSc+GTDon4Lw/rJSYojhGA6w1jw+8fo5aw4wBZ
 x+Tw==
X-Gm-Message-State: AOJu0YxCNyDP4LBSMOuy8Uug8eesB/RM0j1TD5WgchagYV10egiI12XI
 YlW6yBUzpgOzOigadU64N1f5Tg==
X-Google-Smtp-Source: AGHT+IFXaxr84BiWRvT+Cbw4W5fmItoG2Jx9BfPUvtWdgdVL2rPGot+l/sU41cPb4ikQhxNcLbrSsQ==
X-Received: by 2002:a05:600c:2147:b0:409:247b:b0ae with SMTP id
 v7-20020a05600c214700b00409247bb0aemr6427267wml.36.1702646379136; 
 Fri, 15 Dec 2023 05:19:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040b3e26872dsm31515807wms.8.2023.12.15.05.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 05:19:38 -0800 (PST)
Date: Fri, 15 Dec 2023 14:19:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 5/5] target/riscv/kvm: rename riscv_reg_id() to
 riscv_reg_id_ulong()
Message-ID: <20231215-45e97313ce6a97ed3eb9e8dd@orel>
References: <20231208183835.2411523-1-dbarboza@ventanamicro.com>
 <20231208183835.2411523-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208183835.2411523-6-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Dec 08, 2023 at 03:38:35PM -0300, Daniel Henrique Barboza wrote:
> kvm_riscv_reg_id() returns an id encoded with an ulong size, i.e. an u32
> size when running TARGET_RISCV32 and u64 when running TARGET_RISCV64.
> 
> Rename it to kvm_riscv_reg_id_ulong() to enhance code readability. It'll
> be in line with the existing kvm_riscv_reg_id_<size>() helpers.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 40 ++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 11797338ec..62a1e51f0a 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -54,7 +54,7 @@ void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>  
>  static bool cap_has_mp_state;
>  
> -static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
> +static uint64_t kvm_riscv_reg_id_ulong(CPURISCVState *env, uint64_t type,
>                                   uint64_t idx)
>  {
>      uint64_t id = KVM_REG_RISCV | type | idx;
> @@ -82,15 +82,17 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
>      return KVM_REG_RISCV | KVM_REG_SIZE_U64 | type | idx;
>  }
>  
> -#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
> -                 KVM_REG_RISCV_CORE_REG(name))
> +#define RISCV_CORE_REG(env, name) \
> +    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CORE, \
> +                           KVM_REG_RISCV_CORE_REG(name))
>  
> -#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
> -                 KVM_REG_RISCV_CSR_REG(name))
> +#define RISCV_CSR_REG(env, name) \
> +    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CSR, \
> +                           KVM_REG_RISCV_CSR_REG(name))
>  
>  #define RISCV_CONFIG_REG(env, name) \
> -    kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, \
> -                     KVM_REG_RISCV_CONFIG_REG(name))
> +    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG, \
> +                           KVM_REG_RISCV_CONFIG_REG(name))
>  
>  #define RISCV_TIMER_REG(name)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_TIMER, \
>                   KVM_REG_RISCV_TIMER_REG(name))
> @@ -216,8 +218,8 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>  
>          /* If we're here we're going to disable the MISA bit */
>          reg = 0;
> -        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> -                              misa_cfg->kvm_reg_id);
> +        id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_ISA_EXT,
> +                                    misa_cfg->kvm_reg_id);
>          ret = kvm_set_one_reg(cs, id, &reg);
>          if (ret != 0) {
>              /*
> @@ -378,8 +380,8 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>              continue;
>          }
>  
> -        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> -                              multi_ext_cfg->kvm_reg_id);
> +        id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_ISA_EXT,
> +                                    multi_ext_cfg->kvm_reg_id);
>          reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
>          ret = kvm_set_one_reg(cs, id, &reg);
>          if (ret != 0) {
> @@ -509,7 +511,7 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
>      env->pc = reg;
>  
>      for (i = 1; i < 32; i++) {
> -        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        uint64_t id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CORE, i);
>          ret = kvm_get_one_reg(cs, id, &reg);
>          if (ret) {
>              return ret;
> @@ -534,7 +536,7 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
>      }
>  
>      for (i = 1; i < 32; i++) {
> -        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        uint64_t id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CORE, i);
>          reg = env->gpr[i];
>          ret = kvm_set_one_reg(cs, id, &reg);
>          if (ret) {
> @@ -810,8 +812,8 @@ static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>      struct kvm_one_reg reg;
>      int ret;
>  
> -    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> -                              cbomz_cfg->kvm_reg_id);
> +    reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
> +                                    cbomz_cfg->kvm_reg_id);
>      reg.addr = (uint64_t)kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
>      ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>      if (ret != 0) {
> @@ -832,8 +834,8 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
>          KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
>          struct kvm_one_reg reg;
>  
> -        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> -                                  multi_ext_cfg->kvm_reg_id);
> +        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_ISA_EXT,
> +                                        multi_ext_cfg->kvm_reg_id);
>          reg.addr = (uint64_t)&val;
>          ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>          if (ret != 0) {
> @@ -925,8 +927,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  
>      for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>          multi_ext_cfg = &kvm_multi_ext_cfgs[i];
> -        reg_id = kvm_riscv_reg_id(&cpu->env, KVM_REG_RISCV_ISA_EXT,
> -                                  multi_ext_cfg->kvm_reg_id);
> +        reg_id = kvm_riscv_reg_id_ulong(&cpu->env, KVM_REG_RISCV_ISA_EXT,
> +                                        multi_ext_cfg->kvm_reg_id);
>          reg_search = bsearch(&reg_id, reglist->reg, reglist->n,
>                               sizeof(uint64_t), uint64_cmp);
>          if (!reg_search) {
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

