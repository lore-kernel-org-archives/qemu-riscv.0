Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D1FEB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:23:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG8HH-0005lo-JL; Sun, 02 Jul 2023 21:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8HG-0005lZ-TC; Sun, 02 Jul 2023 21:22:54 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8HE-0004bz-Va; Sun, 02 Jul 2023 21:22:54 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bff89873d34so3489478276.2; 
 Sun, 02 Jul 2023 18:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688347371; x=1690939371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRF740pvkTjPn4YyUomuPjqPm+NWFaBR5Nuuxw9suaE=;
 b=sZzttCQ2aFMeuk7Qzxvb8/ctk3BL0j6coXsUhhhCjG4NhHIREn+/97VJ+hl7OSxG3F
 Aa1MUdSfU1WWWKn8kYjOU8fVooQopsh0+VRCQjlG1orSFCZxUuesUzPYZyulQUjCJqZr
 l92XA22clFVvGECLdQG8Ie9qfgl1I3UX0Y9T1uVc5RxR6vbVW5HRUmpRhwt6K6IoMnJR
 Gm3bzOnS2FfrFoeH/5ygtHkXEqKRAm+paQCB9TofUjsOQYza9/ncXTIct/+m691bChfE
 g55Zv9q5NXBF+C21VdaqT+PLTawrGvR//8whU1yY4KI1VHhFCBpRJyda8y0wmcEcu8EC
 myLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688347371; x=1690939371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRF740pvkTjPn4YyUomuPjqPm+NWFaBR5Nuuxw9suaE=;
 b=X9GYqevxFWV+mS3toiJ8iYoq8LZjMN8fNF+G/g4g556OwyAE6SBu2CFLWqLdMxE9Cg
 qvCiRoSe6/+NC2dEhLkCq7wH0yvoXpvBO23OrIVqIU1kDCxtVjjchqs3FkuRbK0/LtdB
 ooiI27ct7INgrJOSubBgCqrxDB9comM2U3OSDB2rj0XMU3dcmZtESjCs5AaZsnpFHrZx
 OE1BeiG9FV+koPJKbgSOGOzg07YWJH7f2u+GG3KGyx7OXnE8k1FBTRM/GJFO1e4pwm7H
 7XXiMm8qSwT+iv9+FbZ46ircMq6zDS0Z+pBnbBWqWyDsfJH79hzuDfhH8pKAIzfg+ZGO
 R+Aw==
X-Gm-Message-State: ABy/qLZFhgHSO0x+sE7wvFjcx1ZqnrnL1PT5U9QkGp3XIt0ArGB6F+2r
 cFkWxDEVFDQ6Acx2Eggn0DBaNRR7tdinYoO0sIQ=
X-Google-Smtp-Source: APBJJlEYfvoyq7nlwsb2Qd+EnEtO+x8RmnoUJdsf3KLdVU8hbVL3wJDxvBrE6UtcPOKcqPjcE1hYTT0Q8ZhcfgSdgdo=
X-Received: by 2002:a25:4d07:0:b0:be5:fa6b:1fcd with SMTP id
 a7-20020a254d07000000b00be5fa6b1fcdmr6540014ybb.30.1688347371509; Sun, 02 Jul
 2023 18:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230620081611.88158-1-philmd@linaro.org>
In-Reply-To: <20230620081611.88158-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 11:22:25 +1000
Message-ID: <CAKmqyKNXLxE=AN-nOt6eMYFMdY1hFQqg3wFh364-pQ26xTeTaA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove unuseful KVM stubs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, kvm@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb2a.google.com
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

On Tue, Jun 20, 2023 at 6:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Since we always check whether KVM is enabled before calling
> kvm_riscv_reset_vcpu() and kvm_riscv_set_irq(), their call
> is elided by the compiler when KVM is not available.
> Therefore the stubs are not even linked. Remove them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next?

Alistair

> ---
>  target/riscv/kvm-stub.c  | 30 ------------------------------
>  target/riscv/kvm.c       |  4 +---
>  target/riscv/meson.build |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 target/riscv/kvm-stub.c
>
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> deleted file mode 100644
> index 4e8fc31a21..0000000000
> --- a/target/riscv/kvm-stub.c
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/*
> - * QEMU KVM RISC-V specific function stubs
> - *
> - * Copyright (c) 2020 Huawei Technologies Co., Ltd
> - *
> - * This program is free software; you can redistribute it and/or modify =
it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2 or later, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOU=
T
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License alo=
ng with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -#include "qemu/osdep.h"
> -#include "cpu.h"
> -#include "kvm_riscv.h"
> -
> -void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> -{
> -    abort();
> -}
> -
> -void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> -{
> -    abort();
> -}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0f932a5b96..52884bbe15 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -503,9 +503,7 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>  {
>      CPURISCVState *env =3D &cpu->env;
>
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> +    assert(kvm_enabled());
>      env->pc =3D cpu->env.kernel_addr;
>      env->gpr[10] =3D kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
>      env->gpr[11] =3D cpu->env.fdt_addr;          /* a1 */
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index e1ff6d9b95..37fc2cf487 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,7 +22,7 @@ riscv_ss.add(files(
>    'crypto_helper.c',
>    'zce_helper.c'
>  ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: file=
s('kvm-stub.c'))
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>
>  riscv_softmmu_ss =3D ss.source_set()
>  riscv_softmmu_ss.add(files(
> --
> 2.38.1
>
>

