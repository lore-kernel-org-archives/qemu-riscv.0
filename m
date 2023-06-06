Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09AAC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XwA-00079v-DY; Tue, 06 Jun 2023 10:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xw6-00073M-VF
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:45:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xvv-00044x-Ci
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:45:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2564dc37c3eso5450504a91.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062714; x=1688654714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1tJ2+L5cHCKhwAu73ijDxV4qbX5hmhJ/fdum4OqMek=;
 b=cXkLIF4OrlCwwa5akW6dvgabsRFZ6lFTOVDKjmpfxXz4lTY3KTJmfW5F7hoesuRxmU
 2+FO+0Dr4z3uMWdcPwpHCykvYjfhFkLqZgGv0U2P6g+usS+IiZP1q2wy5MsofCpv2ue5
 cRhmEiZGubPuEMjPKvxDm+31ru25I2Q9RC6mts3eg+XqpExoX5+zl4gl6ca6tjjHHY5q
 UJsahjQmlhhmRPtCLZpni+X5JKIYupiLAloVfDJSedCk/+Lrhu2i9U8+HCp8KGfAd000
 B5sNQ+do7XxKsE3lH9POmvlm1T23llc6krvgsbICYE6ZwrY2Y7wopLcSGjzNt+vIA4Zi
 3Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062714; x=1688654714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1tJ2+L5cHCKhwAu73ijDxV4qbX5hmhJ/fdum4OqMek=;
 b=THkptkahl3DzAFTGDvGhhuEf+G2C48IqyquJLsNlUSxvtA5W1xM5dj5CdT5WVjLaBY
 9FCBxJHWDe0hTJLeGUz1A3re1O7mjzJE/1MdbWr3p0cQZ0srPejQjerpDXkkmy0fg6I1
 KQ+Y70YhsjpKYlIBAlfd6L7M81oWeSd//9dk43z/L+gyZG3PbwkBRZ9B3B4L8uw8IFmw
 G52456MjVIwmaJeoV9rdfOJ2lVNGffYpYD5YC1ulXT2QDiticanlFE9kg3nMwnvC2Kwx
 swcNMEtZP9rVw24fxVjXvCfL+XPkXUA3zuej4skiNoq2xS2DDCtBx98Q5aLcUdYiyqnp
 2LKA==
X-Gm-Message-State: AC+VfDzsGlMZw42vxv7LdpcZ2ohbRZAdrNLZH4BAIMzSssvNl7uYC6w5
 Spi0VywEs6LZ0SzaXPK89g+Ouw==
X-Google-Smtp-Source: ACHHUZ63LrsaKH1r0pjj2mSEFvB4/oLo+8z9Hh7fu5FMxItxedlN6MUk1BmxdtjbWyyVAmkRUz7aFg==
X-Received: by 2002:a17:90b:2397:b0:250:50c5:cabc with SMTP id
 mr23-20020a17090b239700b0025050c5cabcmr12509845pjb.3.1686062713761; 
 Tue, 06 Jun 2023 07:45:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a17090ad3c700b002529f2e570esm7742448pjw.28.2023.06.06.07.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:45:13 -0700 (PDT)
Message-ID: <599d706c-070a-c2d3-990e-f6a1720f3485@linaro.org>
Date: Tue, 6 Jun 2023 07:45:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 1/9] target/tricore: Remove pointless
 CONFIG_SOFTMMU guard
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> We don't build any user emulation target for Tricore,
> only the system emulation. No need to check for it as
> it is always defined.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/tricore/helper.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

