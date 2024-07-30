Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0795CC3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 13:33:22 +0000 (UTC)
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYmws-00048s-Ge; Tue, 30 Jul 2024 09:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sYmwW-00046U-VN
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2024 09:31:13 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sYmvd-0005Ov-4j
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2024 09:31:00 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-70b2421471aso2725158a12.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jul 2024 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1722346150; x=1722950950; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGba+10zNXuurM/lwFKrTYh3r5c9cCPnSmp5y0KbeF0=;
 b=OcxQJQbasRxXQFd4y2K4cdked8uGl1Pawem9FZIb00taXLB3FVOXHRwu26CMuRI9ET
 KtaxRqkzFcCeQQvQadYYIY2z9cEsJyIEGrfhDOV8P4AvZ6CsCDGOlTPQRdKJJPgZnMcw
 dzuSdrMdY96+nzahWPtrjhl+CBpViT9n6LG9k7UNKYENUxdszxGczu2oiJLfplzWROi6
 YuMitX4/0rjX58A9p7/dSKvF76WvbAw4NWHx6lT5VDwUGhM1bQSyPWKZ6QyejnI0tzMf
 k+CUi3VWpo6ElHBXgET1AKj8PgiM4c5S1aGRCcUK6zXNmp8dsCxV2FmMeOk4JjSGN1WN
 RPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722346150; x=1722950950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rGba+10zNXuurM/lwFKrTYh3r5c9cCPnSmp5y0KbeF0=;
 b=SEXcsZWcAajNmRC/WrVCnQaz0HjbGhWQgSqOvWA2dO763p3z2hp9q9BHogWf835O1J
 v5b0zLeEXOLBZPKQc/f6GB5HiN0goPo7HXs6+YNbLpvOYPUsNyH/Vr4puZo7FO2jfif3
 QoElk2PjA1PaD1lEwD1ZE16k3rhFA2DecUOV5YyOo5cpS/MGbgpS4W2ZDUA+0i7vmvGu
 YypnT79oaSE3LSNQu9/0te2WNxud6n/DFdKBicYga3wqZWhmKX8JcrvApMCQaGcapvDd
 AHzYy9BHU+x1OBjHv7ACvm0mHZEYt6X0et6EXwgtahppYqlrJkHw7/YjibvUb8w8YNur
 3jng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/P3Vc5gopSsHmThf/LZp1zCN9CRK/GcxSwh/DaCYJvWLLrz2ESf6A58Kgbg2rPxMjzX2czw/1o5mdszDFzoW9ZSHrPGo=
X-Gm-Message-State: AOJu0YxmSL1LjvKd58apJW2Z6oFYw1PvpJ5pi26ljsM2vPoiDsfQx2cZ
 TnSJ/LIKsGAfmNOqoQ9YMWkgt6eaAF0hhtyy2VQWutgw//8+N+V31UbuX3mbLL8=
X-Google-Smtp-Source: AGHT+IH2r0rX+h58NGoqrHj47Usvq4GZ8Xplz2ngRvXteAg4Kq9DnbUIqpm+1jNlpMX9TzP7akrR4A==
X-Received: by 2002:a05:6a20:7f94:b0:1c4:8da5:5825 with SMTP id
 adf61e73a8af0-1c4a0e05515mr10370529637.0.1722346149859; 
 Tue, 30 Jul 2024 06:29:09 -0700 (PDT)
Received: from [100.64.0.1] (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7d39489sm101615415ad.119.2024.07.30.06.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 06:29:09 -0700 (PDT)
Message-ID: <5b668c1b-24c9-4d54-80a5-cd92221b481c@sifive.com>
Date: Tue, 30 Jul 2024 21:29:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 5/5] target/riscv: Inline unit-stride ld/st and
 corresponding functions for performance
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240717133936.713642-1-max.chou@sifive.com>
 <20240717133936.713642-6-max.chou@sifive.com>
 <abdab05e-3001-4a6f-afdc-05fc997657ee@linaro.org>
Content-Language: en-US
In-Reply-To: <abdab05e-3001-4a6f-afdc-05fc997657ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-to:  Max Chou <max.chou@sifive.com>
From:  Max Chou via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2024/7/25 2:05 PM, Richard Henderson wrote:
> On 7/17/24 23:39, Max Chou wrote:
>> In the vector unit-stride load/store helper functions. the vext_ldst_us
>> & vext_ldst_whole functions corresponding most of the execution time.
>> Inline the functions can avoid the function call overhead to improve the
>> helper function performance.
>>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/vector_helper.c | 56 +++++++++++++++++++-----------------
>>   1 file changed, 30 insertions(+), 26 deletions(-)
>
> You'll want to mark vext_page_ldst_us similarly.
>
>
> r~
Yes, I'll mark vext_page_ldst_us at v6.
Thanks.

Max.

