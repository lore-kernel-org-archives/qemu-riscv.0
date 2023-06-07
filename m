Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641F0C7EE29
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6rQV-0003tP-1S; Wed, 07 Jun 2023 07:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6rQT-0003se-2n
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 07:34:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6rQR-0003Kd-0p
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 07:34:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30d181952a2so5178977f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 04:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686137641; x=1688729641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rPYtQx/Afz+ngVb+kmW/KyabenXb8uUYsjV5S6/5Kp8=;
 b=dRyEIjaE5wGLo8CNbV8qtjTJAnl+adtQriG5la0zLVqP/AEvEjukQfjpxHCwqK+zeF
 3/lPuqcsactvgj5s+TPu7Lkuu6Mq5l6mRh1lm/07QKB4wjhdwb7sHzGMLgQzOs8Q8Cj1
 BG99lMIzcXngMFU0PTpTr9+ZJtMPX5QFprSX8w9as32RYaqQwJcwfkpidN8u0dI3m3Ar
 OySbniI5B/g1+Fvm7AjJIyvPPm7bVuSNxtXINvPQioKXvreJPiVZ1lJlYmJKsjVoBLx6
 o/FvUbMKxsrhCdaCkvWhDGe0WtPEYa8NfgTjT+UlWKmYxPcq06Md612w8ZA6RVX0B8GO
 0qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686137641; x=1688729641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPYtQx/Afz+ngVb+kmW/KyabenXb8uUYsjV5S6/5Kp8=;
 b=CZiTn4tcVP96wLSODPlGGdAmzb0RDuu58G5yEMxnl7TPmwbBrvIcVIKupiYA6Read9
 aTC1a82tnV56HuAO5R1PN9u1X1tMTeiaMvhaulqCdLBmuyD2Uy0lLGVdnhUE5cBGJZYp
 Or3GlsykBgn6lCl2fH3ORDPnEjE0As3CpQlffASARzs5El9afNKj7UFpC2CW75tmfPrB
 OjIvCStoLGihnV/63wSbYbt4shpBetmHMPg2jIxLjA/WxPU0Mj3pdXKsOLcm4zH46CkF
 M456WlGIQiM3OIVoyKlVoxGjmOcizz2IuxX2xY63RWqAnlVy/FAoCiq8dwHYnh+I1xQl
 cGXw==
X-Gm-Message-State: AC+VfDwlC/fhWmTQx09ihl0B39NuCVztiLqQUmy1xqOx3d/h8aBKvpkt
 3eRWhIsWgqWVuquF4V1WjG9JqA==
X-Google-Smtp-Source: ACHHUZ5tmgZPdzpjZp0eLbyKpVEiGIc9SswFpQrP1KRiXfVTs+Ly55OiO2jG07ejM35t2qbUUhOPnA==
X-Received: by 2002:adf:ea8a:0:b0:30d:f75c:4a68 with SMTP id
 s10-20020adfea8a000000b0030df75c4a68mr4109682wrm.34.1686137641089; 
 Wed, 07 Jun 2023 04:34:01 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adff14c000000b0030ae7bd1737sm15443470wro.45.2023.06.07.04.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 04:34:00 -0700 (PDT)
Date: Wed, 7 Jun 2023 13:33:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 11/16] target/riscv: add KVM specific MISA properties
Message-ID: <20230606-0e7faaa57483deff11d595c2@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
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

On Tue, May 30, 2023 at 04:46:18PM -0300, Daniel Henrique Barboza wrote:
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
> that the KVM driver currently supports. The KVM version of
> RISCVCPUMisaExtConfig and kvm_misa_ext_cfgs[] are inspired by the
> existing RISCVCPUMisaExtConfig and misa_ext_cfgs[] from
> target/riscv/cpu.c. For KVM  we're adding an extra oomph in
> RISCVCPUMisaExtConfig with the 'user_set' boolean. This flag will be set
> when the user set an option that's different than what is already
> configured in the host, requiring KVM intervention to write the regs
> back during kvm_arch_init_vcpu().
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
>  target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 749d8bf5eb..3c348049a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1587,6 +1587,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
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
> @@ -1710,6 +1715,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
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
> index 4d0808cb9a..6afd56cda5 100644
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
> +typedef struct RISCVCPUMisaExtConfig {

I'd give this a name with KVM in it.

> +    const char *name;
> +    const char *description;
> +    target_ulong misa_bit;
> +    int kvm_reg_id;
> +    bool user_set;
> +} RISCVCPUMisaExtConfig;
> +
> +/* KVM ISA extensions */
> +static RISCVCPUMisaExtConfig kvm_misa_ext_cfgs[] = {
> +    {.name = "a", .description = "Atomic instructions",
> +     .misa_bit = RVA, .kvm_reg_id = KVM_RISCV_ISA_EXT_A},
> +    {.name = "c", .description = "Compressed instructions",
> +     .misa_bit = RVC, .kvm_reg_id = KVM_RISCV_ISA_EXT_C},
> +    {.name = "d", .description = "Double-precision float point",
> +     .misa_bit = RVD, .kvm_reg_id = KVM_RISCV_ISA_EXT_D},
> +    {.name = "f", .description = "Single-precision float point",
> +     .misa_bit = RVF, .kvm_reg_id = KVM_RISCV_ISA_EXT_F},
> +    {.name = "h", .description = "Hypervisor",
> +     .misa_bit = RVH, .kvm_reg_id = KVM_RISCV_ISA_EXT_H},
> +    {.name = "i", .description = "Base integer instruction set",
> +     .misa_bit = RVI, .kvm_reg_id = KVM_RISCV_ISA_EXT_I},
> +    {.name = "m", .description = "Integer multiplication and division",
> +     .misa_bit = RVM, .kvm_reg_id = KVM_RISCV_ISA_EXT_M},
> +};

I'm not a huge fan of duplicating the name and description strings. Maybe
we should put them in their own array, indexed by misa bit, in order to
share them.

 struct misa_ext_cfg_name {
     const char *name;
     const char *description;
 };

static const struct misa_ext_cfg_name misa_ext_cfg_names[] = {
    [RVA] = { "a", "Atomic instructions", },
    [RVC] = { "c", "Compressed instructions", },
    ...

#define MISA_CFG(_bit, _enabled) \
    {.name = misa_ext_cfg_names[_bit].name, \
     .description = misa_ext_cfg_names[_bit].description, \
     .misa_bit = _bit, .enabled = _enabled}

static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
    MISA_CFG(RVA, true),
    MISA_CFG(RVC, true),
    ...

#define KVM_MISA_CFG(_bit, _reg_id) \
    {.name = misa_ext_cfg_names[_bit].name,
     .description = misa_ext_cfg_names[_bit].description, \
     .misa_bit = _bit, .kvm_reg_id = _reg_id}

static const RISCVCPUKVMMisaExtConfig kvm_misa_ext_cfgs[] = {
    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
    ...

> +
> +static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
> +                                     const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> +    target_ulong misa_bit = misa_ext_cfg->misa_bit;
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
> +        RISCVCPUMisaExtConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
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
> 2.40.1
> 
>

Otherwise, LGTM.

Thanks,
drew

