Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDMW-0000sG-AJ
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDMU-0000ro-If; Wed, 05 Apr 2023 20:20:22 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDMS-0004A2-QT; Wed, 05 Apr 2023 20:20:22 -0400
Received: by mail-vs1-xe36.google.com with SMTP id g17so33007781vst.10;
 Wed, 05 Apr 2023 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/JrrrZVNI0CJ3V0lV1nd9EeV3viyvIHEWRmxkbGffc=;
 b=pBdTFcwkWHF+Im0GjBJsNCrJsq95L/u2/JJMXKlkq//e+spX9alWycPPNPPxIJEw+u
 C6X1cw9V/SYzc3gDuZoNxt1miNUNO3Fw5+lWa5fC9OQ5qpLvNyzw0BQR4CIdiuxnVLNP
 ZEWjgCx1RXEdEKaZJYZVMbklBA9/kYjE9o/fB80sI6KzK5uWMHU/ViJMHdrmNdsUeH/M
 gkDiPRJilWjU0DlLp+IWQiyDadoISqooUV3ztWuDvkVIzVW301PQX38lEdTicMqpg7b2
 GsOOAVgMqFTSSw8PbLHyQ6OXTYPA38UOlnu2jPafT55aUc5vZEgcaEn7QaREKGa28sKj
 myLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/JrrrZVNI0CJ3V0lV1nd9EeV3viyvIHEWRmxkbGffc=;
 b=vkAUdi+jkUQzIpO4KRyGMHqOZojvGytF3j1lrEkWZH7xnLJGh/64VQLbmjXevEGgbC
 u5w59ULBQ9XNJhsfhOdmNWL4qjcD2jEzxHTrsZ4+g1QTXw2x5w05TN20rL5XxGigEJ5J
 sCHpHTUtLGP1sgtRos+fCOuUFo7gb24fF1BEHyVgsa+jwLOlk8CraPaqkMIF9HvThYl2
 +waoZ1bvNRJvjSTpy2IkZnsYRysp7RPMZdzl7kJuc6hDWfz31xBul2xKdK0iuf9iIS/e
 HC29OoYj7QZTXgJVO0lheegl4AmZir++KvRLnGB545Mbw7OAc32wSY6hAuonKvs486Da
 e+SQ==
X-Gm-Message-State: AAQBX9fqWXPHlcA3H2l/DDL2ZnDMUzjNSWOf4re1a/8v42lr8z4UPJnP
 ht5cG3lff4kNMDD24LOR6i3dJkZ7T50C4l1sYIg=
X-Google-Smtp-Source: AKy350be51jUeRwOIhOE2AKoY0eJWM0NsY2bIgoTM7hiB6n2XnzQlMvploosUeYvgOQVj1fzvTxGl31Q8Ey6F7iu4Iw=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr5664124vsk.3.1680740419303; Wed, 05 Apr
 2023 17:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-15-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-15-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:19:53 +1000
Message-ID: <CAKmqyKNmNAL6nV9u6em2sLhST_r0LfT=4ejKQEwqO38J0wpDnQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] target/riscv: remove cpu->cfg.ext_h
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:20:23 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "h" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
> replaced with riscv_has_ext(env, RVH).
>
> Remove the old "h" property and 'ext_h' from RISCVCPUConfig.
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
> index a72bc651cf..76dcf26f6c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -840,13 +840,13 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
> +    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
>          error_setg(errp,
>                     "H depends on an I base integer ISA with 32 x registe=
rs");
>          return;
>      }
>
> -    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
> +    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
>          error_setg(errp, "H extension implicitly requires S-mode");
>          return;
>      }
> @@ -1112,7 +1112,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVU)) {
>          ext |=3D RVU;
>      }
> -    if (riscv_cpu_cfg(env)->ext_h) {
> +    if (riscv_has_ext(env, RVH)) {
>          ext |=3D RVH;
>      }
>      if (riscv_cpu_cfg(env)->ext_v) {
> @@ -1449,6 +1449,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVS, .enabled =3D true},
>      {.name =3D "u", .description =3D "User-level instructions",
>       .misa_bit =3D RVU, .enabled =3D true},
> +    {.name =3D "h", .description =3D "Hypervisor",
> +     .misa_bit =3D RVH, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1473,7 +1475,6 @@ static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> @@ -1578,7 +1579,6 @@ static void register_cpu_props(Object *obj)
>       */
>      if (cpu->env.misa_ext !=3D 0) {
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> -        cpu->cfg.ext_h =3D misa_ext & RVH;
>          cpu->cfg.ext_j =3D misa_ext & RVJ;
>
>          /*
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7b98cf4dd7..f3cb28443c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_h;
>      bool ext_j;
>      bool ext_v;
>      bool ext_zba;
> --
> 2.39.2
>
>

