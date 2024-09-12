Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30033EE645B
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:15:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soezL-0000f8-3s; Thu, 12 Sep 2024 04:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soez3-0007w4-9O
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:15:24 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1soeyz-0005Pn-9P
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:15:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e6649so673293a12.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726128913; x=1726733713; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xkRilJv4e/a1Ti2tuyYvCRNcUjVu4CEYZbKytwNv5Kk=;
 b=mUGobJ/wLMy1uhShg1GFPVowkD40ivgReV3zw9I1I0Cz8C/oXL8g724NlcSAnSk0SB
 8c/4iQnacOblDTsdQJbv6wPuIOuoLY2dRz2rdUO1HUpZKzq2fiEIsxeJTWu/sqsikKqm
 Jx6BD1BsEV6R+s4joiGk7mX1FmVNI4WiGyl9WMCiWqRz80Y6OPKubP5P6+2iR0rXA3ga
 h+ouqgXKD7xDeIMxbfQWSisFKsWa17tpfQeki1VcPm2SQ2R/jyI9VSbtLJoJ+cb3vfBh
 2gPOXs6rxnw+ZoeHpw1/QR9P+G6AEmaJhZKG48OIaUVDRnocvWybbF2HPD7+TX28+ado
 EZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726128913; x=1726733713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xkRilJv4e/a1Ti2tuyYvCRNcUjVu4CEYZbKytwNv5Kk=;
 b=J5iy6+BAq7bH9o8QSgGm6IYakjr60ZNvp6DXeH6pu9H38Adm9FTdmZ0kk41nQwUBU5
 Saq5sRUa6yCIzMlmBwgDDmOtTTWPMEMmTEgapit+GI6jY9FUvRTvl4YeNUaQQgd88mDv
 Tzdq69z0Qb/Nn7DTvduQ5yMPWFYznLZgQUo+OcPPA65JIwxwYTNEfv3sH3Hz7dODTbgn
 v8xDbWQG5ZI/DTgOwWYYWNgJu+mNlcUG6rS2WH5lddmH7/sIGWKzQd4epidd8rome8uA
 HwiUhewBe2I4PRep17Sgy1U1NKUyxMLrgu/vnu2egYqO33/c5pDK9CC9zIZV5oPClmal
 l21A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvgqaz/JcSAn1Oqfm2ulhjt/GqOus9D+dk767ixnyaJgkW4yEfReLHaRsx0zCb+dEMvSx0e5LuXY/y@nongnu.org
X-Gm-Message-State: AOJu0YyXsyxM4iT9mljp/jSt7OdbxugtbUQM5sqLne9KYhmA9n9uMDSH
 leTb4chRfPKCFfoE8axYl8muBibJ26Eam9K83GP+7jKR4DwYN7e8+3FMukKbwgKGHEg2HJs9Atp
 xmKR0GMfAI2dztydxej4tBEpmvq1ZkVfWaXw5nQ==
X-Google-Smtp-Source: AGHT+IFO3NV0LLaYtcciD71+ZunIO8XL6pgHJuYTqnYNVAC5lyMjqn/g2JpUHpOLEaMhXQwg7g9ULHXFD83SPIJskBM=
X-Received: by 2002:a05:6402:3553:b0:5be:fdc0:e704 with SMTP id
 4fb4d7f45d1cf-5c413e1222fmr1299604a12.10.1726128913150; Thu, 12 Sep 2024
 01:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240911131900.179648-1-s.makarov@syntacore.com>
In-Reply-To: <20240911131900.179648-1-s.makarov@syntacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2024 09:15:02 +0100
Message-ID: <CAFEAcA_RsAeh-9bAkAX0heMb1PcqqbVe4m0FPDhq8KqiKE9YDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fixes for standard conformance
To: Sergey Makarov <s.makarov@syntacore.com>
Cc: Alistar.Francis@wdc.com, bmeng@gmail.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 11 Sept 2024 at 23:30, Sergey Makarov <s.makarov@syntacore.com> wrote:
>
> *** Patchset goal ***
>
> This patchset aims to improve standard conformance for SiFive PLIC
> implementation.
>
> *** Testing cases ***
>
> Currently there are no automated tests for these changes, but there
> are several test cases, with which these changes may be checked:
> 1. Zeroth priority register can be checked by reading it after
>    writing to it. Without patch its value would be the same which
>    is written there, but with it it would be zero;
> 2. Trigger call of `sifive_plic_irq_request` with level 0.
>    Without second patch it will clear pending bit, but with it
>    pending bit won't be cleared.
> If anyone knows how this can be turned into automated test, help
> would be appreciated.
>
> Sergey Makarov (2):
>   hw/intc: Make zeroth priority register read-only
>   hw/intc: Don't clear pending bits on IRQ lowering
>
>  hw/intc/sifive_plic.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

When you're writing cover letter and patch subject lines,
please can you make them say what part of the codebase
they're touching? This cover letter doesn't say anything in
the subject line that would tell the reader it's about riscv,
for instance, and nor do the patch line subjects.

This is helpful because people scan subject lines to see
whether the patchset is something they're interested in
or not.

thanks
-- PMM

