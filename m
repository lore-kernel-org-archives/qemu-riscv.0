Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmuNS-0000gI-Bp
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 02:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npickito@gmail.com>)
 id 1kmuNO-0000fQ-OT; Wed, 09 Dec 2020 02:59:06 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npickito@gmail.com>)
 id 1kmuNI-0001x5-HF; Wed, 09 Dec 2020 02:59:06 -0500
Received: by mail-wm1-x342.google.com with SMTP id v14so576617wml.1;
 Tue, 08 Dec 2020 23:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHe941QdB4+qzBVcTOQB9sKtWayF4xlyDHCOXhiEwJE=;
 b=rt1kV1wUv8OaJs6ctVr0cnUxM8aTaVi46qIK/oK8qly09pBEA/DFCZ8KPCw4het1Bn
 0AI5s+ZGF6mN5u1ujoC7ki7c7QI4G//SAKxAXXrM9gjhvLpb4uZMx9BHHfHEm3mP9geF
 7mmxYBOYdvq/6qv7ri68mOiK8vUXIb0Rik7IYeewo4m5wXAYJNPDswElbPePvk48B14i
 OYbwgWi7QuWWVtmRz18eVsJAZklBlYZGxKOruOM243q4p5+HEDUJ7cC2HTpjxIQ4gIb0
 L5wagF87ijI7WMdrPuFL3TsIhy5bc3KrsV9d5ftbUloG9SduM5nnYhqjTQCnfiS0IP+p
 gK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHe941QdB4+qzBVcTOQB9sKtWayF4xlyDHCOXhiEwJE=;
 b=hmF+CSTcDLs+b/m79Q3LD/uzNVtyLqFYFxchEsi8Y2Y/YBeljnbSvcshAT9tF9t18p
 IzvdBLWFtcqQepnQPApkxVsOzPfNCvdktsSSvmWyupxWmYbiUbCKCkpkOiUC3oyoAvJh
 dkIXJMdwdCyz7Wd4wZAlIS3pOvEHSzbBO7byl6mN8vqqGqW55zfDmwA2wubkhluc7nWj
 eYDRX01RXry4CPZnSzi15skPXJ7/J2fgxhxhGy1MMMdO3QnJ0GZc57BK208zDfE0dRh9
 d6l0vAYsVn1safUCGBqQagJcmherRM2B9cDNTq52ZqTmRDXATFzYNsSgQU7vrACy0MeS
 cTPw==
X-Gm-Message-State: AOAM531gI6x2fEf9oCawGkU72OMA7orXlT21vT1zJj8DtO1i1t9kSui+
 xb9OPO2PpzR1xoIqtGl+zOWV2l5hvckNRiarWwY=
X-Google-Smtp-Source: ABdhPJwuyqkGeaktQV/BrN72nk69i5SsRCyu7w2UUnsHj+1wD2lIiRgvgiiBst0q2kb01mJvEd/9RaRVelIC4k8iQ1U=
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr1347694wmg.168.1607500737276; 
 Tue, 08 Dec 2020 23:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
In-Reply-To: <20201125213617.2496935-6-keithp@keithp.com>
From: Kito Cheng <kito.cheng@gmail.com>
Date: Wed, 9 Dec 2020 15:58:37 +0800
Message-ID: <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: multipart/mixed; boundary="0000000000006c69cb05b6036ede"
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=npickito@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 09 Dec 2020 07:59:08 -0000

--0000000000006c69cb05b6036ede
Content-Type: text/plain; charset="UTF-8"

Hi Keith:

Thanks for the patch, I've verified with newlib semihosting support
which is contributed by Craig Blackmore from embecosm,
and I would like to add semihosting to user mode, do you mind add this
patch into this patch series?


On Thu, Nov 26, 2020 at 5:41 AM Keith Packard via <qemu-riscv@nongnu.org> wrote:
>
> Adapt the arm semihosting support code for RISCV. This implementation
> is based on the standard for RISC-V semihosting version 0.2 as
> documented in
>
>    https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
>
> ---
>
> v2:
>         Update PC after exception is handled to follow
>         change in the ARM version for SYS_READC
>
> v3:
>         Disallow semihosting in user mode; report a regular
>         breakpoint in that case.
>
> v4:
>         Fix errors reported by checkpatch
>
> v5:
>         Reference current RISC-V semihosting specification
>
> v6:
>         Add support for semihosting in riscv64-linux-user and
>         riscv32-linux-user
>
> v7:
>         Add meson build support
>
> v8:
>         Fix errors reported by checkpatch that crept in.
>
> v9:
>         Changes suggested by Alistair Francis <alistair23@gmail.com>:
>         Don't add me to the MAINTAINERS file.
>         Remove duplicate #include in target/riscv/cpu.h
>         Reference RISC-V semihosting spec in target/riscv/riscv-semi.c
>
> v10:
>         Use common semihosting implementation instead of a separate copy.
>
>         Make sure addresses of the three breakpoint-signaling
>         instructions all lie within the same page. Change suggested by
>         Richard Henderson <richard.henderson@linaro.org>
>
> v11:
>         Use CONFIG_ARM_COMPATIBLE_SEMIHOSTING
>
> v12:
>         Fix bug in SYS_EXIT support on rv64
>
> v13:
>         Add common_semi_rambase implementation. This locates the
>         memory region containing the stack and uses the base of that.
>
>         Fix SET_ARG and GET_ARG on rv64 targets to operate on 64-bit
>         values rather than 32-bit. Put_user_ual/get_user_ual are
>         confusingly defined by softmmu-semi.h as being equivalent to
>         put_user_u32/get_user_u32.
> ---
>  default-configs/devices/riscv32-softmmu.mak   |  2 +
>  default-configs/devices/riscv64-softmmu.mak   |  2 +
>  .../targets/riscv32-linux-user.mak            |  1 +
>  .../targets/riscv64-linux-user.mak            |  1 +
>  hw/semihosting/common-semi.c                  | 82 ++++++++++++++++++-
>  hw/semihosting/common-semi.h                  |  5 +-
>  linux-user/qemu.h                             |  4 +-
>  linux-user/semihost.c                         |  8 +-
>  qemu-options.hx                               | 10 ++-
>  target/riscv/cpu_bits.h                       |  1 +
>  target/riscv/cpu_helper.c                     | 10 +++
>  .../riscv/insn_trans/trans_privileged.c.inc   | 37 ++++++++-
>  target/riscv/translate.c                      | 11 +++
>  13 files changed, 162 insertions(+), 12 deletions(-)
>
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index 94a236c9c2..d847bd5692 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index 76b6195648..d5eec75f05 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,6 +3,8 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
> index dfb259e8aa..6a9d1b1bc1 100644
> --- a/default-configs/targets/riscv32-linux-user.mak
> +++ b/default-configs/targets/riscv32-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=riscv32
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
>  TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
> index b13895f3b0..0a92849a1b 100644
> --- a/default-configs/targets/riscv64-linux-user.mak
> +++ b/default-configs/targets/riscv64-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=riscv64
>  TARGET_BASE_ARCH=riscv
>  TARGET_ABI_DIR=riscv
>  TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index ddfa448cc2..2b6a3fd9fd 100644
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
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
>   */
>
>  #include "qemu/osdep.h"
> @@ -217,6 +221,42 @@ common_semi_rambase(CPUState *cs)
>
>  #endif /* TARGET_ARM */
>
> +#ifdef TARGET_RISCV
> +static inline target_ulong
> +common_semi_arg(CPUState *cs, int argno)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return env->gpr[xA0 + argno];
> +}
> +
> +static inline void
> +common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    env->gpr[xA0] = ret;
> +}
> +
> +static inline bool
> +common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> +}
> +
> +#ifndef CONFIG_USER_ONLY
> +
> +static inline target_ulong
> +common_semi_rambase(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return common_semi_find_region_base(env->gpr[xSP]);
> +}
> +#endif
> +
> +#endif
> +
>  /*
>   * Allocate a new guest file descriptor and return it; if we
>   * couldn't allocate a new fd then return -1.
> @@ -393,6 +433,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
>          sp = env->regs[13];
>      }
>  #endif
> +#ifdef TARGET_RISCV
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    sp = env->gpr[xSP];
> +#endif
>
>      return sp - 64;
>  }
> @@ -736,6 +782,37 @@ static const GuestFDFunctions guestfd_fns[] = {
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
> +    ((sizeof(target_ulong) == 8) ?              \
> +     get_user_u64(arg, p) :                     \
> +     get_user_u32(arg, p))
> +
> +/*
> + * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
> + * we need a macro that stores a target_ulong
> + */
> +#define put_user_utl(arg, p)                    \
> +    ((sizeof(target_ulong) == 8) ?              \
> +     put_user_u64(arg, p) :                     \
> +     put_user_u32(arg, p))
> +
> +#define GET_ARG(n) do {                                                 \
> +        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
> +            errno = EFAULT;                                             \
> +            return set_swi_errno(cs, -1);                              \
> +        }                                                               \
> +    } while (0)
> +
> +#define SET_ARG(n, val)                                 \
> +    put_user_utl(val, args + (n) * sizeof(target_ulong))
> +#endif
> +
>  /*
>   * Do a semihosting call.
>   *
> @@ -1174,6 +1251,9 @@ target_ulong do_common_semihosting(CPUState *cs)
>          if (is_a64(cs->env_ptr)) {
>              return 0;
>          }
> +#endif
> +#ifdef TARGET_RISCV
> +        return 0;
>  #endif
>          /* fall through -- invalid for A32/T32 */
>      default:
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
> + *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
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
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 104632ea34..22b4d704b6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4186,10 +4186,10 @@ ERST
>  DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      "-semihosting    semihosting mode\n",
>      QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
> +    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
>
>      Note that this allows guest direct access to the host filesystem, so
>      should only be used with a trusted guest OS.
> @@ -4201,10 +4201,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
>      "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
> +    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
>      only).
>
>      Note that this allows guest direct access to the host filesystem, so
> @@ -4219,6 +4219,8 @@ SRST
>      open/read/write/seek/select. Tensilica baremetal libc for ISS and
>      linux platform "sim" use this interface.
>
> +    On RISC-V this implements the standard semihosting API, version 0.2.
> +
>      ``target=native|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU
>          (``native``) or to GDB (``gdb``). The default is ``auto``, which
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..f0d3d1c07e 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -544,6 +544,7 @@
>  #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
>  #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
>  #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
> +#define RISCV_EXCP_SEMIHOST                      0x10
>  #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
>  #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
>  #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a2787b1d48..e730fd1fe9 100644
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
> @@ -844,6 +845,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval = 0;
>      target_ulong mtval2 = 0;
>
> +    if  (cause == RISCV_EXCP_SEMIHOST) {
> +        if (env->priv >= PRV_S) {
> +            env->gpr[xA0] = do_common_semihosting(cs);
> +            env->pc += 4;
> +            return;
> +        }
> +        cause = RISCV_EXCP_BREAKPOINT;
> +    }
> +
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 2a61a853bf..32312be202 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
>
>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>  {
> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    target_ulong    ebreak_addr = ctx->base.pc_next;
> +    target_ulong    pre_addr = ebreak_addr - 4;
> +    target_ulong    post_addr = ebreak_addr + 4;
> +    uint32_t pre    = 0;
> +    uint32_t ebreak = 0;
> +    uint32_t post   = 0;
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
> +     * here to signify a semihosting exception, rather than a breakpoint.
> +     *
> +     * Uncompressed instructions are required so that the sequence is easy
> +     * to validate.
> +     *
> +     * The three instructions are required to lie in the same page so
> +     * that no exception will be raised when fetching them.
> +     */
> +
> +    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
> +        pre    = opcode_at(&ctx->base, pre_addr);
> +        ebreak = opcode_at(&ctx->base, ebreak_addr);
> +        post   = opcode_at(&ctx->base, post_addr);
> +    }
> +
> +    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
> +        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    }
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
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
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +
> +    return cpu_ldl_code(env, pc);
> +}
> +
>  /* Include insn module translation function */
>  #include "insn_trans/trans_rvi.c.inc"
>  #include "insn_trans/trans_rvm.c.inc"
> @@ -814,6 +824,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->cs = cs;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.29.2
>
>

--0000000000006c69cb05b6036ede
Content-Type: application/x-patch; 
	name="0001-riscv-Add-semihosting-support-for-user-mode.patch"
Content-Disposition: attachment; 
	filename="0001-riscv-Add-semihosting-support-for-user-mode.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kih1d56y0>
X-Attachment-Id: f_kih1d56y0

RnJvbSAyZjFlYjU4MjVhNmRkYTE3N2QzMjg5MTA2OTcwZWFiMDVjYjA4NDQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLaXRvIENoZW5nIDxraXRvLmNoZW5nQHNpZml2ZS5jb20+CkRh
dGU6IFdlZCwgOSBEZWMgMjAyMCAxNDoyNDo1MSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHJpc2N2
OiBBZGQgc2VtaWhvc3Rpbmcgc3VwcG9ydCBmb3IgdXNlciBtb2RlCgpUaGlzIGNvdWxkIG1hZGUg
dGVzdGluZyBtb3JlIGVhc2llciBhbmQgQVJNL0FBcmNoNjQgaGFzIHN1cHBvcnRlZCBvbgp0aGVp
ciBsaW51eCB1c2VyIG1vZGUgdG9vLCBzbyBJIHRoaW5rIGl0IHNob3VsZCBiZSByZWFzb25hYmxl
LgoKVmVyaWZpZWQgR0NDIHRlc3RzdWl0ZSB3aXRoIG5ld2xpYi9zZW1paG9zdGluZy4KClNpZ25l
ZC1vZmYtYnk6IEtpdG8gQ2hlbmcgPGtpdG8uY2hlbmdAc2lmaXZlLmNvbT4KLS0tCiBsaW51eC11
c2VyL3Jpc2N2L2NwdV9sb29wLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9yaXNjdi9jcHVfbG9vcC5jIGIvbGludXgt
dXNlci9yaXNjdi9jcHVfbG9vcC5jCmluZGV4IGFhOWU0Mzc4NzUuLjk2NjVkYWJiMDkgMTAwNjQ0
Ci0tLSBhL2xpbnV4LXVzZXIvcmlzY3YvY3B1X2xvb3AuYworKysgYi9saW51eC11c2VyL3Jpc2N2
L2NwdV9sb29wLmMKQEAgLTIzLDYgKzIzLDcgQEAKICNpbmNsdWRlICJxZW11LmgiCiAjaW5jbHVk
ZSAiY3B1X2xvb3AtY29tbW9uLmgiCiAjaW5jbHVkZSAiZWxmLmgiCisjaW5jbHVkZSAiaHcvc2Vt
aWhvc3RpbmcvY29tbW9uLXNlbWkuaCIKIAogdm9pZCBjcHVfbG9vcChDUFVSSVNDVlN0YXRlICpl
bnYpCiB7CkBAIC05MSw2ICs5MiwxMCBAQCB2b2lkIGNwdV9sb29wKENQVVJJU0NWU3RhdGUgKmVu
dikKICAgICAgICAgICAgIHNpZ2NvZGUgPSBUQVJHRVRfU0VHVl9NQVBFUlI7CiAgICAgICAgICAg
ICBzaWdhZGRyID0gZW52LT5iYWRhZGRyOwogICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIGNh
c2UgUklTQ1ZfRVhDUF9TRU1JSE9TVDoKKyAgICAgICAgICAgIGVudi0+Z3ByW3hBMF0gPSBkb19j
b21tb25fc2VtaWhvc3RpbmcoY3MpOworICAgICAgICAgICAgZW52LT5wYyArPSA0OworICAgICAg
ICAgICAgYnJlYWs7CiAgICAgICAgIGNhc2UgRVhDUF9ERUJVRzoKICAgICAgICAgZ2Ric3RlcDoK
ICAgICAgICAgICAgIHNpZ251bSA9IFRBUkdFVF9TSUdUUkFQOwotLSAKMi4yOS4yCgo=
--0000000000006c69cb05b6036ede--

