Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEFDC04FDF
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:24:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8SR-0006VA-Pd; Thu, 10 Aug 2023 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8SQ-0006U3-KG
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:24:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8SO-00054i-42
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:24:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-522ab557632so1369134a12.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684654; x=1692289454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i2mcToMniKLoxJuyIOSXHvvMNrpA05EweuAGyGbT8dM=;
 b=Q60wI34sMiXv3pG/2PBj71fExmDk90yyeELgAFBl72RA+fo9HZYGOeXL4S0nbeijQ7
 M//Qzwv74oI/HI8yDKF32iBpWnAElQFO+Qh/FUt5KqPEcn2dE5xqr2nNk2Sn+B+7DJSz
 +mu/ziuKfaKFeGZuNZlrtsk6bbouis3oOCMWZEu166QtFtRFYSCNJLCJSFRn+NGJQMzU
 OYJLd3J/pAoijvuE6Ga6vsKw/QQRgAAjumsKRU3x+D36nxyntyy/wrvzPvVTWmXFtuHt
 sGkuDBBDjQJriQO7g3FOOaWzPzCCVeeMSrp+gFvmdVoIIueQVrcElVkZdKQAVwF4m3LQ
 NsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684654; x=1692289454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i2mcToMniKLoxJuyIOSXHvvMNrpA05EweuAGyGbT8dM=;
 b=Zrpr7Q1mvCUD8UG/fXYu80iykx1d14EkXVPLRy1hdVdYYmbtwCbHv5nGrklspnaz3Z
 Rsss89Aerf9K0Ntr3VsNB9V0Y7R7ELptvlxTTMC2t7oh9m1lnvfIH9XnS55Kyeoqc5AD
 fwB3Io5vogx5L+Xj2LjuMwvppea9dqmDggk7seduuteINz2KdpNYwwnlzlvb44H6ngfB
 XUaok3qcmg5kP/NrugFY+eeq9qAKIiXCt2E5eV21rxH5ILI05OHQDbdwyYB8DhggAwwZ
 8dAEjaR7xses07RbZaA0r1BBTlQENP0/xN9tX8KsCNWM7r9S0tqyBdZPLjPRQr6fRkl6
 T+Fw==
X-Gm-Message-State: AOJu0YyzyK6sU7PD9ygHnhjfGLkoWeD8JOCxMlkWcUcX0qaJmdi/wqvp
 51V1pp1qCmc/sEWFyFSUQ86jESyUMqqydqrLZ5oU0A==
X-Google-Smtp-Source: AGHT+IGBn/YeSP/Dq2VOo/oYIO5zmecaqh33bf5nTZgvqtyTVVtyXoKDMHGSlyjiLoUSPUsdOHQVsLDHnSTqhfDYMzw=
X-Received: by 2002:a05:6402:31eb:b0:523:4c93:1c0f with SMTP id
 dy11-20020a05640231eb00b005234c931c0fmr2404412edb.21.1691684654604; Thu, 10
 Aug 2023 09:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-6-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:24:03 +0100
Message-ID: <CAFEAcA-OH--irvgpBP6BFLsCZf+2XT=1s=u+xsivRdNi8jwxPg@mail.gmail.com>
Subject: Re: [PATCH 05/24] target/m68k: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Tue, 8 Aug 2023 at 04:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

