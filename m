Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24DBC83F12
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 17:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb28m-0004GC-1d; Tue, 29 Aug 2023 13:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28e-0003qR-0w
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:04:27 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28b-0005Mv-J1
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 13:04:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bf48546ccfso24118055ad.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328660; x=1693933460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TiB6ubqPsy3z0PuFkp7234GAkXg8zqYSxGbl9JAIdeE=;
 b=WyQGrPJM3pI5ZDNJmXorCKQf7bvdpujBZx+yt6r8Szo5b7Rri342n/JBWRzZfU1H0k
 GZmbfkp+FFo2srOldLW8R3hGZxjeZ3/XDd8hB9LE4xAKh1gmSwV7Yb8z7sCCVRRLiWU8
 ATBZ6Amo8xV+25wF9svPYjWEbRWswhvekJ+CMi44uX6Gsr5mS1JGYjIKKIf1SgTl1SDa
 KxYXG49D7MGcBggK7dPcY7Zta1GQWv/Xk/Nzmvs0QeVwj58O9UFIjEEig7/1yyK+o4/X
 IPGhV2uMT8XszNRnMyJuNNKdj/+5q6i/O6zaOqYxV/OyiQKDI2qG64WVjsDSQz3NrE2y
 sU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328660; x=1693933460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TiB6ubqPsy3z0PuFkp7234GAkXg8zqYSxGbl9JAIdeE=;
 b=LNL2AV/GXAGOzA4nP4jWH05cVbnzqD0Ma4T7YSf+k3m/AlZlLtziE046R37unRmeIi
 L3xJ9kLexbSh99ze0R8TkIMSbtH7kiQUqT7KI4I3byRY29wKzyvz16CfBL4lk6iZ1Hwx
 GoEjBMMkETSowqDWuq9WOdGfRkZrPSTkHjlIuVt33/x/ySu3iS5kGzDlbikcOAO2O3ga
 AYbfjxAAwXy6KpQ9WAYCwARIcSdb9UkTe5pd2m1JV+yxAvQ8QqT3bIldepQvF620eiBZ
 O2UBkJ/HezqB8Qx3qBi2bGv9jNxbh9Zej15KE+2I7t+le7X9STsV9I7yt5Dx8IX9kYUS
 HJSA==
X-Gm-Message-State: AOJu0YzOfWA/hZmAEE1WKtuZ8A1rc9cgapjhNEC7vbjUHvrHE4b+wT2Q
 ddGVIWMjkP0Lq9USbNgTZBnXig==
X-Google-Smtp-Source: AGHT+IHzaMNNRDU+q3XdEvRg1zmdcG3MZKsRc7KwXDwgWBtVYbePLeMGLqsKa7HOwO2MnPKN1BsPxg==
X-Received: by 2002:a17:903:4cd:b0:1bb:b855:db3c with SMTP id
 jm13-20020a17090304cd00b001bbb855db3cmr21738192plb.41.1693328660136; 
 Tue, 29 Aug 2023 10:04:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 jw6-20020a170903278600b001ab2b4105ddsm9595725plb.60.2023.08.29.10.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:04:19 -0700 (PDT)
Message-ID: <57992cba-6230-2bd1-be85-cf7b78e31f2e@linaro.org>
Date: Tue, 29 Aug 2023 10:04:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] target/riscv/pmu: Restrict 'qemu/log.h' include
 to source
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
> Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
> reduce it's inclusion to the source.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/pmu.h | 1 -
>   target/riscv/pmu.c | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

