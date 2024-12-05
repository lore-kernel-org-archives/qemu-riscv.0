Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4102E7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:48:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJ9ON-0002xE-VZ; Thu, 05 Dec 2024 05:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJ9OM-0002wL-Bg
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 05:47:30 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJ9OK-0005wh-Q4
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 05:47:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d0e75dd846so1128800a12.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 02:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733395646; x=1734000446; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NH3Hzf0fTaq5sduurOl5BPeHl1c9YCnkktK6zCQQ2I=;
 b=Xz64LB/yOjoAGE6Zwf56AYzJ2aYTo4j0ILN/DobEqiyN5TmFKSqgok4a05ePWNpz4f
 l81jTLmeXYV0OtvizUfAobJOAPZsAHp+tUPi5gfWUU57HsxuPAkSuHUF6XuwnVz9xThH
 Te7ghYuJHDBfRJmzVwtMSKlLBsb5vg7ZxMfSdDMlZW6EWXmjO/AYvqAZ366Y0nCaFslE
 h1z/5pUUb9hIRinf9FBWrreS7L0TI8PMA/v+MrrJee3yA59Slv9KlutUMcPlr5v5bd/F
 HDBEGxp8EDVSYrt0/vgcxiw9JwCl4cM0NXC+e/39JLwb8tJeFyv0xTlGiLHw1hfPZ3jF
 BnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733395646; x=1734000446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NH3Hzf0fTaq5sduurOl5BPeHl1c9YCnkktK6zCQQ2I=;
 b=aRAmZP54YRCccGMYEi0Ek1/tR1jYiPYh9+izAK6p3SzPsuRp109GkTmBlzM9RFEKlf
 4wKA5rvdncdBn1IVVAeWuxmlaVCpjtrhXQ1zZ0vwZ5e8xcAsnCBn4HgEUKoJjwmVSevc
 eG3kjXDrmw0g2SowWmV1jdCxOHlSHDpUsCGYpf8+D9Q926IGufrQwMQSvDdDMpyvXWVB
 2EdU6dgINKnHk/Bj4uCsKP+G6IiTXUbJOeO2CT5tmVb5hpe6vic1oaLEvw7VzqnLoNya
 BdqnvaQtWuQ9WnmGaBOn057KRlNLw9OB8/HdHiYU7gUuQTYkhNutMP2+QhcxCdFGSHIx
 Lnlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8t4Bthx8PkXZsWjc+2nPyeAbhMXs/NdvV+2HDUARV8bRIMqL8m2DMMWHNYL5mk3zfAezwW/h0cZn6@nongnu.org
X-Gm-Message-State: AOJu0Yyh8YioKjTH0Mf4PrQfadKfQbtsTFuDuyIXSzEyRnO0kI0oYtBE
 LjBPGhHEEAGtEmIGd/+u1fIVSm+CRxH99l3SK6qqpJwtpFbpTN/Xz7ofRrlfsU6Lyg4AcftAVKW
 ALx7vi1JdZExME4D8Jsv16qGU0p1wF4bXuo8c7g==
X-Gm-Gg: ASbGncuIKS+pe1djbvF6XVSKeHsNzhds0Sfts2sFf6fQzNQt/xIpim390iKtx7VD/wo
 idfnYW35QU8pNir1zQR3qJYgf2y90PVhW
X-Google-Smtp-Source: AGHT+IEGacw3aT/TZjIVQrFpPwXbzlwNn4DbFf4Z9Jv1MBu8W1mGEppwgc1ulFRyiOq6MsS/cwV7AKdTpDgdfefYjHM=
X-Received: by 2002:a05:6402:35c9:b0:5d0:ef55:8451 with SMTP id
 4fb4d7f45d1cf-5d10cb565dbmr10739933a12.8.1733395646283; Thu, 05 Dec 2024
 02:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-18-philmd@linaro.org>
In-Reply-To: <20241204202602.58083-18-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 10:47:15 +0000
Message-ID: <CAFEAcA8Y6PGOJvMwQKykD4jpDjnuVO61xNFQ4k5t=z5ULjv-oQ@mail.gmail.com>
Subject: Re: [PATCH 17/20] disas: Use cpu_datapath_is_big_endian()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anton Johansson <anjo@rev.ng>, Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Wed, 4 Dec 2024 at 20:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Rather that using the binary endianness, use the vCPU one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  disas/disas-common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/disas/disas-common.c b/disas/disas-common.c
> index 7377de0715c..ef91c43449e 100644
> --- a/disas/disas-common.c
> +++ b/disas/disas-common.c
> @@ -7,7 +7,6 @@
>  #include "disas/disas.h"
>  #include "disas/capstone.h"
>  #include "hw/core/cpu.h"
> -#include "exec/tswap.h"
>  #include "disas-internal.h"
>
>
> @@ -61,7 +60,7 @@ void disas_initialize_debug_target(CPUDebug *s, CPUStat=
e *cpu)
>
>      s->cpu =3D cpu;
>      s->info.print_address_func =3D print_address;
> -    if (qemu_binary_is_bigendian()) {
> +    if (cpu_datapath_is_big_endian(cpu)) {
>          s->info.endian =3D BFD_ENDIAN_BIG;
>      } else {
>          s->info.endian =3D  BFD_ENDIAN_LITTLE;
> --

This looks weird, but maybe that's just the function naming?
Instruction disassembly is instructions, not data, and the
endianness isn't necessarily the same (e.g. on Armv7 and later
instructions are always little-endian even when data is
big-endian.)

-- PMM

