Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDDD6A221
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBeOE-00061j-1P; Thu, 14 Nov 2024 13:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNy-0005xh-FU
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:16:14 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNv-0005s6-Mq
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:16:06 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20cb47387ceso11278495ad.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731608161; x=1732212961; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ACMR1qiUo/4HcWQZO5iGj6k58pq6unrdeYkdFr4YBo=;
 b=iJkHbE3Dd0Xk5b7XYMxrQGj05DtYVedQfdiw2aZdAT7h0CBXvnc2iOOtn4rx5W7Pum
 ho/26tC51eAysTKDuTsjso5bxUx5KH+XfAlgrh3dgsJZ4Hkxkvyi1tp+YY1neu52NBly
 MwLqYkvqiAuCQlx6Yi5vZgigTiq8PF1McuAgTQ5Et3C9Q/jOEYIfLzyKiUGUZcvzvxb0
 HtDEXo6JIhQXGByZCGPzpyHXjcv68Ir+vC6Xxh54a0h5aqUXpK1Bany/KBs7a0ArKMP8
 JwI7j4b0pAxWrUMIxuYiR8lqYBFqffpLkWLcEL7eXXROYrps05BDWPdtog5VThCPINAJ
 Rd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731608161; x=1732212961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ACMR1qiUo/4HcWQZO5iGj6k58pq6unrdeYkdFr4YBo=;
 b=QW4i1zegetlKAMczLV1ixYko2ZSDmTbUTZnGIIWiOjP3qZrNLMGx6y7wnx0DTZLkSd
 +lOLTpriEKeSfqFFKWoplzVccH3be0GkokROJrQ5hbJCs5LV6iGgPMoBHv4i4Y4R/Ee6
 wS5YdHmjYw2pEeExNT66tcgxtCGbn+r/9TAV+F2mQlhmVqOa8xGXlehqfE8TrNKiLI43
 uDA0IcjbQjogJPZ2mJPG9ftntkiVisJ4PBWtquGAEharsATEquN9WW2x6eKVlgAyG8pJ
 f4GblxLnRsmMQGTXNALu7ic7HIg3ZJP8A5gXfPo9uK9A7vtkYe/YQQI7cjUbmxsWbvOP
 xdvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqxs2Mpjv0bQQ22ObyFdPgFt0Mq+IoQ3qRX8zyKIG2zDJEnMKg2cGabYhDhkWej2W+NJIAJ+WT6yr@nongnu.org
X-Gm-Message-State: AOJu0YxU/B2hImLAybN2scOCdd5rSbo8qA+P3HF826iH9drCVqQVaxRd
 P5UIgpIiq1BSiAZkgUzwuUWEIhVB6itLwLOwXAO09yJXqCveBUXH56kv2/KTWjY=
X-Google-Smtp-Source: AGHT+IF+ggcxp3rh9wNoo052zDeH7w6GxlluT21C7pavh3vkVdeiVUOPxkyZ1/BYaMJouBhbykXDRw==
X-Received: by 2002:a17:903:11c9:b0:20c:cccd:17a3 with SMTP id
 d9443c01a7336-2118359c11amr339957125ad.46.1731608160825; 
 Thu, 14 Nov 2024 10:16:00 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7d04f06sm13604465ad.185.2024.11.14.10.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:16:00 -0800 (PST)
Message-ID: <a0520e19-6519-4375-8dfc-dfe69f9661fa@linaro.org>
Date: Thu, 14 Nov 2024 10:15:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> 'vaddr' is declared in "exec/vaddr.h".
> Include it in order to avoid when refactoring:
> 
>    include/exec/translation-block.h:56:5: error: unknown type name 'vaddr'
>       56 |     vaddr pc;
>          |     ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   include/exec/translation-block.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
> index a6d1af6e9b..b99afb0077 100644
> --- a/include/exec/translation-block.h
> +++ b/include/exec/translation-block.h
> @@ -9,6 +9,7 @@
>   
>   #include "qemu/thread.h"
>   #include "exec/cpu-common.h"
> +#include "exec/vaddr.h"
>   #ifdef CONFIG_USER_ONLY
>   #include "qemu/interval-tree.h"
>   #endif


