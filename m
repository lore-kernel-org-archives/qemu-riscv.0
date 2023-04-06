Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEut-0003lt-7j
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEur-0003lO-AL; Wed, 05 Apr 2023 21:59:57 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEup-0004C1-HF; Wed, 05 Apr 2023 21:59:57 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id h27so33222464vsa.1;
 Wed, 05 Apr 2023 18:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M76ioLX5nvmEhJj7Bvxp/sa7aLWftD7mIrL65snp6K8=;
 b=iTXvS6a3FQTBnXdIMWtbsigDVXsoP6WUPUGsriAhyrzipSZ8aJXd02C/m9A78FZ6mG
 XLkpxbitYK3M4pWH3PKfDXZFYKr22KMvt8Xggclf8WnAVJ5owOaAzWBfxtOI1rbd6E9Y
 Vmwpm/fW+9MHXpLnrPJV2+1JuCC6cqZN+Ia9UeLTNa7xDM5OJ8yBmG7LOtu+OM03K4yH
 VbZ339V4oiJ8S3TXhP4lrf0zqHcOdtr+Z9yuJrngcoe3tIAvNQ8Usw/kl4st9Remb9RZ
 Pxl76AI/htZUVnlanoGryNE4JbKVwMZ1PohIjBED777wz7rId7w7aWXCPfH3NckPI0NG
 Q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M76ioLX5nvmEhJj7Bvxp/sa7aLWftD7mIrL65snp6K8=;
 b=ZEiUh+4+OVUS4zNNulOrtOO2dtObcHUWhFgYR+cDRJvdu0YP5ufNi006LO+/dyWx7i
 lIrR3qB7iIV32uH+ev7KrzJoYTXLvcFCKuxr0ExWLqwnZQqAb8NWPuNkCm94FOkyEWe4
 GQEYn5XEWrmrUTZJY35gX1p8ythgEEv0xu5knCSqNL65mxE7vuh0eumAYSEkMuX9UOu1
 yTvPDmrLm4FyVZPdzkzLWy5yyrjn2E2hxhuvvwGqQAu9HpiBlNltiT5E3HEX1nvlHRtB
 dNoP5FwqAo/1JHVHgx2ngGxZ3xdYSQX8Nt4CctqnFte1MX7NGp5y7USRW5GQjfsU2Sun
 sBEA==
X-Gm-Message-State: AAQBX9ejL9otdFuoCvjV0RazdkE0Pw2CnpdchHyWbIohe+PEG+W07Nlb
 TGfpNbmnw7fR3Yn1KgzY0ZyZW2EWXE5pWSaoZFA=
X-Google-Smtp-Source: AKy350YQUHh5QwYOpK07hJyVGQZD4vAIFznI2NzCwEKLsFpfROaJLEm7lKFa3RrUqhXdwMIko3Ljz9Sh1GY9djYlTXI=
X-Received: by 2002:a67:e106:0:b0:402:999f:51dd with SMTP id
 d6-20020a67e106000000b00402999f51ddmr6761491vsl.3.1680746394053; Wed, 05 Apr
 2023 18:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:59:28 +1000
Message-ID: <CAKmqyKP=8_Xp0LdvtVjM80N4qxTxMXSW0RMf=JAj5o_xroSyfg@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] target/riscv/cpu.c: add riscv_cpu_validate_v()
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
X-List-Received-Date: Thu, 06 Apr 2023 01:59:57 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 89 +++++++++++++++++++++++++---------------------
>  1 file changed, 48 insertions(+), 41 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d8568a024c..610e55cb04 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -790,6 +790,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, di=
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
> @@ -797,6 +837,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>  static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
>  {
>      CPURISCVState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
>
>      /* Do some ISA extension error checking */
>      if (riscv_has_ext(env, RVG) &&
> @@ -865,8 +906,14 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
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
> @@ -947,46 +994,6 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
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

