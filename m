Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB3DCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4UGU-0008WP-8h; Thu, 02 Oct 2025 21:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UGS-0008Vn-Mc
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 21:07:16 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UGH-0002VK-OI
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 21:07:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so200056866b.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 18:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759453616; x=1760058416; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUJ1G4B6gGG3DgKRIsukrEL70OmCxl2X+s7iaMTB1lM=;
 b=G1S/AG2GMMR3FToFF5All3JPqCeWFhPqrKALU8RfFZZONbLYHX0MEvQsvmTQ2PJ83T
 EP3/O5ULX1CPDUTFFH6QfEALYz0Jl/+CSRLIW/bIvrTZfKhknoyUJP/yOxEkREBi6BwC
 VDLjfoLWyIoVezbD+22RMJCOg4zTC9yccAPMPtbAlgwDIfZc8vL03soLSkmnqjgDL8s1
 0epJsGF7SyAKahvdUCaEakXQ12cvP9YZ5ntThTzKuhVbTKY41At/RDzBtw8oErTEcqmg
 60TOIbJeLId5ofzXJG9GJF9Q2eIqXioq6mGyqK0BhqiMjRT9FeaFli50zWbMDwP+3X3H
 rOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759453616; x=1760058416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUJ1G4B6gGG3DgKRIsukrEL70OmCxl2X+s7iaMTB1lM=;
 b=NuCO/ixRpAJbwMHV2Mq67nGlXnxx+WmRZLZ3mv4c50Q103czCP7pbx53Cf9h4NuC2v
 w3WNwkuQGqhtHNs9MS1zkg6t3rAHmIEVLU91Oi/oB30itGL0AQrNR+93PMpN9m3jsA+U
 fc0WpWyEbX6/j2HEYk2AVwfKPVx6dUV9eJQ3Ml5/OS+R0dUcKrYR/Jx/xbLcS5538j05
 NUjTxHHllawraort3LVAR9HANlgDY0Dp9h4LlYAYYS7WtSORWupiQivze41fMuPCoHtJ
 LHu4066Enrz7riNjVO5U1ffpP8N7O6Yxasz5pCwZRuZEy7GLkjUw26vwiQAa6QXJPZnF
 tMCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIxEi8pyX6xJP2Eq2m4TMdSnQGH3MDDtVWCC6B5tjPoOhlHQAK0bG7Zf1/6WqrU9KbvOTHL2+lnaQ+@nongnu.org
X-Gm-Message-State: AOJu0YzH8qGx3rSH+cqFqXmuqEwfoLo5ShU2YxWVH2nSqnOpWRkxdC5Z
 Hz2pH30fu8jYrcLVaTRgbDSZ+HXyMQedHTEnMqpgM6QRzTiN5ITpCZqv5q3aood3EWvY2Z/nPrp
 hi1KagJ12yIoLoowjNkJytrijP7lVcLQ=
X-Gm-Gg: ASbGncsh4/SujLOyA8cNLTaA4t1hk6e8TB6qiwUK1S2xj93R9JGWmG8U1QFh8cuHXWX
 j67jzNpVIYyynk4OAu+NNmRA0MUL+IKPO3llpeFwAR8MD37TZ7sX+UpL3VnHUvhqYPPite8z9ny
 hFvh+KE5TiJTrjgR5zXqrHwlKoWL4z2dNuC6apA8pYynCSvKrBFKoXFahE1K8TEWsfEMXnSUwEb
 7iU3lhISa9/k6N759f7Ag4CxaLVd5Kuk+Adla1k0H5GOYfTC+rFP07J2fnGMA==
X-Google-Smtp-Source: AGHT+IFM/7JOB2qMO+pYWbdlGCbGLMS41DxU6Chfnus8j2/3SPPHzhrmm1t2ipiWUOxY2ncUuL7HVeb3DC7BTHdks9Y=
X-Received: by 2002:a17:907:944d:b0:b2e:e87e:ef2e with SMTP id
 a640c23a62f3a-b49c34474b6mr151753766b.39.1759453616142; Thu, 02 Oct 2025
 18:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Oct 2025 11:06:28 +1000
X-Gm-Features: AS18NWBuckVfcsWCLtP_skD8anng53scByzxab0cbxP61calpZ1B1PfLyIjMR5g
Message-ID: <CAKmqyKNvBF5hRjDZKNp1Bs-GecDqCu3inh-1-tsRaA9iyCU0ZA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-trivial@nongnu.org, 
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, 
 vhaudiquet <vhaudiquet343@hotmail.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 29, 2025 at 11:02=E2=80=AFPM Valentin Haudiquet
<valentin.haudiquet@canonical.com> wrote:
>
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
>
> Three instructions were not using the endianness swap flag, which resulte=
d in a bug on big-endian architectures.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
>
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index c77c2b927b..dd15af0f54 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu =
*a)
>  static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_UW);
> +    return gen_load(ctx, a, MO_TEUW);
>  }
>
>  static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_SW);
> +    return gen_load(ctx, a, MO_TESW);
>  }
>
>  static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> @@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a=
)
>  static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_store(ctx, a, MO_UW);
> +    return gen_store(ctx, a, MO_TEUW);
>  }
>
>  #define X_S0    8
> --
> 2.51.0
>
>

