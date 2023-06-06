Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AEAC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:55:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Y5L-0000s0-GR; Tue, 06 Jun 2023 10:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y5K-0000r7-Gb
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:54:58 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y59-0005r0-Qj
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:54:55 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-39a9b16b37bso2832527b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063286; x=1688655286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INnI1lr2XAhjC5wzJJ1Y/b40cRTPk74Z3EIw14ox1Lw=;
 b=LmxkQt7UPtYlFt/nctma4qRjL+9gEj39khWmBbB0IkWxx2GMUl2lpT3OvkCkOHoCkF
 Ux6M6zuR/z+z++ubTbr3G60VV5VV8RrA6LrpMshCiy8jVgOGPkBj/L5qitlQmzMTc5y9
 f+S2v0Tupkg9OW71ckbgt/2wYI3pJc3H/WjEV33pfyP7kQIghbKyUIUy+c1uDGSHoaEs
 EelI9GhlYLc2w3tvUsbEpbA4KcAD/DKfH/lRFDI8OGNPK1YIS7csyctNtf/Cy3t0MC2S
 QwMgdPXlnexFw9B2ebSrs6Dg3u7tKdD6TxcvzUx77kVkwL24aIYX7KhaUBXlRlIlzD/O
 7Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063286; x=1688655286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INnI1lr2XAhjC5wzJJ1Y/b40cRTPk74Z3EIw14ox1Lw=;
 b=WHbC8kDMjYObfSOreYCMiDWc78uB+mHI9azunIutX1KzOAWDbGnHOJfqEXEAuyWtci
 CCSqReCEyq2dk2v+k6jC7eFEyeUNnMja16wOxGcDMb+FPeq0ZlKnSmf13flAZkBeT8Bu
 e6ZZdywM7ZDL2Z78Ys3EtNcf+vh7RwIa06uhZ+klDydBW6TB5XPxgkNfkgxx0MSAGkb0
 fjtIYb8XfGG9AWfziwa7UaRK4Kz7OAaBN/wGcmzlafdH4TVci5JvNTINQPJy3rjryhV4
 yf1cCXEl2tJJcdF1XL/NubHvamKA5dYeLnyUDUjsJR57KbV47pir5RpZkpKRim27j6EI
 6yEg==
X-Gm-Message-State: AC+VfDwdcRsER4qpiVcape/EuPmGuCVhXaeEKQZPkdfiRjngcYUXkqmi
 /GggHSsfEc+PmzC2VtT3Uewj7Q==
X-Google-Smtp-Source: ACHHUZ4mVD3RLAEbfKXY+DL3to9c4ie1vmFJPHWDrbBS2qerO4yd95EbVlOVFZ19hifXEhf0TAtxkQ==
X-Received: by 2002:a05:6359:608:b0:128:6cca:f306 with SMTP id
 eh8-20020a056359060800b001286ccaf306mr2520273rwb.30.1686063286585; 
 Tue, 06 Jun 2023 07:54:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a17090b124d00b002560ab7a15fsm7717525pjb.36.2023.06.06.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:54:46 -0700 (PDT)
Message-ID: <4573751b-f863-02a4-e401-5b0e5cb524f2@linaro.org>
Date: Tue, 6 Jun 2023 07:54:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 9/9] meson: Replace softmmu_ss -> system_ss
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
> We use the user_ss[] array to hold the user emulation sources,
> and the softmmu_ss[] array to hold the system emulation ones.
> Hold the latter in the 'system_ss[]' array for parity with user
> emulation.
> 
> Mechanical change doing:
> 
>    $ sed -i -e s/softmmu_ss/system_ss/g $(git grep -l softmmu_ss)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

