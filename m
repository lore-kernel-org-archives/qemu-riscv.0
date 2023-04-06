Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDIA-0004yc-CR
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDI8-0004y7-9t; Wed, 05 Apr 2023 20:15:52 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDI6-0002Qs-Ie; Wed, 05 Apr 2023 20:15:52 -0400
Received: by mail-ua1-x929.google.com with SMTP id h34so26841745uag.4;
 Wed, 05 Apr 2023 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPuXcXhnGDo8LlssoJqm/H6oryyM26bNC+gitNTtWvU=;
 b=h17tjOert5edAfX8SfpkkF0zbSyAPpsRfogGGmhKJ4kKiqS2yCuP+ElnVwQN4S46oy
 VZofbYGOuiGBUh34I56Ny0vI8cL9vEiIkb5Kth9Om7PBV73tOP/ErHy7MKGkY+bLd46A
 s4VWuAIJI+08+SL2Acbds8O8JJ5MPYByv5JCP58xiSeQcdOSokznv9eusu/nxCoQH4/q
 lHgSGcnN8ftHjmD97On7FaQU5x9V4Qv0XDUiqRrpSnmjrfi03FC8kOv0fqyex/l0Xfwu
 rYXMPBxFzP4QZjODsZl7ZIUwThrYknecfBs00wfxVMauUS3lU6WuYk7ai+toAzCa8NNO
 uPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPuXcXhnGDo8LlssoJqm/H6oryyM26bNC+gitNTtWvU=;
 b=Ql+4pD7ytmEli5BcyKisPKxAoE2Mpv3H90rFZWDrIqpoTnqacf7qOR/GiKJAMjP8aJ
 K6ST+x4GbVP/FWbiOwIQikD6KCWodOw5wI2LHH1DzSJDA355B6Sh88gyeuC7mKk37vWG
 CDnU4QzNBlDlO+Peckxs2riOFRHhGYTycI6TjXGGWP7wYCcRrt0fMk1qjI8T551NquyH
 R8tnlSPBgtV6Fccqq+3i0H/RZFkP7kEtndMqXbX74oroYO64Fia2HwQE3qoU2D1e7Won
 NDJSgMvpxcG6TpKWJxKNMd7dN2KoA2fpb4775iYQr3AxaFRXX1q3Sz20kbS7PvxziLFM
 4etg==
X-Gm-Message-State: AAQBX9cdi/X8yCsbr6YMbiYQrM462uvayaRNme7pmWNFatbR/n48H1Va
 H+Fpa+kpvurjRC2JAD/EpiN7YQ0CVNNv0qPplvk=
X-Google-Smtp-Source: AKy350bnmTj/w7IBcSv01sXxRyDeeoeMh1y7uY20EF1SkIpsEvylO9iJshQ3lYmPSdB/2A6deUT8NqNXClr33Uv3IdI=
X-Received: by 2002:ab0:474f:0:b0:688:c23f:c22f with SMTP id
 i15-20020ab0474f000000b00688c23fc22fmr6338800uac.1.1680740149119; Wed, 05 Apr
 2023 17:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:15:23 +1000
Message-ID: <CAKmqyKOucHVgc_GWY1uLAt8wt+dY9dbViY5i7epozoCXHrJnbw@mail.gmail.com>
Subject: Re: [PATCH v3 08/20] target/riscv: remove cpu->cfg.ext_f
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:15:52 -0000

On Thu, Mar 30, 2023 at 3:30=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "f" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVF. Instances of cpu->cfg.ext_f and similar are
> replaced with riscv_has_ext(env, RVF).
>
> Remove the old "f" property and 'ext_f' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 20 ++++++++++----------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bb714d0d8..f53400d40f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -812,12 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>      /* Do some ISA extension error checking */
>      if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                              riscv_has_ext(env, RVA) &&
> -                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
> +                            riscv_has_ext(env, RVF) &&
> +                            riscv_has_ext(env, RVD) &&
>                              cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu->cfg.ext_i =3D true;
>          cpu->cfg.ext_m =3D true;
> -        cpu->cfg.ext_f =3D true;
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
>
> @@ -854,7 +854,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
>          error_setg(errp, "F extension requires Zicsr");
>          return;
>      }
> @@ -868,12 +868,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>          cpu->cfg.ext_zfhmin =3D true;
>      }
>
> -    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
>          error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>          return;
>      }
>
> -    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
> +    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
>          error_setg(errp, "D extension requires F extension");
>          return;
>      }
> @@ -898,7 +898,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zve32f && !riscv_has_ext(env, RVF)) {
>          error_setg(errp, "Zve32f/Zve64f extensions require F extension")=
;
>          return;
>      }
> @@ -931,7 +931,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>              error_setg(errp, "Zfinx extension requires Zicsr");
>              return;
>          }
> -        if (cpu->cfg.ext_f) {
> +        if (riscv_has_ext(env, RVF)) {
>              error_setg(errp,
>                         "Zfinx cannot be supported together with F extens=
ion");
>              return;
> @@ -1100,7 +1100,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVA)) {
>          ext |=3D RVA;
>      }
> -    if (riscv_cpu_cfg(env)->ext_f) {
> +    if (riscv_has_ext(env, RVF)) {
>          ext |=3D RVF;
>      }
>      if (riscv_has_ext(env, RVD)) {
> @@ -1440,6 +1440,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVC, .enabled =3D true},
>      {.name =3D "d", .description =3D "Double-precision float point",
>       .misa_bit =3D RVD, .enabled =3D true},
> +    {.name =3D "f", .description =3D "Single-precision float point",
> +     .misa_bit =3D RVF, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1466,7 +1468,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
> -    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> @@ -1577,7 +1578,6 @@ static void register_cpu_props(Object *obj)
>          cpu->cfg.ext_i =3D misa_ext & RVI;
>          cpu->cfg.ext_e =3D misa_ext & RVE;
>          cpu->cfg.ext_m =3D misa_ext & RVM;
> -        cpu->cfg.ext_f =3D misa_ext & RVF;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
>          cpu->cfg.ext_s =3D misa_ext & RVS;
>          cpu->cfg.ext_u =3D misa_ext & RVU;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e4cf79e36f..ce23b1c431 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -422,7 +422,6 @@ struct RISCVCPUConfig {
>      bool ext_e;
>      bool ext_g;
>      bool ext_m;
> -    bool ext_f;
>      bool ext_s;
>      bool ext_u;
>      bool ext_h;
> --
> 2.39.2
>
>

