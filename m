Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B37E7D0CE
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:07:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZJO-000809-CZ; Fri, 22 Sep 2023 02:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZJH-0007xl-SZ; Fri, 22 Sep 2023 02:06:39 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZJG-0003kB-2I; Fri, 22 Sep 2023 02:06:39 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7a52a27fe03so778127241.0; 
 Thu, 21 Sep 2023 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362795; x=1695967595; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyPFMSiZ73Nfv8Nbubz6H1oz4HcjtBrp1Ia0PJoJ/Mw=;
 b=YX42cWv4dhkaYKW8t+OBxcqvdJLfXG4n30ylS7pp0rOG116nHGqzwUXZX0GJqak3O4
 YYBO3jQDcRplGVe6Wr7kmvbv9jJo2WMoqX7WhmxYPD8GjhN7bgRRvda4PK9Bd9kFgsw8
 kEZdwZ9C+12RJxn0JqfyKMGK/mSQqKlfXKHKosmE34QCaj6c+Y5G026N0mrYsgqE/Qri
 gRU9cPTne1FVC+q5nA0vkiX0kXWkCjPP8GHr1zBmkLpj8B1+dJGDVt6xnW5pTj7ov7Lz
 764xKb6n7k8X6/VNWupJUtU/ecyL3d8EaQ0jDnLjLjovN0Pg6oeHnEAv4SBp3WpZxQBi
 KvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362795; x=1695967595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyPFMSiZ73Nfv8Nbubz6H1oz4HcjtBrp1Ia0PJoJ/Mw=;
 b=KOSf2Yf+zTjOcTtriQQ72EGuDtxgVAfhlVcw8TemyvDi5AwW7HmXNQoEOL0W456kSx
 E6wCjrPQ+7APFI4NWVmui+pRb4tvUpp1lv/HCVc142HQ5v8W/fwGahLO6eoC8uBIXJ5A
 zKn9hf3fhw6EtFflu89BAdAirwN/P13zi3ij4JHvMBhTrlJLu/b1xvs8kOgEGo130SNZ
 2vUBTMuxYjkzfXg2+vdrbKOCM4B0cc6yoUSvqDUZuQw6CJC2t3CNPWlRyO8WICBVDGHL
 0W3F4q8WSkxLe6BH+/YkLRsLP0x87u9OpJVAfat5ONZPfnD0dxEoBs7rRjhleqIqbQ3a
 K7OQ==
X-Gm-Message-State: AOJu0YxW1dAT55wUwxIUor/Fe0ODdW8hMFc3DF2vXVSJP/KlDt8yPWNV
 SxI/P7y7MwOQcOUOwHJlY5kk91glUBrov9Y+3cc=
X-Google-Smtp-Source: AGHT+IGGBCv/RPnZyqLYfCBJnQoawu/ffsodxGVGmQrXssDPr5D3REiB9RF8wFU0Y06Wc3DC8uZBx8tRZI/L5DGN5Y8=
X-Received: by 2002:a67:e284:0:b0:452:88da:2e1f with SMTP id
 g4-20020a67e284000000b0045288da2e1fmr8535900vsf.21.1695362794962; Thu, 21 Sep
 2023 23:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 16:06:08 +1000
Message-ID: <CAKmqyKOpv3CzESKU5oz7SVWd0_f_e9VXmhr+O=x9LLMuaRK3tA@mail.gmail.com>
Subject: Re: [PATCH v3 10/19] target/riscv: remove kvm-stub.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Sep 20, 2023 at 9:22=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This file is not needed for some time now. Both kvm_riscv_reset_vcpu()
> and kvm_riscv_set_irq() have public declarations in kvm_riscv.h and are
> wrapped in 'if kvm_enabled()' blocks that the compiler will rip it out
> in non-KVM builds.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm-stub.c  | 30 ------------------------------
>  target/riscv/meson.build |  2 +-
>  2 files changed, 1 insertion(+), 31 deletions(-)
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
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index f0486183fa..3323b78b84 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -24,7 +24,7 @@ riscv_ss.add(files(
>    'zce_helper.c',
>    'vcrypto_helper.c'
>  ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: file=
s('kvm-stub.c'))
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>
>  riscv_system_ss =3D ss.source_set()
>  riscv_system_ss.add(files(
> --
> 2.41.0
>
>

