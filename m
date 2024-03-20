Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF4AC54E58
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 07:10:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmq5M-0005gw-Hb; Wed, 20 Mar 2024 03:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmq5J-0005ej-FE
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:10:01 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmq5E-0007CY-Gz
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:10:01 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso824709266b.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 00:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710918594; x=1711523394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TCCyf82sNabPMIvnlMd5F1b2YXxnDB1L4NUWQP6dko=;
 b=vWht2AmmWQWMTQMEWwEClP/BkrqueULLfmVba//3b7ws2MNW5kCaC/OdBfT5VMx5YT
 WrP7k0wE0ZEL/Dzt9p4CPDDtUrYMpJqqsLvmbLMfHFeet2zcT+FLJHPRcNdwBMcMcI6m
 IhG35nrJhW0iOY3tA8cTeyuLBY0m6cVgDFpizLmW1C5AD/lDaTBD0rgvQahTqF+5ziZL
 uMK+NgLPZuwryu1kLFuLqPbN7y/JwNP31X1gppVOaUg9LKPyHBNco0LiJ+px4Xk3qZn2
 dGCmoBQ9FJesR48Y5N8eoeX8gpBLYSGslnLy+1CapfBvYvaCfMyX3EZFKLjRPrnbL5HQ
 V5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710918594; x=1711523394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9TCCyf82sNabPMIvnlMd5F1b2YXxnDB1L4NUWQP6dko=;
 b=nf4l5Sn2daPl8DhO0zQfYbhu/6RP5ZcBUp3i/49F9lJEi2znApDWrd0+WeWzE+2L+b
 tsKW22fV7QwHWyC9CdmOwLNSYXr/ohSW72flGyJwYKhTcQvTvhWh8+6sbtxpkYq7+Lpf
 vmn2+PpLi0/qXQlrM0ZC/m8jsmkPctS5Zeb2UQ2eHrSqQrbsu+5toONxV/+34FZnC6YU
 cyVt2Cut7uZ6EuWFMAj0E82/E0TrpK3qjEF09FWay8Ov3Bj4evvCZ9DwMK2Ue9/mjyAW
 DB2tYU/Q9dxfZJ1SOoy4TjIGpZck/9dTL9jrHHkfD7IaFjrUY6+2OmPEfVJUNqD950lp
 2xlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFXI4IKN38CibX8w/Q7FefwR1pe0UWx+TY4H6HMir6lbM04tBVm7hgilUk+sn8hJNatbAuyE+OaFiJt7nsYlwQxJ3P1sI=
X-Gm-Message-State: AOJu0YyXhfpN03n/Wa/FINEJHmtzv4z6TSt0QOkJBD2hC6Emm8+2ZBUV
 2DWvZriXSVnupcDiUwi4aaFpK9RqQeGfJR6vMrIwRcG9wGn0Z856E4YTkyFxk1s=
X-Google-Smtp-Source: AGHT+IEZ8OeADGhblWESXWeot/oliX8QkMaGHBZeusHIm3CsJABODaLeLw17BytWxWqWVi4hVgXl4g==
X-Received: by 2002:a17:906:fcc6:b0:a46:2b87:9f38 with SMTP id
 qx6-20020a170906fcc600b00a462b879f38mr2718997ejb.29.1710918594489; 
 Wed, 20 Mar 2024 00:09:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.156.105])
 by smtp.gmail.com with ESMTPSA id
 st6-20020a170907c08600b00a46af639a77sm4151594ejc.172.2024.03.20.00.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:09:54 -0700 (PDT)
Message-ID: <c022abf3-0db9-4a17-9d53-f735368e6066@linaro.org>
Date: Wed, 20 Mar 2024 08:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 22/27] target/s390x: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-23-philmd@linaro.org>
 <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 19/3/24 22:05, Richard Henderson wrote:
> On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
>> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
>>
>> Note, now s390x_get_cpu_state() is restricted to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   target/s390x/cpu.h            | 30 ------------------------------
>>   target/s390x/s390x-internal.h |  2 ++
>>   target/s390x/cpu.c            |  1 +
>>   target/s390x/tcg/mem_helper.c |  2 +-
>>   target/s390x/tcg/translate.c  | 23 +++++++++++++++++++++++
>>   5 files changed, 27 insertions(+), 31 deletions(-)
> 
> Why is the function in translate.c, not cpu.c (with or without ifdefs)?

My understanding is target/foo/tcg/ is better for TCG-specific handlers,
less #ifdef'ry and stubs. Then bar_helper.c are meant for TCG helpers
(including "exec/helper-proto.h").

Can you think of a better file (new name?) in tcg/ or do you rather
keep it in the main cpu.c?

Thanks,

Phil.


