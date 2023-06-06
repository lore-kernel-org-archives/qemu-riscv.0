Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12A4C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:56:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Z2L-0001tj-NP; Tue, 06 Jun 2023 11:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Z2L-0001tX-4R
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:55:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Z2J-0004Gi-7w
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:55:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-514859f3ffbso8925913a12.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686066953; x=1688658953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnVLBSJrJkvKjIoaRlPQx57i/kQrByoAelFL0S3N/cY=;
 b=k30HaP4JXPvU/eRC1ECNiaPxM1Bm+1LcHRVwTB/IFrUhkJdo17OaN/81hid26PuGd0
 JczfFnWeXsqdIpgh+jULOs6ZsHoL0CXciGM82L3f+9FfNCAQw6a/5UYzvup72VSGW7ER
 s9rDwNCcZK7LEO1MznYiK3V9IzvuGreX6pXRuhWbZ7AEQiew3Tf6mWfshVFBP88eGmUY
 XzNBVrwHK155n7e5OQgbMAo8x4MPxtWdvFE+ZUZMFfBxOTNmVZcyrOntXJvNKTRnRejU
 CzoCJtRSOfTMWPXasgT8K585rtIFaeqzqCxWTRLS82JwS7W4qdizUDHBkrZRrvp1nYVV
 IEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066953; x=1688658953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnVLBSJrJkvKjIoaRlPQx57i/kQrByoAelFL0S3N/cY=;
 b=WSIv5EywYE+W8n8bAMYWrREESOJvl4aoh1JWjvoYNa11wJH4kwnvJ5T43jOY/SMnSU
 NBOnA1lPRs1/Vs+LN6Ypvl7lUltaNFxe207H4FAYsfDwAIOY+Uz1R3vm7HeWVlAeJQRW
 Tf/ZXag04N61dDN3yXHPmjtQgxYz7JILb524sHjhtT/fEflwMU9XRkPL1U5fAOLtcZ3z
 mrYfnBQxphSJhhPcitjzehTKSNExWrgXcOTCoPm8SHqSG/Pcb3DCmQLWFoWvYK8T1Ei1
 hunwB+qj/dhCBVQKnlzbkQ5zWdKGA/Sy6v9lvY8wQ4R4/bUM6elfBEF5AII94ONXOd1O
 ZWyg==
X-Gm-Message-State: AC+VfDygo9E/eDOiYUxvYil5Xezu5zJH69m1+dk3ag4Mw469Alkhd+TE
 JYHT8x6bV99JPs3Bz3H9cNpTNlFGDgOO7AE5UVe9dA==
X-Google-Smtp-Source: ACHHUZ4R3cC9mrbWs7pTCm1g1yhZ0xmDKHWDO7ayRZ9UpBeqixj75gbrIEtOK+fSUdxb+QpFlVA83ULTN3SF+ikxeXM=
X-Received: by 2002:aa7:dcd7:0:b0:50d:b16d:d21 with SMTP id
 w23-20020aa7dcd7000000b0050db16d0d21mr2089415edu.3.1686066953660; Tue, 06 Jun
 2023 08:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
 <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
In-Reply-To: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 16:55:42 +0100
Message-ID: <CAFEAcA-Cy=fG0PZs2_O0cUrFHw65Tw3EzDEWPAKFg3ffs0a_FQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 6 Jun 2023 at 16:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 6/6/23 16:37, Richard Henderson wrote:
> > On 6/6/23 07:12, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Since commit 139c1837db ("meson: rename included C source files
> >> to .c.inc"), QEMU standard procedure for included C files is to
> >> use *.c.inc.
> >>
> >> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> >> about includes") this is documented as the Coding Style:
> >>
> >>    If you do use template header files they should be named with
> >>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
> >>    being included for expansion.
> >>
> >> Therefore rename the included templates as '.h.inc'.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > FYI, after yesterday's tcg pr, we can do more than this.  These
> > fragments no longer have to be all included into one common helper.h.
> > Each translate-foo.c can include only the helper-foo.h.inc bits that
> > they need, and the bits need not be visible to the rest of the front en=
d.
>
> Don't we need foo fully converted to decodetree first? Otherwise
> generic translate code can call foo helpers, so needs their prototype
> declaration.
>
> For example in translate-a64.c handle_msr_i(SVCR) calls
> gen_helper_set_svcr() which is declared in helper-sme.h.

That's unrelated to decodetree -- the decodetree conversion for
that instruction still has code in translate-a64.c which
calls gen_helper_set_svcr(), it's just in a different function.

https://patchew.org/QEMU/20230602155223.2040685-1-peter.maydell@linaro.org/=
20230602155223.2040685-6-peter.maydell@linaro.org/

thanks
-- PMM

