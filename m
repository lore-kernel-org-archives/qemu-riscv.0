Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2EFC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:14:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2M23-0002ef-Jv; Thu, 25 May 2023 21:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M21-0002eD-V4; Thu, 25 May 2023 21:14:13 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M1r-0002h1-6W; Thu, 25 May 2023 21:14:13 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-456d534f403so125286e0c.2; 
 Thu, 25 May 2023 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685063641; x=1687655641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTQiG1RoXqRLPJecSAF+4f4TyhAz4ld7NcDFve12Cq4=;
 b=lplmnuACc4mWvXrpPqHUc/XcRHjEBLFuhnJhjqaiQ1EYaQcqp1LIPflfjVxbkr+f1y
 jaRdD5ay1oQOpJWGYSgDzBpl0fgT08gw/MVvgMINmuIs2my5KtMTIAnpcrOw+7qAxMQL
 BnEEuXwvvRmfJdI4ZhPnPCqBzzF5urNqCpaqn2J/v48gKeQL5bDkPxBVtKKPDYs8IOcC
 EP7eiKXAX6PncdLZI9JosOVVXM48+UkMt61T5hC4819ybzjJiQX9rG1q2Jx8L+ZlBQdv
 VqVgRRRri6RFFfsRxN0ZKgDxI+FRK9QXCHsUBRg/osvPRxOxYTv3kOdxGgzQXxOag1Qz
 l14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685063641; x=1687655641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTQiG1RoXqRLPJecSAF+4f4TyhAz4ld7NcDFve12Cq4=;
 b=QUo5Wk9+R9Umbq8/uBaAEVOMo7sOnmHmxQSdCjnxvU4bRaf0PkxXktOs8c2ALkaITM
 wO2a0CF566NAJMPrzzjcPRcuWxWiitJiItWw25+CUx7OzCjXXbmChz8i+rdhQR4aAYrr
 mN0Pv+g74GPcUKV+srbFu6MjBtYU/Vl6lyWOI8bnS4iLFmcY6qZFwylOaXlsxGoJb5k0
 zo7K1C60P2Wz63NiYzZkhc8HwJYtdFY6egcyJAsG+5Ds+bu+rwQtjjhuZ5TM/dW15EHv
 u6HCtb5KxUybzKpVyeX2FAq4VDbkL+D7qxUa2LWg6J+vZchOZk8AEYCo3/tuIvEVMwVy
 4JqA==
X-Gm-Message-State: AC+VfDwkZDIWHY1mcjZWwDm3mqFKj2pInFaE7bRiAEvJ+6N8VBf1m5NE
 n71E0fitIhH4lER+MP1Qwy5C4J66+S7CRd8kWQw=
X-Google-Smtp-Source: ACHHUZ6UnYpZnBa+NDoPZg+miyET92asFh1W8IZvrRtOBj5sb/uZL7jes9qhZLvJjpH/lBn9tUQS/lqENBIRx7AOq3c=
X-Received: by 2002:a1f:5c12:0:b0:43b:3fda:1fba with SMTP id
 q18-20020a1f5c12000000b0043b3fda1fbamr81546vkb.6.1685063641577; Thu, 25 May
 2023 18:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230518175058.2772506-1-mchitale@ventanamicro.com>
In-Reply-To: <20230518175058.2772506-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:13:35 +1000
Message-ID: <CAKmqyKMb5x=AyUwCoK-22_amiGYVG8MFRxga+awiKSBOy_WnWg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Smstateen FCSR
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 19, 2023 at 3:51=E2=80=AFAM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Patch 4 and 5 of the smstateen series need to be re-submitted with
> changes described in the email below.
> https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
> Hence splitting the patch 4 of the original series into three and
> re-submitting along with the original patch 5.
>
> Changes in v5:
> - Ammend patch 1 commit message
> - Add reviewed-by tag
>
> Changes in v4:
> - Drop patch 3
> - Add reviewed-by tag
>
> Changes in v3:
> - Reuse TB_FLAGS.FS (instead of TB_FLAGS.HS_FS) for smstateen as HS_FS bi=
ts been removed.
> - Remove fcsr check for zfh and zfhmin
>
> Changes in v2:
>  - Improve patch 1 description
>  - Reuse TB_FLAGS.HS_FS for smstateen
>  - Convert smstateen_fcsr_check to function
>  - Add fcsr check for zdinx
>
> Mayuresh Chitale (3):
>   target/riscv: smstateen check for fcsr
>   target/riscv: Reuse tb->flags.FS
>   target/riscv: smstateen knobs

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                      |  3 ++-
>  target/riscv/cpu_helper.c               |  6 ++++++
>  target/riscv/csr.c                      | 15 +++++++++++++++
>  target/riscv/insn_trans/trans_rvf.c.inc |  7 ++++---
>  4 files changed, 27 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>

