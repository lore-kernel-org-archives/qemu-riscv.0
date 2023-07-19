Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66B7EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:11:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvik-0005Bi-Os; Tue, 18 Jul 2023 21:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvig-0005B7-6Z; Tue, 18 Jul 2023 21:11:10 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvia-0005zx-1s; Tue, 18 Jul 2023 21:11:08 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-440b53841a4so1369254137.3; 
 Tue, 18 Jul 2023 18:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689729062; x=1692321062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Obc2e8mtIeZm76dJuZHr9WpI8p+QJVIV33y3aABrFQA=;
 b=GVc2AF1AKGCKwZtuDKnSnVahycfXXqnDlOKNkld14DH6JRtnpeFXpPrUKIM1zYR7A+
 d17KY9ffx2BuQ+lvLyHQAa4V9uHeCK1rOOr3GzhGRAVVZFTn60DMM2E31WUepEnX24tS
 hTgUfd/2PmbokXTnqjlq2vNtEl/WPVdXSI+bkbUNPaOE5SALGf+Z+0g+oj1sd3H4HTVW
 Kd78broqUzB8s0i0nSGkcnkF//3KSt8Q9Xj70JHzeHrsrJj7k5CRwsrSYA0I4cvDZzau
 ufoQVgenfXgbCgH/XU0ScYBirvyzQV7fUW2RYu8Ze4kI6oacn59hvZxF3j8JhXOwxyHd
 3sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689729062; x=1692321062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Obc2e8mtIeZm76dJuZHr9WpI8p+QJVIV33y3aABrFQA=;
 b=RoQ5QyU09Ge1lpAee2LbUkQCxNCrX2lrx1vxS6+mL2N69bhsunSihrYebOFEk7O/Xv
 NAT6AtXjedIYvxaTOIQcUwcLqyRVhnOjdqQ8orWSusYdCagkR6n6w4qooAjcdYYXfExV
 rQ1+nBrna50d3MNPsfy0knqYEq/ggLLQQvi4ihUUsWc4V3KOWabQUZeaImQTsBmyq5IP
 W0YRdMBrAnN8sAeu1coLXgqwZRq10UqbAzhNrVcTl6FFqgtgXF7NKiDL7pE2Y/IKAPi5
 aQ7MDyB98S18YFWwrJy/xf4/zMid/JA7bqfXEwe+ava6zijutZUD8XBIh2UkfXaiUYWa
 M8ug==
X-Gm-Message-State: ABy/qLarYIPSnG/bvp9bk00VgiGb6sHzAJBPAX/bamFh1R5OfEiDxhKq
 QnJOHH85yNfx3vrDtGqEG7D+RFziGlo9Lq2fz0c=
X-Google-Smtp-Source: APBJJlESoP0RUvxyBWBqAQ1d0XT89LqT/QX/pGE5ar0/nSq/9xMB8TFECAdZ3aC6K/0uk1JsncZQba/vgtNG38m/BE4=
X-Received: by 2002:a67:e941:0:b0:446:8f1f:2625 with SMTP id
 p1-20020a67e941000000b004468f1f2625mr6756849vso.18.1689729061838; Tue, 18 Jul
 2023 18:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230717154141.60898-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:10:35 +1000
Message-ID: <CAKmqyKMxgNG1=uWczrBLj_yC_tDMNVDj+sQt-U5Beu0tV=Q68g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, Jul 18, 2023 at 1:42=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit bd30559568 made changes in how we're checking and disabling
> extensions based on env->priv_ver. One of the changes was to move the
> extension disablement code to the end of realize(), being able to
> disable extensions after we've auto-enabled some of them.
>
> An unfortunate side effect of this change started to happen with CPUs
> that has an older priv version, like sifive-u54. Starting on commit
> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
> but these extensions are priv version 1.12.0. When running a cpu that
> has an older priv ver (like sifive-u54) the user is spammed with
> warnings like these:
>
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000000 because privilege spec version does not match
>
> The warnings are part of the code that disables the extension, but in thi=
s
> case we're throwing user warnings for stuff that we enabled on our own,
> without user intervention. Users are left wondering what they did wrong.
>
> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
> robust framework that will account for both priv_ver and user choice
> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
> with this simple check.
>
> It's also worth noticing that this is the only case where we're
> auto-enabling extensions based on a criteria (in this case RVC) that
> doesn't match the priv spec of the extensions we're enabling. There's no
> need for more 8.1 band-aids.
>
> Cc: Conor Dooley <conor@kernel.org>
> Fixes: 2288a5ce43e5 ("target/riscv: add cfg properties for Zc* extension"=
)
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..6b93b04453 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1225,7 +1225,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>          }
>      }
>
> -    if (riscv_has_ext(env, RVC)) {
> +    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> +    if (riscv_has_ext(env, RVC) && env->priv_ver >=3D PRIV_VERSION_1_12_=
0) {
>          cpu->cfg.ext_zca =3D true;
>          if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_RV32=
) {
>              cpu->cfg.ext_zcf =3D true;
> --
> 2.41.0
>
>

