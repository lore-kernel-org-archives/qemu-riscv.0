Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A14CCD184
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 02:21:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8r89-0003KZ-Dv; Tue, 14 Oct 2025 22:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8r87-0003Db-Ob
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 22:20:43 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8r82-0003LD-Np
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 22:20:41 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so12284670a12.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760494836; x=1761099636; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMb51Wr2DZY/rVJCxhqogBRYio86jS8/Gojx8HlDlo0=;
 b=lxRjASPWuIVqHtJAq6WJDBiXF94+oeHWQQ1Z7wjF1lZkvTutlhkFhCBmOOywLDFIVc
 yfLrAaBj+RThX42Rtc1IoAc1UR8aXDmJVzd68XW/U44XgkmFtBlpj/e9LR6vSlbZFmDm
 itblx/xZBVWSVsV73ri8lG6fazpBu0OgO2fiDP1Auhxb3KLaDhPT9ii05PNE++non75d
 L/MOxY13mHcxQnNRQQlnkC79bbcDhy7KhfghOGHNbP1n+PLCgCfwGXm8pb033f2MM22t
 GxkNRR2e1NCYSq2U76uPgAm2rX1KhjBYFeebk37U2T7eZ3w8/uW07pgRAt7dBJawdBdN
 dZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760494836; x=1761099636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMb51Wr2DZY/rVJCxhqogBRYio86jS8/Gojx8HlDlo0=;
 b=F1Mkp5bBsod10BZGMejBSQiL6fajKUQ1Ss8UoDDgeurz/ikaKoZztG5guOW7VJw03V
 ojRaFGJh1jnzvsgOpZy82WCv33NlAWa5ToEdWlas5TroxB3ecGAB6mkt+7EXAEnELarI
 CrEiaTcveuPqt+yZ9up6d54rs/2DEaQ2pDF/gKqnUjr3qL+FGWAkmxK/G2e9nz3RkxuF
 sGKmGBgwNsUPp1WhzeOaxiSpU6BkMWPOLcx+L/c2/uNaKp+gWEnA/E/eiyPyRMbSaoD5
 Ux82WLSlEDyoD0CLo65WgzVNmTYEOL9m4Z5bMVOPn1tFB6jKrHlhRHmOLh21OpbarSME
 /N5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLc9+WHsWka8y12oFxhinj++HoPawIuz2yiGeHjjfkR8+esnKmJnoXuHRo3wKsJwsS4bHn+4bYbaK3@nongnu.org
X-Gm-Message-State: AOJu0YxTz2vN7XF6Wq60wV2XmmWEo2jau+Ak4guxWmEs3dKjQrX9Vhfc
 sOzXxaiXBXNz+HAvMGF7IG4OjVWWUxkIvFbohaXLk5YwX1VrbjbsIqUU7s79+NpaRiqxkXVFWdh
 V8gm0jHW5hI6BX+R00jY5xcqKLwU4Rfs=
X-Gm-Gg: ASbGncvSfQLeqqFnHujLH1HdIky9455jGh03GpTuvyGnAe1BtAQ3OfVWhwdzEvRoVil
 /WAMoGvYNxe//PquS32j0PkNHmYo7u0SMM1zbzD9ui/9/2C2DXfMM+zanTilC5Y1LjDziYnt3F5
 LxMJORUZFrZ1hkBIkiW6D0PczAxSz+CK5eB93glBJGqd65O5W2ic3LC70jJrWajem5Pp8o2hKt8
 S6pD7OJCwXcxORuXF4nOx4WNFcFe7Q+kNaSiQZA89dk95VDIM1yxVgmh3LJQqlg2Yr/TYEY9Cx6
 uw==
X-Google-Smtp-Source: AGHT+IGz2RKOMGOI7dax0JZxImXRMMaHnX2REmv0gNrPW+eLFD/tiCWHzMK00HMlxPWpVnz5Lhk+ns0FYUMGYkRcY8k=
X-Received: by 2002:a05:6402:50ce:b0:62f:50ff:b675 with SMTP id
 4fb4d7f45d1cf-639d5c74d05mr23793900a12.33.1760494835755; Tue, 14 Oct 2025
 19:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251004200049.871646-1-linux@roeck-us.net>
 <20251004200049.871646-3-linux@roeck-us.net>
In-Reply-To: <20251004200049.871646-3-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 12:20:07 +1000
X-Gm-Features: AS18NWAwWGeei24tH5famsMohy6AKE_W5AYTGmevAG6BRkhHXmyea3hzgegwpEc
Message-ID: <CAKmqyKNrOSbxPotadvOcaNYnvEdZY75k0pkmO4Pv9gVsTxG4qg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv: microchip_pfsoc: Connect Ethernet PHY
 channels
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Sun, Oct 5, 2025 at 6:03=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/microchip_pfsoc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index ba1d090d9b..6e2a6e721b 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -414,6 +414,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>
>      object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, =
errp);
>      object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
> +    object_property_set_bool(OBJECT(&s->gem0), "phy-connected", false, e=
rrp);
> +
>      sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem0), 0,
>                      memmap[MICROCHIP_PFSOC_GEM0].base);
> @@ -422,6 +424,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>
>      object_property_set_int(OBJECT(&s->gem1), "revision", GEM_REVISION, =
errp);
>      object_property_set_int(OBJECT(&s->gem1), "phy-addr", 9, errp);
> +    object_property_set_link(OBJECT(&s->gem1), "phy-consumer",
> +                             OBJECT(&s->gem0), errp);
>      sysbus_realize(SYS_BUS_DEVICE(&s->gem1), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem1), 0,
>                      memmap[MICROCHIP_PFSOC_GEM1].base);
> --
> 2.45.2
>
>

