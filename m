Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4EDE7D0C9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:35:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjYoL-0006MA-Mu; Fri, 22 Sep 2023 01:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjYoI-0006Kq-HR; Fri, 22 Sep 2023 01:34:38 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjYoD-0004rB-Vy; Fri, 22 Sep 2023 01:34:37 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-496a2ff7780so749660e0c.2; 
 Thu, 21 Sep 2023 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695360871; x=1695965671; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCVgv+eeeWB1OzO4jmZzyd/dw7dEt9GfRDf04UZho3U=;
 b=CRi3X4tsQDy40ylTB01T8zrXSsPJ79PIOLVUQWTx6QVUGngAYW6O+tFsL6eWqOBBqN
 H54FgoGx5VEvfDXXrMrKw0QzSmzI47mE5+m04Ks9idiFgIkEn5xlm5kRPmNYlUEP61H3
 mbwmtpnhd/qCGvlaJeoBkOHOebjaVmULt48/FmxBT9Y+xF/meLZm3rfPYpuaoLH2Vv1N
 8UGnaNKzIog5pxCez+2APGijS/9AVnMs/7p+U71mst9GBKPo5S0a5PYEc0qara2vaxVB
 GtdlBGki5J7yUS1oXD6KjMSzwVWYyLEQmFY/Vz1VDkfhdFelxY3xqVcYQnn4tExGJxJ5
 sB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695360871; x=1695965671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCVgv+eeeWB1OzO4jmZzyd/dw7dEt9GfRDf04UZho3U=;
 b=GwT0pPnBtzkbKt5c28T6CVaeeK5Vb4N/FEk2gjc8C/T3YlMEt1HFtq1k3/CCjMID59
 8prjXv/x0prfUnGc25ibKB/X08oTHwOh3z8+FXALaxyFPp0iqCImWRL+sdOhgjmYwlYD
 uZjI5cgt3I+UjDCGQzSV3GNw9Cqt39+487my6eO0r0ykqjx2zvnlw/bpoUcIGtA/4WYq
 fB+ZIZoA4A1FuF5A4BGA2DrJTH2mtergMv6uMosYFCW2nTiZ/Q0FiDdEdnGiXFG4QZz2
 UpKmoz3kPUBPZHbf1mlkdi5MZN/lz9V6iwTrKQV1R9hfrOFKsScDpomPPAX3NTmD6mrt
 1gGw==
X-Gm-Message-State: AOJu0YwcLJzhv9NQBBu+c3dwNWfx8Xexs+dc2ql2CET5vbpb7g3lnuLV
 n1uJIKKQ8pAIOgf2+12YA6TK0AzVyjIi/zmsmZR1AxKOEio=
X-Google-Smtp-Source: AGHT+IG8CkGWxM/EOWxg5JNI1xdQdvxAqyN8RE2qQ/zTTTWU2k8aLoecQN/e8UO2kT8P1SvntHt2WZjWFmqvSrUKvFU=
X-Received: by 2002:a1f:d546:0:b0:495:ba08:79dd with SMTP id
 m67-20020a1fd546000000b00495ba0879ddmr8823649vkg.5.1695360871352; Thu, 21 Sep
 2023 22:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:34:04 +1000
Message-ID: <CAKmqyKN9jq=O6zWNT7vUx8LGopX_p6EVux3sMb2+7RCik8Fmrg@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] target/riscv: move riscv_tcg_ops to tcg-cpu.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Wed, Sep 20, 2023 at 9:21=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Move the remaining of riscv_tcg_ops now that we have a working realize()
> implementation.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 58 ------------------------------------
>  target/riscv/cpu.h         |  4 ---
>  target/riscv/tcg/tcg-cpu.c | 60 +++++++++++++++++++++++++++++++++++++-
>  3 files changed, 59 insertions(+), 63 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7215a29324..9426b3b9d6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -838,24 +838,6 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>      return env->pc;
>  }
>
> -static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> -                                          const TranslationBlock *tb)
> -{
> -    if (!(tb_cflags(tb) & CF_PCREL)) {
> -        RISCVCPU *cpu =3D RISCV_CPU(cs);
> -        CPURISCVState *env =3D &cpu->env;
> -        RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> -
> -        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> -
> -        if (xl =3D=3D MXL_RV32) {
> -            env->pc =3D (int32_t) tb->pc;
> -        } else {
> -            env->pc =3D tb->pc;
> -        }
> -    }
> -}
> -
>  static bool riscv_cpu_has_work(CPUState *cs)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -871,29 +853,6 @@ static bool riscv_cpu_has_work(CPUState *cs)
>  #endif
>  }
>
> -static void riscv_restore_state_to_opc(CPUState *cs,
> -                                       const TranslationBlock *tb,
> -                                       const uint64_t *data)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> -    target_ulong pc;
> -
> -    if (tb_cflags(tb) & CF_PCREL) {
> -        pc =3D (env->pc & TARGET_PAGE_MASK) | data[0];
> -    } else {
> -        pc =3D data[0];
> -    }
> -
> -    if (xl =3D=3D MXL_RV32) {
> -        env->pc =3D (int32_t)pc;
> -    } else {
> -        env->pc =3D pc;
> -    }
> -    env->bins =3D data[1];
> -}
> -
>  static void riscv_cpu_reset_hold(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -1809,23 +1768,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  };
>  #endif
>
> -const struct TCGCPUOps riscv_tcg_ops =3D {
> -    .initialize =3D riscv_translate_init,
> -    .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
> -    .restore_state_to_opc =3D riscv_restore_state_to_opc,
> -
> -#ifndef CONFIG_USER_ONLY
> -    .tlb_fill =3D riscv_cpu_tlb_fill,
> -    .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
> -    .do_interrupt =3D riscv_cpu_do_interrupt,
> -    .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
> -    .do_unaligned_access =3D riscv_cpu_do_unaligned_access,
> -    .debug_excp_handler =3D riscv_cpu_debug_excp_handler,
> -    .debug_check_breakpoint =3D riscv_cpu_debug_check_breakpoint,
> -    .debug_check_watchpoint =3D riscv_cpu_debug_check_watchpoint,
> -#endif /* !CONFIG_USER_ONLY */
> -};
> -
>  static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>  {
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 409d198635..b2e558f730 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -706,10 +706,6 @@ enum riscv_pmu_event_idx {
>      RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
>  };
>
> -/* Export tcg_ops until we move everything to tcg/tcg-cpu.c */
> -#include "hw/core/tcg-cpu-ops.h"
> -extern const struct TCGCPUOps riscv_tcg_ops;
> -
>  /* used by tcg/tcg-cpu.c*/
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)=
;
>  bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index d86172f725..e480b9f726 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -28,7 +28,66 @@
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "hw/core/accel-cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "tcg/tcg.h"
>
> +static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> +                                          const TranslationBlock *tb)
> +{
> +    if (!(tb_cflags(tb) & CF_PCREL)) {
> +        RISCVCPU *cpu =3D RISCV_CPU(cs);
> +        CPURISCVState *env =3D &cpu->env;
> +        RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +
> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> +
> +        if (xl =3D=3D MXL_RV32) {
> +            env->pc =3D (int32_t) tb->pc;
> +        } else {
> +            env->pc =3D tb->pc;
> +        }
> +    }
> +}
> +
> +static void riscv_restore_state_to_opc(CPUState *cs,
> +                                       const TranslationBlock *tb,
> +                                       const uint64_t *data)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +    target_ulong pc;
> +
> +    if (tb_cflags(tb) & CF_PCREL) {
> +        pc =3D (env->pc & TARGET_PAGE_MASK) | data[0];
> +    } else {
> +        pc =3D data[0];
> +    }
> +
> +    if (xl =3D=3D MXL_RV32) {
> +        env->pc =3D (int32_t)pc;
> +    } else {
> +        env->pc =3D pc;
> +    }
> +    env->bins =3D data[1];
> +}
> +
> +static const struct TCGCPUOps riscv_tcg_ops =3D {
> +    .initialize =3D riscv_translate_init,
> +    .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
> +    .restore_state_to_opc =3D riscv_restore_state_to_opc,
> +
> +#ifndef CONFIG_USER_ONLY
> +    .tlb_fill =3D riscv_cpu_tlb_fill,
> +    .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
> +    .do_interrupt =3D riscv_cpu_do_interrupt,
> +    .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
> +    .do_unaligned_access =3D riscv_cpu_do_unaligned_access,
> +    .debug_excp_handler =3D riscv_cpu_debug_excp_handler,
> +    .debug_check_breakpoint =3D riscv_cpu_debug_check_breakpoint,
> +    .debug_check_watchpoint =3D riscv_cpu_debug_check_watchpoint,
> +#endif /* !CONFIG_USER_ONLY */
> +};
>
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
> @@ -515,7 +574,6 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu=
, CPUClass *cc)
>  {
>      /*
>       * All cpus use the same set of operations.
> -     * riscv_tcg_ops is being imported from cpu.c for now.
>       */
>      cc->tcg_ops =3D &riscv_tcg_ops;
>  }
> --
> 2.41.0
>
>

