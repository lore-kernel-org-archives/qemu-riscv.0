Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A041C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Xzb-0003f5-2I; Tue, 06 Jun 2023 10:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XzI-0003Zd-LM
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:48:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XzE-0004j4-Is
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:48:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b04706c974so53587145ad.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062919; x=1688654919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojb1cND76xpAWDunP5fQnUJZtmpC4/7Q0Xlav9BCelI=;
 b=Zv6X3IEyqx525/THajyMn3tYezXTjrUTs8wNR8wR38QwQc/zXAq/h/ROY3j5cznFHB
 nrhLXQi1Da0GQLiRGEeqoknDXYpd+ZE8R0XoSMcSlT9wnJg5U5pkGXmFQtZ2X5pcFmNi
 B1qxYIHghsh8RIExYvR9wsR+qVoIJlehp0yYZAiGEyKx5CHrhe7+9L8whG4amd8CI334
 1MSWAayZFBwcKl+G6YBJDtSJpHa3zls3MEe6uXNGbIZ9mbNgzwuNwJyTSzz5bpaoWE69
 23NQwVqsDPc8SUw/ULOcvUVyHC71kgjioPSgQk0+Ngu6iM4VrETNYtnWueRWFA0zIOQS
 sdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062919; x=1688654919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojb1cND76xpAWDunP5fQnUJZtmpC4/7Q0Xlav9BCelI=;
 b=V0qYVhoBOP0beJzPrlIaXOhZO4Gtmi5PsEBHJDF6i6G5+Cup/U6uH9XyEZS6P+JQcg
 P91UCzRL3DTd/Q+IpVaqsSl3WP9Qz78lhSXB2xXnO9S0+iKtz9qZMsvSenveqK+FdjVW
 bPv2D78pcfgLOO2Hcrwr0kHZ1TxQwpopZqTpZuVBJvPtvkmVjmvgalFpnkfPrCdEd3fk
 nKNSbVHk/k6bN8ldjtdP1R9HTTJ+nLu/MOm6c0i54pfCtWidgffaSr8MVQ/lSAU4ZQgc
 xYGp1cP4b0JfOQVKp7jYyPId2+aa65N6ahpWOzy/hmMHq7lepBCGptkLXpDl9Tdc+tcr
 9Ccg==
X-Gm-Message-State: AC+VfDyQkGv0WkCPXRr+sZuPOorla+32mkPc2hHdRMG9TrPEpAwCGu1A
 cIe69VEjjAviEcAC8MTZFrcYFw==
X-Google-Smtp-Source: ACHHUZ7kKqJeMf0x2XVVuBQCccN3Kp0NO0C2suL73UasP7twCXOnbv9fFQdZc2pMyNGRGJ7QRlCErA==
X-Received: by 2002:a17:903:22c3:b0:1b0:3df1:c293 with SMTP id
 y3-20020a17090322c300b001b03df1c293mr2592900plg.45.1686062919143; 
 Tue, 06 Jun 2023 07:48:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b001ab0a30c895sm8627647plb.202.2023.06.06.07.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:48:38 -0700 (PDT)
Message-ID: <16c75f6a-7621-213f-5786-d0ea34e02478@linaro.org>
Date: Tue, 6 Jun 2023 07:48:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 3/9] target/m68k: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Invert some if() ladders for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/m68k/helper.h    |  2 +-
>   target/m68k/cpu.c       | 14 ++++++--------
>   target/m68k/helper.c    |  4 ++--
>   target/m68k/translate.c | 28 ++++++++++++++--------------
>   4 files changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

