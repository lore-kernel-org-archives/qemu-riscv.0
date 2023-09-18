Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CDDCD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:44:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3JZ-0003R1-Ai; Sun, 17 Sep 2023 21:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3JX-0003Q8-BG; Sun, 17 Sep 2023 21:44:39 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3JV-0001qK-Pb; Sun, 17 Sep 2023 21:44:39 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7a803afa8c5so1321835241.0; 
 Sun, 17 Sep 2023 18:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695001476; x=1695606276; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPOmp0jqnKcr1fANcdAtr2zQbf29NcZFm2yzvmS+ARw=;
 b=c++GQnLXPx7LN47PvkU4YzWNXqHs5JjQGChvQFTomBL/M6DVbP/0CE/lavODwty4VY
 Uogfm8240fQscdYZvrbql+Wp+FijCKL1XJ2nwyIpnXZmsKYPbVNn+vTk9LZVTpBa2gQS
 0ZQqLzrB3fYTe293T9TvMA4VNdTKO0yGpPNIprNsPDlorqxibKeyJy1gUf1HjAtaHk9k
 EJXEkEclRlSD2cZ5W7GHb1JpQPVFHmmHhcLALD9nYWA5o5sPzR6pxeyC3xVJ8HGz4plN
 /hrLdQHUCAetqJRedN7GtWtlE+USC7FwnOjqU8HBdQqNzYJfwBvU1c0jXOpDh/PZzOBe
 LIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695001476; x=1695606276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPOmp0jqnKcr1fANcdAtr2zQbf29NcZFm2yzvmS+ARw=;
 b=A8BBglQxJeF9+MeCk/2MGi2gMSyPLFgV2vqaM66c+JG1s76AvBfgxI+DhwX+s/g4FE
 XpvOVlhBbjo/t6LECMZjF1xMsFqgaSfKwH8lux1HGyLMSsN72+ia/4xa0cLJasYHf5pY
 Q6K/QVB00JJQnG+1mHir+CnqclM3PbTJJUtyhkdPqh+x5zKKF/cmAwWCQ+N5Os6CJ8d/
 DOhaA8wnSuEWE7uHI/PleKYDs3aIZd5UzyVWTt203HFMXfvf/BiiECpykLnFAbg5a+cJ
 G9rD+E44+OW/e778Oe/6Hh3HwLKlNuAvDkQrxsPS5fUnV/LExdBL+t4VAl1kTDnQwIdz
 Ukww==
X-Gm-Message-State: AOJu0YxTpeYwGgiK1vR3V390MzgnIcCm+IlquXuc+xEl1nmhPbVGe0NA
 k+QhqWdU49zLLQR3ZN8EZmyXN4HMJ5o91MhyhYE=
X-Google-Smtp-Source: AGHT+IHDO7jpLzzr6+n7pB6G2jR25yX2i9DtE9qeszI0Ozk4DrFOEeOiRIiPyxsc1lW8Ll+JAuJ+PafPfUyp0lFiApw=
X-Received: by 2002:a67:e918:0:b0:44d:40b1:926e with SMTP id
 c24-20020a67e918000000b0044d40b1926emr6402096vso.18.1695001476422; Sun, 17
 Sep 2023 18:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
 <20230908182640.1102270-3-baturo.alexey@gmail.com>
In-Reply-To: <20230908182640.1102270-3-baturo.alexey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:44:09 +1000
Message-ID: <CAKmqyKMB5VNWpFGgTKvFk7=hNsRAmnevkV5iv--dX3ZhKVA==Q@mail.gmail.com>
Subject: Re: [RFC v1 2/8] target/riscv: Add new S{sn, mn, m}jpm extensions as
 part of Zjpm v0.6.1
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 zhiwei_liu@linux.alibaba.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Sat, Sep 9, 2023 at 4:28=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.c     | 7 +++++++
>  target/riscv/cpu_cfg.h | 3 +++
>  target/riscv/machine.c | 6 ++++--
>  3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f937820976..af8f16b94f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,6 +137,9 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(ssnjpm, PRIV_VERSION_1_12_0, ext_ssnjpm),
> +    ISA_EXT_DATA_ENTRY(smnjpm, PRIV_VERSION_1_12_0, ext_smnjpm),
> +    ISA_EXT_DATA_ENTRY(smmjpm, PRIV_VERSION_1_12_0, ext_smmjpm),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -1796,6 +1799,10 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> +    /* Zjpm v0.6.1 extensions */
> +    DEFINE_PROP_BOOL("ssnjpm", RISCVCPU, cfg.ext_ssnjpm, false),
> +    DEFINE_PROP_BOOL("smnjpm", RISCVCPU, cfg.ext_smnjpm, false),
> +    DEFINE_PROP_BOOL("smmjpm", RISCVCPU, cfg.ext_smmjpm, false),

This will be exposed to users, so they can enable these extensions
after this patch is applied. I'm guessing the future patches in the
series will actually add support, so this change should be split out
to the last patch.

Alistair

>
>      DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
>      DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2bd9510ba3..9e9eb7cd1d 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -93,6 +93,9 @@ struct RISCVCPUConfig {
>      bool ext_smaia;
>      bool ext_ssaia;
>      bool ext_sscofpmf;
> +    bool ext_ssnjpm;
> +    bool ext_smnjpm;
> +    bool ext_smmjpm;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 8b1a109275..d50ff5421f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -150,9 +150,8 @@ static const VMStateDescription vmstate_vector =3D {
>  static bool pointermasking_needed(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
> -    CPURISCVState *env =3D &cpu->env;
>
> -    return riscv_has_ext(env, RVJ);
> +    return cpu->cfg.ext_ssnjpm || cpu->cfg.ext_smnjpm || cpu->cfg.ext_sm=
mjpm;
>  }
>
>  static const VMStateDescription vmstate_pointermasking =3D {
> @@ -161,6 +160,9 @@ static const VMStateDescription vmstate_pointermaskin=
g =3D {
>      .minimum_version_id =3D 1,
>      .needed =3D pointermasking_needed,
>      .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL(env.mseccfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.34.1
>
>

