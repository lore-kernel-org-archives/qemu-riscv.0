Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17358CAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:59:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v32EB-0002Yt-4q; Sun, 28 Sep 2025 20:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32E9-0002Y6-CU
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:58:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32Dz-0005sa-3a
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:58:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so8153966a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759107517; x=1759712317; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etuAn2dU+soCq8asXsC+a5r/MFn5AXJSHeTisNlxzG8=;
 b=Y7U4g8fwHCyELqNBSI9Gm0g10IQFki/EA4yEDD8JFFaklTmWI7IDVw29Ww0XJu7xKd
 X5Teyhj/9mREV8abucQ4v3++myb/R4UVIsBvBzcrQjQeEVOMCeEUq6c2jgTtVAI+L2bG
 8Ia9J94zJXEkqvu7wkugpVsmV6pB7tWbHouJgvbEEi7Lpf2Ku0u4XBGVpZ9PlQJgNRF9
 I//I7Nee2Bh0X0sBSS5M5l5TftEHfi3GArleUAV7sO3m0miIw6iSJ5yWTKXsYfEGjyVX
 T3t/tXBBmRcUu8o3ncuGeeBarvd3955bfgBV/4F4hZ27+ldIj80ENDgEwo+YwumYeXUe
 kdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759107517; x=1759712317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etuAn2dU+soCq8asXsC+a5r/MFn5AXJSHeTisNlxzG8=;
 b=NKcdhcgPudW4bApBcqLlGxmXmPBWWdt0BhAahL3wqtoW9tjelWheLtU6d5sJC0Aewz
 12BpSoIRCOzBQK4Tx1sNRfXPvqWRIcBq0gx81F4kxiwiZsOYp5VG0ga47+rufyv3ntXC
 6bs/bzYoCffjao+HA69bKftTb5UUxovvbi1/jfOvzBx+WKvhJ2WRQakhJq3ly0E3eMXQ
 TZTxPbOSE8/ZxLIPCpjx4q8f0gGfsQOxkyaKvW3T1mZUrK8dd5x4ECOyoTl+ugAd3Ah6
 jffEs3O7OHkq9UG0N0EDBfEReCzMJP/+5pQqrXIAAz/4xk+rmOPx8DNQlAEEtLmNeq+x
 jjMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbC0ujrhTxsfQ0lOcFNRo2khRHlVK3ia+QnOBcMK3I2Anki7OuIYgHPB4aXf+Tpx5TbbJY2GzE3thg@nongnu.org
X-Gm-Message-State: AOJu0YzCAGaq184p//SrIOTLyfFrP34Kc+j4UKsakJkN6Vt8qaqHWZvF
 EOf1or9MuhcKJ/XhOzHp5QPh1/o0NkC/svGBw16W7ezzjid/SVnmhl3SuDI3p/ISrntrIzUygJg
 +89oql/MR8YDq8JbqqbhGabdPbYscgOf4Fg==
X-Gm-Gg: ASbGnctqvb/qDM6zLZwfyI6EQREROQWQP+NdnC2QxeKpw5XPk3ANJKLOtmK/vH44HKI
 nTWOX7zG7tjb10GAMuo6KMaZjx78UhojYOkQpzGWHkvysjJ8nloEmGtVZgD3f3Wy8ug1XdoIQRE
 VfIRWIqv4WNYh2mTTbegXQbmg44a21rUU4M0gYmJncXvVbdnN1H/e/mbFbdUHa+J4RHW8ffxVXm
 adQkd3Nm6hrsMw8jjkWWV/4QfH97y4WlWybBLnMy26E3Voa
X-Google-Smtp-Source: AGHT+IFVyv7ZGMrJQTtaXpswxSFPs4rM9RSKnzvMbg6F4Z/f1PU0wQu6qBoBmzN6U7NjElZkuFWFCvXEmyWh56zamyU=
X-Received: by 2002:a17:906:c141:b0:b04:5895:fe8e with SMTP id
 a640c23a62f3a-b34bb9e9b51mr1645000666b.36.1759107516587; Sun, 28 Sep 2025
 17:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250923090729.1887406-1-max.chou@sifive.com>
 <20250923090729.1887406-2-max.chou@sifive.com>
In-Reply-To: <20250923090729.1887406-2-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:58:10 +1000
X-Gm-Features: AS18NWByWdbLbfOc3E-IDAFNbwaiuasIFEVWCQny6-QZ9O9WOus_ECIvwt7zVL0
Message-ID: <CAKmqyKNB4wKUyB_pRQDkgnJK+j=Fzr1dPS-ciUZW4MYZwE2Rsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: rvv: Replace checking V by checking
 Zve32x
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 23, 2025 at 7:09=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> The Zve32x extension will be applied by the V and Zve* extensions.
> Therefore we can replace the original V checking with Zve32x checking for=
 both
> the V and Zve* extensions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c            | 2 +-
>  target/riscv/csr.c            | 3 ++-
>  target/riscv/machine.c        | 3 ++-
>  target/riscv/riscv-qmp-cmds.c | 2 +-
>  target/riscv/tcg/tcg-cpu.c    | 2 +-
>  5 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf4623..a877018ab0c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -604,7 +604,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
>              }
>          }
>      }
> -    if (riscv_has_ext(env, RVV) && (flags & CPU_DUMP_VPU)) {
> +    if (riscv_cpu_cfg(env)->ext_zve32x && (flags & CPU_DUMP_VPU)) {
>          static const int dump_rvv_csrs[] =3D {
>                      CSR_VSTART,
>                      CSR_VXSAT,
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8842e07a735..5824928d954 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2004,7 +2004,8 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>      if (riscv_has_ext(env, RVF)) {
>          mask |=3D MSTATUS_FS;
>      }
> -    if (riscv_has_ext(env, RVV)) {
> +
> +    if (riscv_cpu_cfg(env)->ext_zve32x) {
>          mask |=3D MSTATUS_VS;
>      }
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 51e0567ed30..18d790af0d0 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -131,7 +131,8 @@ static bool vector_needed(void *opaque)
>      RISCVCPU *cpu =3D opaque;
>      CPURISCVState *env =3D &cpu->env;
>
> -    return riscv_has_ext(env, RVV);
> +    return kvm_enabled() ? riscv_has_ext(env, RVV) :
> +                           riscv_cpu_cfg(env)->ext_zve32x;
>  }
>
>  static const VMStateDescription vmstate_vector =3D {
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index b63de8dd457..c499f9b9a7d 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -342,7 +342,7 @@ int target_get_monitor_def(CPUState *cs, const char *=
name, uint64_t *pval)
>      }
>
>      if (reg_is_vreg(name)) {
> -        if (!riscv_has_ext(env, RVV)) {
> +        if (!riscv_cpu_cfg(env)->ext_zve32x) {
>              return -EINVAL;
>          }
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 78fb2791847..a6f60f55ceb 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -660,7 +660,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>          return;
>      }
>
> -    if (riscv_has_ext(env, RVV)) {
> +    if (cpu->cfg.ext_zve32x) {
>          riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
> --
> 2.43.0
>
>

