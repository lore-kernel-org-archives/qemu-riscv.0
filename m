Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96FCCDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:30:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFEu-0002hX-2u; Mon, 16 Oct 2023 00:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFEs-0002hH-Cg; Mon, 16 Oct 2023 00:29:58 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFEg-0003Zt-6u; Mon, 16 Oct 2023 00:29:58 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7b5fd0b7522so1079149241.0; 
 Sun, 15 Oct 2023 21:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430584; x=1698035384; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qEy4DovLCrf8eRs6Lk95PQUjm9UqkEqTY+nctFaY1tE=;
 b=QUcSfgyMHrfAeO2RvZfQMnhoNqVnbi8QHaZL2FZXMUqvmpiSmkVKx4hzSF4HgP0img
 1siGPa4dB2WfD9DxjHEKwy7kQkfacrN/Br+UjhdXRoYzYJZPuGuN2bK3Z2ae1J8lTcsv
 FtcW8CDSIe+DmuxZuZbwTo6LhAy9Mpg/c4LlNPZK7jaPNedrTvaxHxOOIa4MhnscTowA
 vgCVYu9Pr+oehled+MNlES9LPlPadSwdfmUBULje/95bwIJo7UWm6JaZq48VLbwtY2mQ
 XGN+LQPMT/FRqMBQXaLCyC4mcvILLeVBAoAa8jkpsnemDQBiLO1uHcgvj8ePmh3LMXD5
 pZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430584; x=1698035384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEy4DovLCrf8eRs6Lk95PQUjm9UqkEqTY+nctFaY1tE=;
 b=c3XpVr+NwCSkEoXTu7MEOMx9AmpqjYaa6nEfwdrNT4Dn64qcOYR4+tvnwLk2nFFCoJ
 bgcn/cgCN0UaCuJXshiUwK44DQ2hw7YdHweePsGwjwu0zPURYVmcN4+8k4gtvCLZFvFG
 CF7XsHfeqemwJ6MwdFml0c5K7WW4/dC6A0ofVMZ/SPFUYG6+GK3IAdLmEAlClEa0uaP+
 Nev0TbbeOX1MQLfxO1/xTLcY2D/ts7Ame+HpJY6S+B2vFmng/tjP+4f1Hw+5SPwdqNOO
 3nDeSrjmrcxJhTeSU5s63DHXgdJjtFZ62n886gGu/MPezS0idmrnPwaceXcRPzKZKbyk
 eUFw==
X-Gm-Message-State: AOJu0Yzr/ITvVbdE6NHSpTUHrjupwKPL4fpS+IxDl72jV/1Y/1vFkJbJ
 3P0mHpLZNnKlUerByT1VQuBk+zJvWrp1RsI6fHA=
X-Google-Smtp-Source: AGHT+IGHYF0tVthfaBbx57MB+/DVObq33v5Tj2wryHO4j3qR3FOl7tfBPNHcnGWpZ0XMiiUi+i7zz74dBEDBv/DxhCo=
X-Received: by 2002:a05:6102:2049:b0:457:eee6:c105 with SMTP id
 q9-20020a056102204900b00457eee6c105mr569156vsr.8.1697430584531; Sun, 15 Oct
 2023 21:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231013110111.34619-1-rbradford@rivosinc.com>
 <20231013110111.34619-5-rbradford@rivosinc.com>
In-Reply-To: <20231013110111.34619-5-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:29:17 +1000
Message-ID: <CAKmqyKP+pB7Ed4nMG3EJfxN3_x0+5uu7-7fuAwT+aNbALWtktA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Fri, Oct 13, 2023 at 11:32=E2=80=AFPM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
>
> Using a mask instead of the number of PMU devices supports the accurate
> emulation of platforms that have a discontinuous set of PMU counters.
>
> Generate a warning if the old property changed from the default but
> still go ahead and use it to generate the mask if the user has changed
> it from the default
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>  target/riscv/cpu.c     |  5 +++--
>  target/riscv/cpu_cfg.h |  3 ++-
>  target/riscv/machine.c |  2 +-
>  target/riscv/pmu.c     | 20 ++++++++++++++++----
>  4 files changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c9d8fc12fe..420673b491 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev,=
 Error **errp)
>          riscv_timer_init(cpu);
>      }
>
> -    if (cpu->cfg.pmu_num) {
> +    if (cpu->cfg.pmu_mask) {
>          riscv_pmu_init(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
> @@ -1812,7 +1812,8 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /* Deprecat=
ed */

This will need to be rebased.

You could probably use riscv_cpu_deprecated_exts, but then you also
need to modify cpu_set_multi_ext_cfg()

> +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MA=
SK(3, 16)),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
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
> index 7ddf4977b1..9253e5f17a 100644
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
> +    /* Check if user set it by comparing against default */
> +    if (pmu_num !=3D 16) {

This won't work if the user sets 16 though

Alistair

> +        warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\=
"");
> +        cpu->cfg.pmu_mask =3D MAKE_32BIT_MASK(3, pmu_num);
> +    }
> +
> +    cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
>  }
> --
> 2.41.0
>
>

