Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDGa-0003Ox-7C
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDGY-0003OG-En; Wed, 05 Apr 2023 20:14:14 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDGL-0001km-UP; Wed, 05 Apr 2023 20:14:14 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id d2so33025343vso.9;
 Wed, 05 Apr 2023 17:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GCPu8ZlKnkKU6Y+QMO0FBRjOLgRK9A95YEoB3AkehI=;
 b=YZrCYitVR5LxZFhSAUwRO4VEglILxdrYLqdkpHC0C5/WOWHXnV3TeWKWZabV9bD5+k
 akomaDpxNhLwtmbJTSRXvaFtyeMEVhNeCBJhblB/nTGQ2cfGoSY8RtQg2puAI1MqBr3a
 aoETuAoLlmZ8pF/YPZVe4t5GEM75TT5u4gDEU3OQE9MVrTT5Io6iHj0FtSF7yznO2pZR
 niIZGJEclZa556QxsUaaUjkLsdvsI6hZS9b8/ZDXrnpmcD4OM5NvuepalSPUMMGzH+3a
 fv8ESbPAgcNtBkWwjyDHMvm/BWxVbaTSJu2OyG1Dvep5yHPbrxHolfVGGA3oB3/oNqK2
 hBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GCPu8ZlKnkKU6Y+QMO0FBRjOLgRK9A95YEoB3AkehI=;
 b=Jzrnvx8bDeMrNT5shBR3SM2RWLQAb9v10kzeVJOvljCEZO7hh9NLBIFZ2r/HYrbcEJ
 Yrw7YYEFc5P+Le9T+LtN8zjTlfS4rTr41aDYkMPjKOx21asRobZyqwMRkaLa2BEVAGKt
 rE471fUP7s3pusZ8aGRb9PzQDpHq2hnGxH1CAjshlnSUfOS6jZXw2iNZHHYVo7wRIs1m
 1yglTBsW+i1e/ba+G9HA73ZJULU10jPolIVlmx3vyqDDBSRHHU4xMwZeUIm60hhUWxIx
 QtabZosz6S9xvR0LHoaLPpvmz+luRUXehmhnsaxDqpEIM3lTxC/+NuWspTHiJZzWEQnU
 cLhA==
X-Gm-Message-State: AAQBX9cr/J+3Yq+EOLHJi0FLP4UX7IN2z2lC7dbLlLXOVVKhiTrJFSC0
 IqpDFFv4NOU9B9tvp1xzSB85iYg3o01PRYq10/Q=
X-Google-Smtp-Source: AKy350YRRoMl1ZHfrFZ7m6fKhxpoSvLgz101egchcoY7Nuiemp5DTKRGdPWAu8gej79zC1RXUe43/K9x4/6L+L5+JjU=
X-Received: by 2002:a67:e106:0:b0:402:999f:51dd with SMTP id
 d6-20020a67e106000000b00402999f51ddmr6600302vsl.3.1680740008391; Wed, 05 Apr
 2023 17:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:13:02 +1000
Message-ID: <CAKmqyKMhB6oOEZ68U1q9u4wrxhVRk5WBobdhT9iG0Q5tfM0HJw@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] target/riscv: remove cpu->cfg.ext_c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:14:14 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "c" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVC. Instances of cpu->cfg.ext_c and similar are
> replaced with riscv_has_ext(env, RVC).
>
> Remove the old "c" property and 'ext_c' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++----
>  target/riscv/cpu.h | 1 -
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 63efd1b313..693ff10cab 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -400,7 +400,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>
>      cpu->cfg.ext_g =3D true;
> -    cpu->cfg.ext_c =3D true;
>      cpu->cfg.ext_u =3D true;
>      cpu->cfg.ext_s =3D true;
>      cpu->cfg.ext_icsr =3D true;
> @@ -1108,7 +1107,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_cpu_cfg(env)->ext_d) {
>          ext |=3D RVD;
>      }
> -    if (riscv_cpu_cfg(env)->ext_c) {
> +    if (riscv_has_ext(env, RVC)) {
>          ext |=3D RVC;
>      }
>      if (riscv_cpu_cfg(env)->ext_s) {
> @@ -1438,6 +1437,8 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visit=
or *v, const char *name,
>  static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
>      {.name =3D "a", .description =3D "Atomic instructions",
>       .misa_bit =3D RVA, .enabled =3D true},
> +    {.name =3D "c", .description =3D "Compressed instructions",
> +     .misa_bit =3D RVC, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1466,7 +1467,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>      DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
>      DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
> -    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> @@ -1580,7 +1580,6 @@ static void register_cpu_props(Object *obj)
>          cpu->cfg.ext_f =3D misa_ext & RVF;
>          cpu->cfg.ext_d =3D misa_ext & RVD;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> -        cpu->cfg.ext_c =3D misa_ext & RVC;
>          cpu->cfg.ext_s =3D misa_ext & RVS;
>          cpu->cfg.ext_u =3D misa_ext & RVU;
>          cpu->cfg.ext_h =3D misa_ext & RVH;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f703888310..c6dc24d236 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -424,7 +424,6 @@ struct RISCVCPUConfig {
>      bool ext_m;
>      bool ext_f;
>      bool ext_d;
> -    bool ext_c;
>      bool ext_s;
>      bool ext_u;
>      bool ext_h;
> --
> 2.39.2
>
>

