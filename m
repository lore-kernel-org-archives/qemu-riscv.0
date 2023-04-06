Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF4r-00007z-Mj
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF4p-00006q-EB; Wed, 05 Apr 2023 22:10:15 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF4n-0003OP-O7; Wed, 05 Apr 2023 22:10:15 -0400
Received: by mail-vs1-xe33.google.com with SMTP id c1so33220722vsk.2;
 Wed, 05 Apr 2023 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680747011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7X+iZI9Ajdxv+u3Xb9fCp/iTO7VnaskOqcqoCtnLnc=;
 b=kO7t0gOSuDE2LRTfD62j4MqMGWv0muGJMXAv5dMul3X/CuZyiyVlJL1rveDAeJz8Wu
 k1TYYf3eTx+FYarklTFTROTA/d4nuPUTDEllSCdxvY7qpArMUzem69VVWoTNxKT5YBMs
 2DZ5/akNTViRCthnThOal/evkU37oYw03jMocR3nBg5cA7PEaIRcyJsNYuO0vQftyj8+
 YsQ5A0zzIHpigsCdLW+l78AtCQfxjeGFZTCV+gJH0srWE/KWxWqsp6wrdTv4dduUvt75
 DbVVrk8atW6q/0w3ZVXyKU1/kLkLP1ijam0jhYtmNPpJWCidUgfGgInFLx4wuLqvtUMT
 YmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680747011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7X+iZI9Ajdxv+u3Xb9fCp/iTO7VnaskOqcqoCtnLnc=;
 b=3NIzCp+SQHUBhwqPHvfDbEI+c1QpibUfjr3hA2lio/tsnjh/eQyEgINix7AE19cVbj
 UjslsUq8iOkKw140i7psqiTy+osmITfL+zm+iLgbWnqtj6nDQr6Krn6UdfFLqrKDfq1x
 24ZxVM5EyxDtDqu1DS2lzhTmssOhANjQ6CylO8LwYV4sKw49lA5C13Yappi8WReYhHsC
 NecKxtLfy4UcDUfsIfaZT5D028bPeUep98USq7S2B7n5RbTAOoAPArX/tz7gA0vJgjOH
 0LCXBPtwcbt8AXJoWgSxGlX1xigxaEHYhkkYE/0dD58OBTNqWSxrU0DAmAspDgw8JRTk
 aZIw==
X-Gm-Message-State: AAQBX9fDzZ7T8cX4p0BHUrOygs3GuMgSpC365+8Mn7bnc1AosUf2gs8+
 KKo2BC79sdafspZ9Bz50rMWqYJ7ExWMe80rdheI=
X-Google-Smtp-Source: AKy350ZAzQxMgTobpUFj9/JlfUWprP8fPp4BnzS2h/TKtyP+dtiPwHa2QmSN2UDF02U+OZU4nxE+VM29es2lvMENr8g=
X-Received: by 2002:a67:d60c:0:b0:425:969d:3709 with SMTP id
 n12-20020a67d60c000000b00425969d3709mr6127277vsj.3.1680747011616; Wed, 05 Apr
 2023 19:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:09:45 +1000
Message-ID: <CAKmqyKPpG_M0-psXghYqx=PegKOFadQ3qqmQmcX=Mo0Sj93_bQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_mxl()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:10:15 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Let's remove more code that is open coded in riscv_cpu_realize() and put
> it into a helper. Let's also add an error message instead of just
> asserting out if env->misa_mxl_max !=3D env->misa_mlx.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 50 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8f0620376c..e8045840bd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -866,6 +866,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RIS=
CVCPU *cpu)
>      }
>  }
>
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +{
> +    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> +    CPUClass *cc =3D CPU_CLASS(mcc);
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (env->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (env->misa_mxl_max !=3D env->misa_mxl) {
> +        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> +        return;
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -1134,7 +1161,6 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      RISCVCPU *cpu =3D RISCV_CPU(dev);
>      CPURISCVState *env =3D &cpu->env;
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> -    CPUClass *cc =3D CPU_CLASS(mcc);
>      Error *local_err =3D NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -1143,6 +1169,12 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> +    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      riscv_cpu_validate_priv_spec(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> @@ -1171,22 +1203,6 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>      }
>  #endif /* CONFIG_USER_ONLY */
>
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (env->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    assert(env->misa_mxl_max =3D=3D env->misa_mxl);
> -
>      riscv_cpu_validate_set_extensions(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> --
> 2.39.2
>
>

