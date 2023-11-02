Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB706C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLkV-0006Fj-SK; Wed, 01 Nov 2023 20:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLkT-0006Em-FB; Wed, 01 Nov 2023 20:39:49 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLkR-0005Ub-FN; Wed, 01 Nov 2023 20:39:49 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-49dd3bb5348so193855e0c.0; 
 Wed, 01 Nov 2023 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885586; x=1699490386; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIOEVkg1eEsZP1oNmIbioqZ8i5sfbfNcrhdfHuiIn1w=;
 b=NM6lCQ09YHmrksmT28Bk5lrO2YWQ53t+e8wTE2f7y+AMJB1YtpnQQGvHumUugfJ1MA
 lL1wIUW51jeJ34iMZnMr76ZL4zX+hG38uOaDWMz4Klo8uOWaqYNaT6/wJbAzp6ioJj5S
 YvjWA+vj8wMuWOqwOAPs+uN+VxGDVLa/JnbMgy+e6xEYQwRMsMPwAALO1HZw64pju4gS
 GIRGuzCHFB3117H9C0nhOix1nQTjUAvbWS5Su9hkR0iaWYU5cW43pE19IX3JJFHGx9k6
 /nFcIzq0Xn0AOL4ejIZebZZgRMWIocrc/lTWzUBbJcbetshQjGFWSiP882VZX09jb+X7
 /H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885586; x=1699490386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eIOEVkg1eEsZP1oNmIbioqZ8i5sfbfNcrhdfHuiIn1w=;
 b=xO2E0XRB4hVp3DXfCqRyxKhV5zSxqHV/rgdRn9d480RVT9pIlJVyryKDayDgFV1stw
 2tqxOtgCmH4tjZ7zSd9wKZKmIWZk43zLzpusDwotYNr0M4pPz5LvKQ8995xeSJEj2JZH
 M/4nc0PpkWfqiZ3mFgWFr7bM31curok7TYhIhoX1NkUgNQHKIvsZcPKS7xyqgYj+mD7G
 /OASlL9u3YIkQoSM1/mrMN/PXLMg2EKJI/xCzgEnnE23qWeo9I+tnODSTjIgx5sdMxIA
 /BrTO5Js6cmoNF8mQjb0Zk0JQ9o17M3Sd+AoqdJZFqtSLEfEXYYITnSVA3b/4f+bEdml
 ZANw==
X-Gm-Message-State: AOJu0YzpT++0zXLXSIJrzCJnNp5ba94FsvDgoUlA7bPF9uxblmJb27c5
 L9TvLQ9G5KE+EejmhCWMkdAaFUMutHnxdHevUT8=
X-Google-Smtp-Source: AGHT+IHKSNc/wBwfBvc+N9rmxQgfPuOZuwDhoQdgIfWakY0IDu/JRsVZ7Q5xwMJZjKcmzDCvjzaUJ2k2oCxYgvmGC8w=
X-Received: by 2002:a1f:2f48:0:b0:49d:9916:5747 with SMTP id
 v69-20020a1f2f48000000b0049d99165747mr16791566vkv.13.1698885585584; Wed, 01
 Nov 2023 17:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231031154000.18134-1-rbradford@rivosinc.com>
 <20231031154000.18134-5-rbradford@rivosinc.com>
In-Reply-To: <20231031154000.18134-5-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:39:18 +1000
Message-ID: <CAKmqyKNPV0Q2Tse4UjF-tYg4yMGLGM01zXBCm4Cch7mFZyEuMA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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

On Wed, Nov 1, 2023 at 1:41=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> Using a mask instead of the number of PMU devices supports the accurate
> emulation of platforms that have a discontinuous set of PMU counters.
>
> The "pmu-num" property now generates a warning when used by the user on
> the command line.
>
> Rather than storing the value for "pmu-num" convert it directly to the
> mask if it is specified (overwriting the default "pmu-mask" value)
> likewise the value is calculated from the mask if the property value is
> obtained.
>
> In the unusual situation that both "pmu-mask" and "pmu-num" are provided
> then then the order on the command line determines which takes
> precedence (later overwriting earlier.)
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 40 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/cpu_cfg.h     |  2 +-
>  target/riscv/machine.c     |  2 +-
>  target/riscv/pmu.c         | 15 +++++++-------
>  target/riscv/tcg/tcg-cpu.c |  2 +-
>  5 files changed, 50 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac4a6c7eec..51accdba5f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1362,8 +1362,46 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_=
exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint8_t pmu_num;
> +
> +    visit_type_uint8(v, name, &pmu_num, errp);
> +
> +    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +        error_setg(errp, "Number of counters exceeds maximum available")=
;
> +        return;
> +    }
> +
> +    if (pmu_num =3D=3D 0) {
> +        cpu->cfg.pmu_mask =3D 0;
> +    } else {
> +        cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, pmu_num);
> +    }
> +
> +    warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
> +}
> +
> +static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint8_t pmu_num =3D ctpop32(cpu->cfg.pmu_mask);
> +
> +    visit_type_uint8(v, name, &pmu_num, errp);
> +}
> +
> +const PropertyInfo prop_pmu_num =3D {
> +    .name =3D "pmu-num",
> +    .get =3D prop_pmu_num_get,
> +    .set =3D prop_pmu_num_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MA=
SK(3, 16)),
> +    {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
>
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 0e6a0f245c..f4e6f273fc 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -123,7 +123,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
> -    uint8_t pmu_num;
> +    uint32_t pmu_mask;
>      char *priv_spec;
>      char *user_spec;
>      char *bext_spec;
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c7c862cdd3..9f6e3f7a6d 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
>
> -    return cpu->cfg.pmu_num;
> +    return (cpu->cfg.pmu_mask > 0);
>  }
>
>  static const VMStateDescription vmstate_pmu_ctr_state =3D {
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 7ddf4977b1..0e7d58b8a5 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -18,14 +18,13 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/error-report.h"
>  #include "cpu.h"
>  #include "pmu.h"
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/device_tree.h"
>
>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> -#define MAKE_32BIT_MASK(shift, length) \
> -        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
>
>  /*
>   * To keep it simple, any event can be mapped to any programmable counte=
rs in
> @@ -184,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_=
event_idx event_idx)
>      CPURISCVState *env =3D &cpu->env;
>      gpointer value;
>
> -    if (!cpu->cfg.pmu_num) {
> +    if (!cpu->cfg.pmu_mask) {
>          return 0;
>      }
>      value =3D g_hash_table_lookup(cpu->pmu_event_ctr_map,
> @@ -432,9 +431,12 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64=
_t value, uint32_t ctr_idx)
>
>  void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>  {
> -    uint8_t pmu_num =3D cpu->cfg.pmu_num;
> +    if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_TM | COUNTEREN_IR)=
) {
> +        error_setg(errp, "\"pmu-mask\" contains invalid bits (0-2) set")=
;
> +        return;
> +    }
>
> -    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
>          error_setg(errp, "Number of counters exceeds maximum available")=
;
>          return;
>      }
> @@ -445,6 +447,5 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>          return;
>      }
>
> -    /* Create a bitmask of available programmable counters */
> -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> +    cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
>  }
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index ed3eb991c0..53c52389b9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -613,7 +613,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **err=
p)
>          riscv_timer_init(cpu);
>      }
>
> -    if (cpu->cfg.pmu_num) {
> +    if (cpu->cfg.pmu_mask) {
>          riscv_pmu_init(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
> --
> 2.41.0
>
>

