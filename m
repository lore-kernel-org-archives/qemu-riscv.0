Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E9C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:50:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Ywf-0006yv-5X; Tue, 06 Jun 2023 11:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ywd-0006yA-Ti
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:50:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6YwM-00035O-Tt
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:50:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6e1393f13so52790005e9.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686066585; x=1688658585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=flAQExrazbF5PEZnAPgAMS+V9HHW2JDhhuwpMF4zquM=;
 b=IW9UK1JIIv+hZFOMjiNXRiLcBJn6OxgyWUbBEekzbc2/cps6LZdh+uhlz4mx720WHR
 BTkyVR3FqGE2SQ1gZy1qlpenhf0Jb+eTx4sHzT9sBXDFldeXBRNk3nkiJM405oAgLkn0
 F6RlXeGuQtfOeBq81iLfEba7Bwr/kgQlrqz08PU0ZdJqi2maN6ZtrQGoM0lEhqrAe7GE
 kSfuora4EejtgTJvz7sSmzG//bxRhb/SKnU/nqnWXM4waKDTcraPziEGOlUq33CCeyvo
 YIDCipBpknQA0wHfQM4BuW3WmRaJ2/aATwPSzWAb8jReM7SQxvAiOsur2E7BP6tcyMNp
 ZPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066585; x=1688658585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=flAQExrazbF5PEZnAPgAMS+V9HHW2JDhhuwpMF4zquM=;
 b=hqS/ELO7cgvrSIepwV5xkTuilBA5KkhZDc03qvQavKwuQtP6hMQrwZqQx5tZ41NBI/
 iaE6JDe1kCz1gmsedNgg/X5Swloc7cEaSy0tJAmbwTPAFXiOyC9GgsPdDOrA0muJI3az
 Obfpk6c57QAOoMnzPcdIXhOOB18Fh/Ux/rcSB+dAaOXSCAGM6hJv8PndrWrq10QcOukW
 0VnypMd+pu2DjDWOGWMLwOs4CM2gpL14/aaoMLekVwaVEm3RuxTVZnrTplw0dDyJm3Hn
 +JEwpwA2YGfTchLC7iMmu4vC1ijmE7ZuRboFDP7qz9Ry6gieN4DU28r7d0i0jAafqFBn
 uL+A==
X-Gm-Message-State: AC+VfDz+agK0wqzfyNrVPtE1WNHZMv7JQWOIeukh/m3uRyO6OQW1j51b
 XTzp1oMh5nh8fp8lNaROvpKFdA==
X-Google-Smtp-Source: ACHHUZ7uc/3f6d21X1Kqf3spsC7tomJwHL/I3S4sGllEb1F374ab+1qltLYZ/HoWpTJWnn3Ioj95+A==
X-Received: by 2002:a05:600c:22d9:b0:3f4:23b9:eed2 with SMTP id
 25-20020a05600c22d900b003f423b9eed2mr2335574wmg.38.1686066585456; 
 Tue, 06 Jun 2023 08:49:45 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c365400b003f60a446fe5sm14532041wmq.29.2023.06.06.08.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 08:49:44 -0700 (PDT)
Message-ID: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
Date: Tue, 6 Jun 2023 17:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
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

On 6/6/23 16:37, Richard Henderson wrote:
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
>> Therefore rename the included templates as '.h.inc'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> FYI, after yesterday's tcg pr, we can do more than this.  These 
> fragments no longer have to be all included into one common helper.h. 
> Each translate-foo.c can include only the helper-foo.h.inc bits that 
> they need, and the bits need not be visible to the rest of the front end.

Don't we need foo fully converted to decodetree first? Otherwise
generic translate code can call foo helpers, so needs their prototype
declaration.

For example in translate-a64.c handle_msr_i(SVCR) calls
gen_helper_set_svcr() which is declared in helper-sme.h.

> It was something that I had in mind when splitting 
> include/exec/helper-gen.h, but the patch set was already large enough.
> 
> The renaming to .h.inc would have been the first step, anyway.
> 
> 
> r~


