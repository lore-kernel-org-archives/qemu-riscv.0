Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C6C71153
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 08:00:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd4Uy-0007Fg-Hf; Mon, 04 Sep 2023 03:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4Ux-0007FN-EP
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 03:59:51 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4Uv-0004Rl-6l
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 03:59:51 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-500913779f5so1820747e87.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693814387; x=1694419187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=497vbdEqMZMCBfQS2sHYLsFlFLHL4aod/4bTdyVbYLM=;
 b=GezDVuEPvAlbmyCuRw/y/dfLqgWiZ30SPXik4gxZCaoj3oXTOOO6MFiWwR1Y2FRWw4
 LP34e+MctywoszjrbvQRYFLl95K1br8aEx0eem7tfT9r1q299YTXhF3/xMexC8wCtx7H
 3Cl/6sO5TX4gdMimSDsr+JgeBfi63uXZxAlasbG0tyE91bT1UXVGgB5lHaFTjQTfyHLc
 GjVm6EMcjpo++eBcHGk/HuBAku2Pofkkzft49rnCMX+MrGcSXMKOG1y6F4WwoO3TjQwa
 IY1mS+RkpWUEtUBO9rjabm7+X+Njd0MASYgmHj5muM99sX517at5yf8ko8Vx/crPYd1/
 yung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693814387; x=1694419187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=497vbdEqMZMCBfQS2sHYLsFlFLHL4aod/4bTdyVbYLM=;
 b=QjBnbGAwNpA6Ny/z3XF1whzTYutuHDyRad/krh/vjy3Nl7oRjC+52XvAxXXsxIEsnO
 tQRDW/nGJKGzMEH1oIiBAHITBidi3QMPPL4w9zyIdCBGKz22lacjSOFN1HILy386MGrw
 n+ICS+GurAqrvL9L/HlFEOhgCgTKiLqaVk/n/5IkZREcFzf6DIfAL3Q7bKOUvhJvpsMp
 Gw92fVHIl7yAaRPUWnJfixrniFCsZQ5w4w/2f9Ir7VQHaNusYWqBO2YokTqV/pcOWhvU
 am0sv4+lah2fYijUj/CvQnidEQbTRaLDSiZ9U7ixgIs2e53COlgLxplSccQ7JjyKxeSB
 h0Gg==
X-Gm-Message-State: AOJu0Yx82f6AZ0rsA41ECq5ySr4Ab6dcBcKaxX1gDQTfwSdminn88VLL
 T0tFDPGFoWUBqiuBLXQiQAyFew==
X-Google-Smtp-Source: AGHT+IEbUuCd8XES3vUpP9hHB5D0PCi5DMcN3sOjfELgfEPdn4IdYZWL/wga20ZL1tWfpU6AxfhplA==
X-Received: by 2002:a05:6512:370b:b0:4fb:7c40:9f97 with SMTP id
 z11-20020a056512370b00b004fb7c409f97mr5178091lfr.27.1693814387351; 
 Mon, 04 Sep 2023 00:59:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa7c58a000000b005227e53cec2sm5478962edq.50.2023.09.04.00.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 00:59:46 -0700 (PDT)
Message-ID: <81d56d08-8872-8f0e-57b4-9f54eb963b37@linaro.org>
Date: Mon, 4 Sep 2023 09:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v9 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, Markus Armbruster <armbru@redhat.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-8-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230901194627.1214811-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 1/9/23 21:46, Daniel Henrique Barboza wrote:
> The code inside riscv_cpu_add_user_properties() became quite repetitive
> after recent changes. Add a helper to hide the repetition away.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 29 +++++++++++++----------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 86d536f242..d484d63bcd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1951,6 +1951,15 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>   }
>   #endif
>   
> +static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
> +{
> +    g_assert(array);
> +
> +    for (Property *prop = array; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
> +    }
> +}

Worth a qdev_property_add_static_array() in "hw/qdev-properties.h".

Please do if a v10 is requested, otherwise can be done later. In any
case:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

