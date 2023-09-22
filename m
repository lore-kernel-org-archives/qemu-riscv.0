Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF27FE7D0B4
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZ51-0001q7-HS; Fri, 22 Sep 2023 01:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ4y-0001pY-5X; Fri, 22 Sep 2023 01:51:52 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ4w-0000Fm-F8; Fri, 22 Sep 2023 01:51:51 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-45281e0b1cbso900239137.0; 
 Thu, 21 Sep 2023 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695361909; x=1695966709; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXi07TfGkSwiECecQETBIRaqhWnkwhpQ9zkY3A3dhAc=;
 b=O5yas47Y1KZbVWnRMi3U+A8IxtUw5gcOFSEMtg+hUkKoc7E6f4EeGannBTVifOKcIq
 3Gt08myW8NFR+PnBx51zYe1HYo28qo8nFp4fnoqy54m70w48AULcJlxp/tEdhIHBnXly
 7Gurt2f3fmGL+zyWrVy5fC3N4LeIeRDeR7SJqkh90RzRnlptEij3IVBX32zbdTeuonZA
 II7TnFRaDs+mEdImIHzBNkW0j4DXG3dIaN1N+0Ds1CjVroZYw/4230C9tQvF/ErZEHh6
 ASxrPkyNj8ZhyS+5Ncs9PBQYdIc5TL6db22hwAg/9zLknfCITNZKDQgmqH0+NdncnU6W
 iBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695361909; x=1695966709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXi07TfGkSwiECecQETBIRaqhWnkwhpQ9zkY3A3dhAc=;
 b=eh9/K+N5O62aO3VQjyEMoCYJnvM06TbuY1oU/dzLVN1kzfa1Ae+4DboPRadKN/0qzJ
 HsokFCH/lbvypyZ4zFUK4dO7yWdb01fKg6rzyYEdtky+RwzTEh21+NL9GcS7VEXWaN4g
 bDbIRQ2mxxVgzpB8FWGDi+S9ZlwqHsCB6Il6Wbo0M8WC8wBYWu4Gn3CWG4vxdUuVd+7o
 YBdDqvqswwX0akQCJwXIAE5oaOU9W5l5reA5khNRRN/+e9SJiOzEqKI2Hde7U48WVk8E
 wFKG4hkPRhiqFnZ1kO7rD6GswHqcEK7SK6kJTsTJrDEhEh++ztI6G8L9JcT29ZHwf5JV
 hcsw==
X-Gm-Message-State: AOJu0YxSZVCsJOK+hDablz3xtFSU+aBh90OJgPSIYWgzS3iTFh+UYNhY
 CyEAbWHN8U/+6xBb7+Ic0W5A6fkIsFooQFGudlQ=
X-Google-Smtp-Source: AGHT+IHmV76vxVEE9PXAHT4g/XNNIecncLHk6t8T8KlqGmVi3sQjDGn51sJfwbnxgUZARH4p+H2uVT2ITQ1+ii0jpIg=
X-Received: by 2002:a05:6102:3a79:b0:44e:a216:59a6 with SMTP id
 bf25-20020a0561023a7900b0044ea21659a6mr8318404vsb.4.1695361908962; Thu, 21
 Sep 2023 22:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:51:22 +1000
Message-ID: <CAKmqyKM0RtwMjqxjjmtSzWTmi1P8+fiCbKxgqPH8+_WPibCnyw@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] target/riscv/cpu.c: add .instance_post_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 20, 2023 at 9:24=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
> calls riscv_init_max_cpu_extensions(). Both can be moved to a common
> instance_post_init() callback, implemented in riscv_cpu_post_init(),
> called by all CPUs. The call order then becomes:
>
> riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()
>
> In the near future riscv_cpu_post_init() will call the init() function
> of the current accelerator, providing a hook for KVM and TCG accel
> classes to change the init() process of the CPU.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9426b3b9d6..848b58e7c4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -427,8 +427,6 @@ static void riscv_max_cpu_init(Object *obj)
>      mlx =3D MXL_RV32;
>  #endif
>      set_misa(env, mlx, 0);
> -    riscv_cpu_add_user_properties(obj);
> -    riscv_init_max_cpu_extensions(obj);
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), mlx =3D=3D MXL_RV32 ?
> @@ -442,7 +440,6 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -566,7 +563,6 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -579,7 +575,6 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -666,7 +661,6 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> -    riscv_cpu_add_user_properties(obj);
>  }
>  #endif /* CONFIG_KVM */
>
> @@ -1215,6 +1209,37 @@ static void riscv_cpu_set_irq(void *opaque, int ir=
q, int level)
>  }
>  #endif /* CONFIG_USER_ONLY */
>
> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
> +static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) !=3D NULL;
> +}
> +
> +static bool riscv_cpu_has_user_properties(Object *cpu_obj)
> +{
> +    if (kvm_enabled() &&
> +        object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_HOST) !=3D NULL) {
> +        return true;
> +    }
> +
> +    return riscv_cpu_is_dynamic(cpu_obj);
> +}
> +
> +static void riscv_cpu_post_init(Object *obj)
> +{
> +    if (riscv_cpu_has_user_properties(obj)) {
> +        riscv_cpu_add_user_properties(obj);
> +    }
> +
> +    if (riscv_cpu_has_max_extensions(obj)) {
> +        riscv_init_max_cpu_extensions(obj);
> +    }
> +}
> +
>  static void riscv_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
> @@ -1768,11 +1793,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  };
>  #endif
>
> -static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> -{
> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> -}
> -
>  static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
>                                void *opaque, Error **errp)
>  {
> @@ -2009,6 +2029,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .instance_size =3D sizeof(RISCVCPU),
>          .instance_align =3D __alignof__(RISCVCPU),
>          .instance_init =3D riscv_cpu_init,
> +        .instance_post_init =3D riscv_cpu_post_init,
>          .abstract =3D true,
>          .class_size =3D sizeof(RISCVCPUClass),
>          .class_init =3D riscv_cpu_class_init,
> --
> 2.41.0
>
>

