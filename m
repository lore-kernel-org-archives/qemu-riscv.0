Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F0C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 18:37:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qah5n-0001CW-8U; Mon, 28 Aug 2023 14:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5i-000189-K8
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:36:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah5e-000711-Gv
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 14:35:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so20953415ad.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247753; x=1693852553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ap35gWkmsKtps5FixvK4VRHP/HpmvmfPGyXutx6eJ9k=;
 b=tmUqA4KuNEmgJGwUVwW9g/VmCZ+HEDfU7lDAK6e7o25DhCF50HDs7TYKShHubFC7L+
 BDbKMwY0DFIpsXAG5XU5fYQAHnaTOcvBy/KXi8vcS7pDC7ue3Wlkzy53ewqEI/e2sUGj
 N7Opel6XI7J6FY9a9/0YeUEksMzPBmnWHhbWB3hbLEHVR98hWgPJGR9lqvQgsHZu9JJs
 5V9EV4KsB3FT3LAeaAhob9hW5oI8ZtEaKfGKFtpdqIu7IsgxK7Dulwwtl20D/3mfUlFR
 CTTGOhQgxF98geDcjlDuWXUFuMxQwTIs+1ZPcu0MqdxIxJCsiGDyKRS1wlvuU6GRCMSM
 c6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247753; x=1693852553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ap35gWkmsKtps5FixvK4VRHP/HpmvmfPGyXutx6eJ9k=;
 b=S5BBDsrb3eD1DCDA52jtRCrdaE5DiAiA0ZuROHmubLgiUlPsxKOPHDDbo+gUgMugzb
 jp3Da/W5VvyS7NH1SnRmkb9mmDiYaeqCFz6y34B/mY1qdvvDEDs/Hol62GZ5f/kr6D/n
 +fbacEaznhSpF+BY4WfYjsu1xIRuGb+eSNf3CHUkqrOB6u5a1da2V1e+GnZ/9m03TRwR
 pSi/oofZdf4e//nTeKBZcn14v59hVPUZ/jaLMK1thkHH6ZRKVDR7zUHejWxBA/w+snHW
 WQHHptuzU7J0sUmT68SYmsRlqMMzg83QDJJ9gImK6tr4rdYVD5EB1lOmZr8BB2G4ht5S
 KGAw==
X-Gm-Message-State: AOJu0YzIZVUKy8n1FJETSwzv9CkSATo3n0t19cdKQo0B4xksszir8sSA
 dSIoMLvHwrbpf5bXpuUpuAfskw==
X-Google-Smtp-Source: AGHT+IFv2QiWgeMWW1w0CJaWGEj/Wiz/idYfXRykdJ3ukSJVxmDknpLO1hdnb/g6/NhVHr2gm8/QqA==
X-Received: by 2002:a17:902:ce81:b0:1bd:d92d:6b2 with SMTP id
 f1-20020a170902ce8100b001bdd92d06b2mr26038334plg.10.1693247752847; 
 Mon, 28 Aug 2023 11:35:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170902d51000b001bdcd4b1616sm7698861plg.260.2023.08.28.11.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:35:52 -0700 (PDT)
Message-ID: <218e2242-7e72-68d5-471a-6736521dccac@linaro.org>
Date: Mon, 28 Aug 2023 11:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] target/translate: Remove unnecessary
 'exec/cpu_ldst.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
> All these files only access the translator_ld/st API declared
> in "exec/translator.h". The CPU ld/st API from declared in
> "exec/cpu_ldst.h" is not used, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/alpha/translate.c      | 1 -
>   target/hexagon/translate.c    | 1 -
>   target/hppa/translate.c       | 1 -
>   target/m68k/translate.c       | 1 -
>   target/microblaze/translate.c | 1 -
>   target/nios2/translate.c      | 1 -
>   target/openrisc/translate.c   | 1 -
>   target/ppc/translate.c        | 1 -
>   target/sh4/translate.c        | 1 -
>   target/sparc/translate.c      | 1 -
>   10 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

