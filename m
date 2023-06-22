Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9487DEB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 04:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCCJn-0002Tc-Eb; Thu, 22 Jun 2023 00:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCCJX-0002Qf-CN
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 00:53:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCCJT-0004Nh-6i
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 00:52:59 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51a426e4f4bso7928146a12.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Jun 2023 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687409573; x=1690001573;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SXti0mB7XzGaXBJrNPs/RcZqGfjO6pKp5r+aSUyXw5o=;
 b=LfrmZl58oyrVQHGSFq200RQmUGyRvh94Q6wg6dc1Ii+SrcJ2eMKZ6F/hzc+U2dIYIJ
 XcwlO8IEhTrhzvi5AyReXnaG4V/3F+b0AqHWei9OgamAQzxQUCaBsUYr6GjtSbV68pgK
 +Ln8nyiF8yWJ6VaLmljcqaBxeo//eAvEeU2rkAuEcabVb6zEGkwgf41rvxMOrRWCtbbo
 K6N4Jq51zPmwSRrsiU9qZE1R1OLinpq8cCbCbFXmJEYpq0MPO9Cx56Aumv1elW5HBFDj
 unPNxizCVWKI6CmnShOH+Mo4+bow7XpUQ/Rh8i+0EPIz7gdFEJ+pCTRWwPHk6PDA2olo
 KTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687409573; x=1690001573;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXti0mB7XzGaXBJrNPs/RcZqGfjO6pKp5r+aSUyXw5o=;
 b=Hb2vfAYJG58BJTM/hBcfMPKVdszoj3X7Wis/I6r4o78NVHuqrXIAmH9RbmSvRWIh2H
 sP8o3CS/3YA5VO7A81BiTFzLRdYXj7LHq4LWlIIEfhJtC1u2Afs7IJLghMkZ86g42SL1
 jmDEYziR6XV+DH8Ot7UHw0X1GwIJOJueQEiJVQraLtEzy1RSzc6f6nq79TnaJkF1bw/K
 Lfciz7VxdImRXh1udR/U/rHVqYm62ZmTSlcNlvWPI+HZv6yp4Tmki0A4C4nU+rbN7OAp
 uqWrGc7z6weawfE7Dk4yakSmwvwJoglC022FIXHSsa9HMcDi1WPLG0hAuWdA8HJ9skqc
 fpbQ==
X-Gm-Message-State: AC+VfDw2Y3jz+QlAnD5pnuCUN5pdnHbfoXcOJl/lwciBYGO8Jiix3Ndm
 QOsBU0AzgvkB7TdYXrV4/fgspQ==
X-Google-Smtp-Source: ACHHUZ7X6mKCryWfT0ts5IPc4IaJdnx6Nm0NblkctkIWoRKgE3ZncmRk2ZGz9Ri1Kyknd220gWh3hw==
X-Received: by 2002:a17:907:843:b0:94f:7a8:a902 with SMTP id
 ww3-20020a170907084300b0094f07a8a902mr17313756ejb.14.1687409573147; 
 Wed, 21 Jun 2023 21:52:53 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.171.45])
 by smtp.gmail.com with ESMTPSA id
 qu21-20020a170907111500b00982cfe1fe5dsm3925198ejb.65.2023.06.21.21.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 21:52:52 -0700 (PDT)
Message-ID: <59e80d79-4465-f99e-0515-7a8693879946@linaro.org>
Date: Thu, 22 Jun 2023 06:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 00/37] crypto: Provide aes-round.h and host accel
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230620110758.787479-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 6/20/23 13:07, Richard Henderson wrote:
> Patches missing r-b:
>    08-target-arm-Use-aesenc_SB_SR_AK.patch
>    10-target-riscv-Use-aesenc_SB_SR_AK.patch
>    13-target-arm-Use-aesdec_ISB_ISR_AK.patch
>    15-target-riscv-Use-aesdec_ISB_ISR_AK.patch
>    17-target-arm-Use-aesenc_MC.patch
>    19-target-i386-Use-aesdec_IMC.patch
>    20-target-arm-Use-aesdec_IMC.patch
>    21-target-riscv-Use-aesdec_IMC.patch
>    23-target-i386-Use-aesenc_SB_SR_MC_AK.patch
>    25-target-riscv-Use-aesenc_SB_SR_MC_AK.patch
>    27-target-i386-Use-aesdec_ISB_ISR_IMC_AK.patch
>    28-target-riscv-Use-aesdec_ISB_ISR_IMC_AK.patch
>    35-host-include-i386-Implement-aes-round.h.patch
>    36-host-include-aarch64-Implement-aes-round.h.patch

The crypto/ portion of the patch set has now been reviewed (thanks Daniel P.B.), as well 
as the target/ppc/ portions (thanks Daniel H.B.).

What's left are the x86 and aa64 host accel, target/{arm,i386,riscv}.

Would it make anything easier if I re-sorted and separated the unreviewed patches per target?


r~

