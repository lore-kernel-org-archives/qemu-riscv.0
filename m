Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C1C04FF8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:13:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rvKSn-0001w8-TQ; Fri, 12 Apr 2024 13:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvKSm-0001vr-Aq
 for qemu-riscv@nongnu.org; Fri, 12 Apr 2024 13:13:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rvKSY-00005a-PL
 for qemu-riscv@nongnu.org; Fri, 12 Apr 2024 13:13:20 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a51f9ad7684so66528166b.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Apr 2024 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712941985; x=1713546785; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7VsbUUaibF5nfYRC96Q8mZf5uNpcuRgBvGBgtYAlVx4=;
 b=vkS4N9W6j0KKQktL4yhHkFkQ2/odz0194ljfkH+uqx3W0GeASw874iy1ZH7qJAYmRa
 tpS2TOvVqFYlXslmYaWI8LrjyBqQf1Rz1U0Cl/XgDGtpmcBkmQq1VHGW3uNLCZAcIPkZ
 g8P1tC0WE4NcTfp9H1N71yHnOXp+N2gnzVhTK2T3+hcuwxi9JUmMQ1J5Ar79U0vCUe/W
 WsS/NYWrs77W6Ugh+5nwHqIA1HYV6A/ge7UkIyRnUsS8y3Yw40U9uD5FhaxuKFrBXC7B
 3EfYppShZK4TiyDyp6oV5b/NbiWbwe/sIys1N7KbyM/jI9228Gy2bh29R8Im6cpH/NB8
 go9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712941985; x=1713546785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7VsbUUaibF5nfYRC96Q8mZf5uNpcuRgBvGBgtYAlVx4=;
 b=nOVI7dO8NiXPo/6HRwJkDUtCC2EgwE/r0s9u/xky8l9ucE9DXMykfb3hV5yz+aHUxZ
 nZT5LikJPU3gLq+vsP7HuOq6pUpOecuhJqPAqmCb6jgb2CVjkMVB+EF4QN6eKGa3C//j
 aF0qhtk99HEl2NYyhY7QX/91LfmsxX/wC3+G9dA5zRmHyrKfSLFQKPy3PhstfIKh7Lw/
 ytpC4qgyTT5cE+VGqlkUIRAUrbndvScfpzrlJd2awmTyg84KNoySlayqnt3WNgNswiHb
 h8slD4WKDYPfOdUg4WUOBQN0ONUNQF5Z35AHsNvcJoeRODXpxzu99+7QuemzZmIcsRtt
 kBNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqCvvGb73hLtTKn7WqMUylg0SfR80DOjdjYqSdFntkwDvOIAKttQlmuBFiEOlj1XRZoN05RCplaQewgYfUeGbuv2HVzzU=
X-Gm-Message-State: AOJu0Yyh1qalmR7qBSbeXuxrbOfiT8F+IQ2Sg9NXQXlPaf9g01hkHzQl
 6jbOs2fyy/gPR1vJCqmSdjhgSaW4k5WrusthFNC8SUf4zyEXkAEzujBpxB72nKx9SpmV9OGoJmX
 O7gMbQPR+7I6GQam4dOrkIHsObNmLtS3WPIxnkg==
X-Google-Smtp-Source: AGHT+IHZCNWdN6Mzv9f7IfIc8gR8581Xs1fV8MENQjmVj/yriEpzOQgHhn31D28ScGGkth/G9Pr5UiTNywz/+TwhMmA=
X-Received: by 2002:a50:d516:0:b0:568:d7fe:a768 with SMTP id
 u22-20020a50d516000000b00568d7fea768mr3003053edi.25.1712941985028; Fri, 12
 Apr 2024 10:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240409175241.1297072-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240409175241.1297072-1-dbarboza@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2024 18:12:53 +0100
Message-ID: <CAFEAcA-XkK8ksZ7aMj-ap4BRw6V8dMJ6hGTozagGAAQfXz_=bg@mail.gmail.com>
Subject: Re: [PATCH for-9.0] target/riscv: prioritize pmp errors in
 raise_mmu_exception()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, alexei.filippov@syntacore.com, 
 richard.henderson@linaro.org, Joseph Chan <jchan@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 9 Apr 2024 at 18:53, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> raise_mmu_exception(), as is today, is prioritizing guest page faults by
> checking first if virt_enabled && !first_stage, and then considering the
> regular inst/load/store faults.
>
> There's no mention in the spec about guest page fault being a higher
> priority that PMP faults. In fact, privileged spec section 3.7.1 says:
>
> "Attempting to fetch an instruction from a PMP region that does not have
> execute permissions raises an instruction access-fault exception.
> Attempting to execute a load or load-reserved instruction which accesses
> a physical address within a PMP region without read permissions raises a
> load access-fault exception. Attempting to execute a store,
> store-conditional, or AMO instruction which accesses a physical address
> within a PMP region without write permissions raises a store
> access-fault exception."
>
> So, in fact, we're doing it wrong - PMP faults should always be thrown,
> regardless of also being a first or second stage fault.
>
> The way riscv_cpu_tlb_fill() and get_physical_address() work is
> adequate: a TRANSLATE_PMP_FAIL error is immediately reported and
> reflected in the 'pmp_violation' flag. What we need is to change
> raise_mmu_exception() to prioritize it.
>
> Reported-by: Joseph Chan <jchan@ventanamicro.com>
> Fixes: 82d53adfbb ("target/riscv/cpu_helper.c: Invalid exception on MMU translation stage")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

I guess from the Fixes: git commit hash that this isn't a regression
since 8.2 ? That would make it too late for 9.0 at this point in
the release cycle.

thanks
-- PMM

