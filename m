Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA784EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9t4-0004sb-7E; Sun, 02 Jul 2023 23:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9t3-0004sF-8z; Sun, 02 Jul 2023 23:06:01 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9t1-0000U3-Pq; Sun, 02 Jul 2023 23:06:01 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-444c42f608aso1015067137.1; 
 Sun, 02 Jul 2023 20:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688353558; x=1690945558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WPlvtXBrEmM7uvO8T7AaWYmPcnpnaa7ehTAvcGOgCI=;
 b=LBeWMUjBH65lC5TVa+gLiMZTIrHVpauptraF9oCf4GUwUxERBIZEEuIdpn3zA34CFm
 qYvTLn6REl/bHopka7KQ33pf6CYGlRZSttE5D5cU0wabHuhLP/14jrk906zOtcSWYxmt
 XGSFwwM6JwmWpyCo+PwhZ52E/Mz8Z2fEpa+9FCc+y+pb71KdfSNOtVjvbKQVgZYxPv7x
 XYFJzHs+y9i0susqs+4ooA1yDjJq+nOlH5ntnEl+3WgMpzZlBike+rztER/lQS0xTmn3
 lap4s1Q4y1X6hl6VX0JtmbxES+Nh7BrQC0m31MfHw8N+5+9Li4dn7uYwF58Rzkt9KVh6
 95ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688353558; x=1690945558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WPlvtXBrEmM7uvO8T7AaWYmPcnpnaa7ehTAvcGOgCI=;
 b=Xl1q2dc+CJh1KS3vjbM/vr0UoLQFKp8z+Zh+YAsOFsM/CIk+ZR17kGzOfYjrA1/TgN
 9IHLBd2Yx1Y+8rNPtd/3pTC0yEDw2gVYeiRK5vXuieVUjY98UlAy9VbctfEEBVD4uxCo
 5ZLvD79KOH1nFlZEI2IFOLc7XErKk90RqF20VdUVOmONX8+Qq5ZHbxp6MpCPYU9LaMFT
 VJV6pR16LLY/j0QkFSPogPsCOvU1KBCKCJRGXVObijcAlK3CfxXYlkBD7NSCeS+bXAL0
 TrYDMRHyPViw30Vkjn78rFd9jIosVmwLygIH1WVHGaNpL4u3CKA6hkmbLtvKWGt6ltla
 FhkQ==
X-Gm-Message-State: ABy/qLYf8npJTQ68h+HsSGrHAVtyraBmb239nWs7aCpCl+MVzox/0ujc
 QV0BkK0Afm49UOC6bKhEtoO00dN/Ozhxrzzu3QM=
X-Google-Smtp-Source: APBJJlFS2Tm1PG6LIc7agIsscB42Ld8WgiM+otnlvRiVhfqqRli4dLzDyymh0xIUqHburWmsOfcFHDrA01HIdsAXiLY=
X-Received: by 2002:a05:6102:14c:b0:443:7635:34d with SMTP id
 a12-20020a056102014c00b004437635034dmr3605642vsr.30.1688353558276; Sun, 02
 Jul 2023 20:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
 <20230615063302.102409-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230615063302.102409-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 13:05:32 +1000
Message-ID: <CAKmqyKOs6mfyRh=49Vuu2E1poR8iX1peS4Q7+Oisw-7eeuZHJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] target/riscv: Add properties for BF16 extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Thu, Jun 15, 2023 at 4:34=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
> Add require check for BF16 extensions.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 20 ++++++++++++++++++++
>  target/riscv/cpu_cfg.h |  3 +++
>  2 files changed, 23 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..dc6b2f72f6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1059,6 +1059,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          return;
>      }
>
> +    if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF)) {
> +        error_setg(errp, "Zfbfmin extension depends on F extension");
> +        return;
> +    }
> +
>      if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
>          error_setg(errp, "D extension requires F extension");
>          return;
> @@ -1109,6 +1114,21 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          return;
>      }
>
> +    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmin) {
> +        error_setg(errp, "Zvfbfmin extension depends on Zfbfmin extensio=
n");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
> +        error_setg(errp, "Zvfbfmin extension depends on Zve32f extension=
");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) {
> +        error_setg(errp, "Zvfbfwma extension depends on Zvfbfmin extensi=
on");
> +        return;
> +    }
> +
>      /* Set the ISA extensions, checks should have happened above */
>      if (cpu->cfg.ext_zhinx) {
>          cpu->cfg.ext_zhinxmin =3D true;
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..7d16f32720 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -75,6 +75,7 @@ struct RISCVCPUConfig {
>      bool ext_svpbmt;
>      bool ext_zdinx;
>      bool ext_zawrs;
> +    bool ext_zfbfmin;
>      bool ext_zfh;
>      bool ext_zfhmin;
>      bool ext_zfinx;
> @@ -84,6 +85,8 @@ struct RISCVCPUConfig {
>      bool ext_zve64f;
>      bool ext_zve64d;
>      bool ext_zmmul;
> +    bool ext_zvfbfmin;
> +    bool ext_zvfbfwma;
>      bool ext_zvfh;
>      bool ext_zvfhmin;
>      bool ext_smaia;
> --
> 2.25.1
>
>

