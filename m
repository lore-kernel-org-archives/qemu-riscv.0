Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FDCC71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 21:46:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qak3y-0003Vy-G3; Mon, 28 Aug 2023 17:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak3w-0003NA-SX
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 17:46:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak3s-0007tY-Ub
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 17:46:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe32016bc8so32111475e9.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693259175; x=1693863975;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vev8ZAjyKG+2HXZWteSDR8WlT5SuJbNgd1ngCsTRYD4=;
 b=JqpWN9UYQhAJC9Uv5H57jhUDuxWGes70PgiRegZR6b0Ys5c28Xx99HoXNU44Gipxm0
 YnPG2Jx/8suFA3w+pX4qVOFQ1/0veqPdz+GCylALT6DqPJ/M8sxBup+n37rrLhKUUW2A
 bdBq9mNmuveuWQs5J3e6C537cOhxIZ/pS/uu7bwZYYwuVyGUV0ptdE9S0E4Pii+ZzTJF
 W/fTq6Gz0O3Wuq7BFjYWDWlJR+9f8ACS3DxIJoVVqfADif9z8u06TveU03L8TwF9Qfod
 fo9lwRe1erYCczy8JobZvtEm4Hq52gEZiKaaOlC8mgw+UaP95ks7imIVuI6f2BUfYs/L
 43rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693259175; x=1693863975;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vev8ZAjyKG+2HXZWteSDR8WlT5SuJbNgd1ngCsTRYD4=;
 b=UxrI30OXY00prvlha9Jnj25bKKblj9JxEYUYU2P80KcG5b/qFvx1dI8f3FbXoQtYMj
 T6rOKjgZmw7vXgaOOOXevGUc0moiAhrNri2JbsVJwH522KHcJssekv/C3abM6/QX7MGu
 lhshUICeb9zil1AUCIc3j1JtIirw3KJXKeDDNkcItug82c/PyOtwvGwdwNOtiH4R7Kyv
 w641KxRAqPpL44RblIlQh302kd2TL++ut9oFfUQwnuCFNthJ8NE1HAMWb04N4EMzlF2o
 B5nPhgo6JTzCK+Bq2fZumEmXat6pL6VZPCMLevJGb50FA07O58OT+rJGs6esrkAzTxgU
 qWfw==
X-Gm-Message-State: AOJu0Yw7PXi1uIjGbcVvk2zSLhsSZ6qXrpMt/EUnGjiVp4A+/0jx1t7u
 gH22jU0LJKpEf3s8xi2OTRq2bg==
X-Google-Smtp-Source: AGHT+IEc6dzpJAdiSq1mD+EQbPUWf7W1fZWzU5bVBHSH9Jvv1lwt7CC0g43IVBKQ+IOQxclEI+3VjA==
X-Received: by 2002:a1c:771a:0:b0:401:bdf9:c336 with SMTP id
 t26-20020a1c771a000000b00401bdf9c336mr6073273wmi.27.1693259175733; 
 Mon, 28 Aug 2023 14:46:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c379500b003ff3b964a9asm15207410wmr.39.2023.08.28.14.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 14:46:15 -0700 (PDT)
Message-ID: <f2116163-bf23-0ab1-fd05-5489d6c579ed@linaro.org>
Date: Mon, 28 Aug 2023 23:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
 <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
 <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
In-Reply-To: <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 28/8/23 23:45, Philippe Mathieu-Daudé wrote:
> On 28/8/23 20:40, Richard Henderson wrote:
>> On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
>>> "qemu/main-loop.h" declares functions related to QEMU's
>>> main loop mutex, which these files don't access. Remove
>>> the unused "qemu/main-loop.h" header.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/riscv/pmu.h                   | 2 --
>>>   target/xtensa/mmu_helper.c           | 2 --
>>>   target/xtensa/op_helper.c            | 2 --
>>
>> At least these 3 files do two things.
> 
> I can compile these files adding '#error' in "qemu/main-loop.h".

Doh now I got it, I also remove "exec/cpu_ldst.h". Probably
a failed rebase, sorry...


