Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDLF-0007u2-DX
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDLE-0007tf-2S; Wed, 05 Apr 2023 20:19:04 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDLC-0003DT-E3; Wed, 05 Apr 2023 20:19:03 -0400
Received: by mail-ua1-x930.google.com with SMTP id i22so26799276uat.8;
 Wed, 05 Apr 2023 17:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/sjQTGSt2TynqjDj7rHrQDmNFrpbQNR7kD3FgNQAdxg=;
 b=i2YkAvkJjo51xS63MJgppEmbiXeXxG5c1U3kshaEghiKBkbY2dQ8mJu7YAS9jQjxBw
 A1MKGu4qZvmJivaQIJkZNmq3xnHr1LCQ9oqq9xOvpK/Gm4zUbztv5BaGX8FY10cIDO/j
 wKjAFeW3SrsqSHwPk8+4lCzsDlU0eFeyTID3nREaT/1shdI+HY0zVJwuEo3duw7/YNkl
 yGBWCiWNPyrLCHqKgW4nwDnPIOgfoDP3Rpr16+BpuRCtu7/+yWUGLEuRf5IZxZLWWHnt
 +z6y7lF6yw9Uopmj/xHknX64OZ8+bfe4WZE5oJYMdaMe4iiEnzkbIhF4TCeNEsT5jZqu
 DWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sjQTGSt2TynqjDj7rHrQDmNFrpbQNR7kD3FgNQAdxg=;
 b=MFqmCfC9nlntWL9TuFP4PJOG6GgsIT4IUJNnsSwCisJURQi1/keLrNzmZx9kV3pDRj
 tbBiIL+C6L48rm4eTHdLFhyUqAluiBwsPzR9UYNfp8wAQvJFulphZMVwtxiodUqEEgOJ
 tFvcuxrGr2eqM41nU7s1aWLfJ8hJ3OC9yiwLV5l1pssM44Oli8HfTnPkVATDy+4G+z/q
 5YN+0lUS6s3kZlSvy8rIIROUtPJv612OXBLy4qUuh7x1m6vGkB0yyn+yQfbKQqoR9kKy
 euQFc75LqYgiYS0bNKep6DB2pUuAsnfH9DGOqG5A9X53BpWFkdGGwFV1XPCl5U0L34Kq
 W4JA==
X-Gm-Message-State: AAQBX9cLAIjNCOKB2aUZtmL/bEvlq2AiaFltNNKeoiqPi/zdFEtqeJwK
 K9taJJ0m1ofUY5+QCmNqRKgMadV924khT8b0oqY=
X-Google-Smtp-Source: AKy350bef8mleO7G7gD8R6yfXcI3DkdgML4DjjN4MTb6KZ+67yR/dx/CIp14FR3sXitUxxbVJDtUbfjKjth3mbQNQos=
X-Received: by 2002:a1f:90c9:0:b0:43c:6ef1:7116 with SMTP id
 s192-20020a1f90c9000000b0043c6ef17116mr6209897vkd.0.1680740340955; Wed, 05
 Apr 2023 17:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-13-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:18:34 +1000
Message-ID: <CAKmqyKPtzHJDfjTfTmYzaLai7PFB30icjKR=6VVQEGDZHic9VQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/20] target/riscv: remove cpu->cfg.ext_s
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:19:04 -0000

On Thu, Mar 30, 2023 at 3:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "s" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
> replaced with riscv_has_ext(env, RVS).
>
> Remove the old "s" property and 'ext_s' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 11 +++++------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6861446489..59f6711f94 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -401,7 +401,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>
>      cpu->cfg.ext_g =3D true;
>      cpu->cfg.ext_u =3D true;
> -    cpu->cfg.ext_s =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.ext_zfh =3D true;
>      cpu->cfg.mmu =3D true;
> @@ -836,7 +835,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
> +    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
>          error_setg(errp,
>                     "Setting S extension without U extension is illegal")=
;
>          return;
> @@ -848,7 +847,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
> +    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
>          error_setg(errp, "H extension implicitly requires S-mode");
>          return;
>      }
> @@ -1108,7 +1107,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVC)) {
>          ext |=3D RVC;
>      }
> -    if (riscv_cpu_cfg(env)->ext_s) {
> +    if (riscv_has_ext(env, RVS)) {
>          ext |=3D RVS;
>      }
>      if (riscv_cpu_cfg(env)->ext_u) {
> @@ -1447,6 +1446,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVE, .enabled =3D false},
>      {.name =3D "m", .description =3D "Integer multiplication and divisio=
n",
>       .misa_bit =3D RVM, .enabled =3D true},
> +    {.name =3D "s", .description =3D "Supervisor-level instructions",
> +     .misa_bit =3D RVS, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1470,7 +1471,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
> -    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> @@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
>       */
>      if (cpu->env.misa_ext !=3D 0) {
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> -        cpu->cfg.ext_s =3D misa_ext & RVS;
>          cpu->cfg.ext_u =3D misa_ext & RVU;
>          cpu->cfg.ext_h =3D misa_ext & RVH;
>          cpu->cfg.ext_j =3D misa_ext & RVJ;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7a42c80b7d..fc35aa7509 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_s;
>      bool ext_u;
>      bool ext_h;
>      bool ext_j;
> --
> 2.39.2
>
>

