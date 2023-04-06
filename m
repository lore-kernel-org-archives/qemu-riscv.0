Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF3w-0007oZ-BF
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF3u-0007oF-NS; Wed, 05 Apr 2023 22:09:18 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF3s-0001zm-T1; Wed, 05 Apr 2023 22:09:18 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id g17so33170855vst.10;
 Wed, 05 Apr 2023 19:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJhX3ZIQURBzuX9pGAlkTU8KRR4pBlmOnyCYrmD0iYI=;
 b=mL37UBXhI845d1KF5c3Z4O+oR0+j49qV/wVOtZZdmXnPsszCHeUh+eYBgz1UKiK3i7
 0IfiWEBKdf57dZXZosEfqdKr1e3eVh8QiIQPDi4tA859CWjIIgqsG61WSKqwsRZfYqxp
 3+1RXCATyHsV2hxzbjKsTfOLwNaMMpig3k+ZhiDs8+DEI1CBfyJhRqwfh1NphVoAs3Bb
 NKDoR9nMoG7nRgTjHxIpse401pL1jR660ZTGvJyvha6jxreypHjv9PtZjfaDnGhymSvR
 ZM4Lbiz4mrQ/lZdOjQfYDJdZbc7XxK8fGx8/esr0lXe4Het/XGVIkqaBDE62LNjiktjz
 +t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJhX3ZIQURBzuX9pGAlkTU8KRR4pBlmOnyCYrmD0iYI=;
 b=QWoidJXWjt08oeSbNFyGklJz3fUG1HcrvcawevLACIAaMukUJrzayBk614k5UcQ7P8
 YdBo/zBJbqeSVneNePOW+pWfJBkpDLFuCy7lEiXn3gofV9PQwCn05EQLR+Vgqm2mRQpJ
 G1jyd5Tk+RKp9FjpU4CljAHV98eltb66XaVCfV6nyZSyZebMsU7B5b3YQ4zxUUlWPymZ
 30Ml7IvfY783mP1YKdLTeJvQs9FJ10MRgxrRCvyDudlFIsNZjiJYQBwCl/PWmXifh6bP
 u22P0aI7/na/oObDbNjcKksOELQeQF7zMsM41waR0GCCs3LRIxS4FTN/YJR7Cf5+x9zc
 AKmQ==
X-Gm-Message-State: AAQBX9eImDGZPQlAwAM4is2pZO6F5aq/kgHIMMQSgUSypydU05P7dXeo
 CzltdcjZs0MRG+OXZNauO/w9Sc1ALQNTxn2lORI=
X-Google-Smtp-Source: AKy350Yh5HSe9DJRSRWsn5sXSQX8h2zjTHOasJfAvtN89quuh4b7YOx80RKbPvRLqKRzvtmbR4BXyIz9YqHCaOWC79k=
X-Received: by 2002:a67:e18f:0:b0:425:8cbd:f74f with SMTP id
 e15-20020a67e18f000000b004258cbdf74fmr6359452vsl.3.1680746955273; Wed, 05 Apr
 2023 19:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:08:49 +1000
Message-ID: <CAKmqyKN=8J0CiVhcmU9uVnqPQ5DLBidohDyy=EDfx7DZG3GtRw@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] target/riscv/cpu.c: add priv_spec
 validate/disable_exts helpers
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
X-List-Received-Date: Thu, 06 Apr 2023 02:09:19 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're doing env->priv_spec validation and assignment at the start of
> riscv_cpu_realize(), which is fine, but then we're doing a force disable
> on extensions that aren't compatible with the priv version.
>
> This second step is being done too early. The disabled extensions might b=
e
> re-enabled again in riscv_cpu_validate_set_extensions() by accident. A
> better place to put this code is at the end of
> riscv_cpu_validate_set_extensions() after all the validations are
> completed.
>
> Add a new helper, riscv_cpu_disable_priv_spec_isa_exts(), to disable the
> extesions after the validation is done. While we're at it, create a
> riscv_cpu_validate_priv_spec() helper to host all env->priv_spec related
> validation to unclog riscv_cpu_realize a bit.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 91 ++++++++++++++++++++++++++++------------------
>  1 file changed, 56 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1743e9ede3..8f0620376c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -820,6 +820,52 @@ static void riscv_cpu_validate_v(CPURISCVState *env,=
 RISCVCPUConfig *cfg,
>      env->vext_ver =3D vext_version;
>  }
>
> +static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    int priv_version =3D -1;
> +
> +    if (cpu->cfg.priv_spec) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version =3D PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +            priv_version =3D PRIV_VERSION_1_11_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> +            priv_version =3D PRIV_VERSION_1_10_0;
> +        } else {
> +            error_setg(errp,
> +                       "Unsupported privilege spec version '%s'",
> +                       cpu->cfg.priv_spec);
> +            return;
> +        }
> +
> +        env->priv_ver =3D priv_version;
> +    }
> +}
> +
> +static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    int i;
> +
> +    /* Force disable extensions if priv spec version does not match */
> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> +            (env->priv_ver < isa_edata_arr[i].min_version)) {
> +            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> +                        " because privilege spec version does not match"=
,
> +                        isa_edata_arr[i].name, env->mhartid);
> +#else
> +            warn_report("disabling %s extension because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -984,6 +1030,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>          cpu->cfg.ext_zksed =3D true;
>          cpu->cfg.ext_zksh =3D true;
>      }
> +
> +    /*
> +     * Disable isa extensions based on priv spec after we
> +     * validated and set everything we need.
> +     */
> +    riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
>  #ifndef CONFIG_USER_ONLY
> @@ -1083,7 +1135,6 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      CPURISCVState *env =3D &cpu->env;
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc =3D CPU_CLASS(mcc);
> -    int i, priv_version =3D -1;
>      Error *local_err =3D NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -1092,23 +1143,10 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
>          return;
>      }
>
> -    if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> -            priv_version =3D PRIV_VERSION_1_12_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> -            priv_version =3D PRIV_VERSION_1_11_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> -            priv_version =3D PRIV_VERSION_1_10_0;
> -        } else {
> -            error_setg(errp,
> -                       "Unsupported privilege spec version '%s'",
> -                       cpu->cfg.priv_spec);
> -            return;
> -        }
> -    }
> -
> -    if (priv_version >=3D PRIV_VERSION_1_10_0) {
> -        env->priv_ver =3D priv_version;
> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
>      }
>
>      riscv_cpu_validate_misa_priv(env, &local_err);
> @@ -1117,23 +1155,6 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> -    /* Force disable extensions if priv spec version does not match */
> -    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> -            (env->priv_ver < isa_edata_arr[i].min_version)) {
> -            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> -#ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> -                        " because privilege spec version does not match"=
,
> -                        isa_edata_arr[i].name, env->mhartid);
> -#else
> -            warn_report("disabling %s extension because "
> -                        "privilege spec version does not match",
> -                        isa_edata_arr[i].name);
> -#endif
> -        }
> -    }
> -
>      if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>          /*
>           * Enhanced PMP should only be available
> --
> 2.39.2
>
>

