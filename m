Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21161C6FA8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 17:05:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb28n-0004Le-Nb; Tue, 29 Aug 2023 13:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28X-0003o4-BL
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:04:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28S-0005LV-3a
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:04:15 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68a56401c12so3196382b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328648; x=1693933448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2C4kv/XC66CsYR3g7xIMxzmcYJIxg/OjU+sR3431jI0=;
 b=j/Rifg7MHfMsJEEO5QhDHdvy8TJ9i8qelkXH4kru3WgMQmCg3sCQDaFqUuBcf95D2G
 1dFgcpEks+WW2vYaPHH9evU7AUmpUi1iHwMoR8vFhYIH/R+HJ607wYX1jT0fplnNFLJD
 3zrG1lyeKnY7Q/OSyA5UJ8f24G3qGbVO8geohDOZ/dK8LMX+5s5Q5d95FpZ7gBwBAaGu
 Hr0wDiSmRdUQhvmh5JcXlgnW60CEIaodwhy0qhQWDjqeufSz5ECxUIzexvAU01de+tLy
 4jABkdKLtzFcVLQbjcGbf3m/p/8Gs2DpCl+oqLsjGD8kkPC3RzuP1qQ4VQBPM7+i9gjU
 dYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328648; x=1693933448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2C4kv/XC66CsYR3g7xIMxzmcYJIxg/OjU+sR3431jI0=;
 b=aooO30A2maGPGLR1MDHZ/MVR/F9no3xh1i6cW02NpgqCkfginRfQWIiBM3405oPHPO
 r8sSjVciY3wegA1B+pmQuHC20vt5qRU3YpsyDnA0aLslZsbNcLui4bRNnj5x/vlEs0VU
 sixrOVrkspZYksY96/Pm5cCfg0+8iq2oZM1Tw80aofdOLKmrVlnmPFrFT3E8Qs8/l/AA
 eZsHy/FoDOgpfBg8KTyfUkS79iCel7alQ6EjWenkFFQ2QO0SnIH6yzgwlF+/g0rwSO4p
 IA2OGaTLEG063tQRNIVQNuytYH8XgrhDwrVqnCqOifFeO/lwAw3RDLVjkheebgnFGcgb
 4S9Q==
X-Gm-Message-State: AOJu0Yw1TTsCCuBZJQE8h05hcyDzuGAGBj35vKRktZ2dYc/oNyqwLajO
 pV6WSxVT77g//Nc/nIniwb1YwA==
X-Google-Smtp-Source: AGHT+IG0GrscatSQRy0FBBSBP5gEp2iQXHv/wqk7RNkgcruyAORHL8Cddh8ghufImTWiF84tR7D3Rw==
X-Received: by 2002:a05:6a20:1596:b0:115:5ed5:34d3 with SMTP id
 h22-20020a056a20159600b001155ed534d3mr28107554pzj.20.1693328648611; 
 Tue, 29 Aug 2023 10:04:08 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a62e711000000b00682b299b6besm8695113pfh.70.2023.08.29.10.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:04:08 -0700 (PDT)
Message-ID: <8158f004-e182-53cd-3da3-62a7144ae938@linaro.org>
Date: Tue, 29 Aug 2023 10:04:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/11] target/ppc/pmu: Include missing 'qemu/timer.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Since commit c2eff582a3 ("target/ppc: PMU basic cycle count for
> pseries TCG") pmu_update_cycles() uses QEMU_CLOCK_VIRTUAL and
> calls qemu_clock_get_ns(), both defined in "qemu/timer.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/power8-pmu.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

