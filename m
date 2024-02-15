Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52D5C4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 18:55:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ragtT-0004kv-LC; Thu, 15 Feb 2024 13:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ragtR-0004ka-V1
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 13:55:33 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ragtO-0006ME-1t
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 13:55:31 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563b7b48b9aso984553a12.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708023328; x=1708628128; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F18LAjIP/+AmrGXybYek6+l5Qorf3H6geOHINFwOi9g=;
 b=hI9Z9qMbgN83NhJCB1wWaO5+H48U6iTyfUxbupyaKHgxZn7B6HcO7FvCxYE2F3LGFP
 IP9xsppkyRZZhjA/CqrEX2HABQn6/PNtonGDaqKHnv6V2tlXpzcmzJoIO71f6LO2pFT+
 zHdWM3O4eYJ5/wzs7/xrPGfmGL8u9nEsubo9ZV5e7gplgf9W9G33ceaGds0rKVtnNBn+
 TLlqwHXOHkpO+RMBeOYbtphBYOzRQU8PpY0NTpJG6Dkxwsau7QsunqrLmJqxaxf/ZRlj
 lTVQNidqLAN3WSWcBWBIGKy8th0+/gS6DekMCGSBRCjH9a65VN8FC8BVKYmfYffQ8ggg
 3Dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708023328; x=1708628128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F18LAjIP/+AmrGXybYek6+l5Qorf3H6geOHINFwOi9g=;
 b=uP1Jn3kncBf5ADKwTkTyARxy+wwKtHVuBL7hCbQyMMdDIM/PHu7qDzbtirGzsIALBl
 8G1D+5biB44zLKfjzBfC49qjJhTRxtTiqo4jgPGE2FTXPSvE1WTKOZvQIxdW+C19utfk
 6N8l3khffWCufoEQBpjcJlLmK1aXvkPMdSDK4369XdTiN/2UUXyLFpWtnOBDVx0+6eon
 a0xe6Ma6B82N7yElHovId03uPDrddTJbtrq43AKcejYVvGngJ54LezPx1/6RrQ7xGBip
 560Fu5siEL19+t+Wgb/UcJg+4euV2sNpNWZzweZ122GrVLU7E9B/TlM2bnD74oAlx4jt
 ESaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA6NGs8Bf6Mju4xnBB23yjZ/0sY8DAfGLuYXu+CmTWO6H+0hsE7q5N4DsvT/tuvK5a4nOSx5dX1y7fAl1wWWsoJhZmd8I=
X-Gm-Message-State: AOJu0YxXTBsOXW/48BH9KEofl+HcyJQmBKwH7bmY1OtbwrOVSN75ShMw
 UNoTSGEP4zi/4sK+RvsbY6ZBtu28IkGGS6GGHeTW9OnFTDCm1tlImUfWdVLhhFttWc9Ljyb5U6p
 VZE8gfv3H57+y9Ks8DBsLEymIPD5tNNLNCSrk9g==
X-Google-Smtp-Source: AGHT+IEq0Qkm5r5un9hiHON7+vZZA2/AblmKcjpG9rUp4Mrwx+0GnjnFpg4V/mUWcsGKAvO8463DF1KEOzHdy+XJlg4=
X-Received: by 2002:aa7:d14c:0:b0:55e:dcdf:50b0 with SMTP id
 r12-20020aa7d14c000000b0055edcdf50b0mr1857481edo.15.1708023328031; Thu, 15
 Feb 2024 10:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20240215184036.214065-1-alex.bennee@linaro.org>
In-Reply-To: <20240215184036.214065-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 18:55:16 +0000
Message-ID: <CAFEAcA-YowK9nNMrTdyT1i4pt=npn_53PEywoA7uaDMc+z5Y-w@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/tcg: update licenses to GPLv2 as intended
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Thu, 15 Feb 2024 at 18:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> My default header template is GPLv3 but for QEMU code we really should
> stick to GPLv2-or-later (allowing others to up-license it if they
> wish). While this is test code we should still be consistent on the
> source distribution.

Test code, and more importantly not linked against
QEMU proper -- it's all standalone guest binaries,
so we don't link this code with any GPL-v2-only code.

> I wrote all of this code so its not a problem. However there remains
> one GPLv3 file left which is the crt0-tc2x.S for TriCore.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/semicall.h                      | 4 ++--
>  tests/tcg/arm/semicall.h                          | 4 ++--
>  tests/tcg/multiarch/float_helpers.h               | 4 ++--
>  tests/tcg/riscv64/semicall.h                      | 4 ++--
>  tests/tcg/multiarch/arm-compat-semi/semiconsole.c | 4 ++--
>  tests/tcg/multiarch/arm-compat-semi/semihosting.c | 4 ++--
>  tests/tcg/multiarch/float_convd.c                 | 4 ++--
>  tests/tcg/multiarch/float_convs.c                 | 4 ++--
>  tests/tcg/multiarch/float_madds.c                 | 4 ++--
>  tests/tcg/multiarch/libs/float_helpers.c          | 4 ++--
>  tests/tcg/i386/system/boot.S                      | 6 +++---
>  tests/tcg/x86_64/system/boot.S                    | 6 +++---
>  12 files changed, 26 insertions(+), 26 deletions(-)

Of these files, contributions by somebody other than Alex:

tests/tcg/multiarch/float_convd.c
tests/tcg/multiarch/float_convs.c
tests/tcg/multiarch/float_helpers.h
tests/tcg/multiarch/float_madds.c
 Richard Henderson <richard.henderson@linaro.org>
which is all Linaro copyright.

tests/tcg/multiarch/libs/float_helpers.c
 Taylor Simpson <tsimpson@quicinc.com>
 ...but this was exclusively deleting lines

plus a couple of typo/spelling fixes from
Michael Tokarev <mjt@tls.msk.ru> which I don't think rise
to the level of being relicensable contributions.

So I don't think we need anybody else's signoff for this
relicensing.

thanks
-- PMM

