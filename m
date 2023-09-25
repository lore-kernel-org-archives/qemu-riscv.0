Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C56CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:33:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkiuM-0001nM-TU; Mon, 25 Sep 2023 06:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkiuI-0001lt-5b; Mon, 25 Sep 2023 06:33:40 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkiuG-0002uC-4v; Mon, 25 Sep 2023 06:33:37 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7ab7e87f866so1683914241.1; 
 Mon, 25 Sep 2023 03:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695638014; x=1696242814; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1a177via0Ka2GZgIH1LIbP479lOeuh/oe71Ks26sR0c=;
 b=dnx4vPlDQJFB2MAB8AZAbzqg6lUHSME29wdmXLMVZ2WCJB4tk5kDebRcODRJ745B6V
 brKlegxQwQ2k8qqsrU4HpQKIDXsXk3IxP98Wnma/Xn5A3W2ctLcicPswdBG1lJUqXt93
 ecNHXQ/z1I4HsEwAWia7q/mrLeelvJa4uZPL3Kg1I4AdzuCILNAAkkfuVYCL8gE2dqrj
 BWSkb+r5oGt8xmqP3ixLn9/HBCQ9qp2liSfvivDenSlSYcCOWYCczKvJfBLIsgmIJ4VJ
 IPQh6rrm6yS8300tGlv1XXXVVl7mOf0sH6Gvj6zBZq3NiS+aXhNYg90ndKQVkvRvkp7G
 /4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695638014; x=1696242814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1a177via0Ka2GZgIH1LIbP479lOeuh/oe71Ks26sR0c=;
 b=RfzeI3eGVM8WF8BthDb9ABaqR7JzGeGgzLnnc/a5RvAxdGNSrzlfvx0R7kqnySY9ii
 sw11EMrJ3MEA13CV2d2/YF3EEDCIM3lqrgxfBdHTJ6sbvzj1D1r6SApU4yzVbsNWW5ww
 FUgVjbaS7tH+XkmwJqeuILfTm5QfZ8uGAUUEdqn2fcXoT5+DQk8QfWPHvV+7NkatpZtw
 1UjZtNBH2faqAtgJpStHR59ut0NIJMvqDwmAe+aa91V1DuzZqf7ZMDUpC1nRIH24ycY3
 4OQr5FKlQJUeAOKbLih+aTARrUw0LnZqin/plyN4mC9WnlOAit82SpDC7YmeOdv4R8H6
 iuJQ==
X-Gm-Message-State: AOJu0YwVyEOzDJp2x1aQbZ/t7VJTXwDvtV86++Afk/0jF3WCOsHHZhwT
 lDfez7cQ4FmEHbquY+j5VLQTyXQ2jDX0DqxZHRM=
X-Google-Smtp-Source: AGHT+IEVJl0wsZQ3LdDwpo2qO+Qj0mZoOIOb31ZtVS1H3xeAjYTX4+dOiaJhCXKomqgI3dbOEQ8QUYQnjyia3hMeuEo=
X-Received: by 2002:a05:6102:34c3:b0:452:8ad4:29d9 with SMTP id
 a3-20020a05610234c300b004528ad429d9mr3526127vst.17.1695638014366; Mon, 25 Sep
 2023 03:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-3-dbarboza@ventanamicro.com>
 <CAKmqyKMArWjph7iMuUteWseiXgX1QbdvYWarRT=Qoa5kbXNErA@mail.gmail.com>
 <68e7c41d-07b9-e265-6d3c-5f7b644ed0ca@ventanamicro.com>
In-Reply-To: <68e7c41d-07b9-e265-6d3c-5f7b644ed0ca@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 20:33:07 +1000
Message-ID: <CAKmqyKMMJ5ByW1JPJ==f=sj56zZY+GXX2gj+xXyS3A2xH+GUmA@mail.gmail.com>
Subject: Re: [PATCH v3 02/19] target/riscv: move riscv_cpu_realize_tcg() to
 TCG::cpu_realizefn()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Mon, Sep 25, 2023 at 7:17=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 9/22/23 02:29, Alistair Francis wrote:
> > On Wed, Sep 20, 2023 at 9:24=E2=80=AFPM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> riscv_cpu_realize_tcg() was added to allow TCG cpus to have a differen=
t
> >> realize() path during the common riscv_cpu_realize(), making it a good
> >> choice to start moving TCG exclusive code to tcg-cpu.c.
> >>
> >> Rename it to tcg_cpu_realizefn() and assign it as a implementation of
> >> accel::cpu_realizefn(). tcg_cpu_realizefn() will then be called during
> >> riscv_cpu_realize() via cpu_exec_realizefn(). We'll use a similar
> >> approach with KVM in the near future.
> >>
> >> riscv_cpu_validate_set_extensions() is too big and with too many
> >> dependencies to be moved in this same patch. We'll do that next.
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >> ---
> >>   target/riscv/cpu.c         | 128 -----------------------------------
> >>   target/riscv/tcg/tcg-cpu.c | 133 +++++++++++++++++++++++++++++++++++=
++
> >>   2 files changed, 133 insertions(+), 128 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index e72c49c881..030629294f 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -23,9 +23,7 @@
> >>   #include "qemu/log.h"
> >>   #include "cpu.h"
> >>   #include "cpu_vendorid.h"
> >> -#include "pmu.h"
> >>   #include "internals.h"
> >> -#include "time_helper.h"
> >>   #include "exec/exec-all.h"
> >>   #include "qapi/error.h"
> >>   #include "qapi/visitor.h"
> >> @@ -1064,29 +1062,6 @@ static void riscv_cpu_validate_v(CPURISCVState =
*env, RISCVCPUConfig *cfg,
> >>       }
> >>   }
> >>
> >> -static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> >> -{
> >> -    CPURISCVState *env =3D &cpu->env;
> >> -    int priv_version =3D -1;
> >> -
> >> -    if (cpu->cfg.priv_spec) {
> >> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> >> -            priv_version =3D PRIV_VERSION_1_12_0;
> >> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> >> -            priv_version =3D PRIV_VERSION_1_11_0;
> >> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> >> -            priv_version =3D PRIV_VERSION_1_10_0;
> >> -        } else {
> >> -            error_setg(errp,
> >> -                       "Unsupported privilege spec version '%s'",
> >> -                       cpu->cfg.priv_spec);
> >> -            return;
> >> -        }
> >> -
> >> -        env->priv_ver =3D priv_version;
> >> -    }
> >> -}
> >> -
> >>   static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> >>   {
> >>       CPURISCVState *env =3D &cpu->env;
> >> @@ -1111,33 +1086,6 @@ static void riscv_cpu_disable_priv_spec_isa_ext=
s(RISCVCPU *cpu)
> >>       }
> >>   }
> >>
> >> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> >> -{
> >> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> >> -    CPUClass *cc =3D CPU_CLASS(mcc);
> >> -    CPURISCVState *env =3D &cpu->env;
> >> -
> >> -    /* Validate that MISA_MXL is set properly. */
> >> -    switch (env->misa_mxl_max) {
> >> -#ifdef TARGET_RISCV64
> >> -    case MXL_RV64:
> >> -    case MXL_RV128:
> >> -        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> >> -        break;
> >> -#endif
> >> -    case MXL_RV32:
> >> -        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> >> -        break;
> >> -    default:
> >> -        g_assert_not_reached();
> >> -    }
> >> -
> >> -    if (env->misa_mxl_max !=3D env->misa_mxl) {
> >> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> >> -        return;
> >> -    }
> >> -}
> >> -
> >>   /*
> >>    * Check consistency between chosen extensions while setting
> >>    * cpu->cfg accordingly.
> >> @@ -1511,74 +1459,6 @@ static void riscv_cpu_finalize_features(RISCVCP=
U *cpu, Error **errp)
> >>   #endif
> >>   }
> >>
> >> -static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **=
errp)
> >> -{
> >> -    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_=
0) {
> >> -        error_setg(errp, "H extension requires priv spec 1.12.0");
> >> -        return;
> >> -    }
> >> -}
> >> -
> >> -static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
> >> -{
> >> -    RISCVCPU *cpu =3D RISCV_CPU(dev);
> >> -    CPURISCVState *env =3D &cpu->env;
> >> -    Error *local_err =3D NULL;
> >> -
> >> -    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
> >> -        error_setg(errp, "'host' CPU is not compatible with TCG accel=
eration");
> >> -        return;
> >> -    }
> >> -
> >> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> >> -    if (local_err !=3D NULL) {
> >> -        error_propagate(errp, local_err);
> >> -        return;
> >> -    }
> >> -
> >> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
> >> -    if (local_err !=3D NULL) {
> >> -        error_propagate(errp, local_err);
> >> -        return;
> >> -    }
> >> -
> >> -    riscv_cpu_validate_misa_priv(env, &local_err);
> >> -    if (local_err !=3D NULL) {
> >> -        error_propagate(errp, local_err);
> >> -        return;
> >> -    }
> >> -
> >> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> >> -        /*
> >> -         * Enhanced PMP should only be available
> >> -         * on harts with PMP support
> >> -         */
> >> -        error_setg(errp, "Invalid configuration: EPMP requires PMP su=
pport");
> >> -        return;
> >> -    }
> >> -
> >> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
> >> -    if (local_err !=3D NULL) {
> >> -        error_propagate(errp, local_err);
> >> -        return;
> >> -    }
> >> -
> >> -#ifndef CONFIG_USER_ONLY
> >> -    CPU(dev)->tcg_cflags |=3D CF_PCREL;
> >> -
> >> -    if (cpu->cfg.ext_sstc) {
> >> -        riscv_timer_init(cpu);
> >> -    }
> >> -
> >> -    if (cpu->cfg.pmu_num) {
> >> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_ss=
cofpmf) {
> >> -            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >> -                                          riscv_pmu_timer_cb, cpu);
> >> -        }
> >> -     }
> >> -#endif
> >> -}
> >> -
> >>   static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >>   {
> >>       CPUState *cs =3D CPU(dev);
> >> @@ -1597,14 +1477,6 @@ static void riscv_cpu_realize(DeviceState *dev,=
 Error **errp)
> >>           return;
> >>       }
> >>
> >> -    if (tcg_enabled()) {
> >> -        riscv_cpu_realize_tcg(dev, &local_err);
> >> -        if (local_err !=3D NULL) {
> >> -            error_propagate(errp, local_err);
> >> -            return;
> >> -        }
> >> -    }
> >> -
> >>       riscv_cpu_finalize_features(cpu, &local_err);
> >>       if (local_err !=3D NULL) {
> >>           error_propagate(errp, local_err);
> >> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> >> index 0326cead0d..f47dc2064f 100644
> >> --- a/target/riscv/tcg/tcg-cpu.c
> >> +++ b/target/riscv/tcg/tcg-cpu.c
> >> @@ -18,10 +18,142 @@
> >>    */
> >
> > I do think we should keep the Copyright statements from cpu.c in this
> > new file as you are now copying across the majority of code from there
>
> I don't mind keeping the copyright statements from cpu.c here. Feel free =
to change it
> in tree (or let me know if you want me to re-send).

Whoops. I missed this comment. Do you mind sending a v4 then I will apply t=
hat

Alistair

