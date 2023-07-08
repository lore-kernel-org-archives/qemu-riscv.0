Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39BEB64DD
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 17:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIBb1-0000K1-EJ; Sat, 08 Jul 2023 13:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaz-0000Ih-Cq
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:19:45 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaw-0003q3-Vf
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:19:45 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb9fd28025so4507591e87.2
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836781; x=1691428781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uBq6xE0H67dxAxxLrM+uItKGrmh4nAnJSVcXuurF28Y=;
 b=sHgNXnHRDhWSK8PPLDS/A81M4E2QhZ4MbpfotK8OE6kbNEsKNCKWgEuisq0ykp6h5V
 I9bB0LPjy++zY153jpjY1FKukyFMDubsqtD3cVKFtq5/+LQhlxvcV3bcQa2gHBHof/zv
 xSSOGhmTE1xv1UqyxDrfQgU54qOToK+K6epZxPygFJXtddjRTlOWxrdIlD7nmfwJahBP
 kHInyOGPaDCad0zs+xuOZwnrgph7RUwpfmwmmphwxXxATtPWjUBcOy5TwslBUi+b+Amc
 w99C1aUus1k8GljAP71qJf/7UTEZYxPUD8d5HLEet+erJZ/Vsg9VSQSlanxzEl4/ji54
 rp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836781; x=1691428781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBq6xE0H67dxAxxLrM+uItKGrmh4nAnJSVcXuurF28Y=;
 b=ZFNcv8YvhQvDh3sb302IzYmFZLv0TmYCILGzuzi9JmY3OqGtN/7JQJdUDW+ad19Wv3
 xf9LGtqUS1/X7c/cBKOGrAwKqsF51HQqeDBIyKLFkKkhEJE/jwU5DfyIzCSXdU3pf9hw
 htT5JFCvMy39k16+xzDdFVDaOs5fYcnSsEY3mMR3Ztg58y19zZZE7xso7SnDF9Qtwu6v
 TAy2zzjuHtTVVo1y88G2lMknWmL1Tu9ee3jFr8iuU+d/3MuqJgkHy9hxYdFtqppIr0uH
 V5cm1HVAP7PG8FLOeZoJS4vTvTIVZq14nFUvP4HC0yriMBX14GhseWKdw8UJmKj3Kpk0
 szDg==
X-Gm-Message-State: ABy/qLag1oNJ15b+aO1iYX+DA2+sz5kyqQ3SKTw+RbJEgJH5sJTJFqPq
 ZRwVHMbJO3hGu99w3r3fZDU/pg==
X-Google-Smtp-Source: APBJJlFRFkI9ZkHKXn2lF143R3z/oaRTPLLPkF285qpVqp12ECDK1HMJUtffrCv/FFh4Ss10suEXyw==
X-Received: by 2002:a05:6512:3253:b0:4fa:5e76:7ad4 with SMTP id
 c19-20020a056512325300b004fa5e767ad4mr5483697lfr.10.1688836780953; 
 Sat, 08 Jul 2023 10:19:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a056402071900b0051a5cf5fcaasm3504349edx.23.2023.07.08.10.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:19:40 -0700 (PDT)
Message-ID: <54371e18-33aa-5871-3eaa-7931f22339b5@linaro.org>
Date: Sat, 8 Jul 2023 19:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 26/37] target/arm: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> This implements the AESD instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 37 +++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


