Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcyUK-00049M-Ld
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 17:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyUH-000485-U5; Wed, 11 Nov 2020 17:21:09 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyUC-0002QU-EZ; Wed, 11 Nov 2020 17:21:09 -0500
Received: by mail-io1-xd44.google.com with SMTP id j12so3979689iow.0;
 Wed, 11 Nov 2020 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z+ossysa86t8Oy0X4ZXJPdQQ6GnoQz/DabcMQ6JDW38=;
 b=QoYEiDa3VurhlbIUyY0qKIUVdeYeLvffkwI1EFK9KxCO8yuyGwD/yJI60hPh/zXjE8
 9hRUN69OCvHePkXBJMVAntuvcAKIU0JVBIlhDt8IRNrT0F/nf3gDyUcQECdl5biBtZ/D
 r2UVGzr1sKbY1C/I2bnn74UJaXjlG7UbcJ2xUl3kjdJvY/EAiiPnbxQAPfSHwTf7lr7S
 OVE0djOcpz6DIDgPrY03lRkxwYHjS58AfAXc2jH83O0i3uLQn9gb5WZnAg8oro6kWq6C
 GC7XPQZKsbTIF78xCs31qxEoA7SRoTN/Ez5SiHPa99o+lqUGtVkZ2yWjojovUzwQOkv/
 i9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z+ossysa86t8Oy0X4ZXJPdQQ6GnoQz/DabcMQ6JDW38=;
 b=aq3HtP2DdB2O+p0FooS1cOrWcSwQMlT7bplS/eurdaUfbvkbIpI6rKi7dp0SZsktt4
 V69Ux8MYMKHl6ReI6RbJclpX4IGtaHqZF516nWzGm16b1En7E9LivlQ06IvXedMW9deU
 yqjyiiTmPbAE8v9pD1pS2fc/kXkz4m6UsT5JXFeHAWyKy4VD3d2Jr4m8QDK3wQRT0in6
 PZEz3xQd6TQaVKYleEiEWdDeMOuzpVXyT9mAjMYgCxonxCKu0yQSy2axuMeLGn8gAr9R
 l6wG/pfU59deyK94Kdg+Le7qrs3TozuVGrBg3k2UlwQ4CWR/YmpTM0cEtR0lgCks1xrA
 4bOg==
X-Gm-Message-State: AOAM530vi/dn2WEGWP9NIxNYUkxbEtg6QSnTkTmo4bdmOaWWPMYc+Lae
 YnfeaxMxRgm0Ol+D5vxxthUaWI9dA6WaoDZ9GSE=
X-Google-Smtp-Source: ABdhPJztP/CwAFgk9xphfNJkyeSzS8ao3JkliCy9Nnlmg5q6ev++NaOAZP9AwFhwt3rcCFcnq0hkwb4Wy81A+eSEDAw=
X-Received: by 2002:a5d:9a8d:: with SMTP id c13mr19430944iom.176.1605133262420; 
 Wed, 11 Nov 2020 14:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20201028185722.2783532-1-keithp@keithp.com>
 <20201028185722.2783532-3-keithp@keithp.com>
In-Reply-To: <20201028185722.2783532-3-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 14:08:58 -0800
Message-ID: <CAKmqyKP-F_nGgSvFWCW41cKqRF5RmB=RhEuQAUOjEUecUfeKgA@mail.gmail.com>
Subject: Re: [PATCH 2/4] semihosting: Change common-semi API to be
 architecture-independent
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 11 Nov 2020 22:21:10 -0000

On Wed, Oct 28, 2020 at 12:01 PM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> The public API is now defined in
> hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
> instead of CPUARMState *. All internal functions have been renamed
> common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
> there are no functional changes in this patch.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/semihosting/common-semi.c  | 16 ++++++++++------
>  hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
>  linux-user/aarch64/cpu_loop.c |  3 ++-
>  linux-user/arm/cpu_loop.c     |  3 ++-
>  target/arm/cpu.h              |  8 --------
>  target/arm/helper.c           |  5 +++--
>  target/arm/m_helper.c         |  7 ++++++-
>  7 files changed, 59 insertions(+), 19 deletions(-)
>  create mode 100644 hw/semihosting/common-semi.h
>
> diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
> index 8718fd0194..e0c59bc599 100644
> --- a/hw/semihosting/common-semi.c
> +++ b/hw/semihosting/common-semi.c
> @@ -1,10 +1,14 @@
>  /*
> - *  Arm "Angel" semihosting syscalls
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
>   *
>   *  Copyright (c) 2005, 2007 CodeSourcery.
>   *  Copyright (c) 2019 Linaro
>   *  Written by Paul Brook.
>   *
> + *  Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packa=
rd
> + *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License as published by
>   *  the Free Software Foundation; either version 2 of the License, or
> @@ -371,12 +375,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>       * do anything with its return value, because it is not necessarily
>       * the result of the syscall, but could just be the old value of X0.
>       * The only thing safe to do with this is that the callers of
> -     * do_arm_semihosting() will write it straight back into X0.
> +     * do_common_semihosting() will write it straight back into X0.
>       * (In linux-user mode, the callback will have happened before
>       * gdb_do_syscallv() returns.)
>       *
>       * We should tidy this up so neither this function nor
> -     * do_arm_semihosting() return a value, so the mistake of
> +     * do_common_semihosting() return a value, so the mistake of
>       * doing something with the return value is not possible to make.
>       */
>
> @@ -673,10 +677,10 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>   * leave the register unchanged. We use 0xdeadbeef as the return value
>   * when there isn't a defined return value for the call.
>   */
> -target_ulong do_arm_semihosting(CPUARMState *env)
> +target_ulong do_common_semihosting(CPUState *cs)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> -    CPUState *cs =3D env_cpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>      target_ulong args;
>      target_ulong arg0, arg1, arg2, arg3;
>      char * s;
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> new file mode 100644
> index 0000000000..bc53e92c79
> --- /dev/null
> +++ b/hw/semihosting/common-semi.h
> @@ -0,0 +1,36 @@
> +/*
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
> + *
> + *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
> + *  Written by Paul Brook.
> + *
> + *  Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packa=
rd
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + */
> +
> +#ifndef COMMON_SEMI_H
> +#define COMMON_SEMI_H
> +
> +target_ulong do_common_semihosting(CPUState *cs);
> +
> +#endif /* COMMON_SEMI_H */
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.=
c
> index bbe9fefca8..42b9c15f53 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -22,6 +22,7 @@
>  #include "qemu.h"
>  #include "cpu_loop-common.h"
>  #include "qemu/guest-random.h"
> +#include "hw/semihosting/common-semi.h"
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r =3D get_user_u32((x), (gaddr));       \
> @@ -129,7 +130,7 @@ void cpu_loop(CPUARMState *env)
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
>          case EXCP_SEMIHOST:
> -            env->xregs[0] =3D do_arm_semihosting(env);
> +            env->xregs[0] =3D do_common_semihosting(cs);
>              env->pc +=3D 4;
>              break;
>          case EXCP_YIELD:
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 13629ee1f6..31dbb4d1af 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -22,6 +22,7 @@
>  #include "qemu.h"
>  #include "elf.h"
>  #include "cpu_loop-common.h"
> +#include "hw/semihosting/common-semi.h"
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r =3D get_user_u32((x), (gaddr));       \
> @@ -393,7 +394,7 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_SEMIHOST:
> -            env->regs[0] =3D do_arm_semihosting(env);
> +            env->regs[0] =3D do_common_semihosting(cs);
>              env->regs[15] +=3D env->thumb ? 2 : 4;
>              break;
>          case EXCP_INTERRUPT:
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 49cd5cabcf..c7ece27c56 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1068,14 +1068,6 @@ static inline void aarch64_sve_change_el(CPUARMSta=
te *env, int o,
>  static inline void aarch64_add_sve_properties(Object *obj) { }
>  #endif
>
> -#if !defined(CONFIG_TCG)
> -static inline target_ulong do_arm_semihosting(CPUARMState *env)
> -{
> -    g_assert_not_reached();
> -}
> -#else
> -target_ulong do_arm_semihosting(CPUARMState *env);
> -#endif
>  void aarch64_sync_32_to_64(CPUARMState *env);
>  void aarch64_sync_64_to_32(CPUARMState *env);
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 97bb6b8c01..8dbb0ef5d3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -34,6 +34,7 @@
>  #ifdef CONFIG_TCG
>  #include "arm_ldst.h"
>  #include "exec/cpu_ldst.h"
> +#include "hw/semihosting/common-semi.h"
>  #endif
>
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
> @@ -9889,13 +9890,13 @@ static void handle_semihosting(CPUState *cs)
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%" PRIx64 "\n",
>                        env->xregs[0]);
> -        env->xregs[0] =3D do_arm_semihosting(env);
> +        env->xregs[0] =3D do_common_semihosting(cs);
>          env->pc +=3D 4;
>      } else {
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%x\n",
>                        env->regs[0]);
> -        env->regs[0] =3D do_arm_semihosting(env);
> +        env->regs[0] =3D do_common_semihosting(cs);
>          env->regs[15] +=3D env->thumb ? 2 : 4;
>      }
>  }
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 036454234c..ef897382de 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -31,6 +31,7 @@
>  #ifdef CONFIG_TCG
>  #include "arm_ldst.h"
>  #include "exec/cpu_ldst.h"
> +#include "hw/semihosting/common-semi.h"
>  #endif
>
>  static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> @@ -2188,7 +2189,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          qemu_log_mask(CPU_LOG_INT,
>                        "...handling as semihosting call 0x%x\n",
>                        env->regs[0]);
> -        env->regs[0] =3D do_arm_semihosting(env);
> +#ifdef CONFIG_TCG
> +        env->regs[0] =3D do_common_semihosting(cs);
> +#else
> +        g_assert_not_reached();
> +#endif
>          env->regs[15] +=3D env->thumb ? 2 : 4;
>          return;
>      case EXCP_BKPT:
> --
> 2.28.0
>
>

