Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29ADC7EE29
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Y1J-0005R5-BD; Tue, 06 Jun 2023 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1F-0005E6-8o
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:50:45 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1C-0005FV-Gm
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:50:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b00ffb4186so36191415ad.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063041; x=1688655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iuTTBRWkeR+Ed3K1IAJ+XA4dLPW2gUwM5GDgIojeyl4=;
 b=qSI4aX/7QBQ/MF0alrtZXeEt6ak+w9ZejDjWN36aCzNXc3Oe5hIhaUBL0dpZT+HS+n
 YqrsaKxMULdjzGNeom//Xn8BjJBsuV3IFFFD5h/LZqhTLClu2/LP3xp2s3cpJXyRhdy5
 gSVxffHXjqKIzmp4PeZFReP01wf8J8xOTWtufqAjE/5GhffU+tIx2/K0NHdIPqkHfj4L
 7bv92gp2uzxTpT9zOMDueAcE5x3/R5QGCTZqA5fUF/aZcDyvAuRBzlsZTxLZfRZqMbdh
 OGHpjqWgzgvP7lgz6PvEiqM3moNMjC2SY9PqCYxyuSgRyJ53U0y0yZZql3vq/mjPgLYQ
 CRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063041; x=1688655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuTTBRWkeR+Ed3K1IAJ+XA4dLPW2gUwM5GDgIojeyl4=;
 b=JFwwaT8FAnZQDm2IG/luievNaToGntTZSAtpeyE4e0mX9bYhAwVmOcDv4BgP2Cu69w
 mXTF2L5/L3DirKf7XhYLeGhvId7rburuHI0cdZtt4pIBzyAwTHKW+WKY5X7vW0SGWrLN
 f7O6mcFGwx+eYFs9YnNeUTYnv7HAXO02V8wI/H5xhDOeRy2z76n76zUr4anKs37V7Aqj
 cIDMKxcAypvPewy3z4AEpQlZ6bYYgSZ4BrcLkcJhUVExwh12peaXiYDRpQC4x+n5Mywd
 3SsVgprYgSFIRTiFwW10+T7o8sX6GPiflTYI4NK1F/L57Nw4xYaZp8vFQbHsgMtvHdrP
 MOBw==
X-Gm-Message-State: AC+VfDwjK+hP1kIPplXS5YayPk/ELsy7B25LdqgIEgmLAnkPVzlHq2Nl
 vKWTnj7MD9rCogs3vxnYqiEizYOKLPnFv4e6j4g=
X-Google-Smtp-Source: ACHHUZ68VkDC3yRcRADHddB7iTs2YNtRxWInV+k0N6TlbKw1PyXc5+vof4zi+nKgZH4V3pZ4Do2gwA==
X-Received: by 2002:a17:903:25d4:b0:1a9:90bc:c3c6 with SMTP id
 jc20-20020a17090325d400b001a990bcc3c6mr1347359plb.16.1686063041145; 
 Tue, 06 Jun 2023 07:50:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b001b00dae8771sm8640308plh.201.2023.06.06.07.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:50:40 -0700 (PDT)
Message-ID: <d95e04cc-0cac-67f9-e9f2-5438c49d54f9@linaro.org>
Date: Tue, 6 Jun 2023 07:50:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 5/9] hw/core/cpu: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
> Invert the #ifdef'ry in TCGCPUOps structure for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         |   4 +-
>   include/hw/core/tcg-cpu-ops.h | 102 +++++++++++++++++-----------------
>   2 files changed, 53 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

