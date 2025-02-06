Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F6C02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg4BX-0002Ct-Lb; Thu, 06 Feb 2025 10:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4BK-00027N-Sk
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:52:49 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4BH-0006te-G5
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:52:46 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e573136107bso901495276.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 07:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857159; x=1739461959; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
 b=saz22xorWG+9KIYeHMBgHo+3beIDjPP3O1N7z1r8RJcSOqk/1TSa5AdExeFgecMAW2
 SetwIrPXO5PelPFktjJHrhMMxyjos9ktReL5zwz3NYhat5nOKbmFQlGiJ+jm8wrbYJ8P
 cWI6zGSMQwfh5jpoqp2TxWoNdSOXMq8s3rvkj7XTXiEukuqm/rhPZP2HZWnV/bkGyr29
 f3M+nTl3lyTsltjLdvRPOv1/Ro6N1PrgSX7tpgr2ulmRrBVuGYblDZqZ9azb0XvdUQnr
 m2LDaT0gEkEzVsOAjrT9KWLb7jV3sxJ+oJEp8u7XNEXkCvNPp+sDCm3LBYXcx+cT1cX8
 ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857159; x=1739461959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
 b=n74ZbQeogUcxclEyPqlhi95tLmqJ+WjWzE4/Oz4P9Ep7oBnr4tEFF/RwImgsgzjg5t
 nOL4d/tSQtLeI0SzJwPXvirISb5ZRwd+PWAAk46tEjkJAiUXe07hSsuYUJWnGSZCOO5i
 JTEQf3iSxOL8kPiCX9ldfta6tbEFW3FDB8NawZpA/scI6kXmXKBiZ0XHpkVxQ4jZ3on4
 N5d3ElqWz8gQAqKvLW/bxs+IXIkBHNTL0H65fXCeavGp6uElrmTGnOeMh1/tVwH4YBpo
 SYc74MBNQW9YJD46NYoCfSAYizhL6HpMsByuReOLA3wX9vzi0SCY43ENXYLYihU1GPVV
 gS8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIvyJdbKi1N92E6LmPbq1uL61zOwQtzgy8zBx67bFUAAv9tEb+hLM3YYC4Cn0tDWSAjBOTu4YgKq1I@nongnu.org
X-Gm-Message-State: AOJu0YwHXrDjrsGmpg5NO/YOKtLxCic5iNrnf9Fr5O4rCtLvXVlCvK+B
 8Kio4JE3dT1LFqM7QqbnzspnQ797ARflENUjGAZoUTWVH7cEczIdSz/tv7Vajapc9W2MvyIeI/u
 tL5Qm5bYrNZ8Jy4hu3u3Oux51A9POPtNv4bz9ew==
X-Gm-Gg: ASbGnctB7bLYlX0seM8wpiWErXGBxHoXWmZJUxHMb0ndiAnZzfa6DMjanGky7zI8KBu
 vI5bLXZjHuvtwtDYUrFFD3MgpoG9aUTRvj8D2EkJe1N71kRjOMDzFiPFp7PlaPkGqolnChn2LYw
 ==
X-Google-Smtp-Source: AGHT+IGINeWTSKbjmfoPs4JgPVdgMOggbKB4BYTLBGiV0ephLv9sPQFpHMENgqCDe7gKGTrcm7ROiGqMd8iBtYFmdt4=
X-Received: by 2002:a05:6902:1087:b0:e54:ab05:4505 with SMTP id
 3f1490d57ef6-e5b25c0957bmr6324767276.44.1738857159185; Thu, 06 Feb 2025
 07:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-7-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:52:27 +0000
X-Gm-Features: AWEUYZnAPSByxpRAMEhM1UO803j7aoDYdB1KX7S44_DfsCu2bJkbx0AXWGbu_is
Message-ID: <CAFEAcA8ZcYtD44h1VupTR+Ka30D+HY6H+n-DnTW9muhy7_u6NQ@mail.gmail.com>
Subject: Re: [PATCH 06/18] tests/qtest: tighten up the checks on clock_step
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 3 Feb 2025 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It is invalid to call clock_step with an implied time to step forward
> as if no timers are running we won't be able to advance.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

