Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD06CA0FE3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 03:29:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbuqK-0006Hb-Ms; Thu, 31 Aug 2023 23:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbuqJ-0006H8-0R; Thu, 31 Aug 2023 23:29:07 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbuqF-0005jy-43; Thu, 31 Aug 2023 23:29:06 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-48cfdfa7893so594174e0c.0; 
 Thu, 31 Aug 2023 20:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693538941; x=1694143741; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/MSgBWD+EPbsIVobdk/d2izc3D8b+byo0/i5G/Cnqg=;
 b=rhW/i5kFdZUE47eMWXquX10hOcAe50DcqwcxNKUyJNBV/bey+E4kpgospyXl0blBAT
 7yhl8fsgtlpWSWka/l91lShUwHut7ssUuQYV+u7BvRzWoZ7hpoQ69HcgECj46KaUVaId
 WcqUHTWpXcpcRnTjDMAIbPg+x/zIYPc8mTNAlynuXfV4qdjdyPEl64y3vO9UdIJJDsOa
 VnBjMAcDSIKfdqwzYV7ieqIJKhdUcCigP0KycGyTyi3W1UphqWswvc4SPI1ivxAnG4no
 RrKiDnYC/WxhAX2nuDe29G2CV13kvCAyrBeqZudMmR7Ui53scalWEOmq6uCItfPiDX3y
 opeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693538941; x=1694143741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/MSgBWD+EPbsIVobdk/d2izc3D8b+byo0/i5G/Cnqg=;
 b=AxuaZktvnn1PQoVK8TeaMPVxXTRzg2P0bKpMOCwAkJQLuC9VxKYLq+zGKg2QJ5E6l9
 Dr0ZSPbAXB3+Ch98E85+GdcTxsoAvssAQ5VRii2khbmrUvOmFjIb/gpOWKaNMtDW+9JK
 X1ET1qZvtwdJ2aEQquXrQJ00hXgU2Psztoa5Q+E6JJvr9pqWYXaxpJ23X4jRVwogAaSF
 a6wDEcoArq0ksYOpRaTmGEG8c+dDzYXcR6lWIEDDb6wxmLyP0CrCwHE8SF1TumTash7e
 REmOFwHNV5/oliM8ZrTGicJR0nZVZ9aOwauYu5bNxukWnKti0OnlVd7c9Uw36WyXh1U7
 TSAw==
X-Gm-Message-State: AOJu0YyvrAGCk8OLxFCwhjpSxt6bHnXPsbSvLP8PVAkzUNrE5LrDupiO
 rZhbnA7Aa10IpeLDe0TfiQuWFVSW+c7Z53l7q/o=
X-Google-Smtp-Source: AGHT+IG8oFzXTvmzT19XvUUG0lv0n+g/7DdhX14XRKA4EHD2A/+rD8TNWzu7HQEnhMsL1T2cd/3h4agadRaxkLEcrOM=
X-Received: by 2002:a1f:c787:0:b0:48d:2779:a4b with SMTP id
 x129-20020a1fc787000000b0048d27790a4bmr1488970vkf.2.1693538941667; Thu, 31
 Aug 2023 20:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230818034059.9146-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230818034059.9146-1-akihiko.odaki@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 13:28:34 +1000
Message-ID: <CAKmqyKOsdAkCRKTwPejVV7witk6tWUGh9G=y_Hq6jTnxZxweZA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Allocate itrigger timers only once
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Fri, Aug 18, 2023 at 1:42=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> riscv_trigger_init() had been called on reset events that can happen
> several times for a CPU and it allocated timers for itrigger. If old
> timers were present, they were simply overwritten by the new timers,
> resulting in a memory leak.
>
> Divide riscv_trigger_init() into two functions, namely
> riscv_trigger_realize() and riscv_trigger_reset() and call them in
> appropriate timing. The timer allocation will happen only once for a
> CPU in riscv_trigger_realize().
>
> Fixes: 5a4ae64cac ("target/riscv: Add itrigger support when icount is ena=
bled")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/debug.h |  3 ++-
>  target/riscv/cpu.c   |  8 +++++++-
>  target/riscv/debug.c | 15 ++++++++++++---
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c471748d5a..5794aa6ee5 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -143,7 +143,8 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
>  bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>
> -void riscv_trigger_init(CPURISCVState *env);
> +void riscv_trigger_realize(CPURISCVState *env);
> +void riscv_trigger_reset_hold(CPURISCVState *env);
>
>  bool riscv_itrigger_enabled(CPURISCVState *env);
>  void riscv_itrigger_update_priv(CPURISCVState *env);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e12b6ef7f6..7e0512dd5f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -904,7 +904,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->cfg.debug) {
> -        riscv_trigger_init(env);
> +        riscv_trigger_reset_hold(env);
>      }
>
>      if (kvm_enabled()) {
> @@ -1475,6 +1475,12 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.debug) {
> +        riscv_trigger_realize(&cpu->env);
> +    }
> +#endif
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 75ee1c4971..ddd46b2d3e 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -903,7 +903,17 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, =
CPUWatchpoint *wp)
>      return false;
>  }
>
> -void riscv_trigger_init(CPURISCVState *env)
> +void riscv_trigger_realize(CPURISCVState *env)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +        env->itrigger_timer[i] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                              riscv_itrigger_timer_cb, e=
nv);
> +    }
> +}
> +
> +void riscv_trigger_reset_hold(CPURISCVState *env)
>  {
>      target_ulong tdata1 =3D build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, =
0);
>      int i;
> @@ -928,7 +938,6 @@ void riscv_trigger_init(CPURISCVState *env)
>          env->tdata3[i] =3D 0;
>          env->cpu_breakpoint[i] =3D NULL;
>          env->cpu_watchpoint[i] =3D NULL;
> -        env->itrigger_timer[i] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                              riscv_itrigger_timer_cb, e=
nv);
> +        timer_del(env->itrigger_timer[i]);
>      }
>  }
> --
> 2.41.0
>
>

