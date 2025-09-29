Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AE8CAC5B9
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 22:35:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3MSd-0001nT-BD; Mon, 29 Sep 2025 18:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3MSa-0001mq-Sd
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 18:35:09 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3MSU-0003Py-0G
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 18:35:08 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso352608866b.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 15:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759185297; x=1759790097; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jtr24F54A7vAg6tDCIn3Tg59LbtqoA7RE5vVwINhI7M=;
 b=Ih03sHsWKsq2JJFgjUQwY6PotahvS7EVfCiIejRFO6mJpjc258SQ0kMtVk441OmnwI
 plPVJzA24aKHg22JEdqbrehzTVXqRQU7ZAHhG2MLNNMQgZVJ1PVfZJ3rRzWlqX/A4ycY
 Blc8RN+6mzxVmTEAt2UXkNtPuCjqqbfOeg51Hgqn3ME+iVi3jZwTfNyFkpKYK1Su9boh
 kHGG18BJrrlGRk45lHlwCpf/qkAYEEE+a1eRBjGshfrqaRFV/q1mf94A5IYN45c+TO7s
 giDelCFq9Zfkde+HrUB+EuhrQJBKqZZWjVo15rkop6SVUXU5oi4P/SmKybCAHQCGJkXW
 Yj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759185297; x=1759790097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jtr24F54A7vAg6tDCIn3Tg59LbtqoA7RE5vVwINhI7M=;
 b=Eiz9wq5Ryv+jixsF9awhvP6xyBMPnwelQS+82vPrlzjwc3o8fcVUGrFlpDwxAm5N5c
 bJSTRj55e6hhtfsZjHynHRuexhJzjn6AIca0mCWmNz8BLbLLrGFpqJgccVJjxEQIOpH6
 dFaIwhjBWS7tXh1PUaIQXRjwzIIVncYFP/Q3++s81KdgnnjC/yROMsYL6fbseokO6RzQ
 HXuTLy+KQnVep46p9YB4UDB9OJoH8Do0NCukozkECqjF+8jwUIlarnR5epJGzLmgtTey
 MTj3WhqLwSOWYZQYNb6epBMcOS8Pjab8hJwT1HKvvJl66UUcr0k8xKwlS5ur/aWXU5uG
 iLjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/5RlB8lkYzsCz5VGEjKvLtd9hojbiNw8E+2OxpZRObdhdOnNHpV0rTO8ncjqLyv3dtUY8DZOWLLbF@nongnu.org
X-Gm-Message-State: AOJu0Yy7nLDFTgoqgE3ratiNXwl2Svx5aweeg66GR9F2eoL7gAmiVaFU
 gbmzdgaOqjQL1aScFRW/Z7qAGniFrpz8pq4gqrNY+bnonumVDpXZ6rxUk4i1tR/1zva5+Jpj0Pc
 pafkD68+4yksknN0hJqeNmPBkQOqTHnI=
X-Gm-Gg: ASbGncsOHm8HE0BG2vTrCHZ+FEjXyI181e2J8dnsh+CTE3hkew8ir1zn475h7VvNyXm
 r5s3WEGbTCnX77f7XaSUgna2ce5XGVGVGDgGSvd4Dutjin7QLtg18RKIaftTZrEu2bAdlTyN/fk
 znpSgfYQXSle6wl97AB54GFVi7AXB6BOlHI+l+mba/07u1CGlPmHio3HcB9RKRtRJyd+WLkAwut
 LT42cWLd5npr6N23ax4Z0+oB44w2WHSaOa9+4SQ0OP2Fmjb
X-Google-Smtp-Source: AGHT+IEEHNvUYHuehQKhkrw6kVKqMbGDXcfldvPoSyKSI6ViEv61yLp3J4mj+KKUDFONWU9J5R5r4JaRAgtYvJCiX7Y=
X-Received: by 2002:a17:906:f049:b0:b40:b6a9:f704 with SMTP id
 a640c23a62f3a-b40b6a9fbbfmr303363566b.7.1759185296332; Mon, 29 Sep 2025
 15:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250811034454.189208-1-z_bajeer@yeah.net>
In-Reply-To: <20250811034454.189208-1-z_bajeer@yeah.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Sep 2025 08:34:30 +1000
X-Gm-Features: AS18NWDaqr6FiesPZK7c1z0Bv2ZO-poCfekApkDTmh4kr4qJK32swlpZ7bzhkKM
Message-ID: <CAKmqyKN_asnf6Au8xN0XTdAgEGhUxR6Mi_CUopzDhTkeLYdO+g@mail.gmail.com>
Subject: Re: [PATCH v2] aplic: fix mask for smsiaddrcfgh
To: Yang Jialong <z_bajeer@yeah.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, yangjialong@rvcore.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
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

On Mon, Aug 11, 2025 at 1:59=E2=80=AFPM Yang Jialong <z_bajeer@yeah.net> wr=
ote:
>
> 4.5.4. Supervisor MSI address configuration (smsiaddrcfg and
>   smsiaddrcfgh)
> smsiaddrcfgh:
>         bits 22:20 LHXS(WARL)
>         bits 11:0  High Base PPN(WARL)
>
> Signed-off-by: Yang Jialong <z_bajeer@yeah.net>

This fails to build as there is still a APLIC_xMSICFGADDRH_VALID_MASK user

../hw/intc/riscv_aplic.c: In function =E2=80=98riscv_aplic_set_kvm_msicfgad=
dr=E2=80=99:
../hw/intc/riscv_aplic.c:191:34: error:
=E2=80=98APLIC_xMSICFGADDRH_VALID_MASK=E2=80=99 undeclared (first use in th=
is
function); did you mean =E2=80=98APLIC_MMSICFGADDRH_VALID_MASK=E2=80=99?
191 | APLIC_xMSICFGADDRH_VALID_MASK;
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| APLIC_MMSICFGADDRH_VALID_MASK
../hw/intc/riscv_aplic.c:191:34: note: each undeclared identifier is
reported only once for each function it appears in

https://gitlab.com/alistair23/qemu/-/jobs/11528885170

Alistair

> ---
>  hw/intc/riscv_aplic.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> v1 --> v2:
> - fix calculation of MSI address.
> - In Supervisor mode, lhxw/hhxs/hhxw fields are in mmsiaddrcfgh register.
> - And lhxs field is in smsiaddrcfgh.
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index a1d9fa5085..2dd54cafaa 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -96,7 +96,7 @@
>      (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
>       APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
>
> -#define APLIC_xMSICFGADDRH_VALID_MASK   \
> +#define APLIC_MMSICFGADDRH_VALID_MASK   \
>      (APLIC_xMSICFGADDRH_L | \
>       (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
>       (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> @@ -104,6 +104,10 @@
>       (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
>       APLIC_xMSICFGADDRH_BAPPN_MASK)
>
> +#define APLIC_SMSICFGADDRH_VALID_MASK   \
> +    ((APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> +     APLIC_xMSICFGADDRH_BAPPN_MASK)
> +
>  #define APLIC_SETIP_BASE               0x1c00
>  #define APLIC_SETIPNUM                 0x1cdc
>
> @@ -409,13 +413,8 @@ static void riscv_aplic_msi_send(RISCVAPLICState *ap=
lic,
>          msicfgaddr =3D aplic->kvm_msicfgaddr;
>          msicfgaddrH =3D ((uint64_t)aplic->kvm_msicfgaddrH << 32);
>      } else {
> -        if (aplic->mmode) {
> -            msicfgaddr =3D aplic_m->mmsicfgaddr;
> -            msicfgaddrH =3D aplic_m->mmsicfgaddrH;
> -        } else {
> -            msicfgaddr =3D aplic_m->smsicfgaddr;
> -            msicfgaddrH =3D aplic_m->smsicfgaddrH;
> -        }
> +        msicfgaddr =3D aplic_m->mmsicfgaddr;
> +        msicfgaddrH =3D aplic_m->mmsicfgaddrH;
>      }
>
>      lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> @@ -427,6 +426,14 @@ static void riscv_aplic_msi_send(RISCVAPLICState *ap=
lic,
>      hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
>              APLIC_xMSICFGADDRH_HHXW_MASK;
>
> +    if (!aplic->kvm_splitmode && !aplic->mmode) {
> +        msicfgaddrH =3D aplic_m->smsicfgaddrH;
> +        msicfgaddr =3D aplic_m->smsicfgaddr;
> +
> +        lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> +            APLIC_xMSICFGADDRH_LHXS_MASK;
> +    }
> +
>      group_idx =3D hart_idx >> lhxw;
>
>      addr =3D msicfgaddr;
> @@ -771,7 +778,7 @@ static void riscv_aplic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
>      } else if (aplic->mmode && aplic->msimode &&
>                 (addr =3D=3D APLIC_MMSICFGADDRH)) {
>          if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> -            aplic->mmsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
> +            aplic->mmsicfgaddrH =3D value & APLIC_MMSICFGADDRH_VALID_MAS=
K;
>          }
>      } else if (aplic->mmode && aplic->msimode &&
>                 (addr =3D=3D APLIC_SMSICFGADDR)) {
> @@ -792,7 +799,7 @@ static void riscv_aplic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
>                 (addr =3D=3D APLIC_SMSICFGADDRH)) {
>          if (aplic->num_children &&
>              !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> -            aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
> +            aplic->smsicfgaddrH =3D value & APLIC_SMSICFGADDRH_VALID_MAS=
K;
>          }
>      } else if ((APLIC_SETIP_BASE <=3D addr) &&
>              (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
> --
> 2.34.1
>
>

