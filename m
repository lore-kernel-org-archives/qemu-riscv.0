Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E36AC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weuHs-0006Xn-Gm; Wed, 01 Jul 2026 08:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weuHo-0006XC-2d
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:43:28 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weuHm-0005Fh-DN
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:43:27 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c88973b6965so837869a12.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782909804; x=1783514604; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOk36/Pf9YoV1BiPunZKH3kZOtdRTLv5FsdcrsSswpI=;
 b=ji8AKeWiK0H+0VVBhonMfSXyNfUGKBLKf1O6Fmlg/63YZmDJQYp3QbyW/1knvV+gN9
 fVYtKAVtN6cnWmO95DXx3dE287+kfPizyHrX7U5OmePkd+Nvf2oO4Q6ioYyneafTFgYe
 9ezurFeuneyBM+0EQ5BYygr2QPLV+Np8CLub0cas5ls64sGns5fNMCtdiY9UEQ/rWT+d
 ZvW8AO5m7k2DDpHUZoSBKE/bdol5fmGeK78mB7iV7R+5rXoMXR7aTzsfMdjsJrnVugIK
 o+79dws820AgXUrEEo/VXpL5iD0F4RaFw1/NBx47AS2Pf677q4ARulqutj841zpet4oA
 ru3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782909804; x=1783514604;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOk36/Pf9YoV1BiPunZKH3kZOtdRTLv5FsdcrsSswpI=;
 b=RORyA0G0LG6nNHPenb/5jwUmgownu0DUlFcQWuG5EcB/ymEEmUTGizd4RDYSD6JKNY
 QCY21GJJ2ov1MNJ0PDfEI4fXd8Rq5pf88vWrRgqtpLWYpyr4zYQ1L9cQFs9dEUd+OuCk
 f/6sDLhNt+PJ3YfR1KbKytax+lyru8xAAN6yygLwgwyVRt323lDsbfg/xj492P0b74b7
 vXuuTX+ktyxb5Mj5zMGIKH3puQPu8XqzFpSUMkuCPxfupU2ytdCOJ8ybuaFXl6WVDTIK
 pP4t5FZliZjzod95zUuj/OT41OjT2WvWqVWqjvhPmel5mOCGFNrV2Hdv78Lu8pBM4A1c
 zaQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ88mGc/EQFqS2aOcHRocHzJVTgMu5N3XtjYGPmLvCfCUBAgE3N60AY/HDzxtOXc8ymwE87T5jqslwQI@nongnu.org
X-Gm-Message-State: AOJu0YwK5f3QaUY9dopc+SaGzPPD6DnivZ3tRL4iuo8ikWVdH7LHaIXZ
 FnnVhVHp1A9GswZm7b3CQPrMMW7EwJLOCjwVW7oq1dw3GKGiRApkp0tvBkxaN+izhuU=
X-Gm-Gg: AfdE7clA5xVqtAjlNCyYy/o+zCe9NQ2QspLK9eCNugWSx23zAG+uBmjT1PTz2eLv5C7
 1/7EF77ucR5cQBYuU2Hylzex1VP+tpXNBHrnhYl7k5yEnS25N9cYJV8RleTG5wAe8gxLYbsWbUu
 /LJljzGneBaa7zmmUk9nhZ1gSOotwEJdg9cREOfjKLzxHhXsUI2DsiTrzNc6xaSnc1KGBF45Da/
 ZcAlVrWcT6SO3TEuYGq6l5FlYWJ7II1hIsU9WSEo+oX5nLJLElJkTD1vtIpRCLSKSjZ6EIObP4g
 tZNH9WNyg7tJn7DkGtNo5ZofZIuk0Y45fPrVotTTpYdg5yz2p0Dq06vn0ac7sHci6al9M3tHnKf
 qnSCWWHBmYpYGMgbiAqfr8TgmXp+w115A/LRrIV1v/TtqmfgBeFSG+Ah8ZdD6c1djApRncoU5IE
 u0G4TRURujY4vOanoOz7/S6EokjdWjpgdQHwGSBl5avFL0jCbpQdTJwL5VWg==
X-Received: by 2002:a05:6a20:7283:b0:3bf:651d:fee0 with SMTP id
 adf61e73a8af0-3bfeca33e96mr1338942637.19.1782909803929; 
 Wed, 01 Jul 2026 05:43:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bc001d5f4sm3245764a12.23.2026.07.01.05.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 05:43:23 -0700 (PDT)
Message-ID: <9633c308-d799-48fa-8255-3fcd81bfd08b@linaro.org>
Date: Wed, 1 Jul 2026 05:43:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] exec/breakpoint: Introduce BP_CPU_ID_SHIFT
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-9-richard.henderson@linaro.org>
 <a5d3aa14-4b74-4e0a-a514-a8dc23890813@oss.qualcomm.com>
 <6d52bca8-c748-4b27-a46d-a9de9dc2b782@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <6d52bca8-c748-4b27-a46d-a9de9dc2b782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 6/30/26 23:19, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 1/7/26 08:10, Philippe Mathieu-DaudÃ© wrote:
>> On 1/7/26 05:04, Richard Henderson wrote:
>>> Allow the target to store an identifier with
>>> breakpoints and watchpoints.  Change "flags" to
>>> use uint32_t instead of "int".
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/exec/breakpoint.h | 10 ++++++----
>>>   cpu-common.c              |  4 ++--
>>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
>>> index fc91343875..93876f3304 100644
>>> --- a/include/exec/breakpoint.h
>>> +++ b/include/exec/breakpoint.h
>>> @@ -25,10 +25,12 @@
>>>   #define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
>>>   #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
>>>   #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
>>> +/* Bits [31:16] are reserved as an identifier for BP_CPU. */
>>> +#define BP_CPU_ID_SHIFT       16
> 
> While I understand the benefits of storing the ID in the structure,
> I'm not keen in having it packed with the BP flags, it hinders the
> code logic. Since there is no point in optimizing this, lets simply
> add an index field. And convert the API introducing _by_index()
> helpers. I suppose you plan to remove cpu_breakpoint_remove_by_ref()
> at the end.

At first I thought packing the id into the flags would work well with 
cpu_breakpoint_remove, and it's "bp->flags == flags" test.  But it seems all backends use 
cpu_breakpoint_remove_by_ref and that continues to be easier to use.

So I might just add an index parameter to the "insert" functions and leave it at that, not 
bothering with any "_by_index" api.


r~

