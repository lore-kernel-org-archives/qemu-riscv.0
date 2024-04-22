Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE71C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rys6N-0000F1-1y; Mon, 22 Apr 2024 07:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rys6J-0000E3-B9
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 07:44:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rys6H-0002kY-LG
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 07:44:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41a77836f16so4088425e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713786284; x=1714391084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rQyqkO5rBtVr2l90561BkaV6H3PIbJfSNkwtRwVJ0Ek=;
 b=BiOoTKBBGAA0dbN7kTfIxXbc98yhsqt9xG8Hqc/Ou5wfwDPrq8ZDX7RyUJl6WdvSnq
 2Y7+mARoHwGrbaN+gfHDnGRtOMOxE3Mk7eu2cA3erXR4GZEZZZ627Mdte0Ai56sGTavR
 XvmqKE8IHJPXSq77oClGZ0CnAcjePR85nn30y51pJgn502fxMife83PeRP42GTrB8u3O
 4FZ24Fcuy1z+sMHPAApEJoEoPZ+Vpxmqv5RXRMoCirJaZV0BkvjInX6PQ6IbwuC+WbQj
 AcnTBw15rEG4YAIe1TwOSMWO0249ipsM6GbIfe/O2wQt1Iqlc/l6jtWob3J1PKi8pHTU
 U1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713786284; x=1714391084;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQyqkO5rBtVr2l90561BkaV6H3PIbJfSNkwtRwVJ0Ek=;
 b=aC1FMTSse6nmRPB+Ga6gOoOiMrnuy3ajzSIhOl7Ou1GApu2JlsQ/AiJWJoqcPD95e5
 VeNc9KKDmkn6tjKwB0lseqVm7APnSH2QDXQl4/RQ5jtmW+es9uLhVEuxEWYYy7j2hTWh
 BxqBbbPNMwnZ1jZFz73kQh6X3wtj61lEVsmtXsKmmYHPHHOLfbe06fprYwrOSDfaYidN
 H11FVIIMgO06GsvT9NMcNuZtYQzA35pmk37a9GqBrG+hBMt4iaKFf7B7RCxMpClSgWVd
 o+rXWR6Q8vVUlPSWrwKavt1/Dkm9izKoVtWzo/zZCgTpT0X7Pt1ar0i6THTqXxK5Ye0P
 SRsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUItBATgqlbAJHPQwqHZR2Pvq3Ic6j+OxP16caVBX2YU/93YqZH9vCZ5syhlMcAuPQ6E1VFZ8vDr7RtqNKGXiWNQ1w779Q=
X-Gm-Message-State: AOJu0YyQLTd1xOFIOzNiCumfF3nQlBPfB0hN6G5zRuNrokYK0tGCj0Zv
 BEgEnzwew6rrZYasKyDUxFEXkFJ3oZqMS3kS/y08JUWNRg5FariqNaEqhKVWRsg=
X-Google-Smtp-Source: AGHT+IGm2cDFOYgMIbZm0eI4/PNyMTOAT6fdJzXfqBLD2oHpxa+uqBaIn5ZRqy9rTLlKSXVvSErKTQ==
X-Received: by 2002:a05:6000:1b8f:b0:347:9bec:9ba3 with SMTP id
 r15-20020a0560001b8f00b003479bec9ba3mr7424132wru.66.1713786283963; 
 Mon, 22 Apr 2024 04:44:43 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000050c00b00349ac818326sm11855526wrf.43.2024.04.22.04.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 04:44:43 -0700 (PDT)
Message-ID: <a9a7f5d2-9fe1-4160-ac2e-b55f53945c22@linaro.org>
Date: Mon, 22 Apr 2024 13:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header
 in 'exec/log.h'
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-18-philmd@linaro.org>
 <76d68cab-7b28-43bf-89a6-bb39a7fdb131@linaro.org>
 <50a43668-4a21-4f3e-a306-133dd1d54594@linaro.org>
Content-Language: en-US
In-Reply-To: <50a43668-4a21-4f3e-a306-133dd1d54594@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 22/4/24 11:05, Philippe Mathieu-Daudé wrote:
> On 21/4/24 18:44, Richard Henderson wrote:
>> On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
>>> "exec/log.h" accesses the qemu_loglevel variable,
>>> which is declared in "qemu/log-for-trace.h".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/exec/log.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/exec/log.h b/include/exec/log.h
>>> index 4a7375a45f..e0ff778a10 100644
>>> --- a/include/exec/log.h
>>> +++ b/include/exec/log.h
>>> @@ -2,6 +2,7 @@
>>>   #define QEMU_EXEC_LOG_H
>>>   #include "qemu/log.h"
>>> +#include "qemu/log-for-trace.h"
>>>   #include "hw/core/cpu.h"
>>>   #include "disas/disas.h"
>>
>> I disagree: qemu/log.h is the main file; log-for-trace.h was split out 
>> for other usage. That shouldn't mean that log-for-trace.h needs to be 
>> spread around.
> 
> Good point, I haven't noticed we can just move the qemu_loglevel
> declaration.

Now I'm confused, I don't remember why I ended doing that, since
"exec/log.h" includes "qemu/log.h" itself including
"qemu/log-for-trace.h.

I now notice commit be0aa7ac89 ("log-for-trace.h: Split out
parts of log.h used by trace.h"):

     A persistent build problem we see is where a source file
     accidentally omits the #include of log.h. This slips through
     local developer testing because if you configure with the
     default (log) trace backend trace.h will pull in log.h for you.
     Compilation fails only if some other backend is selected.

     To make this error cause a compile failure regardless of
     the configured trace backend, split out the parts of log.h
     that trace.h requires into a new log-for-trace.h header.
     Since almost all manual uses of the log.h functions will
     use constants or functions which aren't in log-for-trace.h,
     this will let us catch missing #include "qemu/log.h" more
     consistently.

Let's drop this patch.

Thanks,

Phil.

