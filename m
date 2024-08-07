Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA24BC3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 07:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbbO9-00062n-68; Wed, 07 Aug 2024 03:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sbbO6-00060x-1k
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 03:47:14 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sbbO2-0002Nw-7n
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 03:47:13 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so21571791fa.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723016828; x=1723621628;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0WBELP52QeioxDzkQ++LsaXpWZJ6yrZIjgIsaqLVxs=;
 b=zxiu6Hf+7c0mfKMgf8mvm8rOPsS7smu+i+SCV6k+JQ57aX8unsynBkMLGCeYAkpL6x
 gnegg1hzbV+Ex6r4NEXV5I58zMv1UsQeIBKaYi/3YDZ++ZZLehPeKrAkKicz3k5wcXUo
 6/M/vf3TPZ5E4XkK7Q14fzNLlZaWKaBPX9EeWl/Sd/5XfnuL/A2GjIiaLAikWKxuDz3i
 vqJKlNHX3dkDM7Y4EdLGhALIwwB4uympv7EnlF3BnXL/RbhhbkxNxPrASLDL6ncf6oaw
 h8AgF25mF3vXBpT+PR5eh1QX/61m20aSy/brvOv7bgOMsQcTGgd8hFPAvTByPQD/6XdR
 +n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723016828; x=1723621628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0WBELP52QeioxDzkQ++LsaXpWZJ6yrZIjgIsaqLVxs=;
 b=MmDov147jnEzuPWaWBvThoZCGN44dd0/nhxiPOX83tytVbtYKc4KXKtG8fq06vcnBU
 ELQrIShqjsFatYIvDlxVB6megmU6VSiduEi2S1c/KGCZ+SwUcCbPNMSoFhILXlFjTLm5
 9FqinNXeZ/94zdBZRXrtVx85S1WcY6TIzeokJ14pkwuiCcoGzrZNGwiLqROq1PuORrnr
 mLxEoaBiKsBB6LWKD7pXyWInC8arcpMTKa19otnWbzhkgNVsX7Fzf7KQ7GVIq1n10pjl
 EEcBhp7mcnIf1ViBPe2EJVzQLhI2IDPnlb2+ELR0Bcwlv43NrIe8qreOx/7r6QUVakEd
 rXCA==
X-Gm-Message-State: AOJu0YwJP6OBHfpDvXu6y9GYQBRxevPe5u+opQTNQdVYAavQ+hGRv6h1
 wZWVSh2ULsXtHqBka984mfeNJtnBbyfX91GZ7R1Eg2GjtRGSgqjIeMWjDacpmjqSiOJEycNbXi2
 UvfbuQMTPiNMYkAQyk0lvbzkmoCXG+m4imKX7Bw==
X-Google-Smtp-Source: AGHT+IGBBZEntDOYojK8xXJyWkf/s57w2Wk5OeVYwguF/QfT/LBpHVrXQXQ+NA1Z7/rcZI2HirXAtpjrcIKiJUpJLwk=
X-Received: by 2002:a2e:331a:0:b0:2ef:2e59:11d1 with SMTP id
 38308e7fff4ca-2f15aac5be7mr116072421fa.29.1723016827942; Wed, 07 Aug 2024
 00:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
 <20240723-counter_delegation-v2-12-c4170a5348ca@rivosinc.com>
 <CAKmqyKNX2LDGBMqWE_Dxmi9Ko7YWxz0ODXxMJN7eeeYakO7pow@mail.gmail.com>
In-Reply-To: <CAKmqyKNX2LDGBMqWE_Dxmi9Ko7YWxz0ODXxMJN7eeeYakO7pow@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 7 Aug 2024 00:46:57 -0700
Message-ID: <CAHBxVyHca4ixvbEAkyfpkoHErwsOKGbkfst9cj6t3HuTMf+qUw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] target/riscv: Add a preferred ISA extension rule
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Aug 5, 2024 at 6:48=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Wed, Jul 24, 2024 at 9:32=E2=80=AFAM Atish Patra <atishp@rivosinc.com>=
 wrote:
> >
> > In addition to the implied rule, a preferred rule will be useful
> > where an ISA extension may require a list of ISA extension to be
> > enabled to use all the features defined in that extension. All
> > these extensions may not be implied in the ISA.
>
> This seems practically the same as an implied rule, I'm not sure we
> need a separate list of rules
>

As per my understanding, the implied rule defines the mandatory
dependent extensions
specified by ISA. The preferred rule allows you to enable more related
extensions which
the user will commonly enable but necessary to.

These preferred extensions can be individually disabled too if a user
wants. This feature needs
be verified though as I just wanted to get feedback on the preferred rule t=
hing.

Let me know if I misunderstood the intention of the implied rule.

> Alistair
>
> >
> > This patch just introduces a new preferred rule which allows
> > to enable multiple extensions together without burdening the qemu
> > commandline user.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/cpu.c         |  4 ++++
> >  target/riscv/cpu.h         | 17 ++++++++++++++
> >  target/riscv/tcg/tcg-cpu.c | 57 ++++++++++++++++++++++++++++++++++++++=
++------
> >  3 files changed, 71 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 393d1d67120e..22ba43c7ff2a 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -2665,6 +2665,10 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied=
_rules[] =3D {
> >      NULL
> >  };
> >
> > +RISCVCPUPreferredExtsRule *riscv_multi_ext_preferred_rules[] =3D {
> > +    NULL
> > +};
> > +
> >  static Property riscv_cpu_properties[] =3D {
> >      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index af25550a4a54..d775866344f5 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -142,10 +142,27 @@ typedef struct riscv_cpu_implied_exts_rule {
> >      const uint32_t implied_multi_exts[];
> >  } RISCVCPUImpliedExtsRule;
> >
> > +typedef struct riscv_cpu_preferred_exts_rule {
> > +#ifndef CONFIG_USER_ONLY
> > +    /*
> > +     * Bitmask indicates the rule enabled status for the harts.
> > +     * This enhancement is only available in system-mode QEMU,
> > +     * as we don't have a good way (e.g. mhartid) to distinguish
> > +     * the SMP cores in user-mode QEMU.
> > +     */
> > +    unsigned long *enabled;
> > +#endif
> > +    /* multi extension offset. */
> > +    const uint32_t ext;
> > +    const uint32_t preferred_multi_exts[];
> > +} RISCVCPUPreferredExtsRule;
> > +
> >  extern RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[];
> >  extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
> > +extern RISCVCPUPreferredExtsRule *riscv_multi_ext_preferred_rules[];
> >
> >  #define RISCV_IMPLIED_EXTS_RULE_END -1
> > +#define RISCV_PREFRRED_EXTS_RULE_END RISCV_IMPLIED_EXTS_RULE_END
> >
> >  #define MMU_USER_IDX 3
> >
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > index 1c9a87029423..d8f74720815a 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -32,6 +32,7 @@
> >  #include "hw/core/accel-cpu.h"
> >  #include "hw/core/tcg-cpu-ops.h"
> >  #include "tcg/tcg.h"
> > +#include <stdio.h>
> >  #ifndef CONFIG_USER_ONLY
> >  #include "hw/boards.h"
> >  #endif
> > @@ -733,6 +734,7 @@ static void riscv_cpu_validate_profiles(RISCVCPU *c=
pu)
> >  static void riscv_cpu_init_ext_rules(void)
> >  {
> >      RISCVCPUImpliedExtsRule *rule;
> > +    RISCVCPUPreferredExtsRule *prule;
> >  #ifndef CONFIG_USER_ONLY
> >      MachineState *ms =3D MACHINE(qdev_get_machine());
> >  #endif
> > @@ -760,22 +762,40 @@ static void riscv_cpu_init_ext_rules(void)
> >                              GUINT_TO_POINTER(rule->ext), (gpointer)rul=
e);
> >      }
> >
> > +    for (i =3D 0; (prule =3D riscv_multi_ext_preferred_rules[i]); i++)=
 {
> > +#ifndef CONFIG_USER_ONLY
> > +        prule->enabled =3D bitmap_new(ms->smp.cpus);
> > +#endif
> > +        g_hash_table_insert(multi_ext_enabling_rules,
> > +                            GUINT_TO_POINTER(prule->ext), (gpointer)pr=
ule);
> > +    }
> > +
> >      initialized =3D true;
> >  }
> >
> >  static void cpu_enable_ext_rule(RISCVCPU *cpu,
> > -                                    RISCVCPUImpliedExtsRule *rule)
> > +                                RISCVCPUImpliedExtsRule *rule,
> > +                                RISCVCPUPreferredExtsRule *prule)
> >  {
> >      CPURISCVState *env =3D &cpu->env;
> >      RISCVCPUImpliedExtsRule *ir;
> > +    RISCVCPUPreferredExtsRule *pr;
> >      bool enabled =3D false;
> >      int i;
> >
> >  #ifndef CONFIG_USER_ONLY
> > -    enabled =3D test_bit(cpu->env.mhartid, rule->enabled);
> > +    if (rule) {
> > +        enabled =3D test_bit(cpu->env.mhartid, rule->enabled);
> > +    } else if (prule) {
> > +        enabled =3D test_bit(cpu->env.mhartid, prule->enabled);
> > +    } else {
> > +        return;
> > +    }
> >  #endif
> > +    if (enabled)
> > +        return;
> >
> > -    if (!enabled) {
> > +    if (rule) {
> >          /* Enable the implied MISAs. */
> >          if (rule->implied_misa_exts) {
> >              riscv_cpu_set_misa_ext(env,
> > @@ -787,7 +807,7 @@ static void cpu_enable_ext_rule(RISCVCPU *cpu,
> >                                               GUINT_TO_POINTER(misa_bit=
s[i]));
> >
> >                      if (ir) {
> > -                        cpu_enable_ext_rule(cpu, ir);
> > +                        cpu_enable_ext_rule(cpu, ir, NULL);
> >                      }
> >                  }
> >              }
> > @@ -803,12 +823,27 @@ static void cpu_enable_ext_rule(RISCVCPU *cpu,
> >                                              rule->implied_multi_exts[i=
]));
> >
> >              if (ir) {
> > -                cpu_enable_ext_rule(cpu, ir);
> > +                cpu_enable_ext_rule(cpu, ir, NULL);
> >              }
> >          }
> >
> >  #ifndef CONFIG_USER_ONLY
> >          bitmap_set(rule->enabled, cpu->env.mhartid, 1);
> > +#endif
> > +    } else if (prule) {
> > +        /* Enable the preferred extensions. */
> > +        for (i =3D 0;
> > +          prule->preferred_multi_exts[i] !=3D RISCV_PREFRRED_EXTS_RULE=
_END; i++) {
> > +            cpu_cfg_ext_auto_update(cpu, prule->preferred_multi_exts[i=
], true);
> > +            pr =3D g_hash_table_lookup(multi_ext_enabling_rules,
> > +                                     GUINT_TO_POINTER(
> > +                                     prule->preferred_multi_exts[i]));
> > +            if (pr) {
> > +                cpu_enable_ext_rule(cpu, NULL, prule);
> > +            }
> > +        }
> > +#ifndef CONFIG_USER_ONLY
> > +        bitmap_set(prule->enabled, cpu->env.mhartid, 1);
> >  #endif
> >      }
> >  }
> > @@ -847,6 +882,7 @@ static void cpu_enable_zc_implied_rules(RISCVCPU *c=
pu)
> >  static void riscv_cpu_enable_ext_rules(RISCVCPU *cpu)
> >  {
> >      RISCVCPUImpliedExtsRule *rule;
> > +    RISCVCPUPreferredExtsRule *prule;
> >      int i;
> >
> >      /* Enable the implied extensions for Zc. */
> > @@ -855,14 +891,21 @@ static void riscv_cpu_enable_ext_rules(RISCVCPU *=
cpu)
> >      /* Enable the implied MISAs. */
> >      for (i =3D 0; (rule =3D riscv_misa_ext_implied_rules[i]); i++) {
> >          if (riscv_has_ext(&cpu->env, rule->ext)) {
> > -            cpu_enable_ext_rule(cpu, rule);
> > +            cpu_enable_ext_rule(cpu, rule, NULL);
> >          }
> >      }
> >
> >      /* Enable the implied extensions. */
> >      for (i =3D 0; (rule =3D riscv_multi_ext_implied_rules[i]); i++) {
> >          if (isa_ext_is_enabled(cpu, rule->ext)) {
> > -            cpu_enable_ext_rule(cpu, rule);
> > +            cpu_enable_ext_rule(cpu, rule, NULL);
> > +        }
> > +    }
> > +
> > +    /* Enable the preferred extensions. */
> > +    for (i =3D 0; (prule =3D riscv_multi_ext_preferred_rules[i]); i++)=
 {
> > +        if (isa_ext_is_enabled(cpu, prule->ext)) {
> > +            cpu_enable_ext_rule(cpu, NULL, prule);
> >          }
> >      }
> >  }
> >
> > --
> > 2.34.1
> >
> >

