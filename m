Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE546CF8869
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 01:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swtQw-00084i-OI; Fri, 04 Oct 2024 21:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtQu-0007yD-DR
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:18:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtQt-0005JY-0y
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:18:08 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7cd8803fe0aso1911537a12.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 18:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728091085; x=1728695885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GX/Eqy1qm099gCDJtIWpuYiPrXuYxuiWTsK33NygheE=;
 b=EfSci7sN4srsTI9IrI9VDXdRnzA1igS2t9yRRkoZ0FnFnsfmsUcLBW+LSX/iStG0QU
 jVz8104kLbqz2kCTVYsHZXSNwrvNbJTZNi/xMLs1lt0SfbP1KJr7RC+ib9k9q2t+IiWn
 4laxcQm9OTMX18d7h5xSskKJGzMPcNc8kgw81zOGFTVIFZUwv8DeB4y6KZVtCsg2AvXh
 iQEgu6hKSpVO5bOGEgUqrd/5vgUhyQ54iHD3wk3do2PeUIEOCmWSRn1hgbAm+9ruO1a6
 G04bliAUACDVhA4F7/SSaU8G95jEOR0ufclVb7R5xa3jzCQ1OQJi6FkdPTgk/xdQ2o5W
 YIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728091085; x=1728695885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GX/Eqy1qm099gCDJtIWpuYiPrXuYxuiWTsK33NygheE=;
 b=YO1JpPjy0Ey2XwFXfxYKMeegdD1y6P40HCKBMxfMEU71bQZoMchNCgy2qVQeMhAmbu
 /WEGPUAvhaL+zzeUxwM+Kf8LJZBsNKy5U9uDOswvGJNu1w3eDPAMqGcugDSBYBH7/MPU
 DUDXfO6/EqKP7eo92PDJRIeY17Zsn0OeDJJbnoHLkGpZUTyUB+Q/Z5rBgpj2HkSJHQtv
 Z8UT/H2S6WuMe4uZ0goF7V6R/Oi0cndl11wPk3f1npHIQy6VuIgcJFPa6A1jljEAxHu9
 JqMNK7ymUo8nF5xHLOE0tmrA6Md5wlw8Qbw/JKjVZGxv0AROyRg/kzSnNb+qYmqmDGHX
 LfGg==
X-Gm-Message-State: AOJu0YwCCH23mEZRmvN8TtMaWsIqb31jcKpYC75qCU6yyOcrB5byjrbN
 +CMrNkYYYS8RYxAhWA2kSbFZjIIWElbsj8vX8CA+vT+IsBNMwbIDQOhjV6Go4dw=
X-Google-Smtp-Source: AGHT+IEnnNmpluWhLtWH6c+kZ4eKqfCDu42gFhZRsXu6PATwsNVkZaa/XKVqO+VF0wnJPLADXNr+BA==
X-Received: by 2002:a17:90a:ab0e:b0:2e0:b5c8:9ca2 with SMTP id
 98e67ed59e1d1-2e1e6224874mr5045578a91.9.1728091085589; 
 Fri, 04 Oct 2024 18:18:05 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e20ae6dfa4sm622950a91.2.2024.10.04.18.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 18:18:05 -0700 (PDT)
Message-ID: <b200deb1-1951-4526-bfc3-8ed35409071d@linaro.org>
Date: Fri, 4 Oct 2024 18:18:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/25] target/i386: Use explicit little-endian LD/ST API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org
References: <20241004163042.85922-1-philmd@linaro.org>
 <20241004163042.85922-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241004163042.85922-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/4/24 09:30, Philippe Mathieu-Daudé wrote:
> The x86 architecture uses little endianness. Directly use
> the little-endian LD/ST API.
> 
> Mechanical change using:
> 
>    $ end=le; \
>      for acc in uw w l q tul; do \
>        sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
>               -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
>          $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/i386/); \
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/gdbstub.c                | 30 +++++++++++++-------------
>   target/i386/tcg/sysemu/excp_helper.c |  4 ++--
>   target/i386/xsave_helper.c           | 32 ++++++++++++++--------------
>   3 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

