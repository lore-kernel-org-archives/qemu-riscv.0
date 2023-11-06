Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91842C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 00:13:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qznEW-0006fk-EN; Sun, 05 Nov 2023 19:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qznEU-0006f6-Lr; Sun, 05 Nov 2023 19:12:46 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qznET-0001a4-3g; Sun, 05 Nov 2023 19:12:46 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-495eb6e2b80so1175891e0c.1; 
 Sun, 05 Nov 2023 16:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699229563; x=1699834363; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lH4jBcw+wzn4mqts0mSXEPPwVdwKy2GmVdGoyr1XbU=;
 b=Qx3xvxeXsKRBVhG1gN9tNSb0U28VOnG4EiwgUoNoJH8kZRWy960ZtGzGiZoJYwwMxP
 Vug5r2nwPr1x9n194/7yWsjhHBXPlRuOTc8F9Q5NQc469PhbjJQ00zOkSpbtOTpqDuKP
 pLKR7JLgWBCFtQX0Bu9Yw4zHD7Bsx5vN85lM39Wl9jMor4JyVez2LmGJAdDYiG0RKiEO
 SVEoKYyNa0k+upk4ARtzQVFiaQcgj3IOgRU+/jcik9jlGJBsLtK4mcY6wc/tElQ0IsqZ
 mDq4yNVXFjWcsERLEL06rsQiWTkHyL02J98FDy6/ATzio6GKKsg8pDjhjGshYRvZuBek
 JojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699229563; x=1699834363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lH4jBcw+wzn4mqts0mSXEPPwVdwKy2GmVdGoyr1XbU=;
 b=q8Kk6aIP2fxEEG+9PjVAUzfKo6Fgc0BYaa+LVOPo0X/yRjLX8a/jDorZ24Gqxfj2q4
 NCNai5M5lwGrjoIALt74VZVLFSuMxFaDxPokVnDqxxm0VJ47VYdT5Ft3KBm0YR9+ctJh
 wc/k99pnctC0qgix2DzuYY50L2fOt7SSbbk3qCtCvFvkx9YEgpzoEbKSKYb66TYS6DZi
 QvoqcMzlUb/HWGhfo/o6A+sRvnipoFHbcUlK5TznhxVPPSFhqoJKEOLkNCOp87qpwi2I
 gEfozkqxxN6uW3dyPtu3eKWO8f0XtwfmX9fzlWRnbhdz3zB2XKf0ub65tl1bxJYNLFe0
 NjdA==
X-Gm-Message-State: AOJu0YxOq9lFkTyxppSQbnEtPd0DGxOCEE37k+q9OubQDpTdvcmOhfkR
 bP7Hk7pddfhS0iXoqZTPQZT2aOX7yRGXF3guQNU=
X-Google-Smtp-Source: AGHT+IHcKCx5USn77zL05BxsOkshdp7xTWT7ZqHVyYtxBGR1EAVLz3fYDKqQLlEwbVXr92ZUxqLWh+TbgepoindMvfg=
X-Received: by 2002:a1f:a6d2:0:b0:49a:b737:4df7 with SMTP id
 p201-20020a1fa6d2000000b0049ab7374df7mr19389713vke.5.1699229563107; Sun, 05
 Nov 2023 16:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
 <CAKmqyKNdRzBg_Y=K1AKyo3JnVhN2n_XEF4hu6GD8pC+9-QeKqw@mail.gmail.com>
 <CAFEAcA_oriuA5WNEL_XGVHWA-vwbF7_GVqswt0NiwqE4xb4ycg@mail.gmail.com>
In-Reply-To: <CAFEAcA_oriuA5WNEL_XGVHWA-vwbF7_GVqswt0NiwqE4xb4ycg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Nov 2023 10:12:16 +1000
Message-ID: <CAKmqyKMaej_9F4or6MZEGuvME5_RGzD8QBsstEj1PXT0njRVow@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Fri, Nov 3, 2023 at 11:43=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 23 Oct 2023 at 02:15, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Fri, Oct 20, 2023 at 5:46=E2=80=AFPM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > >
> > > Commit f57d5f8004 deprecated the 'any' CPU type but failed to change =
the
> > > default CPU for linux-user. The result is that all linux-users
> > > invocations that doesn't specify a different CPU started to show a
> > > deprecation warning:
> > >
> > > $ ./build/qemu-riscv64  ./foo-novect.out
> > > qemu-riscv64: warning: The 'any' CPU is deprecated and will be remove=
d in the future.
> > >
> > > Change the default CPU for RISC-V linux-user from 'any' to 'max'.
> > >
> > > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > > Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
>
> Hi -- did this patch get lost along the way? It doesn't seem to
> be upstream yet.

It's in my tree. I expect to send a PR any day now

Alistair

>
> thanks
> -- PMM

