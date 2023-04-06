Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDJT-0006Gf-9W
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDJQ-0006A5-KD; Wed, 05 Apr 2023 20:17:13 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDJO-0002g5-4w; Wed, 05 Apr 2023 20:17:12 -0400
Received: by mail-vs1-xe34.google.com with SMTP id dg15so21407639vsb.13;
 Wed, 05 Apr 2023 17:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEPk2MKJamBrPFi/dlaGy6vRXuo7IN3z9gLA/DoqVKk=;
 b=OvtcXIixV0bLTL92ujD0l9zXInTlLnO39kTxIn/gopKhhtlJ6pIL9JLt7wGg+0pCM4
 fgvB3rOQaynflLmpqsBVwZP/k9CgST2JWN97s1wSz6OYUGvFlFDH5dRl9pMsLJMwzZbi
 9pbNVl+tC+UyAw+0IQlx5xDR5YnJ8+4eeO2dSeOqFBCGhUcgtflAjzjMntVNsS5+TTWv
 nh+mCh5cwrg6UEP4I9Gpu5ilrhpzIP2v4VFIsaACNvZyYrFCTZwePCuHVhwRLBbeEf6F
 p0TlmpZqqs+tT16Eck39M6pac47mu2kDCCxiqhNetCYZSren3WzPF/p1Kdw/LP8iCVyr
 Ifrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEPk2MKJamBrPFi/dlaGy6vRXuo7IN3z9gLA/DoqVKk=;
 b=oj6NKs3QT1oV9PEoatvJcZnmCG/8jPRU6LaKnHiHzKcV3o2nVx2kI0sF8H17BoTg5W
 9Gyz3LIBHjuEeVK6Q7PMXhSfGtnQ8dcFfHmlGjUlwNTxywqQtCUv11sIWcJi3JuBcf0a
 DdO+IdErsDCuKAWy89GbLKj3JTjRR+SdX0XoPCpw+qCzqUXbcoC3mM8BeBx8/FC5i+JG
 d4PM3QNuqgBmW4wdZNq7QYIjSRDKTf7spjFUHEffLijbeKJCEpfCTdtLoP5lJJh+p+Hs
 sKCgV4uJP3cuORmzvhe/JVy1YG1OWIWUJ6CRIVgQvPABqFQ+zMskWaVWGv1pxfVdhi8B
 N5lw==
X-Gm-Message-State: AAQBX9e1+TKCqSr/sF4C8IS6g4AConZVSQ4Le8Mv4YyOJhafyxZ78lbL
 zOawtaWhEz7fFh2ul9e49eKhgLROdJf0rWX3JTs=
X-Google-Smtp-Source: AKy350Y5q7AkLbe3TBsrIAtvBw9hE7XFoBrXBxIN9AmWyctNQ02LwnEqkdSCW2zhHWjoA1o3SR7qMPVnrQQVGOywxjw=
X-Received: by 2002:a67:e096:0:b0:412:2ed6:d79b with SMTP id
 f22-20020a67e096000000b004122ed6d79bmr5975464vsl.3.1680740227500; Wed, 05 Apr
 2023 17:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:16:41 +1000
Message-ID: <CAKmqyKNMvrerixo8RZ3NcZ30N3HfXQ7_i-CJrxMnw2OkvQcT8w@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] target/riscv: remove cpu->cfg.ext_e
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:17:14 -0000

On Thu, Mar 30, 2023 at 3:33=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "e" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVE. Instances of cpu->cfg.ext_e and similar are
> replaced with riscv_has_ext(env, RVE).
>
> Remove the old "e" property and 'ext_e' from RISCVCPUConfig.
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
> index 2156cb380e..9cf3ab3988 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -824,13 +824,13 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>          env->misa_ext_mask =3D env->misa_ext;
>      }
>
> -    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
> +    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
>          error_setg(errp,
>                     "I and E extensions are incompatible");
>          return;
>      }
>
> -    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
> +    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
>          error_setg(errp,
>                     "Either I or E extension must be set");
>          return;
> @@ -1090,7 +1090,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVI)) {
>          ext |=3D RVI;
>      }
> -    if (riscv_cpu_cfg(env)->ext_e) {
> +    if (riscv_has_ext(env, RVE)) {
>          ext |=3D RVE;
>      }
>      if (riscv_cpu_cfg(env)->ext_m) {
> @@ -1443,6 +1443,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVF, .enabled =3D true},
>      {.name =3D "i", .description =3D "Base integer instruction set",
>       .misa_bit =3D RVI, .enabled =3D true},
> +    {.name =3D "e", .description =3D "Base integer instruction set (embe=
dded)",
> +     .misa_bit =3D RVE, .enabled =3D false},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1465,7 +1467,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
> @@ -1575,7 +1576,6 @@ static void register_cpu_props(Object *obj)
>       * later on.
>       */
>      if (cpu->env.misa_ext !=3D 0) {
> -        cpu->cfg.ext_e =3D misa_ext & RVE;
>          cpu->cfg.ext_m =3D misa_ext & RVM;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
>          cpu->cfg.ext_s =3D misa_ext & RVS;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 573bf85ff1..cc0b9e73ac 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -418,7 +418,6 @@ typedef struct {
>  } RISCVSATPMap;
>
>  struct RISCVCPUConfig {
> -    bool ext_e;
>      bool ext_g;
>      bool ext_m;
>      bool ext_s;
> --
> 2.39.2
>
>

