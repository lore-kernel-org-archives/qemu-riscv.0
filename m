Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731E2C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:27:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8hZ9-0005oo-77; Mon, 12 Jun 2023 09:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hZ6-0005mt-AE; Mon, 12 Jun 2023 09:26:36 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hZ4-0003Ug-Ko; Mon, 12 Jun 2023 09:26:36 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b15e510630so2579655a34.3; 
 Mon, 12 Jun 2023 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576392; x=1689168392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hDez8YRDoT7S56LutWSnx65QD+rNuVYw6TmWIT6HySo=;
 b=AzeYxdC0UdC14BlMccbKTdB86NnuSFQ+2qXNp55spegREY8AgafulIbZoLvPzarPqn
 hpuADW09AsnjEpqSd1Q4exoPB40+6PlI9kqC6JcHc9sBpcqAYlfil0Q81g8QKYHfa3Wn
 9au/B7pHawckoDky5S1+0/p3MXyQacEgXfDL3UyXKAqd0lXc5n83VFNJoQNzdX7KLDML
 vCc4ODkzu324SZ6DNaopj6yn5fyjZTbFjsvh8A+3cDA84i55bTSWkXIv5i1CAcFfZHLM
 WOEXguce8uGD9Z/DuLyW4cxVsvfec5drc9xOJXjsZzNAKRTSfHd2UbpP7Hyeb83wZf0S
 J/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576392; x=1689168392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hDez8YRDoT7S56LutWSnx65QD+rNuVYw6TmWIT6HySo=;
 b=iLkhyJ9p0GYxGjXognkTEgmN0JJl6g+NVsQZEuh5DIsyEdAOlNuyt/O8O3GrrKgUui
 I6KDmBBeV9t0r9RxlV6Z7u2Sr711jdbWSsQIWZ5V+m1ej0lL3krl8D3Zud6wboPdTN79
 UHCUt2EbN4leUW8p60gLFE68PWO0fkv8kux+EddNr3I1YdOq4Lt6g12SF9m9m+w1TuXW
 odZooNNFtCXM6QU/umrWM0ZkYMqxx3wMhfGwXpiH4ggYvesRcEfd8ajoIrz2QdAxtOlv
 5sB2Lr8ISdryRqMDip6wNVpHNFXKDHvLgFOIc7KMyCrnH8UBbM9B1VQABUq4p74Gq9tZ
 3o7Q==
X-Gm-Message-State: AC+VfDy7ihqS/RVy1iEIxsRvtbtPbMXGv2scgxNcFdwSKfNDWYeMRqeZ
 DGOUZftwQRHoxeHjjxwBt95VbD+nokQ=
X-Google-Smtp-Source: ACHHUZ4SYvDbb5F4gB7ZmaBGcRKoarFkwBvgN1j8v6Emqu01YDiBFZ45is0WnvUZpXOIOWXGVHWmyg==
X-Received: by 2002:a05:6830:1d57:b0:6af:8e73:786b with SMTP id
 p23-20020a0568301d5700b006af8e73786bmr6672461oth.5.1686576392161; 
 Mon, 12 Jun 2023 06:26:32 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a9d7698000000b006adda5cddb7sm1806593otl.62.2023.06.12.06.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:26:31 -0700 (PDT)
Message-ID: <597ac3f0-7fe9-e618-68ba-11663296f463@gmail.com>
Date: Mon, 12 Jun 2023 10:26:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 10/38] target/ppc: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-11-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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
> This implements the VCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index d97a7f1f28..34257e9d76 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -25,6 +25,7 @@
>   #include "qemu/log.h"
>   #include "exec/helper-proto.h"
>   #include "crypto/aes.h"
> +#include "crypto/aes-round.h"
>   #include "fpu/softfloat.h"
>   #include "qapi/error.h"
>   #include "qemu/guest-random.h"
> @@ -2947,13 +2948,7 @@ void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   
>   void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -    ppc_avr_t result;
> -    int i;
> -
> -    VECTOR_FOR_INORDER_I(i, u8) {
> -        result.VsrB(i) = b->VsrB(i) ^ (AES_sbox[a->VsrB(AES_shifts[i])]);
> -    }
> -    *r = result;
> +    aesenc_SB_SR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
>   }
>   
>   void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)

