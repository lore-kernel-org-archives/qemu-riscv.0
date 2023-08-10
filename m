Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5AEC04A6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8jG-0003km-9M; Thu, 10 Aug 2023 12:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8jA-0003hV-I0
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:41:37 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8j7-0000V5-KT
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:41:36 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe426521adso1657669e87.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691685692; x=1692290492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b8AAX1HEkupo+tqEtWJV6eUhNeCUQbFrc488Z8Uoplo=;
 b=O3Hx7YHmUJBdo6PTg+ECeZY/1GC78bhftaBNe7ttUVRfWTUJiJrjU+8t0gJrKDFEzg
 FRlVq/fmMQzWn3I3sbD4qNbbL7H/krAWg/uCJTadtY6icV7ysQgeVlSpNbTMM/b2gL1N
 LPD6bkyDjXuxylruTYnEuPlRxHZ19GliPq2S2pH0Atndc8nwtZqfdZKQwW/SkLkerzAi
 rMOARP7LbZmCNT+CHfDoHlcCIs/VWm7IW7tny+g8HXJPX34x6Wb6w6p1+h1ZpHEMNTDm
 /bt64NM5M5z10Ru1sJwNbwNLvRWXYi1/XQrPfN7EbukuRmGph4S8qiKHLQeMdZYg7uLT
 BSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685692; x=1692290492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b8AAX1HEkupo+tqEtWJV6eUhNeCUQbFrc488Z8Uoplo=;
 b=IKeuG2vAtfc1Jxu/sFDOhdTS13igQFJQFnjxm1YxDIVIdrHzhjSf2Vg2og6UN/iPWl
 MsYpdMrtXOF8fIIoiWscTeKHtNGSFQxoT8I9FU1OMm1PiHslooLwYf8EYJbDkrifKcVR
 fESXXtEKRYBKMiBh4Ky8SCvk3xkdPpV7Jv/dZwvWmLEqdGIWEnBBMv1FWMnC5HFbG6/4
 M3biJ6EZFOAZRGtFDcM8ZXHLMHNQSsDNCKvwq8Y0TqqY0k5szENHXwRKicrYvSWGuwAN
 YQnEklUOKmkFWKfdBrIhNqXuWWCTRzevDxvxw9VFi+VyyNQIkGN/oq1aOIqLjxCaXh97
 B32w==
X-Gm-Message-State: AOJu0YxsNYXViKvnJX8KolPe5irYG/GkkwUiLLeAJfYWtjcexIVFwNzD
 dSrdOLcQEOYiBYCG/jGDQG13VvyKc1PpSiMFuYljNw==
X-Google-Smtp-Source: AGHT+IHnES09lIDN7GdSyko7mSIUhxBNsBoJIBUEHvuS456VM7pXHr3/iTbYctTlhnsW1nghs6h3IKE/EoM84FkJ6fw=
X-Received: by 2002:a05:6512:3696:b0:4f8:5cde:a44f with SMTP id
 d22-20020a056512369600b004f85cdea44fmr1880839lfs.10.1691685691596; Thu, 10
 Aug 2023 09:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-14-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:41:20 +0100
Message-ID: <CAFEAcA9j4NcpwLudKc8kDEdEV2itXS1UTyR2u97hROWJ_n9=pg@mail.gmail.com>
Subject: Re: [PATCH 13/24] tcg/arm: Implement negsetcond_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Trivial, as we simply need to load a different constant
> in the conditional move.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     | 2 +-
>  tcg/arm/tcg-target.c.inc | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

