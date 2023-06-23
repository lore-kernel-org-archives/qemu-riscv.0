Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33137EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:39:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCdFa-0002KV-V9; Fri, 23 Jun 2023 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qCdFU-0002Js-Er
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 05:38:40 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qCdFS-0002G7-Pr
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 05:38:36 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso459648a12.0
 for <qemu-riscv@nongnu.org>; Fri, 23 Jun 2023 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687513113; x=1690105113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ab132ZdDQFKK0Ya4S2yVT+ijwroFyrIOxReI8tRSXog=;
 b=S/KLqlz8yPFgtSp+7xAJ3PiTcrRfr5seTNbM+s7Zhl2qWg1eeUMkO2uH4i9utP7KqX
 D0mWH9q6lHxMHMe3VA7h1f61X9b6XrcoOquunujZnxIbwomoXc5d7hCyD2hdcH0Yvji/
 GbszRU44oPljom2xCMM2yAr8A1N/2XHfktvhygI2O5f/fKacklWRXHxRWq0t2jYO0ekL
 iREonlfXb85tOm5hUVSd1HtVVgWesc++3hX0WONza2Gnq4rsAAyUvJV1Yqf1tox9JtvK
 8UZ70A/xiV1pKxyEUIBMpllMz7rrAjwp3RFxWUxHTTlV4ASdMFE5xduNeR7Bz3woCD/a
 I9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687513113; x=1690105113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ab132ZdDQFKK0Ya4S2yVT+ijwroFyrIOxReI8tRSXog=;
 b=gvlG3qvrbDgAwTIBen0owpPzgNWwf+g40BTwSqoP3zkQEBZKlqN1+pxVd5IcZp70Go
 Fsev1h0UEA8Mn0vQ5eGF5EXzR8/e6ynXXm7eTt4C3Jb1zjQXvZpFwtV3MJdGPnuGMhaP
 IqP9lPO6wyfi8MpKVfWCk3l91agM9GLPWbKNBtjKkT2J8+Kl75DtFlFsYJcHGd1+wJr/
 2/E3nWYo3mviL9eI0VhhOFZeZG+b6Hw4ZgJp9GuTYvAOe8LmoGuX5CduypH/XITY90+V
 9OTUlqtSmrkKgiu4XwX9ISI9r1LXRXqizVEsUq26/IKP0tijL7Hbd4amQmcD2rVXEEaZ
 ypyw==
X-Gm-Message-State: AC+VfDz1+ybXJM6YLaO1Q4TvZ/1zg8cswXlDVSlfEQzmrwatSree4UrL
 FVvo3ZP2PrEmx9ee/aXRM7BIug==
X-Google-Smtp-Source: ACHHUZ5fOuIKaoR4pvHs08mkz3MwaJ4oxXxnLIRUdKv3RKbuHsEwOGUO3S69SeKW8AOGotIklI8cPw==
X-Received: by 2002:a17:907:5ca:b0:987:59b6:c9fa with SMTP id
 wg10-20020a17090705ca00b0098759b6c9famr16823820ejb.19.1687513113123; 
 Fri, 23 Jun 2023 02:38:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a170906454d00b00988f168811bsm5716198ejq.135.2023.06.23.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 02:38:32 -0700 (PDT)
Date: Fri, 23 Jun 2023 11:38:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v3 12/19] target/riscv: add KVM specific MISA properties
Message-ID: <20230623-df5c527b7dae3e28123be577@orel>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
 <20230622135700.105383-13-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622135700.105383-13-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
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

On Thu, Jun 22, 2023 at 10:56:53AM -0300, Daniel Henrique Barboza wrote:
...
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
...
> +static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
> +        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
> +        int bit = misa_cfg->offset;
> +
> +        misa_cfg->name = misa_ext_info_arr[bit].name;
> +        misa_cfg->description = misa_ext_info_arr[bit].description;

I'd prefer these be set by KVM_MISA_CFG(), since we can. No need to wait
until runtime if we can do it at compile-time.

Thanks,
drew

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

