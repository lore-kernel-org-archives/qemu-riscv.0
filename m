Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91A1EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:01:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvZ0-0007dn-Kl; Tue, 18 Jul 2023 21:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvYv-0007cl-KG; Tue, 18 Jul 2023 21:01:05 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvYs-0006vX-RA; Tue, 18 Jul 2023 21:01:04 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-444c5209861so1765193137.2; 
 Tue, 18 Jul 2023 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728460; x=1692320460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbXknfk4iLdL2FqQJSxUENd0P0BlDzQfMtmr3vrUvPo=;
 b=UMACn5gGz67cv+I48p8mhMPjvK6AXF0BKZjQR0UF3vPh/8WrPwqsjM1QOQ6eNMjYxh
 WIWGcCuilZbDt7uI9ryvizDGkrcGV426BhIMfZh+AsMtenETiR5kcreJf1Aocf4+UYyq
 fANrHdYRGTc73U0E2zh+HGDHxbeGr7SEiAkk0ySO6uTrp2VgSGGAmDd4AYIZO7mj3pLG
 OYSsSE7xCt+Krr2xc7mKfsTSdLfi9Xo+ttHvISoWV1OGiK9gLzgwM3LJRCpRbIusxA3h
 9c6cLtL/uUJMbc0svqycA6FjDocom4aO/gOSekElowErEMQurjsIYKBgo+JNNcKGb7ze
 sIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728460; x=1692320460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbXknfk4iLdL2FqQJSxUENd0P0BlDzQfMtmr3vrUvPo=;
 b=c1Fqi5iw//Db/JbUA54Nohbyd4PEaaa+SXv51Zeg7r9Nk341ma3EZ5d313rUxjYcJ0
 AIMviuXHMFb6XuJwKJBWiZ0GVKC/CPjNsw4MVmHVlQkkMi0d19n/NTqiXYHyN1blMPd5
 YZ/zfbYyiGCqF/j1SNAWx+tpbshzvi/SK/j2XpbnA8HYFuTmBaNFmgzZhgOVGhABM28J
 rR/E3bLM27w2iXGwr+QrC07xecCsn+7bG+szfiTuCEkD0A0RGr5vJpDOlB/4E2OgLaCF
 SEGOGZy53BrPGVRSXlyGJniwT9UxVezx3+lO98c7XN0fmNZAtzMsnVs+X4O2u6wmYfZW
 kFuQ==
X-Gm-Message-State: ABy/qLaIv9Kwlo66h6YPDrxHpFte+9HZAMg09pkTIaSuexsJjoNBWCSH
 tHrLRW97ELdC5BRxoBZjY6aYycsw5e6b7P5DedAftBnqgzKDOg==
X-Google-Smtp-Source: APBJJlG5avgP8NMGWh/9080ufPFKfATL/lxBDx6hFcl4sSvAXzKXes7/wA7Z6S9XZ0IF9jYIHVCAI7FochdEDUoHTfc=
X-Received: by 2002:a67:e3d1:0:b0:445:2154:746b with SMTP id
 k17-20020a67e3d1000000b004452154746bmr2764214vsm.4.1689728460389; Tue, 18 Jul
 2023 18:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-8-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-8-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:00:34 +1000
Message-ID: <CAKmqyKOM0=1OZ0b0uNS=gpA=uQawvEGUx3Emuyyqf5wQkqBsVA@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] target/riscv: Move TCG-specific files to
 target/riscv/tcg/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Tue, Jul 11, 2023 at 10:21=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Move TCG-specific files to the a new 'tcg' sub-directory. Add
> stubs for riscv_cpu_[get/set]_fflags and riscv_raise_exception().
> Adapt meson rules.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/{ =3D> tcg}/XVentanaCondOps.decode |  0
>  target/riscv/{ =3D> tcg}/insn16.decode          |  0
>  target/riscv/{ =3D> tcg}/insn32.decode          |  0
>  target/riscv/{ =3D> tcg}/xthead.decode          |  0
>  target/riscv/{ =3D> tcg}/bitmanip_helper.c      |  0
>  target/riscv/{ =3D> tcg}/crypto_helper.c        |  0
>  target/riscv/{ =3D> tcg}/fpu_helper.c           |  0
>  target/riscv/{ =3D> tcg}/m128_helper.c          |  0
>  target/riscv/{ =3D> tcg}/op_helper.c            |  0
>  target/riscv/tcg/tcg-stub.c                   | 25 +++++++++++++++++++
>  target/riscv/{ =3D> tcg}/translate.c            |  0
>  target/riscv/{ =3D> tcg}/vector_helper.c        |  0
>  target/riscv/{ =3D> tcg}/zce_helper.c           |  0
>  target/riscv/meson.build                      | 18 +------------
>  target/riscv/tcg/meson.build                  | 19 ++++++++++++++
>  15 files changed, 45 insertions(+), 17 deletions(-)
>  rename target/riscv/{ =3D> tcg}/XVentanaCondOps.decode (100%)
>  rename target/riscv/{ =3D> tcg}/insn16.decode (100%)
>  rename target/riscv/{ =3D> tcg}/insn32.decode (100%)
>  rename target/riscv/{ =3D> tcg}/xthead.decode (100%)
>  rename target/riscv/{ =3D> tcg}/bitmanip_helper.c (100%)
>  rename target/riscv/{ =3D> tcg}/crypto_helper.c (100%)
>  rename target/riscv/{ =3D> tcg}/fpu_helper.c (100%)
>  rename target/riscv/{ =3D> tcg}/m128_helper.c (100%)
>  rename target/riscv/{ =3D> tcg}/op_helper.c (100%)
>  create mode 100644 target/riscv/tcg/tcg-stub.c
>  rename target/riscv/{ =3D> tcg}/translate.c (100%)
>  rename target/riscv/{ =3D> tcg}/vector_helper.c (100%)
>  rename target/riscv/{ =3D> tcg}/zce_helper.c (100%)
>  create mode 100644 target/riscv/tcg/meson.build
>
> diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/tcg/XVent=
anaCondOps.decode
> similarity index 100%
> rename from target/riscv/XVentanaCondOps.decode
> rename to target/riscv/tcg/XVentanaCondOps.decode
> diff --git a/target/riscv/insn16.decode b/target/riscv/tcg/insn16.decode
> similarity index 100%
> rename from target/riscv/insn16.decode
> rename to target/riscv/tcg/insn16.decode
> diff --git a/target/riscv/insn32.decode b/target/riscv/tcg/insn32.decode
> similarity index 100%
> rename from target/riscv/insn32.decode
> rename to target/riscv/tcg/insn32.decode
> diff --git a/target/riscv/xthead.decode b/target/riscv/tcg/xthead.decode
> similarity index 100%
> rename from target/riscv/xthead.decode
> rename to target/riscv/tcg/xthead.decode
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/tcg/bitmanip_h=
elper.c
> similarity index 100%
> rename from target/riscv/bitmanip_helper.c
> rename to target/riscv/tcg/bitmanip_helper.c
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/tcg/crypto_helpe=
r.c
> similarity index 100%
> rename from target/riscv/crypto_helper.c
> rename to target/riscv/tcg/crypto_helper.c
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/tcg/fpu_helper.c
> similarity index 100%
> rename from target/riscv/fpu_helper.c
> rename to target/riscv/tcg/fpu_helper.c
> diff --git a/target/riscv/m128_helper.c b/target/riscv/tcg/m128_helper.c
> similarity index 100%
> rename from target/riscv/m128_helper.c
> rename to target/riscv/tcg/m128_helper.c
> diff --git a/target/riscv/op_helper.c b/target/riscv/tcg/op_helper.c
> similarity index 100%
> rename from target/riscv/op_helper.c
> rename to target/riscv/tcg/op_helper.c
> diff --git a/target/riscv/tcg/tcg-stub.c b/target/riscv/tcg/tcg-stub.c
> new file mode 100644
> index 0000000000..dfe42ae2ac
> --- /dev/null
> +++ b/target/riscv/tcg/tcg-stub.c
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU RISC-V TCG stubs
> + *
> + * Copyright (c) 2023 Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +
> +target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong)
> +{
> +    g_assert_not_reached();
> +}
> +
> +G_NORETURN void riscv_raise_exception(CPURISCVState *env,
> +                                      uint32_t exception, uintptr_t pc)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/tcg/translate.c
> similarity index 100%
> rename from target/riscv/translate.c
> rename to target/riscv/tcg/translate.c
> diff --git a/target/riscv/vector_helper.c b/target/riscv/tcg/vector_helpe=
r.c
> similarity index 100%
> rename from target/riscv/vector_helper.c
> rename to target/riscv/tcg/vector_helper.c
> diff --git a/target/riscv/zce_helper.c b/target/riscv/tcg/zce_helper.c
> similarity index 100%
> rename from target/riscv/zce_helper.c
> rename to target/riscv/tcg/zce_helper.c
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 8967dfaded..8ef47f43f9 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -1,34 +1,18 @@
> -# FIXME extra_args should accept files()
> -gen =3D [
> -  decodetree.process('insn16.decode', extra_args: ['--static-decode=3Dde=
code_insn16', '--insnwidth=3D16']),
> -  decodetree.process('insn32.decode', extra_args: '--static-decode=3Ddec=
ode_insn32'),
> -  decodetree.process('xthead.decode', extra_args: '--static-decode=3Ddec=
ode_xthead'),
> -  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-dec=
ode=3Ddecode_XVentanaCodeOps'),
> -]
> -
>  riscv_ss =3D ss.source_set()
>  riscv_system_ss =3D ss.source_set()
>
> -riscv_ss.add(gen)
>  riscv_ss.add(files(
>    'cpu.c',
>    'cpu_helper.c',
>    'csr.c',
> -  'fpu_helper.c',
>    'gdbstub.c',
> -  'op_helper.c',
> -  'vector_helper.c',
> -  'bitmanip_helper.c',
> -  'translate.c',
> -  'm128_helper.c',
> -  'crypto_helper.c',
> -  'zce_helper.c'
>  ))
>
>  riscv_system_ss.add(files(
>    'debug.c',
>  ))
>
> +subdir('tcg')
>  subdir('sysemu')
>
>  target_arch +=3D {'riscv': riscv_ss}
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> new file mode 100644
> index 0000000000..65670493b1
> --- /dev/null
> +++ b/target/riscv/tcg/meson.build
> @@ -0,0 +1,19 @@
> +# FIXME extra_args should accept files()
> +gen =3D [
> +  decodetree.process('insn16.decode', extra_args: ['--static-decode=3Dde=
code_insn16', '--insnwidth=3D16']),
> +  decodetree.process('insn32.decode', extra_args: '--static-decode=3Ddec=
ode_insn32'),
> +  decodetree.process('xthead.decode', extra_args: '--static-decode=3Ddec=
ode_xthead'),
> +  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-dec=
ode=3Ddecode_XVentanaCodeOps'),
> +]
> +riscv_ss.add(when: 'CONFIG_TCG', if_true: gen)
> +
> +riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'fpu_helper.c',
> +  'op_helper.c',
> +  'vector_helper.c',
> +  'bitmanip_helper.c',
> +  'translate.c',
> +  'm128_helper.c',
> +  'crypto_helper.c',
> +  'zce_helper.c',
> +), if_false: files('tcg-stub.c'))
> --
> 2.38.1
>
>

