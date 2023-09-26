Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DE7E8180F
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 01:37:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkx11-0003Em-JD; Mon, 25 Sep 2023 21:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkx0z-0003E7-Pi; Mon, 25 Sep 2023 21:37:29 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkx0w-0002IJ-Q1; Mon, 25 Sep 2023 21:37:29 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-496d3e18f19so2821746e0c.2; 
 Mon, 25 Sep 2023 18:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695692245; x=1696297045; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ331SJE+QcYT4vlmOAbC+DmBvFavHFPf4g80xDNcww=;
 b=ghj2KIcSzStmGiUTzsbDZIJ9wpTx51oGbekZsFZt4offGmRp7UikAHWlZS3nHUxgWa
 y40/xPGWZnQTdsIHzlMz84kQOSHOfIbvbgTJTrjpcjKjiEKh2xHs3g3c3X81Tap2Xkn2
 1ixYZXgKNjkjkPme+vd+49n0LCNvOT5GPT31M+JmJzjbMnB6RY4z4ln03HvrOxv6TbEO
 8KbFnDKfkMqcTW1eunSa8WHGTwRsGGyKDcq0GH86xWILYX3LGWUKPp2+bGz+R734Er/2
 VbgV9P47T52ThXv9QF8kItWUgcPwVVpH6P0NIOYM0sH8y/1RdVY69/KGt3l+T4Mr8pz7
 mZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695692245; x=1696297045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ331SJE+QcYT4vlmOAbC+DmBvFavHFPf4g80xDNcww=;
 b=gaQP2pi56Uu/dJyhFGU0WoGoP7Mq8ABoGIbKKl9umKWM6MSKUdM02PNTnwcJ6KVOAE
 Pb2ap6lVGk08QkINoUWgfsKxa3PXG/hbRa+ONLksNNh57mLJ6u9KKPI4YIRDjeUJ3vTk
 Bo2vnV3d2Xv9/U86rxi6SXDjN5OOr6xinltjx+JkPwCVdH+GM9VQmcbDsLANZO9loahs
 3z6IbhQKMFYzZDEROLbBBx27CNRtTgFHVxM7rCSfCSiLPEoFZmQ76ZBiVpyRqkx1UvTM
 JipLLCd+GqglFXoZpMhSNkMz3VocC02o4Wnlho+Bxk3ejZYh6BAfKb7dOTBFP+ga7gc7
 VQdw==
X-Gm-Message-State: AOJu0YyUhCxIPe/F4qm/v9E8y6dMOweN0gVqdXmDHnB1ej5bEX+pGnDj
 kmV2jpPLPH3Ao3qJS/JAhA+EYCnfPuQyI/6tGwQa5ea2gHE=
X-Google-Smtp-Source: AGHT+IGSaygFK+IBnpkCXl3a/M8mZ1im7ov3hb4JtWdUvPDdEjVU8JvAg3f2urOPyZsMWE9r82SnZ/Lxk1Ly1SW/eqI=
X-Received: by 2002:a1f:4dc3:0:b0:48f:dc94:1b37 with SMTP id
 a186-20020a1f4dc3000000b0048fdc941b37mr4399834vkb.5.1695692244656; Mon, 25
 Sep 2023 18:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
 <20230925175709.35696-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230925175709.35696-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Sep 2023 11:36:57 +1000
Message-ID: <CAKmqyKMH5FVh6q8YjR+KKqfN0e94_FfYJHT48FoiuTzL7FH2GQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/19] target/riscv: move riscv_cpu_realize_tcg() to
 TCG::cpu_realizefn()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Tue, Sep 26, 2023 at 5:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_cpu_realize_tcg() was added to allow TCG cpus to have a different
> realize() path during the common riscv_cpu_realize(), making it a good
> choice to start moving TCG exclusive code to tcg-cpu.c.
>
> Rename it to tcg_cpu_realizefn() and assign it as a implementation of
> accel::cpu_realizefn(). tcg_cpu_realizefn() will then be called during
> riscv_cpu_realize() via cpu_exec_realizefn(). We'll use a similar
> approach with KVM in the near future.
>
> riscv_cpu_validate_set_extensions() is too big and with too many
> dependencies to be moved in this same patch. We'll do that next.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 128 -----------------------------------
>  target/riscv/tcg/tcg-cpu.c | 133 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 133 insertions(+), 128 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e72c49c881..030629294f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,9 +23,7 @@
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "cpu_vendorid.h"
> -#include "pmu.h"
>  #include "internals.h"
> -#include "time_helper.h"
>  #include "exec/exec-all.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> @@ -1064,29 +1062,6 @@ static void riscv_cpu_validate_v(CPURISCVState *en=
v, RISCVCPUConfig *cfg,
>      }
>  }
>
> -static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> -{
> -    CPURISCVState *env =3D &cpu->env;
> -    int priv_version =3D -1;
> -
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
> -
> -        env->priv_ver =3D priv_version;
> -    }
> -}
> -
>  static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -1111,33 +1086,6 @@ static void riscv_cpu_disable_priv_spec_isa_exts(R=
ISCVCPU *cpu)
>      }
>  }
>
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> -{
> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> -    CPUClass *cc =3D CPU_CLASS(mcc);
> -    CPURISCVState *env =3D &cpu->env;
> -
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
> -
> -    if (env->misa_mxl_max !=3D env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
> -}
> -
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -1511,74 +1459,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *=
cpu, Error **errp)
>  #endif
>  }
>
> -static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **err=
p)
> -{
> -    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) =
{
> -        error_setg(errp, "H extension requires priv spec 1.12.0");
> -        return;
> -    }
> -}
> -
> -static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(dev);
> -    CPURISCVState *env =3D &cpu->env;
> -    Error *local_err =3D NULL;
> -
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
> -        error_setg(errp, "'host' CPU is not compatible with TCG accelera=
tion");
> -        return;
> -    }
> -
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    riscv_cpu_validate_misa_priv(env, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> -        /*
> -         * Enhanced PMP should only be available
> -         * on harts with PMP support
> -         */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP suppo=
rt");
> -        return;
> -    }
> -
> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    CPU(dev)->tcg_cflags |=3D CF_PCREL;
> -
> -    if (cpu->cfg.ext_sstc) {
> -        riscv_timer_init(cpu);
> -    }
> -
> -    if (cpu->cfg.pmu_num) {
> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
pmf) {
> -            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                          riscv_pmu_timer_cb, cpu);
> -        }
> -     }
> -#endif
> -}
> -
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs =3D CPU(dev);
> @@ -1597,14 +1477,6 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
>
> -    if (tcg_enabled()) {
> -        riscv_cpu_realize_tcg(dev, &local_err);
> -        if (local_err !=3D NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
>      riscv_cpu_finalize_features(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 795a8f06b2..5904cf7354 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -18,10 +18,142 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "exec/exec-all.h"
>  #include "cpu.h"
> +#include "pmu.h"
> +#include "time_helper.h"
> +#include "qapi/error.h"
>  #include "qemu/accel.h"
>  #include "hw/core/accel-cpu.h"
>
> +
> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **err=
p)
> +{
> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) =
{
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
> +}
> +
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
> +/*
> + * We'll get here via the following path:
> + *
> + * riscv_cpu_realize()
> + *   -> cpu_exec_realizefn()
> + *      -> tcg_cpu_realizefn() (via accel_cpu_realizefn())
> + */
> +static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
> +
> +    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> +        error_setg(errp, "'host' CPU is not compatible with TCG accelera=
tion");
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_misa_priv(env, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +        /*
> +         * Enhanced PMP should only be available
> +         * on harts with PMP support
> +         */
> +        error_setg(errp, "Invalid configuration: EPMP requires PMP suppo=
rt");
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +#ifndef CONFIG_USER_ONLY
> +    CPU(cs)->tcg_cflags |=3D CF_PCREL;
> +
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +
> +    if (cpu->cfg.pmu_num) {
> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
pmf) {
> +            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          riscv_pmu_timer_cb, cpu);
> +        }
> +     }
> +#endif
> +
> +    return true;
> +}
> +
>  static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>  {
>      /*
> @@ -41,6 +173,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, =
void *data)
>      AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
>
>      acc->cpu_class_init =3D tcg_cpu_class_init;
> +    acc->cpu_realizefn =3D tcg_cpu_realizefn;
>  }
>
>  static const TypeInfo tcg_cpu_accel_type_info =3D {
> --
> 2.41.0
>
>

