Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A071BE95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 00:56:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpeZ1-0000hR-56; Sun, 08 Oct 2023 20:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeYy-0000gd-Nv; Sun, 08 Oct 2023 20:56:00 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeYw-0006JA-1q; Sun, 08 Oct 2023 20:55:59 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7abda795363so1734744241.0; 
 Sun, 08 Oct 2023 17:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696812956; x=1697417756; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0R3jNlZnAKnleKbJTcesFFVXD7Z3IrK1qAZWgrBZhY=;
 b=F7G8awPiflyHp6b8ZPR0NoYbDjkb9+a1wKeqzxaNu4Nf+M9KOzEqAuwm1XLzvGL/Hm
 KFahiu26bJUoK6jyKM8NUeDfG3eV9D3IbPAOv+zIjibtaVn3oWO9kn1JWSvLLQk5l5jM
 VkoLBKQL74oTX8bVMqyRn8pW4F6hGmZhzUkohs/LKNFzdpq/O+8qKKex3Tw2WO47EGc8
 rZ32ckpLazd1d5LoZclxNpd5h3Dui67fzQuyNNzR1IOQPXQ++04BD06p8c8+PfPS9ci8
 Wvbi9zReVinEPgaVoj/HaDghZuEYtj0RVRtWy08j7s68qSEeFhWrv3oUxNdE67YymfDN
 Xc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696812956; x=1697417756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0R3jNlZnAKnleKbJTcesFFVXD7Z3IrK1qAZWgrBZhY=;
 b=hIkCOWjE2OW0rjk5z+NbxneUkSABYlUMGIc9UcBr2kPT4a22sFQvzE2mEzQqPeRv1g
 zincRH0NdTkgQcH6jyJqUCB3g0tTKButWTwruiNvmeNlpi/kapevapiW4NZ4u6rxOUGy
 pJGlbNY25PTKLj/+BXKx/RdJA2iFoGOv54VXX8JOpf2K1yjVrNmg4zghpTNQPZJYRErI
 Ui3nNnC8UQRZG0zpzTQ2T6OL9WiVz1RxvZyjsguLBaxRsK7MCrAm++QhpH5meMvIIJom
 2DMogEohNprntjodk0K+dPR6AlcSrA+I8zeP8y/SZmkg8EGkUOLjFJv6Kv78OuaSU8ix
 XgLw==
X-Gm-Message-State: AOJu0Yyngxy90mOFo/p/SDYY88DLck2DVkV//CySuXjQRafj0s3ojIhI
 3+kGnwkFivxB3OOj7JLqx58R51pkhEdUBsVprIQ=
X-Google-Smtp-Source: AGHT+IHA0Hpxi43WS6QGh0DAPIH5luCAQZFmlDNYlqu2CCZ62+omrr0OlRuFQ5m1K+P3SVNCMOGFKVJvkQBP8rCvTGg=
X-Received: by 2002:a1f:e3c4:0:b0:49d:10ce:9a8b with SMTP id
 a187-20020a1fe3c4000000b0049d10ce9a8bmr9077051vkh.15.1696812955795; Sun, 08
 Oct 2023 17:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-2-rbradford@rivosinc.com>
In-Reply-To: <20231003125107.34859-2-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 10:55:29 +1000
Message-ID: <CAKmqyKOjPM9FB+pBsjtfh3x8cb-0H60pwGhmNrasL+px3OMJQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Propagate error from PMU setup
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Tue, Oct 3, 2023 at 10:53=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> More closely follow the QEMU style by returning an Error and propagating
> it there is an error relating to the PMU setup.
>
> Further simplify the function by removing the num_counters parameter as
> this is available from the passed in cpu pointer.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |  8 +++++++-
>  target/riscv/pmu.c | 19 +++++++++----------
>  target/riscv/pmu.h |  3 ++-
>  3 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4140899c52..9d79c20c1a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1488,7 +1488,13 @@ static void riscv_cpu_realize_tcg(DeviceState *dev=
, Error **errp)
>      }
>
>      if (cpu->cfg.pmu_num) {
> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
pmf) {
> +        riscv_pmu_init(cpu, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_sscofpmf) {
>              cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                            riscv_pmu_timer_cb, cpu);
>          }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 36f6307d28..13801ccb78 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -434,22 +434,21 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint6=
4_t value, uint32_t ctr_idx)
>  }
>
>
> -int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
> +void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>  {
> -    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
> -        return -1;
> +    uint8_t pmu_num =3D cpu->cfg.pmu_num;
> +
> +    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +        error_setg(errp, "Number of counters exceeds maximum available")=
;
> +        return;
>      }
>
>      cpu->pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash, g_direct_=
equal);
>      if (!cpu->pmu_event_ctr_map) {
> -        /* PMU support can not be enabled */
> -        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> -        cpu->cfg.pmu_num =3D 0;
> -        return -1;
> +        error_setg(errp, "Unable to allocate PMU event hash table");
> +        return;
>      }
>
>      /* Create a bitmask of available programmable counters */
> -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, num_counters);
> -
> -    return 0;
> +    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
>  }
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 2bfb71ba87..88e0713296 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -17,13 +17,14 @@
>   */
>
>  #include "cpu.h"
> +#include "qapi/error.h"
>
>  bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>                                          uint32_t target_ctr);
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                    uint32_t target_ctr);
>  void riscv_pmu_timer_cb(void *priv);
> -int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> +void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
>  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                 uint32_t ctr_idx);
>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
);
> --
> 2.41.0
>
>

