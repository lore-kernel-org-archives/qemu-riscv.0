Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670BDC5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 21:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxWSV-0007xs-71; Fri, 21 Aug 2026 17:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxWST-0007xC-C2
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 17:07:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxWSR-0001er-Qy
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 17:07:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso19342375ad.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787346442; x=1787951242; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZUiSq8PsvavJBFzHfD6KJmOqkADBjSEXe9SnRzZnEAk=;
 b=GjURinTsNm9XjZTxYOGy9+HIk+rKAZsqLmMk1xJ9cLJx2rrFoH9dK4khmMTnj5bXSU
 X1heyxJseRBSD/ehfzZKOHpA7dCmoFYnx3tlLUALnIcyNxPWAvym31NwOvcSQmvQiegR
 FgCm2fYX9dLnRnOWo3Mb2JWCasfouGxKxSd/Zp5XcYMW3uTvihCfYmlK7GEGTY9Q5pNz
 jTBwoQUM2fbGN7JiOJMbNUjjExt1FJpdQ8Z9Qj0kjmzAWqGApr7ZvT7HFu7T+N+XYUg3
 yfIBWHifDIvNvgGELI+KWg+pkVXFyv6ydYcyjC4vkgJ0fAuhgHzFM9SUPKJUO9G5ZN+9
 oemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787346442; x=1787951242;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZUiSq8PsvavJBFzHfD6KJmOqkADBjSEXe9SnRzZnEAk=;
 b=JsOLtYgEWJGWb5g88igiEzRZBd2udiJ0KN+UkyPvP2Z923TOSg+gmn2SROHuXH1dSD
 7M04fMDHkx0Nt5/ha4Mid02xBcW07K7V5rCHQQuwX9mltPX1gx7YWlU82RPyVlOnhnL5
 stQoRhxaPkRz5AiOxDUHPfnnncWnpgwup1MsH84a9BqYtIl4vaUJrq7M1Nd+TwojZ/W+
 VEFgP5Gr+oRu6J1JtJQ8nB25Nr1KYLRIIXSEG6y1w9uWiw79Nd21p7CJc9QRu+8fKHzT
 Zpiiyzkv7GToBoBifM8ghpKsfWrFG/7yaTKNXZWyB0k/6i611a084E/jvZ/Gmv8jMnYK
 LdjA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpmxeyAv7yDEqBIl9mVOILe/9c25FrHy16k14pkelJigNj7VBN/dVA84Oqe6hsJg+Abm367HbIzpYaR@nongnu.org
X-Gm-Message-State: AFuF++mfhkYM8CEuYo5BgIdF/JKijJzyqf4elPzSCk9tsZ6pXFlIyluY
 1L+yQRsJfnldjz5raVAqKgtQgw4UU/AQnzqqstzYIGX3zvzJ7uxRHfC6kI+j6rCH9K8=
X-Gm-Gg: AR+sD13vUhm7xWsS93fA8tDdTWyPqk/8ZNtg/RseHNQSEU5BiaE8IdHZA/r9MXOF/TD
 slldlvHwEwMCA38gx3K53g2R5vksyz182I62nXlduStitwsjcxcB7XHyNWbOg2T3o5G3yfHGBv1
 CKMFDWPoHhTANk4/qmG521JKmLqG3H1nU4Jw+BlqgkjA6h0rsYOhc9mRUrb6szv1dVeE18YHmiz
 wHWuv2IoI6tXkxHSllfxnurdU0a+Jjlth+mwTr7r8//iBJs/91levhUyuLUa++F73ByYcirFb/5
 EMUf89zvbdyFXOSuEvK9dgi6ZA8JCZ44rZOXVIIljuvE4EyZxt/bjtUqhm8fuRDaQHkxdNL6af0
 q0rLk+xpkfYWr91qF6H/xoIO1WfU+n9eIzzZGb7mCPSUEXyMEU++JkUknjTIa+oXgD9Oxz5ecUD
 PrV5tv1ju3cGa2ObE3XV6bXqWZ+lSsxoUFIVIIrv6wvitTrDw5QAk69I8FGnMYbLHlk9LnRayE7
 1ibB7Z5I6zXTW6YDQs4WuX81iwasmVE3w40TwXbfKUIPd+9aQ==
X-Received: by 2002:a17:90b:54d0:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-395c353ee4amr18153913a91.6.1787346442074; 
 Fri, 21 Aug 2026 14:07:22 -0700 (PDT)
Received: from ?IPV6:2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7?
 ([2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395e494fa73sm199595a91.4.2026.08.21.14.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 14:07:21 -0700 (PDT)
Message-ID: <180ce662-a0e8-4b03-9a7b-1b6d4feab0b2@linaro.org>
Date: Fri, 21 Aug 2026 14:07:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/18] accel/tcg: Replace size with first/last in
 TCGCPUOps.tlb_fill*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-13-richard.henderson@linaro.org>
 <26a073f0-9e8e-40c1-97dc-6b420740e20a@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <26a073f0-9e8e-40c1-97dc-6b420740e20a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 8/16/26 08:17, Philippe Mathieu-Daudé wrote:
>> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
>> index 0ddd898e6e..bfcd9b6159 100644
>> --- a/target/hexagon/cpu.c
>> +++ b/target/hexagon/cpu.c
>> @@ -666,11 +666,13 @@ static const char *access_type_names[] = { "MMU_DATA_LOAD ", 
>> "MMU_DATA_STORE",
>>   static const char *mmu_idx_names[] = { "MMU_USER_IDX", "MMU_GUEST_IDX",
>>                                          "MMU_KERNEL_IDX" };
>> -static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
>> -                             MMUAccessType access_type, int mmu_idx, bool probe,
>> -                             uintptr_t retaddr)
>> +static bool hexagon_tlb_fill(CPUState *cs, vaddr address,
>> +                             vaddr first, vaddr last,
>> +                             MMUAccessType access_type, int mmu_idx,
>> +                             bool probe, uintptr_t retaddr)
>>   {
>>       CPUHexagonState *env = cpu_env(cs);
>> +    int size = last - address + 1;
> 
> Nitpicking, since we know last >= first, could we use size_t instead?
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Certainly I won't change the type in this patch.

It's only used by logging/tracing, so I don't really care, but you may, after the fact.


r~

