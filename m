Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D265CC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbfod-0004To-Ed; Thu, 31 Aug 2023 07:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfob-0004TJ-NO
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:26:21 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfoY-0006If-DL
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:26:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so77443366b.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693481176; x=1694085976; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tLcHiqeAenZ6NsEuxaGG6Y80bSaQpZCgG3oLob0+r3c=;
 b=Gw+Z87IYPfqsjOxHhTaj4O7R0wdywswx4AUu4bnpAxamrMfJ1ITNoBjx/6t2N1mdhl
 1QAt+u/LdKfDcYhAOWsNL4FS/Lqt7yu6bMYD7l1ssL3TwZSTgx4Y8yerXyjNK++KhJi9
 fa07zM729zTr7bPbwP47ebsBCfVQcq5w2VV1ZXKCvpYSBIsWzb4KCTJx/3UD5YuSQ+D/
 wUquQ+xnuqCcl0SQYWpTxH2CLzhKr2PtE7nBayLr4sLZ0xsH9xcx3VFAbXop2uBKAuPo
 xSvzx4KuEH0+S8FE8IBChucCZfn07gTlBUKlsZamr0hsFPGljZWGjyqL9ol3+5YWCi7d
 g96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693481176; x=1694085976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLcHiqeAenZ6NsEuxaGG6Y80bSaQpZCgG3oLob0+r3c=;
 b=YldovM8s+AoLn/Gx2NS5LkWdl0ZcZyfBpDmWbJNY3AP/0jsoiz6ZEIYzweY8rMgm3n
 leof5CdjaRsjJyEZbAQXf4Tp3qJrr1lEIIFKg27AYAAfMIJOUcmAN24tgJZhpTENuWqr
 zKrSlL9ZgEv3WKYC5liV3JpMfuh7UJH++l+JGUAkYUiC9xHL3t5Ud1+5loYjOu2nqguT
 2NNI90yR7NEM/WopU3swruoBfhU2WbbpEp8MWoa2WPuxp21YNXtJ4JmMKTK63/gbE2O1
 cA4vSbvbFt6D9rZF+ieQmQP9hoKku6LfXfxzcV0eWWTNldZdutkuKowf681Bj9hH5dz9
 NzbQ==
X-Gm-Message-State: AOJu0YzBiWw1Fi3nQWtTXnDbPiOBS5j7Jv+WBpCkZ78Eo1GmuSzZ9DY0
 bSB2JGFzcz+b06Nf10cqTJyL7Q==
X-Google-Smtp-Source: AGHT+IFw1Yxs5GDvRtx5w7XhO7vbgBHI9g2iqfeP5ktR215z3Gg1YCdq5wAwOeFZVS/bQI/R7BHGUw==
X-Received: by 2002:a17:906:d2:b0:9a2:276d:d83c with SMTP id
 18-20020a17090600d200b009a2276dd83cmr3407937eji.18.1693481176181; 
 Thu, 31 Aug 2023 04:26:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 jw26-20020a17090776ba00b00982a92a849asm657851ejc.91.2023.08.31.04.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:26:15 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:26:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 11/20] target/riscv: introduce KVM AccelCPUClass
Message-ID: <20230831-8ace82713569aa6d2109302b@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x635.google.com
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

On Fri, Aug 25, 2023 at 10:08:44AM -0300, Daniel Henrique Barboza wrote:
> Add a KVM accelerator class like we did with TCG. The difference is
> that, at least for now, we won't be using a realize() implementation for
> this accelerator.
> 
> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
> through the 'cpu_instance_init' impl of the current acceleration (if
> available) and execute it. The end result is that the KVM initial setup,
> i.e. starting registers and adding its specific properties, will be done
> via this hook.
> 
> riscv_cpu_add_user_properties() is still being called via the common
> post_init() function, thus we still need the "if kvm then return" logic
> inside it for now. We'll deal with it when TCG accel class get its own
> 'cpu_instance_init' implementation.
> 
> riscv_add_satp_mode_properties() is now being exported from cpu.c since
> it's a common helper between KVM and TCG.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c       |  8 ++---
>  target/riscv/cpu.h       |  1 +
>  target/riscv/kvm.c       | 64 +++++++++++++++++++++++++++-------------
>  target/riscv/kvm_riscv.h |  1 -
>  4 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 58b0ef2af8..04c6bfaeef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1112,7 +1112,7 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
>      satp_map->init |= 1 << satp;
>  }
>  
> -static void riscv_add_satp_mode_properties(Object *obj)
> +void riscv_add_satp_mode_properties(Object *obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(obj);
>  
> @@ -1199,6 +1199,8 @@ static void riscv_cpu_post_init(Object *obj)
>      RISCVCPU *cpu = RISCV_CPU(obj);
>      RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
>  
> +    accel_cpu_instance_init(CPU(obj));
> +
>      if (rcc->user_extension_properties) {
>          riscv_cpu_add_user_properties(obj);
>      }
> @@ -1561,12 +1563,10 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -
>      if (kvm_enabled()) {
> -        kvm_riscv_cpu_add_kvm_properties(obj);
>          return;
>      }
> +    riscv_add_satp_mode_properties(obj);
>  #endif
>  
>      riscv_cpu_add_misa_properties(obj);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b9c4bea3f7..950c2301f2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,6 +726,7 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern Property riscv_cpu_options[];
>  
>  void riscv_cpu_add_misa_properties(Object *cpu_obj);
> +void riscv_add_satp_mode_properties(Object *obj);
>  
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 7e67121456..3c4fa43cee 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -31,6 +31,7 @@
>  #include "sysemu/kvm_int.h"
>  #include "cpu.h"
>  #include "trace.h"
> +#include "hw/core/accel-cpu.h"
>  #include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
>  #include "exec/address-spaces.h"
> @@ -1262,26 +1263,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>  }
>  
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> -{
> -    DeviceState *dev = DEVICE(obj);
> -
> -    riscv_init_user_properties(obj);
> -    riscv_cpu_add_misa_properties(obj);
> -
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> -
> -    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> -        /* Check if KVM created the property already */
> -        if (object_property_find(obj, prop->name)) {
> -            continue;
> -        }
> -        qdev_property_add_static(dev, prop);
> -    }
> -}
> -
>  static void riscv_host_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -1310,3 +1291,46 @@ static const TypeInfo riscv_kvm_cpu_type_infos[] = {
>  };
>  
>  DEFINE_TYPES(riscv_kvm_cpu_type_infos)
> +
> +static void kvm_cpu_instance_init(CPUState *cs)
> +{
> +    Object *obj = OBJECT(RISCV_CPU(cs));
> +    DeviceState *dev = DEVICE(obj);
> +
> +    riscv_init_user_properties(obj);
> +
> +    riscv_add_satp_mode_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> +
> +    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> +        /* Check if we have a specific KVM handler for the option */
> +        if (object_property_find(obj, prop->name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, prop);
> +    }
> +}
> +
> +static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_instance_init = kvm_cpu_instance_init;
> +}
> +
> +static const TypeInfo kvm_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("kvm"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = kvm_cpu_accel_class_init,
> +    .abstract = true,
> +};

blank line here

> +static void kvm_cpu_accel_register_types(void)
> +{
> +    type_register_static(&kvm_cpu_accel_type_info);
> +}
> +type_init(kvm_cpu_accel_register_types);
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index 81e08b8359..a0ea1a7505 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,7 +19,6 @@
>  #ifndef QEMU_KVM_RISCV_H
>  #define QEMU_KVM_RISCV_H
>  
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>  void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> -- 
> 2.41.0
> 
>

I'll wait for v2 to complete the review of this one.

Thanks,
drew

