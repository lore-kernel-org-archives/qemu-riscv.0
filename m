Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41D9C021A9
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 17:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tk4ml-0004Y5-NO; Mon, 17 Feb 2025 12:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tk4mj-0004Xf-Jp
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 12:19:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tk4mg-0005y1-Ot
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 12:19:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso27549405e9.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739812793; x=1740417593; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
 b=eZfvsUQKEpXzgTj0DY1EO8O9uezBz06lPX/xgObUKoC/Hm9j7aEs3yS/tGFRRIPpVp
 9RW37ZFR6/h6DbnedlXx36hvrFYWPL8I43J8f3T0wZ2ctxqkxFekEohaKZHfyHi7r5QT
 vBDZXS7dPbUgHdySBnd3WlxUb03Jw3fV7L1kdYBKpdWSO6gY8httYpXmxSpCml2BRkmi
 JHy8g+APTUikhMBFIqFmWwbJLqrq22MuBKOiyI9uPqVyHXtzbLcIwgC8lQzvloOrXapI
 MvySQD9Kgv5fMHnNzBe0w7UUzCk8VPUnJdpu0RKAFwjbyjpridTsHQ2uus+/pWlby/Yo
 pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739812793; x=1740417593;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
 b=idzBF9/ZsIELHFM5DpFfJD56A+F0ukXH2Zt4yCu5qezshqkoKxa/OC2Uad77X0Zxjo
 PRNCPcyANB9GUV4fdQJar6Wm8Lp7vNRfLfTQBLG34922fpA6Cu8op6MTjAYfIQylXOB0
 H3oi7dTAZhO+w7S4B9IseRHuZ3ncyzCYecQrdNo/RUenaR+tB54H94MW08AFj7fJoMao
 scvi4VTfTAXwRV+Pj7M12Q01xXIp238ZI4zLsW2XG6o4AfL4g8Lf0fTI8kWrNoTfsZbC
 cNKeJCBuzXkVNvmDzxxa7bj4VVwSWXleKuZ1XjUDjXVfxWbAp5e3N1bjleogIEhO9UUp
 JqHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqCqL3cA3qJ1k12VheItG2ZLf4u18OYOVOOWNuZja4auJoAsNyqaVigcEG5VxOAOPdaSM68B1vQC2I@nongnu.org
X-Gm-Message-State: AOJu0YwKEwoZSXI9dMUJbo420hyqt+EvU3pZhmMg1PE/SRTSPio8y0/6
 u0pfePBpkcIm69yyuUsfhwFFn169vqEOnpQPDWb3NgHy700Z2r7juMWn7+VaLb8=
X-Gm-Gg: ASbGnctobyJWp7l0dDk70CwA/Iclfu8/AJoA7DKDrGRyrd+RpHH4yturmqGib9kuyUH
 uHk1iUQZ2JmqWL+6mUIQdiIACX909Gsdt/7DoenqPhnOnctL0x3eXWFKdF3Ovi8lQ80lNJGBjBx
 rDbTlXGR5sU+zsvypl2FEybCHTOgzvcfo8wBeAb06FTDQkR1JUvfrAz3YsrHlHTMAx9LBuU9Kji
 YzU5r7Jf1BOOHgk9PpLrE/4oMLdBQWMjovGs1kymtv9lD6ABOmoUfGCPWqLPUkgWCdQi0fEczit
 P0ZmC3A9orLyMhPzHc+UlHXYDggCTQ==
X-Google-Smtp-Source: AGHT+IEgo1pk8uQGUSG6ebpaxNPekQ6qVjpVo6fgVMW/kIFnegEFZYxMbxaDbrxa4QtPRDs+dN9QbQ==
X-Received: by 2002:a05:600c:3396:b0:439:8439:de7e with SMTP id
 5b1f17b1804b1-4398439dfdamr42175065e9.15.1739812792683; 
 Mon, 17 Feb 2025 09:19:52 -0800 (PST)
Received: from [192.168.1.121] ([176.167.144.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b83a3sm157295295e9.33.2025.02.17.09.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 09:19:51 -0800 (PST)
Message-ID: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Date: Mon, 17 Feb 2025 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 26/1/25 22:16, Richard Henderson wrote:
> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>> ("Use a dedicated function to request exit from execution
>> loop"), tlb_flush() and tb_flush() are related to TCG
>> accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/cpu-target.c b/cpu-target.c
>> index a2999e7c3c0..c05ef1ff096 100644
>> --- a/cpu-target.c
>> +++ b/cpu-target.c
>> @@ -45,22 +45,27 @@
>>   #ifndef CONFIG_USER_ONLY
>>   static int cpu_common_post_load(void *opaque, int version_id)
>>   {
>> -    CPUState *cpu = opaque;
>> +#ifdef CONFIG_TCG
>> +    if (tcg_enabled()) {
> 
> Why do you need both ifdef and tcg_enabled()?  I would have thought just 
> tcg_enabled().
> 
> Are there declarations that are (unnecessarily?) protected?

No, you are right, tcg_enabled() is sufficient, I don't remember why
I added the #ifdef.

Could I include your R-b tag without the #ifdef lines?

