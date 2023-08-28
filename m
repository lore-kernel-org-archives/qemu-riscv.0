Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C22FC71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qabKm-0003QJ-Lv; Mon, 28 Aug 2023 08:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabKl-0003Po-IC
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:27:07 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabKh-0007eX-6f
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:27:07 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bdacc5ed66so1734205a34.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693225621; x=1693830421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7NxiZR4++EfMQARBoQq4q/9eXCyxZgKbBrQQ80aYSA=;
 b=MC1shtUMeyihU3XUHdLCQRjGJVDLoPJQ9ZKu3w2jmBJzGccXPqlZVeKXeUXx/a6hjc
 gylqTLF1adYpzj+8IN6pKnId8IWTIUijRcYoDxONlEGJ9WIFyrxGmB3q3+Q41h10erEn
 tY1yZzC3sU6aiWK/exf7mAQotclATVvJqH/42CVd3nZmaarKhPLps1IHTLo8KvNyn7cJ
 An/u/AObRKcLCcbphTPEv1WH/0hfpRU0g30hr2DqsbjGI6AO7L6Fqgfn/xj1dzmIjnDA
 e6+9N2b+ORiKMeycFI6sAcG9QB5/piRIusbSy3TnKtpr32sJWBPFG+IC7eUFGYgiKFxm
 VWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693225621; x=1693830421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7NxiZR4++EfMQARBoQq4q/9eXCyxZgKbBrQQ80aYSA=;
 b=XzgDKrLEeg4DXIPxv+iAWlg1tjAAXm1XQ2W6nwk0BHlEEyrd92Tzz9XABx74tzjxmd
 mzkBPFeOAk39FM65AzIFuHUlacs8OtdwkYdaXF/1d9EhS0z7P6rsR3fufiGC1ltC6ZF9
 QSzcHJWjPp7ESxm1e9pluKrhSRWIu9kd/ehXk8Kg8wzTebzsdhCDJ5O7TXbdRae7c2dQ
 NCW+ptbnlFZxPNu6Cmz8DcfBMgptZBwusm53HJjoLqBBvZgjc+KreSn39yG/b76942pv
 FbwbDCXRkQFUmgJS/jskH0p4BDDvKCLgYMIyTpVa0ufClRGFVDh2uk+KFAmxAlFyd77A
 fhDQ==
X-Gm-Message-State: AOJu0Yxy3/VBEFAB/eGdxuKW8rx8cwz1vt1cSB1DTyJ5mf9CDIdxHGxP
 Ds2hto7eY9x27UiOzfPPGWoOow==
X-Google-Smtp-Source: AGHT+IFlgm8kQg8Qm/M++NO+J8D9+SBd88+BMLFhfme0hBXKdYI85D4nHsMYiFimLFRPIVG6WQQ8SQ==
X-Received: by 2002:a05:6830:440f:b0:6bd:cb3c:d413 with SMTP id
 q15-20020a056830440f00b006bdcb3cd413mr6662174otv.4.1693225621389; 
 Mon, 28 Aug 2023 05:27:01 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a9d7618000000b006b9734b9fafsm3406064otl.13.2023.08.28.05.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 05:27:01 -0700 (PDT)
Message-ID: <ad99c802-968a-4791-0007-417980a05caf@ventanamicro.com>
Date: Mon, 28 Aug 2023 09:26:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 4/6] target/riscv: Add default value for misa
 property
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 qemu-riscv@nongnu.org
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
 <20230828084536.231-5-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230828084536.231-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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



On 8/28/23 05:45, LIU Zhiwei wrote:
> Before this patch,
> "
> qemu-system-riscv64 -device rv64-riscv-cpu,v=true,help
> 
> ...
> v=<bool>               - Vector operations
> ...
> 
> "
> 
> After this patch,
> "
> v=<bool>               - Vector operations (default: false)
> "
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c2f102fae1..38838cd2c0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1728,6 +1728,7 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>       int i;
>   
>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> +        ObjectProperty *op;
>           RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>           int bit = misa_cfg->misa_bit;
>   
> @@ -1739,14 +1740,13 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>               continue;
>           }
>   
> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
> -                            cpu_get_misa_ext_cfg,
> -                            cpu_set_misa_ext_cfg,
> -                            NULL, (void *)misa_cfg);
> +        op = object_property_add(cpu_obj, misa_cfg->name, "bool",
> +                                 cpu_get_misa_ext_cfg,
> +                                 cpu_set_misa_ext_cfg,
> +                                 NULL, (void *)misa_cfg);
>           object_property_set_description(cpu_obj, misa_cfg->name,
>                                           misa_cfg->description);
> -        object_property_set_bool(cpu_obj, misa_cfg->name,
> -                                 misa_cfg->enabled, NULL);
> +        object_property_set_default_bool(op, misa_cfg->enabled);
>       }
>   }
>   

