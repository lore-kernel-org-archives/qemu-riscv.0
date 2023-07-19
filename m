Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:02:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvZW-0007vW-5i; Tue, 18 Jul 2023 21:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvZT-0007rk-Hf; Tue, 18 Jul 2023 21:01:39 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvZR-0007Bg-KI; Tue, 18 Jul 2023 21:01:39 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7870821d9a1so203592241.1; 
 Tue, 18 Jul 2023 18:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689728496; x=1692320496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfPNeKWeiXzF/PbYDhp20adrE5TrdZsfEaSVYY9Irjo=;
 b=GwZ/eq7kGO/jkJmgYRqSW9plbErAvlYsHDpgrjC5byiLix3ncDrmn+1Fol8/P7y1i5
 DRDzSvYnZWPiboE5YqW4fGmAhT5/lKUIUK+xUL2lhbTFFN6gbfUbWVqEvRvB8DHsFFcs
 q6CJgp2AFMHAwEUSZwzjDNczCbc7TXdndP9QZI1ZcM4MwNPZPq99xTms0LrXkPNflWE8
 QtabuxcQC+QNH7m43yFSVJjIKOWYAOdJOi5DBO9lAg363xT60ZSTpLBzlZ/Zp8whMPCn
 iZ7BA0r7w6TQQEcn/Zi9Cc+j0dfRPypV4dnruDurNNp2XkD+cmYEQ/7Mf9DJQx81WKsU
 hwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728496; x=1692320496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfPNeKWeiXzF/PbYDhp20adrE5TrdZsfEaSVYY9Irjo=;
 b=fjaqkPe6vCZqRDlBxOxu1bYzQQVj+01OUFkmTPMnJrpGPvofzWUTcZC45qkiDkjPgO
 Hy+SDBEWkg4r/OMB14/0zjdHpjQ0H6B9Ei+jhS9D6rmhreCyXB3gVDUKDMe9E828s8Ad
 Jjq8l2oSktZTN56uRkqjJIRmJ2LNCSQEbCkKUgrPykWGwG7eoRmCrmBrhLw98V+0jDcI
 6A4EG82SEWIEEj2S19DjCgIrldLrk8ZG5Bbx38dso7gYvVyFMm2q6e8Pb0lBTV52ON4f
 MBTo+ucrkkmgqHPQlQuhzyT4suwOcR8/yf+e3g1o9r8g6umdFyveKKhdwIOhlSP9xXYP
 voxQ==
X-Gm-Message-State: ABy/qLZm3kWl5hwSbBCOyDcwOcbEP8NDuiEBWQNz+hRlQeYlgHVUWhTD
 TH+lqyjtT0JLQCkHZ2wFyUX1fe0LIW+8+D80T3k=
X-Google-Smtp-Source: APBJJlF+q8KhnZAW3VInMHBVuy8P27dpm8MTujZfRVIwQxFfg+6PwRxwjGxF4VO3jhBlhyAaygdpxfRKN7eqJo/ZyVY=
X-Received: by 2002:a67:ed58:0:b0:445:4a0c:3afb with SMTP id
 m24-20020a67ed58000000b004454a0c3afbmr175420vsp.8.1689728496141; Tue, 18 Jul
 2023 18:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-9-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-9-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:01:10 +1000
Message-ID: <CAKmqyKM2zy4kxYBTHtZzmN40FNpjscErzkbdz2B8OoxDHCTz9g@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] target/riscv: Move TCG-specific
 cpu_get_tb_cpu_state() to tcg/cpu.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Tue, Jul 11, 2023 at 10:18=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c    | 84 -------------------------------
>  target/riscv/tcg/cpu.c       | 98 ++++++++++++++++++++++++++++++++++++
>  target/riscv/tcg/meson.build |  1 +
>  3 files changed, 99 insertions(+), 84 deletions(-)
>  create mode 100644 target/riscv/tcg/cpu.c
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 597c47bc56..6f8778c6d3 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -64,90 +64,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
>  #endif
>  }
>
> -void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
> -                          uint64_t *cs_base, uint32_t *pflags)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    RISCVExtStatus fs, vs;
> -    uint32_t flags =3D 0;
> -
> -    *pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
> -    *cs_base =3D 0;
> -
> -    if (cpu->cfg.ext_zve32f) {
> -        /*
> -         * If env->vl equals to VLMAX, we can use generic vector operati=
on
> -         * expanders (GVEC) to accerlate the vector operations.
> -         * However, as LMUL could be a fractional number. The maximum
> -         * vector size can be operated might be less than 8 bytes,
> -         * which is not supported by GVEC. So we set vl_eq_vlmax flag to=
 true
> -         * only when maxsz >=3D 8 bytes.
> -         */
> -        uint32_t vlmax =3D vext_get_vlmax(cpu, env->vtype);
> -        uint32_t sew =3D FIELD_EX64(env->vtype, VTYPE, VSEW);
> -        uint32_t maxsz =3D vlmax << sew;
> -        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl) &&
> -                           (maxsz >=3D 8);
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
> -                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
> -                           FIELD_EX64(env->vtype, VTYPE, VTA));
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VMA,
> -                           FIELD_EX64(env->vtype, VTYPE, VMA));
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstar=
t =3D=3D 0);
> -    } else {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> -    }
> -
> -#ifdef CONFIG_USER_ONLY
> -    fs =3D EXT_STATUS_DIRTY;
> -    vs =3D EXT_STATUS_DIRTY;
> -#else
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> -
> -    flags |=3D cpu_mmu_index(env, 0);
> -    fs =3D get_field(env->mstatus, MSTATUS_FS);
> -    vs =3D get_field(env->mstatus, MSTATUS_VS);
> -
> -    if (env->virt_enabled) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> -        /*
> -         * Merge DISABLED and !DIRTY states using MIN.
> -         * We will set both fields when dirtying.
> -         */
> -        fs =3D MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> -        vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
> -    }
> -
> -    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
> -    if (!riscv_has_ext(env, RVF)) {
> -        fs =3D (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) =3D=3D RISCV_E=
XCP_NONE)
> -             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
> -    }
> -
> -    if (cpu->cfg.debug && !icount_enabled()) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
> -    }
> -#endif
> -
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, FS, fs);
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> -    flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> -    if (env->cur_pmmask !=3D 0) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> -    }
> -    if (env->cur_pmbase !=3D 0) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
> -    }
> -
> -    *pflags =3D flags;
> -}
> -
>  void riscv_cpu_update_mask(CPURISCVState *env)
>  {
>      target_ulong mask =3D 0, base =3D 0;
> diff --git a/target/riscv/tcg/cpu.c b/target/riscv/tcg/cpu.c
> new file mode 100644
> index 0000000000..2ae6919b80
> --- /dev/null
> +++ b/target/riscv/tcg/cpu.c
> @@ -0,0 +1,98 @@
> +/*
> + * RISC-V CPU helpers (TCG specific)
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2017-2018 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#ifndef CONFIG_USER_ONLY
> +#include "sysemu/cpu-timers.h"
> +#endif
> +
> +void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
> +                          uint64_t *cs_base, uint32_t *pflags)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    RISCVExtStatus fs, vs;
> +    uint32_t flags =3D 0;
> +
> +    *pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
> +    *cs_base =3D 0;
> +
> +    if (cpu->cfg.ext_zve32f) {
> +        /*
> +         * If env->vl equals to VLMAX, we can use generic vector operati=
on
> +         * expanders (GVEC) to accerlate the vector operations.
> +         * However, as LMUL could be a fractional number. The maximum
> +         * vector size can be operated might be less than 8 bytes,
> +         * which is not supported by GVEC. So we set vl_eq_vlmax flag to=
 true
> +         * only when maxsz >=3D 8 bytes.
> +         */
> +        uint32_t vlmax =3D vext_get_vlmax(cpu, env->vtype);
> +        uint32_t sew =3D FIELD_EX64(env->vtype, VTYPE, VSEW);
> +        uint32_t maxsz =3D vlmax << sew;
> +        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl) &&
> +                           (maxsz >=3D 8);
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
> +                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
> +                           FIELD_EX64(env->vtype, VTYPE, VTA));
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VMA,
> +                           FIELD_EX64(env->vtype, VTYPE, VMA));
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstar=
t =3D=3D 0);
> +    } else {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    fs =3D EXT_STATUS_DIRTY;
> +    vs =3D EXT_STATUS_DIRTY;
> +#else
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> +
> +    flags |=3D cpu_mmu_index(env, 0);
> +    fs =3D get_field(env->mstatus, MSTATUS_FS);
> +    vs =3D get_field(env->mstatus, MSTATUS_VS);
> +
> +    if (env->virt_enabled) {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> +        /*
> +         * Merge DISABLED and !DIRTY states using MIN.
> +         * We will set both fields when dirtying.
> +         */
> +        fs =3D MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> +        vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
> +    }
> +
> +    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
> +    if (!riscv_has_ext(env, RVF)) {
> +        fs =3D (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) =3D=3D RISCV_E=
XCP_NONE)
> +             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
> +    }
> +
> +    if (cpu->cfg.debug && !icount_enabled()) {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
> +    }
> +#endif
> +
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, FS, fs);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> +    if (env->cur_pmmask !=3D 0) {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> +    }
> +    if (env->cur_pmbase !=3D 0) {
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
> +    }
> +
> +    *pflags =3D flags;
> +}
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index 65670493b1..a615aafd9a 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -8,6 +8,7 @@ gen =3D [
>  riscv_ss.add(when: 'CONFIG_TCG', if_true: gen)
>
>  riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'cpu.c',
>    'fpu_helper.c',
>    'op_helper.c',
>    'vector_helper.c',
> --
> 2.38.1
>
>

