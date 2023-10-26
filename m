Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19372C25B48
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 12:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvz6n-00017F-6e; Thu, 26 Oct 2023 08:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvz6k-00014X-BJ
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:05:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvz6f-0000Rw-Ku
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:05:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso6771575e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698321895; x=1698926695; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f6RXYt+YQGtGytdqTnF1+h30ognw1xYCs37KVcKHPW4=;
 b=eQXTt+ZCAC/44o1+yvBULr5b5xY4pQ70OYqTmbGJDpw8js+b8jdFZGrfhJiy3kHj0R
 gV4dduh41lcgKL6NOJ3AIbrF7yQhn7Czq+hLCAzw6ITEciMV3C+ShhpfpHboamBGFf/v
 2WKT2kmWr6MQrArI/yFiBqOQwwiKoyZY1uIxxryKaS2ov1URfLLsvjkEJU3yPr/zEk7b
 QXT8j8ysq83aFbHAFvho1cJgeh12aSDXV00b7Yt460z1dIskkVTwKIjdG4ISjuQUdFMY
 NW16lSEKZDnaNn45HpXdLNpoylygh0iUM/gywx+Bx6ppDplZ88TrcLExkMlIWJZxwnuW
 RAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698321895; x=1698926695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6RXYt+YQGtGytdqTnF1+h30ognw1xYCs37KVcKHPW4=;
 b=D5u9kiKozEzO2pnuaui2jzpfLkDydwoTCsTMyFEUtG6Wborfxy79H3wr2HU1doLbPB
 otDSW428jU99kX3lNDiAf72BUs09UoiVKYDshlQPz9QeNBC+eOk9v9zWhrCBiMfvAiOx
 WnQBGSFko98Au2HSctvptevI4bnVWnCAaux5g9zHi7lpedoqEehUuMV7nQ6OpbEydK+c
 Y6qfTx6qiJqfdFUhvau4LSkP5ax5KB39O2OX7RLKxtE1PFAsJ593CHmX7JwpkK6wAM95
 nZxtGfYhTXP4OAc7N/4BsQqrHUe9Y6mQMOaw96bSsv1TybqQFKEh4HbNMl2ICJn0hw2T
 lnxA==
X-Gm-Message-State: AOJu0YzrohQEzGKDXTfdhiYIbFDZiyo+wA8dLFhHh5l8HQqpE7r/FI7q
 tzZdPrflOW8UK5aUonpTxMeFUg==
X-Google-Smtp-Source: AGHT+IFwajY/c7QtMALGAUi6j0wE4nbsq2Y9146q71suCRjRSSIxy9oMTjD2cIFLC+9YazCRWdfstQ==
X-Received: by 2002:a05:600c:1f85:b0:407:5a7d:45a8 with SMTP id
 je5-20020a05600c1f8500b004075a7d45a8mr15161804wmb.31.1698321895178; 
 Thu, 26 Oct 2023 05:04:55 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b0040607da271asm2357094wmb.31.2023.10.26.05.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:04:54 -0700 (PDT)
Date: Thu, 26 Oct 2023 14:04:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v5 01/10] target/riscv/tcg: add 'zic64b' support
Message-ID: <20231026-3161602b135bf72d0b86dbc2@orel>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
 <20231025234459.581697-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025234459.581697-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
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

On Wed, Oct 25, 2023 at 08:44:50PM -0300, Daniel Henrique Barboza wrote:
> zic64b is defined in the RVA22U64 profile [1] as a named feature for
> "Cache blocks must be 64 bytes in size, naturally aligned in the address
> space".  It's a fantasy name for 64 bytes cache blocks. RVA22U64
> mandates this feature, meaning that applications using it expects 64
> bytes cache blocks.
> 
> In theory we're already compliant to it since we're using 64 bytes cache
> block sizes by default, but nothing is stopping users from enabling a
> profile and changing the cache block size at the same time.
> 
> We'll add zic64b as a 'named feature', not a regular extension, in a
> sense that we won't write it in riscv,isa. It'll be used solely to track
> whether the user changed cache sizes and if we should warn about it.
> 
> zic64b is default to 'true' since we're already using 64 bytes blocks.
> If any cache block size (cbom_blocksize or cboz_blocksize) is changed to
> something different than 64, zic64b is set to 'false' and, if zic64b was
> set to 'true' in the command line, also throw an user warning.
> 
> Our profile implementation set mandatory extensions as if users enabled
> them in the command line, so this logic will extend to the future RVA22U64
> implementation as well.
> 
> [1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 12 ++++++++++--
>  target/riscv/cpu.h         |  3 +++
>  target/riscv/cpu_cfg.h     |  1 +
>  target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f40da4c661..5095f093ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1394,6 +1394,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
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
> @@ -1423,8 +1429,10 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>  
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
> +                       cfg.cbom_blocksize, CB_DEF_VALUE),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
> +                       cfg.cboz_blocksize, CB_DEF_VALUE),
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
> index 6eef4a51ea..b6693320d3 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -107,6 +107,7 @@ struct RISCVCPUConfig {
>      bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
> +    bool zic64b;
>  
>      uint32_t mvendorid;
>      uint64_t marchid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 093bda2e75..ac5f65a757 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -264,6 +264,27 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>      }
>  }
>  
> +static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
> +{
> +    const char *warn = "zic64b set to 'true' but %s is set to %u. "
> +                       "zic64b changed to 'false'";
> +    bool send_warn = cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(zic64b));
> +
> +    if (cpu->cfg.cbom_blocksize != CB_DEF_VALUE) {
> +        cpu->cfg.zic64b = false;
> +        if (send_warn) {
> +            warn_report(warn, "cbom_blocksize", cpu->cfg.cbom_blocksize);
> +        }
> +    }
> +
> +    if (cpu->cfg.cboz_blocksize != CB_DEF_VALUE) {
> +        cpu->cfg.zic64b = false;
> +        if (send_warn) {
> +            warn_report(warn, "cboz_blocksize", cpu->cfg.cboz_blocksize);
> +        }

I think if a user does X=1,X=2 and expects X to be the superposition of 1
and 2 they should get an error instead of a warning, and that's what
zic64b=on,cbom_blocksize=128 would effectively be asking to do, so let's
error out here instead of warn.

> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -394,6 +415,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>          return;
>      }
>  
> +    if (cpu->cfg.zic64b) {
> +        riscv_cpu_validate_zic64b(cpu);
> +    }

We set this on by default, so if a user just gives cbom_blocksize=128,
then we'll get the warning (or failure). They'd have to do
zic64b=off,cbom_blocksize=128 instead to avoid it. I think zic64b needs
to be off by default and then automatically turn on during cpu finalize
if all blocksize properties are 64.

> +
>      if (cpu->cfg.ext_zvfh) {
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvfhmin), true);
>      }
> @@ -889,6 +914,7 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_named_features);
>  
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>  
> -- 
> 2.41.0
>

Thanks,
drew

