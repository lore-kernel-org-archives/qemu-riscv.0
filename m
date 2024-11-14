Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD606D6A226
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:55:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBeyF-0007ut-E0; Thu, 14 Nov 2024 13:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeyE-0007u2-5T
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:53:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeyC-0007SQ-5a
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:53:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2118dfe6042so8313225ad.2
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 10:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731610411; x=1732215211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qWe8wdCJtJEE+3wcEIJF57D3KcM68wdsfhWCbx0SLkI=;
 b=RLgRYbuLrRViJtaHvPOhHaEwAdxEnCmba5ZfXB+adb8j01ZOU9HCa8NUHK3bvreInz
 aMeLFuDSuLFOT8Rvhk4qi9xrYIhNE4HtN69/5PLrZWsc17Nx24/X0pjsqa8Q5K7quoqk
 FydsG3BfigGtPEJH++rNgDewl5IQoT9G+PokKvlEzjoWd7FycesX/kjxhW07uWi1rjul
 MzMXcycxrrbtNcqvDbitmNTbiG3QmIIZ5yTDzCFxY0vIfBtC+h5Yr04k2AGIQB5EbpGO
 59HRd6vmbG+0eeUyhS+eEVtAw4ZKV6c8OjbvSXnhtCbiu8w9W9Xceqg3BALksaWmZh5t
 NQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731610411; x=1732215211;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qWe8wdCJtJEE+3wcEIJF57D3KcM68wdsfhWCbx0SLkI=;
 b=w4DE+l3vvCJ6Zipj8E0/I6GK05qoWJkVUd9i5E/8jq5wEZuGz8rgu7NvEpUUibyJ/E
 4AN4Bf5RanxFIZ6wz2+9LdkABZMEk3ldsUt3fbWOky+Hzj85qGNp7vi8k+xsJab0WTo2
 Jed4R5jbS/Kl2aTiVn85XRUtQ99GJ5tMYMc2e4Qv6yTFRdpnvihmUW5xjZ+6fKOJ+oeE
 g3O8Dsk95AcKywHIJ+xSxBBWw7zW4s787SST1iENFnjiWK6iE3H8gJjrTelqEkjD8SKa
 YG/Bhg3ziBMiQM0dilLS55W1nTM09ub8UvNravzW+LsWltK9R2qxFe1rY6j6CmDwZi8e
 O89Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4OHPq6REzTy/KJLm1cnPo4YrhTWd+aQYn4oyJb09+ScYgR6fH4uVrzvopjQ3w5lJGQCi5MCS0JxXS@nongnu.org
X-Gm-Message-State: AOJu0YzUEof6MqOX7UWwuHsCGFJsUMnBO7UIkyx2koBjA4H5XjKM6Kmy
 Nb8xZTaNQqjvXA+ulooeuKYgF0BQKpXydmVzD15U6NbEyuDDAMY/Cwq9Y2XeatE=
X-Google-Smtp-Source: AGHT+IFYc+lZ9JR/jOjaOqDgH8QC4Q2CAiEQjpD4OMPTEFNMRZB11/CpHkBA0H2vMWiq2CYxKNepQA==
X-Received: by 2002:a17:902:e802:b0:211:152:e1e6 with SMTP id
 d9443c01a7336-211aba03797mr159419865ad.48.1731610410876; 
 Thu, 14 Nov 2024 10:53:30 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7d219besm13909595ad.225.2024.11.14.10.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:53:30 -0800 (PST)
Message-ID: <a49b2d9b-e8d7-4409-a001-af81d722b536@linaro.org>
Date: Thu, 14 Nov 2024 10:53:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] system/watchpoint: Include missing 'exec/cpu-all.h'
 header
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
 <20241114011310.3615-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> TARGET_PAGE_MASK is defined in "exec/cpu-all.h".
> Include it in order to avoid when refactoring:
> 
>    system/watchpoint.c:52:24: error: use of undeclared identifier 'TARGET_PAGE_MASK'
>       52 |     in_page = -(addr | TARGET_PAGE_MASK);
>          |                        ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/watchpoint.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/system/watchpoint.c b/system/watchpoint.c
> index 2aa2a9ea63..f7366574a3 100644
> --- a/system/watchpoint.c
> +++ b/system/watchpoint.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/error-report.h"
>   #include "exec/exec-all.h"
> +#include "exec/cpu-all.h"

This uses TARGET_PAGE_MASK to choose between flushing one page or the entire tlb.  Better 
would be to use tlb_flush_range_by_mmuidx(..., ALL_MMUIDX_BITS) to flush exactly one or 
two pages.

That said, I've just noticed that tlb_flush_range_by_mmuidx does not properly handle 
addr+len that are not already page aligned.  That can be fixed fairly easily.


r~

