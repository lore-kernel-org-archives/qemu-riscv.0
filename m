Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B06C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8T4-00076o-JB; Thu, 10 Aug 2023 12:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8T3-00075f-7A
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:24:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8T1-00058c-R3
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:24:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so4624497a12.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684694; x=1692289494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NKzFWzq3o7yoHtgpH4lMpHDKTXKeav8BD70Hoz1nnBI=;
 b=e0++HBtDGMkopIReN6Ivx5APHJpB/Ojn/J9CF8xdFig8chYpZt/rUC+/w75qBhRWoN
 q/beVa0b52rXuXlzOOIxzY8sq+H0p5M7gOs1zDXsrkot4JBqmuJj5aZvDpEfGOTsXAw/
 yW5Todo+EDfzUtxG8VA+Lrqoi5Jeu2O8Nn/c95iRhFudiwDt+Y4HBAxX9JvKKwhTAkif
 Ia/T1v5z9LE05L3fQhZqMm6es9F7gluUKtzBbkdmCSQsMkt92Wfm0RH13a6pAY/upLbc
 9VmQGNozXTwFZDflI5nAmrCSJ/XJ5OhbzHBCoGY4NOYVSerqWuLbeTE++8b1F44xACmP
 2Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684694; x=1692289494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKzFWzq3o7yoHtgpH4lMpHDKTXKeav8BD70Hoz1nnBI=;
 b=DVX0qHqf9jRFHv6836Lb1oq7KF0srbczwhbDYV8Edq+t+PT7UPfx7gacyryotphFau
 NQ1Wi35y+lNpvlxKWUEszS3cDyDVEOE7uxOOUcJCbKXnPTl7tIJODlZRqtAzlHhwxapv
 PGwR/ccqCUMro3eD8bNn/z5uBe0YwnqcuWTqRCwvT6ecq5wwKyCFFyZatPy65Hd6ZTlT
 VD7yLavLkMCUNbKCLjoOFzqLo9dy3rosGrBWsgfIudRyrN4URzGXZFC9Tnz+sbDlqcdm
 16U6W7KL9VNwHLbtE8HHBF2J9KWauOqQStOkBmFfqRG3fyPHcH6Sq9c1GYrdIlPKv3nt
 yMTQ==
X-Gm-Message-State: AOJu0YxY+XKD5m8J0vAXPUtKxcupqfY+8xhlCGAtnPuTyjko+v3/Udg7
 +IFcBTL/wUVf4zH834gPUC8BlboiyWtw2zcsxnZaKw==
X-Google-Smtp-Source: AGHT+IH9UjPwUs8PIr6ht7l7PMtAG0t/rIHGkvA4jesBb7RUy8PoFQW2CqFdv8480KUgkt47UAjC2iKQZvajy1kyCEc=
X-Received: by 2002:a17:907:8a04:b0:99d:ae3:80a3 with SMTP id
 sc4-20020a1709078a0400b0099d0ae380a3mr3231266ejc.0.1691684694459; Thu, 10 Aug
 2023 09:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-7-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:24:43 +0100
Message-ID: <CAFEAcA8LYVyER2HN9-2wedpoKQCCoRPHOjDTZMF5u_Y7mDiywg@mail.gmail.com>
Subject: Re: [PATCH 06/24] target/openrisc: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

