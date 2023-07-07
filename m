Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF1BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 20:32:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHs7u-0000Mo-AS; Fri, 07 Jul 2023 16:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs7t-0000MW-16
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:32:25 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs7q-0001zf-DB
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 16:32:24 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so35777461fa.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688761940; x=1691353940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+r3v6Hw7n/2+Ok4CIzB9Rv2KMj+3fKeEfDKZQHooNXw=;
 b=MPtjQuFE6d/FjowiO+BjifppstSkMHx6mGrG1RrY88zUluZ4252Z7CY9YoVxF0JRcJ
 aAwzjksiXGAMyf9abrIU6aQwiHsSAigsoaLyFUB6Tf2iuW8SMGVqcjzHZE0fL7S/ck9y
 KsO5xwUFrhUFXOAUKrRrsWCKwt5GMbSKj+slmu0K1ges6QoDFZ38CjGLHWs/GUwCaLUg
 e/QweF9praInhj70ogGXIOpDC2ATLpEkHAblIg/roPsk7CGClup5xWoW6PB7TmUzR4da
 SNDwkTxJLmH/XAR+B8hv2RxX5HjoZ2/LaXYACv8EMpRDAv82Clq3FHlJN+CT6vCPiUuP
 jQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688761940; x=1691353940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+r3v6Hw7n/2+Ok4CIzB9Rv2KMj+3fKeEfDKZQHooNXw=;
 b=evLYQE3YLZgMiPCYcDXSL1ZbS3jliXXGTE3g7NQE8RrcLi5OOcIKkrRQfnA3PtH0Bg
 +lbzehCBr1/iKUwACRpKUNNhi74EN8UAUH8V2SpvoQtbv9ryG3bYhnG+VC6C/lc86Ced
 xYooP96hfGcnOYMBfB1CL6bzebvHdFX2CoxEbNSsyOT92Nx7CXRz6J7qXEMwXMDNNz6r
 AaxxCl+NkI4tJvjJwRbatemiOaXynxboy9Zs04VQnlMNknBLgx3P5Xfq6H1g4k81pOi9
 xtiYXwlOYKZHiHv1AtAQ6Mm/uFcj3qhbMfXO4tdfgqUJI9Qcj3YTSs8rKH0u5NxyKt+a
 aKRg==
X-Gm-Message-State: ABy/qLYFfvMA2SjpL1nQcR+3coqXMO5PK8WaLbKvcLt+eFaB5BoyRvtI
 tVXn01WvRNDHj9KeGquxpcHMmw==
X-Google-Smtp-Source: APBJJlEqxtqJlJv+zDxoASaPFXslitW7W6INld579Gl0XUvFexN3mTFx8VYKVp+0WDFmJz2axbIomA==
X-Received: by 2002:a2e:918a:0:b0:2b4:6e21:637e with SMTP id
 f10-20020a2e918a000000b002b46e21637emr4537997ljg.16.1688761939850; 
 Fri, 07 Jul 2023 13:32:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170906341500b00992ab0262c9sm2598157ejb.147.2023.07.07.13.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:32:19 -0700 (PDT)
Message-ID: <87d67505-27ab-96aa-23b5-d11972060ffe@linaro.org>
Date: Fri, 7 Jul 2023 22:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 30/37] target/riscv: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64DS instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index b072fed3e2..e61f7fe1e5 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
>   
>   target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
>   {
> -    return aes64_operation(rs1, rs2, false, false);

Matter of taste probably, replacing the code of aes64_operation()
which is re-implemented by g_assert_not_reached() would help
reviewing.

I understand it is too late for a respin.

> +    AESState t;
> +
> +    t.d[HOST_BIG_ENDIAN] = rs1;
> +    t.d[!HOST_BIG_ENDIAN] = rs2;
> +    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
> +    return t.d[HOST_BIG_ENDIAN];
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



