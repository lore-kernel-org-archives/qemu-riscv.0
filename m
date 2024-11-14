Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F00D6A228
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:59:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBf48-0002U1-ED; Thu, 14 Nov 2024 13:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBf3u-0001P3-TN
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:59:27 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBf3r-0000t5-VY
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:59:26 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7f12ba78072so802264a12.2
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 10:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731610762; x=1732215562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=URIf27BMDWz/zZ/r2hCSZpn4yj54Db/MC3Z3NDMOMzo=;
 b=gafzol5jCLNuh5VsAHGKUxfBMpBRFC1DoPVOARv+Gk3h5PGCx9gd99aEGnemPnuUTt
 XcW+AQEiYy64tBV7It0/WUHVWpY4+tdmvqEup97h2qtCuFDUcfhzNDMBuLRWTaD7voBJ
 zZDzraVYLy0YG1r0CWGdZNnoFK9SF5I27L5GmLqhaRiH8iiFXhVUz6we4Vtbn/4EifXQ
 ccqYh31pHo5/jHu4j9BvSgaMtW3YYxwix9Hoeqqycr09ZEk1iOWbYhfWZygqGdlduzsu
 qu28AZbKijz75nRZlEmXcy716lgr5T5/DK/fRSvrsP7J8Jvt3a5GIX+ZTZ+kr54Udy2S
 Vx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731610762; x=1732215562;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=URIf27BMDWz/zZ/r2hCSZpn4yj54Db/MC3Z3NDMOMzo=;
 b=bJMSJW6I4yettkygphOh9IqrKOg7JqCOKBIxfsLrZzhzMF3WwJM4mRAXv+ygaSSZ03
 A6mrYzqHVe3ToquvHwMu4LbTHo7NtQnb7EEBjKPMcpJLpk7DXjires/EbNI7/DEBhk4w
 PgZ+HPEtmfy/8T+LecIS3JqCZTUE2TWz2jeJy2QZxt+h0ozXxrT4FeQ7RHgnZQWO12Re
 op8sKxhHZJTBDo+3ot3i2xYVbVEmBmKnTM57tisZ5UzNGpYJbRUQGFd2MrPfH4xFolYM
 +4HfDWb9aH+GrSbrZUrYBAnu7EWFvHvpzS4YtvCy6ypvTMBb2cPy3L9nNpcd+17e5S8e
 Zt/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf8aScK+HABBlSMqN9Ztw/84nnupnd1xsKjRMIKDgsLAuj+HV+LYhh9b/wwWUVVXPI3Ns66tz2f5nA@nongnu.org
X-Gm-Message-State: AOJu0YyRVwUSORDHxopyAxCy8+tKfI+9NykhOW9n1QZAeooEZxrMZ3d0
 3jk5kx62AU2TQCPT1OT9E9zd2nG6p/U1E6cQ9VkfF8geXGjqbmcGW544C2aawvE=
X-Google-Smtp-Source: AGHT+IGw4aiMg4SBCO50N4PjhLOiaZtixPRJtiTqAdcZnNeXjDwiLkCbsQ6JXSp4cgZfdwGsfMO1Cg==
X-Received: by 2002:a05:6a20:8421:b0:1d9:c6e8:60fc with SMTP id
 adf61e73a8af0-1dc228931b2mr36495412637.6.1731610762399; 
 Thu, 14 Nov 2024 10:59:22 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f8b37f8640sm1423538a12.49.2024.11.14.10.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:59:22 -0800 (PST)
Message-ID: <3de882ce-a6cf-476b-94e4-210b2dd6173c@linaro.org>
Date: Thu, 14 Nov 2024 10:59:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] linux-user/aarch64/mte: Include missing
 'user/abitypes.h' header
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
 <20241114011310.3615-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
> abi_long type is defined in "user/abitypes.h".
> Include it in order to avoid when refactoring:
> 
>    linux-user/aarch64/mte_user_helper.h:30:42: error: unknown type name ‘abi_long’; did you mean ‘u_long’?
>       30 | void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
>          |                                          ^~~~~~~~
>          |                                          u_long
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/aarch64/mte_user_helper.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
> index 8685e5175a..0c53abda22 100644
> --- a/linux-user/aarch64/mte_user_helper.h
> +++ b/linux-user/aarch64/mte_user_helper.h
> @@ -9,6 +9,8 @@
>   #ifndef AARCH64_MTE_USER_HELPER_H
>   #define AARCH64_MTE USER_HELPER_H
>   
> +#include "user/abitypes.h"
> +
>   #ifndef PR_MTE_TCF_SHIFT
>   # define PR_MTE_TCF_SHIFT       1
>   # define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)

Or maybe just switch to uint64_t.
This is aarch64, so it's always going to be 64 bits.
This is private between the prctl syscall and gdbstub.

r~

