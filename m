Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BC5CCD183
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 01:55:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9ZgD-0003wP-9U; Thu, 16 Oct 2025 21:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v9ZgB-0003w7-AD
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 21:54:51 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v9Zg8-0001k4-JS
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 21:54:50 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c2d72582cso68002a12.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Oct 2025 18:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760666086; x=1761270886; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLd5PPbRUJLiYdzVnwiTArQgMNowqM+LGzxtY9gD13Y=;
 b=CmhSh9BW6+yjzY6WBWeXqIx83BL8F/tWmze92vgfyF2nZW08r//rnU9RfLDngdNtQg
 oUUCAelXO7biaWrAZhJnKy324SbaTWRtCMOrhlJMrTGCxjCzKePGbdpNxicCKu3kniI9
 AfEv7DlLfIejyGmJrzNeE8t13hSCIFL8eeVFXRXtCQ/GFtUTFYo6IypipeWVnNj03X58
 uUNtgARYrHhQM0g74/7MzR/pUAq9B5OFQNhQBGiJNbWa6ce/rZFnwvFCCqx6lQ5axuTI
 4xky95rfCWA1okZHUEv6tjgx1DhKfXHeRsh0Ek0McmILaMosIQRZPHr1Qf6N4UAeMOhk
 maZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760666086; x=1761270886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLd5PPbRUJLiYdzVnwiTArQgMNowqM+LGzxtY9gD13Y=;
 b=coz2IU4O8XEG/46wc93voL1k658VIB09ZS55BEyIg4U6UKRoo5v7hEVnOBsZFc7yBH
 ZGBkB/FM41lqud9ZRqwGLp7StJXggft+Gzx/UOXKKYH2bRJXkQNIJ2psO4j47ljDrHf1
 IOLgepAMqAVVakRMQcYUMI4Q7nLNEXKUd56CPFH3Lu72kZ6Obboq4Xt5JjP0VaoYqUiS
 UUFQUpQkH+1deFHPw2YTXz+hPXUBCSjzX1hmOgAWILx/tpB9y+J9cNrgiGJg45g6QLmu
 N6zQeIuLMpmjW7mTe2C3qqVzeHxFFN8dvy7ZAdIxBfRZDA48Ih18RYDMJxjbjJOrW8Cn
 Cb5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQR6E7MfyHOssu0F4AEvKXrEPfV9+KFdiEcEDmU2ml4ptdbQboAYHLrL1QhtWI/ri4vUhnMCroIIc8@nongnu.org
X-Gm-Message-State: AOJu0Yxv/yudNlQpGxUsvDnQhm5zJq9/ZCA0txDI4SmLYKtUQ5wSQg8k
 FDmIooNiWGF92t476mZ4EgInN2rH6xIL0C4UNk6m/xnGxj3A2C5KwsmzdCURDNUAQqoLgvh6YE4
 yWs93R+BHp53ixKVPpZ/AD4+WxtUfJas37Q==
X-Gm-Gg: ASbGncsjD8Qt5iZKMVlO8N5E1rX9zwka8y3u32HJWm+adJmVnxAFp72C+xCsNF4Qojn
 ZF2/OCT6z0Qhdd0mVPnVK9a9DP4Ae31DxZkgrhZBQ4Jusa4f9vHISEeNNFQ8X8bMySWxL9aBsv5
 BY/YVDB9Lv21V7oG8kJ8kM4Itj+sEkEyryrUi0Xm12FSd+QLyJGm5UhNcghNVvHOkQN3dCJah46
 j4dWKgsm/M1NLdyuwFVVfqov9bTuGbOMQUlrk0IhPM4VkbvK6k6h+AE4U9msUN40O9vj/WLL9j+
 ZBR+ZXNinXnTbKoZcq5ZJDAglw==
X-Google-Smtp-Source: AGHT+IGmxQcnDSAjHvqSZ4+eI/P8xqwNFmcD/0jD8hbUlSx5aNSwaUSGac5zW+2KOtrVXcKiQDgLcZlIl1VMzxZAvNY=
X-Received: by 2002:a05:6402:13cc:b0:63b:dc7d:7308 with SMTP id
 4fb4d7f45d1cf-63c1f6364d3mr1763672a12.5.1760666085704; Thu, 16 Oct 2025
 18:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251010145621.24961-1-z_bajeer@yeah.net>
In-Reply-To: <20251010145621.24961-1-z_bajeer@yeah.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Oct 2025 11:54:19 +1000
X-Gm-Features: AS18NWCm4XbWMLPQELZfheR7AQbphQyHQBaNQKPnPkkBjdp-GhtQdKmn3cObrvk
Message-ID: <CAKmqyKN2dooy=YTf=4Z6zCr80xqWck07a=9-BAPh8MkCsC=VSg@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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

On Sat, Oct 11, 2025 at 1:00=E2=80=AFAM Jialong Yang <z_bajeer@yeah.net> wr=
ote:
>
> Signed-off-by: Jialong Yang <z_bajeer@yeah.net>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

