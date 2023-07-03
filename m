Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68297EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:04:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG7yr-0002Tb-7f; Sun, 02 Jul 2023 21:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG7yo-0002T7-2e; Sun, 02 Jul 2023 21:03:50 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG7yl-0000jS-4J; Sun, 02 Jul 2023 21:03:49 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-44358c019ddso1353993137.1; 
 Sun, 02 Jul 2023 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688346225; x=1690938225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kr/csRpj7yRPd+a7XEQy9luDGdTRfuaDwcgbO882Uj8=;
 b=kOhKlHs+rIVwGNY5dryVgpjloNzsE74uqLEH50SI1+QjWy0EzNZs/z6Szie+6igmog
 OaWB5piKPLNyMtmpSVGY77Zf4cT5S8rssJAO2ivGBWZEmvkp//5aMZp6TzXYsNN3m3Za
 iTedvqhwrm0xaf6V6ERCqoGESvdmTcJIiSrdzVL33uYJhHgLKRjzN6WxGVRxUXy2KijT
 jOI5xDUOIhsiW72ztAr0f/vqtinUztpsGSrK6iFL6dibO6Vq9RRDR+UBz27o5d5Vs0p+
 hNe7ebF4NCxiRCHpgpzkZtRMX++j37B5sd5D3vN/2mA9JoUctktxc/cIA/hfGT7HL239
 ETUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688346225; x=1690938225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kr/csRpj7yRPd+a7XEQy9luDGdTRfuaDwcgbO882Uj8=;
 b=d2hHZcEEvSputSRyDzhxTuM2w2ZYkmBJCwVXW+IkOB4pIcVJNb8x2OVW7mDZJlu6GL
 cO8FG7OW46gEkUEfrnyqhWptj9g7y7zVKoyxtV9y+5rsB/IROBjlAO/LQxYc73sRAFma
 0FNn/VGyXS6yLkzoxZhTMesATxN64dcGZ+BmzcjyhxjPLCl5pfWDsdVosYV3cm4eg++U
 GzQR9SYCI6wj4JEXuHjcqZY2sdhcOKl3WrRScvoP7fxoSOg5MLDDQxZX/lV+AKazByjq
 lR8z/IPHoYTQIfp/zGG04t6ARWjoU/wyMEtgTfF3L9R/NfeqkZe+kgz4V8aIq5/Oa5Ev
 qhLg==
X-Gm-Message-State: ABy/qLZxhxhT99gn2CqPgcQfTzTqBvnerqcDxi5rAIMbkF7RyWVpQQrv
 geTUoPVogAQgmpgrBpt/pOQh8dbFeTylZEIYn1c=
X-Google-Smtp-Source: APBJJlEiA/DJ04JzAYoPetRZd51MbkR1pL12E+h/WqOyzTBsiq/7TvFwrnAP3Qm1BvA19qUXYTGTSNpZoG5Upuv9KcQ=
X-Received: by 2002:a67:f981:0:b0:443:672c:2d8 with SMTP id
 b1-20020a67f981000000b00443672c02d8mr4324597vsq.22.1688346224763; Sun, 02 Jul
 2023 18:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230620081611.88158-1-philmd@linaro.org>
In-Reply-To: <20230620081611.88158-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 11:03:18 +1000
Message-ID: <CAKmqyKObAOYmgT54azCgrYt-aHD8V37c1h6KoNBjshASEdvVwA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

