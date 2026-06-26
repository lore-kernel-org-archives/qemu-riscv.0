Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B8DCDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcuck-00036P-0u; Thu, 25 Jun 2026 20:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuci-00035d-1a
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:40:49 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcucg-000538-EV
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:40:47 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-697f6c67028so779007a12.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 17:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782434444; cv=none;
 d=google.com; s=arc-20260327;
 b=k+kknpPb8kbJ7tT+E8ifZFigPFKqSVG+Qj5lGBN4UjqYbYbRJatWHcjkf6Jk1JknvI
 gnJP/SYh5xnN1WiJ0cFeuq5IVMp1pGUKOVqKi2MKvoJZLhLUA/sju0qYGoGsr1krk54X
 vQe8AT5SFWHpxGi7dDuCL8I7WDUBBwNr1wUMxTVxaeDuxHzRtxlCwsMOQaLfnEF7N6FE
 suUBwqYFKHMpXVYoht3bXZiNkTkj9K0sYM7rsE4EPlqoITTxT3ftPHN6Np7vfVj3+S/Y
 1FRAIWK+8Qc3DxoaRruu6sfC+9dATE6SYydXdh6GRnqqVDlfKEZo7a52VYERv6NeEEYz
 YXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N2qhV9Y+dxse1YUCKotDbk0zHvgvCc4B+P1JS5wdTYg=;
 fh=zdK0s+mV/n67ZvIrcviI4ONkMgba3td6gFiyndqtXVY=;
 b=e1SrU2acBi9/E+cyAP0jovsZv7d+EtD8TzKyqikh7Vs05Wp59233kmaEU0dPgUNNl5
 jiAOaAeACNT3D5rnO/ZhgXKbdrgqQHgtl4eC74MMqbleYs2Gaka1SEaJ0uRqBZqkOmah
 OoxOGeHMM7pI8N7KOjXB+SINv0rsMIRRyoePoAUzSLXaX6Vrrl299qjQdlWHupDn//3X
 +MxWi9EfdlQd3zZOEqG3sycVadcb+8iJMHz7tSZrxIjSmgY8UmsDdPAvGnNmEQ6ZbGks
 B96/0h0cPgi+oigLO0+zuZcp8MitovesjsJtrDd8o+G82406/0bwBTtVK4XB9qQim5Lp
 wQGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782434444; x=1783039244; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2qhV9Y+dxse1YUCKotDbk0zHvgvCc4B+P1JS5wdTYg=;
 b=a3Vx+tN9Vsv72H6+anahMlneHdouQxUIjJRgyK+YBqxFNMLliMk/fzQPbAty3uPyAf
 47xN3r7ozlqsVErwtify3nZ1X2OjfOE0AiULtZjKJRfGybMafNQhiXlb4iKYrU+RnnQq
 DU1UyPyeJoWA9nWDZtFKNGSVHVfF9QNQWfCI5s3zRVJfX5/g1kt1FeRz1KpvkD0G2dn/
 4tgk4znl1WjSAyTxRnDhImzubw1LVSNteViSfI+izterqbIhyuFST0vKnuMGS18pJnr9
 r5YM+aNCGDM1jdlJlQ8ISIOoJqK6r7eDQgcYgTEGWEGr8TkX9N/s4Ax3Y+Y540xcQ7zi
 HvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782434444; x=1783039244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N2qhV9Y+dxse1YUCKotDbk0zHvgvCc4B+P1JS5wdTYg=;
 b=Ddg34xMLh/EkuYzLscsMLApif9wnwmm1n6VBVG+I0YcZVHkWX/ZATdKBHiYfxLuQpy
 HglW5YjivB3vaVtOoGWoRuAjAheHEDsRRID+xX8pVSRMqwD90MMG0z/LZDGGodmV9gCI
 ZJwBe5Oi4ei/FKKmW5RQT8j74MaZaJZC6U9fdL0CPy3AIPZeQFmNH9iVBUmdEXDhVjL0
 KA9hNtN5KClwgiAfxacOSxD8SEEAGRI9JZ7hi8EHgs8nctgmVnWw4Lw8qchgCAqkY4jD
 ifmfi771ECHNPdeQzY18ydMRBzFAkUIcjpUHBuVKy3OVMYU2LRe6fgJq8lZsqMbt6zY6
 gVdw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLVq2pC3ZWAUgUotdgBFIVy/fouVEdlLwjf4mBxZi/7vSBJBaLTHJfink4vreS39RbnMU8eK/gKJRi@nongnu.org
X-Gm-Message-State: AOJu0YymTnoY7/L6Sfx3IfEBZwIY46YRZf9elEwpa383a7QdH+tppUVi
 2OKZjdPl7U7HqKFLrr7ViCOm7OGeZktm6P8waCe8zNvU8JZqtZz+/kZlx5Yb3Shx6eLH9xQ3jeC
 keQhsjURJMsZDxnSYzTvkGdpir3wKkZiHex1KXaSEdQ==
X-Gm-Gg: AfdE7ckA6ggRWpTM7qE93QDDt05JdRlxko6tL3bIVLzT040lnt7f6U+Rh0Jfyee24yZ
 oTFf19u1IMAbn94rj6PlkYeiYlntzl469e5YWIu9yWerMZWvtpdMjQRt0XPz48hH2dLES+uLZgW
 LbSrOlGWGLvkKMekBVxBVc/8MizE2UQvlMp1N+B6CkH1KxJiKsfFXxUrJg6GSNlKZaVUmq9z4/1
 L/cFGcMDEOLLtxTG8U7gKXbe7sEz4rD+m5jt8lvFpeQpQNhoEwcqu1uVyom8Owme++EER8Pe2dK
 sMCx/vSWXB/2bwh+uT7479WenKM=
X-Received: by 2002:a05:6402:a51b:10b0:698:ff3:85ea with SMTP id
 4fb4d7f45d1cf-6980ff390a8mr475358a12.5.1782434444195; Thu, 25 Jun 2026
 17:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-5-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 10:40:17 +1000
X-Gm-Features: AVVi8Cd7DTvw2za95Rxq6eXcYNIJ0mG2j5KNurcJxaSQ4LlPv5SAZjy6rSL7jXk
Message-ID: <CAKmqyKO9N=DjR2ztfg9bmr551jTo4N4cK5Ktrvvxa6Hz=U11aQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/24] target/riscv: move pmp files to tcg subdir
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jun 24, 2026 at 10:10=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> A trivial header change is required too.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h           | 2 +-
>  target/riscv/meson.build     | 1 -
>  target/riscv/tcg/meson.build | 1 +
>  target/riscv/{ =3D> tcg}/pmp.c | 0
>  target/riscv/{ =3D> tcg}/pmp.h | 0
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename target/riscv/{ =3D> tcg}/pmp.c (100%)
>  rename target/riscv/{ =3D> tcg}/pmp.h (100%)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bdd28d329b..f0c78c1474 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,7 +183,7 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_impli=
ed_rules[];
>  #define MMU_USER_IDX 3
>
>  #if !defined(CONFIG_USER_ONLY)
> -#include "pmp.h"
> +#include "tcg/pmp.h"
>  #endif
>
>  #define RV_VLEN_MAX 1024
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 61874ed0af..42d0f6d538 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,7 +22,6 @@ riscv_ss.add(files(
>  riscv_system_ss =3D ss.source_set()
>  riscv_system_ss.add(files(
>    'arch_dump.c',
> -  'pmp.c',
>    'monitor.c',
>    'machine.c',
>    'time_helper.c',
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index 5684fcf985..a05ab642f4 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -21,6 +21,7 @@ riscv_ss.add(files(
>  riscv_system_ss.add(files(
>    'debug.c',
>    'mips_csr.c',
> +  'pmp.c',
>    'pmu.c',
>    'th_csr.c',
>  ))
> diff --git a/target/riscv/pmp.c b/target/riscv/tcg/pmp.c
> similarity index 100%
> rename from target/riscv/pmp.c
> rename to target/riscv/tcg/pmp.c
> diff --git a/target/riscv/pmp.h b/target/riscv/tcg/pmp.h
> similarity index 100%
> rename from target/riscv/pmp.h
> rename to target/riscv/tcg/pmp.h
> --
> 2.43.0
>
>

