Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE9CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsG36-0001cL-Vg; Mon, 16 Oct 2023 01:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG35-0001by-2t; Mon, 16 Oct 2023 01:21:51 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG32-0003OF-78; Mon, 16 Oct 2023 01:21:50 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-45271a44cc4so1522581137.2; 
 Sun, 15 Oct 2023 22:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697433706; x=1698038506; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ym1pRVhKd2YFfbIOUvIApX65V5BzCv6OxfZX3cvSKw=;
 b=jWN1D1eAmgo3j9BW8ZE13PNCGAyobNT+GHKy0r0Gxx+fjKOFQ/Xz6VkWW7yjNOInc1
 PJMhae3rW/OOYk7FPqEeBM0GwGscjQzDHH4IQoGReUHb/n66IUpXfiTrQMtOaegCw8xx
 49vu3HYIrUjvkmUj7Nc0URz6utcSlTGevpTtqdNC3xA5COlw4yjUPrhps8pVggZGE/0m
 OphguxRS8RkKMn5dEHc+OpZvqOBG7IWdiq+lLKZvo/Vh2HknPy8y/CL9JaUd1pv7uUrQ
 Q90RHs6cZ0+n/bySVb2k4hn+Vw84w44cySZRqkMzybi0Iyegavn5RYf1YOu+nj4edbdx
 wzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697433706; x=1698038506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ym1pRVhKd2YFfbIOUvIApX65V5BzCv6OxfZX3cvSKw=;
 b=jry8Abj3lBn/7NnK+HPMtHwdcKAJYKsDlsmfZoeDszCCsfOlDUrwKnquHj2/tFL9F2
 DYZq2hwXuKz4eFo1lhJihZMaIgBHTcOocMm79DbAWPH6xtj027y0clzDRhdx/6Y8+ejq
 orhdrMod0eMrty/TPtzfd5CAI0zF/ho8t7u5ckv7VqpCRro5K97CpEjG5z4M+Aox+F2w
 RulEjEheS4c+hc5Ht6E9zA/G4SJ4G7RuJVBJkn52mdJr8BQuEKsf2ESSr1elfFSNpsrN
 lWI28nPN0JJvFBx0RUfmcqRRWWNOrWVNXHovkVIBYOU/ntL5Ixtv9QqT0IjgI7qRCppO
 6vfw==
X-Gm-Message-State: AOJu0YxlIvpyhxs/c25Kr6KUKRbzf6i9cvxsPyaikLsFc1E9dT2PRmzE
 daXPCNCqQaGjVbeOuuCtgvBb+tLHrdm2OcXJClQ=
X-Google-Smtp-Source: AGHT+IGqk8KsVxdFvE4rjp3KYQkqOUSFprtIccJfv9h44jWzq32coQkCfj2RLmqVOVXWjovmjqg7jel+DyrM5mAHaGM=
X-Received: by 2002:a05:6102:3bf1:b0:457:adc8:b163 with SMTP id
 be17-20020a0561023bf100b00457adc8b163mr8639583vsb.27.1697433706673; Sun, 15
 Oct 2023 22:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:21:20 +1000
Message-ID: <CAKmqyKOF=2xy=tPzV5Ug5+ak2hcGQRzX9RvENTGpgSmBTVDAAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/riscv/tcg: add tcg_cpu_finalize_features()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Wed, Sep 27, 2023 at 6:05=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The query-cpu-model-expansion API is capable of passing extra properties
> to a given CPU model and tell callers if this custom configuration is
> valid.
>
> The RISC-V version of the API is not quite there yet. The reason is the
> realize() flow in the TCG driver, where most of the validation is done
> in tcg_cpu_realizefn(). riscv_cpu_finalize_features() is then used to
> validate satp_mode for both TCG and KVM CPUs.
>
> Our ARM friends uses a concept of 'finalize_features()', a step done in
> the end of realize() where the CPU features are validated. We have a
> riscv_cpu_finalize_features() helper that, at this moment, is only
> validating satp_mode.
>
> Re-use this existing helper to do all CPU extension validation we
> required after at the end of realize(). Make it public to allow APIs to
> use it. At this moment only the TCG driver requires a realize() time
> validation, thus, to avoid adding accelerator specific helpers in the
> API, riscv_cpu_finalize_features() uses
> riscv_tcg_cpu_finalize_features() if we are running TCG. The API will
> then use riscv_cpu_finalize_features() regardless of the current
> accelerator.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 18 +++++++++--
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 61 +++++++++++++++++++++-----------------
>  target/riscv/tcg/tcg-cpu.h |  1 +
>  4 files changed, 51 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 521bb88538..272baaf6c7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,7 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/tcg.h"
>  #include "kvm/kvm_riscv.h"
> +#include "tcg/tcg-cpu.h"
>  #include "tcg/tcg.h"
>
>  /* RISC-V CPU definitions */
> @@ -996,11 +997,24 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *=
cpu, Error **errp)
>  }
>  #endif
>
> -static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>  {
> -#ifndef CONFIG_USER_ONLY
>      Error *local_err =3D NULL;
>
> +    /*
> +     * KVM accel does not have a specialized finalize()
> +     * callback because its extensions are validated
> +     * in the get()/set() callbacks of each property.
> +     */
> +    if (tcg_enabled()) {
> +        riscv_tcg_cpu_finalize_features(cpu, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
> +
> +#ifndef CONFIG_USER_ONLY
>      riscv_cpu_satp_mode_finalize(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3f11e69223..1bfa3da55b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -732,6 +732,7 @@ typedef struct isa_ext_data {
>  extern const RISCVIsaExtData isa_edata_arr[];
>  char *riscv_cpu_get_name(RISCVCPU *cpu);
>
> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>  void riscv_add_satp_mode_properties(Object *obj);
>
>  /* CSR function table */
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a90ee63b06..52cd87db0c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -549,6 +549,39 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
> +void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
> +
> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    riscv_cpu_validate_misa_priv(env, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +        /*
> +         * Enhanced PMP should only be available
> +         * on harts with PMP support
> +         */
> +        error_setg(errp, "Invalid configuration: EPMP requires PMP suppo=
rt");
> +        return;
> +    }
> +
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +}
> +
>  static bool riscv_cpu_is_generic(Object *cpu_obj)
>  {
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> @@ -564,7 +597,6 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
>  static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
>
>      if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> @@ -580,33 +612,6 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **=
errp)
>          return false;
>      }
>
> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return false;
> -    }
> -
> -    riscv_cpu_validate_misa_priv(env, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return false;
> -    }
> -
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> -        /*
> -         * Enhanced PMP should only be available
> -         * on harts with PMP support
> -         */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP suppo=
rt");
> -        return false;
> -    }
> -
> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return false;
> -    }
> -
>  #ifndef CONFIG_USER_ONLY
>      CPU(cs)->tcg_cflags |=3D CF_PCREL;
>
> diff --git a/target/riscv/tcg/tcg-cpu.h b/target/riscv/tcg/tcg-cpu.h
> index 630184759d..aa00fbc253 100644
> --- a/target/riscv/tcg/tcg-cpu.h
> +++ b/target/riscv/tcg/tcg-cpu.h
> @@ -23,5 +23,6 @@
>  #include "cpu.h"
>
>  void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
> +void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>
>  #endif
> --
> 2.41.0
>
>

