Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 09:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEnhP-0007Hh-0s; Thu, 29 Jun 2023 05:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnhM-0007H4-Lc
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:12:20 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnhK-0001zV-1H
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:12:19 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso681219e87.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 02:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688029936; x=1690621936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HDSBkPmcfrv0tpBz5dshRAlYttJxhnBgtaSTkU393og=;
 b=lBQoocV4kq1yPV5vZ1xLKB8PEAsF/7j2DbqcPqhN9YBbl8jo+1wZ/upgUCK1X6tRHm
 BDqVshoAmIkfbqmwOMoejQJv8wM9LtWdG5uzFrI2XFjuGwajRXVgCBJJq+9YB04xpFDM
 l9cklDTrN+ywz4/koI+Le+RpX7UZ4ksFE99SXe4KsRGT4TVg+QWuyl5mnYQjE6zinc4x
 FDyowUKefm/qihTO0jNY/HmZ52htmJRJd+lq0+TuhcMusCd54NLniZ3BOJtOSYfwSZsV
 /vblSA1TGwvkqwcveWrq+KK2+uFPTv7P2ai5V0oyRWf5+e3RR+jZRUX3x2UUYzConF+v
 VLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688029936; x=1690621936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDSBkPmcfrv0tpBz5dshRAlYttJxhnBgtaSTkU393og=;
 b=Dcq68AQVxM8mxq82MfL7M53rF1x6ERemEleZsV5qtJ15e3r5qAp2Z2QSre5KK8aBYa
 H0TpGaLx8cAjEyol22sB7j+/RhIm1/BRuzHYsXVST4Ffpy531FBefN6JfUBF29fsNqde
 hgxiVY8eBfB0ppJj/rttTDURTS7SmgoLoppzti5YlStgb3pSicrFC+dbJVV6O76Vkrfh
 Jfz1tC9BQ3BmBBOKkdwVcyAP7MXvXXFU7IBWZrZ2+TnqRVnYv48rxn/FqHMW/a3qdfIU
 WIHOMpnWdsMUTm3NgujU5Y/tZoWOMskCQ9N5EFGgl/3qwuMA32Ey87iZWCnE8Kh+ic0t
 Lo7g==
X-Gm-Message-State: AC+VfDwrDcZC46Nseq+ZKl53Xl1is9Wgx8RFnxY+VF9yloHxKGDLrbtr
 o8QbI1tXRmEW4l6Io2xbIxRyFw==
X-Google-Smtp-Source: ACHHUZ7vf8CScUE1WUSViK/v3atG4piu1FgesAwhTLa9PtRaaLoFnQRG8rpuMdNM851stjBMcSPVwQ==
X-Received: by 2002:a05:6512:3246:b0:4fb:8926:b12f with SMTP id
 c6-20020a056512324600b004fb8926b12fmr3999798lfr.26.1688029935692; 
 Thu, 29 Jun 2023 02:12:15 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a5d6e85000000b003063a92bbf5sm15530159wrz.70.2023.06.29.02.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 02:12:15 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:12:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 12/20] target/riscv: add KVM specific MISA properties
Message-ID: <20230629-549d312bafe3d5b913ca2048@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-13-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628213033.170315-13-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x131.google.com
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

On Wed, Jun 28, 2023 at 06:30:25PM -0300, Daniel Henrique Barboza wrote:
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
> extensions we're going to use the newly created getters of
> misa_ext_infos[] to populate their name and description. 'offset' holds
> the MISA bit (RVA, RVC, ...). We're calling it 'offset' instead of
> 'misa_bit' because this same KVMCPUConfig struct will be used to
> multi-letter extensions later on.
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
>  target/riscv/cpu.c | 13 +++++---
>  target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 90dd2078ae..f4b1868466 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1617,14 +1617,19 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  
>      for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>          RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        Error *local_err = NULL;
>  
>          misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
>          misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);
>  
> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
> -                            cpu_get_misa_ext_cfg,
> -                            cpu_set_misa_ext_cfg,
> -                            NULL, (void *)misa_cfg);
> +        object_property_try_add(cpu_obj, misa_cfg->name, "bool",
> +                                cpu_get_misa_ext_cfg, cpu_set_misa_ext_cfg,
> +                                NULL, (void *)misa_cfg, &local_err);
> +        if (local_err) {
> +            /* Someone (KVM) already created the property */
> +            continue;
> +        }

This assumes object_property_try_add() only fails when it detects
duplicate properties. That's currently true, but it's not documented,
so I'm not sure we should count on it. Also, if we do want to assume
only duplicate properties generate errors, then we can pass NULL for
errp and just check the return value of the call, as it'll be NULL on
failure.

> +
>          object_property_set_description(cpu_obj, misa_cfg->name,
>                                          misa_cfg->description);
>          object_property_set_bool(cpu_obj, misa_cfg->name,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 4d0808cb9a..0fb63cced3 100644
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
> @@ -105,6 +107,81 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
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
> +    {.offset = _bit, .kvm_reg_id = _reg_id}
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
> +        int bit = misa_cfg->offset;
> +
> +        misa_cfg->name = riscv_get_misa_ext_name(bit);
> +        misa_cfg->description = riscv_get_misa_ext_descr(bit);
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
> @@ -427,6 +504,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>          return;
>      }
>  
> +    kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>  
> -- 
> 2.41.0
>

Thanks,
drew

