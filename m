Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AADC87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 22:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj479-0004M7-D6; Mon, 04 Aug 2025 18:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj46q-00046z-Ce
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:56:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj46n-0000Fi-BS
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:56:47 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76b8d289f73so3418542b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 15:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348204; x=1754953004; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KXmJcDFY/K6kmvJKvRb9yzIOFxWc0d1jqukisbQaPXI=;
 b=Vz/GVFc1HG0nsvV/2H6jyUL2khw3RRSftt6MPuGObWLYO9dwY2S6JCoqhBEIUaOZN0
 oo2LZxHalOjk2G7hq4D7lNMOss94rjztfA1Z1TJuaUrgtNgc6+yH2N6FX7USC0rq9iaY
 B4FOhibQ/XBxnYNy/eKYZE+IqsMwMCPPCqDNdKnTqCZo1cged1YXjPAMSXdwhZQe9v60
 VbpjyDAiIZQyjgqPDzrmbYfWfVxmUtbly8Qlaw4e3D2rhzgoOrr5ADpEdmfCfGr++4XV
 18QqcBhUG/8quVcZTsdC9G493vSnobwPF1NjxUsf82vgmG7EIV5Pybo+GvbOxRCri/O/
 GHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348204; x=1754953004;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KXmJcDFY/K6kmvJKvRb9yzIOFxWc0d1jqukisbQaPXI=;
 b=Rk87ipnfv/An0N6Vr7ocnK62JNuN4AfyQ8scjYvuUPiQpPbRfPSsgtvdVFN7skPKKq
 pFhQZ3qfoYX2ytcKOaMfkyjUSV0k+I37J4o7Hicljv3cI4lBSBqe2BO75uvUyv5krL2V
 WKF9wbd3Iiwq3iPwoj665EU8h9Bl6wheDEcFjLrMaRBNQegVpv1XIvm9OlcZEi7qB3j+
 uHfh7SxdFaTVF3KfaLNJ/GFQ06MIs/0nCINhx9PsIJ9+mO+YKr60bRvvsKDF7yjpDLgm
 3/TBfrY3UuZAMpDv/SKEClQSgJZC+C56RMRVicq425RcZnN6madePmDcjs6hMi4Q2VGt
 RbNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpsNgyzucxPt/mZgMq6GN/vm3CTXB5WGmdGbvJh5kJy68Yc4rfSbqze8IpoiO9Jy4xg6xVkNos0DUD@nongnu.org
X-Gm-Message-State: AOJu0Ywe3CWKuSC9feqaagzNXSE/VKuLsjSLZ/R5H/BleB0YOaXfW40R
 l2DiLYWMQNd7fAHDA2n8sq+5/8F/7AkxL0fddZ/A05seiEc//ddtl+GXjK6mGenDG7c=
X-Gm-Gg: ASbGnctazy/3wa1EnkXFf6KdXkP0gbD5An/zXHyJb711XLaE0vhCu7X4VuWRdHLLXid
 X/mbaQu5fFSTD5SeOLnjMIh5aXSDfMUL30ICwqutOlz8TCVb7aP6g4rVpZbraewUpuCnk2KVyPw
 cwG4+DU3NEbqFaW9dsyfUr/JlmdcbwgVIG9D4z12X/FymCJcz5H2bQUTblosSCQp8EeU10gNcyM
 mRODeuglgLJ4hqMEIh3Uh1Ysb2CKKfpEzWpmzhqlRT+GW2gw+BozjyUHjPsU0Pu9uuSvlUHZEFt
 IN8mYVZdQHGSnXM8vgTMNauhX2wbskpii15mSbFvOpZbpmw8oVblhJZZtytgxxeSrVGGC8SQOKG
 5fs1ECChf8lDXeNtPZARc2Tjfh4Wce3025f/H1Y5m
X-Google-Smtp-Source: AGHT+IEYwQLXqyJ2ojex8oje4ka/V25DO3QQcq0DaGDHRYahPslLoNdskn7nBHOzVauqw6sC9swNYQ==
X-Received: by 2002:a05:6a20:3d11:b0:23d:58e9:347a with SMTP id
 adf61e73a8af0-23df906a3c7mr13762018637.26.1754348203792; 
 Mon, 04 Aug 2025 15:56:43 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd6aacad9sm10411500b3a.124.2025.08.04.15.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:56:43 -0700 (PDT)
Message-ID: <b7c6b929-ec99-4eb2-9f9b-c91632dd8ac3@linaro.org>
Date: Tue, 5 Aug 2025 08:56:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 03/11] hw/sd/sdbus: Provide buffer size to
 sdbus_do_command()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
 <20250804133406.17456-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804133406.17456-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/4/25 23:33, Philippe Mathieu-Daudé wrote:
> We provide to sdbus_do_command() a pointer to a buffer to be
> filled with a varying number of bytes. By not providing the
> buffer size, the callee can not check the buffer is big enough.
> Pass the buffer size as argument to follow good practices.
> 
> sdbus_do_command() doesn't return any error, only the size filled
> in the buffer. Convert the returned type to unsigned and remove
> the few unreachable lines in callers.
> 
> This allow to check for possible overflow in sd_do_command().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/sd/sd.h       | 23 +++++++++++++++++++++--
>   hw/sd/allwinner-sdhost.c |  7 ++-----
>   hw/sd/bcm2835_sdhost.c   |  7 ++-----
>   hw/sd/core.c             |  5 +++--
>   hw/sd/omap_mmc.c         |  5 +++--
>   hw/sd/pl181.c            |  6 ++----
>   hw/sd/sd.c               |  6 ++++--
>   hw/sd/sdhci.c            |  6 +++---
>   hw/sd/ssi-sd.c           | 12 +++++++-----
>   9 files changed, 47 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

