Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDOC-0002Nl-0g
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDO9-0002NQ-UW; Wed, 05 Apr 2023 20:22:05 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDO8-0004k7-B1; Wed, 05 Apr 2023 20:22:05 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id h27so33076917vsa.1;
 Wed, 05 Apr 2023 17:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXG2V1mvfmiB0sC7kJP6BNX/6KgWdBhtv+hpoN4jxWI=;
 b=cxOfFKHuya/WJYuuBIxbdbpaJloogfHtqMCZyOGmPCfKi0O2SxAtgqYk1HOT8fg0tR
 W1NYrBmcgxe+U67FSsdi6t+GxqFF6LVeQoJHH6Oh9P6LcoMIuF+vhjLEYB3zD4nZs1Gy
 8LjUtQahC1RFQ+uyEJLd6u7eKlUOoF86jncxG1HMJKGz8lKtgfcYNaAG6T4J+PUznFAs
 45p6aI80pLEwzoGdlmIiEVt2AXbSKvKIn79wRpaYwZZagIjmDfYo8JVbA2GMJN4GUgWD
 5JLlfkNyyIOBFJsnVUIqi6yyB/cKg0wNlOkQqxUOYp8yhZ7x1hmnt2Qu/Cw/pBqFng+m
 KWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXG2V1mvfmiB0sC7kJP6BNX/6KgWdBhtv+hpoN4jxWI=;
 b=W2uYcWFfUyY32LBrZPq6uB6mQDayEH60CsQirv5Y0IUXAAEuNrN02YpeSmS5mrx/aC
 CtvnQY/6hVUkODZyRxfJjcJScEo4Hv/71d0A5Y4y7YdjZNBJCLwrgrSzvk7FnEX80PsM
 6PkpfbZKUDbw71osmFNRvrnsFlczNmXtg5FJmj9YUPcNVUs4j/g/oXdjqDkGEDrkM2X0
 XC3Z44YyYQXllEDWxUrYuFQ2hXIdhW9A1VVNUCxHwVW+qixmvP8rfE35GFgg6ocWcaOy
 9grlD9FCRI1bpH0IcVAN8wIWbsmLpAAulgi7CxpLIb50Yk9s8jblAUS36wzq6snmWEwY
 oWlQ==
X-Gm-Message-State: AAQBX9fuLIlj2rpEM5pURvbs8xyTOSNUlqhdktJYjrCD4l3njIRTQlrF
 Cu41Y4+I8wVdLB5y2oYSKkeJImjpWxZegUd2cWQ=
X-Google-Smtp-Source: AKy350Y3yWvPIzWbmibXx/20jzvSMiJH6YOsPzXABHVnT/6kTvfd7Hjb4SytAVcdCA4abpgk4tXSQT+l5Mh7FcdvdNE=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr5666053vsk.3.1680740522794; Wed, 05 Apr
 2023 17:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-17-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-17-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:21:36 +1000
Message-ID: <CAKmqyKNEXq-_faAdNDa_jFA=N3dqwori67mmt42rLqirLpw2SA@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] target/riscv: remove cpu->cfg.ext_v
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
X-List-Received-Date: Thu, 06 Apr 2023 00:22:06 -0000

On Thu, Mar 30, 2023 at 3:33=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "v" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVV. Instances of cpu->cfg.ext_v and similar are
> replaced with riscv_has_ext(env, RVV).
>
> Remove the old "v" property and 'ext_v' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 12 +++++-------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 86edc08545..b40a55bc8d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -876,7 +876,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>      }
>
>      /* The V vector extension depends on the Zve64d extension */
> -    if (cpu->cfg.ext_v) {
> +    if (riscv_has_ext(env, RVV)) {
>          cpu->cfg.ext_zve64d =3D true;
>      }
>
> @@ -958,7 +958,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_zksh =3D true;
>      }
>
> -    if (cpu->cfg.ext_v) {
> +    if (riscv_has_ext(env, RVV)) {
>          int vext_version =3D VEXT_VERSION_1_00_0;
>          if (!is_power_of_2(cpu->cfg.vlen)) {
>              error_setg(errp,
> @@ -1115,7 +1115,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVH)) {
>          ext |=3D RVH;
>      }
> -    if (riscv_cpu_cfg(env)->ext_v) {
> +    if (riscv_has_ext(env, RVV)) {
>          ext |=3D RVV;
>      }
>      if (riscv_has_ext(env, RVJ)) {
> @@ -1453,6 +1453,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVH, .enabled =3D true},
>      {.name =3D "x-j", .description =3D "Dynamic translated languages",
>       .misa_bit =3D RVJ, .enabled =3D false},
> +    {.name =3D "v", .description =3D "Vector operations",
> +     .misa_bit =3D RVV, .enabled =3D false},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1476,7 +1478,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
> -    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> @@ -1569,7 +1570,6 @@ static Property riscv_cpu_extensions[] =3D {
>  static void register_cpu_props(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint32_t misa_ext =3D cpu->env.misa_ext;
>      Property *prop;
>      DeviceState *dev =3D DEVICE(obj);
>
> @@ -1579,8 +1579,6 @@ static void register_cpu_props(Object *obj)
>       * later on.
>       */
>      if (cpu->env.misa_ext !=3D 0) {
> -        cpu->cfg.ext_v =3D misa_ext & RVV;
> -
>          /*
>           * We don't want to set the default riscv_cpu_extensions
>           * in this case.
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 43a40ba950..c0280ace2a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_v;
>      bool ext_zba;
>      bool ext_zbb;
>      bool ext_zbc;
> --
> 2.39.2
>
>

