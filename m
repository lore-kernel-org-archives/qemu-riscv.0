Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D8BC54E67
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 02:21:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rn83P-0001rZ-VQ; Wed, 20 Mar 2024 22:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rn83O-0001r0-PV
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 22:21:14 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rn839-0002b8-FD
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 22:21:14 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e6ca2ac094so569087b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710987657; x=1711592457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7oMOvImn/q2QnsEoKEH9BRQSY8LnCLAmhNBL1UMRvwk=;
 b=f2da8609bqrOKiVpIjXDIhY1no2Do7/WqFo6OpVvnYTIHH64l9b6gsr+wvLxDeMCS5
 YUP3LvJo0dOTXibJxhKbwqbwk6LvL7mQ0KGtCjYd9lNT8t4+zkpwDLWfxvxfOPj0wcVA
 u8gisPETiWu19lTmfUNYNWAmHYQ0jCWyV0DferPjyhoqrPQJLUadIpeL02fdh6bzbl/l
 nhrUO/0iYoBkjLdUVrDP5pPmyz0E8Y0XFkvZImeBIBIHxgg8hxIzDg6jIf6yb8rKFzu4
 sVqCxp72mKtotkDRKwwwaANhw6XIKhm1dLMQNA11zypGBiQCwTFIAG59jS/MsF0MI+Qg
 Rc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710987657; x=1711592457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oMOvImn/q2QnsEoKEH9BRQSY8LnCLAmhNBL1UMRvwk=;
 b=LKePs8OVzhiP67zBwxMP72EHywX6xQogH/vTlT9I4WagNLlIqhQnABTNOiR0It3JGK
 qmDT63nFvnlyRYg/7Mu96qrKy4XRgFDmF2k4ZSQ3JU8liXLZ7L1QKcRWVltpr4q9C5Zw
 +WsRuwSkXq8uPuGIhbrjJ123AS8WzeWHlHT2ap3bXDLz2E8fOtjLfod4hSHRXw812E2f
 jrhFGLawv8y+HJSUcuEta5k4EODeMA2IT8ELB2CiKBlWSLrexgigU+uQ/Xi1VUGJ1sXL
 AMYGWHVwaExiDKngdbXX1Evhq5cOxBcCMKnvWL0SLrxxezQfdpbJyr6NbQF5Itdr1Y9P
 W+Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUOYHgCw1cjOoWSZOUY+3PX3bJUsHX8Wl4K/mY/ll8cVIHbmDbI+FrvkQJRlbop6OahzTINFpgXxp4LE7wuMnxqxrXH5k=
X-Gm-Message-State: AOJu0Yx1LzRO8nYYIaHMf7YFYA4gWQ/8gzt6XErKGTzbYx/9mOn5MId/
 S0g0geW7mtU71enYa+i2HtNbII+sZe6UzvEYzvB3xWk5sKuuB3bvcbTLPYPCwpM=
X-Google-Smtp-Source: AGHT+IHI+DLgBR8Iqd4BDAg+ofVljn6BUzcHKIegouyQ78hXOJBX73cguAegoYN7G2+BKEBY6zf0wA==
X-Received: by 2002:a05:6a00:1702:b0:6e7:117:c5d5 with SMTP id
 h2-20020a056a00170200b006e70117c5d5mr7789207pfc.23.1710987656889; 
 Wed, 20 Mar 2024 19:20:56 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 q20-20020a62ae14000000b006e6c38cbe96sm12372727pff.29.2024.03.20.19.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 19:20:56 -0700 (PDT)
Message-ID: <ea557fdd-e133-4347-83dd-3f88d8ab04b2@linaro.org>
Date: Wed, 20 Mar 2024 16:20:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 22/27] target/s390x: Convert to
 TCGCPUOps::get_cpu_state()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-23-philmd@linaro.org>
 <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
 <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 3/19/24 21:09, Philippe Mathieu-Daudé wrote:
> On 19/3/24 22:05, Richard Henderson wrote:
>> On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
>>> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
>>>
>>> Note, now s390x_get_cpu_state() is restricted to TCG.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>>> ---
>>>   target/s390x/cpu.h            | 30 ------------------------------
>>>   target/s390x/s390x-internal.h |  2 ++
>>>   target/s390x/cpu.c            |  1 +
>>>   target/s390x/tcg/mem_helper.c |  2 +-
>>>   target/s390x/tcg/translate.c  | 23 +++++++++++++++++++++++
>>>   5 files changed, 27 insertions(+), 31 deletions(-)
>>
>> Why is the function in translate.c, not cpu.c (with or without ifdefs)?
> 
> My understanding is target/foo/tcg/ is better for TCG-specific handlers,
> less #ifdef'ry and stubs. Then bar_helper.c are meant for TCG helpers
> (including "exec/helper-proto.h").
> 
> Can you think of a better file (new name?) in tcg/ or do you rather
> keep it in the main cpu.c?

Given that all other targets to this point used cpu.c, I would prefer s390x and sparc to 
not be the only exceptions.


r~


