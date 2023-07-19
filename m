Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F0CEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:04:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvbi-00027P-88; Tue, 18 Jul 2023 21:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvbe-00020I-Pm; Tue, 18 Jul 2023 21:03:54 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvbb-0007xW-RS; Tue, 18 Jul 2023 21:03:54 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-446e8355203so425440137.3; 
 Tue, 18 Jul 2023 18:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728630; x=1692320630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q74qDzO1rVoFNt1s44E7atU8GlOTUQvVA8eYLXCeC6k=;
 b=OGzrZV+Q5NUn/ISe9ufNBuvT4XGe4MDa/V7bEfHpbRqkZ1kRgK50RLblKuYscKDShZ
 sqVtDbO/JOZAzHbpfYzj7+duqrMto5GE6/C0gfsYLnNmxVEGZs2kPUiYNfwsxOabPaeU
 QLVih4wQzDRU48RpDAUc2cK/l4eqlmxgK16c+k+fZ8PoIFDUjLkyHzV6+qVXW3vedEmp
 FVGyB92LsNOVHK78ugLnArYhYEswjhHu3a5iT4LSRnndbDkhI3pl5370L2+pZQ80peIA
 38+qLkpnA3a0VYNvcEZLoPR5vVXzXv8sg5lY7YSVUitp25qw3KCuar8DNadRVSXD8L8z
 UCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728630; x=1692320630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q74qDzO1rVoFNt1s44E7atU8GlOTUQvVA8eYLXCeC6k=;
 b=VcMXzY6IoqsbEbMLnaraQN/6C2BsJ1rrhEtcQerYP1btIC9RFUZ8ufga8K6LXjAAG5
 sUVAQprSoMXMygU8rdx8hwVonNxrTQ2t2p17eb5LE/jHq+fXMorFW2Dbq6480otFAtAf
 IhqiGW94bU6MEGt1qcEXk4QaWLjDGfW/p6y09iRCB0Uezzdv4yM2+HXzDhhmIn4n4N87
 q2xzlmlP/TyCQpAbT7zSUoaNbs/wxMFtvZyAjRkTfWLfb3RnbSLzaUtKOCW5F52cA9/C
 Ma+RItT1lpe4KerLAqsum/tOyx2ZBl/nELp3EZRZnTN+bBzUKD16U2osA1M3me44+Aq3
 9JxQ==
X-Gm-Message-State: ABy/qLbozAxvp6mL44nE3UgWPwy2Q7eMDc1/3+EIVZ5F205Zvmd1q9ds
 XkILLSoOeEOVGtPUMd6fbNOO44+8yCByd4bDIfU=
X-Google-Smtp-Source: APBJJlEZLi+dfdsKQpYNeHRQ3nhhFvkxtu4AmRyjCRvURy2bld4FfqYJY/GEnwtUziF8WuNlnep/9y8bLq5416CkcJM=
X-Received: by 2002:a67:f84d:0:b0:443:a4d2:86b9 with SMTP id
 b13-20020a67f84d000000b00443a4d286b9mr10145498vsp.0.1689728630521; Tue, 18
 Jul 2023 18:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-11-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-11-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:03:24 +1000
Message-ID: <CAKmqyKOcVm0+Dux3WcFqhWj4pD-urt68+ds7ofh3NEjOMEV0aA@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] target/riscv: Extract TCG-specific code from
 debug.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Tue, Jul 11, 2023 at 10:21=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Extract TCG-specific code from debug.c to tcg/sysemu/debug.c,
> restrict the prototypes to TCG, adapt meson rules.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/debug.h                |   2 +
>  target/riscv/debug.c                | 148 -------------------------
>  target/riscv/tcg/sysemu/debug.c     | 165 ++++++++++++++++++++++++++++
>  target/riscv/tcg/meson.build        |   2 +
>  target/riscv/tcg/sysemu/meson.build |   3 +
>  5 files changed, 172 insertions(+), 148 deletions(-)
>  create mode 100644 target/riscv/tcg/sysemu/debug.c
>  create mode 100644 target/riscv/tcg/sysemu/meson.build
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 65cd45b8f3..0b3bdd5be1 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -139,9 +139,11 @@ void tdata_csr_write(CPURISCVState *env, int tdata_i=
ndex, target_ulong val);
>
>  target_ulong tinfo_csr_read(CPURISCVState *env);
>
> +#ifdef CONFIG_TCG
>  void riscv_cpu_debug_excp_handler(CPUState *cs);
>  bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
> +#endif
>
>  void riscv_trigger_init(CPURISCVState *env);
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 5676f2c57e..45a2605d8a 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -754,154 +754,6 @@ target_ulong tinfo_csr_read(CPURISCVState *env)
>             BIT(TRIGGER_TYPE_AD_MATCH6);
>  }
>
> -void riscv_cpu_debug_excp_handler(CPUState *cs)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -
> -    if (cs->watchpoint_hit) {
> -        if (cs->watchpoint_hit->flags & BP_CPU) {
> -            do_trigger_action(env, DBG_ACTION_BP);
> -        }
> -    } else {
> -        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> -            do_trigger_action(env, DBG_ACTION_BP);
> -        }
> -    }
> -}
> -
> -bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    CPUBreakpoint *bp;
> -    target_ulong ctrl;
> -    target_ulong pc;
> -    int trigger_type;
> -    int i;
> -
> -    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -        for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> -            trigger_type =3D get_trigger_type(env, i);
> -
> -            switch (trigger_type) {
> -            case TRIGGER_TYPE_AD_MATCH:
> -                /* type 2 trigger cannot be fired in VU/VS mode */
> -                if (env->virt_enabled) {
> -                    return false;
> -                }
> -
> -                ctrl =3D env->tdata1[i];
> -                pc =3D env->tdata2[i];
> -
> -                if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
> -                    /* check U/S/M bit against current privilege level *=
/
> -                    if ((ctrl >> 3) & BIT(env->priv)) {
> -                        return true;
> -                    }
> -                }
> -                break;
> -            case TRIGGER_TYPE_AD_MATCH6:
> -                ctrl =3D env->tdata1[i];
> -                pc =3D env->tdata2[i];
> -
> -                if ((ctrl & TYPE6_EXEC) && (bp->pc =3D=3D pc)) {
> -                    if (env->virt_enabled) {
> -                        /* check VU/VS bit against current privilege lev=
el */
> -                        if ((ctrl >> 23) & BIT(env->priv)) {
> -                            return true;
> -                        }
> -                    } else {
> -                        /* check U/S/M bit against current privilege lev=
el */
> -                        if ((ctrl >> 3) & BIT(env->priv)) {
> -                            return true;
> -                        }
> -                    }
> -                }
> -                break;
> -            default:
> -                /* other trigger types are not supported or irrelevant *=
/
> -                break;
> -            }
> -        }
> -    }
> -
> -    return false;
> -}
> -
> -bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    target_ulong ctrl;
> -    target_ulong addr;
> -    int trigger_type;
> -    int flags;
> -    int i;
> -
> -    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> -        trigger_type =3D get_trigger_type(env, i);
> -
> -        switch (trigger_type) {
> -        case TRIGGER_TYPE_AD_MATCH:
> -            /* type 2 trigger cannot be fired in VU/VS mode */
> -            if (env->virt_enabled) {
> -                return false;
> -            }
> -
> -            ctrl =3D env->tdata1[i];
> -            addr =3D env->tdata2[i];
> -            flags =3D 0;
> -
> -            if (ctrl & TYPE2_LOAD) {
> -                flags |=3D BP_MEM_READ;
> -            }
> -            if (ctrl & TYPE2_STORE) {
> -                flags |=3D BP_MEM_WRITE;
> -            }
> -
> -            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
> -                /* check U/S/M bit against current privilege level */
> -                if ((ctrl >> 3) & BIT(env->priv)) {
> -                    return true;
> -                }
> -            }
> -            break;
> -        case TRIGGER_TYPE_AD_MATCH6:
> -            ctrl =3D env->tdata1[i];
> -            addr =3D env->tdata2[i];
> -            flags =3D 0;
> -
> -            if (ctrl & TYPE6_LOAD) {
> -                flags |=3D BP_MEM_READ;
> -            }
> -            if (ctrl & TYPE6_STORE) {
> -                flags |=3D BP_MEM_WRITE;
> -            }
> -
> -            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
> -                if (env->virt_enabled) {
> -                    /* check VU/VS bit against current privilege level *=
/
> -                    if ((ctrl >> 23) & BIT(env->priv)) {
> -                        return true;
> -                    }
> -                } else {
> -                    /* check U/S/M bit against current privilege level *=
/
> -                    if ((ctrl >> 3) & BIT(env->priv)) {
> -                        return true;
> -                    }
> -                }
> -            }
> -            break;
> -        default:
> -            /* other trigger types are not supported */
> -            break;
> -        }
> -    }
> -
> -    return false;
> -}
> -
>  void riscv_trigger_init(CPURISCVState *env)
>  {
>      target_ulong tdata1 =3D build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, =
0);
> diff --git a/target/riscv/tcg/sysemu/debug.c b/target/riscv/tcg/sysemu/de=
bug.c
> new file mode 100644
> index 0000000000..cdd6744b3a
> --- /dev/null
> +++ b/target/riscv/tcg/sysemu/debug.c
> @@ -0,0 +1,165 @@
> +/*
> + * QEMU RISC-V Native Debug Support (TCG specific)
> + *
> + * Copyright (c) 2022 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This provides the native debug support via the Trigger Module, as def=
ined
> + * in the RISC-V Debug Specification:
> + * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stab=
le.pdf
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +
> +void riscv_cpu_debug_excp_handler(CPUState *cs)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    if (cs->watchpoint_hit) {
> +        if (cs->watchpoint_hit->flags & BP_CPU) {
> +            do_trigger_action(env, DBG_ACTION_BP);
> +        }
> +    } else {
> +        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> +            do_trigger_action(env, DBG_ACTION_BP);
> +        }
> +    }
> +}
> +
> +bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    CPUBreakpoint *bp;
> +    target_ulong ctrl;
> +    target_ulong pc;
> +    int trigger_type;
> +    int i;
> +
> +    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> +        for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +            trigger_type =3D get_trigger_type(env, i);
> +
> +            switch (trigger_type) {
> +            case TRIGGER_TYPE_AD_MATCH:
> +                /* type 2 trigger cannot be fired in VU/VS mode */
> +                if (env->virt_enabled) {
> +                    return false;
> +                }
> +
> +                ctrl =3D env->tdata1[i];
> +                pc =3D env->tdata2[i];
> +
> +                if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
> +                    /* check U/S/M bit against current privilege level *=
/
> +                    if ((ctrl >> 3) & BIT(env->priv)) {
> +                        return true;
> +                    }
> +                }
> +                break;
> +            case TRIGGER_TYPE_AD_MATCH6:
> +                ctrl =3D env->tdata1[i];
> +                pc =3D env->tdata2[i];
> +
> +                if ((ctrl & TYPE6_EXEC) && (bp->pc =3D=3D pc)) {
> +                    if (env->virt_enabled) {
> +                        /* check VU/VS bit against current privilege lev=
el */
> +                        if ((ctrl >> 23) & BIT(env->priv)) {
> +                            return true;
> +                        }
> +                    } else {
> +                        /* check U/S/M bit against current privilege lev=
el */
> +                        if ((ctrl >> 3) & BIT(env->priv)) {
> +                            return true;
> +                        }
> +                    }
> +                }
> +                break;
> +            default:
> +                /* other trigger types are not supported or irrelevant *=
/
> +                break;
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    target_ulong ctrl;
> +    target_ulong addr;
> +    int trigger_type;
> +    int flags;
> +    int i;
> +
> +    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +        trigger_type =3D get_trigger_type(env, i);
> +
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +            /* type 2 trigger cannot be fired in VU/VS mode */
> +            if (env->virt_enabled) {
> +                return false;
> +            }
> +
> +            ctrl =3D env->tdata1[i];
> +            addr =3D env->tdata2[i];
> +            flags =3D 0;
> +
> +            if (ctrl & TYPE2_LOAD) {
> +                flags |=3D BP_MEM_READ;
> +            }
> +            if (ctrl & TYPE2_STORE) {
> +                flags |=3D BP_MEM_WRITE;
> +            }
> +
> +            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
> +                /* check U/S/M bit against current privilege level */
> +                if ((ctrl >> 3) & BIT(env->priv)) {
> +                    return true;
> +                }
> +            }
> +            break;
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            ctrl =3D env->tdata1[i];
> +            addr =3D env->tdata2[i];
> +            flags =3D 0;
> +
> +            if (ctrl & TYPE6_LOAD) {
> +                flags |=3D BP_MEM_READ;
> +            }
> +            if (ctrl & TYPE6_STORE) {
> +                flags |=3D BP_MEM_WRITE;
> +            }
> +
> +            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
> +                if (env->virt_enabled) {
> +                    /* check VU/VS bit against current privilege level *=
/
> +                    if ((ctrl >> 23) & BIT(env->priv)) {
> +                        return true;
> +                    }
> +                } else {
> +                    /* check U/S/M bit against current privilege level *=
/
> +                    if ((ctrl >> 3) & BIT(env->priv)) {
> +                        return true;
> +                    }
> +                }
> +            }
> +            break;
> +        default:
> +            /* other trigger types are not supported */
> +            break;
> +        }
> +    }
> +
> +    return false;
> +}
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index a615aafd9a..933d340799 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -18,3 +18,5 @@ riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'crypto_helper.c',
>    'zce_helper.c',
>  ), if_false: files('tcg-stub.c'))
> +
> +subdir('sysemu')
> diff --git a/target/riscv/tcg/sysemu/meson.build b/target/riscv/tcg/sysem=
u/meson.build
> new file mode 100644
> index 0000000000..e8e61e5784
> --- /dev/null
> +++ b/target/riscv/tcg/sysemu/meson.build
> @@ -0,0 +1,3 @@
> +riscv_system_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'debug.c',
> +))
> --
> 2.38.1
>
>

