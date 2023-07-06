Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB24EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 08:46:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHKc8-0006lk-5y; Thu, 06 Jul 2023 04:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHKbx-0006kV-DE
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 04:45:21 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHKbr-0006MM-Vb
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 04:45:12 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so2435778a12.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688633106; x=1691225106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YCNTGYVea76GSpgz2WNzq6N3B6PTyizieaabZcYhOtw=;
 b=GEnjkOadw8qgPfQIXH21I73fpWDgS7/dHS2+qgOz/joM5BKTjtmdwpSxw4A3vqvLfA
 80viCyJzAgl9oJT1jqp5sj9IQAXReUIszq7hV1VXt3B4X/j3U0AN4wzeAHK0Z0KoRQi8
 AuCQrfyY2L9mH5KhbeXyxgm3Rh6Adf+T/dr4LiKrReqmTZGJpv/YIwBDwSPeMrIa66vr
 Pdkz71rToRm3wlmOZ3iYq2Fc/yLhrtT18zCTH4FTjkQDVGtvB6oId5aAmeNuKG2d331s
 Z4OuqBSBm6D0Je2zNiu/EDRoZCZeB2g+jqGz/+qfDr6ZF5vcP3U04kF3io9gyzlrcYv0
 faKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688633106; x=1691225106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCNTGYVea76GSpgz2WNzq6N3B6PTyizieaabZcYhOtw=;
 b=SIfTgk6sMYseCFYnPdYef1MjT9ZYNO1LzJqnMzxz0Vr/BBoicahjtG/MzHDA1PINWe
 5FkZSJdMbFkOML11u7DogJtU6aravqusWCvwqEDNe9gyvuf39TVirX5Iaj3gVg1Zj2Dm
 W84RRTVr003VaSTMsv4YieTJj/dpEXJ+mNevATYtNkwpiBpMODkcLi5OXq6oG/CPTptk
 XY4uGIixX2FUSWALa2WJCBbfgdk82XcRUnDRhKzLIybu5l4t6T4ZWu/XASS4ysRi5v6e
 r8DhiDfDk46OiJH1IDE6qRWQihW4NVrgIf/Cjh0VR5U+4X2m/MIbKxFwOYUlI7dnBE77
 G9hA==
X-Gm-Message-State: ABy/qLbLthjZs34RFru+xuGuLSXsRXR5uVt0SluWJTFmeawcE0yJyWOT
 GoiIhInNYCu+ek26jFwlsOPt5A==
X-Google-Smtp-Source: APBJJlGAYaC2EG0V6BmL7wTjJTVp522D4+26U0E1ZyktdaneqJjWUZ7LnLE7L1WnPUFtDvnIdg1FwA==
X-Received: by 2002:a17:906:530b:b0:973:84b0:b077 with SMTP id
 h11-20020a170906530b00b0097384b0b077mr1337996ejo.33.1688633105922; 
 Thu, 06 Jul 2023 01:45:05 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a1709067f8a00b00988e953a586sm522946ejr.61.2023.07.06.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 01:45:05 -0700 (PDT)
Date: Thu, 6 Jul 2023 10:45:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
Message-ID: <20230706-ec06b3d750f813f9c7256fe9@orel>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
 <20230705213955.429895-15-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705213955.429895-15-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jul 05, 2023 at 06:39:49PM -0300, Daniel Henrique Barboza wrote:
> Let's add KVM user properties for the multi-letter extensions that KVM
> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
> svinval and svpbmt.
> 
> As with MISA extensions, we're using the KVMCPUConfig type to hold
> information about the state of each extension. However, multi-letter
> extensions have more cases to cover than MISA extensions, so we're
> adding an extra 'supported' flag as well. This flag will reflect if a
> given extension is supported by KVM, i.e. KVM knows how to handle it.
> This is determined during KVM extension discovery in
> kvm_riscv_init_multiext_cfg(), where we test for ENOENT errors. Any
> other error will cause an abort.
> 
> The use of the 'user_set' is similar to what we already do with MISA
> extensions: the flag set only if the user is changing the extension
> state.
> 
> The 'supported' flag will be used later on to make an exception for
> users that are disabling multi-letter extensions that are unknown to
> KVM.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c |   8 +++
>  target/riscv/kvm.c | 119 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 127 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5c8832a030..31e591a938 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1860,6 +1860,14 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_misa_properties(obj);
>  
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +#ifndef CONFIG_USER_ONLY
> +        if (kvm_enabled()) {
> +            /* Check if KVM created the property already */
> +            if (object_property_find(obj, prop->name)) {
> +                continue;
> +            }
> +        }
> +#endif
>          qdev_property_add_static(dev, prop);
>      }
>  
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 7afd6024e6..f2545bd560 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
>      target_ulong offset;
>      int kvm_reg_id;
>      bool user_set;
> +    bool supported;
>  } KVMCPUConfig;
>  
>  #define KVM_MISA_CFG(_bit, _reg_id) \
> @@ -197,6 +198,81 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
> +
> +#define KVM_EXT_CFG(_name, _prop, _reg_id) \
> +    {.name = _name, .offset = CPUCFG(_prop), \
> +     .kvm_reg_id = _reg_id}
> +
> +static KVMCPUConfig kvm_multi_ext_cfgs[] = {
> +    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
> +    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
> +    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> +    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> +    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
> +    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
> +    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
> +};
> +
> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
> +                            uint32_t val)
> +{
> +    int cpu_cfg_offset = multi_ext->offset;
> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    *ext_enabled = val;
> +}
> +
> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
> +                                KVMCPUConfig *multi_ext)
> +{
> +    int cpu_cfg_offset = multi_ext->offset;
> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    return *ext_enabled;
> +}
> +
> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *multi_ext_cfg = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    bool value, host_val;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_val = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +
> +    /*
> +     * Ignore if the user is setting the same value
> +     * as the host.
> +     */
> +    if (value == host_val) {
> +        return;
> +    }
> +
> +    if (!multi_ext_cfg->supported) {
> +        /*
> +         * Error out if the user is trying to enable an
> +         * extension that KVM doesn't support. Ignore
> +         * option otherwise.
> +         */
> +        if (value) {
> +            error_setg(errp, "KVM does not support disabling extension %s",
> +                       multi_ext_cfg->name);
> +        }
> +
> +        return;
> +    }
> +
> +    multi_ext_cfg->user_set = true;
> +    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -215,6 +291,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>          object_property_set_description(cpu_obj, misa_cfg->name,
>                                          misa_cfg->description);
>      }
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
> +
> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
> +                            NULL,
> +                            kvm_cpu_set_multi_ext_cfg,
> +                            NULL, multi_cfg);
> +    }
>  }
>  
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -530,6 +615,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
>      env->misa_ext = env->misa_ext_mask;
>  }
>  
> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t val;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
> +        struct kvm_one_reg reg;
> +
> +        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                                  multi_ext_cfg->kvm_reg_id);
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            if (errno == ENOENT) {
> +                /* Silently default to 'false' if KVM does not support it. */
> +                multi_ext_cfg->supported = false;
> +                val = false;
> +            } else {
> +                error_report("Unable to read ISA_EXT KVM register %s, "
> +                             "error %d", multi_ext_cfg->name, ret);
> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +                exit(EXIT_FAILURE);

TL;DR - We need to change ENOENT back to EINVAL.

I realized that I wasn't thinking clearly yesterday when I suggested we
should error out for everything but the still-nonexistent ENOENT, which
means erroring out even for EINVAL when it means "register not present".
That might be fine if we were making this ioctl due to user input, but
we're making this ioctl based on what QEMU knows about potential KVM
extension support, which means QEMU will no longer work on older KVM which
doesn't support everything QEMU knows about, regardless of user input.

We're sort of stuck here with either assuming EINVAL is most likely going
to be "register not present" and go with that, or we can't do this early
probing for extensions at all, since we can't tell the difference between
"invalid input" and "register not present".

But, there is a solution on the horizon! get-reg-list is coming soon[1].
So, I suggest we do the following:

 1. Audit KVM to ensure using EINVAL for get-one-reg's "register not
    present" is currently safe, and keep our eye on KVM to make sure
    it remains safe until get-reg-list lands.
 2. Once we have get-reg-list then use that as the authority, rather
    than trying to decide if a register is present or not by errno.
    We'll still fall back to EINVAL probing when get-reg-list isn't
    present in KVM, but we'll know it's safe to do so because of (1),
    i.e. we only fall back when we're on an already audited KVM version.

Whether or not we proceed with the EINVAL to ENOENT conversion in KVM no
longer currently matters to QEMU with this plan, but we can still do it,
as it seems more appropriate and may matter later.

[1] https://lore.kernel.org/all/cover.1688010022.git.haibo1.xu@intel.com/

Thanks,
drew

> +            }
> +        } else {
> +            multi_ext_cfg->supported = true;
> +        }
> +
> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> +    }
> +}
> +
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cpu_obj);
> @@ -542,6 +660,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>      kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
>  
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> -- 
> 2.41.0
> 

