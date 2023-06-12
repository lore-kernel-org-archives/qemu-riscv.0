Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06439C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8hYX-00058U-BQ; Mon, 12 Jun 2023 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hYS-00055d-Ov; Mon, 12 Jun 2023 09:25:56 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hYR-0003Ff-7E; Mon, 12 Jun 2023 09:25:56 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1a6960956d5so682541fac.3; 
 Mon, 12 Jun 2023 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576352; x=1689168352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WW5NR9XDGPM5bbqy/6TddZDuUdE6bwsOoieFIgJQlYM=;
 b=fOd9EkyFWKCauzphkRuvGDSlPJiUX+Wx71m8ocj0nzWdpdItahZbnqB/dqcO+t5eNY
 F5q+sDoLCV1fkyIEoGVZryPOvkQKDPvwGLyXZc5dxlJ8jFyFt7RtUiIsHXmKNU4UrEw+
 Qhbg6hiJBooSzHyKtfVSpEZSO0mYLTfQNrqAFNrXuAyeJhan0xqbByg6320vELjMxKbD
 9UUYF0ou14Swp5rVh1T9drAh5pv5k50iffYZHNqPSSAclOVdqXNzfe74JuhnvM1h81eJ
 +da6QWnV9r03ePBxp3TPUpmk6IxilAh/DnBJXvxcakS7fHy7fNgsaB2jabT7+3w/zhrB
 KG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576352; x=1689168352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WW5NR9XDGPM5bbqy/6TddZDuUdE6bwsOoieFIgJQlYM=;
 b=eehVXQFoaA1TsBQF3A8I3Y1Ig5ofwqrRw+Eu4QIG2uXxTCLNzOALYDwobyGHRxyhhs
 oO4VdQFcvZETJrDHeZ+AiqD/dNednlg4Bx0S2YYjRg4tSx9OSJma4qa3+WTDhGKTpqhd
 DndajPKqtF1R7hfKnLChcDAdLhEq880UItA6IfJKWBY1sxn1gxMoQ1YLo3Kw1Icm5Pgn
 xirFyxTf+W8Tzr4roW+GFh3fOcaw4rKCVxFk+CYMXURVAKkPfxfO3ZbYiCmTNE3EG+Zi
 ztwFv8UmIawmx0Gb3X67q87HGR8i5+ylRa4szeEDqv0YoHaRuO0KftRWgllAxBGIkaoQ
 iIcg==
X-Gm-Message-State: AC+VfDzp4tXvLRH6drMRWzLWF0PSxIj9wY3+1PvwzL5mpF+otfnOdU/g
 yyaxDiihD99ayhupdc/l9rw=
X-Google-Smtp-Source: ACHHUZ7S+cBiKBqVo5mYwJjAr9UsAlJ2cgBlwghDenYpCP7NYl/5LVqLyeOuj+1dCtBmtCYeAaQGyg==
X-Received: by 2002:a05:6870:989c:b0:19e:a0df:414a with SMTP id
 eg28-20020a056870989c00b0019ea0df414amr7008764oab.25.1686576351936; 
 Mon, 12 Jun 2023 06:25:51 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a9d5906000000b006b2ca17623fsm2862214oth.64.2023.06.12.06.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:25:51 -0700 (PDT)
Message-ID: <5b2a6f56-e182-cf4d-e404-152cbfab2039@gmail.com>
Date: Mon, 12 Jun 2023 10:25:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/38] tcg/ppc: Define _CALL_AIX for clang on ppc64(be)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-2-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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
> Restructure the ifdef ladder, separating 64-bit from 32-bit,
> and ensure _CALL_AIX is set for ELF v1.  Fixes the build for
> ppc64 big-endian host with clang.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.c.inc | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 507fe6cda8..5c8378f8f6 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -29,15 +29,24 @@
>   /*
>    * Standardize on the _CALL_FOO symbols used by GCC:
>    * Apple XCode does not define _CALL_DARWIN.
> - * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV (32-bit).
> + * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV or _CALL_AIX.
>    */
> -#if !defined(_CALL_SYSV) && \
> -    !defined(_CALL_DARWIN) && \
> -    !defined(_CALL_AIX) && \
> -    !defined(_CALL_ELF)
> -# if defined(__APPLE__)
> +#if TCG_TARGET_REG_BITS == 64
> +# ifdef _CALL_AIX
> +    /* ok */
> +# elif defined(_CALL_ELF) && _CALL_ELF == 1
> +#  define _CALL_AIX
> +# elif defined(_CALL_ELF) && _CALL_ELF == 2
> +    /* ok */
> +# else
> +#  error "Unknown ABI"
> +# endif
> +#else
> +# if defined(_CALL_SYSV) || defined(_CALL_DARWIN)
> +    /* ok */
> +# elif defined(__APPLE__)
>   #  define _CALL_DARWIN
> -# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
> +# elif defined(__ELF__)
>   #  define _CALL_SYSV
>   # else
>   #  error "Unknown ABI"

