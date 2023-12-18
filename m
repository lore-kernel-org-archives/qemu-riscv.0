Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE47C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 17:54:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFHoJ-0001SR-Sn; Mon, 18 Dec 2023 12:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFHoI-0001Rx-L7
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 12:53:46 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFHoF-00074B-Eg
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 12:53:46 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cc5a0130faso31275921fa.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702922020; x=1703526820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4BzdDFPrhf75errTHXb4mpaqY9VwMWeNx57BtIyNwnk=;
 b=BfZN6afi0F6wqY9Fo2xQ9rgMI8l8971SBOhEDmenxBLoRrSDdu5EouA0PXbeLB86sY
 WqpD6o0ywEj7/lVmoTCOfz2fjGciI3tlP6PbAquhQ1kjbbSos20vkiJCh4uBoSkV8J79
 S/PQ1UZxIW3E5uo29gHUo/lK+OUrPk8x1C5TlpO539mqYqD1mNnRZFsA7rbrxzgYoPiD
 d9a1GS0x/q2sKRGv3g02DLXrUM9QhxyZDERVFg/7IQQnej9VXP1rpvhJ+ROFcz/2WtSL
 nzezUAeInWaYyUrahaGiZoqn+duA7We3AAbU180FO2VY9jCZbaPLt8Yvmmmsd5ipxucO
 UnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702922020; x=1703526820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4BzdDFPrhf75errTHXb4mpaqY9VwMWeNx57BtIyNwnk=;
 b=GF7/GMJc3bZDQYXFPblxBX06X4p5rdTYSAmVuM4q+JpiceA4RBHk8naZ88uDX9vohO
 Ci9SNs38ow51lr5wrjDGCK/HzlM/Ol2V4QFtFgudJjRkiQjaf3Tl7epWhoPRwb47uiJi
 qdcvijfHYhatbHG0+JZ6R810EErKUZ7MrSAJKuLjmLHDDc1jgU855H4ldBS9TM6bHC6E
 Vab1MCwrp9BOjUq/2SzBD0m8cgsEKPoQjnwv4UyrhZ6HCg6iounZQoe1J2iswoTmV9Un
 MhIAJ2zrzdXroKk1J9ZikaSUWMIcHaibavyh0AprCVcRhcX2tpmvough2YskKHRbKgM3
 ewIQ==
X-Gm-Message-State: AOJu0YysOsG/qoiZT78PepvlMFLk83nDBYgmDUEDq4ouQJeNg78QcYEW
 wWpP2/jBELgg2O9+7AvcTgBCePm7HzJRMPiAIDF55w==
X-Google-Smtp-Source: AGHT+IHkhPi1s3/KReiDCX+MtZcSQfiPdmJiVrtB91qPUN2ahWBq0jvO49w+Qwe5EwMQ5MFB5xqbg2LhN8PlIxs6vQQ=
X-Received: by 2002:a2e:3312:0:b0:2cc:5778:eb25 with SMTP id
 d18-20020a2e3312000000b002cc5778eb25mr2093595ljc.15.1702922020535; Mon, 18
 Dec 2023 09:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20231218162301.14817-1-ncopa@alpinelinux.org>
 <dfb9bf4e-820a-4e7e-b62b-8df952099e7a@ventanamicro.com>
In-Reply-To: <dfb9bf4e-820a-4e7e-b62b-8df952099e7a@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 17:53:29 +0000
Message-ID: <CAFEAcA_znj3yGXYB6OsTAwg5dT8kE154ZS=YRtye6dmy0TeKDQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm: do not use non-portable
 strerrorname_np()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Natanael Copa <ncopa@alpinelinux.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, 
 qemu-trivial@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Dec 2023 at 17:22, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/18/23 13:22, Natanael Copa wrote:
> > strerrorname_np is non-portable and breaks building with musl libc.
> >
> > Use strerror(errno) instead, like we do other places.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error msg)
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
> > Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
> > Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> > ---
> >   target/riscv/kvm/kvm-cpu.c | 18 ++++++++----------
> >   1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> > index 45b6cf1cfa..117e33cf90 100644
> > --- a/target/riscv/kvm/kvm-cpu.c
> > +++ b/target/riscv/kvm/kvm-cpu.c
> > @@ -832,9 +832,8 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
> >                   multi_ext_cfg->supported = false;
> >                   val = false;
> >               } else {
> > -                error_report("Unable to read ISA_EXT KVM register %s, "
> > -                             "error code: %s", multi_ext_cfg->name,
> > -                             strerrorname_np(errno));
> > +                error_report("Unable to read ISA_EXT KVM register %s: %s",
> > +                             multi_ext_cfg->name, strerror(errno));
>
>
> The reason I did this change, as described in 082e9e4a58ba mentioned in the commit
> message, was precisely to avoid things like this:
>
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error: no such file or directory
>
> The generic description of the error works well with file descriptors and so on but it's
> weird in the KVM context. This patch is re-introducing it.

We don't seem to worry about that in any of the other
KVM code -- accel/kvm/ has lots of places that
use strerror() or error_setg_errno().

thanks
-- PMM

