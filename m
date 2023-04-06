Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDPa-0003xF-RZ
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDPY-0003x1-MI; Wed, 05 Apr 2023 20:23:32 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDPX-00050T-4h; Wed, 05 Apr 2023 20:23:32 -0400
Received: by mail-vs1-xe34.google.com with SMTP id df34so33011076vsb.8;
 Wed, 05 Apr 2023 17:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z26ms4JYXyarO5/UpVSGHwDIf9U7NPTzzyoB38dGPwk=;
 b=FMKZVfKRdt6a/PJicDyk/sBcCRjU37kwjFvOgj83fTy/BRg9vIA0UyalUQJ0MWYRQv
 t10nMxj8EblhSZprFxvVe4cXAWaVQ2wtzoJyH0S7uKkgHimasFeBeIhHnwfNHap39uJ/
 WW82amvANuJfgxOdGMnYFAYnFQ6s3Dt9kbaKRHMbwk1uzBsJ/33gdO+0tAdiCbu72poB
 K7OT5vfuckgejFszPVs48hA49XDCdpmh6xC7TmtzpZmDVqek/Ise9UE7xdMCFZ0LzdLO
 1VslM0Rqzn2q5kjEN3Ie2gelZ0GU7OdvaaffQs4NG+BgaE7aAvhtKqBfshGdJT5G175o
 D2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z26ms4JYXyarO5/UpVSGHwDIf9U7NPTzzyoB38dGPwk=;
 b=PnnEr9zvqPN/wLa90qtnTuzJ3hLt2xUpUzz7JXt2nqwm4veqo+U4zutDLZcGOEiPIt
 XtL+N8Sv2t0e+4OSBrhO2j47GNfqXx1bjH+xKgXUTnssZvPrcz3hcGZHNW71QOGRd0KI
 fgXJ5B3S8RUHZtQT5YCuMemm03GN6Cvv84TXCa2mMwMfpS9DDF8ZYlrQ5tNVux7++LoE
 pxFrgi3GyW7e7eLCMycUgkIfRRQasP+iJfqVzzPkqGWsRlcrjvHWMWwF4jbYB3JPCvIr
 gWIP8sHvfoOoBRCsr+rsTYg8A4cfWo3VdYvJq1LTWlueXyFNKan6sydhir7OcltOpP3r
 7jeA==
X-Gm-Message-State: AAQBX9cHofGeNJApbfEEyrb4RaJuz9mct6sh2AkVYJfLPnjK0LIKejFB
 P4VWFoDjJ09525Ui6c5avrud4bK+UJEz72t80mU=
X-Google-Smtp-Source: AKy350azDlLBZIjz5thLw7B4IM/h4DPIM0cNiHnXPxWtaWI6CBOio1DhhEEk/nyZkKwq7nnyRvAOjw1aLHkjR7Cs8tc=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr5667707vsk.3.1680740609970; Wed, 05 Apr
 2023 17:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-19-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-19-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:23:03 +1000
Message-ID: <CAKmqyKMXPMnC97Aeu=L16udF0+Z7HAmwm_F3O9-0AXvSPBU1UQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
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
X-List-Received-Date: Thu, 06 Apr 2023 00:23:33 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This CPU is enabling G via cfg.ext_g and, at the same time, setting
> IMAFD in set_misa() and cfg.ext_icsr.
>
> riscv_cpu_validate_set_extensions() is already doing that, so there's no
> need for cpu_init() setups to worry about setting G and its extensions.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3eb3b7dc59..036d6191ca 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -396,11 +396,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> +    set_misa(env, MXL_RV64, RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>
>      cpu->cfg.ext_g =3D true;
> -    cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.ext_zfh =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.ext_xtheadba =3D true;
> --
> 2.39.2
>
>

