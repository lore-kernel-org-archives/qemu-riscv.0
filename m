Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0715CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcvCS-0006fb-0w; Thu, 25 Jun 2026 21:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvCM-0006eh-BM
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:17:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvCJ-00056U-Qf
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:17:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-69796a9f04bso776849a12.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782436654; cv=none;
 d=google.com; s=arc-20260327;
 b=PdqrByg+md9ZlWO+tT6/Ou2N5iSCyDS6/Ze6ajwMF9tpc22QfqbGHT8bk3JVgCDYDS
 /xQ6UJz/Dzujivbs0Zs+KTacz45CeXfzMXV/mSjKlu3/cJ/qsrkLY5vI0j/qiH9ioZv3
 xx4y+/MjUbSaiUJ9VAnUWIQiJBXLcavS4kBB68oDQywlQF032CNRK8XmaO2nu19iUV4y
 MxxkdhjUC0Cco1B/6MC/xn1H80zvRHsJTEP4mztKAY6deFz58SvuO0DFE0fav98QeOGr
 WOx51Wo58QeDEJuF83sAGWXEd5bjnTxIPXtZvk0s4RjCArfce6SGaNtZrAWHRvepgPhX
 7hJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=naFbRo+L+gKf9Smlbf6aGayGRsGasYoZNdRCa0x4oPg=;
 fh=XzeTBmXXriP7pyBm3cCDHQIQbQLv6CcFDA91k11PTjo=;
 b=kVGEUmVraRSVJD85MzvbbpsclBijajxJHnzDQf63FS8JFFQMme+gKu8LmvPy38TkHd
 o8sT0N3UlheHsLu7lmpIGZUSSitTWMy/YZKwu1QLZjB3UvjXvQySj/jG0ooP8A38iSXN
 U84Kex3LrsrL61Fm+1+//lBAbqEcZPNSoSlxdosV2KMbIDO0lQriszpqfTLUNxK/5keL
 /qdzn9XcN9dTjFHiNsdjNaq0SroYHtL2Lov6LGMjtGnbmD/+l43CD+EbCJNgTARxjsFg
 b56Q/wOdg1ODyO5DUCsrqx07WCzvF85WawiFQ8suC0sjVm5v5LLVfjQV4T+MurhMIc94
 DIOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782436654; x=1783041454; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naFbRo+L+gKf9Smlbf6aGayGRsGasYoZNdRCa0x4oPg=;
 b=V+cB1D2YgcSUx7/U3Xj0BVRbXaKFNZIl3QktID4IVUl+eUFpLaze0P8qVaIlJYVMMD
 PE7mMbvnUpIkmno0bICmCNd0oN7vSM3Nf8NGrK/f+YBwQFGOtQFmbh7WvcnBhhaFoGFb
 Qss9bhkVOEGPxoDyYRGa6YZwRHV0Wl3kK2zIQQLDsGf3vOHb+PG3Mg5+J9WHAUpN/Stl
 TYr7byv8JrA0HyXmMzkdfhrYEwOLp8PEmwR+QjQilEHalx9TT2dF+EnMpOe7Kn4b/d7T
 iFB2ZuVRAdgiMz4Sdo2BoqHswTRacLO869hFQ1TBbL0jfndiU4z5OisaGoONtFydicsQ
 GaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782436654; x=1783041454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=naFbRo+L+gKf9Smlbf6aGayGRsGasYoZNdRCa0x4oPg=;
 b=oe2bz8YkmIdn/sGf4Mxc0llKIjhySfk+qFKE+le7lrdfizRQbmreb+YCyKHlbA0/h7
 EqepOxNq0gjfuoXDgNjzex+fHe70WHrHEW6O3OSenNnPkM4gagqO9XjzKVHW7JPVqeao
 2j7wZn4U4TIi9AGRo9vqpFlLUjnS4ssppI5QjC5B/AWZZ48Axvg6+JQrgZOAmfEtmy3g
 ARI4x7uesa1frAiVFACdTi6pPGHEysTmkQuRPuwHZZK2/ZF2YWJxcv5pAvJEkKk481O0
 DalHmuHRgWEFJOXjmeoqCtueSb3WbnPnXT13ewuEhJHBrjNiNxNMJNdKJgZtIehlrQqa
 0WvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpAZFOLc5q12eSCh1pNCeS07LYwQ3FucXQoF/0ToqCcOrZX8m3+GR0TWsXMbPZpPbXf61FzQPlRZZe9@nongnu.org
X-Gm-Message-State: AOJu0Yw63G3fQcYpE57R9oZk2aTRNI9D06Cn6pZTteGqR/EBE8dFIt+t
 OzrW/K+GLa0WJUmYMzb0CCqK2yRs3bitBfFdBvCo82vBc+DLip1V0+UulK9X6wQ+Epf50A2jMw7
 dM7rRjcl1IrzkVlAB/bZbduGa6xTjBoY=
X-Gm-Gg: AfdE7cnmzUSKYwXt7iCT71tunhRXsn++aP7B88SWOgSrKvIBkJPPrtoPtWx83XlVS+2
 EzuZ4pCXOmwK9R/LR+1x0/P4u8eGyScDIQqIaFSnGq76mYYlAK87YKeyzKULXvxwEUucY6W2U+I
 UOuk+DAjwOSo6W2WGR2ZXFy9iPvOfkE2dLmcDEdE8Fx00KGJUxa0YtjPZlQblh65sW7+KJv/ptL
 preLL8M8xmuGQHKvYEbmhWFWxcUXHpqAbQbwiC2xOrF5jhHYWnStPhisrZ97rbE+74M4Y5XL55d
 KVtPyI4eAYstH0Oikx3n3vAuq8U=
X-Received: by 2002:a05:6402:3588:b0:698:ecf:d18a with SMTP id
 4fb4d7f45d1cf-69810a53296mr849906a12.9.1782436653888; Thu, 25 Jun 2026
 18:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-17-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-17-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:17:07 +1000
X-Gm-Features: AVVi8Cf43PryZTnoRAWYN0iFSXWiDgxx34cbfv2Z5Yi2PXbT64MsktHpvJCe4bY
Message-ID: <CAKmqyKN6Su7VquExVU10s5DrJhgE_2ma1G6dpAbk2UyUgu8fPw@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] target/riscv: gate riscv_cpu_update_mip with
 tcg_enabled()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 24, 2026 at 10:10=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_cpu_update_mip() is a TCG only call.  Its KVM equivalent is
> kvm_riscv_set_irq().  cpu.c gates the KVM only function with a
> kvm_enabled() check, making it unavailable for TCG only builds.  We need
> to do the same for riscv_cpu_update_mip() otherwise a KVM only build
> will fail because it doesn't know what this function is.
>
> Use tcg_enabled() for the couple of riscv_cpu_update_mip() calls we have
> unguarded in cpu.c.
>
> We have way more calls to deal with in time_helper.c which isn't using
> kvm_riscv_set_irq() at all, so create a riscv_accel_set_irq() local
> helper that will choose whether to use the KVM or TCG API.
>
> The reason we're going through all this hassle in time_helper.c is
> because hw/int/riscv_aclint.c uses it, and if we don't do something
> about we won't have riscv_aclint working for KVM.  Whether this is a
> real problem or not and we should remove aclint support for KVM is
> question for another day.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 19 ++++++++++++++-----
>  target/riscv/time_helper.c | 33 +++++++++++++++++++++++++--------
>  2 files changed, 39 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7bd5bc0fc1..8f9d2967ef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1336,14 +1336,18 @@ static void riscv_cpu_set_irq(void *opaque, int i=
rq, int level)
>          case IRQ_M_EXT:
>              if (kvm_enabled()) {
>                  kvm_riscv_set_irq(cpu, irq, level);
> -            } else {
> +            }
> +
> +            if (tcg_enabled()) {
>                  riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level))=
;
>              }
>               break;
>          case IRQ_S_EXT:
>              if (kvm_enabled()) {
>                  kvm_riscv_set_irq(cpu, irq, level);
> -            } else {
> +            }
> +
> +            if (tcg_enabled()) {
>                  env->external_seip =3D level;
>                  riscv_cpu_update_mip(env, 1 << irq,
>                                       BOOL_TO_MASK(level | env->software_=
seip));
> @@ -1370,9 +1374,14 @@ static void riscv_cpu_set_irq(void *opaque, int ir=
q, int level)
>              env->hgeip |=3D 1ULL << irq;
>          }
>
> -        /* Update mip.SGEIP bit */
> -        riscv_cpu_update_mip(env, MIP_SGEIP,
> -                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
> +        if (kvm_enabled()) {
> +            kvm_riscv_set_irq(cpu, irq, level);
> +        }
> +        if (tcg_enabled()) {
> +            /* Update mip.SGEIP bit */
> +            riscv_cpu_update_mip(env, MIP_SGEIP,
> +                                 BOOL_TO_MASK(!!(env->hgeie & env->hgeip=
)));
> +        }
>      } else {
>          g_assert_not_reached();
>      }
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index 400e917354..ede1a4c2a3 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -21,19 +21,34 @@
>  #include "cpu_bits.h"
>  #include "time_helper.h"
>  #include "hw/intc/riscv_aclint.h"
> +#include "kvm/kvm_riscv.h"
> +#include "system/kvm.h"
> +#include "system/tcg.h"
> +
> +static void riscv_accel_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    if (kvm_enabled()) {
> +        kvm_riscv_set_irq(cpu, irq, level);
> +    }
> +
> +    if (tcg_enabled()) {
> +        riscv_cpu_update_mip(&cpu->env, irq, level);
> +    }
> +}
> +
>
>  static void riscv_vstimer_cb(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
>      CPURISCVState *env =3D &cpu->env;
>      env->vstime_irq =3D 1;
> -    riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
> +    riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(1));
>  }
>
>  static void riscv_stimer_cb(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
> -    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
> +    riscv_accel_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
>  }
>
>  /*
> @@ -48,6 +63,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMU=
Timer *timer,
>      RISCVAclintMTimerState *mtimer =3D env->rdtime_fn_arg;
>      uint32_t timebase_freq;
>      uint64_t rtc_r;
> +    RISCVCPU *cpu;
>
>      if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn ||
>          !env->rdtime_fn_arg || !get_field(env->menvcfg, MENVCFG_STCE)) {
> @@ -63,6 +79,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMU=
Timer *timer,
>
>      timebase_freq =3D mtimer->timebase_freq;
>      rtc_r =3D env->rdtime_fn(env->rdtime_fn_arg) + delta;
> +    cpu =3D env_archcpu(env);
>
>      if (timecmp <=3D rtc_r) {
>          /*
> @@ -71,9 +88,9 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMU=
Timer *timer,
>           */
>          if (timer_irq =3D=3D MIP_VSTIP) {
>              env->vstime_irq =3D 1;
> -            riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
> +            riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(1));
>          } else {
> -            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
> +            riscv_accel_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
>          }
>          return;
>      }
> @@ -81,9 +98,9 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMU=
Timer *timer,
>      /* Clear the [VS|S]TIP bit in mip */
>      if (timer_irq =3D=3D MIP_VSTIP) {
>          env->vstime_irq =3D 0;
> -        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
> +        riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(0));
>      } else {
> -        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
> +        riscv_accel_set_irq(cpu, timer_irq, BOOL_TO_MASK(0));
>      }
>
>      /*
> @@ -151,7 +168,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState=
 *env, QEMUTimer *timer,
>  {
>      /* Disable S-mode Timer IRQ and HW-based STIP */
>      if ((timer_irq =3D=3D MIP_STIP) && !get_field(env->menvcfg, MENVCFG_=
STCE)) {
> -        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
> +        riscv_accel_set_irq(env_archcpu(env), timer_irq, BOOL_TO_MASK(0)=
);
>          timer_del(timer);
>          return;
>      }
> @@ -161,7 +178,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState=
 *env, QEMUTimer *timer,
>          (!get_field(env->menvcfg, MENVCFG_STCE) ||
>           !get_field(env->henvcfg, HENVCFG_STCE))) {
>          env->vstime_irq =3D 0;
> -        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
> +        riscv_accel_set_irq(env_archcpu(env), 0, BOOL_TO_MASK(0));
>          timer_del(timer);
>          return;
>      }
> --
> 2.43.0
>
>

