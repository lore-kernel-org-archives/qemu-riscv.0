Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C453ED6A221
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBeVj-0000o8-EO; Thu, 14 Nov 2024 13:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeVa-0000mB-Kc
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:23:58 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeVZ-0000KW-3e
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 13:23:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-72467c35ddeso866643b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731608635; x=1732213435; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pWrlQmqkGFoVZPKM2LGF3oDBVshqqzwKduuS1JkstNA=;
 b=OhK5lBhTK4SGohRKzXjvIbiUKjiABv2GQ7HDtvEl5tKmlHMd8X1OekWNg8DHOP89GH
 6dtrKA1Qf300VaKa5GPgG+ZfHwgi6nY7ZWYIXh5f8AKnlrj8GHDHCRqPTBNbHJemrj90
 5l7vUKAHAfGkEAsMNM6ZVy5EdtVXaToorOezXMHBgif36V0m/7lrngS+QvWQR3kLvdhP
 EZKWWL+aiOqx7/fVjFQNCFKF7OEV/9YkedWxb3MND0ZZ1+bl5ommW2AdVo/q0rkGS2Nn
 T27tmvsN8K9m3EJFgITPbFUn/874ZrMSFmspBnGPHcV+jITK71BzlEpsIs/QAC3kayDS
 zj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731608635; x=1732213435;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pWrlQmqkGFoVZPKM2LGF3oDBVshqqzwKduuS1JkstNA=;
 b=K5HyTHZKciiS23Hx636OMJlm2NAtkdKYRf+vLjHe66ciNkZnvomzLW6XRKhgqWVx09
 TuCsrTi69UjDHY2mhP6u92jMzguXt0orUfm597ZUuLzlqjEUod2Wd1cQm3LLwWzd+7k1
 9fbBWmZXhM6byRFgpm9t+KEOMTKztQ4InKXWmO6RGS7mSdx0xWgAiFvWr/GaHwJ0RVdQ
 g7QWfk3lHpqFXFRqayhC4Dm+E+fPk14mVPsO9xM/neQuRp6oP815yAPyE8R8tMfWw8iX
 aqSexE1VXyKqkRlvtfixIN3Ar5/eb5gX5ttVL6pWY9LS66fY8IEwgNuQX4RDQnmhXtvg
 T8RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvGlzE7QTuKcvQPNZycD2jt1zGIARU/ttdYJ+2RL1iE7rZ6zGDjEjh9qOfZmbrsWTEIZfzjB0r1ZHM@nongnu.org
X-Gm-Message-State: AOJu0YwDep9u0F5aST9w+sVgGALUwSZleB8L5GW4VxPb/+U4dAM3rql2
 j7Jmvn5GrIFhSYahaMHNhEF6fogBRCH/z9o3Vj91EjVJ5pxO6wHNfYMwEn2cAnU=
X-Google-Smtp-Source: AGHT+IFaM4tPkOHim3pBzQlGQstO9lIzVCJDZj4sa8QMuEUhTc9wH21LsRXyx0yzd4mGebp4quQW4Q==
X-Received: by 2002:a05:6a00:190c:b0:724:66cf:163f with SMTP id
 d2e1a72fcca58-72475f97125mr132951b3a.3.1731608635245; 
 Thu, 14 Nov 2024 10:23:55 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7246a6e716esm1550837b3a.59.2024.11.14.10.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:23:54 -0800 (PST)
Message-ID: <453e90d6-f8b8-436b-b3a0-45c11fd8e813@linaro.org>
Date: Thu, 14 Nov 2024 10:23:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] accel/tcg: Include missing
 'exec/translation-block.h' header
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
 <20241114011310.3615-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> TB compile flags are defined in "exec/translation-block.h".
> Include it in order to avoid when refactoring:
> 
>    accel/tcg/tcg-accel-ops.c:62:36: error: use of undeclared identifier 'CF_CLUSTER_SHIFT'
>       62 |     cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
>          |                                    ^
>    accel/tcg/tcg-accel-ops.c:64:26: error: use of undeclared identifier 'CF_PARALLEL'
>       64 |     cflags |= parallel ? CF_PARALLEL : 0;
>          |                          ^
>    accel/tcg/tcg-accel-ops.c:65:34: error: use of undeclared identifier 'CF_USE_ICOUNT'
>       65 |     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>          |                                  ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 3c19e68a79..22486c5dff 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -35,6 +35,7 @@
>   #include "exec/exec-all.h"
>   #include "exec/hwaddr.h"
>   #include "exec/tb-flush.h"
> +#include "exec/translation-block.h"
>   #include "gdbstub/enums.h"
>   
>   #include "hw/core/cpu.h"


