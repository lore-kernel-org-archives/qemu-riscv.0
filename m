Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79509C8300C
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:29:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8hb9-0000Rx-Bn; Mon, 12 Jun 2023 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hb2-0000F0-53; Mon, 12 Jun 2023 09:28:40 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hb0-0003hU-Il; Mon, 12 Jun 2023 09:28:35 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1a6820804abso885237fac.2; 
 Mon, 12 Jun 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576512; x=1689168512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GdnOZcCxB1YvBxpz/8V+MqZ4LsB/Ng+UOkEClp1iNgA=;
 b=E23jdBlsUEz+01KDl5akFCpLHUC40dpg/0KwD/Plaf2QUlQvEO62hS9A0CxFGmaHeS
 xNCH/gdb8uc96yQVBY05wv/G48hCbTg4XV0CMLoosBdM6UdhO7AKUaLfrHijkpDNi89q
 XKHJa2zep5pQ4osulZeKEk0lGA546BlGRi+zQMoED3XkIWdhtNRAvDgjE8oXgEk7kLz6
 IAtGmNtWaCIohhQXiO+fNR2H+13aaDfTCtrca8ovom6WI3WUOodfj55pvvRI5Cm3qHfZ
 +Loclcx0tvDeLUn06W5UE4f2njj34X2Nnh6kSB1qEEVcmht006BeoygfF0jIQ9wzEMqP
 JYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576512; x=1689168512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GdnOZcCxB1YvBxpz/8V+MqZ4LsB/Ng+UOkEClp1iNgA=;
 b=EpjkClrK2KvJymfkGsZi9TXAF0j9opTRq6R5vT06IJpJIW7eCUGDwwUQWiO7jorDPH
 diPexb49RAWMxiuA5yfLcL/4TIAsan1uGQJ7Uxuuz+mCvUNgxqL9lCdszq2wIde58KMB
 V3H3GuOAd1C2WYxSXFWiYDsaSQzvUUm+bVAPVTMg2GQNxUmPq6IVGbFSGUbOn3qB7AkM
 Y79xpeAd0jrQ5ZYP+Ye025cXdHJY1dEfK4K9Zkuw1rJcZ+/jlfOw9qPRazLNKf8Zq0NQ
 fvaTLz7xhRjVa0RKMJKf4sm/ZhDX+HWUcqvutvnilZTL4Bk5Up9xxsschyiwkyYwAgUj
 VNEA==
X-Gm-Message-State: AC+VfDwEqhOr2V4HgjEdcgM1PUq5Q62T0WIn7gn/fmbgw8v6Zyq0/AI7
 V14CairE/uKrmhZg7YUBfrHIdGf/8NY=
X-Google-Smtp-Source: ACHHUZ5j4YpmnKV/Kvv9s0T/9RIurGhoFRRPGv1f806mGEwRwhV0TsZs6tK2m+WDf8ijEO8WyitIWw==
X-Received: by 2002:a05:6870:d342:b0:1a2:fd06:9f93 with SMTP id
 h2-20020a056870d34200b001a2fd069f93mr5176396oag.7.1686576511953; 
 Mon, 12 Jun 2023 06:28:31 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056870530f00b0019ed19a8659sm5861686oan.8.2023.06.12.06.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:28:31 -0700 (PDT)
Message-ID: <cead91a0-632a-f7b9-f2d7-bf922f68d604@gmail.com>
Date: Mon, 12 Jun 2023 10:28:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 25/38] target/ppc: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-26-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/8/23 23:23, Richard Henderson wrote:
> This implements the VCIPHER instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 15f07fca2b..1e477924b7 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
>   
>   void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    ppc_avr_t result;
> -    int i;
> +    AESState *ad = (AESState *)r;
> +    AESState *st = (AESState *)a;
> +    AESState *rk = (AESState *)b;
>   
> -    VECTOR_FOR_INORDER_I(i, u32) {
> -        result.VsrW(i) = b->VsrW(i) ^
> -            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
> -             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
> -             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
> -             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
> -    }
> -    *r = result;
> +    aesenc_SB_SR_MC_AK(ad, st, rk, true);
>   }
>   
>   void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)

