Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE09BEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvcm-0002x6-GL; Tue, 18 Jul 2023 21:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvcf-0002ra-Gl; Tue, 18 Jul 2023 21:04:57 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvcd-000061-7B; Tue, 18 Jul 2023 21:04:57 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-791b8500a1dso1786811241.1; 
 Tue, 18 Jul 2023 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728690; x=1692320690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrW8iA9kapKbgLQ+U8chQg6whUytUweiVRdQblGzbg0=;
 b=la/fvLf4CZY5Bnblwm000OBwX166fksXEG90qSobw4uOa2N/ph6bfCVJOkxnpEgkZj
 wg3YovwMYbC1PQkELtjb/nlqHIekWhOl1pUDxyC5aOnfGdehw0k59/Dp3MgaDNIab1H5
 XrIDV+hPo0Ln3o4PzMu4Cmi1Mp/fAN+Nq0VWS38DMWxd8PMJIx/VsqSCPANgg0OIin7c
 Qg73ZUx4bmfjNg7LKbM9lNH8jArQyMrhuhkYuCJthPBB3HHmUuECPE3IESUg1FqNwMBo
 BlOEUkff3SWmn1rSn5BRZ2huWaubkTiJAcuCd8+daSK/hJJV7F74rSxQw7oJihXRTWY+
 xAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728690; x=1692320690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrW8iA9kapKbgLQ+U8chQg6whUytUweiVRdQblGzbg0=;
 b=fd2NVGiO8V50h9HWCUajidDZ3uKmDR2ZN2TgYKSVUWE0UvAXSpuZdnIxVjHG2W16nQ
 HpAI5/NbIQhc6claRj11tMc4BcSaNf5o7Hap7m3hTn7IdxEvXXRJt6IvTJehZo2GQRC1
 jTLEXqVB49R/kBoa+P+Lu68cvUL32SF2RnPBexYp+502GMwO4dVn/jnxIPwp7QAuga51
 k5RTyQ5Qyl7AnvDwoofgxKYFq1OfIxX2Jpc6529mB6SEFSHjwQyENLEWMUgkAtuV2BQw
 fnuhzDN1ENKNKVGmknoTs41URIrCs2CLmwONcrUGA9nTplUigdMzzmVUu+mKes9s5ix5
 9LsA==
X-Gm-Message-State: ABy/qLYMOYOHg7rYExvFiRXxz8RxUVBu2iZZwMtmJpdkp8rwL1MU1s90
 hIWP5a1098r/j+Mk+521TMqiF28+WFwyGpWwN6E=
X-Google-Smtp-Source: APBJJlEOZsjtuZviXXLw0Vr2tsNCuBMSyS5s/QLMNXTOiARa2/lvHvZVyk4hj45HC78ETJFXqmZBrMDVIfbplt9AYXA=
X-Received: by 2002:a1f:4ac2:0:b0:481:30bb:991f with SMTP id
 x185-20020a1f4ac2000000b0048130bb991fmr435359vka.15.1689728690502; Tue, 18
 Jul 2023 18:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-12-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-12-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:04:24 +1000
Message-ID: <CAKmqyKOoO3Vs4CJTiYETEQMYW1ZegqaU+2tWGj2eGHZy6dyBUw@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] target/riscv: Move sysemu-specific debug files
 to target/riscv/sysemu/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Tue, Jul 11, 2023 at 10:22=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                | 2 +-
>  target/riscv/{ =3D> sysemu}/debug.h | 0
>  target/riscv/cpu_helper.c         | 2 +-
>  target/riscv/{ =3D> sysemu}/debug.c | 0
>  target/riscv/meson.build          | 4 ----
>  target/riscv/sysemu/meson.build   | 1 +
>  6 files changed, 3 insertions(+), 6 deletions(-)
>  rename target/riscv/{ =3D> sysemu}/debug.h (100%)
>  rename target/riscv/{ =3D> sysemu}/debug.c (100%)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0602b948d4..8d8e30d6c1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -94,7 +94,7 @@ typedef enum {
>
>  #if !defined(CONFIG_USER_ONLY)
>  #include "sysemu/pmp.h"
> -#include "debug.h"
> +#include "sysemu/debug.h"
>  #endif
>
>  #define RV_VLEN_MAX 1024
> diff --git a/target/riscv/debug.h b/target/riscv/sysemu/debug.h
> similarity index 100%
> rename from target/riscv/debug.h
> rename to target/riscv/sysemu/debug.h
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 6f8778c6d3..6c773000a5 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -32,7 +32,7 @@
>  #include "sysemu/cpu-timers.h"
>  #endif
>  #include "cpu_bits.h"
> -#include "debug.h"
> +#include "sysemu/debug.h"
>  #include "tcg/oversized-guest.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> diff --git a/target/riscv/debug.c b/target/riscv/sysemu/debug.c
> similarity index 100%
> rename from target/riscv/debug.c
> rename to target/riscv/sysemu/debug.c
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 8ef47f43f9..49cdcde679 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -8,10 +8,6 @@ riscv_ss.add(files(
>    'gdbstub.c',
>  ))
>
> -riscv_system_ss.add(files(
> -  'debug.c',
> -))
> -
>  subdir('tcg')
>  subdir('sysemu')
>
> diff --git a/target/riscv/sysemu/meson.build b/target/riscv/sysemu/meson.=
build
> index 64de0256a5..e902ba2dad 100644
> --- a/target/riscv/sysemu/meson.build
> +++ b/target/riscv/sysemu/meson.build
> @@ -1,5 +1,6 @@
>  riscv_system_ss.add(files(
>    'arch_dump.c',
> +  'debug.c',
>    'machine.c',
>    'monitor.c',
>    'pmp.c',
> --
> 2.38.1
>
>

