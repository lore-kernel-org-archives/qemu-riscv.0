Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FB1D68B31
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 15:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBbhT-0005si-FK; Thu, 14 Nov 2024 10:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBbhR-0005r7-3c
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 10:24:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBbhO-0001hL-Cs
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 10:24:00 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1ecbso1069081a12.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731597837; x=1732202637; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Psa2/rvf8Lbi+UL8r1q4T33qhcyAOZrvng/4IgPHqco=;
 b=L7Ng1oIYkKIJ6FCV+cocmg819VWxq0vj/nqxM4O2n8NSivTHqVkUmrByPjZXLDy+qg
 syWKPQJWwibMl/XQZd33F/88HBIiVMnvzj/P6k3fbKAT/3u+GCO1Bw0te+MUE7xbLfeU
 TlSDDE40ESrSDMoVxyhkfb21Ny525HTmmk+cteZif3vMv6y+LugCTeG7Jy0NanaiJ5W0
 L05bw2+ywf8pLCDQrMzzWKpE838vcSQ7EkFMCQV9iRmMSEs/jYJca+lGyhzLI2ty7+OK
 Q7CpdOwHX3AMpaVk/vso/es0A60PrTsb8OFq8AG/c31x8g9yb6RpObNakdUwuzABYFRt
 0vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731597837; x=1732202637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Psa2/rvf8Lbi+UL8r1q4T33qhcyAOZrvng/4IgPHqco=;
 b=XOa+5g/s5HWo3siIatR7m5+swEurxdC1agFuHZmq8SkY6hM3E8dPZxf2Opji/IjRCq
 sagztvsDbg6u4lk/FgalpODOkPw2NVdmP/tyfbhyue6qivkFrZpqIkltTQdu6p5ilMDS
 3e2KUFdiFBdHEl/QRVHPWfrkwzKhZi325TZVvoBpy69RD45yJXrmTfO68qtSVeAQsjsv
 FRBJtNDLXK5RM/SLJNpa/5EUN9mRhs9vQwkFOvJj/2zdfCJxIItds8b2j5jPrlt7b67H
 zRl2I/9ygVMbEy2pw2dT3n8F+6L0lBkz2Z2BFt+o4LouitGalMtH4rntLx0E6sCiYMYl
 vPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcP5Vu+r/AI4iMASy49ZtIUpdUgBTZc800gp5XzPykOiCzevWEWnwGA+bya13L3iy8naZDZ2vVnFs/@nongnu.org
X-Gm-Message-State: AOJu0Ywn/6V9Ai4nPtECuQYJPs2g/hXbQ1tXlMlTTJqOVX1kkSQshkRj
 /esu9bnxLQ+8uAIG9fiyHfU7yXXnHshEs8j5DKJP2SDvxJVBs7Z3+PHX0l+M0pY=
X-Google-Smtp-Source: AGHT+IFFKT+995jjict75ZuqspeB+Rm5nBD/Y9eqEryE1HRq0+Uwt5QGvTOl0uTxZY81UYqEzAsalg==
X-Received: by 2002:a05:6402:354f:b0:5cf:3d22:6dd9 with SMTP id
 4fb4d7f45d1cf-5cf3d226e2emr13033518a12.0.1731597836713; 
 Thu, 14 Nov 2024 07:23:56 -0800 (PST)
Received: from [192.168.69.126] ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b89d67sm660333a12.11.2024.11.14.07.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 07:23:56 -0800 (PST)
Message-ID: <50fac36d-86af-48ce-890a-033887da05e1@linaro.org>
Date: Thu, 14 Nov 2024 16:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-4-philmd@linaro.org>
 <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

On 14/11/24 04:10, Pierrick Bouvier wrote:
> On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
>> 'vaddr' is declared in "exec/vaddr.h".
>> Include it in order to avoid when refactoring:
>>
>>    include/exec/translation-block.h:56:5: error: unknown type name 
>> 'vaddr'
>>       56 |     vaddr pc;
>>          |     ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/translation-block.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/exec/translation-block.h 
>> b/include/exec/translation-block.h
>> index a6d1af6e9b..b99afb0077 100644
>> --- a/include/exec/translation-block.h
>> +++ b/include/exec/translation-block.h
>> @@ -9,6 +9,7 @@
>>   #include "qemu/thread.h"
>>   #include "exec/cpu-common.h"
>> +#include "exec/vaddr.h"
>>   #ifdef CONFIG_USER_ONLY
>>   #include "qemu/interval-tree.h"
>>   #endif
> 
> I'm a bit confused by commit message, but it seems that this series has 
> some commits that will not compile. Is that something acceptable?

Because commits must be bisect-able, that is not acceptable.

I took a lot of care to make this series builable on each step,
but might have missed something. Can you point me at the
configuration used and broken patch?

I'll reword the commit description as:

---
'vaddr' type is declared in "exec/vaddr.h".
"exec/translation-block.h" uses this type without including
the corresponding header. It works because this header is
indirectly included, but won't work when the other headers
are refactored:

   [error]

Explitly include "exec/vaddr.h" to avoid such problem in a
few commits.
---

Does it clarify?

> If it's ok,
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 


