Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDJz-000777-U4
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDJy-00076Z-AY; Wed, 05 Apr 2023 20:17:46 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDJt-0002oO-Io; Wed, 05 Apr 2023 20:17:45 -0400
Received: by mail-ua1-x92d.google.com with SMTP id n1so302905uae.9;
 Wed, 05 Apr 2023 17:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaWgZ5nPzlZT+MHy4Tfa9QcztgG7gV+7hkKldF6Iw4I=;
 b=gjn9uX6e1YC7hKVL/QF3uMwbbKdj9d0AWZRuYynJCyxkuBllAHYzAAyu7XMJyGAR2e
 2Aq45jRWKfRbw4EAcYfMKCVMpprkH3zOtlLXtNt3Z0MYykESOICdvaXu0o6hQfSj+ds4
 tSg2bLycBitPl3CaiOn6EjvQrBMKSg0IgOS9hAOeNhxr+SKWxfUfl1ZDPEcqWyH44LJT
 91D2n/QOm2bFGfUDhAiEgEmOLZFhUwNgDmCbJ6HaotbDTYCYdSnO8Ef83MJ0aLMhxEFQ
 bHXx6wUzrn3ZZ8Ic4YBm89FxqjPutOFwt5UUAnZ78vjVISMD4PcNiZ49JgMm+IDfMuWh
 /aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaWgZ5nPzlZT+MHy4Tfa9QcztgG7gV+7hkKldF6Iw4I=;
 b=GXxywzYpnu3bBSw9khAaWOdPdoWo5FxGzajAY1dvAkWDqMWk3ZiMBCzHYLyxT7IDBl
 KOSmf2KOZyujF+EAr5Wi4ZCaZcAibDC4g0jH1PBB/CfWtwY+fKvqO3QdJkFlXTa3qhzW
 C4pmXIYMwqSddQVv9z2OkcdSXR9+1lSxpcyn9RuuwdIZ/EGZOpZWMZIn3lgagDv9KN8W
 DXEemLI204ljX7SQrP3IqBmTutiGOYQaOpFe+KbPFVTnY80iBSFeeblQh9Cpxr3LtmGI
 YlsnA6PEPdu+Xkx0+hoVXZoIwQj1ImwoNRw5CtF/eXzxHjfod1oIprX2IGKZjL1vJzxK
 LmWg==
X-Gm-Message-State: AAQBX9eaDQjJn5qD6aCkE7V6I7AQEHjBAiNBkBr4iTiRrr49sYbRAImG
 ABVk+aZf2yuci5PwBJudSDgHoO3oQVLDBy5pIkg=
X-Google-Smtp-Source: AKy350b/PU9jCnyTHSqMC47h5bkozx+/7ZmIxP72VojY3DDKBzxlxnDhjJC3kdYUec4ifW9WdUrIc4HGNdecaGKPyQI=
X-Received: by 2002:ab0:474f:0:b0:688:c23f:c22f with SMTP id
 i15-20020ab0474f000000b00688c23fc22fmr6342506uac.1.1680740260272; Wed, 05 Apr
 2023 17:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:17:14 +1000
Message-ID: <CAKmqyKPoQ_=JqBVtp2WdSQLqVe8Y2GTGJwJ50wVM_F9wDcKE+g@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] target/riscv: remove cpu->cfg.ext_m
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:17:46 -0000

On Thu, Mar 30, 2023 at 3:33=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "m" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVM. Instances of cpu->cfg.ext_m and similar are
> replaced with riscv_has_ext(env, RVM).
>
> Remove the old "m" property and 'ext_m' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 +++++-----
>  target/riscv/cpu.h |  1 -
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9cf3ab3988..6861446489 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,13 +810,13 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>
>      /* Do some ISA extension error checking */
> -    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
> +    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
> +                            riscv_has_ext(env, RVM) &&
>                              riscv_has_ext(env, RVA) &&
>                              riscv_has_ext(env, RVF) &&
>                              riscv_has_ext(env, RVD) &&
>                              cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -        cpu->cfg.ext_m =3D true;
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
>
> @@ -1093,7 +1093,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVE)) {
>          ext |=3D RVE;
>      }
> -    if (riscv_cpu_cfg(env)->ext_m) {
> +    if (riscv_has_ext(env, RVM)) {
>          ext |=3D RVM;
>      }
>      if (riscv_has_ext(env, RVA)) {
> @@ -1445,6 +1445,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVI, .enabled =3D true},
>      {.name =3D "e", .description =3D "Base integer instruction set (embe=
dded)",
>       .misa_bit =3D RVE, .enabled =3D false},
> +    {.name =3D "m", .description =3D "Integer multiplication and divisio=
n",
> +     .misa_bit =3D RVM, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1468,7 +1470,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
> -    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> @@ -1576,7 +1577,6 @@ static void register_cpu_props(Object *obj)
>       * later on.
>       */
>      if (cpu->env.misa_ext !=3D 0) {
> -        cpu->cfg.ext_m =3D misa_ext & RVM;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
>          cpu->cfg.ext_s =3D misa_ext & RVS;
>          cpu->cfg.ext_u =3D misa_ext & RVU;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cc0b9e73ac..7a42c80b7d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_m;
>      bool ext_s;
>      bool ext_u;
>      bool ext_h;
> --
> 2.39.2
>
>

