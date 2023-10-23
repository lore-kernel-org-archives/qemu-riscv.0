Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F379CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qukHr-0007cM-2W; Sun, 22 Oct 2023 22:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukHp-0007Qf-4R; Sun, 22 Oct 2023 22:03:21 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukHn-0006PQ-7H; Sun, 22 Oct 2023 22:03:20 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-457cb2fe3abso1126642137.3; 
 Sun, 22 Oct 2023 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698026598; x=1698631398; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNO6YQ53wmtunDNUft8NS8dh2KDQEbFeS41wQYl5C34=;
 b=BYKWE1GQV5BxCRdvPeWFwCqtMfKgwwPWuEYcMYGT7ibI0IcpNuwZXD4UUXgbCuKHDp
 tVHso2vVjUI2B4xCOFtF8nmyct3c1sFciHF3d/jc0NgxhVH9+4Kn2BITGuSqCCqwgIp4
 K5o73k8XJRWCH73lng4jp90v5VSBm1pLJaCH+vRaH4MDzVtGSm6ZM6y5R67SWeWRor9D
 MN17LgqSye40qEhvqtMNfahoOJCigTG/VG64hKx3lDH8B7zc1jy/WqB8fWXFk5WZjEs5
 6aYO9CzZt849A9aCdti/GdbqZL6hKrONzoR0aeQumZnM9bAN4Ccl3BkBdwwZKQiMGXgF
 7OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698026598; x=1698631398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNO6YQ53wmtunDNUft8NS8dh2KDQEbFeS41wQYl5C34=;
 b=dlOiblzdHYZWCRFKCnKEiJb7bhxLw7I4JU2yim5r1hAvFpSi5RxWfj+o2IX6mOjY2x
 2NTs7ieNNpkCvPiyOQ5ej46WMO335xiAXJ3QFNDMckgxJZNEDBXwM31jPWGfBrXDQhbd
 wuxGg2F5XJ/hjNNPKDie+UQOoV4sxDzs1CBOhCbn+MV99PahkekzCAc3I8k5/xB0CoDs
 D0LCcXys/KZfR95D6c0aIn4EAvv6vndN1zzL1KHsnkvb6pWu1yZews2mGlnXdzbOeul9
 mbjcGw/2AgisQNNKciQPB/iBjvoCAK4EUmoVBUoHFX29TGj6iZTLOIK7PnZ28rTnephM
 wQ3g==
X-Gm-Message-State: AOJu0YwAbmQ5oDtKr6v/UrrhkHR8813sYjC5JDzAi+3Q2ZPi3GNTCUyP
 ag7uie8qdDqHOGuB2ZLI0VsiJshbYOaGjbmKuao=
X-Google-Smtp-Source: AGHT+IECZBed4U7t63/cBX0JjIryn+E6A3FWzM2C+1kKkmheSp1E/yIq6bwuypYWBtoitKmqZq+MqkJgZ3ek6UjLXKE=
X-Received: by 2002:a67:ae45:0:b0:457:e828:3747 with SMTP id
 u5-20020a67ae45000000b00457e8283747mr7584568vsh.5.1698026597839; Sun, 22 Oct
 2023 19:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-5-rbradford@rivosinc.com>
In-Reply-To: <20231018154434.17367-5-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:02:50 +1000
Message-ID: <CAKmqyKOEwa2soJNP9KkhoPxxJaEAsKFAnLQYtpo5+DgBi1XoLg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

On Thu, Oct 19, 2023 at 1:45=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Using a mask instead of the number of PMU devices supports the accurate
> emulation of platforms that have a discontinuous set of PMU counters.
>
> The "pmu-num" property now generates a warning when used by the user on
> the command line. In order to avoid warning for the default value when
> the property is not explicitly by the user the property default value
> cannot be used so the default value must be set during the CPU object
> initialisation.
>
> If the "pmu-num" value is changed from the default then the mask will be
> generated from that to support the transition to "pmu-mask".
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>  target/riscv/cpu.c         | 31 ++++++++++++++++++++++++++++++-
>  target/riscv/cpu_cfg.h     |  3 ++-
>  target/riscv/machine.c     |  2 +-
>  target/riscv/pmu.c         | 20 ++++++++++++++++----
>  target/riscv/tcg/tcg-cpu.c |  2 +-
>  5 files changed, 50 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac4a6c7eec..1b734d1dde 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1169,6 +1169,11 @@ static void riscv_cpu_post_init(Object *obj)
>
>  static void riscv_cpu_init(Object *obj)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    /* Using property default value would spam deprecation warning */
> +    cpu->cfg.pmu_num =3D 16;
> +
>  #ifndef CONFIG_USER_ONLY
>      qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> @@ -1362,8 +1367,32 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_=
exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
> +    warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
> +}
> +
> +static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
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
> +    DEFINE_PROP("pmu-num", RISCVCPU, cfg.pmu_num, prop_pmu_num, uint8_t)=
, /* Deprecated */
> +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MA=
SK(3, 16)),
>
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 0e6a0f245c..d273487040 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -123,7 +123,8 @@ struct RISCVCPUConfig {
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
> -    uint8_t pmu_num;
> +    uint8_t pmu_num; /* Deprecated */
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
> index 7ddf4977b1..5e89354bb9 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -18,6 +18,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/error-report.h"
>  #include "cpu.h"
>  #include "pmu.h"
>  #include "sysemu/cpu-timers.h"
> @@ -184,7 +185,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_=
event_idx event_idx)
>      CPURISCVState *env =3D &cpu->env;
>      gpointer value;
>
> -    if (!cpu->cfg.pmu_num) {
> +    if (!cpu->cfg.pmu_mask) {
>          return 0;
>      }
>      value =3D g_hash_table_lookup(cpu->pmu_event_ctr_map,
> @@ -434,7 +435,13 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>  {
>      uint8_t pmu_num =3D cpu->cfg.pmu_num;
>
> -    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +    if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_TM | COUNTEREN_IR)=
) {
> +        error_setg(errp, "\"pmu-mask\" contains invalid bits (0-2) set")=
;
> +        return;
> +    }
> +
> +    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3) ||
> +        (pmu_num > RV_MAX_MHPMCOUNTERS - 3)) {
>          error_setg(errp, "Number of counters exceeds maximum available")=
;
>          return;
>      }
> @@ -445,6 +452,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>          return;
>      }
>
> -    /* Create a bitmask of available programmable counters */
> -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> +    if (pmu_num =3D=3D 0) {
> +        cpu->cfg.pmu_mask =3D 0;
> +    } else if (pmu_num !=3D 16) {

I think it's clearer if this is just an else instead of if not 16

> +        cpu->cfg.pmu_mask =3D MAKE_32BIT_MASK(3, pmu_num);
> +    }

Also doesn't think mean that the pmu-num prop will override the
pmu-mask prop? We probably want to do it the other way around.

Does setting pmu_mask directly in prop_pmu_num_set() work? Then we can
drop pmu_num completely.

Alistair

> +
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

