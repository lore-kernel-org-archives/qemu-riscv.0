Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkCpk-0008Lt-CB
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 19:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCpi-0008LS-4V; Wed, 05 Apr 2023 19:46:30 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCpg-0001Zp-2Y; Wed, 05 Apr 2023 19:46:29 -0400
Received: by mail-vs1-xe32.google.com with SMTP id cu36so32966595vsb.7;
 Wed, 05 Apr 2023 16:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680738386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sm6uyroIZxRwF4lHVbaOwnpvKGyzgKB4AIJy+6/EdNE=;
 b=evTRPf4WGBwPzlwaHIm8YZB0K7ZN3/oADf87W/327hKsMOUYjqTrOv2DJcxIRHnUtc
 klMHIUsnFt37AHawwUqMJbOQ26fUkOf4XK83LnIf7GFWsog1Z3232r77Tx6G9xf8ji+a
 eTU8y8OTsMADmoLxCInAtgQq8SNcSAo5MmrLNil/OdtTwgEX3xecTzFIwO5urajQZw51
 2b8AjwNcBCiPNnv/MfBIaU3YcPEHKpJSEObfU9q7yqKrMLl+cS1+dGwfRm6KDjCs6ivm
 APYDZkVeYGakBfUc2Yy8ju6monYbQMFt2EtXF9G8hIBh+P8fMJ5sghiinf1Cc5sTIdJD
 ZAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680738386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sm6uyroIZxRwF4lHVbaOwnpvKGyzgKB4AIJy+6/EdNE=;
 b=5XyGoaLqinuTXhn3NBgMLTdYr3qBdv11TUXPWTeilQ4JDg2RurezEk0xVgJLayANeu
 b7KWpK67Chq22baX7RQm5/AYZ4C7BczrIymCv26FuoKU9KCvPtoC04wRTE2mJJ+ZISFu
 NwPrjweGs3QmjnDYI1Az1CLdQtoM20ITBZzKLrXje51Cd7uBxuyFUoawCMNXLxSHm0+6
 ve9Y7gZUs3UVpJfbt5ox/1q1Gl1YUHnNWV01jF85kMThRT6knbX9XFvktk7DrMFFlKcK
 f8hdi+3D+RlXyKTcoC0XBcr20fC19EUmro3NI1/dTzWm78OQSHgf1qJlyLLT8wlH/1nx
 10eQ==
X-Gm-Message-State: AAQBX9fx/5MEEH/tFa8dxfScg1s5jtPSy+3eoGkcwzSNozh18Nxrz1BC
 DAcyZhUxB+ZWPzC0w9RH/qlQmPm5ryYKZ9zoOvM=
X-Google-Smtp-Source: AKy350Y4bNRx0Z7ueKtBvX90iH+lYMOR0hvEMQEPmZAMLCIzVk13lQqrf48NWjHyj2N0jO2SlfBwTy9ca/Qlrx0o+yU=
X-Received: by 2002:a67:e096:0:b0:412:2ed6:d79b with SMTP id
 f22-20020a67e096000000b004122ed6d79bmr5936757vsl.3.1680738386608; Wed, 05 Apr
 2023 16:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 09:46:00 +1000
Message-ID: <CAKmqyKM_FL_DGMiMnA7bOMeCHQoAwi3L=Lm67dprOOhoaWPvew@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] target/riscv: remove cpu->cfg.ext_a
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 23:46:30 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "a" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVA. Instances of cpu->cfg.ext_a and similar are
> replaced with riscv_has_ext(env, RVA).
>
> Remove the old "a" property and 'ext_a' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 16 ++++++++--------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d7763ecfa9..63efd1b313 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -812,13 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>
>      /* Do some ISA extension error checking */
>      if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> -                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
> -                            cpu->cfg.ext_d &&
> +                            riscv_has_ext(env, RVA) &&
> +                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
>                              cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu->cfg.ext_i =3D true;
>          cpu->cfg.ext_m =3D true;
> -        cpu->cfg.ext_a =3D true;
>          cpu->cfg.ext_f =3D true;
>          cpu->cfg.ext_d =3D true;
>          cpu->cfg.ext_icsr =3D true;
> @@ -862,7 +861,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
> +    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
>          error_setg(errp, "Zawrs extension requires A extension");
>          return;
>      }
> @@ -1100,7 +1099,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_cpu_cfg(env)->ext_m) {
>          ext |=3D RVM;
>      }
> -    if (riscv_cpu_cfg(env)->ext_a) {
> +    if (riscv_has_ext(env, RVA)) {
>          ext |=3D RVA;
>      }
>      if (riscv_cpu_cfg(env)->ext_f) {
> @@ -1436,7 +1435,10 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visi=
tor *v, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>
> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {};
> +static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> +    {.name =3D "a", .description =3D "Atomic instructions",
> +     .misa_bit =3D RVA, .enabled =3D true},
> +};
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
> @@ -1462,7 +1464,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
> -    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
>      DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
>      DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
> @@ -1576,7 +1577,6 @@ static void register_cpu_props(Object *obj)
>          cpu->cfg.ext_i =3D misa_ext & RVI;
>          cpu->cfg.ext_e =3D misa_ext & RVE;
>          cpu->cfg.ext_m =3D misa_ext & RVM;
> -        cpu->cfg.ext_a =3D misa_ext & RVA;
>          cpu->cfg.ext_f =3D misa_ext & RVF;
>          cpu->cfg.ext_d =3D misa_ext & RVD;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..f703888310 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -422,7 +422,6 @@ struct RISCVCPUConfig {
>      bool ext_e;
>      bool ext_g;
>      bool ext_m;
> -    bool ext_a;
>      bool ext_f;
>      bool ext_d;
>      bool ext_c;
> --
> 2.39.2
>
>

