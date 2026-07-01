Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F153DC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:45:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weuJF-00079t-2F; Wed, 01 Jul 2026 08:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weuJD-00079D-Ow
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:44:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weuJC-0005YV-5z
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:44:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-37fad5eca09so1225749a91.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782909892; x=1783514692; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2NqrJXIRHddtkDH7D79FJR/M5LoDmIZclrzAOMj5n94=;
 b=pXLMwVHEE9awss/j7gP7GmxGQmq5GVi2nYJaT8P7KaYb5bWSTzRXiv4WhSWhhLYOr7
 TvQXF3d0cclCp+xS1mn1O7knTRUsZNaP1TfxpTFV5J6lFGt3ygaIrGwy1vbtxvButTTN
 ZtMTzmcxA8aE8XFMr5zarte0IeOvdI6dMdqq6YAb/u0KwFtXpPJFpjFfZ8yr5ztS6q53
 yDC6ClU5HXfuHBjBn1cKklh9/C/pDxhlNxexHzz+pO8h+Z9FTG6sHg0Jtx8BJyYYDlDZ
 X4EQE2bDYpA+LcoB8X9YZqDWx4s8QybTi2iRFnYxxpww51bdlY7g+vp4z/8QVkVWhnFx
 ooSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782909892; x=1783514692;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NqrJXIRHddtkDH7D79FJR/M5LoDmIZclrzAOMj5n94=;
 b=Ou9Qd1g03fd5avZ+ekUFwJE2P4QqIrbaILykpp9ZaRmMOIQrkctBV9tZ6WyxpxMZqy
 JQvtfu2O4FPN3fTVwB3Z+dN1cON6Z6eowxlEBOcGX3cDKGnn5f/amZ4x1RCnv8kX8OIX
 vgyGmJ0aRf5H1wD5o/XTkt70OrCJqCsZMlopQVkj9ZhQA2nfS7ZdDRMHkzKfliLNxoTS
 /Kopg8Ixv+T2CTuS6rQS7Aexb9jb5Q2OwDalrgD3Z8fAG2s4YU9XRnXL6bL58DJt3tDA
 bVGXlb+GU3ctP5hJFihJN/DI1r1fHJMwpYMYTIJGdXWxVs/3v1KbDrCaE68E2PI3MqXO
 Llgw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqytl6vAqLVQx1BzzQlLqsAM0tzmbhRcBX1OPqKig9z78aA3NXAIQ5XZa2hiWGePzPP+H0wGYPUGclX@nongnu.org
X-Gm-Message-State: AOJu0YwlcXi+q0xlJFkyC4mXZEILyJ0Pioh7JJn8sUBBJonK4iEu4H37
 Iq19hjOEB7gi9NDWTbto58YkDcpRa7TVUaaiWR6OiZcA1cbYed8m5OtIl3h6FvhZ7BA=
X-Gm-Gg: AfdE7ckCOJaTU4Jp/8Gdk/zXQt5RVfwqIzhaiw7u6yTC274MkktWIphdHSyWXckDzNp
 wDAfyjIQi5iH+Z17s38NkID42gmDnn7T0iLGxnibrn8QIM5zkSj6YZUmVJwEqsgBMD3o620a6HS
 x+1dUGMyZtvlid5UWGfHJg9a94+Jmt2fPbQLzpKlHRI5Y1oDUf0ty0EhbL/NJ2rweQyN43JvSJp
 LrWUICaYqLPZN1GpQxrjmgfgl+VpBUIjKFOMVlsAiAFyp7hn4/Sh4IGhEjqyIuAoZAaMOsCqgSF
 v8ahaf7JKPiDBa80OHvQVvcJr9IfUI1JtnANV9Bs+5NkWper9g8RB0+w3JPk7oXJDM4tit7Fhu1
 o5QXiSnCoIPFT7MStRC0GqAHdFgbvcxh+MbSJAEzJ3yA7iqQ6aKe6qW8E77Tbv5jrxUzIMDCElq
 f9rVDN3r81g7OLvTV5+9Ie0Ugt1e5dwzdMLWDNO3oqpo/q8Hmu9b+tr9ePX0kAP0d69J+X
X-Received: by 2002:a17:90b:562c:b0:36b:769c:c037 with SMTP id
 98e67ed59e1d1-380aa0b53afmr1211764a91.5.1782909892341; 
 Wed, 01 Jul 2026 05:44:52 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38095e83b6csm1893033a91.8.2026.07.01.05.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 05:44:51 -0700 (PDT)
Message-ID: <3d06dbe0-9e1d-4862-8d6d-75d0085cd626@linaro.org>
Date: Wed, 1 Jul 2026 05:44:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] exec/breakpoint: Move BP declarations from
 hw/core/cpu.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-5-richard.henderson@linaro.org>
 <bf05f5e5-737d-44ca-8fd5-abd97c6513d4@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <bf05f5e5-737d-44ca-8fd5-abd97c6513d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 6/30/26 23:11, Philippe Mathieu-Daudé wrote:
> On 1/7/26 05:04, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/breakpoint.h | 21 +++++++++++++++++++++
>>   include/hw/core/cpu.h     | 21 ---------------------
>>   2 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
>> index 95f0482e6d..4013d9a07c 100644
>> --- a/include/exec/breakpoint.h
>> +++ b/include/exec/breakpoint.h
>> @@ -12,6 +12,20 @@
>>   #include "exec/vaddr.h"
>>   #include "exec/memattrs.h"
>> +/* Breakpoint/watchpoint flags */
>> +#define BP_MEM_READ           0x01
>> +#define BP_MEM_WRITE          0x02
>> +#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
>> +#define BP_STOP_BEFORE_ACCESS 0x04
>> +/* 0x08 currently unused */
>> +#define BP_GDB                0x10
>> +#define BP_CPU                0x20
>> +#define BP_ANY                (BP_GDB | BP_CPU)
>> +#define BP_HIT_SHIFT          6
>> +#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
>> +#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
>> +#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
> 
> See https://lore.kernel.org/qemu-devel/20260630220100.1289-18-philmd@oss.qualcomm.com/ ;)

I noticed your series just after I posted mine.  :-)
I'll have a look through and probably rebase on yours.


r~

