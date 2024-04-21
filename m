Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C40C4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 17:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryaYs-00084E-Gl; Sun, 21 Apr 2024 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaYm-0007v9-RF
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 13:01:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaYh-0004eq-8L
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 13:00:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1e3ff14f249so26336625ad.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Apr 2024 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713718854; x=1714323654; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1S3Et/eayL3ikkvtUEAH89f0BM+clQwSc1NOjwOLPvc=;
 b=FMcDoy2BsUKHk43BYh++CXrknNZgHQvRAtKCznA3TqvbyDIqAoAAvqBNuJI4XvkeBq
 zqofO1Qvyjs040pGZcC8DERxbDrDt2ZaE7945Ve2NPtrG+5mnnAyYZtBkLTWWmSI9eh1
 YpflB/cJwZkfruqeKUUz3q5+kMI65gEPle2abch3tKcdsSkpEEWodq48hBPcrA42oSen
 ZaIeVKKPBqEsIqzSCskyhHt9o64CNP4dh+NcsZLKSmsg7/V4cYslSVa+C7r98OH1leQv
 qJyLSHJU7r+0xP0YYuLiVEAFAR5ZOAcAWLWz9SinZrF8/OSTGH0l7EZ1piBF5JKQZxju
 RQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713718854; x=1714323654;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1S3Et/eayL3ikkvtUEAH89f0BM+clQwSc1NOjwOLPvc=;
 b=cwVp5hC7xv/OsQVcFBxQvTx6M8V8bU935i4CwhaqHQiGGl5L1edCyqAJaxSywoWA8D
 oWmdzHiDNjyyZcDReS7tuAuJZ3bVX+SCyL6U2c8cYoVSbOz+O2NOjgbSD94TU5EdAli/
 wy4f/6fsd0KHwJS0SV/gLi3ItsLRsyurWgl9Oma36SoHPsWHsqDzWHevocdKLeRVZaSF
 z4XjprLqKbRUna7KxOLzubpi8oa5pN29RzrxsJUXSI5N1G3hcEQ1wPUrlfct7ND4R372
 aMiWu6dcbX1TjUKbT038Oc2TEfUwR5XhW5ouQBQnDR4XOFDO88iL5ENr5Q535JLgkf4r
 pUNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM0x0XVR6rmrCElW4dXNUm0SiAsw9F7kVvgLOdA431fSy82VUas+lo3vwrudvkuafBYxABGT4p7JzCVS+eGigMeLIFS/c=
X-Gm-Message-State: AOJu0Yyi0VguIxQB8YtjbBjGL4aGfJ0wbJYSgKzGxWHDiHeDiJt0YPFy
 Taw0ptVxF0dkV2/v0B6QojrfKPDmfpO4w7o2mJhMGaMaGk1DBKmtVaE2RR1rfAY=
X-Google-Smtp-Source: AGHT+IHVhJdAebzZ8pdu3WHMOFSAAIMANoEkZ9vTWfKiATcUc3jo3DYqIlIMEeymUxTDG3FMj4gNCg==
X-Received: by 2002:a17:903:64d:b0:1e3:c186:8db3 with SMTP id
 kh13-20020a170903064d00b001e3c1868db3mr11968484plb.15.1713718853623; 
 Sun, 21 Apr 2024 10:00:53 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a170902be0300b001e27462b988sm6528222pls.61.2024.04.21.10.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 10:00:53 -0700 (PDT)
Message-ID: <5f752ab8-c9cb-4357-9f42-c0c76702a9d9@linaro.org>
Date: Sun, 21 Apr 2024 10:00:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] exec: Remove 'disas/disas.h' from 'exec/log.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-24-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-24-philmd@linaro.org>
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

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "exec/log.h" doesn't require "disas/disas.h". Remove it,
> including it in the sources when required.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/log.h               | 1 -
>   target/avr/translate.c           | 1 +
>   target/hexagon/translate.c       | 1 +
>   target/loongarch/tcg/translate.c | 1 +
>   target/rx/translate.c            | 1 +
>   tcg/tcg.c                        | 1 +
>   6 files changed, 5 insertions(+), 1 deletion(-)

Most of these additions are obviated by
https://patchew.org/QEMU/20240405102459.462551-1-richard.henderson@linaro.org/


r~

