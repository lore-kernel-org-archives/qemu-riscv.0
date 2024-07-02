Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE71C30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 19:59:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOjeN-0007R3-9X; Tue, 02 Jul 2024 15:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOjeL-0007Qg-Lh
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 15:58:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOjeJ-0008JE-Sj
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 15:58:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36532d177a0so2721949f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719950326; x=1720555126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HdfM3AJgLCAm/n1O+Ehmm95l9bagbbT1YMOamZ+0NSQ=;
 b=I2f+HFeXWey+mxLXIUy9I8v5twKRA3hzEzBw3rquOLYWiODdID7x1ZIk9Jvn4qkjBl
 OR5cAGbNWzfOHRcWy+c7BShtQpzQPYMNIPmoAmzMu1xATkipmt24TyxYScQluyWHAIzv
 YxVklYch/4ZBzhInVikLi9OwOC246JZ8dfyRrHlG94nMk/12Ja8qyYPVgfrTlLfHCgTM
 49ZLCrGmD9T7wtpKcdISC0MJBSc4NSEE9bIGu+pBa0ZpeeA0tvU6B3B+os3cJbcy+0aU
 25jOL3QT3jSewvCzxtCmVlN9t1jy1rULPKguioy4T9ANj9S5iK5cUICKNkut29sERkvN
 TX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719950326; x=1720555126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HdfM3AJgLCAm/n1O+Ehmm95l9bagbbT1YMOamZ+0NSQ=;
 b=fwuHxEq7fCjXnrEk8t+292XAsJuINy33jV9RYFgzUsA+hxzLD4ei5a/q2X/yDm124N
 OfiQthHvSKT1Ern+dtV7eVfnDmgIQG03ZLnYr9mA3fohx6C1letGGo/nFWTQYP8gJCt1
 LnhS7A25XBSO70ZyMhuz7BQIAohgeazf41PJRpAWtLl99fz4svCp88TTmzvnqvKjoJ34
 PQJcblx20zc5yqMEG+3b4lmo/uS4q4kb7VsOLiOE0aAQubGuMMK88K9ZJaHpy2lVR3GX
 A3K2isSjXbxDFYPCrDJhIGSaNQ5Xqf335krqJ8i9Uo3BifvChdzic9qwcbmHnXcyTaQl
 DigA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbvWNC/Hb02Ovgk5Xkm5F4vpsE2gs0PV3PIRk98J6uiBzzAdVowqg8B9ZV3Sg+rgYDnLAfbiczzeFK1raA6QY6ngLuFwM=
X-Gm-Message-State: AOJu0Yw5loKU3Aaa+gNiHAA4M0LuvdfjEdEh//tkkyKzC5uNKiAZQEz7
 bAPw1E9by9u7WDWIuZ8eVhw72eUlooQlYKVFspX4t7EXgfu/iupR1WKoc4KYIJk=
X-Google-Smtp-Source: AGHT+IGJpUTBcc0MKIXyR6J0VE89pXsDulSDB8+dvxKkDMOmJT5GeasJ3y3A2neSn/8ePUlLqTXtNQ==
X-Received: by 2002:adf:f5c4:0:b0:365:ebb6:35e4 with SMTP id
 ffacd0b85a97d-367756a836amr7137150f8f.23.1719950326127; 
 Tue, 02 Jul 2024 12:58:46 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.220.97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-425787f37casm76802355e9.1.2024.07.02.12.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:58:45 -0700 (PDT)
Message-ID: <b527cfe4-c982-46c5-bb9b-db368e6bb758@linaro.org>
Date: Tue, 2 Jul 2024 21:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] util/cpuinfo-riscv: Support OpenBSD signal frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
References: <20240627180350.128575-1-richard.henderson@linaro.org>
 <20240627180350.128575-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240627180350.128575-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 27/6/24 20:03, Richard Henderson wrote:
> Reported-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/cpuinfo-riscv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
> index 6b97100620..abf799794f 100644
> --- a/util/cpuinfo-riscv.c
> +++ b/util/cpuinfo-riscv.c
> @@ -13,7 +13,14 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
>   {
>       /* Skip the faulty instruction */
>       ucontext_t *uc = (ucontext_t *)data;
> +
> +#ifdef __linux__
>       uc->uc_mcontext.__gregs[REG_PC] += 4;
> +#elif defined(__OpenBSD__)
> +    uc->sc_sepc += 4;

To the best of my non-existent OpenBSD knowledge reviewing corresponding
https://github.com/openbsd/src/blob/master/sys/arch/riscv64/riscv64/sig_machdep.c,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +#else
> +# error Unsupported OS
> +#endif
>   
>       got_sigill = 1;
>   }


