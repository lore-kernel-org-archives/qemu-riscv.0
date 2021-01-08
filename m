Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ky1E4-0002az-PE
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jan 2021 18:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1E2-0002an-RU; Fri, 08 Jan 2021 18:31:22 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1Dz-00075L-VK; Fri, 08 Jan 2021 18:31:22 -0500
Received: by mail-il1-x132.google.com with SMTP id y13so4022665ilm.12;
 Fri, 08 Jan 2021 15:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qcxuxui2gzdHKyX6/q5Q3k3nVtNBy6cB/u6yKIrkDxk=;
 b=V2b3B6FI3C7Ps6iRAxVOvGuxOf3aymMZF/FGe0RGTYdAYv4q9XRHmTGMC4aszyge+i
 rZAlBhAtSVtnkwd0IMRSqZvQZg+BQjUDa5mBbSG+PcOB+80mwWN7nBftQprNC6siG/fP
 kbrmwIJmTHeHOxB3OxB6as1VVAfcBukECgbTJ7v8T5JnLt+ctEpPGkbB7Z5RbNooN3SY
 iCvzEf9dtpDHe7s6G+RjGcEx9g5u5vubQ7iseg9Eobb7swP33R3ybsS52lXUyzIyqz6w
 JnV9DFMMoRjPZjoT5qk3eniCRzTVq2HWj2w37lMgJwT0lY6g1SWD5bCEXRXHlk8m9guE
 TeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qcxuxui2gzdHKyX6/q5Q3k3nVtNBy6cB/u6yKIrkDxk=;
 b=DRxsNvWn3QBDuEX3rIAMJb8Gu1qka4f6k8kYoHrdJ11c6qcDjGYv9BpogVDxxAffR2
 5taPc1EANm0pFs+7e3NDvqjSmv+WkHJ/nVapNcrBMgSPAhMWg7CXvk/MFQhJhNIC9Rot
 sMCUcBCaDnvYJyQ3BSpXnjgp6poXoz62CTovhaDRMAo7oQ2W2RO/ZRXeSqMdZR7JGpkw
 Q24TvPUoaP7onGeiYZqQpSzqnX+Zc+gequOmGCRTgRstaRFHoafNLh7mXaLkswrY0+AR
 MQYC2myUPngpQRj+y5jbiPLGSR6Xj4scft61muFcOlGg4OvVdolbaK+KbseMYMOmFPYd
 60Tw==
X-Gm-Message-State: AOAM531YvwbkdqX9e603xObUEvGqk4JwxQ1iWzvRp3aelVWkRxJYXw9C
 K6wjO0cal0nh3ua+4Cg9H22Bw46gX+eWl9SCVAs=
X-Google-Smtp-Source: ABdhPJzSzZOAo9mBI6QNY+kx3Oo+nFV8b9tNlCk6N6zKrLfiKlpye9eEdcgqzBFDjuM6fYuZlOiSppcI8xC8DlR2428=
X-Received: by 2002:a92:c942:: with SMTP id i2mr5952472ilq.227.1610148678034; 
 Fri, 08 Jan 2021 15:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-17-alex.bennee@linaro.org>
In-Reply-To: <20210108224256.2321-17-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Jan 2021 15:30:51 -0800
Message-ID: <CAKmqyKOLLXqjeGO6-k1d_Y_23Q5Tt1uKYUUwCjPDPPMJB3GXVQ@mail.gmail.com>
Subject: Re: [PATCH v1 16/20] riscv: Add semihosting support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Keith Packard <keithp@keithp.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2021 23:31:23 -0000

On Fri, Jan 8, 2021 at 3:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> From: Keith Packard <keithp@keithp.com>
>
> Adapt the arm semihosting support code for RISCV. This implementation
> is based on the standard for RISC-V semihosting version 0.2 as
> documented in
>
>    https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Message-Id: <20210107170717.2098982-6-keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Whoops, I thought I had already reviewed this commit.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/devices/riscv32-softmmu.mak   |  2 +
>  default-configs/devices/riscv64-softmmu.mak   |  2 +
>  .../targets/riscv32-linux-user.mak            |  1 +
>  .../targets/riscv64-linux-user.mak            |  1 +
>  hw/semihosting/common-semi.h                  |  5 +-
>  linux-user/qemu.h                             |  4 +-
>  target/riscv/cpu_bits.h                       |  1 +
>  hw/semihosting/common-semi.c                  | 82 ++++++++++++++++++-
>  linux-user/semihost.c                         |  8 +-
>  target/riscv/cpu_helper.c                     | 10 +++
>  target/riscv/translate.c                      | 11 +++
>  .../riscv/insn_trans/trans_privileged.c.inc   | 37 ++++++++-
>  qemu-options.hx                               | 10 ++-
>  13 files changed, 162 insertions(+), 12 deletions(-)
>
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index 94a236c9c2..d847bd5692 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> +CONFIG_SEMIHOSTING=3Dy
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index 76b6195648..d5eec75f05 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> +CONFIG_SEMIHOSTING=3Dy
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-con=
figs/targets/riscv32-linux-user.mak
> index dfb259e8aa..6a9d1b1bc1 100644
> --- a/default-configs/targets/riscv32-linux-user.mak
> +++ b/default-configs/targets/riscv32-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=3Driscv32
>  TARGET_BASE_ARCH=3Driscv
>  TARGET_ABI_DIR=3Driscv
>  TARGET_XML_FILES=3D gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.=
xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-3=
2bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-con=
figs/targets/riscv64-linux-user.mak
> index b13895f3b0..0a92849a1b 100644
> --- a/default-configs/targets/riscv64-linux-user.mak
> +++ b/default-configs/targets/riscv64-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=3Driscv64
>  TARGET_BASE_ARCH=3Driscv
>  TARGET_ABI_DIR=3Driscv
>  TARGET_XML_FILES=3D gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.=
xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-6=
4bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> index bc53e92c79..0bfab1c669 100644
> --- a/hw/semihosting/common-semi.h
> +++ b/hw/semihosting/common-semi.h
> @@ -1,6 +1,6 @@
>  /*
>   *  Semihosting support for systems modeled on the Arm "Angel"
> - *  semihosting syscalls design.
> + *  semihosting syscalls design. This includes Arm and RISC-V processors
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
> @@ -26,6 +26,9 @@
>   *     Semihosting for AArch32 and AArch64 Release 2.0
>   *     https://static.docs.arm.com/100863/0200/semihosting.pdf
>   *
> + *  RISC-V Semihosting is documented in:
> + *     RISC-V Semihosting
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-s=
emihosting-spec.adoc
>   */
>
>  #ifndef COMMON_SEMI_H
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 534753ca12..17aa992165 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -109,6 +109,8 @@ typedef struct TaskState {
>      /* FPA state */
>      FPA11 fpa;
>  # endif
> +#endif
> +#if defined(TARGET_ARM) || defined(TARGET_RISCV)
>      int swi_errno;
>  #endif
>  #if defined(TARGET_I386) && !defined(TARGET_X86_64)
> @@ -122,7 +124,7 @@ typedef struct TaskState {
>  #ifdef TARGET_M68K
>      abi_ulong tp_value;
>  #endif
> -#if defined(TARGET_ARM) || defined(TARGET_M68K)
> +#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
>      /* Extra fields for semihosted binaries.  */
>      abi_ulong heap_base;
>      abi_ulong heap_limit;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index b41e8836c3..4196ef8b69 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -542,6 +542,7 @@
>  #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10=
.0 */
>  #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10=
.0 */
>  #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10=
.0 */
> +#define RISCV_EXCP_SEMIHOST                      0x10
>  #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
>  #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
>  #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index 293791f721..5fcb8663c6 100644
> --- a/hw/semihosting/common-semi.c
> +++ b/hw/semihosting/common-semi.c
> @@ -1,6 +1,6 @@
>  /*
>   *  Semihosting support for systems modeled on the Arm "Angel"
> - *  semihosting syscalls design.
> + *  semihosting syscalls design. This includes Arm and RISC-V processors
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
> @@ -25,6 +25,10 @@
>   *  ARM Semihosting is documented in:
>   *     Semihosting for AArch32 and AArch64 Release 2.0
>   *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + *  RISC-V Semihosting is documented in:
> + *     RISC-V Semihosting
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-s=
emihosting-spec.adoc
>   */
>
>  #include "qemu/osdep.h"
> @@ -222,6 +226,42 @@ common_semi_rambase(CPUState *cs)
>
>  #endif /* TARGET_ARM */
>
> +#ifdef TARGET_RISCV
> +static inline target_ulong
> +common_semi_arg(CPUState *cs, int argno)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    return env->gpr[xA0 + argno];
> +}
> +
> +static inline void
> +common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    env->gpr[xA0] =3D ret;
> +}
> +
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =
=3D=3D 8);
> +}
> +
> +#ifndef CONFIG_USER_ONLY
> +
> +static inline target_ulong
> +common_semi_rambase(CPUState *cs)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    return common_semi_find_region_base(env->gpr[xSP]);
> +}
> +#endif
> +
> +#endif
> +
>  /*
>   * Allocate a new guest file descriptor and return it; if we
>   * couldn't allocate a new fd then return -1.
> @@ -398,6 +438,12 @@ static target_ulong common_semi_flen_buf(CPUState *c=
s)
>          sp =3D env->regs[13];
>      }
>  #endif
> +#ifdef TARGET_RISCV
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    sp =3D env->gpr[xSP];
> +#endif
>
>      return sp - 64;
>  }
> @@ -741,6 +787,37 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>       put_user_u32(val, args + (n) * 4))
>  #endif
>
> +#ifdef TARGET_RISCV
> +
> +/*
> + * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
> + * we need a macro that fetches a target_ulong
> + */
> +#define get_user_utl(arg, p)                    \
> +    ((sizeof(target_ulong) =3D=3D 8) ?              \
> +     get_user_u64(arg, p) :                     \
> +     get_user_u32(arg, p))
> +
> +/*
> + * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
> + * we need a macro that stores a target_ulong
> + */
> +#define put_user_utl(arg, p)                    \
> +    ((sizeof(target_ulong) =3D=3D 8) ?              \
> +     put_user_u64(arg, p) :                     \
> +     put_user_u32(arg, p))
> +
> +#define GET_ARG(n) do {                                                 =
\
> +        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) {=
 \
> +            errno =3D EFAULT;                                           =
  \
> +            return set_swi_errno(cs, -1);                              \
> +        }                                                               =
\
> +    } while (0)
> +
> +#define SET_ARG(n, val)                                 \
> +    put_user_utl(val, args + (n) * sizeof(target_ulong))
> +#endif
> +
>  /*
>   * Do a semihosting call.
>   *
> @@ -1179,6 +1256,9 @@ target_ulong do_common_semihosting(CPUState *cs)
>          if (is_a64(cs->env_ptr)) {
>              return 0;
>          }
> +#endif
> +#ifdef TARGET_RISCV
> +        return 0;
>  #endif
>          /* fall through -- invalid for A32/T32 */
>      default:
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index a1f0f6050e..c0015ee7f6 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -1,11 +1,11 @@
>  /*
> - * ARM Semihosting Console Support
> + * ARM Compatible Semihosting Console Support.
>   *
>   * Copyright (c) 2019 Linaro Ltd
>   *
> - * Currently ARM is unique in having support for semihosting support
> - * in linux-user. So for now we implement the common console API but
> - * just for arm linux-user.
> + * Currently ARM and RISC-V are unique in having support for
> + * semihosting support in linux-user. So for now we implement the
> + * common console API but just for arm and risc-v linux-user.
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a2afb95fa1..f8350f5f78 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
> +#include "hw/semihosting/common-semi.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -847,6 +848,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval =3D 0;
>      target_ulong mtval2 =3D 0;
>
> +    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
> +        if (env->priv >=3D PRV_S) {
> +            env->gpr[xA0] =3D do_common_semihosting(cs);
> +            env->pc +=3D 4;
> +            return;
> +        }
> +        cause =3D RISCV_EXCP_BREAKPOINT;
> +    }
> +
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 554d52a4be..0f28b5f41e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -64,6 +64,7 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    CPUState *cs;
>  } DisasContext;
>
>  #ifdef TARGET_RISCV64
> @@ -747,6 +748,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>      return true;
>  }
>
> +static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
> +{
> +    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> +    CPUState *cpu =3D ctx->cs;
> +    CPURISCVState *env =3D cpu->env_ptr;
> +
> +    return cpu_ldl_code(env, pc);
> +}
> +
>  /* Include insn module translation function */
>  #include "insn_trans/trans_rvi.c.inc"
>  #include "insn_trans/trans_rvm.c.inc"
> @@ -814,6 +824,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->cs =3D cs;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 2a61a853bf..32312be202 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *=
a)
>
>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>  {
> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    target_ulong    ebreak_addr =3D ctx->base.pc_next;
> +    target_ulong    pre_addr =3D ebreak_addr - 4;
> +    target_ulong    post_addr =3D ebreak_addr + 4;
> +    uint32_t pre    =3D 0;
> +    uint32_t ebreak =3D 0;
> +    uint32_t post   =3D 0;
> +
> +    /*
> +     * The RISC-V semihosting spec specifies the following
> +     * three-instruction sequence to flag a semihosting call:
> +     *
> +     *      slli zero, zero, 0x1f       0x01f01013
> +     *      ebreak                      0x00100073
> +     *      srai zero, zero, 0x7        0x40705013
> +     *
> +     * The two shift operations on the zero register are no-ops, used
> +     * here to signify a semihosting exception, rather than a breakpoint=
.
> +     *
> +     * Uncompressed instructions are required so that the sequence is ea=
sy
> +     * to validate.
> +     *
> +     * The three instructions are required to lie in the same page so
> +     * that no exception will be raised when fetching them.
> +     */
> +
> +    if ((pre_addr & TARGET_PAGE_MASK) =3D=3D (post_addr & TARGET_PAGE_MA=
SK)) {
> +        pre    =3D opcode_at(&ctx->base, pre_addr);
> +        ebreak =3D opcode_at(&ctx->base, ebreak_addr);
> +        post   =3D opcode_at(&ctx->base, post_addr);
> +    }
> +
> +    if  (pre =3D=3D 0x01f01013 && ebreak =3D=3D 0x00100073 && post =3D=
=3D 0x40705013) {
> +        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    }
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>      return true;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1698a0c751..263caa21ec 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4197,10 +4197,10 @@ ERST
>  DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      "-semihosting    semihosting mode\n",
>      QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
> +    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V on=
ly).
>
>      Note that this allows guest direct access to the host filesystem, so
>      should only be used with a trusted guest OS.
> @@ -4212,10 +4212,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_se=
mihosting_config,
>      "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,c=
hardev=3Did][,arg=3Dstr[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,char=
dev=3Did][,arg=3Dstr[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
> +    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, =
RISC-V
>      only).
>
>      Note that this allows guest direct access to the host filesystem, so
> @@ -4230,6 +4230,8 @@ SRST
>      open/read/write/seek/select. Tensilica baremetal libc for ISS and
>      linux platform "sim" use this interface.
>
> +    On RISC-V this implements the standard semihosting API, version 0.2.
> +
>      ``target=3Dnative|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU
>          (``native``) or to GDB (``gdb``). The default is ``auto``, which
> --
> 2.20.1
>
>

