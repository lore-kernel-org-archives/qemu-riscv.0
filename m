Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9634C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxW8T-0004GB-Sz; Mon, 30 Oct 2023 13:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW8S-0004EX-0v
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:33:08 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW8P-0007EL-76
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:33:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d9a4c0d89f7so4166086276.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698687184; x=1699291984; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NtRbshqEw+ZpzEeGFOZ8e+DEhSXvTKnFT6nfhUjk9IU=;
 b=KBCM5CwO1S7LqJalsKL8zYWHtoaaqRy3dr83UbALCY4gqKNy7iBssPEecokoVV/5oI
 CO66bqDGtxh7qoYunlAxUBCTHV1QqGVDY01O00i1bGfdzdNRaOBy4eC6rhalKtueL948
 IUp1LSBfxldXFfSdhlxTqHxYFN6wdbhsz4kcQLX8aes2IZbnJnZo+WK7XQt6eogiKE2C
 adkvLFKWyncT0m7owOPAc0No7hNCx2xG/Dxrc6pcV0MP6wjVaYEfpAKFdZyqmNcpgvf1
 ts6j5LhOhtouuT+j6TZkDDt2aKDpADm6vRekEX8rLTkJ8nXZJ/TaP/HWKGatzlA92G/N
 MOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687184; x=1699291984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NtRbshqEw+ZpzEeGFOZ8e+DEhSXvTKnFT6nfhUjk9IU=;
 b=lWVxjkqDvAj9CTASViJrOruI5skaoRhwaOrnXVGmbhESELIyew/tQugmj7SZrvq+gD
 S+11NeW2rm+4Ob29No1a9AwWswb3ni/k2wLyDqMHDkRbJLZov6CD+SLZqJ+oxlQZ4/5h
 zSeKbMjZmev58CtC8MDo0oN9yThEc65EVHGH4naVIPb9br2mRgnZ9vgZxQXQlwByQQe8
 JEcGn39GQvZOfbthDi3Zk0CBdWMe4V3oXjequTJTwCa6BAUbda2m3EEltUSeFt88NnmP
 5UNLQcCK74jVGmzj7II2CpxlPRekaewM5p6wVZfoXQ4sjXNoALh25aUCdDNr77xuoyw5
 8VEg==
X-Gm-Message-State: AOJu0YxpjkLa6zGMQurGa4gllKlZWC4FnVvGVnx7XmaQlt355SCr0ERq
 qz1j0hYLSIIHKlDBo0aF6ZHsIQ==
X-Google-Smtp-Source: AGHT+IGvOJVeQZTdYPXk/shsdk1nvHLAJcVDavVoXrXHEvmsWh1FABxBSNjVarfW0hk2ExoRvfvHCw==
X-Received: by 2002:a25:dfd1:0:b0:da0:cb34:16b7 with SMTP id
 w200-20020a25dfd1000000b00da0cb3416b7mr8532372ybg.25.1698687184026; 
 Mon, 30 Oct 2023 10:33:04 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 h126-20020a25d084000000b00d9cc49edae9sm4083803ybg.63.2023.10.30.10.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:33:03 -0700 (PDT)
Message-ID: <b7727a62-ef9e-45b3-8350-bf2d8f78a06c@ventanamicro.com>
Date: Mon, 30 Oct 2023 14:33:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] target/riscv: Move vector crypto extensions to
 riscv_cpu_extensions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-11-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-11-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb32.google.com
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



On 10/26/23 12:18, Max Chou wrote:
> Because the vector crypto specification is ratified, so move theses
> extensions from riscv_cpu_experimental_exts to riscv_cpu_extensions.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1709df76a9b..5b5805399ee 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1342,6 +1342,24 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("zcmt", ext_zcmt, false),
>       MULTI_EXT_CFG_BOOL("zicond", ext_zicond, false),
>   
> +    /* Vector cryptography extensions */
> +    MULTI_EXT_CFG_BOOL("zvbb", ext_zvbb, false),
> +    MULTI_EXT_CFG_BOOL("zvbc", ext_zvbc, false),
> +    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkg, false),
> +    MULTI_EXT_CFG_BOOL("zvkg", ext_zvkg, false),
> +    MULTI_EXT_CFG_BOOL("zvkned", ext_zvkned, false),
> +    MULTI_EXT_CFG_BOOL("zvknha", ext_zvknha, false),
> +    MULTI_EXT_CFG_BOOL("zvknhb", ext_zvknhb, false),
> +    MULTI_EXT_CFG_BOOL("zvksed", ext_zvksed, false),
> +    MULTI_EXT_CFG_BOOL("zvksh", ext_zvksh, false),
> +    MULTI_EXT_CFG_BOOL("zvkt", ext_zvkt, false),
> +    MULTI_EXT_CFG_BOOL("zvkn", ext_zvkn, false),
> +    MULTI_EXT_CFG_BOOL("zvknc", ext_zvknc, false),
> +    MULTI_EXT_CFG_BOOL("zvkng", ext_zvkng, false),
> +    MULTI_EXT_CFG_BOOL("zvks", ext_zvks, false),
> +    MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
> +    MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
> +
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -1374,24 +1392,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-zvfbfmin", ext_zvfbfmin, false),
>       MULTI_EXT_CFG_BOOL("x-zvfbfwma", ext_zvfbfwma, false),
>   
> -    /* Vector cryptography extensions */
> -    MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
> -    MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
> -    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
> -
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

