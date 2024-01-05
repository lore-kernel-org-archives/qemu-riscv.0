Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B3C4707B
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:05:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcOe-0007kW-Oe; Fri, 05 Jan 2024 00:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcOc-0007fa-H9; Fri, 05 Jan 2024 00:05:26 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcOa-0007e4-PZ; Fri, 05 Jan 2024 00:05:26 -0500
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4b794308cafso387536e0c.2; 
 Thu, 04 Jan 2024 21:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431123; x=1705035923; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcJot6n95FnjlKt99U8+QMSzJcGNf2XbHTx7jKq4Xl8=;
 b=QbSlDUtiAac3aMRsWtrt22GzQWAxOtDUv3JsYPa2KFy5ONkCR4+/fH4gmvNNzs41X3
 i+UMISEMqd9mQA9lrcVz+aAzBD8HQpqRTeDevd+7DpJ7auQddqdgJadOHzL4+SI1tnEZ
 9y3oqorUw5jVFrA+rjRgkAIEmg2MAfStPF7P3WLq4aJgCYGhR6zYks9Y1DREg+lhYhjq
 JBMbpUl5Eme5mUufcg4+QVACkzP+bDbIlmXRnVIK/RyTEaQt7ZK8GDOLGIr173oG4sfc
 imGXvA/lI5p2muLqA//J5KrHzw9P7pSJbAHAxf6Bp5zP9MdhDCoCLqcRdB8P0uzYbxJo
 xlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431123; x=1705035923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcJot6n95FnjlKt99U8+QMSzJcGNf2XbHTx7jKq4Xl8=;
 b=KChebI0BNhFu1OwhIzM5ThMrlcLV0Dhxe580xN7vHB3Gu7S4bzzLfHygtSr4ZEAd21
 OMQyaoobjg9Unw2OhlkqyxxEL4vIuDb6QqUaubXPtcT/YrUrJu9x/HsKrzXFUaFMDo9q
 L0m9S6wNZnc1qOBmPPsYcuHuAKBfg32p79+9hXjFxJSvs/+QgXkyrJaFz/mPvqmo6Smv
 IMh9XJFSfCsfqVIjoS+gGGXRntCCwv1m7CtmSKFxNl6cM/SI+xlhOGfw5qE9sA3LZvxs
 1vmCmrj/sHIL7BUbRA9ezxxzNXdOHg3lHZfp1zaJcWcFrao7SA1oYg2Dih2jLGS/BWbm
 O0zg==
X-Gm-Message-State: AOJu0YxZIOCCkq3ggtF2DaC16TCYL7xMZ0EA32XFZJe0dn6iWpvWjOgJ
 D802w5ZFj42Ecae3kj8z0ujb6RCs9WEVfd24wrw=
X-Google-Smtp-Source: AGHT+IGWxz5XtvjNMhXRrXgyxaoMJRgWkcxBxYjI6NiUWf3QnO41yf/ocsQHfOlClHirT2VtVFSXzlHAIDgCpn0QKwc=
X-Received: by 2002:a05:6122:4a08:b0:4b6:ea3a:f887 with SMTP id
 ez8-20020a0561224a0800b004b6ea3af887mr1683216vkb.22.1704431123404; Thu, 04
 Jan 2024 21:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-9-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:05:00 +1000
Message-ID: <CAKmqyKPQBmfNDPWJR-5fKpXh5V5wyA=dA0mkdA4MDAh1-kzn8g@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] target/riscv: move 'vlen' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Thu, Jan 4, 2024 at 3:48=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Turning 'vlen' into a class property will allow its default value to be
> overwritten by cpu_init() later on, solving the issue we have now where
> CPU specific settings are getting overwritten by the default.
>
> Common validation bits are moved from riscv_cpu_validate_v() to
> prop_vlen_set() to be shared with KVM.
>
> And, as done with every option we migrated to riscv_cpu_properties[],
> vendor CPUs can't have their 'vlen' value changed.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 45 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/tcg/tcg-cpu.c |  5 -----
>  2 files changed, 44 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c39da44f51..557874a017 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,6 +29,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/core/qdev-prop-internal.h"
>  #include "migration/vmstate.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
> @@ -1267,6 +1268,7 @@ static void riscv_cpu_init(Object *obj)
>
>      /* Default values for non-bool cpu properties */
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
> +    cpu->cfg.vlen =3D 128;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
> @@ -1733,8 +1735,47 @@ static const PropertyInfo prop_vext_spec =3D {
>      .set =3D prop_vext_spec_set,
>  };
>
> +static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!is_power_of_2(value)) {
> +        error_setg(errp, "Vector extension VLEN must be power of 2");
> +        return;
> +    }
> +
> +    if (value !=3D cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.vlen);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.vlen =3D value;
> +}
> +
> +static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.vlen;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_vlen =3D {
> +    .name =3D "vlen",
> +    .get =3D prop_vlen_get,
> +    .set =3D prop_vlen_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
> @@ -1755,6 +1796,8 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "priv_spec", .info =3D &prop_priv_spec},
>      {.name =3D "vext_spec", .info =3D &prop_vext_spec},
>
> +    {.name =3D "vlen", .info =3D &prop_vlen},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 6501c29d8e..8ec858e096 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -178,11 +178,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cp=
u, Error **errp)
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
>                                   Error **errp)
>  {
> -    if (!is_power_of_2(cfg->vlen)) {
> -        error_setg(errp, "Vector extension VLEN must be power of 2");
> -        return;
> -    }
> -
>      if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
>          error_setg(errp,
>                     "Vector extension implementation only supports VLEN "
> --
> 2.43.0
>
>

