Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDQl-0004fl-Bu
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDQk-0004fS-AP; Wed, 05 Apr 2023 20:24:46 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDQi-0005BY-BW; Wed, 05 Apr 2023 20:24:45 -0400
Received: by mail-vs1-xe32.google.com with SMTP id dg15so21418718vsb.13;
 Wed, 05 Apr 2023 17:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbAH86KQKVoCbn73cV3run/EtmMCpm2ghNbx9aN0bPk=;
 b=TqPFC0bKXksfXvtEnewl0Ds3oCQnBJDNJ6PjlidoxET5pU9Slk1r984fs279EgT4bb
 uLWsYNd8a7i96ZChL1gFSyvFqZs9OEDCC0oAnhuRDUjkkQOltSLEpWU4UldsqTGBUcQY
 JS2MyXDR6ip/YXECDzkGaqZ9SBRuqT4zAXkbOfIJlkLBKvRdvCPm2OfZuD29HRn5fPhP
 RqYhjONmhDI5fOnzdQFixx9iDZGg0QGgut1m5E/A91nwxWIUisb4gE4YFEQ1h5/QU0nl
 uPvM+wgaKXUmV2mm2MTkSPEO/SLmjUM9e5k92jfo/wJyCNnintRygnOQyohlfJh6nYds
 V+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbAH86KQKVoCbn73cV3run/EtmMCpm2ghNbx9aN0bPk=;
 b=fWEDOTqDhuVblFuD6VBszpudZsh+EbDgLE/jKvBugm8FoTbpXc0BGU4ml3+lUCYmvQ
 PCXK3rCux+riDWrqQ9jDjhjaeC7pkPUUGPLokbDWM2zbISwnV5zHKj6MAUYR+lEEMaJJ
 WJntBSydYe+5AAt+VjVXguqwQzBwYmV2zzodVA0KG7gIgzlOPu+pZNbEhxNw2bru/2uj
 YPRLD8GtctIk5jBR560eeZZ1W+QAxQrdLsXngJLZvtyf7Pxwy0Ug8ASUC2pJ5kUxN6ul
 hs89wlhbplcI1PzL9mY0Hi2Hrj8xaEz+DTvl352p6VgQWIG5AVH14DBsZyKW3YUHEZyN
 YFjQ==
X-Gm-Message-State: AAQBX9fIQuudRKO/cLIdbuag8g8dc+2auqmHIPhsZ9g6X5b7nrlCH9Kh
 T8VhRR1Mb3nlIigHFGlRnVKD98+TfXv649LfBZ4=
X-Google-Smtp-Source: AKy350bDaDYwNgQgWZNbkGlQZb16+cF0mbMpKSLQ05n3LVZ/swwKz008GHhkee8/QpeSTF2SB++dUSas0B6cSD/Om9g=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr5669181vsk.3.1680740682890; Wed, 05 Apr
 2023 17:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-20-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-20-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:24:16 +1000
Message-ID: <CAKmqyKPvLtoHQuG_+QbZRLJTPubM5H1Mzt=Xo9d=+8WHLio7Ng@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] target/riscv: add RVG and remove cpu->cfg.ext_g
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
X-List-Received-Date: Thu, 06 Apr 2023 00:24:46 -0000

On Thu, Mar 30, 2023 at 3:33=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're still have one RISCVCPUConfig MISA flag, 'ext_g'. We'll remove it
> the same way we did with the others: create a "g" RISCVCPUMisaExtConfig
> property, remove the old "g" property, remove all instances of 'cfg.ext_g=
'
> and use riscv_has_ext(env, RVG).
>
> The caveat is that we don't have RVG, so add it. RVG will be used right
> off the bat in set_misa() of rv64_thead_c906_cpu_init() because the CPU i=
s
> enabling G via the now removed 'ext_g' flag.
>
> After this patch, there are no more MISA extensions represented by flags
> in RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 17 ++++++++---------
>  target/riscv/cpu.h |  2 +-
>  2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 036d6191ca..6988ff443a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -396,10 +396,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV64, RVC | RVS | RVU);
> +    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>
> -    cpu->cfg.ext_g =3D true;
>      cpu->cfg.ext_zfh =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.ext_xtheadba =3D true;
> @@ -807,12 +806,11 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>
>      /* Do some ISA extension error checking */
> -    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
> -                            riscv_has_ext(env, RVM) &&
> -                            riscv_has_ext(env, RVA) &&
> -                            riscv_has_ext(env, RVF) &&
> -                            riscv_has_ext(env, RVD) &&
> -                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
> +    if (riscv_has_ext(env, RVG) &&
> +        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
> +          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
> +          riscv_has_ext(env, RVD) &&
> +          cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
> @@ -1402,6 +1400,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVJ, .enabled =3D false},
>      {.name =3D "v", .description =3D "Vector operations",
>       .misa_bit =3D RVV, .enabled =3D false},
> +    {.name =3D "g", .description =3D "General purpose (IMAFD_Zicsr_Zifen=
cei)",
> +     .misa_bit =3D RVG, .enabled =3D false},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1424,7 +1424,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c0280ace2a..ce92e8393d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -81,6 +81,7 @@
>  #define RVU RV('U')
>  #define RVH RV('H')
>  #define RVJ RV('J')
> +#define RVG RV('G')
>
>
>  /* Privileged specification version */
> @@ -418,7 +419,6 @@ typedef struct {
>  } RISCVSATPMap;
>
>  struct RISCVCPUConfig {
> -    bool ext_g;
>      bool ext_zba;
>      bool ext_zbb;
>      bool ext_zbc;
> --
> 2.39.2
>
>

