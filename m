Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63156C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:17:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdzgS-0003pY-JY; Sun, 28 Jun 2026 20:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzgR-0003pE-Kt
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:17:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzgQ-0007Qx-4V
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:17:07 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6976b0c5adbso5157297a12.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782692224; cv=none;
 d=google.com; s=arc-20260327;
 b=ntm8hpjguDofJDOzCdgxFGZZYtuoHngkkSikW8cz9NCsdCijjrXjaQjf12NsPCQXjW
 iH4krj8W+SrmsId/AuZZDiyB73jZ31UPIiSKasiKaYKE+kQZdDPnC1yTOi4HZZp5jwkE
 DTaAbrIRRc2A8FCc60mjuqmGqZi2z4eMnLzvL3WwWsy3HQN+mcxmb9xPENbuKzoDN5SB
 AlMNVzoIEY+vvbf2vkt0g9Of+d/OSTXEGxYBzczis8wpzNaBZXWXTdO4xRzQpDYIEQ+P
 PubZ/fIti1Qw7WctYY9LNOhkbdqCm0GEByFFsFVVv8IB6L7pEruSkECFIz+NaZpoCDJT
 UT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TRyPeXcr6E5hSqOSHx3f/68BnkoL+hzcMTZ5s76Hkbo=;
 fh=aSPLvpb/sjV93j9WEDI/iylmc6NqzfhAhr+IzbX+6iI=;
 b=M1B0dX0q6X95QokfNJg1f/y8VdZsAogWq447S5Ym8ducTNPliHosoCUGYnwUyIasVS
 C1N7ti/Z0crIi+pJjb3ZN5PTDOooqXXCWzHJweSoZDh9BQ3iESKlGKlHzR79AO49HB1T
 KPKWjz4HR1j5xiwdWWYkHRY3rzHzrQmAjlEaIAGiXaWpE0/4ckIUXNHUOf2YEoaGlwli
 IFoAEWqhT9flCih3GEESj8jep2kXHRVdo9wFPAeGqrHezKxOq5fdeGDrqREUZBCsj397
 Bm6x4p+4ZUFVqTeHwtUOo9+Ot2bm9yuYmnPMbtFt6dB2ImUH0wwKwtZOH1eIOlh8siBs
 BJcQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782692224; x=1783297024; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRyPeXcr6E5hSqOSHx3f/68BnkoL+hzcMTZ5s76Hkbo=;
 b=NPNn4d+8050LUIdUOCA+QjvShaGxTVlGkBtqrnZxg+0yXE+a+IM/kkH0RBpgHzTlIG
 JDAfOXiqSw4bT8CN3aSAHeGcHqf9ncu6aJ/r4ume3PonYEh6RZzGHXrrSlP6uBhAwx2T
 WE/a3JUHF0p5jL/NDiBCx/yksOjkZFVhcUmDL14/cnuAMHdFMuzx5U5nQ0KsQFjb6kRV
 jCXYIwYj3XZDBJjodt/J290sSbDCbFDGJ5jVRKQgPjAUASzC/1oJgEL4Wc9jdxi2mnpk
 BCPo0ajL5UiF/hHKWNILF9AvqFaftL2WawO6bF7ptsyx2dzNX3nUUm6X9D1UzN721m3m
 8l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782692224; x=1783297024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TRyPeXcr6E5hSqOSHx3f/68BnkoL+hzcMTZ5s76Hkbo=;
 b=KUUn0lrz518AgR3QGEJzosc+ZjzOxD6Ry/QcBi85cP8pZp14g1STBAAh6wAVal+hMF
 A8U56V1BCrcvRw7ezHp/6X8gz9+FVPA6iHpPblM5uEoHNCKYWD7LNFaCcgc7zryo1vNv
 CByIOgCZwNRHJJv2a3HSC3Tiu6KZ1dQfKo01Ebb07huWaPy9mwzcIgtjhiaI7O++LmRz
 bIopOzWVQvAU2A84xHORmNdNwF9x2zTyG/ydQtD9XbfmZzAtvh0VRbkGfrMdQOR5wn1x
 e64GMGjF63bEXyQwFohQsHrFjPbQRzdr4mAf9wqL5BIOF39kdPYIfiYQURCmZlvG5YZJ
 O/Zg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9CmkARoAV/Qj4AqVzQdG4pipl3mElvBp0sJ0cJCiwJmLAFoYO4YGfxRJvJAo1V1nzWM0XGmansP1T@nongnu.org
X-Gm-Message-State: AOJu0YzkDiUbqdKgPnQaTIKfFbwwLE97KYvI9rRmxDn/fZhCqQfG9seH
 Kj3qcZBHU5HAL12hcED2YeGvwddE5zzrmfn/khjErL8AI6RrmIOpbd54tIn2zebuQ7fXx3JKmJq
 iberBDvwwlsQXhanw+7rJ08fJ0qlThLA=
X-Gm-Gg: AfdE7cnQX8bUuAcyr1QrBytHvLIVlk79eS6H10FAE++/Ytak1fKxADwmMFelj+62jSA
 XmXzba4mqzfuubgsIOY9ZQdKaUxnYIJ7hus3wVpusA/t4lBHdJfVdEM4kOvifYV97OLoY3TYbP1
 I6KGAEaGPjt0aZBB6IBLjVxTzX3hFQvAcA6zrq+Ys6WfhOpt8twu0kohHGozYLm0lj0qhvaNRtG
 1bNqP7bOmf8SOFxYAwOc5gh08KHvq/BRQJo9z+mpMqsEGLizF0Gj0sBx8QK+C2W6n2H2ZBCzhGs
 al2Qw1wEaqWUCCtQuLAPGzta2WRUrdDLQDOkgg==
X-Received: by 2002:aa7:c755:0:b0:698:3b7c:7e46 with SMTP id
 4fb4d7f45d1cf-6983b7c8059mr2210342a12.38.1782692224258; Sun, 28 Jun 2026
 17:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260625081521.595683-1-suunj1331@gmail.com>
In-Reply-To: <20260625081521.595683-1-suunj1331@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:16:38 +1000
X-Gm-Features: AVVi8Cf0G-T8EZwZHAfFiuLCOgI65AVLwf9ASqzRBHoxQ1dCoITUQIRo6ZeqvrM
Message-ID: <CAKmqyKPgZxELoTpm32D5i_Q4egzP64UmF0RqKu=1yoSVmz2Jew@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Apply UXL WARL handling to vsstatus
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Jun 25, 2026 at 6:17=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> write_mstatus() already handles the reserved UXL value by writing a
> legal value instead.
>
> Apply the same handling when writing vsstatus so that reserved UXL
> values follow the same WARL behavior.
>
> Factor the common logic into a local helper riscv_write_uxl() and use
> it for both mstatus and vsstatus.
>
> Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index dd9726fcf4..12f1ce5180 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2012,6 +2012,20 @@ static target_ulong legalize_mpp(CPURISCVState *en=
v, target_ulong old_mpp,
>      return val;
>  }
>
> +static uint64_t riscv_write_uxl(CPURISCVState *env, uint64_t val,
> +                                uint64_t field)
> +{
> +    RISCVMXL xl =3D riscv_cpu_mxl(env);
> +    uint64_t uxl =3D get_field(val, field);
> +
> +    if (uxl =3D=3D MXL_RV128) {
> +        uxl =3D xl =3D=3D MXL_RV128 ? MXL_RV64 : xl;
> +        val =3D set_field(val, field, uxl);
> +    }
> +
> +    return val;
> +}
> +
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>                                      target_ulong val, uintptr_t ra)
>  {
> @@ -2058,17 +2072,8 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>
>      if (xl !=3D MXL_RV32 || env->debugger) {
>          if ((val & MSTATUS64_UXL) !=3D 0) {
> -            uint64_t uxl =3D val & MSTATUS64_UXL >> 32;
>              mask |=3D MSTATUS64_UXL;
> -
> -            /*
> -             * uxl =3D 3 is reserved so write the current xl instead.
> -             * In case xl =3D MXL_RV128 (3) write MXL_RV64.
> -             */
> -            if (uxl =3D=3D 3) {
> -                uxl =3D xl =3D=3D MXL_RV128 ? MXL_RV64 : xl;
> -                val =3D deposit64(val, 32, 2, uxl);
> -            }
> +            val =3D riscv_write_uxl(env, val, MSTATUS64_UXL);
>          }
>      }
>
> @@ -5226,6 +5231,8 @@ static RISCVException write_vsstatus(CPURISCVState =
*env, int csrno,
>      uint64_t mask =3D (target_ulong)-1;
>      if ((val & VSSTATUS64_UXL) =3D=3D 0) {
>          mask &=3D ~VSSTATUS64_UXL;
> +    } else {
> +        val =3D riscv_write_uxl(env, val, VSSTATUS64_UXL);
>      }
>      if ((env->henvcfg & HENVCFG_DTE)) {
>          if ((val & SSTATUS_SDT) !=3D 0) {
> --
> 2.52.0
>
>

