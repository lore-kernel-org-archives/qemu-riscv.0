Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E2C369AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 21:02:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u83hl-00035z-Lp; Thu, 24 Apr 2025 17:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u83hc-00033l-J3
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 17:01:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u83hZ-0000U9-So
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 17:01:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-736bfa487c3so1220881b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745528503; x=1746133303; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mC5mET4uLYjhDaXp53Ol0DTEjz0Yxq8K22g6MPL+v6g=;
 b=qIlb+HWBNzyG+5Hwm7tLU2wKyBcfqA01BOTlBcllLHJKgydrnNWaVnKGCVPgZ6g4hB
 t/RRXjut1rZM5YB2Vx/CUeFIbN/2Uzyu8ZPXbiqmU5tcxgXjRt9Q4xbXnSzVAu3kYTEa
 rfzr4FfFC/Tbl90fXgLpAaHbzOlLJEj6lplDbkwMQGFAlxjU92Vq9U3xqkyaIqfwk6jh
 W58HllfuEySf1SGP8naTigPSONDxjYCLy/TxxxJKGLmv8xoPm8SU56un3GIOepw2Txng
 SdJPahB1ImKUhx7JCAxsIA8q2U08ZBPYWZk8NuNEWNeDn1Qcl/JdC//DR6HGpfiGcAsU
 uuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745528503; x=1746133303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mC5mET4uLYjhDaXp53Ol0DTEjz0Yxq8K22g6MPL+v6g=;
 b=ENJnXHcw+XaisaFPTb1pHiE0LSCCvT3bnTyU8Qi2Ru7t53fBSQIDA99BXxU8cCy0KX
 rafPH6tCqy0k7VJ4dxB0dkBd25us3wfHv96BTOjTT+jfiPcivy4rdwp/MPtxAdFpvUnn
 liWnJJio4R8zLB9N9yzteuOvGtb76bHABwkkB4Pd7lrXITNxGs//D2kHilAQOaUUjIqD
 0rHpkdEKgAfbaPPs9JXhiYvD8fKYZDmJT1WG7adhMGU4+HUAFGOaexNoW5Ydgoygm0aJ
 1nn+9V/wlfsMhB5uqAAbay1Ox7k69y1JO6eGmeGIyPSEpXe2i2p9t0lMONEIilBefGvj
 cHxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/4y49EiNtE4nh+9z0bV5QVnHlePII26mZtzk/4P/n3w8kmY9rapLp90UfHbZgHIs8/x9Yvdk0nTf6@nongnu.org
X-Gm-Message-State: AOJu0YyFRLG2qRCD0RkE3uoIFx5Txev+uEib9JVdOTz/DNOWZQ78SMxE
 /bhrWYwNGSkSCKslwN8CWRsOwky3pNNlcGurcwADmtRSna++i8qcJXA6gceRbHtnQc9lCitfMW8
 /
X-Gm-Gg: ASbGncvxqNnet3ix3cwniDVPTQfdArQe9m0V6QMN00OJSD6IRpocExb1i2bboPeas5E
 W2ZNJ925Dsk6HMGWZarU/bGZFHreLRFbD6CxHcbQeh/pLbO5vgwjoqefedV9k96zZPW74/YPkZP
 U55O0DlQKI7kdtPen0ikqwtHPCtzgWW7H0Axu7pUKALc4Qj0vDMUt4VqSAD2HOZ+W1F5eENhXhz
 QKC+5eERdcP2YMc57MInBljYriK8KAwyzzRFio04Ibb+e4Y0h6KXjmiAWRAMonritRrfeKg4LxQ
 NgzOMb5GQICSGRvfgpqEtH6Rl+SDJVQ7Kk1zYbiqRKsGeMwjt4D5zKbAyxykN6P+Lypq+D830gU
 ggagaKmFZ/ddeWSudeQ==
X-Google-Smtp-Source: AGHT+IGopFHwevDxSGC4cCmhyW0nJkiVmSwGZC/6S6tJDm25uSa2zjwaB9ZQbNnxVEy6KxiJ2VpZSA==
X-Received: by 2002:a05:6a00:2e9d:b0:736:ab1e:b1ab with SMTP id
 d2e1a72fcca58-73e32d6571amr1591296b3a.0.1745528503598; 
 Thu, 24 Apr 2025 14:01:43 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25964e38sm1879371b3a.75.2025.04.24.14.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 14:01:43 -0700 (PDT)
Message-ID: <431dce61-4cdb-4bf6-98f8-d2ac714a1ab6@linaro.org>
Date: Thu, 24 Apr 2025 14:01:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] target/riscv: Include missing
 'accel/tcg/getpc.h' in csr.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv <qemu-riscv@nongnu.org>
References: <20250424094653.35932-1-philmd@linaro.org>
 <20250424094653.35932-8-philmd@linaro.org>
 <9f71ab55-523e-4720-aa1b-2b3271038df5@nutanix.com>
 <ebd88b93-3752-4e18-b5c0-78e3b4a4b8e2@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ebd88b93-3752-4e18-b5c0-78e3b4a4b8e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 4/24/25 13:13, Philippe Mathieu-Daudé wrote:
> On 24/4/25 12:14, Mark Cave-Ayland wrote:
>> On 24/04/2025 10:46, Philippe Mathieu-Daudé wrote:
>>
>>> "accel/tcg/getpc.h" is pulled in indirectly. Include it
>>> explicitly to avoid when refactoring unrelated headers:
>>>
>>>    target/riscv/csr.c:2117:25: error: call to undeclared function 'GETPC' [-Wimplicit- 
>>> function-declaration]
>>>     2117 |     if ((val & RVC) && (GETPC() & ~3) != 0) {
>>>          |                         ^
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/riscv/csr.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index c52c87faaea..13086438552 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -28,6 +28,7 @@
>>>   #include "exec/cputlb.h"
>>>   #include "exec/tb-flush.h"
>>>   #include "exec/icount.h"
>>> +#include "accel/tcg/getpc.h"
>>>   #include "qemu/guest-random.h"
>>>   #include "qapi/error.h"
>>>   #include <stdbool.h>
>>
>> I'm mildly curious as to why the target needs to include accel/tcg/ getpc.h directly as 
>> it's almost a requirement for TCG
> 
> Indeed. There is a TODO around, added upon introduction in
> commit f18637cd611 ("RISC-V: Add misa runtime write support"):
> 
> 2113     /*
> 2114      * Suppress 'C' if next instruction is not aligned
> 2115      * TODO: this should check next_pc
> 2116      */
> 2117     if ((val & RVC) && (GETPC() & ~3) != 0) {
> 2118         val &= ~RVC;
> 2119     }

Yes, I've sent mail about this bug at least twice.

r~

