Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCCC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:04:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcNZ-00066H-TQ; Fri, 05 Jan 2024 00:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcNV-00061x-0M; Fri, 05 Jan 2024 00:04:17 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcNT-0007JF-63; Fri, 05 Jan 2024 00:04:16 -0500
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-467a18fc0fcso357236137.3; 
 Thu, 04 Jan 2024 21:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431053; x=1705035853; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8lCbyF/aXWjkDQX2/9FoTk2GzHD/9Z+J+TVAk7hl8g=;
 b=DtHM5bSntqIg5Z/7b62Gjz/GMmGRNqI3c5cGaV+wDn7Uaci8vhsyg6pMEMOxy0y4dj
 T9E0ILtOfiPsujQQ4XMMZCrF0uEk19MeY/HdzfUojqLsyDqwh3u2nAPtBXlBMZlpYxz5
 GpxQ7AkMYFx1pY6GYeJWCsskd3tKaWBve3sBd4sgGNNpfP9itgOadOh2oYzlV0cyF+LZ
 7mR0wTo+mAo7sbIBCPr7NWtiL532D5Q3IHQs6iI+tLoWq74butzK03/hc2zHWQeSViHT
 AWMTI2r87x8OnpETmLwudOzKUyl3hxpwaRhwQbS74YUjmSYrsBnrlso5iTcHyOFiazaR
 I8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431053; x=1705035853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8lCbyF/aXWjkDQX2/9FoTk2GzHD/9Z+J+TVAk7hl8g=;
 b=N73MWxvj3TCL5Z/N06pF5BPszM2R3/3QrEhMhtTKnKKdkYDNCtgz3AE7uu+SyE2eUj
 nYg8JsHxeGMiKFOTXx1HhWa5lxYT+SfoO0YBtcMXMbDUtjeMr/ljJ0cD8JUZCAma1zcC
 S9xCUGrwZxUFbayTubzQvS2+H4pxi6qns0TY8EIPx9bicCf80ELGAifDpc0J9faTuNH2
 fhEIZ679ZB9iUNdH6tYWIFt3LDV1klntJOjyk/zpzM3cJmEhOlsCrbHAuYFCnrjYv6DG
 WVcobEat5awCSMrcxTKH4kkjKhkUm6ecGHwwYNAO+WX1AjY1j1TGogPilcnRaIDTFdOP
 Daew==
X-Gm-Message-State: AOJu0YzdYkNLNr7BDKUln5GesQIA22zJzrUOekgMyegwGjq0R1GgAFCc
 FYA2VpuHhBP/j41OlOGreBLt791ViAG0YpEz04U=
X-Google-Smtp-Source: AGHT+IHzNCuT3LYDSYzwl8GuyoOfIO4LKO2kuvptT9gz2ogvOgtDflZhlwCIdrCOtxeqjIUHoJp9Us2e/18RYeCbFFE=
X-Received: by 2002:a67:c194:0:b0:467:5c2:7935 with SMTP id
 h20-20020a67c194000000b0046705c27935mr1290729vsj.64.1704431052681; Thu, 04
 Jan 2024 21:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-6-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:03:00 +1000
Message-ID: <CAKmqyKNXX9a3M4f=+mCoq_i_-rLi-pAB_uj0FNC3XL-xwe3jXg@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] target/riscv: move 'pmp' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jan 4, 2024 at 4:53=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Move 'pmp' to riscv_cpu_properties[], creating a new setter() for it
> that forbids 'pmp' to be changed in vendor CPUs, like we did with the
> 'mmu' option.
>
> We'll also have to manually set 'pmp =3D true' to generic CPUs that were
> still relying on the previous default to set it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9f1407b73f..01b3b57cee 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -420,6 +420,7 @@ static void riscv_max_cpu_init(Object *obj)
>      RISCVMXL mlx =3D MXL_RV64;
>
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>
>  #ifdef TARGET_RISCV32
>      mlx =3D MXL_RV32;
> @@ -439,6 +440,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &cpu->env;
>
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV64, 0);
> @@ -568,6 +570,7 @@ static void rv128_base_cpu_init(Object *obj)
>      }
>
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV128, 0);
> @@ -584,6 +587,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &cpu->env;
>
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV32, 0);
> @@ -1596,9 +1600,38 @@ static const PropertyInfo prop_mmu =3D {
>      .set =3D prop_mmu_set,
>  };
>
> -Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +static void prop_pmp_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool value;
> +
> +    visit_type_bool(v, name, &value, errp);
>
> +    if (cpu->cfg.pmp !=3D value && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.pmp =3D value;
> +}
> +
> +static void prop_pmp_get(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    bool value =3D RISCV_CPU(obj)->cfg.pmp;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_pmp =3D {
> +    .name =3D "pmp",
> +    .get =3D prop_pmp_get,
> +    .set =3D prop_pmp_set,
> +};
> +
> +Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>
> @@ -1618,6 +1651,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
>
>      {.name =3D "mmu", .info =3D &prop_mmu},
> +    {.name =3D "pmp", .info =3D &prop_pmp},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> --
> 2.43.0
>
>

