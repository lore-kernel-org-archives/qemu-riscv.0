Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B53C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUPI2-0001XA-Av; Fri, 11 Aug 2023 06:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPI0-0001Tx-7r
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:22:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHx-0006Uh-Q7
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:22:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso2293619a12.3
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749356; x=1692354156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XpP3rdBE5w+IiQdYR1lx8C/z1R1Ia26ftCFvEKLRgeQ=;
 b=BmzdJZK+FHLfWnDfBaqVmu3t7qEB05/EjGNWYuR52WrDlaJHkM0MZrY70WNt5m1Ebm
 R4bIVlMTvqFGcD5zq2l1pOTsMuMjNIXw8T5MXgYclaSjavNHQnuCJrZy23Hcd6tSVBmv
 qkBEE8HdKyojADY7e42+O4m1vahuW8zzgvbtzKv6NuOwbGD6PSOhJfhf6DQp4XW3d0ZS
 8poPlRYCm3Ag/tGrqduuBxpAh0IWdAj55Gp3BbsyJHo9SHvPIzbM3/O1EG9UGuPv/zLR
 vVfmJ12tprnEvxe3e/h5WCg0MtpLKwX8K+leLucyR4CQrgojo5GANfu10un7qyeC7PQo
 RKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749356; x=1692354156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpP3rdBE5w+IiQdYR1lx8C/z1R1Ia26ftCFvEKLRgeQ=;
 b=eq+dCEllT+A2tXE9Cj/IZxj5sIxVzX4G5+Ol4cvF7Hiwy1ZV181G/i0/+ycSqXCM4i
 VGu+UPGRHPDLh9k34vdHWGlj/E2p4gK1KO4e7B88xMmVOvz1dw4L/dqL0RJLAEaHyeVU
 qWHbztJvcBSkFfTwP4q63FPD0vvk+EMEWBuM5cnpzXtffO9PKw5cvjVsHAWr5xKzvHlc
 Dij7JR9w3+6B0bSTGXlosc74rjTZ/IbVq5HjAl5pS3xHlcFvfmnhCi7fNYjFW19mWZhp
 j4IXmWKy80pOwhv2agqEUQhxPGh4hJ8QNodvBo4vY2FvFIW4g0SN3HJQgAQdXYOeXa+l
 0/EA==
X-Gm-Message-State: AOJu0Yxq9zLElUn3YhW5LsBLM2lb4DzMR8kBtL5yBjUmA0ZNOe5gO70S
 45oaZRLMrbJSdiIsooOi1A20hCb444hMj1xwY/uB+Q==
X-Google-Smtp-Source: AGHT+IGa1GViyP8+9a2lL2U8L+iUR8m9ZYRISh+frqsO+O5fVpM8b1upGSjrInSDGe2+39lRsyCwgW1azL9QG9X9gSQ=
X-Received: by 2002:a05:6402:3449:b0:523:197c:36e0 with SMTP id
 l9-20020a056402344900b00523197c36e0mr1317966edc.19.1691749355783; Fri, 11 Aug
 2023 03:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-20-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:22:24 +0100
Message-ID: <CAFEAcA-Z2rEnyf1Lk6swhBQhUCMLjPvoHYfyk-FkspsQ8f5qOQ@mail.gmail.com>
Subject: Re: [PATCH 19/24] tcg/i386: Merge tcg_out_movcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

