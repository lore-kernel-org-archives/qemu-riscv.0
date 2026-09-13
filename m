Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE7C88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 03:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5bEa-0000yi-CG; Sat, 12 Sep 2026 23:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bEZ-0000xo-6f
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 23:50:27 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bEW-0002OE-Kk
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 23:50:26 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-39dbdfaef3cso900233a91.1
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 20:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789271423; x=1789876223; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hk0rmQA4S8Tz52CHnUhIhJv6vrx46CLqt4n+9o4hG5E=;
 b=BW+9taPvLLHMjocNIRwBGKyeTP8v4gZ3bSIDgdFHAWhO0YefAieZBh/hAxopRLm0U+
 arFOSBAV/mNr2fb7qoJj6Ex0QDlTkkQ0uZ0ENFWseeD77n31RYCujkLtNvJ6wUIkmgkr
 xx/dzAedNqAAzOd12bIIHZTwy6ZfMPSpP5idt0VTYcIe4b0QjGgnAGwvPrDkbJoprNpr
 80z54veagyDbJGw76wVb0H2xvEsKlhEuuM6cuaZ17d8gatqpDspbeXTHkf56Gf7+0Y5R
 E+lEdWW42lZOsvPLwm/+XMkEtm5qNMCp0PWBo6FUjD4sTh+9YSKvxtjmKchyGgHlz/Q8
 3sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789271423; x=1789876223;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hk0rmQA4S8Tz52CHnUhIhJv6vrx46CLqt4n+9o4hG5E=;
 b=Mi7rBSvrowtKO1unv2LpLcd/LmaxQgaRDyTARd+ZxlY1te1jWXysqTQve19LOCc5YL
 q6QMLS3BLbFNodYjXkX0b6SsjJRuVWgjQbmI249+tE+GrJjajzpK5u77F3Sgg90WMhqZ
 LY2qcPuhVde5Y2LVTN3jd1zNhcUph/iYztxYTWxrHWCZsmuJPiY7PaIXtjas2dVFSbFc
 zdO/ZodJaFwhj95dFSitrfvQzy5YDli9Di+29zTejzTZMm2Bjj2v/Gjumfj9X1wkgUEj
 rcrMrq+bHfcozhPf5HP4p53ys2VbHDXh4k77+rk5CJWnOIpvwmGsrrSzEnXdcPrU1lqh
 XpYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXMg5WJ76ELY8f4GrL7oZzh9P2mBj+en0c5j4/dZkvSmUyhWcrMD43U5ncMbCYVTXl8oBRKGQE1PDq@nongnu.org
X-Gm-Message-State: AFuF++mCgOCGKHGtvyHZBXUYN6xEseeGOwqUvEDbkYDVk1lZWsmOE1hz
 yAGXCx36HeNPpNyhB+XiIiiQdD0tXcdY6QNbkb2OSbPzod/I8v/3Qua4eddPaS9Esic=
X-Gm-Gg: AYBFou1SMFJOFLTD/tH1UtXcKKQ07Uf5mrxSKQS+Ljq9CzBCTWqepMpoSbXJnMJg1Yx
 dQH1FZliy0ShI9xZkDHx3/qIXp3FqXdWKDuebtIWkpD+aE+6cVnHBGtL0bl68xI887uvI7iT+Lh
 knjiQFzTHE5hiIlGMSzFaXUHWuijTtCO66qQqpGVE4deba5MuAOzBnjVMo7T6P1JyxvbRlTwWIz
 GpXe5B/slLzFEb19yJtzvAXuiln7tCmDqOEAa2YAV+XwTuQzo1HlCqFNTr39+3lppRHYAPX2H5O
 vIxMoCJks4ZniMpDnVTkycFKI45jWdB1tbH1KZTtzSepnMq96Fphqmf4qn5dTbXbH9bWJq+80dx
 Hu/fRCVxRlJRzuP2f2VozMjKPYyAEIs9aaO3mU9y2Y3290Yqwd1wTafpm4wtWiRKHVN8ec2JLtJ
 Ecqf/iXQ7/eCvGTh64nIrOovBg+IFH3nnVh9lw+qvVvUgRmrYZfbFmCChhQLpb3SAD0Cj14mOat
 4cSNUmywGGL2j+GuEtvCeBq0DagvLCx5lABVCDFcwEPNJ4fCoCNEBg2GcFOCg==
X-Received: by 2002:a17:90a:ec8c:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-39d9bbe4910mr22492663a91.5.1789271422987; 
 Sat, 12 Sep 2026 20:50:22 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b97994sm30505266c88.12.2026.09.12.20.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 20:50:22 -0700 (PDT)
Message-ID: <9d27a935-305a-4623-96cc-93d09173b8db@linaro.org>
Date: Sat, 12 Sep 2026 17:50:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] accel/tcg: Add do_interrupt() wrapper for
 targets to manage BQL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-8-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-8-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> Add TCGCPUOps::do_interrupt() as a wrapper that targets can
> implement to control BQL locking independently. The existing
> do_interrupt_locked() callback remains for BQL-held contexts.
> This allows each target to decide when to acquire the BQL.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h | 14 ++++++++++++++
>   accel/tcg/cpu-exec.c        | 12 ++++++++----
>   2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

