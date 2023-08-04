Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C449C001DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 16:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRxUg-0002wa-3V; Fri, 04 Aug 2023 12:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRxUY-0002qV-UW
 for qemu-riscv@nongnu.org; Fri, 04 Aug 2023 12:17:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRxUW-0000am-Up
 for qemu-riscv@nongnu.org; Fri, 04 Aug 2023 12:17:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc02bd4eafso19439345ad.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Aug 2023 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691165847; x=1691770647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxsxIWL9p4iHkVCFJrHyZvhtiXH8QWfk2GDb+CFIr8E=;
 b=LF55YwOMVM9hgSUZQ2zx08oi4PDNSYBjeH0K2qVpDjMgRRNJ1f1Gb83TzFVItD+4ZN
 BWGx+97q4tTxC2oQZXlKvygCWjHxEVyFbr0OSR2IuBi8sj1rJ3xk9MDamkPoitw1unCF
 OPLeSYGMSR6lBZoeCE9n8MiSYBtI8Px8sy63nHZbL1sggFQpZ8GZcNpAkjoW9ZN2W1XM
 KMwaiafH1/KhCqVuUq7wOonsSDqUHLtyuW9PT0IutfmQNEzyEL0zLa24teWsCUXX8NxM
 7DS2CgG9NNQy01e0nK7X5LJ0kwLJxhdwmzBjqAMZwMTxdsgjA1eSfQev7OvWtszCJiRe
 ugAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691165847; x=1691770647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxsxIWL9p4iHkVCFJrHyZvhtiXH8QWfk2GDb+CFIr8E=;
 b=AW55MpA1M7GsyZLZKa2CuWQK6Bp8bjWa+RbKYvGg8ce4VH4LNH/w6Mh+DwMVaPmP5Z
 9WPQwYlHawXVrP6HI9VBNKHFezeKI0Tg1dxjWfD4Davb1LIGhgA/joZUPO+RVPhGQ5nn
 7sqXPP17rueiIfuWlktJ3Z2MoZQdKWCAiX7AcddOW7iipyiiHPweh59v5Ce8qWgBG0W6
 jCi96zIdlpIM68zAAF6er4ZUUZbnCi43f5L6ZUZlC5WRky935PhmlB7Bl4N+qDksGW+R
 AjrhUUHeoRfvAOrLrrgGi0fpGl49O44PpYW7Hr8oh+yMQOTyPDPik9dd32qfES926fnK
 5Mxg==
X-Gm-Message-State: AOJu0YwsM6yLLStTQhvf0A26HsqVUoRA6cc4VY1IWe/YKKOJe6SCTulN
 ABQ0qpAkRZ7oCyemuW8IMppxKg==
X-Google-Smtp-Source: AGHT+IHBhvl7M2aaUlCaImgpZjM+hfOyJqUbThAyNkIbo2xC1RiX4xnWKt6kWKlMPy1WBsdHuKW05g==
X-Received: by 2002:a17:902:f693:b0:1bb:7d2f:7c19 with SMTP id
 l19-20020a170902f69300b001bb7d2f7c19mr2596726plg.64.1691165847257; 
 Fri, 04 Aug 2023 09:17:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:1eed:f77f:f320:8b14?
 ([2602:47:d490:6901:1eed:f77f:f320:8b14])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902a9ca00b001b5656b0bf9sm1932550plr.286.2023.08.04.09.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 09:17:26 -0700 (PDT)
Message-ID: <2a0eec8f-0091-681d-7414-5939719ec090@linaro.org>
Date: Fri, 4 Aug 2023 09:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/elfload: Set V in ELF_HWCAP for RISC-V
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nathan Egge <negge@xiph.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230803131424.40744-1-negge@xiph.org>
 <cfb8653b-ddc8-b4a9-9792-73ef84ee925e@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cfb8653b-ddc8-b4a9-9792-73ef84ee925e@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 8/3/23 07:42, Daniel Henrique Barboza wrote:
> 
> 
> On 8/3/23 10:14, Nathan Egge wrote:
>> From: "Nathan Egge" <negge@xiph.org>
>>
>> Set V bit for hwcap if misa is set.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1793
>> Signed-off-by: Nathan Egge <negge@xiph.org>
>> ---
> 
> Tested with the example program described in the bug:
> 
> ===========
> #include <sys/auxv.h>
> #include <stdio.h>
> 
> #define ISA_V_HWCAP (1 << ('v' - 'a'))
> 
> void main() {
>    unsigned long hw_cap = getauxval(AT_HWCAP);
>    printf("RVV %s\n", hw_cap & ISA_V_HWCAP ? "detected" : "not found");
> }
> ===========
> 
> $ ./qemu-riscv64 -cpu rv64,vext_spec=v1.0,v=true,vlen=128 -B 0x100000 ./a.out
> RVV detected
> $ ./qemu-riscv64 -cpu rv64,vext_spec=v1.0,vlen=128 -B 0x100000 ./a.out
> RVV not found
> 
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> 
> Looks like 8.1 material to me. Thanks,

Queued to tcg-next.


r~

