Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EEEEE14D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 04:07:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe6IA-0003PT-3N; Thu, 07 Sep 2023 00:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6I2-0003DX-M2; Thu, 07 Sep 2023 00:06:46 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6Ho-0005eC-KJ; Thu, 07 Sep 2023 00:06:46 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7a01719d3c5so954538241.1; 
 Wed, 06 Sep 2023 21:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694059590; x=1694664390; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bN8RZdSiYAfXMCRvXHBDZCkR0df+d3fvahFI6QA5HOI=;
 b=q/d3QVQn+qiXv60EkGCJ1LeEGegf/yjcn8iL/CBdjoUPyp5/r0AxjEMXa8m0DG4LBE
 bYoEfLv9HpBg354Qfm3Nlps/Qnp/jx84xGGqbXfwqn5iGjri0u7xfu/BMnfFOTWQ8qr7
 aJ/Uf2IWLDjNZaBjpl7qun2ccn81LtdCLN5vJ8jpGzkj0KoLGN/i9QY3uPS6rUkC07u9
 lBcIkRyTnnvRbwCp6l3M141xt4cQ1ahC+ARUxd982lI1X10S6rdQX+vxAnekRMFSdUsX
 frer3LD8tGm96s2XmMbo4IBjmpUhvrTP/DsQj0mj+eUj+VqKfbwbTZgi3mvhrKgLrpCs
 jHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694059590; x=1694664390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bN8RZdSiYAfXMCRvXHBDZCkR0df+d3fvahFI6QA5HOI=;
 b=Bt5q8+cx+YSYAbtQE02ow2WcXMmMCavaqFBKIuES8BzIHOOsurpe1nEeLwtoM+gJwQ
 VIDO6I1Lyn+4woF/auA1Irn2yjVRLfy+LVo9GOX5MngMQGpl4iRZ5SGHXboRCbL4HqFp
 OBtdkGNRfL6XInjhoDAwXXaBg9quGwyc4XhY1k7j62BZdGkqhCW6JBh7/ZfYE2j30xD5
 LrUqkQNjEVm7e1GDw7PEKeWELav0MjtCevAzpbG74ysEuLFgJ49znsqz56zGKMuE2c+U
 y0wrxFXLLlMQYyyqz9+h2FQQ7Ix36ol1ZaezQpFsf3PzoVtVIjHg4ESejmSbg52Yp+bm
 0Uiw==
X-Gm-Message-State: AOJu0Yxq1gufvBLeoStru9p9+Yfb+kAM4Q/j8GiHsDJYH0hgpIALMOvc
 TvySZcnpheI4L8bRE4n3VX/02LYU7kFKI5tyZnc=
X-Google-Smtp-Source: AGHT+IFH+kRmH9wu7ryDwv56iazQt9cyuFCNhcm+8lKsP314nwanoZWgspGIY7G+J73w0zH5WHDhj6AhxFo41C+LNMo=
X-Received: by 2002:a05:6102:3fa2:b0:44e:837a:25e with SMTP id
 o34-20020a0561023fa200b0044e837a025emr1229425vsv.11.1694059590207; Wed, 06
 Sep 2023 21:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-16-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-16-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 14:06:03 +1000
Message-ID: <CAKmqyKMqeHimLKt00RQEtZXi36XL7YLQ5dfNd-ObQZRDUS78Sg@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] target/riscv/cpu.c: introduce
 cpu_cfg_ext_auto_update()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Sep 2, 2023 at 5:49=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> During realize() time we're activating a lot of extensions based on some
> criteria, e.g.:
>
>     if (cpu->cfg.ext_zk) {
>         cpu->cfg.ext_zkn =3D true;
>         cpu->cfg.ext_zkr =3D true;
>         cpu->cfg.ext_zkt =3D true;
>     }
>
> This practice resulted in at least one case where we ended up enabling
> something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
> has priv_spec older than 1.12.0.
>
> We're also not considering user choice. There's no way of doing it now
> but this is about to change in the next few patches.
>
> cpu_cfg_ext_auto_update() will check for priv version mismatches before
> enabling extensions. If we have a mismatch between the current priv
> version and the extension we want to enable, do not enable it. In the
> near future, this same function will also consider user choice when
> deciding if we're going to enable/disable an extension or not.
>
> For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 43c68e1792..a4876df5f4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -177,6 +177,43 @@ static void isa_ext_update_enabled(RISCVCPU *cpu, ui=
nt32_t ext_offset,
>      *ext_enabled =3D en;
>  }
>
> +static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].ext_enable_offset !=3D ext_offset) {
> +            continue;
> +        }
> +
> +        return isa_edata_arr[i].min_version;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
> +                                    bool value)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    bool prev_val =3D isa_ext_is_enabled(cpu, ext_offset);
> +    int min_version;
> +
> +    if (prev_val =3D=3D value) {
> +        return;
> +    }
> +
> +    if (value && env->priv_ver !=3D PRIV_VERSION_LATEST) {
> +        /* Do not enable it if priv_ver is older than min_version */
> +        min_version =3D cpu_cfg_ext_get_min_version(ext_offset);
> +        if (env->priv_ver < min_version) {
> +            return;
> +        }
> +    }
> +
> +    isa_ext_update_enabled(cpu, ext_offset, value);
> +}
> +
>  const char * const riscv_int_regnames[] =3D {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1=
",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a=
3",
> @@ -1268,12 +1305,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *=
cpu, Error **errp)
>
>      /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
>      if (riscv_has_ext(env, RVC) && env->priv_ver >=3D PRIV_VERSION_1_12_=
0) {
> -        cpu->cfg.ext_zca =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
>          if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_RV32=
) {
> -            cpu->cfg.ext_zcf =3D true;
> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
>          }
>          if (riscv_has_ext(env, RVD)) {
> -            cpu->cfg.ext_zcd =3D true;
> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
>          }
>      }
>
> --
> 2.41.0
>
>

