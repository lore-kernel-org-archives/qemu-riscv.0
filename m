Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7F8CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 16:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3zoG-00068H-HM; Wed, 01 Oct 2025 12:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3zo9-00065a-Gn
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:36:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3znz-0007IS-0u
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:36:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-78af9ebe337so94156b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759336545; x=1759941345; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yj1etB7dz6B2SrykECpHpVFrBoe/dfGwOm0Zu2It1m8=;
 b=GdRMxeF4DirErAoPG0Unu5ycSq9pHlU/sblSB3JYKZdoVmbSCi+4z0rYtALuciMLhB
 R1ZNLljMU+E/lGF8ZPgn5Enk0Ykng446wqP9dZOzha1Ef9JBqwcrDFiCui87qawLrriN
 jgFR1yTcpFngJFiNFX3nchkCd2pvj3/dnhDhhl8cQYDuoTFV6HFNxAK5jb7TtXimskmG
 odhkcf0vUkHVRcfFXfo27dBR/WarykYHz6u/cXcQ2jnx4Jqm9YDTmnwBrO2K1Q1mDjMN
 1hPsjcYVwx8mYrV2fnWj5c7pHw83VdU6AwlH/L84DfFBHQjXI49ynEm399DwH8u9bnRG
 PMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759336545; x=1759941345;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yj1etB7dz6B2SrykECpHpVFrBoe/dfGwOm0Zu2It1m8=;
 b=T/PYkUVKtZq+tkJ2BC3JdM3GYd2pT6jx4j9qve4bMk/lbP4/RFKj8f6w2m9qWKSlqw
 ioFSQLLfgA2i2MH+T5BrozytxVUB2DOgnVr7BOfm7633h+ynGyu4sA5JCh09ro2cqqX1
 xDIBn3K0r3ULhKAhk+v55QLo6C4LNb9FW9K3UyStnJzchpbXyOXTL8ZMlWEXJg3blR3k
 XCFfDxdOL1+0QEzH5re0qrDhq8GzrYiTADN8WFcx4+oMWNH5KgNqi6hFIsu0s9JUq7oz
 CVl6ltdtQ2wV+PRHPCKQvy6l/yvhsu0Ieo65udzR/eD+Mk0HGOSGhgJW7tEDYwuL6ic2
 Htyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXeKG3M99pb+LP0OfVsH7PGp3UxWsKB9uL7MaaR9LO01vdjwjRm0a60kY9m/Lu66iyCyD+t/SmdyCP@nongnu.org
X-Gm-Message-State: AOJu0Yxu0jYBkJQSTyuT7xwQuBM/1CARtFIo7tKRque3/kNQNwd7UJfA
 Bbhv3fRlQ0jCM96AKe9oGoOwY66cGGoJISXqfgO8NTBYC8WsMb3a7JwY6LJ4MgZmwYw=
X-Gm-Gg: ASbGncuwplUc1WBhr6PhybJr7et7UnK9k0dEJoWaiUUQn4P257EHq0cwkj/d5vO7XH1
 sduaCG2Xm2NBYjruxtA+FYLTb9Skz86oYz97MnRmyfbA9JAniIV3e0oMPy3RSVZus+VRXdbIais
 oqUNaglnA818fpLT9hrYyoD3ZvuQiN7NixJE4I26M6d01vZSNTIVHI8Eo+4NHn9g6+2ZaEFChA7
 2FjdGsIAYR0cud6nG9D5cOxjC1btj3ZrLwl0qztiHHRFXGYfhFllDafcoBziV1tkqaN8PyeXrSI
 P1Q5BoPVhXcvz0Dy85cOHfHFAWEClKzPLnnedwRhnPdpaU6nbs6Sm8SzdumVuI3deqXu3jxVDw1
 bFYMBx1qVP89WilkXegdi0z9Vl/g1i3YmA4vKf/mxSz2A4BnG9HpGigsNgbn29IP61+5M4geTNO
 x243rHgsUCg/mW930dsjaC5wLOjpPfVx8=
X-Google-Smtp-Source: AGHT+IF3EPkkHdN3dGaDsrKnobA5Ss2WAYPrZ1tSjTgLyD62juadCZr4IcGU0Nj7qL7nrey5zB8ggw==
X-Received: by 2002:a05:6a21:9210:b0:2cd:5403:ed9d with SMTP id
 adf61e73a8af0-321e3edc7bfmr5900224637.33.1759336544767; 
 Wed, 01 Oct 2025 09:35:44 -0700 (PDT)
Received: from ?IPV6:2607:fb91:1ec5:27b9:1bec:2e21:cc45:2345?
 ([2607:fb91:1ec5:27b9:1bec:2e21:cc45:2345])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099d4dec5sm1811a12.30.2025.10.01.09.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:35:43 -0700 (PDT)
Message-ID: <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
Date: Wed, 1 Oct 2025 09:35:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 10/1/25 09:08, Peter Maydell wrote:
> On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Instead of using the convenient @CPUState::as shortcut, use
>> cpu_get_address_space(asidx=0) to get the vCPU first address
>> space.
>>
>> The goal is to reduce the risk of AS mis-use for targets
>> that uses multiple ASes per vCPU.
> 
> I'm not sure I agree with this. The cpu->as is handy for
> the large number of targets which only use one AddressSpace:
> which is everything except arm and x86 right now.
> 
> Targets that use multiple address spaces need to be careful
> about which AS they use by definition. Unless we have a
> track record of code in those targets carelessly using
> cpu->as when it should do something else, I'm not sure
> that there's a benefit that makes it worth making the
> "use the one and only AS this CPU will ever have" more awkward.

I agree.

Moreover, '0' as a default is just as bad as cpu->as, because you're giving no thought to 
the selection.  Similarly using MEMATTRS_UNSPECIFIED.  When such things matter, we need 
the real attributes and/or as piped down from the proper memory reference.


r~

