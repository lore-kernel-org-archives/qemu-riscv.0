Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB3C47074
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdlr-0000cA-Q7; Sun, 07 Jan 2024 19:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdlo-0000bh-Tq; Sun, 07 Jan 2024 19:45:37 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdli-0003nn-Iz; Sun, 07 Jan 2024 19:45:35 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7cdef012c0eso283221241.2; 
 Sun, 07 Jan 2024 16:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704674728; x=1705279528; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UORzp3SoiSdmQ1HWLQsX1zFXW8aWV1KaN8CnVWs3rE=;
 b=aCUSki6ttGlnatvhnmNlgFU2C6NzoKHYMW581C98TowS6+hEwVeDRjLU/JRGiYd7pk
 MaGHCw9uDUMtou4PtDcR0bx5zcUw2gjVs9ZTyDTME76uY4fOm+2iDziTF2mkgNIfC+Va
 ZndmRe+bFBiiceKJxNNvoj6ASE03/gL+ZWPGjma+6rNNmnAi0RNx4LVYUQdg9YH1JVmR
 CxM7NGTaxS8+rjOsfJ+tyXbPuybnKfqm2L0r4V+wtQb2/Zv/PqpBHRudVbOLYuVM65vP
 TFVPR6o6o1sjM2dM514QvOIWzuFV+QoK73/wcEKsKCGA9nKOhq+4YqVPtPiNcocZuS/P
 Km5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704674728; x=1705279528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UORzp3SoiSdmQ1HWLQsX1zFXW8aWV1KaN8CnVWs3rE=;
 b=bVDyLWtI0BQDnqOAErIX+DeycBQunBADsxKXGN/IDpTEE1IE5qDX+qgbQKsOZ+A6XT
 egJ8Bfme9RRbmo9jSS/9YxYDQev4RNqxxoeuJ8HjE1yr2lFw8hnj589/8OTEXRE44ulQ
 gRlgNAKeTc26d2DtNE01+gHBumL/TDCPVO4/BIsiM9IPjMNMKkqkGqBr9fSdJchy4ioD
 5LBdockq7Gu86ZyFP3+6NPgAQK5cq/ri9dfV1JbQd3cvX9Gg8QC7g/3HUqFghxPmyyii
 NIPuhEF4fC6KUQedMcafh5ESnoHBFPVybk8rOGNqRTBKhIyV0JmbjTGt2O+N1BsWSIXf
 WXew==
X-Gm-Message-State: AOJu0YxwG9Bxgx0n3Q9FUi1NyDr0yUEBX9C6NUJf6TEk2tRx+Tpr7ukG
 hC9D0nmUMOPfJKpVz2SojuAa/1bFiSB2F36oQOs=
X-Google-Smtp-Source: AGHT+IFsRlzXcviZRzEKITOgPG7kE/Hy+zQwiaFqnVcICMZv+svHwLy7T4voIQEGv90yepVzTV5VuVBZ8cVaxJF5S4o=
X-Received: by 2002:a05:6102:945:b0:467:d522:47da with SMTP id
 a5-20020a056102094500b00467d52247damr367558vsi.18.1704674728736; Sun, 07 Jan
 2024 16:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
In-Reply-To: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2024 10:45:02 +1000
Message-ID: <CAKmqyKMKX8qK-D9TAyVViA9Dh0V_J4o251qDN7JptaBn=D1AnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: FIX xATP_MODE validation
To: Irina Ryapolova <irina.ryapolova@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Dec 12, 2023 at 9:04=E2=80=AFPM Irina Ryapolova
<irina.ryapolova@syntacore.com> wrote:
>
> [Changes since v1]
> used satp_mode.map instead of satp_mode.supported

The changelog needs to go

>
> [Original cover]
> The SATP register is an SXLEN-bit read/write WARL register. It means that=
 CSR fields are only defined
> for a subset of bit encodings, but allow any value to be written while gu=
aranteeing to return a legal
> value whenever read (See riscv-privileged-20211203, SATP CSR).
>
> For example on rv64 we are trying to write to SATP CSR val =3D 0x10000000=
00000000 (SATP_MODE =3D 1 - Reserved for standard use)
> and after that we are trying to read SATP_CSR. We read from the SATP CSR =
value =3D 0x1000000000000000, which is not a correct
> operation (return illegal value).
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---

Below this line.

Otherwise it will be included in the git history, which we don't want

Alistair

>  target/riscv/csr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..735fb27be7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1278,8 +1278,8 @@ static RISCVException read_mstatus(CPURISCVState *e=
nv, int csrno,
>
>  static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> -    return (vm & 0xf) <=3D
> -           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
> +    uint64_t mode_supported =3D riscv_cpu_cfg(env)->satp_mode.map;
> +    return get_field(mode_supported, (1 << vm));
>  }
>
>  static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mp=
p,
> --
> 2.25.1
>
>

