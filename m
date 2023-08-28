Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE1C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaeZY-0000nP-Us; Mon, 28 Aug 2023 11:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qaeZX-0000mU-8K
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 11:54:35 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qaeZV-0005Um-7B
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 11:54:35 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c5451a1fbaso2275061fac.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693238071; x=1693842871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1fbJtP16mBJ0wJXx2XG2R1WgNNjD6w/JtUyfEvcwhno=;
 b=Fc43Uqu4yVV8ouwVosyQ+rH0QMnh9f556X16sZMISRQuvC9UJ2p/OHEni5DQfeyHWD
 nKaPqNZy1ISmEwwGuRGN64tpCfHt/l+lntUyNOUFz1yiuu7k70rASC7J70r0w/E8mG0C
 z0+er/Y7Njtd3K01zHc3y85KNkSreAys2onXLn6EG0a5xkSlh0PamIGzIxdb4DLAp2lJ
 g00xaa2X1uOCtFKw/elW11IeAJ/cQCgYjc5y5X7Hh/obiqagtOfARPYxPA5KAP+x5Dr/
 PuVfgj0CpYPjgO4p1k93Z89TNoSRIdqcgoFP8sQb4RljuIns2Dl78fDuwH8wmV4tmRT2
 T2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693238071; x=1693842871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fbJtP16mBJ0wJXx2XG2R1WgNNjD6w/JtUyfEvcwhno=;
 b=XJVAxSCd9tDyV2B6Mc2ieRwfEP1sj1FVFc9I3gGWFKt6cHPS//PnzGQzizyFNAYBET
 UHaZwcA1BbUrfNxZ3PqXG/jOO5WHlKhueygQH0Gy/7A61Xg2nserqZYP3dsu24P4Tfg0
 WqF6Qi0ftIaq4FSUf101DXpA1ZJPTgxDC0ALFh/OYVHcnZfiiKMeJMqBi8wJ44RJIrjT
 dzmS9buKpM+I1fjiciNQeEd+hl5yCrF/vFipJQWc83w7bdl08MEcUiI7c4C57NYCMoUA
 HLmkqzzL8XUxg75tledq2TcVzjFi4xky1P4DQ+Z1Ka1Z4QhX9LPi8B+dGs0LJFUlYpCE
 JkVA==
X-Gm-Message-State: AOJu0YxP/DbF0oiijVsPm8Vhsr8cyQnw7hed7cG0RvHJIclnPjxbRb9e
 shjcu3A6nni1eYgU7p507cC1t0NnqB3SVMw7dEs=
X-Google-Smtp-Source: AGHT+IHy6wj80ZJ3QhZdcI2KRhFltaf2kzT4DQrj+Ej0z5rpA0s1c3hZ9hInyuE43i+oe2MB+E6zrA==
X-Received: by 2002:a05:6870:c10f:b0:1bf:77e2:95cc with SMTP id
 f15-20020a056870c10f00b001bf77e295ccmr12929266oad.17.1693238071171; 
 Mon, 28 Aug 2023 08:54:31 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 5-20020aa79245000000b0068bbd43a6e2sm7031078pfp.10.2023.08.28.08.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 08:54:30 -0700 (PDT)
Message-ID: <67472f5c-f29f-991a-c4fa-0b42aa92898f@linaro.org>
Date: Mon, 28 Aug 2023 08:54:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/riscv: Add new extensions to hwprobe
To: Robbin Ehn <rehn@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <bc82203b72d7efb30f1b4a8f9eb3d94699799dc8.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/28/23 07:56, Robbin Ehn wrote:
> This patch adds the new extensions in
> linux 6.5 to the hwprobe syscall.
> 
> And fixes RVC check to OR with correct value.
> The previous variable contains 0 therefore it
> did work.
> 
> Signed-off-by: Robbin Ehn<rehn@rivosinc.com>
> ---
>   linux-user/syscall.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

