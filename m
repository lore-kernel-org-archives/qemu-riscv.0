Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2188EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 12:15:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHNsq-00016U-GW; Thu, 06 Jul 2023 08:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHNso-00015y-8H
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 08:14:50 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHNsj-0004Bz-UH
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 08:14:49 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-986d8332f50so81063166b.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688645684; x=1691237684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U61ZIYXOtn/DXa6IKteFBkd4ezxGa8EA5k+Kmu58Rhg=;
 b=VzcTuHvTpcyo1yGGwZHA0jkobstDFXi0GyrKsubY49Lqzi5Foh1SBDFQueMNy+IgAE
 jVuw5KG/1m6iEaKl1QMTBsQhAZoW4yx5nzv53fhF/aokfXFARMnT/PcW2sNMjnYsVnqK
 j0n/BVU2Ee21t6xL0bh1ugt84sw4ksKLH3HCONbvDXRTdVGEAYZWe8PFfzInQ2Gadeve
 /qPg735V+LgKtBJzQqruv5bm5sFtreVIq9urGEVqLnEszu8H6uCLxFnlssQOeTPETO/p
 OOU4zETHTeobidPTOj0RPZZmWvUrEuIda5UEQjbuezyvDE9nd7yb9VGk/EwlN8dYL4qd
 ysnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688645684; x=1691237684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U61ZIYXOtn/DXa6IKteFBkd4ezxGa8EA5k+Kmu58Rhg=;
 b=SSxAsCTWnNMYqBs/edIjeTflR+d3VQla0tjzzjcYOXrvCkSgCYJq6lCGWXWZA5Bv33
 H4V2gY56rH0z28+GCcTYGRXaHyK+d+wiNHYyaYvP0ZXsv9Pn28nMWSTFvet7CbuA5kk+
 VqryxRZ+i5z484km0NVaFRi7pwKN7An1tcbNzSfbSzuYypf6ySlJ35v1oSwvnKbXwvyQ
 elbRz4r/3HtzvN3XZaBYNA2TS+j4FF3Ba34XpXJQVH6K7FJG+dSLa/2Yob+/Vq03tPiZ
 z74E9a70BcAVnWphLIqPoGKP19KLR7JWOrVA2+KDV1lwfmEvqKAMh6xXzycW8Zt8EZT4
 +5Qw==
X-Gm-Message-State: ABy/qLY9ci6e/aCVye7GQmK31BOITRmu1CsbbBiJK+1swG8oyFYSaDv3
 GSrpH10wNfc4Se1mh4IRvDgMiA==
X-Google-Smtp-Source: APBJJlFglHTG0xo+RRvB4vjL33v8R4wAFfpLEOtsoIpLjN2UIzSXvU1Oeah/CFvP10rtoUjc5NspsA==
X-Received: by 2002:a17:906:c30e:b0:992:16bb:2b6e with SMTP id
 s14-20020a170906c30e00b0099216bb2b6emr1100325ejz.29.1688645684101; 
 Thu, 06 Jul 2023 05:14:44 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 jt5-20020a170906dfc500b0098822e05539sm735379ejc.191.2023.07.06.05.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 05:14:43 -0700 (PDT)
Date: Thu, 6 Jul 2023 14:14:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v9 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
Message-ID: <20230706-b3ce7ed0f6265c69afad8d90@orel>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-15-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706101738.460804-15-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
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

On Thu, Jul 06, 2023 at 07:17:32AM -0300, Daniel Henrique Barboza wrote:
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
                                                   ^ EINVAL

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
> index 7afd6024e6..2d39ec154f 100644
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
> +            if (errno == EINVAL) {
> +                /* Silently default to 'false' if KVM does not support it. */
> +                multi_ext_cfg->supported = false;
> +                val = false;
> +            } else {
> +                error_report("Unable to read ISA_EXT KVM register %s, "
> +                             "error %d", multi_ext_cfg->name, ret);
> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +                exit(EXIT_FAILURE);
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

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

