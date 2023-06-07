Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0042C7EE25
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 12:31:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6sJU-0002Ql-Qb; Wed, 07 Jun 2023 08:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6sJS-0002NX-Df
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 08:30:54 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6sJN-0006be-Sz
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 08:30:53 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-974f4897d87so869009266b.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686141046; x=1688733046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2hbmIiL4qojzHftVNMGlqJxGnJ4NGjH6PMKCzdLAjTA=;
 b=dckDy1pW+o8G0tpq4c7rw6HmqsjgqTz9YGRITsXVgvXAVc3WEjCaq3NRBJevSnTuPW
 YrbFut340BqgmhuLDEk2VQ1nHUqIsfKc6Xba/kkUnyLPJWAW3T8/HSqE16UUPteudI5l
 OP7nAPGfB9oiKQzsmnrAviPmf0RJpCEq9bPeQ1Zw2i1aeFFSznmaZTGg6cA9BOOLAI11
 yqrv3Neg3zBlU/d32MUbW9CCjFmzNo1LNugMpnPLNF3TNR0/h3Ug61lJ9v/95pk89sJJ
 nijc+myjocsq2Pe9XdvBr6PbFuVNtUNqXPuNFG4UfZoyR6+gRqtIKnHTN+CLOJj4u/Wy
 apmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686141046; x=1688733046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hbmIiL4qojzHftVNMGlqJxGnJ4NGjH6PMKCzdLAjTA=;
 b=gz4lxNr3FJn0H7ffT0Krzzdcf7/77krmqNVStwUvGULweUC1kgRdtjNhmZY5p/bduU
 3c77hqsmTYrbfFI2be6S3W68qu4SOdriN/PRQaJIQw10NLv2JF+1uLMHvho7nZlnBk13
 hqVoJ4u0+RnKqv0OvPcEIq1C8NoJ/GkZUJZdh52NyJF60wGQd3WRdrCwMN8SCnpLK2rk
 zgJ0GrjYNrMBI/jYdi20WWiknOcqwVCm61tLLHU9CXmExGFeKl1KJuf7fl7L98Ar8BiJ
 jdHdXGzKh6CQkA3Czbl7d8UDyo5p6QJ1SP28dse0SX2uKjqgIyQ2IQp+VudtJcraAFIs
 o8bw==
X-Gm-Message-State: AC+VfDyqolUGqsIZ2zS2s3cQGsP2lowOsZGzH8YMDJpHuYj5X9N1MGVN
 uP4ieR2/9oACcxeTYgxp3kZlFQ==
X-Google-Smtp-Source: ACHHUZ69r35ZFnYhkRGbfSxzZqjWfhVN7FOXceilZZg5E4bqToHiMcgvaOv3WLJvMUzpaQjOudaoNg==
X-Received: by 2002:a17:907:6d83:b0:977:cbaf:bc56 with SMTP id
 sb3-20020a1709076d8300b00977cbafbc56mr6437946ejc.43.1686141046540; 
 Wed, 07 Jun 2023 05:30:46 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090606cd00b00977da0f14ffsm3970301ejb.171.2023.06.07.05.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 05:30:45 -0700 (PDT)
Date: Wed, 7 Jun 2023 14:30:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 15/16] target/riscv: update multi-letter extension KVM
 properties
Message-ID: <20230607-9a3e536ad70720dd791c7e83@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-16-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-16-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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

On Tue, May 30, 2023 at 04:46:22PM -0300, Daniel Henrique Barboza wrote:
> We're now ready to update the multi-letter extensions status for KVM.
> 
> kvm_riscv_update_cpu_cfg_isa_ext() is called called during vcpu creation
> time to verify which user options changes host defaults (via the 'user_set'
> flag) and tries to write them back to KVM.
> 
> Failure to commit a change to KVM is only ignored in case KVM doesn't
> know about the extension (-EINVAL error code) and the user wanted to
> disable the given extension. Otherwise we're going to abort the boot
> process.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 675e18df3b..92b99fe261 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -295,6 +295,32 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>      kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>  }
>  
> +static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t id, reg;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
> +
> +        if (!multi_ext_cfg->user_set) {
> +            continue;
> +        }
> +
> +        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                              multi_ext_cfg->kvm_reg_id);
> +        reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +        ret = kvm_set_one_reg(cs, id, &reg);
> +        if (ret != 0) {
> +            error_report("Unable to %s extension %s in KVM, error %d",
> +                         reg ? "enable" : "disable",
> +                         multi_ext_cfg->name, ret);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -829,6 +855,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>  
>      kvm_riscv_update_cpu_misa_ext(cpu, cs);
> +    kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
>  
>      return ret;
>  }
> -- 
> 2.40.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

