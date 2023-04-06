Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDIq-0005hY-2S
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDIo-0005gg-Eb; Wed, 05 Apr 2023 20:16:34 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDIm-0002ae-MI; Wed, 05 Apr 2023 20:16:34 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id d2so33029658vso.9;
 Wed, 05 Apr 2023 17:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFEKjNAGJNj6N41AbMKSQ/SZ4hpW56LfyFA1xqP0moY=;
 b=fAZby3S4iRpO59QtGr+JDcCPbPOyvMfr/Az7YvkGVuHLI74oS0LkKyMrCCWBsAt5Mi
 rVB4vo1bXKw0OZS8cH6qGBJUv0yhPboYxgn1yo9Y10GGalFcbhbfRsKORKU4iMjtlk3Z
 J1pYHPBys9OeVDCQL1pFeYCEWVGB4agacgUbiL51mj77gBECiWeNIE9vXhr8ILpg/+Su
 c3LtOg/Xgisk/IZHDJ1q1t7If2704TD0VsW3UFWfhb4ZXbjV7aGaoqhSfZ6uBshJAEIb
 aNDhygoFHxnLQLshrkF94Sc041dlGL9ohdJzkLHjJtlJlGOShYWDMimIpHDQkhqzhHJ2
 ob9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFEKjNAGJNj6N41AbMKSQ/SZ4hpW56LfyFA1xqP0moY=;
 b=UlQ9u+KbVSC99W00Qiscp+K4M5ZXHXZCYGg+Dh5AxYgm0rkZcZ6ypfB/GBzoL+62XM
 wPvYU7xmRs0iRssvaexriVR+rXevhlmY2i7nxv91rlvxp+L0VbAGR+FTwuC4hcG3VuKv
 BHnuRT87VWNK32DoBzi72pnUdUm6Etb2wwj/andEsHtxJQszWhghwJ5LW7fvWZy3K4FK
 ZwpqPqIDA8xkIdheoYgVLYLER21EQxvbM3kz8D+ajHjWy3rTjLk+acZduY6WWoIF6A1m
 QEj/GhTATdWn0cimIMGPTcGzF6tviXKNwWJWoxbBlpVU7A4ofJ0CMMtmTzrbsHk6GUB8
 Ok0A==
X-Gm-Message-State: AAQBX9e6AkXmqx3k0f6SnFQc9ZTA6aj3TYfQl2JpdgvaoJVBVDDpdslG
 yf5Flzp4Zu11LbmWEXVfJeHP7/SDId0ACEb69ck=
X-Google-Smtp-Source: AKy350ZFwgfRD2iaP1J1oKx91xer2FUpLgJGuGkM/cRdWvbNflTSeH8fb+dq3RIxkzrNBGLtnJtK2Q7vpu9Q53qHIOU=
X-Received: by 2002:a67:ca90:0:b0:422:1654:7737 with SMTP id
 a16-20020a67ca90000000b0042216547737mr6357025vsl.3.1680740191201; Wed, 05 Apr
 2023 17:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:16:05 +1000
Message-ID: <CAKmqyKNgc8mkE+5e+zXP_SKAfK4LD3gTzXao__3oeHW2DTJGqQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] target/riscv: remove cpu->cfg.ext_i
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:16:34 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "i" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVI. Instances of cpu->cfg.ext_i and similar are
> replaced with riscv_has_ext(env, RVI).
>
> Remove the old "i" property and 'ext_i' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 15 +++++++--------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f53400d40f..2156cb380e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,13 +810,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>
>      /* Do some ISA extension error checking */
> -    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> +    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
>                              riscv_has_ext(env, RVA) &&
>                              riscv_has_ext(env, RVF) &&
>                              riscv_has_ext(env, RVD) &&
>                              cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -        cpu->cfg.ext_i =3D true;
>          cpu->cfg.ext_m =3D true;
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
> @@ -825,13 +824,13 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>          env->misa_ext_mask =3D env->misa_ext;
>      }
>
> -    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
>          error_setg(errp,
>                     "I and E extensions are incompatible");
>          return;
>      }
>
> -    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> +    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
>          error_setg(errp,
>                     "Either I or E extension must be set");
>          return;
> @@ -843,7 +842,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
> +    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
>          error_setg(errp,
>                     "H depends on an I base integer ISA with 32 x registe=
rs");
>          return;
> @@ -1088,7 +1087,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>  {
>      uint32_t ext =3D 0;
>
> -    if (riscv_cpu_cfg(env)->ext_i) {
> +    if (riscv_has_ext(env, RVI)) {
>          ext |=3D RVI;
>      }
>      if (riscv_cpu_cfg(env)->ext_e) {
> @@ -1442,6 +1441,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVD, .enabled =3D true},
>      {.name =3D "f", .description =3D "Single-precision float point",
>       .misa_bit =3D RVF, .enabled =3D true},
> +    {.name =3D "i", .description =3D "Base integer instruction set",
> +     .misa_bit =3D RVI, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1464,7 +1465,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
> @@ -1575,7 +1575,6 @@ static void register_cpu_props(Object *obj)
>       * later on.
>       */
>      if (cpu->env.misa_ext !=3D 0) {
> -        cpu->cfg.ext_i =3D misa_ext & RVI;
>          cpu->cfg.ext_e =3D misa_ext & RVE;
>          cpu->cfg.ext_m =3D misa_ext & RVM;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ce23b1c431..573bf85ff1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -418,7 +418,6 @@ typedef struct {
>  } RISCVSATPMap;
>
>  struct RISCVCPUConfig {
> -    bool ext_i;
>      bool ext_e;
>      bool ext_g;
>      bool ext_m;
> --
> 2.39.2
>
>

