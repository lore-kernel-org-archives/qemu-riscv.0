Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B91C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 21:46:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qak39-0002V3-J4; Mon, 28 Aug 2023 17:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak38-0002TA-75
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 17:45:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak34-0007dy-2i
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 17:45:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fefe898f76so36252715e9.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693259124; x=1693863924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/h/vWdv5CmDOL9Cr4FGosR9u+cFVbfE1GllsGXlBpk4=;
 b=o2VpZ41XfhcHJoU58RphZIm6NHsd5gR6IAkvSmOgL+0B/SBbFJogZeMpPJXPLBQAvg
 oUbMYl50ma54Fp7bbsc0NaGqyjKMZxAJl0FWxIB/Emgauc61WFOVC/R+nA2SmmJlHx+r
 duzBi4LvUQUpidXnzhB/1JBPrVcJAiqxFXUbVdbtRJx1hf4DcUhDwURjIeyUnfmWyh1n
 nqpxEwdy0LtZv3YgbLf+GPO1U/D+eHxRtROEJgIgTYSFac1iZDsAGHjorw9akP/vklMM
 PSE/nJ5Gh0asqKs3qsBLv7XTgcKidWag6p4jowHLDHi1oa6sB80lJHdT3L7oX+lughPS
 SzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693259124; x=1693863924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/h/vWdv5CmDOL9Cr4FGosR9u+cFVbfE1GllsGXlBpk4=;
 b=H2F5bScROQrkV++1BHEXCcV2swHdeNCy8wF5FQja7Z6gKJ+QeITIXo/yJshy9ailEY
 VfyxnyoMwJ2YRSxVmF+6vzhZVwHPYwgj1ypxF+OHi3mGTULOwgg+TF+D20hmw/Ij9dNF
 tZozbwSQ2Ru3W/i8BBkPqka+vdEV6/C+dKkV0TkV/8llsOmKrnFvk+k5kR3dIylDcgLJ
 EdN/RMcoIMAd08CwrrDp5yjvoLUr4kIOk7NUqisr7P15Em7cApHXceqfYmjMpYMMQ8nC
 W/s34hEE3jF/7XlxFGm9CivfXQLH8FwNG5PLNB4daLKozotk4AuE8n79x4utvkF5/gXE
 4Sjg==
X-Gm-Message-State: AOJu0YyA2bVp2LcGuit4//Tu1U1YOBB/v9gouPd1EeDlI4n/36qoHbIp
 s/VpnwG5cf0+M9y8QjTnZbaeAA==
X-Google-Smtp-Source: AGHT+IE1yB9JgC9wIJ+VMTnmilcwsEE32cNGsCd/cij7M2J3X0P8jxfZDnmyEK/YSbYtpyS6ESm/kw==
X-Received: by 2002:a05:600c:21c5:b0:401:bd2e:49fc with SMTP id
 x5-20020a05600c21c500b00401bd2e49fcmr6102608wmj.24.1693259124064; 
 Mon, 28 Aug 2023 14:45:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c045000b003fee0741b8csm14982848wmb.23.2023.08.28.14.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 14:45:23 -0700 (PDT)
Message-ID: <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
Date: Mon, 28 Aug 2023 23:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
 <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 28/8/23 20:40, Richard Henderson wrote:
> On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
>> "qemu/main-loop.h" declares functions related to QEMU's
>> main loop mutex, which these files don't access. Remove
>> the unused "qemu/main-loop.h" header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/riscv/pmu.h                   | 2 --
>>   target/xtensa/mmu_helper.c           | 2 --
>>   target/xtensa/op_helper.c            | 2 --
> 
> At least these 3 files do two things.

I can compile these files adding '#error' in "qemu/main-loop.h".


