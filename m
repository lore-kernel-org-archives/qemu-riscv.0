Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C668C04E69
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8Nk-00045E-37; Thu, 10 Aug 2023 12:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Nj-00044F-57
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:19:27 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Ng-0003pg-RV
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:19:26 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so1650236e87.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684363; x=1692289163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lT9l+Y1Pj57uejfgb7m00birXyIxfDmUf0wpond+swA=;
 b=CM2nZnBRj45WCgnDZ+lAFCQPTrjr6rI4zLu2EQipbFyAQqHvN3l5fZgvpRBsKff33l
 vpB4V3ZUN/r1xaMVeKtUe42VYcefIyfomwZGt1ytANNoGytJIIpv0K1j6IlcOcGeiSKg
 r7xmTd+KBHOeGwDYqXqu0OgHbnqsQKroHhQCNwEyWxqDi8REAsVLvIO00t3XbngO+SIB
 lJBrHP7Dyd8/5bD4fSYS77Ko8Ye/BJv/h4rZWiX7tqvCkTWlGKG1SgbFhVAzyHfb7SQG
 ub8EYK2AjCLcrh2/DseJOyuU9qf8NT0yo77fAtmzZhIjenFsWsWQIBe9VDyn5eG1Z0RV
 X46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684363; x=1692289163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lT9l+Y1Pj57uejfgb7m00birXyIxfDmUf0wpond+swA=;
 b=YYxqVbdPAnBjP1EzIdm4wjUk47S7vH4bzBp5qeFe2CY9UMBzJRBgnlHSqWSMUxDp41
 Rrq57qbAmL1e388Pol61CrTcQIxImufUhKstTkoFNOLKlVYwXbFWi8Y0kddWwQBiaolw
 4AomT4kLvV/mvc3hF9wvxTmHzRMPhmzq8vWbZBWBSnfh4CkDeVcMks4c0fGEwQNAF0bO
 bgxxbf9WrcPg77V4z3NaqPcArIZcYerYjtHwjhS1q1tayqAEPJtRKUmmYXWcQC2+6Tfq
 yqc+OlUsH1HfgTEUFGbcWfzbZcVwZncRhGontpzNO++TZ6DndgQacRUfOyGa45v1UUfZ
 2k0Q==
X-Gm-Message-State: AOJu0YxVbr2kWP9EWqs6NP0c5pqba7ct2YYrY+O29mwr4EJfpuKr1J4/
 bwJ0/XFFkijUDg8ny673QxMTmx/b/A1GiXAyWp7WEw==
X-Google-Smtp-Source: AGHT+IEWgD3FfPJ6zUME54PMCNW8nKwdB4wDYFFU+NL/3hSVd8ruWf9C7fFk0kCmmGNBKh2h8FmPXSiRLDqdut+Hc7k=
X-Received: by 2002:a05:6512:3054:b0:4f8:714e:27a8 with SMTP id
 b20-20020a056512305400b004f8714e27a8mr3028001lfb.0.1691684362727; Thu, 10 Aug
 2023 09:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-4-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:19:11 +0100
Message-ID: <CAFEAcA-D-P8Mj8_KcNyFQLuwpxPZOW0pptDDoGswCSaTfVmiew@mail.gmail.com>
Subject: Re: [PATCH 03/24] target/alpha: Use tcg_gen_movcond_i64 in
 gen_fold_mzero
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
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
> The setcond + neg + and sequence is a complex method of
> performing a conditional move.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index 846f3d8091..0839182a1f 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -517,10 +517,9 @@ static void gen_fold_mzero(TCGCond cond, TCGv dest, TCGv src)
>
>      case TCG_COND_GE:
>      case TCG_COND_LT:
> -        /* For >= or <, map -0.0 to +0.0 via comparison and mask.  */
> -        tcg_gen_setcondi_i64(TCG_COND_NE, dest, src, mzero);
> -        tcg_gen_neg_i64(dest, dest);
> -        tcg_gen_and_i64(dest, dest, src);
> +        /* For >= or <, map -0.0 to +0.0. */
> +        tcg_gen_movcond_i64(TCG_COND_NE, dest, src, tcg_constant_i64(mzero),
> +                            src, tcg_constant_i64(0));
>          break;
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

