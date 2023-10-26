Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A557AC25B6B
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 12:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvzRg-0003Z4-Ra; Thu, 26 Oct 2023 08:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvzR1-0003Mf-OA
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:26:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvzQo-0002Pi-El
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:25:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso11808185e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698323143; x=1698927943; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TXrAQWcG8F0fl+4+WVR67XkHZG1E3QRjwUGD520B8nY=;
 b=AHOepdEbM8PX/AK3GkphtthjjIaw6B5e4+SWwVcO+ecvrBbGavOaoM7srZtPA69VHX
 6WAYoCLT+bpiQDoIr/a2SXXI6dhPKLv+0Va1Bb/ir/wQk84uqZTDnUNIzmK2wdFV+2OE
 vudmpp9DOEL/pg6j5oTQsNJhOKlzr2uUWto0IHXFA/paQ5imCdfBGUmu+HijNPj5WlJO
 YPBu2TMyyiDJx4++JJ/x0r+mEdR68eCe1oS+1YjmIWYNZjInDNny8c5EQhAFKxdC/pdC
 QINaVTieBwcqKccQxLl/8m02gFJLcNuH3az/oHiWQsCG7oGpneBlGYRMdMl1JzhqeMSz
 CN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323143; x=1698927943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXrAQWcG8F0fl+4+WVR67XkHZG1E3QRjwUGD520B8nY=;
 b=Kmmio0WAyDniNMFSlEqkd/rqqj+pytgc2BD+HHK9/e6xJLy96hMACkp7a7hsE2lApc
 cKSsOFIZL2DWS3tOWFTGOl9mMIx7R4ByQqYLn12ysmpjDrK1mFi7MXQEC+Byq7mVXxQc
 dZaVaxOcd0Km6tkmTQV8K8KJGIpUDzyebxXesh/o0LL/SyT23L2m+huiMYtRgsVA6gpQ
 G3G/NXfNMBZLsJQ+rqnjvi8AyCi3nrMgILNj/nCRSZTpDnjbOZdIHx1mWAQ/hgzK1Ox8
 FddiC2LWsxT+Nxe4jCF4OfoEcsknABA61N3ap+PbonR27A4EfvDarsbR2L06QKWF0fOn
 0KmA==
X-Gm-Message-State: AOJu0YwKBp17EmWigPVcrKquMTP/hLh6SFO+FdIx//ss5M5rui5Kq1Eb
 Il2UDeLA7tBTHTiSqxlVVSGg4A==
X-Google-Smtp-Source: AGHT+IFzRPqUHurvfX+uiBRDNvf9JCBHt04ZV9IxpGbspn/bkoeTA4fnjWTEtPDXvawLfgMaioAk1A==
X-Received: by 2002:a05:600c:1713:b0:400:5962:6aa9 with SMTP id
 c19-20020a05600c171300b0040059626aa9mr2749375wmn.11.1698323143228; 
 Thu, 26 Oct 2023 05:25:43 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a7bcb88000000b0040684abb623sm2407241wmi.24.2023.10.26.05.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:25:42 -0700 (PDT)
Date: Thu, 26 Oct 2023 14:25:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v5 01/10] target/riscv/tcg: add 'zic64b' support
Message-ID: <20231026-6aa9cc9273d03e81160a477f@orel>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
 <20231025234459.581697-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025234459.581697-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x333.google.com
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

We should add a line like

  riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_named_features);

to cpu-model-expansion. zic64b is actually exactly what we need there in
order to describe the blocksize with a boolean, since we don't have any
way to expose the blocksize right now with that query.

Thanks,
drew

