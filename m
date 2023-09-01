Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E79DCA0FE3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 03:10:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbuXh-0001Bq-Dt; Thu, 31 Aug 2023 23:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbuXf-0001Ba-UD; Thu, 31 Aug 2023 23:09:51 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qbuXd-0001xD-Kn; Thu, 31 Aug 2023 23:09:51 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7a52a1e2a59so637941241.0; 
 Thu, 31 Aug 2023 20:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693537788; x=1694142588; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVNQ/yceRMs8ZkENG+QMFYa+iVWV2HAOsSXf380enn4=;
 b=bufxwnBM3lPnXo2LyMOxYUzZqQhGiASKSQNyRVDU/u64yWf18r5Q2+5Dg5TFgxbq91
 c/PK0B2xaZcMl1fqpz1r/dSmwcYaY4YZ4Grj9C7RX5xZi+DMEHTuKF3NJunQh046gYwt
 zE76cMEqhD7AQaMazEbvGsQF49zy6iHGnJVZJJDcmBTPAp29UFwaLONi8PfaaD+8ONVt
 10Q4xdkSizwx2y7NqZf9Xv4SugrPsZXmxU3x7LLZOUp2geIaBoN2+4eH1XNknuruKUSW
 8upOTT6bXfNB2iUpBkTFF9GU7Y2nJi4ZVPyKYaxhJtmEoO/oXxivh9OlVSzJ8HrvQ95R
 uk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693537788; x=1694142588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVNQ/yceRMs8ZkENG+QMFYa+iVWV2HAOsSXf380enn4=;
 b=bx3M1HZ9kNFcZMGIEzcVx+7gx0SN3GZYlvmTRWlfrU5XjDe27HwunMmIvl9sg+W/dI
 WGk9NuNVMiu0Rd2KNlMExRm6uX4zsypTf+IpgC0rm8kBaLoPcTFqL6G+JDaKtnRmWITZ
 LIVhMAqAv1QkPRLpNRiHmFkbzBIJSc+K+75dY/f/K6PQ5SXV5FmZkrzSjTdSog3Q1/+r
 j7bPhfTs1dvsx8iHZx7Q/r+Z0OFOydJVQJTPexiw4yTjaigwshp3gFPSauiTDEJWJ+vR
 ka0tJ/hNGXLI6Ptjnp0mzjPd3bl65YkUsW7fGBPr4FnFxLcRTxg73Dqk1t4FaB21ofeX
 ooiQ==
X-Gm-Message-State: AOJu0Ywa0wQa85e58kNh7YPsjrtEqE3B/UD+O6QxHQvbzVsNISvdNgb1
 m9k4psi0Dr56tfZOS3N95XaVQ9xz9GGbgsyjn6I=
X-Google-Smtp-Source: AGHT+IGAnwA+iHDcfeuaarL54Hj6vC2GAFWrhC4BRHBm14Fa2ckOXuJddzlSHf+UpLVY5V4cciMl9uXrEn3paCdhi80=
X-Received: by 2002:a67:eb55:0:b0:44d:95d4:9fa1 with SMTP id
 x21-20020a67eb55000000b0044d95d49fa1mr1500144vso.17.1693537788211; Thu, 31
 Aug 2023 20:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230816162717.44125-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230816162717.44125-1-akihiko.odaki@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Sep 2023 13:09:21 +1000
Message-ID: <CAKmqyKMgfofyXVdZncxHG0KVGztw01TaE2aMDBX+DJtzLztG9A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Allocate itrigger timers only once
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Thu, Aug 17, 2023 at 2:28=E2=80=AFAM Akihiko Odaki <akihiko.odaki@daynix=
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/debug.h |  3 ++-
>  target/riscv/cpu.c   |  8 +++++++-
>  target/riscv/debug.c | 15 ++++++++++++---
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c471748d5a..7edc31e7cc 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -143,7 +143,8 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
>  bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>
> -void riscv_trigger_init(CPURISCVState *env);
> +void riscv_trigger_realize(CPURISCVState *env);
> +void riscv_trigger_reset(CPURISCVState *env);
>
>  bool riscv_itrigger_enabled(CPURISCVState *env);
>  void riscv_itrigger_update_priv(CPURISCVState *env);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e12b6ef7f6..3bc3f96a58 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -904,7 +904,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->cfg.debug) {
> -        riscv_trigger_init(env);
> +        riscv_trigger_reset(env);
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
> index 75ee1c4971..1c44403205 100644
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
> +void riscv_trigger_reset(CPURISCVState *env)
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

