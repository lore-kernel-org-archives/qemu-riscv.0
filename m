Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9428CC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:29:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Xgd-0002ml-Ox; Tue, 06 Jun 2023 10:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xga-0002is-EG
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:29:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XgY-0000Ui-Q2
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:29:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b039168ba0so53434745ad.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686061761; x=1688653761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/vPWGvGYYvst6yBTzH0eOa6O9kW455f/dKimEzwjIyI=;
 b=k+SpMG79UWbiptQrEPiAlRZfQowd7+u6FFbkbv6DKvTh/QFfp3lFJQkL9ErJedsjXG
 LOBCKogBdJX6tQepO0gntEvOKQL344BbOSQLBEbcQe7nww4IFb3XxHG8KFU32NiLJH7i
 hW0FKMFNKAn6L8r1dE6CRgI/p14YKTpNIQWKdEjuuNDtRHxwuDVuZIujXTN5MCbXMm+D
 yPTjeRldieJsVBizB9OxyfmimUQITrMYeSnFhmUJicxxUIqUfvlFhn+PfoRYwMqBvxqE
 +22kQXgDaxOdMLnpLgaavz9medRDRIkt7XhVf1e+3TMOvds0H52iv+yfc2ex+BUOG8zU
 4eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686061761; x=1688653761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/vPWGvGYYvst6yBTzH0eOa6O9kW455f/dKimEzwjIyI=;
 b=cuKVxeO1Bj6UFdVMzTXkaBCy4cDmBPKfaYmrveX3Uxu82vkyX50U8gpKIKxCPNW65T
 Um2q8XsgFo8GOS0lW+IVVbpRe43eD0t8iV+HEeFx4H4BLXlLlUjXCgNuU6/Ak12cjAoO
 8jFqNahba11AFWdTpt9n7Vkn2YcOn0Mrtlfftl3OUaekMYzHLzdLrkYM3yXuPfBVAaM2
 N+e8O9AmTrbuUQzDvcABfnhHjmiC5c7QP3sFt7w8AqZTckXQIQmdQxCR/JyK+6ZFEqUT
 8+Nww2t6cHfDE7c8qw78c67A8oy5C1/2UxApY6a8DE//I8Txa+L7FK4lTuSPngSvQ9+D
 H+/Q==
X-Gm-Message-State: AC+VfDwRUl9AruCF4QtaujG5Oh35WjSIHTVOiC4qwm95Ww+Lg4PP48yZ
 E+cW5aRkpwGB0poEqmQnRvBgeA==
X-Google-Smtp-Source: ACHHUZ5QKBQO1qg0+x6plQg0Qq30vhQ5CMxwwIbKGtQXIcx9ceL+1xQ1YyZUl43t1dkegqOaNnO+Yw==
X-Received: by 2002:a17:902:ba83:b0:1b2:1a79:9a67 with SMTP id
 k3-20020a170902ba8300b001b21a799a67mr2022710pls.50.1686061761267; 
 Tue, 06 Jun 2023 07:29:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a17090300d500b001ae469ca0c0sm8607488plc.245.2023.06.06.07.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:29:20 -0700 (PDT)
Message-ID: <c28e9cf1-5fa2-c63d-bb59-fbb4555e0150@linaro.org>
Date: Tue, 6 Jun 2023 07:29:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] bsd-user: Rename elfcore.c -> elfcore.c.inc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Warner Losh <imp@bsdimp.com>
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-2-philmd@linaro.org>
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

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included 'elfcore.c' as 'elfcore.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   bsd-user/elfload.c                    | 2 +-
>   bsd-user/{elfcore.c => elfcore.c.inc} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)

Assuming Warner doesn't simply want to merge this small file, or compile it separately. It 
isn't actually included more than once.


r~

