Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB8EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 05:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9Ish-0006Ti-5G; Wed, 14 Jun 2023 01:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Isc-0006H3-91
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 01:17:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IsZ-0001PD-Mg
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 01:17:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f7ebb2b82cso3012335e9.2
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 22:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719826; x=1689311826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUixE331uCC1TmqrKK2xSaxt4BSc1VuFgFBldd9cxmE=;
 b=sDkm3emtXKbGZigvZxWrGyACN2XSTrOuCgKCvclc77uUXo8jQCHb+zSu6Seh1N1KbN
 /JTm8Yr4BCeh4lMUUQf6KABWIJcf4xLjv5M2wJ6xzKgMe8H3a8q/Go3dVaqjkmdjzI1J
 kZxqXg2V4SLER9x2jzFdBwZPqZqalF1dimbJuX62NEiwmt8kjvnY6cGc5fOSan2F/PeJ
 ydcE7NK980ZdciLBJNCM/TPs7yMmeQPYRs2hKW1mm64CJcIuezgd8l7SFi6xWxO2Ny7u
 s9AaHEP7kgpIRVeMC7q1q7K/Blq4QKlM7YtWa9imS7dWZr3rvWWikeJRvANumbSZV9Me
 wscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719826; x=1689311826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUixE331uCC1TmqrKK2xSaxt4BSc1VuFgFBldd9cxmE=;
 b=jjArIqNnMDJWrHE1+79fV75jmWlWykWzunsHJxbokrUPrwE0o4EWufZkzLXhzkXxnH
 CGFtTbHH6onO2iFwpFQTnzvUp7AAHrrEZQDEwrTq0QX1qe49s7bYbvv8MbDbg+IkXLnJ
 mH5dOjsZYf2NlwUbYCk5fJm1RgWH8hDelQUccs0wMw3O9JXaYFvkJ0K4aYMFvDer4pqi
 BflxHWLv6ZZyyDaPAhGHkZYQYIOoC7c/J0XC5rysPqekEHJjHikCFwAyRiyK5V2gZd2o
 heqxg+VuR8iUORUkzJ5RGUgEziQCBNYV8KAIJpTbr/pL0V16wYEggFAjTYrLCNGCueJn
 4y5A==
X-Gm-Message-State: AC+VfDwnizsW0tW6owINaJx9/h9Un54aatvGIl5Ay+ZQIqb4vD1yAPM/
 b+Ex1A7BJlhVecWae4vmB0mqKQ==
X-Google-Smtp-Source: ACHHUZ56jkvn9MlBwfXlnitRoOizs5TTak4VVvLpwEboA8lbLP2w5v9VJ2YUqn77o/CC/vTirwYQ2w==
X-Received: by 2002:a7b:c3cb:0:b0:3f8:1af0:802f with SMTP id
 t11-20020a7bc3cb000000b003f81af0802fmr5646688wmj.24.1686719826542; 
 Tue, 13 Jun 2023 22:17:06 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a7bc7ce000000b003f50d6ee334sm16182641wmk.47.2023.06.13.22.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:17:06 -0700 (PDT)
Message-ID: <06aafe2e-afba-431e-c863-c9e124ef1c93@linaro.org>
Date: Wed, 14 Jun 2023 07:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 8/9] meson: Replace CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613133347.82210-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/13/23 15:33, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> use the clearer 'CONFIG_SYSTEM_ONLY' key to check
> for system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   meson.build                        | 4 ++--
>   accel/qtest/meson.build            | 2 +-
>   accel/stubs/meson.build            | 2 +-
>   accel/tcg/meson.build              | 6 +++---
>   dump/meson.build                   | 2 +-
>   hw/i386/kvm/meson.build            | 2 +-
>   migration/meson.build              | 2 +-
>   monitor/meson.build                | 2 +-
>   qapi/meson.build                   | 2 +-
>   semihosting/meson.build            | 2 +-
>   softmmu/meson.build                | 4 ++--
>   target/i386/tcg/sysemu/meson.build | 2 +-
>   ui/meson.build                     | 4 ++--
>   13 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

