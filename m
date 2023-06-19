Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A6BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 13:20:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBEnM-0005gh-N0; Mon, 19 Jun 2023 09:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEn4-0005XS-OC
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:19:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEn2-0005lo-32
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:19:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f9b4a715d9so2479275e9.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687180766; x=1689772766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ssGzWqawQlgeXFiF6NNz5/NTa6EML9WoWRfq7SATZJw=;
 b=fNJXJS9G1XQrqUjzJ/i2oNHNyRQWgHVcj82nUFDYW6FqT3rm0c7/1RWe9KgZY2DgAN
 qT/mYC8ztTYOZJKgPMSfBwryhEqxDSiQ/x1/mORWOwexkPuhrZhoQ/8kfFfCCdSu/AA2
 Bet4HLvHBRwd3hUfgtZQhza+cVBs9UUB3gDzinNW1CtC0b1vvg5S9pK/qeLfo7qm/X8h
 +QSW1unM4XkQPi83zClCq6NeyfaCh4RGKasFS7gkYR8m9zJ45TWoO6m1n2ySm9FPEKI2
 M0aqdEb9vD3+XnqyJpRipilNVnvKMq/Rfg5i7VCJtxojNChi6fKNCs+JW9A7/1jkAYL2
 PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180766; x=1689772766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ssGzWqawQlgeXFiF6NNz5/NTa6EML9WoWRfq7SATZJw=;
 b=S41pfgnIQovXDdN+lB6VP6ZmxTTi56T02Oc5t/j7pg4vPxxxh3hoyOxBJlvQXPJ9oW
 wimjj3Mp7EfPyfhD8KKZZQ9UPiHQ3CIK7huB3BL+ARjjjOb1GkPtD63KVtpMn2F6Peu5
 hEW9HY9i4rlkkwBKMGpIgyQae2yHbYawCtbN8vGgf0bEW7per07r4CjbOZV4Ffk5R+Ot
 NqJLByePPH6pFjzBee0DEH+sCgEzBZJ1qLzhjyzlSY9PhbrW4p2ar/VaHeZ6V4+tIHJ1
 nMjPIoX9cw3JbUyCfzgqByqtzzVTgHuDZ4a+HEtBjPnUPp0aDT+/PB5acoTYDop6DG7P
 IAqA==
X-Gm-Message-State: AC+VfDz9itYUERF91+bN8Zjc9uETN28BXsaHrxaxVdsh+/gASYKGHl9n
 ho5t6YLMoFYXdfJ2Vv+Yor/SCg==
X-Google-Smtp-Source: ACHHUZ6ov7up8N8WOso+anA49P76EJj1vVDTkBNpBEWNcJJd/d3s3cELmFsFMTsZrIcIK+/gDRArjQ==
X-Received: by 2002:a05:600c:808a:b0:3f9:b93:ed5 with SMTP id
 ew10-20020a05600c808a00b003f90b930ed5mr3412332wmb.12.1687180766461; 
 Mon, 19 Jun 2023 06:19:26 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1c770d000000b003f91e32b1ebsm4259668wmi.17.2023.06.19.06.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:19:26 -0700 (PDT)
Message-ID: <c51dbeec-d470-1f77-fa00-53e17032d213@linaro.org>
Date: Mon, 19 Jun 2023 15:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 34/38] crypto: Remove AES_imc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 9/6/23 04:23, Richard Henderson wrote:
> This array is no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h |   7 --
>   crypto/aes.c         | 264 -------------------------------------------
>   2 files changed, 271 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


