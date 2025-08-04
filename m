Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95552C87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 22:42:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj3st-000192-E6; Mon, 04 Aug 2025 18:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj3sp-00017B-5U
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:42:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj3sn-0003i4-JY
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:42:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso17406795e9.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754347334; x=1754952134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VjTQ4z2k7H3mC0fHttSFmBAL3Wgkm0GozBCF4sbE9ag=;
 b=eMN6Q8Ep4ZIB+vDAAeVrhn0uYw4GONYjkrI+Wg+t3qQTKiqvWvYTgZtC+v6mS/Iox6
 b5t9nyXpwFxMYtjJ5YOBm/6PivwMlJrnuw00V1WiYg/HKYdjUBJEdjO0zRHAr+FJ+toJ
 v3G8ZNN6u+nJu5Fcyd4Pyx1h4LP2sgdCoUhyAT3oDv9tTon/ZoaqP8ytHC60Lh9UUQDC
 20lV6TupuIoJjWOBNmMjS7mIyXDx1IL1IUzt/cOBt2J3AJAeef0EuSvlSB3APYuq3Tbh
 aJvooqae3AOpkCmU+356H1f5ZqP2ob9ki7EnQvzvylMLMyykDv+M9PY/F5WQorB5sfql
 qv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754347334; x=1754952134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjTQ4z2k7H3mC0fHttSFmBAL3Wgkm0GozBCF4sbE9ag=;
 b=ShHQzz/Tl6fcWEmvV8A4F0UxmNmTSL51sIJfsxNLR0w9K3gffw15rVvV6zWNteMtge
 vCrvWVJ/tU3vSyEkghCFv/UQIGh7EvUMWDl53N3LSEIr8/+iEmufKJke9qS2c8IV2uGQ
 Suq8uHNCnbl9wBR7Q9pJ3e7/KfOoCgvF8qn191k0iaZf2w40xD55IVxq87g5vWQISaPo
 +Wo2SeaBV9Q5UHhdTeLIGJz4mp1p2D+RdgtyizUCNT+nO3Mw1L2hTLWNYPv8iNXPE6C1
 6EXPruY890JiOz8Lt56S7ATWVQcDUAIO+vkJF9SBC0i4HvoH3Lg+rDdlViTVkTrADFyZ
 T4NQ==
X-Gm-Message-State: AOJu0YxTfd/iVKXk5i2yRDz4UEoxKRWTcS0SaoIGJ7MEzPoWalRjFVQc
 b+hO1ghLkOnZvVcSfp3dYXVkI4AHnGfOMj9dvJu9ie+poeRi7cK0hLPHt20BHJBAFOs=
X-Gm-Gg: ASbGncvpHS4/MQb3cdSKx5BCu2TJVRQ9NMT0XSGLJMYz47lvajIr6uIgKUdA5ZH0rjV
 0jQu2f0gNudbm4qdrHtVtt+8JpI143q/wTUgtueMcgGdMJ45QH6IiY1AgYgXopQgBNauGWJH8YE
 aiPOa2Sw/cm0p0Rboc4RicKj+90W5gQFngCeo9HNQ1jBAe3QfA5eeD1NJLlthXl0pn2Bid06/Ul
 eI//2VKEvu86qPFXeKG3pZZXhMQbP6tLIp6S/u981lJL5cNwasiNTJ/0c6llaQiG0hRK8Fgdn6o
 umRaVfoWRvaVPdtp7U8Vve+PCa/Sma2azcTFEHCQ+QlKpWqe5IJtQMrTj/N555W0jckAYC3DgeK
 7t48+KcU1NVIJbsomcV68MnEgrbMchP3RGJ8ubwBTnL3E4VwOP2fwOMI0qx1zRXGbnV6qC023rg
 nY
X-Google-Smtp-Source: AGHT+IFJM19K3tYusZrhJo03D4+4nTXGfOPTNdj1SPfmjTQi1Fzedxlnqgrv1romr3UXOPCYfPz7vw==
X-Received: by 2002:a05:600c:3552:b0:458:bfe1:4a82 with SMTP id
 5b1f17b1804b1-458bfe14d61mr73246685e9.16.1754347334203; 
 Mon, 04 Aug 2025 15:42:14 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536acc9sm230040955e9.6.2025.08.04.15.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:42:13 -0700 (PDT)
Message-ID: <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Date: Tue, 5 Aug 2025 00:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] semihosting/arm-compat-semi: replace
 target_ulong with uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Hi Pierrick,

On 4/8/25 20:39, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index c03096b253d..f593239cc9a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>    */
>   
>   typedef struct LayoutInfo {
> -    target_ulong rambase;
> +    vaddr rambase;

Subject says uint64_t but code use vaddr, is that expected?

>       size_t ramsize;
>       hwaddr heapbase;
>       hwaddr heaplimit;


> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>    * is defined by GDB's remote protocol and is not target-specific.)
>    * We put this on the guest's stack just below SP.
>    */
> -static target_ulong common_semi_flen_buf(CPUState *cs)
> +static uint64_t common_semi_flen_buf(CPUState *cs)
>   {
> -    target_ulong sp = common_semi_stack_bottom(cs);
> +    vaddr sp = common_semi_stack_bottom(cs);

Ditto.

>       return sp - 64;
>   }


