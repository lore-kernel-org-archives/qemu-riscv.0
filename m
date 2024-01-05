Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E04C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:01:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcL1-0004Ug-Jq; Fri, 05 Jan 2024 00:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcL0-0004UF-31; Fri, 05 Jan 2024 00:01:42 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcKy-0004wU-A4; Fri, 05 Jan 2024 00:01:41 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4b7e4a2808bso449310e0c.1; 
 Thu, 04 Jan 2024 21:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704430899; x=1705035699; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oriM+KYZcFlx4WqSUc4mnwN6R71wC0FVwf+sP2NKtH4=;
 b=nX9UKcEjyMs/YYnuyE5twSfSIN0nXWGLamR8v2CplndGcNQMHSSzyR8nApFwUyOSrq
 Z5UeQXJVSxFNCBgvvALcHfro3nYfMo8HcQG5EJfUM9PIppYeVKvf9cYEb2FsAp3d/9Jo
 nC5YVSvNfamCLbJKL4PDmOTAW0bDQJaRIeWnMdVe0XH2LC8zCg0j9+g2TwcZpECRkfP+
 k0Jr1WszlnODIM2Blyl1lKMmfcEN6ygAa1Y0EgsHUmOiqXizzCd+pAqJMhClxz4AUKHF
 mPZxfkHOQnklgU4nyd+WeT8823wSx553y/eXbAe9r/rPDUoxe1kp1rKy5Tql3Iuc3EjY
 EFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704430899; x=1705035699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oriM+KYZcFlx4WqSUc4mnwN6R71wC0FVwf+sP2NKtH4=;
 b=ZhZkn05xjeN2Q6eSWgqGtiqnvm7RKnbRFHpb5Pu/zAdhzDqlWsTDSIZLhp330E5Uho
 8FzOzhV6hvFpxvsLcShx2/LcZh0pCSPit0GakDwsgJ9NyeIuO7BotH9ZZO3rOE+bGIqV
 3V0oN5JnviMg9BcqSvJ4IUlw6iDpRxeTZT3NFM2O1ZmgGR8OaVIBVIniDVh1CPMzYJ7n
 4Eho0o2l27lU6bm+OgKBDgfeH868e+q3GV1DVDXcZnPFh7s3TCprBhqEqKIBf2iCX+pl
 UZO/QRhTYlaqZ9gCR8j68pdRwWkPQ0862qlW41rayoAVK+Eee1K3Q0q88/8pP3JU30x/
 lJ8Q==
X-Gm-Message-State: AOJu0YzsrqIzCww5o2fEchopIWKwA4bsY9ppDlar1dRWd+xc2nD/QbY0
 BkCeNXccWOtNtPjSXvXl4/L7j043X4d0lZtlJhU=
X-Google-Smtp-Source: AGHT+IFWJSlDgBIISXJQPdFqhKNptKxbLenDMZJtysJYdjtDMGRh0CyavZdPlLYSjeiA30zHHOodqElJxTOK7hfz/Bw=
X-Received: by 2002:a05:6122:922:b0:4b6:b3c9:9467 with SMTP id
 j34-20020a056122092200b004b6b3c99467mr1327014vka.15.1704430898829; Thu, 04
 Jan 2024 21:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-5-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:00:00 +1000
Message-ID: <CAKmqyKOT6JRsh=4zWVBTSHNKYF1kU1f+5YcnA==-5FSTbWhAkQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] target/riscv: move 'mmu' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Thu, Jan 4, 2024 at 3:43=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit 7f0bdfb5bfc ("target/riscv/cpu.c: remove cfg setup from
> riscv_cpu_init()") already did some of the work by making some
> cpu_init() functions to explictly enable their own 'mmu' default.
>
> The generic CPUs didn't get update by that commit, so they are still
> relying on the defaults set by the 'mmu' option. But having 'mmu' and
> 'pmp' being default=3Dtrue will force CPUs that doesn't implement these
> options to set them to 'false' in their cpu_init(), which isn't ideal.
>
> We'll move 'mmu' to riscv_cpu_properties[] without any defaults, i.e.
> the default will be 'false'. Compensate it by manually setting 'mmu =3D
> true' to the generic CPUs that requires it.
>
> Implement a setter for it to forbid the 'mmu' setting to be changed for
> vendor CPUs. This will allow the option to exist for all CPUs and, at
> the same time, protect vendor CPUs from undesired changes:
>
> $ ./build/qemu-system-riscv64 -M virt -cpu sifive-e51,mmu=3Dtrue
> qemu-system-riscv64: can't apply global sifive-e51-riscv-cpu.mmu=3Dtrue:
>    CPU 'sifive-e51' does not allow changing the value of 'mmu'
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 55 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e90b70c0a7..9f1407b73f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -419,6 +419,8 @@ static void riscv_max_cpu_init(Object *obj)
>      CPURISCVState *env =3D &cpu->env;
>      RISCVMXL mlx =3D MXL_RV64;
>
> +    cpu->cfg.mmu =3D true;
> +
>  #ifdef TARGET_RISCV32
>      mlx =3D MXL_RV32;
>  #endif
> @@ -433,7 +435,11 @@ static void riscv_max_cpu_init(Object *obj)
>  #if defined(TARGET_RISCV64)
>  static void rv64_base_cpu_init(Object *obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    cpu->cfg.mmu =3D true;
> +
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV64, 0);
>      /* Set latest version of privileged specification */
> @@ -551,13 +557,18 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>
>  static void rv128_base_cpu_init(Object *obj)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +
>      if (qemu_tcg_mttcg_enabled()) {
>          /* Missing 128-bit aligned atomics */
>          error_report("128-bit RISC-V currently does not work with Multi =
"
>                       "Threaded TCG. Please use: -accel tcg,thread=3Dsing=
le");
>          exit(EXIT_FAILURE);
>      }
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +
> +    cpu->cfg.mmu =3D true;
> +
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV128, 0);
>      /* Set latest version of privileged specification */
> @@ -569,7 +580,11 @@ static void rv128_base_cpu_init(Object *obj)
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    cpu->cfg.mmu =3D true;
> +
>      /* We set this in the realise function */
>      riscv_cpu_set_misa(env, MXL_RV32, 0);
>      /* Set latest version of privileged specification */
> @@ -1550,8 +1565,38 @@ static const PropertyInfo prop_pmu_mask =3D {
>      .set =3D prop_pmu_mask_set,
>  };
>
> +static void prop_mmu_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool value;
> +
> +    visit_type_bool(v, name, &value, errp);
> +
> +    if (cpu->cfg.mmu !=3D value && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, "mmu", errp);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.mmu =3D value;
> +}
> +
> +static void prop_mmu_get(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    bool value =3D RISCV_CPU(obj)->cfg.mmu;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_mmu =3D {
> +    .name =3D "mmu",
> +    .get =3D prop_mmu_get,
> +    .set =3D prop_mmu_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> @@ -1572,6 +1617,8 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "pmu-mask", .info =3D &prop_pmu_mask},
>      {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
>
> +    {.name =3D "mmu", .info =3D &prop_mmu},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> --
> 2.43.0
>
>

