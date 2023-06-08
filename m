Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98432C7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 06:46:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q79Pt-0003fn-Kg; Thu, 08 Jun 2023 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q79Ps-0003ej-0q
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:46:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q79Pm-0000M3-FL
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:46:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9a8so961905e9.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686206793; x=1688798793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnytSjdXEwD0xYUukrBZjKGarXw16mKWSy/mwd6jIVk=;
 b=rfAoNvJZPcN8GLNrKlFfjjv8DxcbxoY/7rhX0JnTKG/9NF2T2IlCLKxPe4VJqFpoxz
 B3YmkdmUvHYKZBm6leDquGuwDhCVceaDrEqN8Z03J7PcUxbLJR9+LDitc3w2If874NSy
 VpF3GKUFJ7f+liOIRGGXE+djs1KO1s/VbTXaW8y3XNdlHKVCJzac/Ge5gL6I2gBVWPvm
 zecBSlcq82Xjf/9C101HcgWJOljQEbotZoBDvrf0aly8Rh5L6et13oc0z8Iddkef+WuD
 h1xYbFXRGAOjOl3HnFxvhuKT4x3CNWjZUb5dv8dVU2I7M1fC0aq8SekJyxi6GiI5QNjV
 tb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686206793; x=1688798793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnytSjdXEwD0xYUukrBZjKGarXw16mKWSy/mwd6jIVk=;
 b=DOhUPCdMlrihV8hC0o00wizUJIspOfN/uFz1ZUILwgSC+J+VDg54dqiPA9VU0ay3Qy
 FH1nDJXLY9P649qIZpbTEyMkZnCpfqccQyNgvkJ4jm5IDoWqGewLeM44m3MfGKzgLU1e
 IdxwhqiCk9t+Q+iS8c7p27mqqZvx3IE7bxpwiPI4R43cO6WFWA1vO+6z3A5b1Wh1E2Zk
 8N4vovjfGXisoFZeCA0qnTFUBBy9CX9e/4MR2tIbSOIrndhnRdjYls1a4zrxNcGe3eJz
 YhxttSJ9E/ERzK9nDbNJV4Uu34R7uGMLhYtLolefgziXWznQFK/8okI55+W9R/Fc7JcE
 1NWw==
X-Gm-Message-State: AC+VfDx2LQFPpIdDCOo72oUMHyie25U5BD5ZUpwYkTNyeVNzpLaD9hoy
 LRDOzEItYPYZqLZ/0yanj5bOQQ==
X-Google-Smtp-Source: ACHHUZ7mjzUou6SS8vgFXhYqNE7IzesbIXrepvQ1uu6LxAdWD06p3cMvMdKrMCM24hfUQKamPhIcQA==
X-Received: by 2002:a7b:ca48:0:b0:3f6:2ce:caa8 with SMTP id
 m8-20020a7bca48000000b003f602cecaa8mr475099wml.29.1686206792756; 
 Wed, 07 Jun 2023 23:46:32 -0700 (PDT)
Received: from [192.168.191.175] (81.171.88.92.rev.sfr.net. [92.88.171.81])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adfe0c9000000b0030af15d7e41sm577371wri.4.2023.06.07.23.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 23:46:32 -0700 (PDT)
Message-ID: <10d141a3-5745-b458-69e0-a452a9e87b95@linaro.org>
Date: Thu, 8 Jun 2023 08:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 4/5] target: Rename per-target 'helper.h' -> 'helper.h.inc'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-5-philmd@linaro.org>
 <cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/6/23 16:43, Richard Henderson wrote:
> On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
>> Since commit 139c1837db ("meson: rename included C source files
>> to .c.inc"), QEMU standard procedure for included C files is to
>> use *.c.inc.
>>
>> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
>> about includes") this is documented as the Coding Style:
>>
>>    If you do use template header files they should be named with
>>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>>    being included for expansion.
>>
>> Therefore rename the included 'helper.h' as 'helper.h.inc' for
>> all targets (updating the documentation).
>>
>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
> 
> A bulk patch like this isn't ideal.
Unfortunately these headers (declaring HELPER_H path) are used
by all targets:

  include/exec/helper-gen.h
  include/exec/helper-proto.h

So this has to be bulk.

> Targets that have a tcg/ subdir 
> should have helper.h.inc moved into there.

OK.

> At the end, 
> include/exec/helper-gen.h and include/exec/helper-proto.h become unused 
> and go away.

Ah, you are suggesting to first inline these helpers in each target,
then move. Hmm OK I'll try.

