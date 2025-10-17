Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B5CCD183
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:00:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9ahh-0005js-6a; Thu, 16 Oct 2025 23:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v9ahf-0005ia-FS
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 23:00:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v9ahY-0003GN-Vk
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 23:00:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-636de696e18so2812317a12.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Oct 2025 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760670017; x=1761274817; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6oqH2j7tTArZn8KsVhidwMrff2L6PcKwC/ZCSJOMhI=;
 b=B9y1OjMdQ5QLirNjJ8O7PGTUZk8Tp1DACnuyKz5Q8KVvCaUTbdaWhhXeEFFWUVoSj2
 xUBfgLtyFLlxu23hmlWT+owA3N5yvtZbta2YSutlV7qFxqRg2ig7cmJJfnx2tfrMuFBi
 PgaqbBbkW4t0hY5TSBbI35eVlH3TM4oa1f2+bDrhMLwkQiHDai2btMK6k49LHdWiLV37
 +BIAEgyliNGzKz2i9H9q9MFHGHqIPC+jhieN0+pRpwxBA1lAzKjsiOtQvPxK+PdLoDlO
 zQobV3zBNlUjFvE/YiuhHdTLHUiEiSsYsCdbD/Jze7gaR/E2x0HXHL5yZTT1uiOYxn2t
 hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760670017; x=1761274817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6oqH2j7tTArZn8KsVhidwMrff2L6PcKwC/ZCSJOMhI=;
 b=KfsMY+X26t5vOQkyurYyDQhRiimD3gheJBBETEvQBe0POIBZbY2SWG1tJQkV3bNwEN
 JKTewnLXJM85SI1EnrZCIpwiGugVv1ZdJ9/0cYdEjo0V6VM54StZG+AXfbly0aDD0UtH
 9poMnglsA8A7AJtrrJsMavZ0P0I7JuCSeqjaUVb1UPgSGAPJaQjsbk6Cu9iEBOqgY6zX
 7EJnSdDfOvLncBi1flPygAkXzPoFNcmmDW445DHF+Rj/tHNrxb437b5Njq/4hwdxwFqw
 N1ozV668A6OUHL3P5bBUhUWv6gbprwk7HbqoazXtUNrO1wJG58i/8oHrDgRRS48yRyzU
 DOLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzCyEh92X9dxebLWxmjZ+1/+blGgZc/nVcWWdoGs6pj9GTe6fbL1ocEJVS46ymyUSrmq/YUrmRE+Iq@nongnu.org
X-Gm-Message-State: AOJu0YyYiXhW1zCc/pOmYDS+7FnGv9getqg5gF800gviTtl17/aJlBd0
 A+ObmK5+EDp7AGV6pDJ4Oo8C8Sq0515Q1P7lKqZaNlon9tiesCpuXBa1khfek1FB5ETJdf30elo
 jatkN37Hy0b3+i29ptKxUuW2X2GPWftg=
X-Gm-Gg: ASbGncsi+eg5kXFuEAtWkMZfWYxfSEz+iVt4aopEb/1hQMz/pgbF06eXq/OWrPokC4o
 +WqcK3DFQ7cifXLpJaSgQcWmEmGBbSTe6JYAMtx4p/Mg0+UOKdcAlLsI287SBU5D+p8Dh7rbpyn
 19ueRfoSiWwDGy0GjdyJUVKWVy7pKj1//EvedriiREqFTEtz3IeKDYrPguoACmwZgpWewlKM/4Z
 Lfn2g5unIpHhQjKY/ybgEzJb/LKgcyoQ2Vp6A3QtgCSc2BgZAIiTIcx7L1HxiPoo6f60Opi+MQn
 fahiSTxCvTdhbsi5XOFLK8jeeg==
X-Google-Smtp-Source: AGHT+IEoMl5Kokb+3xHt/0QhnYB0pRmSXSb75XJLKfRIcVjeR8mCw0o9yIah4NOnwNsbrgcmpp/9CGMj4sKPUPL4jGc=
X-Received: by 2002:a17:907:9303:b0:b2b:3481:93c8 with SMTP id
 a640c23a62f3a-b647304ae3fmr200587166b.19.1760670016507; Thu, 16 Oct 2025
 20:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251010145621.24961-1-z_bajeer@yeah.net>
In-Reply-To: <20251010145621.24961-1-z_bajeer@yeah.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Oct 2025 12:59:49 +1000
X-Gm-Features: AS18NWDbAUN--_zlw_XP7JrjhhjL60h7vp4kW6MHN-LmDPr3fAm3JzD2AmGzeog
Message-ID: <CAKmqyKPbcv0tio3KgW1AG-MW7d4wVO2a28jUgV+683j3g=B6pw@mail.gmail.com>
Subject: Re: [PATCH v3] aplic: fix mask for smsiaddrcfgh
To: Jialong Yang <z_bajeer@yeah.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, jialong.yang@barrietech.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sat, Oct 11, 2025 at 1:00=E2=80=AFAM Jialong Yang <z_bajeer@yeah.net> wr=
ote:
>
> Signed-off-by: Jialong Yang <z_bajeer@yeah.net>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/riscv_aplic.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> v1 --> v2:
> - fix calculation of MSI address.
> - In Supervisor mode, lhxw/hhxs/hhxw fields are in mmsiaddrcfgh register.
> - And lhxs field is in smsiaddrcfgh.
>
> v2 --> v3:
> - Fix compile error when enable kvm.
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index a1d9fa5085..6dccca73af 100644
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
> @@ -184,7 +188,7 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *=
aplic, hwaddr addr)
>          addr >>=3D APLIC_xMSICFGADDR_PPN_SHIFT;
>          aplic->kvm_msicfgaddr =3D extract64(addr, 0, 32);
>          aplic->kvm_msicfgaddrH =3D extract64(addr, 32, 32) &
> -                                 APLIC_xMSICFGADDRH_VALID_MASK;
> +                                 APLIC_MMSICFGADDRH_VALID_MASK;
>      }
>  #endif
>  }
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
> 2.43.0
>
>

