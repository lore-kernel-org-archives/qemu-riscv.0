Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7F5C54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 18:03:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rpXcI-0003gN-Ss; Wed, 27 Mar 2024 14:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rpXcH-0003fp-Ii
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 14:03:13 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rpXc8-000152-2o
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 14:03:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ead4093f85so149835b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2024 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1711562582; x=1712167382; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2B7BBkg75SiV/JapLWiSn2hEVKf4DdkwdoslNYVgRMQ=;
 b=COuK4EtdH4VR+if3MSSwcuUy4BuZ7OlN+WaNFRNHdmRnAkjpgS+AdzW3Mlct0uwUbH
 4Zysu3ncN294LGuM1JdfuiwC7AK7EN+eM7jyCNcmvPVODddfNwvPFTVZNtLOh/wxJaVA
 hWoOCqdpBnGs51pP5VqBzcexzEjH1ILbJ5aGgN0ZyovlzaxBZAD6pdTLkIWNR1gcLuYu
 JGoiHvORRkhpPvmU5Iz7gEPXkC/5Twt09Y0n0c+E3ssvzMNrwiCV2AVh8Zxi873tH0wp
 GEgtjDnmm1xTrefgRrKsZcCRidkp/cPZgf3M8Qt+x0q3Ze6ph413j48Qbk4BqAvpmg1P
 q/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711562582; x=1712167382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2B7BBkg75SiV/JapLWiSn2hEVKf4DdkwdoslNYVgRMQ=;
 b=eH79PFycoL2trn8tb9C13a8NUszfpNpUW7lBrddzQjiYdS+8tU5vJJxo88SJ/Uljy/
 ytjdF5CtxYEz62BwrANb9/vw/BOUZQt4SWMI5572YPNi8K6Nx00vuEcLI99/VWUwcWyN
 vKoDzDZj6EbJ/5jEkxKGWmVOYijIFUnAAseP8zm7S7ddZapLgO8BioYyOShj2TQHxCxf
 dYiAOIgYvgKGRAUL0e0cNOGZfxLMfO1eQFS6WpShpisg/zq8cU1w5tiIa9hd78WAcGfP
 Vfr7x1yCu3LC0SpYWwHKo93AtwTJ4rkwzz78Dm915DAWPjQbxCPRRr0zSaD9W5pJGp9F
 XO2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA6z0GFCnZgof+Wy5+NBouUOEDAhD7FRerDblRXDk4+0PqSSZsNpDfBEENnv3r+6w0PccO5DLdTdq09NfX71pXErTJWj4=
X-Gm-Message-State: AOJu0YzjDKU0JKQPLbazn2ggjIyMCR3npUVU/ozneTMLcyMufXkxKAKH
 QygvHli20Aibv/X0rC5atgHQ117H7UqI8oDAV0mDBMFtbqoAINmrKIeCpW2sPIg=
X-Google-Smtp-Source: AGHT+IEp8i8k/DoFVaNEqCEs1VZrWC+N0kBOsL5aexDj4sJUM80EV3VSRaUxWVPMOIHx9UIlqnsS5A==
X-Received: by 2002:a05:6a00:3d09:b0:6e7:47e2:d8ed with SMTP id
 lo9-20020a056a003d0900b006e747e2d8edmr830684pfb.26.1711562582461; 
 Wed, 27 Mar 2024 11:03:02 -0700 (PDT)
Received: from [192.168.68.110] ([177.45.186.241])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa79dc2000000b006e6f0b4d950sm8105223pfq.4.2024.03.27.11.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 11:03:02 -0700 (PDT)
Message-ID: <78551a06-ac81-46c1-816b-88c00a1d8325@ventanamicro.com>
Date: Wed, 27 Mar 2024 15:02:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] target/riscv: Add support for Zve64x extension
Content-Language: en-US
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240325083346.16656-1-jason.chien@sifive.com>
 <20240325083346.16656-4-jason.chien@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240325083346.16656-4-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
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



On 3/25/24 05:33, Jason Chien wrote:
> Add support for Zve64x extension. Enabling Zve64f enables Zve64x and
> enabling Zve64x enables Zve32x according to their dependency.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c         |  1 +
>   target/riscv/cpu_cfg.h     |  1 +
>   target/riscv/tcg/tcg-cpu.c | 17 +++++++++++------
>   3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6bd8798bb5..f6287bf892 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -156,6 +156,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve32x, PRIV_VERSION_1_10_0, ext_zve32x),
>       ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
> +    ISA_EXT_DATA_ENTRY(zve64x, PRIV_VERSION_1_10_0, ext_zve64x),
>       ISA_EXT_DATA_ENTRY(zvfbfmin, PRIV_VERSION_1_12_0, ext_zvfbfmin),
>       ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index dce49050c0..e1e4f32698 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -94,6 +94,7 @@ struct RISCVCPUConfig {
>       bool ext_zve32x;
>       bool ext_zve64f;
>       bool ext_zve64d;
> +    bool ext_zve64x;
>       bool ext_zvbb;
>       bool ext_zvbc;
>       bool ext_zvkb;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index ff0d485e7f..4ebebebe09 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -498,17 +498,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   
>       /* The Zve64d extension depends on the Zve64f extension */
>       if (cpu->cfg.ext_zve64d) {
> +        if (!riscv_has_ext(env, RVD)) {
> +            error_setg(errp, "Zve64d/V extensions require D extension");
> +            return;
> +        }
>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64f), true);
>       }
>   
> -    /* The Zve64f extension depends on the Zve32f extension */
> +    /* The Zve64f extension depends on the Zve64x and Zve32f extensions */
>       if (cpu->cfg.ext_zve64f) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64x), true);
>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32f), true);
>       }
>   
> -    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
> -        error_setg(errp, "Zve64d/V extensions require D extension");
> -        return;
> +    /* The Zve64x extension depends on the Zve32x extension */
> +    if (cpu->cfg.ext_zve64x) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32x), true);
>       }
>   
>       /* The Zve32f extension depends on the Zve32x extension */
> @@ -670,10 +675,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64f) {
> +    if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
>           error_setg(
>               errp,
> -            "Zvbc and Zvknhb extensions require V or Zve64{f,d} extensions");
> +            "Zvbc and Zvknhb extensions require V or Zve64x extensions");
>           return;
>       }
>   

