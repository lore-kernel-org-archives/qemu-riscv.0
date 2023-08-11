Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA93C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:27:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUPLh-0002gh-DW; Fri, 11 Aug 2023 06:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPLc-0002em-6l
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:26:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPLW-0007DM-5P
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:26:22 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-523225dd110so2421122a12.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749576; x=1692354376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxW4QMohZTd4ffGqz5mVyYv+XPVEgvrR1n8HhpUVgXw=;
 b=yhVR4tjOVidwv87lqVVJHDxHF6L1X7ukxRQiWMtFwUuWbgM6lugRU2o1HpRzxfTq6T
 STquIND3nn5cEEL8aU1YUtkZXSH5jjayubDJsdOy+hrT37IVMJqhKrqYkJ8vvP9aley9
 oNeYglWwMoilyw6Vxd2JlfaId8AoOVvXAR32y64XbyjvdrcQJ8i2WEwMkRoqOpNqJI/i
 qp95J2XiWL5GUM7MIAWbvkLbWT13fJFN3cEE84dl4unKjO7hFAmV1drqM0CPP4hHSFC1
 AfYQ4TbrsoFrk1ibQrIhmhG/vc0XXyd98qnqMfoCfyg+ghb9EwNeKfattBgDCmqYzTkA
 bUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749576; x=1692354376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxW4QMohZTd4ffGqz5mVyYv+XPVEgvrR1n8HhpUVgXw=;
 b=TCCGr9heuHl6zMV9qNe9M/Tf6ZXQZV9uvfygW2dcWUfvi+/QHL5hS8zEP92uK6aGFL
 ip/s1E4XI8yZaL6Y7F3J0M94XJ1r+UbPfyMlQ3WSxmCrwtWJSJF2YO3L5HOKP73PHIxG
 rVT2hUFzSG9yZENfjRCvtvNDmw8xpRZi0eJ0vJ1YRxGaN5Mqp/ywOxs8fNbtVqCEdBGG
 9zmVtz6rgLCOivRHlqpYR7P+r72vpAMYrCjuVmU5km0yx2cb8wNRY4I2wDug7rN1WZe5
 Y0qVwH053nHgbKLtf7COvDlxJ7cGMR5RnU86jQrr071mduXhxy/+Q7TGc5oUVTo89FAu
 LI3A==
X-Gm-Message-State: AOJu0YzZQhSWz7SxI9aXTvQs2kvOaF8Fk9uBCuFXNFaI3FYhX6KdY3ba
 ohgHZW+fDInjWELI3EJCV8fsnYVxBn1E8MjkAfeIJw==
X-Google-Smtp-Source: AGHT+IGdtKJ1W/hcKSpKFcS62mzhtCPwus7xC/jgOS+0m/tNb8dq8AsERokfwBYfG7JbMG4D1kfWMoosiqdC5FlkyB0=
X-Received: by 2002:a05:6402:1846:b0:523:406a:5f6 with SMTP id
 v6-20020a056402184600b00523406a05f6mr1313950edy.12.1691749576480; Fri, 11 Aug
 2023 03:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:26:05 +0100
Message-ID: <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the parameter to avoid TEST and pass along to tgen_arithi.
> All current users pass false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index b88fc14afd..56549ff2a0 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
>      }
>  }
>
> -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
> -                        int const_arg2, int rexw)
> +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
> +                        int const_arg2, bool cf)
>  {
>      if (const_arg2) {
> -        if (arg2 == 0) {
> +        if (arg2 == 0 && !cf) {
>              /* test r, r */
>              tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
>          } else {
> -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
> +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
>          }
>      } else {
>          tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);

I don't really understand the motivation here.
Why are some uses of this function fine with using the TEST
insn, but some must avoid it? What does 'cf' stand for?
A comment would help here if there isn't a clearer argument
name available...

thanks
-- PMM

