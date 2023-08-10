Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603D1C04E69
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:31:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9Uv-00064d-Qi; Thu, 10 Aug 2023 13:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Uk-00061p-0C; Thu, 10 Aug 2023 13:30:53 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Uh-0002R5-JK; Thu, 10 Aug 2023 13:30:44 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-48719fc6b18so468658e0c.1; 
 Thu, 10 Aug 2023 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691688642; x=1692293442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e73qVEAKR2HYIiLRHTV1HycZI9/BjNrFoTfAxcTR6y0=;
 b=jFVDX90O0RyTbdPA3UbQVlQkGU4MuFln96PJEkXxqolxWxv14YlTGK1YvyzvaNG/bu
 1iyXmEBZNnbLaALuM71B5Abh6MO6gUDFzcLvpzjyBZbYjmJpiO6pES1Moul85FVY15BC
 XJH6sKTjIz1WBhWVVr/DAcuhj32qQ9MHGbjeG5lfqOICPSn4X4FGGF2758JCc6+0djdy
 3U7tLKpADDoekPpgodVAPWI4bCwKrCUcR6cY2bFosOh+E08aPgo4+BQHUxs3HBHY279q
 +ZhaLxJ1rUEuoW3toL1ffgHEYWKiocg7pKzQAV0eDMhYUUAKZ5bybaxsKTv35gDDMk1t
 PYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691688642; x=1692293442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e73qVEAKR2HYIiLRHTV1HycZI9/BjNrFoTfAxcTR6y0=;
 b=Yia1nDIxhrB/nbRSCPdFSeVuz92ocghwMTlHK2dXpm2vN3/kqBIvJh7Io2Euqnno0D
 pPajuv4W98jZqKFCgz96Cxuv8clma3ejCAc/Kff54eDDIE4icHNYrBCio6xlP5DD5xcl
 +VuV77gEiE+y30oNj0YEcUmWRjEHo0qddOm0VGBmmedt0f+QKe6AWXU00OW4daCsUszD
 4M77VY9FLJ50yYLXmSmXCKEC8FZmi8IHtcAojjPimuZn6Wfn5EVUnSGqHJFuAy+Y1sjb
 002NFZ4jG5RPJ/R2AMNsUC0yrDZ6o+IaYe6kCJrL0ouayvix5hF4GWGYmZWwM7Dx+vxz
 kpOA==
X-Gm-Message-State: AOJu0YyrJ3m+61YHZcB2kMEy86T7Rz71aYApIT6CCWxjih0aVKRQmFyv
 Yzfw+mZKkm4FKPefn0U+1EjG9hSV+COwRziLN1E=
X-Google-Smtp-Source: AGHT+IEx/skVJcMLfQpHRy6zY26wCoGY0rBFUmohy4dri5r2RhFHMUqHKODf8wnTcpxq0noPtWbCw43RByIdanmXEN4=
X-Received: by 2002:a67:ff93:0:b0:444:bb6c:1188 with SMTP id
 v19-20020a67ff93000000b00444bb6c1188mr2409673vsq.1.1691688642039; Thu, 10 Aug
 2023 10:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:30:16 -0400
Message-ID: <CAKmqyKPPg=9QR+A4AYf6_SFnaDk+3XcP8nuViBb77riuTW_fuA@mail.gmail.com>
Subject: Re: [PATCH 1/8] target/riscv/cpu.c: use offset in
 isa_ext_is_enabled/update_enabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Fri, Jul 28, 2023 at 9:18=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll have future usage for a function where, given an offset of the
> struct RISCVCPUConfig, the flag is updated to a certain val.
>
> Change all existing callers to use edata->ext_enable_offset instead of
> 'edata'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b5a2266eef..644ce7a018 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,18 +153,17 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentan=
aCondOps),
>  };
>
> -static bool isa_ext_is_enabled(RISCVCPU *cpu,
> -                               const struct isa_ext_data *edata)
> +static bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
>  {
> -    bool *ext_enabled =3D (void *)&cpu->cfg + edata->ext_enable_offset;
> +    bool *ext_enabled =3D (void *)&cpu->cfg + ext_offset;
>
>      return *ext_enabled;
>  }
>
> -static void isa_ext_update_enabled(RISCVCPU *cpu,
> -                                   const struct isa_ext_data *edata, boo=
l en)
> +static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
> +                                   bool en)
>  {
> -    bool *ext_enabled =3D (void *)&cpu->cfg + edata->ext_enable_offset;
> +    bool *ext_enabled =3D (void *)&cpu->cfg + ext_offset;
>
>      *ext_enabled =3D en;
>  }
> @@ -1025,9 +1024,10 @@ static void riscv_cpu_disable_priv_spec_isa_exts(R=
ISCVCPU *cpu)
>
>      /* Force disable extensions if priv spec version does not match */
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> +        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) =
&&
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
> -            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offs=
et,
> +                                   false);
>  #ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
>                          " because privilege spec version does not match"=
,
> @@ -2271,7 +2271,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str,
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> +        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset))=
 {
>              new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old =3D new;
> --
> 2.41.0
>
>

