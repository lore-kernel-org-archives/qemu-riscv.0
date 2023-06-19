Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4D5EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBBDS-00025j-Pp; Mon, 19 Jun 2023 05:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBDR-00025P-UO
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:30:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBDQ-0004u2-2K
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:30:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f69so17063355e9.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687167026; x=1689759026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wAdXfV6oMV6qYuPQo7M1lHfoyYk0B8iIVA7SV2S21Io=;
 b=AKK+sZSAFerzDmYBYy/GMTV2drHSn5uCoFEM3J/WK/UY1R/HA4IWb5sFQ/f5mzxwhT
 /KK5OlsnbGxUcPln+H4tzsO1pdnuwjk0nmhksmPqmzOFtnUuIOwaVJC6gvv8e3nIweoo
 ilPXESAALsrTEayyOP+V/wdmVinKyH0m4p2U5gj1aB96fV5qwRB7HFxUxYrpz5F8XKA5
 CWFYxQyRJLeaF6eZLjTIQhFA0uzwaS3MN7MeVaIVFW7XVfahSgaboIoTeqnVF4F36aOB
 sQZkcmbK6fSkzgqsF7kR4EBMkan+u/7JOw/oyyNgB8Hd33KRFoNxcuZzIcG3XQQQetDC
 CL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687167026; x=1689759026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAdXfV6oMV6qYuPQo7M1lHfoyYk0B8iIVA7SV2S21Io=;
 b=h0ndoz//WPdBbn2jISjdChvqIzvVQcawjquqAqg2s/R88UzfaZhyUSNaziiwIjHOkQ
 rj8Es4Wwt+D3RnCkUCwBlM09GRNz8g4KbSQgXosgVcf67oyGu3Vu3FeQT8OLi+52yIE9
 mmEdXkJdH9pUDlDJVzZAHT0ZbvG+/g3aG7S5Ta268MREg4P/z8FPy9gI0LrubXRBqkQz
 Htz26Oyks+e1rUQDc8Ldfh3ucPcEG+FYCsVPAb2K563xKxiMyflUQsrxfIzKrBETq/oK
 EHljIK2No9/urZnkKQa4wbMZdD1kXg59iUnRn2SMejKHUpYRJEaivQhBOlkZBSpdmfnX
 RAvQ==
X-Gm-Message-State: AC+VfDwHt4obYN7iNeo7hqiZypd3qPfYpRJfz+uqpXpeuuCb9dpCf6PB
 O+YIr3uA1SzvaVTTcU8VTi21UA==
X-Google-Smtp-Source: ACHHUZ4/bCAto8X7e5qdYYRnSZ+xCMS0tuuxiIeIevWGd+ih1TCtojs2Bl4+6Qr7CfcEOQ1HUE6zMQ==
X-Received: by 2002:a7b:c7cb:0:b0:3f9:b0fe:7e12 with SMTP id
 z11-20020a7bc7cb000000b003f9b0fe7e12mr1085610wmk.4.1687167026175; 
 Mon, 19 Jun 2023 02:30:26 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a1cf615000000b003f8126bcf34sm10066232wmc.48.2023.06.19.02.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:30:25 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:30:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 13/18] target/riscv/kvm.c: update KVM MISA bits
Message-ID: <20230619-112b16a398dd1d25e7be2608@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-14-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-14-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
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

On Tue, Jun 13, 2023 at 05:58:52PM -0300, Daniel Henrique Barboza wrote:
> Our design philosophy with KVM properties can be resumed in two main
> decisions based on KVM interface availability and what the user wants to
> do:
> 
> - if the user disables an extension that the host KVM module doesn't
> know about (i.e. it doesn't implement the kvm_get_one_reg() interface),
> keep booting the CPU. This will avoid users having to deal with issues
> with older KVM versions while disabling features they don't care;
> 
> - for any other case we're going to error out immediately. If the user
> wants to enable a feature that KVM doesn't know about this a problem that
> is worth aborting - the user must know that the feature wasn't enabled
> in the hart. Likewise, if KVM knows about the extension, the user wants
> to enable/disable it, and we fail to do it so, that's also a problem we
> can't shrug it off.
> 
> For MISA bits we're going to be a little more conservative: we won't
> even try enabling bits that aren't already available in the host. The

I don't think any extensions should try to enable anything KVM doesn't
advertise. Even if it somehow works, the lack of advertisement is a
KVM bug and QEMU not trying to enable it without the advertisement would
help flush that out. IOW, MISA bits shouldn't be "more conservative",
all extensions should be fully conservative.

> ioctl() is so likely to fail that's not worth trying. This check is
> already done in the previous patch, in kvm_cpu_set_misa_ext_cfg(), thus
> we don't need to worry about it now.
> 
> In kvm_riscv_update_cpu_misa_ext() we'll go through every potential user
> option and do as follows:
> 
> - if the user didn't set the property or set to the same value of the
> host, do nothing;
> 
> - Disable the given extension in KVM. Error out if anything goes wrong.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 53042a0e86..ea38f91b92 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -164,6 +164,41 @@ static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
>                 "enabled in the host", misa_ext_cfg->name);
>  }
>  
> +static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t id, reg;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
> +        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
> +        target_ulong misa_bit = misa_cfg->offset;
> +
> +        if (!misa_cfg->user_set) {
> +            continue;
> +        }
> +
> +        /* If we're here we're going to disable the MISA bit */
> +        reg = 0;
> +        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                              misa_cfg->kvm_reg_id);
> +        ret = kvm_set_one_reg(cs, id, &reg);
> +        if (ret != 0) {
> +            /*
> +             * We're not checking for -EINVAL because if the bit is
> +             * about to be disabled means that it was already enabled
                                      ^, it

> +             * by KVM, something that we determined by fetching the
> +             * 'isa' register during init() time. Any error at this
> +             * point is worth aborting.
> +             */
> +            error_report("Unable to set KVM reg %s, error %d",
> +                         misa_cfg->name, ret);
> +            exit(EXIT_FAILURE);
> +        }
> +        env->misa_ext &= ~misa_bit;
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -630,8 +665,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
>          ret = kvm_vcpu_set_machine_ids(cpu, cs);
> +        if (ret != 0) {
> +            return ret;
> +        }
>      }
>  
> +    kvm_riscv_update_cpu_misa_ext(cpu, cs);
> +
>      return ret;
>  }
>  
> -- 
> 2.40.1
>

Besides the commit message clarification and the code comment typo,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

