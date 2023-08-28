Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53AEC71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 18:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qah5l-00019G-DC; Mon, 28 Aug 2023 14:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5a-00015s-2B
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:35:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5W-0006yh-9j
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:35:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c1e128135aso7006455ad.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 11:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247741; x=1693852541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DVti7M95dfLk1aMxnUxVtVTWgvEsdrY6/v8/RdKAQkI=;
 b=DjH24GZE34/nPh+6GImWmEdeSGh1CbYXkpKdUGrYG6c/6jdX87ExLbgPbz0ay9E3zZ
 2xED8aR5UjaIzbrPUVQpuOOxZzK9q1LHpnIemCxTwCkH2gc6zd+aJ/1FMpku+GpZIf/z
 Z7s92No/FflAxublFYx5bgmALxGoYrr/w0YHJv/CdsG6t57lipmRywXHt32ndcoj3g/q
 +yCb5NiujgQ8s3gAaMGMr0vIM9Kv8BJUQYE4VG5ZzdzrbsBoQ3Rol9s24u1Ndb6T4J3C
 t0oBs5UxmQrNFjAP+sqjxsCjQp01MRO0sFywCR0r+hVivDb3tQ9gND+Ia1iIUzzt9iN4
 mHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247741; x=1693852541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVti7M95dfLk1aMxnUxVtVTWgvEsdrY6/v8/RdKAQkI=;
 b=HarcgtwnajCgcZaJ3yTpGI11MoEAK4Mj+lopo9ZC4DsHOSZpf3xkA3+/DuyziO2sQn
 B0rts05hSj1PTwVpVC/1jiykCdaeCcS24F0Y1OS7cIOtaLmJ7CQa0oXGB3GPrFhaZ0rv
 ZTPsT28Yi0PWjxwclUK5BEsASAMwFr6+0AVXI8hNlDe4h6GCg1zYMFyiH+zUngubKFxC
 mFOEOIkO6DMulLxNOcp/eirUPaXGRTfqNiS5i9a9IjCJs7HKWi6EkL10zJ4pkF7tSwp5
 eXr415U+HfNF5M2LDoJynSJympIy3k16K+QSy46A1GRqcQ2nMpekNcW+LwsNLBroWjHh
 GrTQ==
X-Gm-Message-State: AOJu0YxFfT9k0nvGTu/dNkdOpX5L+89JktQU390unr7zL+nfOJnxmbsB
 b8tCtE4LYzs5KL79OxmdeHPrRQ==
X-Google-Smtp-Source: AGHT+IF0xbCRMw2uzJrLg8H5JYH/OyACm5gREghq5Br5iwm9eWo8Qj7chITlP4edFvJgKwkAR9kwaQ==
X-Received: by 2002:a17:902:e5cc:b0:1c0:aca0:8c44 with SMTP id
 u12-20020a170902e5cc00b001c0aca08c44mr14329733plf.19.1693247741533; 
 Mon, 28 Aug 2023 11:35:41 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a17090332c900b001b03f208323sm7677367plr.64.2023.08.28.11.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:35:41 -0700 (PDT)
Message-ID: <4706ed09-35d3-34e8-0bf8-156c49650a14@linaro.org>
Date: Mon, 28 Aug 2023 11:35:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] target/translate: Include missing 'exec/cpu_ldst.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/avr/helper.c                  | 1 +
>   target/i386/tcg/fpu_helper.c         | 1 +
>   target/i386/tcg/sysemu/excp_helper.c | 1 +
>   target/loongarch/cpu.c               | 1 +
>   target/mips/tcg/ldst_helper.c        | 1 +
>   target/mips/tcg/msa_helper.c         | 1 +
>   target/riscv/op_helper.c             | 1 +
>   target/riscv/vector_helper.c         | 1 +
>   8 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

