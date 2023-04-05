Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkCGw-0006z3-6g
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 19:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCGu-0006yf-4G; Wed, 05 Apr 2023 19:10:32 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCGs-0005VM-7C; Wed, 05 Apr 2023 19:10:31 -0400
Received: by mail-vs1-xe32.google.com with SMTP id i10so32920900vss.5;
 Wed, 05 Apr 2023 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680736228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MwyItWYs+ubwR8j7nEoNfe/Bw5k+93S+Bb45XGvixg=;
 b=igbe3PYE2pB3acf5PSdaevvlvpvE2x3eC9MsdRaG0PgQm1zaHvYCW6avmcdWPQUZ4d
 AhsYHzLqkjILI0z7nR3j0h7MEGWf1WbCS5cbYJ0g3ehmdG5Elim50AR2by+mZfRgMxcK
 MagaP/LGE7y9dXHMa3NeADaRwRZo/eilmC7Zy2ZjK+3Ke3yJ/5lyG+81ZoXn7+F8o7qm
 /sNPcwN8Ic1d1EvJmIyaRX2h307D9HMfXCP/HegAC+qkTCv0RFjX7lbWWNk0oRo9NkHX
 15PS2WiLtalmbtboC4CnUIDeXpAzUZOcKnCxvyarsntjOm48k+H8uX4qgRMAFCw0d/Sr
 mowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680736228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MwyItWYs+ubwR8j7nEoNfe/Bw5k+93S+Bb45XGvixg=;
 b=m0EOVzAtF+mxCBjgnGvTIreCYE9StoEENyx6BSOEBDoZ6qwfN6o6qrCXPdh/qhjys3
 CwcUW9xwErnEhP3MHT1P5pDxhPYNFBu8fynTS6aFM/ExoZcSCewW7Mavzp9whKqL9QTD
 EJOVunxv2UzmTLtiSzS2NFa5rm9SQ+Wr6plDx0dnHvrFlPhdgQIkxzQkvJ9L+fYUfcfB
 vXc7V2Whs2QH/Q0MLS5H0rywBoFvA8ekaLpyvXZWqkMHs5W5e2cYK35PYE+06/RULF5F
 3okEr+9jceGPZMq2iYIELkOft2/FfhHiYMTIsCJ8dcw6ZZ6MHYHXTV3rSzp/MpxLZgvp
 Y7FA==
X-Gm-Message-State: AAQBX9fQimuHOx1uaE8+sFMsqMVhuRPEtqcOaRpJ21loj35sP8PMJR6J
 3a03Z6jnuwtYt2IyYirf3CimYeMw1HbSQ1j3BaR0MGBnmqNDcg==
X-Google-Smtp-Source: AKy350a0RrPdcRZMOqfVmdpUDluF8NdLTSMjp/9IUyTC+Tor0RmBpOMd8yXcvNDwXW02hW/0sClyhUOB68bEWBQeKLQ=
X-Received: by 2002:a05:6102:3d29:b0:425:ddcf:69b3 with SMTP id
 i41-20020a0561023d2900b00425ddcf69b3mr4521809vsv.0.1680736228393; Wed, 05 Apr
 2023 16:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 09:10:02 +1000
Message-ID: <CAKmqyKM45Re66okX-EcBMvSz29dq7NOKgWUFsgQ0J9vaWkG3kg@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] target/riscv: sync env->misa_ext* with cpu->cfg
 in realize()
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
X-List-Received-Date: Wed, 05 Apr 2023 23:10:32 -0000

On Thu, Mar 30, 2023 at 3:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> When riscv_cpu_realize() starts we're guaranteed to have cpu->cfg.ext_N
> properties updated. The same can't be said about env->misa_ext*, since
> the user might enable/disable MISA extensions in the command line, and
> env->misa_ext* won't caught these changes. The current solution is to
> sync everything at the end of validate_set_extensions(), checking every
> cpu->cfg.ext_N value to do a set_misa() in the end.
>
> The last change we're making in the MISA cfg flags are in the G
> extension logic, enabling IMAFG if cpu->cfg_ext.g is enabled. Otherwise
> we're not making any changes in MISA bits ever since realize() starts.
>
> There's no reason to postpone misa_ext updates until the end of the
> validation. Let's do it earlier, during realize(), in a new helper
> called riscv_cpu_sync_misa_cfg(). If cpu->cfg.ext_g is enabled, do it
> again by updating env->misa_ext* directly.
>
> This is a pre-requisite to allow riscv_cpu_validate_set_extensions() to
> use riscv_has_ext() instead of cpu->cfg.ext_N to validate the MISA
> extensions, which is our end goal here.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 94 +++++++++++++++++++++++++++-------------------
>  1 file changed, 56 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..2711d80e16 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -804,12 +804,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, d=
isassemble_info *info)
>
>  /*
>   * Check consistency between chosen extensions while setting
> - * cpu->cfg accordingly, doing a set_misa() in the end.
> + * cpu->cfg accordingly.
>   */
>  static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
>  {
>      CPURISCVState *env =3D &cpu->env;
> -    uint32_t ext =3D 0;
>
>      /* Do some ISA extension error checking */
>      if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> @@ -824,6 +823,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_d =3D true;
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
> +
> +        env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> +        env->misa_ext_mask =3D env->misa_ext;
>      }
>
>      if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> @@ -962,39 +964,8 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
>          cpu->cfg.ext_zksh =3D true;
>      }
>
> -    if (cpu->cfg.ext_i) {
> -        ext |=3D RVI;
> -    }
> -    if (cpu->cfg.ext_e) {
> -        ext |=3D RVE;
> -    }
> -    if (cpu->cfg.ext_m) {
> -        ext |=3D RVM;
> -    }
> -    if (cpu->cfg.ext_a) {
> -        ext |=3D RVA;
> -    }
> -    if (cpu->cfg.ext_f) {
> -        ext |=3D RVF;
> -    }
> -    if (cpu->cfg.ext_d) {
> -        ext |=3D RVD;
> -    }
> -    if (cpu->cfg.ext_c) {
> -        ext |=3D RVC;
> -    }
> -    if (cpu->cfg.ext_s) {
> -        ext |=3D RVS;
> -    }
> -    if (cpu->cfg.ext_u) {
> -        ext |=3D RVU;
> -    }
> -    if (cpu->cfg.ext_h) {
> -        ext |=3D RVH;
> -    }
>      if (cpu->cfg.ext_v) {
>          int vext_version =3D VEXT_VERSION_1_00_0;
> -        ext |=3D RVV;
>          if (!is_power_of_2(cpu->cfg.vlen)) {
>              error_setg(errp,
>                         "Vector extension VLEN must be power of 2");
> @@ -1032,11 +1003,6 @@ static void riscv_cpu_validate_set_extensions(RISC=
VCPU *cpu, Error **errp)
>          }
>          set_vext_version(env, vext_version);
>      }
> -    if (cpu->cfg.ext_j) {
> -        ext |=3D RVJ;
> -    }
> -
> -    set_misa(env, env->misa_mxl, ext);
>  }
>
>  #ifndef CONFIG_USER_ONLY
> @@ -1121,6 +1087,50 @@ static void riscv_cpu_finalize_features(RISCVCPU *=
cpu, Error **errp)
>  #endif
>  }
>
> +static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
> +{
> +    uint32_t ext =3D 0;
> +
> +    if (riscv_cpu_cfg(env)->ext_i) {

It's probably worth storing riscv_cpu_cfg(env) in a variable

But either way:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +        ext |=3D RVI;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_e) {
> +        ext |=3D RVE;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_m) {
> +        ext |=3D RVM;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_a) {
> +        ext |=3D RVA;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_f) {
> +        ext |=3D RVF;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_d) {
> +        ext |=3D RVD;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_c) {
> +        ext |=3D RVC;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_s) {
> +        ext |=3D RVS;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_u) {
> +        ext |=3D RVU;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_h) {
> +        ext |=3D RVH;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_v) {
> +        ext |=3D RVV;
> +    }
> +    if (riscv_cpu_cfg(env)->ext_j) {
> +        ext |=3D RVJ;
> +    }
> +
> +    env->misa_ext =3D env->misa_ext_mask =3D ext;
> +}
> +
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs =3D CPU(dev);
> @@ -1156,6 +1166,14 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          set_priv_version(env, priv_version);
>      }
>
> +    /*
> +     * We can't be sure of whether we set defaults during cpu_init()
> +     * or whether the user enabled/disabled some bits via cpu->cfg
> +     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
> +     * use just env->misa_ext later.
> +     */
> +    riscv_cpu_sync_misa_cfg(env);
> +
>      /* Force disable extensions if priv spec version does not match */
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> --
> 2.39.2
>
>

