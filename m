Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CFAC4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuSJ-0000ZD-LP; Fri, 03 Nov 2023 09:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyuSH-0000X3-PA
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:43:21 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyuSF-00089X-9f
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:43:21 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507c78d258fso2686741e87.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699018997; x=1699623797; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYnlTVJGZbW/5iq63BGoN+7roxf+37ZtkPDAGvl8K1w=;
 b=LgumCssSu6fYlABw4nBfWaZWavaaXZgoDtdlpUpnAecgfA5nYPI7DVmN2Gqx6/HPRW
 QZMDtr0kTVbNiSwJrZ4kYhrS67amWnYhpz6R4S+LRFU7upR9Pdzt+0lFnKbGF8tZzZuR
 CjXLNblSOYkx7Z+7YR8c0RyTzAoj6BAAt59TubgjbwF+cxoXuruPuxSkRa2GNOPJgsiD
 q2gJTaemx2B2VajW/t/hK8TC6wmZlJr22qrWoYn6GpmEez0YzYbmp5M8fmPZ5ReLvu03
 QBxP2aW0MLqNxhlpNsOfp/Q4OIn6+V4tsUA76oYcFwvPcGrn5pE+VqaAqIzwir20tfoY
 1XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699018997; x=1699623797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYnlTVJGZbW/5iq63BGoN+7roxf+37ZtkPDAGvl8K1w=;
 b=KnUC3/CHCH8trACZYB4O+P6SA28M/xnDsra7XVLs8GJCZJNA1UstXhxHlFzg6LSNZr
 Hg1y4KItu1K1qXtFjrvDZ/R/DzrYJ4kedGjpm46zr4asi7TUVBcqPkndIAJ9EdN/Xcea
 T/o0tYd7B5l3vV0CAzeGhDXhruVfMR5jueAfm3TkxIigTR/m9AT+WrrU/2lRzeNk6A+9
 c2h76jIsnXn0m+k9OMQtDVEGiTEgCIByk5YMe84QJXWO7EnzSEAO8kQRI+WrwGqa6FU3
 XvVUpvvj+LO2MVykTgsBfnGOlpC/ur/pwa/RmNPKsURJ5M8/mru4BVV5kG8azmyVdzY4
 cmSA==
X-Gm-Message-State: AOJu0Yw7lRcprWj4Begc8neFCiGtGZVqoYZXdeBPU2dP8dSfw7aZObum
 bKQFrBD5WVJ2WhxGCzwvfUZeWx6idazNXsztv9FSLA==
X-Google-Smtp-Source: AGHT+IFO2+pHfHG6Kp4Cs2caNvDyC1QdJsHJqxruGOnxekGq0mZLoiXpCIBY6TRUk7GNugMGZmPHj4Ml4VUcjZuXw+g=
X-Received: by 2002:a19:f51a:0:b0:503:778:9ad2 with SMTP id
 j26-20020a19f51a000000b0050307789ad2mr15426559lfb.19.1699018996939; Fri, 03
 Nov 2023 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
 <CAKmqyKNdRzBg_Y=K1AKyo3JnVhN2n_XEF4hu6GD8pC+9-QeKqw@mail.gmail.com>
In-Reply-To: <CAKmqyKNdRzBg_Y=K1AKyo3JnVhN2n_XEF4hu6GD8pC+9-QeKqw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Nov 2023 13:43:05 +0000
Message-ID: <CAFEAcA_oriuA5WNEL_XGVHWA-vwbF7_GVqswt0NiwqE4xb4ycg@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 23 Oct 2023 at 02:15, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Fri, Oct 20, 2023 at 5:46=E2=80=AFPM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Commit f57d5f8004 deprecated the 'any' CPU type but failed to change th=
e
> > default CPU for linux-user. The result is that all linux-users
> > invocations that doesn't specify a different CPU started to show a
> > deprecation warning:
> >
> > $ ./build/qemu-riscv64  ./foo-novect.out
> > qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed =
in the future.
> >
> > Change the default CPU for RISC-V linux-user from 'any' to 'max'.
> >
> > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

Hi -- did this patch get lost along the way? It doesn't seem to
be upstream yet.

thanks
-- PMM

