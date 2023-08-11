Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514B1C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUR16-0008Ls-77; Fri, 11 Aug 2023 08:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUR14-0008Kw-Iy
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:13:18 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUR13-0004Lf-4H
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:13:18 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so2434060a12.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755995; x=1692360795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YQrYePtzB9CE7rSQfMEhjs/n92b/nORl3809bFHFByo=;
 b=Mef8+DEHn6KxV2gD8ZNvsiYgcvi1Ct34cjzOZDukgFWoIEXdcwm9N+uUQFayACJX0L
 8M3oEhY2xaB6ELUQ501qvzfqR2SvYiePNVpojjelaSVayRnpgvKSdYk2a9sB9nxelzzC
 ho2judO/JSTcknmukx4ToDmjhkrgB0YrZnFzepXZ1dxosFi7sWVQ/GaYxZSP9DFWc3Uq
 t662Q7Oq5cvPWa4ec4NcV6C3D+uR4xUGzCPRDTkgD/kqpoTcRLke3144agoX8AzcIqXw
 +cEVrDCyAopJjAOZFNV/Q3uY+6VS+RRReTH0ffeL+S4n3eSnSE3rw3IptzN5tNWDs6Hu
 TP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755995; x=1692360795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQrYePtzB9CE7rSQfMEhjs/n92b/nORl3809bFHFByo=;
 b=AWBQPC8FeOCOCFz2dhlrgmjwjWdYWfuoOQYMCs5QpWpTqCRmwvZmg+qwsgYAERU3kS
 lrm3GKNuAuE3pxfh69RnGfJt1N4nHUc/VgPy+gTa0Uhq7nLueRwlI+CCtMf1hnWf9st8
 61T1JxQ5LWnqmHBhR+9NTYs8UDuZkAQQjAs9k6GLc8S/HnCPBe6wSpv7WjpmNg7IdwJw
 SqNKl6BKnDv9OA+Gk+iHpLtYR5gSEOoxis6W3uZ7SjgpfvS+uykYk37zPpyJDPYVg2DR
 YJzUERoUYUwlUBSBjwpP5QU+ckeBDn0YoJygktMq6J9VdTBOUu1az/gGI4yYxBa/g9fV
 gPJA==
X-Gm-Message-State: AOJu0Yzh+NZ2uwYOcr+CA308Eqjo/wDWTqGXGiIVljcH5/SM3nFfjVvQ
 NADx7yY7Fsvyv7zqJOzjclD4XjfwFSBRqsBjcWU6pQ==
X-Google-Smtp-Source: AGHT+IFHgYz06MHGeOs8U9jo/Cp/1YSy1OkmdVwIDR+itXP4Gvm1euz9PzxgG/xIlRX+bXvXMbPWQO+B7xC5dCP9eR8=
X-Received: by 2002:aa7:c0cc:0:b0:523:100b:462b with SMTP id
 j12-20020aa7c0cc000000b00523100b462bmr1499853edp.5.1691755995108; Fri, 11 Aug
 2023 05:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-25-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:13:04 +0100
Message-ID: <CAFEAcA_HUQSyJfT9e4RxJq5CxUDPH5PJpPGV=M+SQV_QfdSfcQ@mail.gmail.com>
Subject: Re: [PATCH 24/24] tcg/i386: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 8 Aug 2023 at 04:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |  4 ++--
>  tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

