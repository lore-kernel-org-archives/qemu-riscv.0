Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF8EC4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 03:34:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO8Jl-0001eB-Kq; Thu, 11 Jan 2024 22:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8Jj-0001dg-V3; Thu, 11 Jan 2024 22:34:47 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8Jh-0001hQ-NS; Thu, 11 Jan 2024 22:34:47 -0500
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4b71e8790efso1412878e0c.3; 
 Thu, 11 Jan 2024 19:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705030483; x=1705635283; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0E7ydRITCrgrvKrn8Ek6dSwuDrr+WRpbCOSnB3yCKI=;
 b=VXbIVVq+wysLrOH5zBwmIJa2VT7F+FtSaotSraKnikq5W4UB+cf8q91s5+IaOWKApX
 8wKNj4wlV0yYidAqtaJe38N4KbUi7Bz8qz/HehjtWELnCDiXyZ7EX4MC7LGqOS/bfh3H
 5G8cawYB9K8OAFHLYKMH44D+AQTKzHWpkEyjn7Kk025XmrETWhcixgkLEO4cDwv6w8hu
 W+QeRcDNy/UE1pPhXy033EReai9tYRKrVrnUZWGjN/mtX/3Dca9WOZPdfXjbNio96Rsq
 k+dT/ZSz8PGjgpdTq8/LIRy7YeNVf5igqGBI4VmKQpZEwbZyH1vPKs9QbAmegJSQe99k
 4uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705030483; x=1705635283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0E7ydRITCrgrvKrn8Ek6dSwuDrr+WRpbCOSnB3yCKI=;
 b=uLf5jAIrOFGNWODTzvF47BQivNyBOyrhF2fD3J2Yin6Bq6lTdino+DZNP8GIFpJIxA
 HxwESv29ItXFbbLcSy176h7Jv4hKlO41TooFtkrKGh/JCis8NOthl1KR9BGXx8VAQQyk
 84pnG25jwcw3nvvzlzYdg6wIvMDD0NQgkheDfHZ5jeRjtLjkMit1oi+WUH2FqdnzY6L/
 Etp6mZ00dHpIP1Ooigy52AhJIHx4e26FfayFwhVlo4gpKJuc23MY/i8Dlhaw1+/fidZD
 IJdamXzEKD9LQIcm/DDVic4gPbxzH2L/Dhy19YXxeokMnh0zCNiXjEeRy6gnS2TeB7ti
 CgCQ==
X-Gm-Message-State: AOJu0YyDK1Ns13I0N2CHUl3oOSM1qwNPxAHfQ0fuO4WwmYiBLVpygvf4
 51Wiaydq3mn0acFAcJm2aDwK7IUQSwLw6PSv2K4=
X-Google-Smtp-Source: AGHT+IFtSYQXF8+iry3FzMxKD0DSVjSD503lWzyFST3aJr0TgLICbO005hbWiK470CRkASmnn+DpymH3Co/OGDNevFk=
X-Received: by 2002:a05:6122:2004:b0:4b6:b153:4cbd with SMTP id
 l4-20020a056122200400b004b6b1534cbdmr864269vkd.1.1705030483346; Thu, 11 Jan
 2024 19:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <20240110040203.1920924-2-hchauhan@ventanamicro.com>
In-Reply-To: <20240110040203.1920924-2-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 13:34:17 +1000
Message-ID: <CAKmqyKOb-TASMKOaULmVrH3tjd5ZNMqe=Whguq9JFtK6ycOJkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Export sdtrig as an extension and ISA
 string
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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

On Wed, Jan 10, 2024 at 2:03=E2=80=AFPM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> This patch makes the debug trigger (sdtrig) capability
> as an extension and exports it as an ISA string. The sdtrig
> extension may or may not be implemented in a system. The
>         -cpu rv64,sdtrig=3D<true/false>
> option can be used to dynamicaly turn sdtrig extension
> on or off.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b07a76ef6b..aaa2d4ff1d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -143,6 +143,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, ext_sdtrig),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
>      ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
> @@ -1306,6 +1307,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>      MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>
> +    MULTI_EXT_CFG_BOOL("sdtrig", ext_sdtrig, true),

This exposes the property, but doesn't wire it up. Can you swap the
order of these patches?

>      MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
>      MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
>      MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..3d3acc7f90 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -113,6 +113,7 @@ struct RISCVCPUConfig {
>      bool ext_ssaia;
>      bool ext_sscofpmf;
>      bool ext_smepmp;
> +    bool ext_sdtrig;

and include this change in the other patch

Alistair

>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
>
> --
> 2.34.1
>
>

