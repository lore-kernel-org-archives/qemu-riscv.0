Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CF3C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 13:01:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6snJ-0007M0-KW; Wed, 07 Jun 2023 09:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6snB-0007Kg-6o
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 09:01:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6sn7-00060N-Tl
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 09:01:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so33021795e9.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686142891; x=1688734891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TeJK4NnWaOBltG8XftMyzfx5GPBD+HryeyIHH7RXrqg=;
 b=WI+KzVRt/EvAd8O1pf4OFozPTgR5xYcRaG0OejAytgJHZ5A7DAmHOdKRCIu3ta5auO
 O2tfA4l1XYSumBscMBZNMFLnfbjVu0JSuFohBG7W+iK3TKL2VShKEF88y+axRRNL6pAd
 wBrIqgzkQcSaKifOWM/KQ8EGSRhHz8v42PBrr7r/Pq77PSvpJ1IvkTOHksqrsNDzGXD3
 6fR29+HvZbyCyNK0qJX+sKu32Oc5ndsJuqU9Gc+0zj3iTP5neio5hTWADpoofqCNENDQ
 0nePZAntv02H08duvt2caBpdRnn9ufIPY3xmBJgaRrIh15v9Nc8RojZ7Wf/75sElj4le
 0L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686142891; x=1688734891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeJK4NnWaOBltG8XftMyzfx5GPBD+HryeyIHH7RXrqg=;
 b=iWE4ojsRrLYS7VIPfMtyyBjOaq4d/3H+4f/5oRchQ/tUNX5HV4YauKsjruTXUL/pm9
 WrMwIydgdex2Zh7yWlYBNveCN6JecgICWZ94rCnjvt4KmUke6GigJTdpj3UQvUT2QRHR
 HUXTuKGurzEL28vEOmAsVKaRj+rTJKPnvEFfPTKUTqoM9vEuSepc9iIsgF0me45QWBIx
 uk/ztiEQLxot/d0012xooQznhswIyBlJtPnRSzDIii8qUNCXu38+TwbBBv3Ohq4WOLwJ
 qLACzc5usQZawBox4GB+cTaaRdV99cpn7UrgcF7vO/6gbi7/loHcBScBQHh32NgA4qdo
 JIqA==
X-Gm-Message-State: AC+VfDzLfLmm3RxhmncBui4i++aTT4fqbmESwrWIpk8gb+Y/hVeBDYiP
 HuReSurGm8ILvO0h8/RrHIikQg==
X-Google-Smtp-Source: ACHHUZ7eTXCorBUCdFbzhy5byziJax2BtKJAjMSpwt3n+RLOp9LPxO/UiPjgNXqT9SauWutKEy4PmQ==
X-Received: by 2002:a7b:c3c9:0:b0:3f7:3526:d96f with SMTP id
 t9-20020a7bc3c9000000b003f73526d96fmr4794994wmj.27.1686142891607; 
 Wed, 07 Jun 2023 06:01:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adff14c000000b0030ae7bd1737sm15650670wro.45.2023.06.07.06.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 06:01:31 -0700 (PDT)
Date: Wed, 7 Jun 2023 15:01:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 16/16] target/riscv/kvm.c: read/write
 (cbom|cboz)_blocksize in KVM
Message-ID: <20230607-95d85b924e7d8696ba1eac6e@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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

On Tue, May 30, 2023 at 04:46:23PM -0300, Daniel Henrique Barboza wrote:
> If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
> Linux Kernel will fail to detect the availability of the CBOM/CBOZ
> extensions, regardless of the contents of the 'riscv,isa' DT prop.
> 
> The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
> so let's use them. We'll also expose them as user flags like it is
> already done with TCG.
> 
> However, in contrast with what happens with TCG, the user is not able to
> set any value that is different from the 'host' value. And KVM can be
> harsh dealing with it: a ENOTSUPP can be thrown for the mere attempt of
> executing kvm_set_one_reg() for these 2 regs.
> 
> We'll read the 'host' value and use it to set these values, regardless of
> user choice. If the user happened to chose a different value, error out.
> We'll also error out if we failed to read the block sizes.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 92b99fe261..7789d835e5 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -241,8 +241,16 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
>                              uint32_t val)
>  {
>      int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +    uint16_t *blocksize;
> +    bool *ext_enabled;
>  
> +    if (strstr(multi_ext->name, "blocksize")) {
> +        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
> +        *blocksize = val;
> +        return;
> +    }

We should add 'get' accessors to each property and then always use those
accessors to get the values. Trying to share a single accessor across
properties, using the names to determine their sizes, is basically trying
to reinvent 'get' without the function pointer.

> +
> +    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>      *ext_enabled = val;
>  }
>  
> @@ -250,8 +258,15 @@ static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>                                  RISCVCPUMultiExtConfig *multi_ext)
>  {
>      int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +    uint16_t *blocksize;
> +    bool *ext_enabled;
>  
> +    if (strstr(multi_ext->name, "blocksize")) {
> +        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
> +        return *blocksize;
> +    }
> +
> +    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>      return *ext_enabled;
>  }
>  
> @@ -295,6 +310,33 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>      kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>  }
>  
> +/*
> + * We'll avoid extra complexity by always assuming this
> + * array order with cbom first.
> + */
> +static RISCVCPUMultiExtConfig kvm_cbomz_blksize_cfgs[] = {

Hmm, yet another cfg struct type, and this one is specific to block sizes.
I'd rather we find a way to keep cfg definitions more general and then use
the same struct for all.

> +    {.name = "cbom_blocksize", .cpu_cfg_offset = CPUCFG(cbom_blocksize),
> +     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)},
> +    {.name = "cboz_blocksize", .cpu_cfg_offset = CPUCFG(cboz_blocksize),
> +     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)},
> +};
> +
> +static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    RISCVCPUMultiExtConfig *cbomz_size_cfg = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    cbomz_size_cfg->user_set = true;
> +    kvm_cpu_cfg_set(cpu, cbomz_size_cfg, value);
> +}
> +
>  static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>  {
>      CPURISCVState *env = &cpu->env;
> @@ -321,6 +363,45 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +static void kvm_riscv_finalize_features(RISCVCPU *cpu, CPUState *cs)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t id, reg;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
> +        RISCVCPUMultiExtConfig *cbomz_cfg = &kvm_cbomz_blksize_cfgs[i];
> +        uint64_t host_val;
> +
> +        if ((i == 0 && !cpu->cfg.ext_icbom) ||
> +            (i == 1 && !cpu->cfg.ext_icboz)) {

Rather than the required array order and this magic index stuff, we can
just save the offset of the ext_* boolean in the cfg structure, like we
already do for the *_blocksize, and then check it here.

Also, I think we want to warn here if cbomz_cfg->user_set is set. If the
user set some block size, but disabled the extension, then they should be
told that the block size will be ignored. Letting them know it's ignored
is particularly good to do since we're not validating it. I.e. the user
shouldn't assume the block size they put there is worth anything at all.

> +            continue;
> +        }
> +
> +        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              cbomz_cfg->kvm_reg_id);
> +
> +        ret = kvm_get_one_reg(cs, id, &host_val);
> +        if (ret != 0) {
> +            error_report("Unable to read KVM reg val %s, error %d",
> +                         cbomz_cfg->name, ret);
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        if (cbomz_cfg->user_set) {
> +            reg = kvm_cpu_cfg_get(cpu, cbomz_cfg);
> +            if (reg != host_val) {
> +                error_report("Unable to set %s to a different value than "
> +                             "the host (%lu)",
> +                             cbomz_cfg->name, host_val);
> +                exit(EXIT_FAILURE);
> +            }
> +        }
> +
> +        kvm_cpu_cfg_set(cpu, cbomz_cfg, host_val);
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -344,6 +425,14 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>                              kvm_cpu_set_multi_ext_cfg,
>                              NULL, multi_cfg);
>      }
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
> +        RISCVCPUMultiExtConfig *cbomz_size_cfg = &kvm_cbomz_blksize_cfgs[i];
> +
> +        object_property_add(cpu_obj, cbomz_size_cfg->name, "uint16",
> +                            NULL, kvm_cpu_set_cbomz_blksize,
> +                            NULL, cbomz_size_cfg);
> +    }
>  }
>  
>  void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
> @@ -856,6 +945,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      kvm_riscv_update_cpu_misa_ext(cpu, cs);
>      kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
> +    kvm_riscv_finalize_features(cpu, cs);
>  
>      return ret;
>  }
> -- 
> 2.40.1
> 
>

Thanks,
drew

