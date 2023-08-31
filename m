Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2252AC83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:48:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbh5T-0007CQ-1j; Thu, 31 Aug 2023 08:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbh5C-0007Aj-HI
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:47:41 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbh55-00029N-Sz
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:47:31 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso425200966b.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693486045; x=1694090845; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wE+CPuSny35cVHZvMe7RkMz+Zl+YRsPgMfw+4FYzHhQ=;
 b=du7AS8LY+HCptcd0DX9nZf+NQdUQVayIPOVPLd/bxrzJZl9XuzhsfKWtBS9RcEB5Uz
 x8g72LE62HClWlolGgycqQVOYd3hSLpQCRkr1niUqNLFQm6nhQq3ze86vAJX6kcs780p
 ymskKyWYVnS198/nD53Ym+J0ex7iGUe0u1kY1bl7lg9pOo2kg7kV0s+0tLbw3qz+Zcd4
 ibDdBMY6ECoYXQVBDmIThLp4WaHfC6TEEbFNCPbFhStaRBJkvY3olZgjjzuwxSKSWj/U
 IFjKNugYD00Xaknnj7+t6Bbs7h5wpOcgkAnP7EMeGMzNcKcOHyo2f5gLvgQKHiEeQciX
 0jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486045; x=1694090845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wE+CPuSny35cVHZvMe7RkMz+Zl+YRsPgMfw+4FYzHhQ=;
 b=DyHPxr9K8TrWeDFoqWuiZ0H4r3+2CH4QWbP0K7MSuchAugsXLfX3//myzJrqudfW3w
 ogvAlpzvXaur1onH69YDuoX0b3kILszQwrrbPS5J/Y1JHpDi1p4S/Hp9NVQVCFiMoUTv
 GENgQb7ynKCaecWGF2/j6hP2yc0FCBFF3+s0B0hPenjTbOU7qb8dlEsq0W6+q5aXZ8td
 /CtxBgLY0/7EK6TZM82Mb1dA20XO8e067tPeOtPHEzkgQL7evtT6tx5A0mYiQ3XufNHg
 ksAmhrM8jhlgOIAEEW8fSX0fVf/2kznPk26EtHADaLK7oeMRaRKBUT/hfEZKbhCxDMZU
 W0Nw==
X-Gm-Message-State: AOJu0YzzVYE3MtYar4NgQfkHiK5AvsKQmFN25GbgXqjbMt8I6w/1rlTi
 QIPzvTytiHtPXF+9emBkKCeKbQ==
X-Google-Smtp-Source: AGHT+IFPtHGClKf+Ne2KZZWy4Wq3EilHMitnEr7A9TpjtMedFpD+T1ieroBMODUdI/GSb7+CwykhMg==
X-Received: by 2002:a17:907:a076:b0:9a1:df30:e158 with SMTP id
 ia22-20020a170907a07600b009a1df30e158mr2758334ejc.36.1693486044891; 
 Thu, 31 Aug 2023 05:47:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a1709064ec200b0099bc8db97bcsm725885ejv.131.2023.08.31.05.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:47:24 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:47:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 20/20] target/riscv: add 'kvm_supported' class property
Message-ID: <20230831-786fd32dfa7014f439b69775@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-21-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-21-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 25, 2023 at 10:08:53AM -0300, Daniel Henrique Barboza wrote:
> This follows the same idea of 'tcg_support' property added in the
> previous patch. Note that we're now implementing the 'cpu_realizefn' for
> the KVMAccel class since this verification is done in realize() time.
> 
> Supporting vendor CPUs with KVM is not possible. We rely on the
> extension support of the KVM module running in the host, making it
> impossible to guarantee that a vendor CPU will have all the required
> extensions available. The only way to guarantee that a vendor CPU is KVM
> compatible is running KVM in a host that has the same vendor CPU, and

Or to attempt to enable each extension which the vendor CPU expects and
to attempt to disable everything else. If all those actions succeed, then
we can override the ID registers with those of the CPU we want to model
and go for it. There's still risk, though, that the guest kernel will see
the ID registers of the model and attempt to apply some errata workaround
which may or may not work and/or crash the guest.

> for this case we already have the 'host' CPU type.
> 
> We're better of declaring that all vendors CPUs are not KVM capable.
> After this patch, running KVM accel with a vendor CPU will produce an
> error like the following:
> 
> $ ./qemu-system-riscv64 -M virt,accel=kvm -cpu veyron-v1
> qemu-system-riscv64: 'veyron-v1' CPU is not compatible with KVM acceleration

Shouldn't we at least check if the host matches the requested CPU first?
So, if we happen to be on a veyron-v1, then the veyron-v1 model should
be equivalent to 'host'. (They may not be 100% equivalent in practice, but
theoretically they should be, which means trying it and debugging the bugs
should improve the CPU models on both sides.)

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h     |  1 +
>  target/riscv/cpu.c         |  1 +
>  target/riscv/kvm/kvm-cpu.c | 24 ++++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index e86b76f9fe..32d9bb07b4 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -72,5 +72,6 @@ struct RISCVCPUClass {
>  
>      bool user_extension_properties;
>      bool tcg_supported;
> +    bool kvm_supported;
>  };
>  #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f749ea2a2e..73302bb72a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1646,6 +1646,7 @@ static void riscv_dynamic_cpu_class_init(ObjectClass *c, void *data)
>  
>      rcc->user_extension_properties = true;
>      rcc->tcg_supported = true;
> +    rcc->kvm_supported = true;
>  }
>  
>  static void riscv_vendor_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 501384924b..85f3b8c80e 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1289,6 +1289,7 @@ static void riscv_kvm_cpu_class_init(ObjectClass *c, void *data)
>      RISCVCPUClass *rcc = RISCV_CPU_CLASS(c);
>  
>      rcc->user_extension_properties = true;
> +    rcc->kvm_supported = true;
>  }
>  
>  static const TypeInfo riscv_kvm_cpu_type_infos[] = {
> @@ -1302,6 +1303,28 @@ static const TypeInfo riscv_kvm_cpu_type_infos[] = {
>  
>  DEFINE_TYPES(riscv_kvm_cpu_type_infos)
>  
> +/*
> + * We'll get here via the following path:
> + *
> + * riscv_cpu_realize()
> + *   -> cpu_exec_realizefn()
> + *      -> kvm_cpu_realizefn() (via accel_cpu_realizefn())
> + */
> +static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
> +
> +    if (!rcc->kvm_supported) {
> +        g_autofree char *name = riscv_cpu_get_name(rcc);
> +        error_setg(errp, "'%s' CPU is not compatible with KVM acceleration",
> +                   name);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  static void kvm_cpu_instance_init(CPUState *cs)
>  {
>      Object *obj = OBJECT(RISCV_CPU(cs));
> @@ -1328,6 +1351,7 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>  
>      acc->cpu_instance_init = kvm_cpu_instance_init;
> +    acc->cpu_realizefn = kvm_cpu_realizefn;
>  }
>  
>  static const TypeInfo kvm_cpu_accel_type_info = {
> -- 
> 2.41.0
> 
>

I don't think we want kvm_supported nor tcg_supported as they necessarily
bring accelerator knowledge into target/riscv/cpu.c, where the booleans
have to be set. It would be better if the decisions as to what is
supported or not are made in the accelerator's respective files. So, we
try to realize some model with some accel and let that accel do some
checks and error out when it can't. If riscv kvm only supports 'host',
then it's check would simply be "is the model host?" and the inverse for
tcg.

Thanks,
drew

