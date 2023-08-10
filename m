Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D0C04A6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:58:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8zQ-0001eg-Jx; Thu, 10 Aug 2023 12:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8zP-0001dp-5v
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:58:23 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8zN-0004WW-Jr
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:58:22 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe2d152f62so1803284e87.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691686700; x=1692291500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F0EpfFwz2Z7kcnGFjrsdZJ6XyL+iIeDh+uooFFhmqWw=;
 b=en3v9RaXVIhRG2iL56ZBL/ltnZrA86ztYFFywJE4O983aUBfa3yWlAVt6FWL2SVzop
 FnSgAwy4bkzPYE3dGYb+V3QN8zJ8p4n05KXveNilf6ZdOR9msN2K+W858gVw7tiJEWgW
 QnA0kC8MdlA6EHYmLm2ShH+hRwnK9eUEsesRx6pT3mM6jHhruD2tfwP6ZCexRDTJ7sdm
 kifDpyyDUTJ01pRKr+j0j0XWhQhUXFA4ii2znZqRDCRVz+QSoWf3bZnjSxis3S9KGEcd
 YT+fEqLg6E0B1vcd2TFpBo5h8Un6hKmMKATKjizb0VpQm5NgDRXAZV+ola3VSc8Andbw
 oMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686700; x=1692291500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0EpfFwz2Z7kcnGFjrsdZJ6XyL+iIeDh+uooFFhmqWw=;
 b=hQJ9b5XW7tc5FO7+86O83HFTmQi3b8yleyNl6AHhIIHcT7pvASG9W4TbD4ggRU3/8v
 vMdqK/Sj9Y/t98aGFUOGhrt3AnZCPafRj3904xtvsK7GRUVPbMC/KJ0owkcEhcbb6irx
 uWo62yEDCgu1NqqiQS5KL9p6MESwa0h13ZyuEoi8J7M8uHCqDF6n4zrh2WkSlM/nDh94
 ZlbURWiMnhg+m2uS3+VsxmqJ9s/GyG3uT/hFDe9XGdriELkOue98VUBfPc9tk51bSeUo
 Eiu3+8zozpXSa1R6YCaAK/KB+YABbVQ7KRa3N2RkSTdq5S5kgcXIIt/CMLbkY6MvVWK/
 5D1w==
X-Gm-Message-State: AOJu0Yzsr7YITB5jPNeYSGoG644/ki2MYYO0h6bbqGKoKbuG9CVKC96A
 OvcqLucJq756lR41XIG7/nDjqiz9KIOv3B+iJby1bw==
X-Google-Smtp-Source: AGHT+IFwX6F+wsOahFNKIj6yJXtqQU2evxyTCYAGZ5wo1eLzSTONn3wqU6O8VHT+4zZh1xXiL+rKTVVlzhj0nbKSk3k=
X-Received: by 2002:ac2:5936:0:b0:4fe:a2c:24b0 with SMTP id
 v22-20020ac25936000000b004fe0a2c24b0mr2149244lfi.26.1691686699766; Thu, 10
 Aug 2023 09:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-13-richard.henderson@linaro.org>
 <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
 <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
In-Reply-To: <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:58:08 +0100
Message-ID: <CAFEAcA8j=AejoxGSO7wKQH9uM68jpL59KrgfSCQj78-sY3yxjw@mail.gmail.com>
Subject: Re: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
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

On Thu, 10 Aug 2023 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/10/23 09:39, Peter Maydell wrote:
> >> +    case INDEX_op_negsetcond_i32:
> >> +        a2 = (int32_t)a2;
> >> +        /* FALLTHRU */
> >
> > I see this is what we already do for setcond and movcond,
> > but how does it work when the 2nd input is a register?
> > Or is reg-reg guaranteed to always use the _i64 op?
>
> For reg-reg, a2 < 31, so the sign-extend does nothing.

OK. Do we document somewhere what a TCGArg is?

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

