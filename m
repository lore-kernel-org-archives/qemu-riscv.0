Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB197CAC59A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 13:47:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uysVS-0006Bz-A5; Wed, 17 Sep 2025 09:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysVK-00069f-R5
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:47:26 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysVI-0004f6-Oz
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:47:26 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-ea3fec1b7e1so2970676276.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758116841; x=1758721641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bL5XvCneYBIu/f3Tq+nhg4xAx6OCI23mNC6MAdy0g8E=;
 b=g769UsToe/KvxVtf6lCdIPS7A80zcTxwo7ryjAfm9S9FRg4fXS00ho2vjolQyoejhw
 AKWoewvib3jXR+cbglO5ezeNeJcAzAFGxrONUvDm65OUQdPzdWIkbCyxWmyFp5itge6q
 y5mlXAw7dj1sC5CGTAkXiIXSfm7OWEsXzj5W2p/vPBgl+AIUGL955X2cQVLMlG3eM8iq
 JF5xNd1Ny170bQrau5MbkirLZhSJpidvbJahFSEm2ymzaEkjcCkW7az4x8Noit3MN8gA
 kQq0Ny/dLZVqUrJ1w31z/QXf33XoakdhcDpdQFLZF+OOziT+10EKCxGncrBLb7ZCt8M8
 wVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758116841; x=1758721641;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bL5XvCneYBIu/f3Tq+nhg4xAx6OCI23mNC6MAdy0g8E=;
 b=A1cqRbakpSlK2TFfBsYsd394kJTWLoUoOU+SIUe6wbsHpq8F9cFzddylMvZOt6TA6J
 BTAK9PPoNuOWnZVLPftfRLeHuObrCk1ccq+VVgGkghyKBM9Bp3tx9N8P+PT7SjnFaqk+
 k1xvsczzclhGUiydMeNGlF7z5UXplCAm/vmlRQBM+0IdE+NaYJ+YRFLTpYxom40pvjcN
 GoEuV7fN8fFaFzt6W0rEj/JO8OSPjKnR9h2uWmnoNaNQixqrdzF7H7OnBQlLE/TelwTx
 BD9vkiVdwk3LOvG4WpWNw4qGT8UnmygzQWBiAQ1dhiskUmkB62VV6+GvvNHh2wPVlzul
 ET+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Vu0DPHHVKw169Vtussr+4xjez4esdJQYNAHp5iI2hREgybBBhhjiM96kuD3RAE9VNXc6DLIbjuC/@nongnu.org
X-Gm-Message-State: AOJu0YwsJR8O++XqHjOjWOic4v1uYEx9NyCI+xucKHXaiRTHtzz/gEsC
 QSUV+EmUUbApwttzmEhk5fvw4u6fobx1OamvJHydzc0sSEplq55D3/eoaPNnGcGpKR0=
X-Gm-Gg: ASbGnctslpDzCh0ykQPhJKfhvPIyRlkT3EpKQnpgjuSz5P4qAX6/LZix1LSkxAod0xJ
 p42B6zheC2ZW7k+hZHqYRKk3UL97BwpjggtOK2hWIJIERN0le4XWYVWs905hFj1JjjUGCTKkPV1
 t2HGNlhrDA5F53iOiCKDYR46fZ8swwVMrCBPbeIfQ0ko86WZWhDwcpxxQF7lrRXiJqg6JAU5f/D
 UqUO5/zmbGZbit/mQJg9RgcG4UZ3Rb+WAV205q3Vw4TUchBTZQr6czq4sGJgE/jJP/pkYqIGyGO
 6nrk8BWor25fopl8GhGq8q7LAu856zDn8C1gJWgcwaXqYpR9HY6J6JTzsWLU78y0xLK+6eZ/gSt
 FCBz54Lz+CKiYB4+fnLxU3YRF4U1yZHJdFXRkNg==
X-Google-Smtp-Source: AGHT+IHy5S07PhHNuFbq56IOX/76UOP46mZ6J7eBOlgH5riOR4cSU28mqds4rdLlIYvTozMYmT4czg==
X-Received: by 2002:a05:6902:15cc:b0:e95:2422:6d10 with SMTP id
 3f1490d57ef6-ea5c039e70fmr2128349276.19.1758116840555; 
 Wed, 17 Sep 2025 06:47:20 -0700 (PDT)
Received: from [192.168.68.110] ([179.225.245.173])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-ea5bac37947sm832039276.14.2025.09.17.06.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 06:47:19 -0700 (PDT)
Message-ID: <98db7d09-3a60-4a57-aba6-10cda530c79b@ventanamicro.com>
Date: Wed, 17 Sep 2025 10:47:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] target/riscv: Add cfg properities for Zvfbfa
 extensions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
 <20250915084037.1816893-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250915084037.1816893-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2d.google.com
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



On 9/15/25 5:40 AM, Max Chou wrote:
> The Zvfbfa extension adds more complete BF16 vector compute support
> and requires the Zve32f and Zfbfmin extensions.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c                | 1 +
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 8 ++++++++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf4623..fc0614dadba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -169,6 +169,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
>       ISA_EXT_DATA_ENTRY(zve64x, PRIV_VERSION_1_10_0, ext_zve64x),
> +    ISA_EXT_DATA_ENTRY(zvfbfa, PRIV_VERSION_1_13_0, ext_zvfbfa),
>       ISA_EXT_DATA_ENTRY(zvfbfmin, PRIV_VERSION_1_12_0, ext_zvfbfmin),
>       ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index e2d116f0dfb..f69be188e4a 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -96,6 +96,7 @@ BOOL_FIELD(ext_zvks)
>   BOOL_FIELD(ext_zvksc)
>   BOOL_FIELD(ext_zvksg)
>   BOOL_FIELD(ext_zmmul)
> +BOOL_FIELD(ext_zvfbfa)
>   BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
>   BOOL_FIELD(ext_zvfh)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 78fb2791847..07b2b137934 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -704,6 +704,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvfbfa) {
> +        if (!cpu->cfg.ext_zve32f || !cpu->cfg.ext_zfbfmin) {
> +            error_setg(errp, "Zvfbfa extension requires Zve32f extension "
> +                             "and Zfbfmin extension");
> +            return;
> +        }
> +    }
> +
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;


