Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6820BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBB1E-0002L3-Gq; Mon, 19 Jun 2023 05:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBB1C-0002KV-TS
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:17:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBB1A-0001hq-VP
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:17:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f9083d8849so24374985e9.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687166267; x=1689758267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aUEgVoZQPCq7ENmaY1xgx7J/Rynjus1pTd61rK4i/48=;
 b=FQPNF/TJQ0AcZ+nN64yfqfz9pQYKt2lXuRFYKBGxth+vZFf8rN0D9i+iKm8JlozMnh
 5bL0GF17fgKjC/FvE+iVgODFpf7m/UkJm6yz810+5u3FUxdf24i+EjfFDH733tM3Chv/
 1ehjytWHjjrPvlBikJlKZG+4pSfRRD8LfEEui3lMMWdzh4dNPtIjQlJ/8iLNzp6FU/7B
 hfzanG6/YR7NYNbjwLiPdx+XfO45UdGKozXk4sKTOoYo9rsz/3n7JoWQF+aeMOpU5GL5
 K7niAeL98v7s6YtbQ8qFw+kst2eVm+hYMKGQhpHF82qtwpdnUKcHQ3Vko2/K0FbMLRz5
 AFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166267; x=1689758267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUEgVoZQPCq7ENmaY1xgx7J/Rynjus1pTd61rK4i/48=;
 b=AmxboI8728oXlKy1P+IyfwuTjRN5CgUHnBZAtraI4Jr6qZ/CoTU8Y4ody4dUWIcdie
 NFDmDKUkErkZLzir3hYt/DMMxrcYj0BP1dHnhaQVgznJypWXcwn0+zPUXJhekKMLnw8U
 n4pzN48tcqvqJATtlD2L68ayc+3wlEhGkjZutS6Gpj5wB6jTfzfRBI+t721zYJ3OzZ0B
 xGN23HZ6MpqgVYr6jo2lWtQ0RMNTU/+h9866l5Iq1OXUonTiaUfauhpgGpp9jOmyMP3h
 W0wku93CgG6qi2Z0OcPYYilgHtckgupxwG4blZ4OQwKpWA9+K4z+N00Lr+v6cd8vCcZx
 2+MQ==
X-Gm-Message-State: AC+VfDwjw47XXfGyMUADSKdYKsEltn4Pyif69NxFQfTdV291Oq0TBRPN
 blAmavlCz3pZEGWTwZuPo2GlVg==
X-Google-Smtp-Source: ACHHUZ6bG3DmZa5m+bXXRqAQtjr60+ohPMFmUPTKr30aJxWwzG20+EmoAag0ZrWgxqlC23FKEsx/gw==
X-Received: by 2002:a7b:cd14:0:b0:3f9:b445:9038 with SMTP id
 f20-20020a7bcd14000000b003f9b4459038mr141462wmj.36.1687166267141; 
 Mon, 19 Jun 2023 02:17:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c00c900b003f9b0cfbe30sm2481061wmm.36.2023.06.19.02.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:17:46 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:17:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 12/18] target/riscv: add KVM specific MISA properties
Message-ID: <20230619-8ea679b59cf7df0b0dbd213b@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-13-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-13-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x336.google.com
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

On Tue, Jun 13, 2023 at 05:58:51PM -0300, Daniel Henrique Barboza wrote:
> Using all TCG user properties in KVM is tricky. First because KVM
> supports only a small subset of what TCG provides, so most of the
> cpu->cfg flags do nothing for KVM.
> 
> Second, and more important, we don't have a way of telling if any given
> value is an user input or not. For TCG this has a small impact since we
> just validating everything and error out if needed. But for KVM it would
> be good to know if a given value was set by the user or if it's a value
> already provided by KVM. Otherwise we don't know how to handle failed
> kvm_set_one_regs() when writing the configurations back.
> 
> These characteristics make it overly complicated to use the same user
> facing flags for both KVM and TCG. A simpler approach is to create KVM
> specific properties that have specialized logic, forking KVM and TCG use
> cases for those cases only. Fully separating KVM/TCG properties is
> unneeded at this point - in fact we want the user experience to be as
> equal as possible, regardless of the acceleration chosen.
> 
> We'll start this fork with the MISA properties, adding the MISA bits
> that the KVM driver currently supports. A new KVMCPUConfig type is
> introduced. It'll hold general information about an extension. For MISA
> extensions we're going to use the newly created misa_ext_infos[] to
> populate their name and description. 'offset' holds the MISA bit (RVA,
> RVC, ...). We're calling it 'offset' instead of 'misa_bit' because this
> same KVMCPUConfig struct will be used to multi-letter extensions later
> on.
> 
> This new type also holds a 'user_set' flag. This flag will be set when
> the user set an option that's different than what is already configured
> in the host, requiring KVM intervention to write the regs back during
> kvm_arch_init_vcpu(). Similar mechanics will be implemented for
> multi-letter extensions as well.
> 
> There is no need to duplicate more code than necessary, so we're going
> to use the existing kvm_riscv_init_user_properties() to add the KVM
> specific properties. Any code that is adding a TCG user prop is then
> changed slightly to verify first if there's a KVM prop with the same
> name already added.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 10 ++++++
>  target/riscv/kvm.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index edaf052f25..a4f3ed0c17 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1590,6 +1590,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>          const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>  
> +        /* Check if KVM didn't create the property already */
> +        if (object_property_find(cpu_obj, misa_cfg->name)) {
> +            continue;
> +        }
> +
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
>                              cpu_get_misa_ext_cfg,
>                              cpu_set_misa_ext_cfg,
> @@ -1713,6 +1718,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_misa_properties(obj);
>  
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        /* Check if KVM didn't create the property already */
> +        if (object_property_find(obj, prop->name)) {
> +            continue;
> +        }
> +
>          qdev_property_add_static(dev, prop);
>      }
>  
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 4d0808cb9a..53042a0e86 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -22,8 +22,10 @@
>  #include <linux/kvm.h>
>  
>  #include "qemu/timer.h"
> +#include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/kvm_int.h"
> @@ -105,6 +107,79 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>          } \
>      } while (0)
>  
> +typedef struct KVMCPUConfig {
> +    const char *name;
> +    const char *description;
> +    target_ulong offset;
> +    int kvm_reg_id;
> +    bool user_set;
> +} KVMCPUConfig;
> +
> +#define KVM_MISA_CFG(_bit, _reg_id) \
> +    {.name = misa_ext_infos[_bit].name, \
> +     .description = misa_ext_infos[_bit].description, \
> +     .offset = _bit, .kvm_reg_id = _reg_id}
> +
> +/* KVM ISA extensions */
> +static KVMCPUConfig kvm_misa_ext_cfgs[] = {
> +    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
> +    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
> +    KVM_MISA_CFG(RVD, KVM_RISCV_ISA_EXT_D),
> +    KVM_MISA_CFG(RVF, KVM_RISCV_ISA_EXT_F),
> +    KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
> +    KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
> +    KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
> +};
> +
> +static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
> +                                     const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *misa_ext_cfg = opaque;
> +    target_ulong misa_bit = misa_ext_cfg->offset;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    bool value, host_bit;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_bit = env->misa_ext_mask & misa_bit;
> +
> +    if (value == host_bit) {
> +        return;
> +    }
> +
> +    if (!value) {
> +        misa_ext_cfg->user_set = true;
> +        return;
> +    }
> +
> +    /*
> +     * Forbid users to enable extensions that aren't
> +     * available in the hart.
> +     */
> +    error_setg(errp, "Enabling MISA bit '%s' is not allowed: it's not "
> +               "enabled in the host", misa_ext_cfg->name);
> +}
> +
> +static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
> +        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
> +
> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
> +                            NULL,
> +                            kvm_cpu_set_misa_ext_cfg,
> +                            NULL, misa_cfg);
> +        object_property_set_description(cpu_obj, misa_cfg->name,
> +                                        misa_cfg->description);
> +    }
> +}
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -427,6 +502,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>          return;
>      }
>  
> +    kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>  
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

