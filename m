Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A09BC0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:21:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUPGb-0008BQ-2i; Fri, 11 Aug 2023 06:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPGZ-0008AN-QH
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:21:11 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPGV-0006G0-RG
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 06:21:11 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9bee2d320so28167671fa.1
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749266; x=1692354066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kfa6Cp5pGiETfvgsnGoQNS/xb3PG/PDcyFVWv6254Yo=;
 b=TIlKcz0ZByFCBfjBBWiB+7/VamA5NeN0wepDAujm2R/0uwPPti25g1aCa2qPuGNlD2
 vkoqa5vRUWDp58vvTd5DZ0t66xZXLppe3O+RCZOPHR1DdEU/YRHZetIWT7xvZVekGO9B
 JaUuBeVi8GZk/DKzH29TteAqo8bLbybXw9DTDmmedwcZLxd3im7eXyvhJNFCO7UBNvse
 qqv34s+oW/idlXHbhKNpymqGpyzzV5/HjaVdqB7BVMrgcDhsF1W0Iy/ns1oKn7IhRTa2
 tnCnIovRaaGvwH9UH2DF+wnAkV8L7OUaavqj0LO/E8RGcty2QRA2LwLJxyCj2EV4mbDg
 ghjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749266; x=1692354066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfa6Cp5pGiETfvgsnGoQNS/xb3PG/PDcyFVWv6254Yo=;
 b=llVFyTGLyEQoxsXdQW9tlMFNym71rPlZeJUelQ8LNTGfLLVQHgKa7eiV8cGaGKXaHh
 AmwRNo2MICSSqNYszL+QAzDqe0CmVPNIcUQqGMobZk+JnvurllQD7rTr7PSxx0zo6iTa
 orN2Ts+bUQnJINeHZ2EpWawhX+wgkEi3eDUq71ydbuyYl4lOdtzpkldfecgIxFHEB0XK
 stZpMkprokGjqjYKBlD9FlvJNjH86ZCVlpcC8A0qv3VejniAqjgRFJnuEWcJiMPzokVA
 LMqKlv6hiabZ/4anlhkEWMaG3ZuRxF81u3bqzOe3HjF8eXsCAN5NP4+LjKdeH91E3J84
 6F5w==
X-Gm-Message-State: AOJu0YxQzwOF1DY5gvma9x7V8QeTU6y/Zt7ebUEUWGvYQsR1tR4G50P1
 I/2QHVbcPEQNpoHmVO5LJ4RHMoKC30Ofr+BId201VQ==
X-Google-Smtp-Source: AGHT+IHr/SDHrK44vxJlKShhZi1XchgGkjzIA+H/f4jR0O53px4zbCtz3tyaDY2unnC13eQCMQrbGvw81Mzub0XOpjg=
X-Received: by 2002:a05:6512:3985:b0:4fd:f77d:5051 with SMTP id
 j5-20020a056512398500b004fdf77d5051mr1234827lfu.26.1691749265732; Fri, 11 Aug
 2023 03:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-18-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:20:54 +0100
Message-ID: <CAFEAcA-h6_YU9mZ1UOWPq9KnqKQ-_jkJMKhpk98MzHqsyq3cyA@mail.gmail.com>
Subject: Re: [PATCH 17/24] tcg/i386: Merge tcg_out_brcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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

On Tue, 8 Aug 2023 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 110 +++++++++++++++++---------------------
>  1 file changed, 49 insertions(+), 61 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

