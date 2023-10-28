Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F980C27C47
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 09:54:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwg1T-0007OW-AA; Sat, 28 Oct 2023 05:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwg1R-0007Nm-In
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:54:25 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwg1P-0005GA-MN
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:54:25 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so4502479a12.0
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698486862; x=1699091662; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QTmX4YTHFtV7BGo4vZBpWk+zIoCmiOKI2bZrjMIBcOY=;
 b=EkxOMgK/uQaPSAPQYupWn38ytPu9FGFmT2gOYDMWu1WzuEqZTHt5ekBg2zKk5K1aVy
 YJx3ejdoyiBCL9F3XenQNfjDDDyXvXSNsLh17vcYZfLZMu4+yafxr+OvqtlMGkTiyyG9
 b94Bh5Ci0kZq3x9+csXQIPhFXOCA+LCMA+UtNQkN7izdvsQUV0GKdDeZQlW+ZxoedE1N
 z76mFtpC5UetQc8Dn7OgY6K/f1orbNUWbn9NyMOuNKky09BhE5n9xiJ7Ufv3oQTh+OIh
 jdsaZkUlBA0LUcDaePUeiRlusF4GIEK3dqkHGNtmCmasx0XjGwpN3SkBNTwTgR+kNOE+
 p2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698486862; x=1699091662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTmX4YTHFtV7BGo4vZBpWk+zIoCmiOKI2bZrjMIBcOY=;
 b=GMTavuAEaL2AMK82y76vaWCSmN0/+kODtCnZPYqLBcl5Pb4bePau+Q5FYVcEwCG1J2
 4VOHfAd1kkqrPxI/e9RFPhqFAJtayRYUyaLe0znDAAMGyZJzCtikEMQFz6zkfei9K6Nj
 oJyz7TSegfsokgP5+Z43M3Anz5fPpj8ng5cIIYco5xQUM0eEGHcn4CYoVg45gcRRjJQC
 zEEtgwKdA8F/fkQmOyePludPkOQXCjhdUpW1Of/X2heNW55C3EZFACCnvvMJq3NSN+fR
 o92fMyLEx7uQ0VCdluLD7mn2/G183HYXmdlWoKDIfmnBScF8YXblZPiKixmmZS3eqs3O
 FO+g==
X-Gm-Message-State: AOJu0YzMsavKjSBxdCI1tZvmF+KxvB4NYwiHsYfO9NYcsH+EPnzTOnjf
 Hggh85TdBu7YQtfWMAGpLZ5Vng==
X-Google-Smtp-Source: AGHT+IFSqZ9lq/+phvrpQl0nRp7n0JJXTh2gSKMyyA4FsFkEmwUUbCO+sHdr0kv3PZ4R9ciPS7wYsQ==
X-Received: by 2002:aa7:d755:0:b0:541:29c8:9575 with SMTP id
 a21-20020aa7d755000000b0054129c89575mr3820942eds.28.1698486861955; 
 Sat, 28 Oct 2023 02:54:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a50ab49000000b0053da3a9847csm2650360edc.42.2023.10.28.02.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 02:54:21 -0700 (PDT)
Date: Sat, 28 Oct 2023 11:54:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v6 02/12] target/riscv/tcg: add 'zic64b' support
Message-ID: <20231028-0df8dcdfecb63395027b9930@orel>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028085427.707060-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52a.google.com
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

On Sat, Oct 28, 2023 at 05:54:17AM -0300, Daniel Henrique Barboza wrote:
> zic64b is defined in the RVA22U64 profile [1] as a named feature for
> "Cache blocks must be 64 bytes in size, naturally aligned in the address
> space". It's a fantasy name for 64 bytes cache blocks. The RVA22U64
> profile mandates this feature, meaning that applications using this
> profile expects 64 bytes cache blocks.
> 
> To make the upcoming RVA22U64 implementation complete, we'll zic64b as
> a 'named feature', not a regular extension. This means that:
> 
> - it won't be exposed to users;
> - it won't be written in riscv,isa.
> 
> This will be extended to other named extensions in the future, so we're
> creating some common boilerplate for them as well.
> 
> zic64b is default to 'true' since we're already using 64 bytes blocks.
> If any cache block size (cbo{m,p,z}_blocksize) is changed to something
> different than 64, zic64b is set to 'false'.
> 
> Our profile implementation will then be able to check the current state
> of zic64b and take the appropriate action (e.g. throw a warning).
> 
> [1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 15 ++++++++++++---
>  target/riscv/cpu.h         |  3 +++
>  target/riscv/cpu_cfg.h     |  1 +
>  target/riscv/tcg/tcg-cpu.c | 14 ++++++++++++++
>  4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6c0050988f..316d468a19 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1396,6 +1396,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
> +    MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  /* Deprecated entries marked for future removal */
>  const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
> @@ -1425,9 +1431,12 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>  
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> -    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
> +                       cfg.cbom_blocksize, CB_DEF_VALUE),
> +    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU,
> +                       cfg.cbop_blocksize, CB_DEF_VALUE),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
> +                       cfg.cboz_blocksize, CB_DEF_VALUE),

I wouldn't introduce the CB_DEF_VALUE define. I state why below.

>  
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8efc4d83ec..ee9abe61d6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -64,6 +64,8 @@ extern const uint32_t misa_bits[];
>  const char *riscv_get_misa_ext_name(uint32_t bit);
>  const char *riscv_get_misa_ext_description(uint32_t bit);
>  
> +#define CB_DEF_VALUE 64
> +
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>  
>  /* Privileged specification version */
> @@ -745,6 +747,7 @@ typedef struct RISCVCPUMultiExtConfig {
>  extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>  extern Property riscv_cpu_options[];
>  
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2203b4c45b..f61a8434c4 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -108,6 +108,7 @@ struct RISCVCPUConfig {
>      bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
> +    bool zic64b;
>  
>      uint32_t mvendorid;
>      uint64_t marchid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 093bda2e75..65d59bc984 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -264,6 +264,18 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>      }
>  }
>  
> +static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
> +{
> +    cpu->cfg.zic64b = cpu->cfg.cbom_blocksize == CB_DEF_VALUE &&
> +                      cpu->cfg.cbop_blocksize == CB_DEF_VALUE &&
> +                      cpu->cfg.cboz_blocksize == CB_DEF_VALUE;

The zic64b name has an explicit 64 in it, so CB_DEF_VALUE must be 64,
which implies it should also be named something with an explicit 64
in it. However, there's really no point in doing

 #define NUM_64 64

so I'd just drop the define altogether.

> +}
> +
> +static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
> +{
> +    riscv_cpu_validate_zic64b(cpu);
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -586,6 +598,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>          return;
>      }
>  
> +    riscv_cpu_validate_named_features(cpu);
> +
>      if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>          /*
>           * Enhanced PMP should only be available
> -- 
> 2.41.0
>

Thanks,
drew

