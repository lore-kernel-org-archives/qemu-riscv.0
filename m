Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30331CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 01:00:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v32FO-00036R-O8; Sun, 28 Sep 2025 21:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32FM-000356-5V
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:00:08 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32FB-00065E-DL
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:00:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so102973866b.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759107592; x=1759712392; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZQS4dIQjF2GGCBk2EsJATpMfBo17XlNBvV7MDnwow0=;
 b=TnlG4KLotL5POopkY7dOHs0JGAJrBdCNKgQlt6PieSTRLm/Uxg7h2MACAenHZ6FgBS
 /oeIl0WDE4b5OoMCfakSBtYsH4+8fH3sNRNop6qdxIJ5P9ti7LG5kp9xQplgmy4smtHz
 ObI1InrpA2YZ7q8h9nvRpEEgmUND7iLsNCwpl4yIRyfw+oFp5bUXP0iR/NdcrQNMZgZB
 OOHN9BYxW44NQoHP1iIa1iWyy9H4zn77rh5Ie7vok8aq9y99cKp10fE700FwkdW5KoGi
 l3xofWYex5xVJsjB66Lo1SBLcd0m8DRV+bP9vM2mOUkiyzyzqw733kAeld6g6W4c/Gl1
 SqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759107592; x=1759712392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZQS4dIQjF2GGCBk2EsJATpMfBo17XlNBvV7MDnwow0=;
 b=HvvIzRdbVJQ4URAYTTm38oMQI29MybUxaZLgRMNb3G4zyUPeae75apMYid6iuVwbHa
 DS7hRaiP6iS5vqBr6MhW/oztqh0bhplaOR4+n3ujv96C1i7F8tj/DB9tA6EY+buqe4eG
 kbFyWilEaevjTQJsvRQ7nh0GFdFPcaIVq+6wrDQyQLKXSkrdbajQM7Y9Hhk0dVOH5wX8
 6E3iWl6i7K6LgbznKJllI7LdOHHV3ofjNV01epGuuXhrOpefUghoEJCsVNdBq6fOcV9I
 xxQw08TJcPG8yz/oQcTvpt4SNF/m4k/FehVCjPckUR0CAfiq6IE0Kjc8C4OLJsW1IjU6
 eH+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrLml0bnVjqRqGNdIfnemlpSr/im/HvyZ9qu27O9HNMWVc8ajQz46+/+EA6YDMQi9CNbFMuppe+sah@nongnu.org
X-Gm-Message-State: AOJu0YyWk9ToCeX4JzDFAddZOE9Jv2IQFGQNxUcm9KETd3uaIBYiIhm1
 Yqz7C964X9E0badbc+G73rtIjJ+L+ID9L9/0JhY65qhW0z1k5rc6SVN7HN9+gAzkxqvlz+FNOMV
 vG+N3mykbO5GMgSC/jobVP7dq96Ptgq1jZQ==
X-Gm-Gg: ASbGncse7CA43C449c1G/1wilfx5ZYMCQNGsKW+KleQT7FZdaIimnGLDyI9cqoLxBXE
 oLu+B6xxQEmru7cOpkV6tGp6wuKfCQpmJFoJNJHXUlzI4U/jFn6FnEJt5RkRBp5qQsEegTDzGur
 rzE+hazK+iDYJ/Ci2YZo8HHsVbc59aEV/delWCZdo5oYHUfupEXXMPtdU0BmaiKLgrl74nvKY+6
 EVfFMxHo/4ju+hQtx/bzzdMdQKmPsmz8HLSPKQpqbFOqJcnpL4RHqNCdWM=
X-Google-Smtp-Source: AGHT+IH5FYkwNsCw/ZadaCFkBx6TXOCDX/oMJ1/b+kg/ziBEJSvsh82bKXpOnZsbpLcO3PCoGxirRLYVkhwOMtbQBcA=
X-Received: by 2002:a17:906:c14b:b0:b2e:7614:d92d with SMTP id
 a640c23a62f3a-b3a08b7bc8dmr835347966b.0.1759107592277; Sun, 28 Sep 2025
 17:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250923090729.1887406-1-max.chou@sifive.com>
 <20250923090729.1887406-3-max.chou@sifive.com>
In-Reply-To: <20250923090729.1887406-3-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:59:25 +1000
X-Gm-Features: AS18NWB1Lr5IaTeF2iFmGyQgVxl6EekwIJhP2CaIOVH9dfBKB8hm3chsZ6UIaOE
Message-ID: <CAKmqyKNw17kgo8XJrb0F=NjaPA3J40TBEr_cnagEdcr4NT-NKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: rvv: Modify minimum VLEN according
 to enabled vector extensions
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x635.google.com
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

On Tue, Sep 23, 2025 at 7:08=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> According to the RISC-V unprivileged specification, the VLEN should be gr=
eater
> or equal to the ELEN. This commit modifies the minimum VLEN based on the =
vector
> extensions and introduces a check rule for VLEN and ELEN.
>
>   Extension     Minimum VLEN
> * V                      128
> * Zve64[d|f|x]            64
> * Zve32[f|x]              32
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a6f60f55ceb..02d99bb0ae9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -416,12 +416,21 @@ static void riscv_cpu_validate_misa_priv(CPURISCVSt=
ate *env, Error **errp)
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
>                                   Error **errp)
>  {
> +    uint32_t min_vlen;
>      uint32_t vlen =3D cfg->vlenb << 3;
>
> -    if (vlen > RV_VLEN_MAX || vlen < 128) {
> +    if (riscv_has_ext(env, RVV)) {
> +        min_vlen =3D 128;
> +    } else if (cfg->ext_zve64x) {
> +        min_vlen =3D 64;
> +    } else if (cfg->ext_zve32x) {
> +        min_vlen =3D 32;
> +    }
> +
> +    if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
>          error_setg(errp,
>                     "Vector extension implementation only supports VLEN "
> -                   "in the range [128, %d]", RV_VLEN_MAX);
> +                   "in the range [%d, %d]", min_vlen, RV_VLEN_MAX);
>          return;
>      }
>
> @@ -431,6 +440,12 @@ static void riscv_cpu_validate_v(CPURISCVState *env,=
 RISCVCPUConfig *cfg,
>                     "in the range [8, 64]");
>          return;
>      }
> +
> +    if (vlen < cfg->elen) {
> +        error_setg(errp, "Vector extension implementation requires VLEN =
"
> +                         "to be greater than or equal to ELEN");
> +        return;
> +    }
>  }
>
>  static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> --
> 2.43.0
>
>

