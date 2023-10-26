Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D9C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 17:10:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw3s6-0003M9-Rt; Thu, 26 Oct 2023 13:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qw3s6-0003La-37
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 13:10:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qw3s3-0006XJ-98
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 13:10:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so1134911b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698340209; x=1698945009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F0Hs6qbZoi/V166+yHaDFOA8TvmCSR2cRnsvqZ1MD4I=;
 b=pHr6miAtAIzUPsnNJatGRBRYz7R+W8+KvKe++XKK90x5HMOdzJLpqIZwrGGQgiEsan
 MSAEUVVddFKf9cgN7LBvz99wPJ6JxbNiL8nVTR3+uAxxocVYLukGlEa5SjEfwSX4uj97
 5pacxntzv4aXVaK0xj06mnIHilkNfoYjCXQuniSH48A2EeZCJBK0tTNqqGJyhfSkHXQ4
 73hm/x9oqzbIqY1XRyIIHRk7di8ESdl2y2xMIuKr222gjA/+BX7MvSqT2IIHuYj0taGI
 5m4Nq2vZ8PT4/5xvDF0Djdy7qUuiYKUkTHJd2g1cSgsV76u/MWUE8EBAm4wXwjnzmRSw
 mgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698340209; x=1698945009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0Hs6qbZoi/V166+yHaDFOA8TvmCSR2cRnsvqZ1MD4I=;
 b=ONdtUbsD0TwrMLaja151EjL3L2dtDb9DTc8dnkj58cclKqTExHXD3RinCfwEbxojLg
 34MnBZL76fYgT7Qyt/PmYFZOZUe0fG31PUnpB5t5J1UPXBheTLFBkdZZhxDpGUCZj7Zo
 mLh2/dXkxnNG422SIG5RZgphD1HCgxFLy3aaNlhLZ0PBIOl1HJ8k4ew2ZCE1wkRzpBJk
 Jba0UJdNasPQw1YdS6swVX6JMsvPeEaGRvemlyE3cAbaGd/rzzCBE9VNEXhxt+JzUZED
 mxNyHLGQvd9ePWMBJLrU9rjBPfW9fbK2dP86OoHLychq+ch6O4eTLE6ZYNZikMBmoTIW
 p8hQ==
X-Gm-Message-State: AOJu0YzKMV4tm5h2PmeI5IL7FXzWuGHEfKo+BxzMFLXEgB6dwBRqbHVM
 YmLa9sgFT1FDq654KMeBin3C+g==
X-Google-Smtp-Source: AGHT+IH8upnJSORn/tUfuuPqTwaWP23aSETOboJsl83XKg0H8pDvdKnEW8mUmVzVghlkampFjv9JaQ==
X-Received: by 2002:a05:6a20:a120:b0:17e:4454:edc3 with SMTP id
 q32-20020a056a20a12000b0017e4454edc3mr436380pzk.47.1698340208874; 
 Thu, 26 Oct 2023 10:10:08 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 m188-20020a6258c5000000b006bdd1ce6915sm11922143pfb.193.2023.10.26.10.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 10:10:08 -0700 (PDT)
Message-ID: <32d9dbae-2d43-4797-8245-c04540649083@ventanamicro.com>
Date: Thu, 26 Oct 2023 14:10:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] target/riscv/tcg: add 'zic64b' support
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
 <20231025234459.581697-2-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231025234459.581697-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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


On 10/25/23 20:44, Daniel Henrique Barboza wrote:
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

I talked with Andrew offline. We think that, ***for now***, it's overcomplicated
and a bit confusing to have these half-extensions to be user set. Most of them
are internal aspects of the implementation that we're already complying or
something that do not apply to us (e.g. cache-related features).

We'll not show these flags to users. We'll also add more code in query-cpu-model-expansion
to expose them, given that they won't be ordinary user flags like the others.

As for this patch, we'll not no longer expose zic64b to users. It'll be an internal
flag that we'll enable or disable based on the blocksizes alone.

I emphasized 'for now' at the start because there's always the possibility of having
to treat these named extensions more like regular expansions, adding them in riscv,isa
and so on. That's not the case for now, so let's simplify while we can.


Thanks,

Daniel


> 
> [1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c         | 12 ++++++++++--
>   target/riscv/cpu.h         |  3 +++
>   target/riscv/cpu_cfg.h     |  1 +
>   target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
>   4 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f40da4c661..5095f093ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1394,6 +1394,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
> +    MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   /* Deprecated entries marked for future removal */
>   const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
>       MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
> @@ -1423,8 +1429,10 @@ Property riscv_cpu_options[] = {
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
> +                       cfg.cbom_blocksize, CB_DEF_VALUE),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
> +                       cfg.cboz_blocksize, CB_DEF_VALUE),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8efc4d83ec..ee9abe61d6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -64,6 +64,8 @@ extern const uint32_t misa_bits[];
>   const char *riscv_get_misa_ext_name(uint32_t bit);
>   const char *riscv_get_misa_ext_description(uint32_t bit);
>   
> +#define CB_DEF_VALUE 64
> +
>   #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>   
>   /* Privileged specification version */
> @@ -745,6 +747,7 @@ typedef struct RISCVCPUMultiExtConfig {
>   extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>   extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>   extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
>   extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>   extern Property riscv_cpu_options[];
>   
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 6eef4a51ea..b6693320d3 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -107,6 +107,7 @@ struct RISCVCPUConfig {
>       bool ext_smepmp;
>       bool rvv_ta_all_1s;
>       bool rvv_ma_all_1s;
> +    bool zic64b;
>   
>       uint32_t mvendorid;
>       uint64_t marchid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 093bda2e75..ac5f65a757 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -264,6 +264,27 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       }
>   }
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
> +    }
> +}
> +
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly.
> @@ -394,6 +415,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.zic64b) {
> +        riscv_cpu_validate_zic64b(cpu);
> +    }
> +
>       if (cpu->cfg.ext_zvfh) {
>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvfhmin), true);
>       }
> @@ -889,6 +914,7 @@ static void riscv_cpu_add_user_properties(Object *obj)
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_named_features);
>   
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>   

