Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61FAE64A8F
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 13:29:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tISxx-0004gE-Fq; Tue, 03 Dec 2024 08:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tISxo-0004eW-R6
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 08:29:18 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tISxm-0008T0-2Z
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 08:29:15 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa549f2fa32so838381666b.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733232552; x=1733837352; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VkZ13KIMxJcXUbvPjbseD3nKfMhy2O8KK4HhBV/DeKg=;
 b=pSOfmCLqt0CkG24ZMFJb2iqtNi9l26Ieg4xH7pa3Bl+eQllx0XOxiXQvCjQskLUdBv
 huut6AafTpBsIIZbrAfuypZc1ZK+LsIeH+USAkWbcVI4HYmZMABP80ZLJynmizAbTQXI
 39A8fNvBCVUhOqHP4kU6IZWFjpvEWDIlw2UABCLOMP5geHUJrEGqSvl2JUVzIvD4Ss5r
 B9Wah3FwcawLtcNec7AkqC7f+cbFTMAH/xc+QPPUTDQ0hNGIszSXxtv6kIXvLEWg+v8i
 tF4RDVW/tGu2wMONx74XbImA7f+JSxW1Ekypn79ScK6eKQnW+wxV5uBC0ez6b0rVsvFU
 PaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733232552; x=1733837352;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkZ13KIMxJcXUbvPjbseD3nKfMhy2O8KK4HhBV/DeKg=;
 b=imImcDZ5fFFKjnyVcFr98iC44YDkpRbNOIpuMUJASyyLNI/QjLzYbVxdy9afO6znuY
 XlZK9klOgsJj0ux7SLPkUQl2BOAKDPUEBiSvb70JZZlhR7v3nBC6f2Rw5q/M+iCVSgpo
 aJJrADwyAr2IDFy9ekqDnccAPOZe0lUTdm9JoKXjTmrEHkp558QYR1ybP6+T+dSMRuis
 RZrlDdJ9ospmdxiB9tbckwtCOUWmBPbMN6yTDsJKvinAe0m5wxbizpA79mMmw8tSn+zC
 DDducYMNbpdopVrMsNiSUZBcrvxzDn2sJfVyrQWmuY+45zTmDZ21rwKYrNmU0jIEQh/0
 BKtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCONaScIFrOIcZCuuu0QNJqY4CXkeTUgYqLQquogSTwOhGvLCjCT9/M4zTcKw96zi0L4QncJP0wxsy@nongnu.org
X-Gm-Message-State: AOJu0Yw2pMGVFpApDGbnfwAAo0khj1tmYl7Aq0APicVncvGqkE6uBurD
 Cg2fmVZq9W06uebVQkHN6C9+k5vnpIjav3eAsE8KaKvgjOPYySMXGDkYC5uAMMM=
X-Gm-Gg: ASbGncup3OPZmY7NfwNd5stPgdgxESk3HKYpS2LwVow5UFJMyHdXTYZec5N8ZI314SN
 6HQsG1yz/CJ96CZ5okCzOjgO5eOSwns0ObKU9GskNbXpy54wSngV4xz/eWZ0XAeLQPqIRV4D5u5
 DUO4ursH99vjJm2XlogvqOv67TPVcGm1UVuiHXhsN41Ok+fb3Pu5Prc9UoYk3qoKZLtKraCwQfg
 KVu1m2jQKo3cJ851VWMj/NVN/rZF8dR2pQGEvhYBf+GA1+mUgVYVay3a07wVH/UJ2n+A7KHP5rL
 k6e9Ar3KefbdOVTOx7cc65Bzug71JBMtjqM=
X-Google-Smtp-Source: AGHT+IG2/KCH92B7Ea761kPCnSeCNWr/SxkZdDynqq8nPZhJLxsng43GtTIdl55tPqhK3+/yXgBIpA==
X-Received: by 2002:a17:906:18a9:b0:aa5:3982:660f with SMTP id
 a640c23a62f3a-aa5f7da0fcdmr204898366b.27.1733232552025; 
 Tue, 03 Dec 2024 05:29:12 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6337sm614294266b.117.2024.12.03.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:29:11 -0800 (PST)
Date: Tue, 3 Dec 2024 14:29:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-10.0 2/9] target/riscv: add ssstateen
Message-ID: <20241203-a559b7cc1b7fcb5e41b1c6f1@orel>
References: <20241113171755.978109-1-dbarboza@ventanamicro.com>
 <20241113171755.978109-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113171755.978109-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
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

On Wed, Nov 13, 2024 at 02:17:48PM -0300, Daniel Henrique Barboza wrote:
> ssstateen is defined in RVA22 as:
> 
> "Supervisor-mode view of the state-enable extension. The supervisor-mode
> (sstateen0-3) and hypervisor-mode (hstateen0-3) state-enable registers
> must be provided."
> 
> Add ssstateen as a named feature that is available if we also have
> smstateen.

While I can't find justification for adding the 'ssstateen' name
(afaict there's no ambiguous behavior or CSR definitions with
'smstateen', so Sha requiring smstateen should be sufficient), it's
already ratified, so into the alphabet soup it must go.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 2 ++
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 9 ++++++++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f219f0c3b5..4ad91722a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -191,6 +191,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
>      ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
>      ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
> +    ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
>      ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
>      ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
>      ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
> @@ -1607,6 +1608,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>   */
>  const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
>      MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
> +    MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
>  
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 59d6fc445d..c7bf455614 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -139,6 +139,7 @@ struct RISCVCPUConfig {
>      /* Named features  */
>      bool ext_svade;
>      bool ext_zic64b;
> +    bool ext_ssstateen;
>  
>      /*
>       * Always 'true' booleans for named features
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index cd83968166..0b9be2b0d3 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -204,10 +204,15 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
>        * All other named features are already enabled
>        * in riscv_tcg_cpu_instance_init().
>        */
> -    if (feat_offset == CPU_CFG_OFFSET(ext_zic64b)) {
> +    switch (feat_offset) {
> +    case CPU_CFG_OFFSET(ext_zic64b):
>          cpu->cfg.cbom_blocksize = 64;
>          cpu->cfg.cbop_blocksize = 64;
>          cpu->cfg.cboz_blocksize = 64;
> +        break;
> +    case CPU_CFG_OFFSET(ext_ssstateen):
> +        cpu->cfg.ext_smstateen = true;
> +        break;
>      }
>  }
>  
> @@ -343,6 +348,8 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
>      cpu->cfg.ext_zic64b = cpu->cfg.cbom_blocksize == 64 &&
>                            cpu->cfg.cbop_blocksize == 64 &&
>                            cpu->cfg.cboz_blocksize == 64;
> +
> +    cpu->cfg.ext_ssstateen = cpu->cfg.ext_smstateen;
>  }
>  
>  static void riscv_cpu_validate_g(RISCVCPU *cpu)
> -- 
> 2.47.0
> 
> 

