Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppHMc-00060k-Qk
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 19:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHMb-00060P-A5; Wed, 19 Apr 2023 19:37:25 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHMZ-0008TY-82; Wed, 19 Apr 2023 19:37:24 -0400
Received: by mail-ua1-x934.google.com with SMTP id q10so1079913uas.2;
 Wed, 19 Apr 2023 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681947441; x=1684539441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqqZm/DodSP//fU6ax/35D3Y3xcpAGLRk4iXZwVi14g=;
 b=NAUQkF93TIYXNOxOyjohxN3cMDBc4TtjPW7KjO2DjYk5cDJMIRMsjdUGmOn5JNVEYU
 xzI9A/tM2S21FuIOIX1zA0sFcKb50G9XYZukTnafP3ZwM0Kotniw7L3y2lmxEathBVhq
 XX0fzDIE8Un3qj7ZP/HzplxFj91/A3UFdx8OEAgnRPTIwCgtHuO1ddCpHy8qnSGp8RAN
 kjPVCj8RuX9NMsWrZ31rHp+jcrv+GpJOZ4xeXQQ2ptZZ9CT3M7+HeSDMYdHn3XD5iQZF
 1Rr3r3fG5FH5c2/tCkSAA5meV6q8L1XaZl7tG4rEWvLY9s6vnE37Q/+hCYYxfZA1Y15q
 VPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681947441; x=1684539441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqqZm/DodSP//fU6ax/35D3Y3xcpAGLRk4iXZwVi14g=;
 b=l1PIWxldSxKp7HuIL07+bVlhzaD///u8CcvJWCWk7tc4O4GwRMoASYyVQGfGj+rkQu
 4Fo59YCkTILX7fSBLRzswBvshbaAl/vErwb8B7l4DDZwu8UMANWubxejMbelZ0B6SLBQ
 jk7jMDJrUr5TX7jCtdOTlHK43D0UQSZlaAFbLZe5zfM7b5OqDWqBpfzGwSg1MUR2gvTD
 ysKTRK9iMAqb3TnUdxMNIdUF95EHktr2n9+6dN3QTa63eDjVMWPp+mUXVCZ9NeAwvYcb
 3zO54tgibRsipyf5/RfYcJ8JEiIgNKt/vxbTHkMXwYpw00JO6JliZ4lGf9SDYRNw1Vgh
 o9tQ==
X-Gm-Message-State: AAQBX9eDg2PwUumJtAKhiOqRrnjBYOHT3gy2ksIXTDcsBemukmTnHEQM
 y7qwGOJxRgI5IJZ3uUsqBUeIotmhL6HJvMA+za5yNLwad1U=
X-Google-Smtp-Source: AKy350btxxfEzblKXApW99vz+eGIi5DDJ+7xUIu99A26Za6xujAzswiVIAy6ZGCVpkhcD22Oe7zxE5MEOEvTOHH3Jl8=
X-Received: by 2002:a1f:5e0d:0:b0:43f:b6d2:39c4 with SMTP id
 s13-20020a1f5e0d000000b0043fb6d239c4mr762132vkb.9.1681947441483; Wed, 19 Apr
 2023 16:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
 <20230417140013.58893-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230417140013.58893-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Apr 2023 09:36:54 +1000
Message-ID: <CAKmqyKP1TvUKVmvm+7CMp4y6z8Ec7dFPm7U5gp9Wv=73vH0KGw@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] target/riscv/cpu.c: add riscv_cpu_validate_v()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Apr 2023 23:37:25 -0000

On Tue, Apr 18, 2023 at 12:02=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The RVV verification will error out if fails and it's being done at the
> end of riscv_cpu_validate_set_extensions(), after we've already set some
> extensions that are dependent on RVV.  Let's put it in its own function
> and do it earlier.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 89 +++++++++++++++++++++++++---------------------
>  1 file changed, 48 insertions(+), 41 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index befa64528f..feca13aefb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -797,6 +797,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, di=
sassemble_info *info)
>      }
>  }
>
> +static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
> +                                 Error **errp)
> +{
> +    int vext_version =3D VEXT_VERSION_1_00_0;
> +
> +    if (!is_power_of_2(cfg->vlen)) {
> +        error_setg(errp, "Vector extension VLEN must be power of 2");
> +        return;
> +    }
> +    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
> +        error_setg(errp,
> +                   "Vector extension implementation only supports VLEN "
> +                   "in the range [128, %d]", RV_VLEN_MAX);
> +        return;
> +    }
> +    if (!is_power_of_2(cfg->elen)) {
> +        error_setg(errp, "Vector extension ELEN must be power of 2");
> +        return;
> +    }
> +    if (cfg->elen > 64 || cfg->elen < 8) {
> +        error_setg(errp,
> +                   "Vector extension implementation only supports ELEN "
> +                   "in the range [8, 64]");
> +        return;
> +    }
> +    if (cfg->vext_spec) {
> +        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> +            vext_version =3D VEXT_VERSION_1_00_0;
> +        } else {
> +            error_setg(errp, "Unsupported vector spec version '%s'",
> +                       cfg->vext_spec);
> +            return;
> +        }
> +    } else {
> +        qemu_log("vector version is not specified, "
> +                 "use the default value v1.0\n");
> +    }
> +    set_vext_version(env, vext_version);
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -804,6 +844,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>  static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
>  {
>      CPURISCVState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
>
>      /* Do some ISA extension error checking */
>      if (riscv_has_ext(env, RVG) &&
> @@ -872,8 +913,14 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
>          return;
>      }
>
> -    /* The V vector extension depends on the Zve64d extension */
>      if (riscv_has_ext(env, RVV)) {
> +        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /* The V vector extension depends on the Zve64d extension */
>          cpu->cfg.ext_zve64d =3D true;
>      }
>
> @@ -1008,46 +1055,6 @@ static void riscv_cpu_validate_set_extensions(RISC=
VCPU *cpu, Error **errp)
>          cpu->cfg.ext_zksed =3D true;
>          cpu->cfg.ext_zksh =3D true;
>      }
> -
> -    if (riscv_has_ext(env, RVV)) {
> -        int vext_version =3D VEXT_VERSION_1_00_0;
> -        if (!is_power_of_2(cpu->cfg.vlen)) {
> -            error_setg(errp,
> -                       "Vector extension VLEN must be power of 2");
> -            return;
> -        }
> -        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> -            error_setg(errp,
> -                       "Vector extension implementation only supports VL=
EN "
> -                       "in the range [128, %d]", RV_VLEN_MAX);
> -            return;
> -        }
> -        if (!is_power_of_2(cpu->cfg.elen)) {
> -            error_setg(errp,
> -                       "Vector extension ELEN must be power of 2");
> -            return;
> -        }
> -        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
> -            error_setg(errp,
> -                       "Vector extension implementation only supports EL=
EN "
> -                       "in the range [8, 64]");
> -            return;
> -        }
> -        if (cpu->cfg.vext_spec) {
> -            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> -                vext_version =3D VEXT_VERSION_1_00_0;
> -            } else {
> -                error_setg(errp,
> -                           "Unsupported vector spec version '%s'",
> -                           cpu->cfg.vext_spec);
> -                return;
> -            }
> -        } else {
> -            qemu_log("vector version is not specified, "
> -                     "use the default value v1.0\n");
> -        }
> -        set_vext_version(env, vext_version);
> -    }
>  }
>
>  #ifndef CONFIG_USER_ONLY
> --
> 2.39.2
>
>

