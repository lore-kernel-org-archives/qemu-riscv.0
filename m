Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC1C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO4iw-0004fK-DW; Thu, 11 Jan 2024 18:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4iv-0004f2-AZ; Thu, 11 Jan 2024 18:44:33 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4it-0007dg-D3; Thu, 11 Jan 2024 18:44:32 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4b72377deb0so1798808e0c.2; 
 Thu, 11 Jan 2024 15:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705016669; x=1705621469; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdIvnkQTNFZK0ei42TuwlFF3C1DlFfOuO/NfFOKC6jw=;
 b=Mw3U4Q62BbEW43f1pmFg2enO9TjPE8LzuL17gLgGddHZ0+vwRuBLkZ2/8EtNDP02JH
 t7O8gODOa7vvEEZTDm2n6hN2XAXYJjTAA9pkwSB4limo+WOisGRfHlRwSXGyzXEjtQFf
 D6RCK6ghsrGUvTc3nxBy03kBPUJiC6q8ymglC3IQjVxv4Rvw54/+xNDPcTh2yRpgwDkb
 9ubuB6fDyL7VGpkCLvROjUIh/+YxEdL3E2B/ozOJ9PL+LrxyeTpFgtzRXfFkb9F8BVZP
 /AJhAYjTn/ewwTQRMMKbF70uw09cXDTufdcFM668h/q+5+thH+830VqsFiUltr2TKSup
 AEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705016669; x=1705621469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdIvnkQTNFZK0ei42TuwlFF3C1DlFfOuO/NfFOKC6jw=;
 b=hh/R30jLUuIkEolbvOYio2dongtGFgHZyqgftQetFHckxV0EUd51R3SVH4uE6Erq0J
 VlCKYRfzH6KFdXgsCQaDB4aeFL5Q9H2cYgRgTZJJ0aYll5gNAUpBUKwyKsQmCl0/7aYo
 IVbk0M4pBWMiE2eoxdHAXfcm+P+39jw8WTTlHtaRJ8qrsdn9ossKhF9rsGey6MMHjes2
 UKyUP1lB96FDAzRMKon7mTr8KWijinNiDPPppwWd64gKy/Ntw2sOufGJNmOaW592W5oh
 Rhx6fTWCLhVtKtzoQVaS4sp9ishhLGg/OOmdFxfchCh3AH+k70hmcCzSiOY9u0Zzo1+E
 mgBQ==
X-Gm-Message-State: AOJu0YyPyRbAjLUvE5sJd48631e58qGxoCSJS6/zohyXmCwFQETGC0ZY
 oFVzSavQsFtyD356kx0asaHWxbhh4LHRAYjx4Eg=
X-Google-Smtp-Source: AGHT+IFXGt4x4Skj58Si50DyHAhYZACxKEj5uQs1aKyShKQ37OfmT1E4CdWf/psn85MvhoxkXT0lZMj06N3yrrIY6zU=
X-Received: by 2002:a05:6122:1b88:b0:4b8:ce85:1e97 with SMTP id
 es8-20020a0561221b8800b004b8ce851e97mr568159vkb.20.1705016669694; Thu, 11 Jan
 2024 15:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
 <20240105230546.265053-13-dbarboza@ventanamicro.com>
In-Reply-To: <20240105230546.265053-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:44:03 +1000
Message-ID: <CAKmqyKNTOdZ84QY1iTT9_O4M22Undvw+H1r8RGMNs5AyN92tyA@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] target/riscv: move 'cbop_blocksize' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
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

On Sat, Jan 6, 2024 at 9:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Do the same we did with 'cbom_blocksize' in the previous patch.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b77d26231c..e3cbe9b1b6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1317,6 +1317,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu->cfg.vlen =3D 128;
>      cpu->cfg.elen =3D 64;
>      cpu->cfg.cbom_blocksize =3D 64;
> +    cpu->cfg.cbop_blocksize =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
> @@ -1902,8 +1903,42 @@ static const PropertyInfo prop_cbom_blksize =3D {
>      .set =3D prop_cbom_blksize_set,
>  };
>
> +static void prop_cbop_blksize_set(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value !=3D cpu->cfg.cbop_blocksize && riscv_cpu_is_vendor(obj)) =
{
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.cbop_blocksize);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.cbop_blocksize =3D value;
> +}
> +
> +static void prop_cbop_blksize_get(Object *obj, Visitor *v, const char *n=
ame,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.cbop_blocksize;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_cbop_blksize =3D {
> +    .name =3D "cbop_blocksize",
> +    .get =3D prop_cbop_blksize_get,
> +    .set =3D prop_cbop_blksize_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_END_OF_LIST(),
> @@ -1992,6 +2027,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "elen", .info =3D &prop_elen},
>
>      {.name =3D "cbom_blocksize", .info =3D &prop_cbom_blksize},
> +    {.name =3D "cbop_blocksize", .info =3D &prop_cbop_blksize},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> --
> 2.43.0
>
>

