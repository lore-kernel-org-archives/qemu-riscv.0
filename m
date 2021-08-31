Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKuDq-0005vc-1r
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 23:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKuDo-0005vD-0Q; Mon, 30 Aug 2021 23:14:00 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKuDl-0003pm-Td; Mon, 30 Aug 2021 23:13:59 -0400
Received: by mail-il1-x12c.google.com with SMTP id h29so18540053ila.2;
 Mon, 30 Aug 2021 20:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KtkaXuGuxLw27Svd9AXFXZsV5AMZwQNwto4Cvr1C/MQ=;
 b=seDU85wRYbwPnj1wMxps5i0aaPP0G9Mr21si3ejTG7JeL2c4nqDDgFKX8W9iBcWM+U
 +M8fjA3d0SwC5sPJkyvlwNwz8kV1SLk3bpxcjfUB12fV8XVtN6UjYAs9enRNTjeW9/k9
 H7eStFtENs87PNOlttPVZ/TKPEcBWeLEFyjw9kKcBrcALXgb8gfoG2W82HxZ4rd7iMTh
 QHlswWjWLFZmFc83SorlJiITwhGCUxD23rExgydl46uPHLa8o6apRMPi5YeVjZUT4LuI
 1yAHgicLwqEntzFnu/UdI/qsTmeko9XSQanNrBzJHR/9zx/gsK3VElPwsNb9p8GWht35
 zBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KtkaXuGuxLw27Svd9AXFXZsV5AMZwQNwto4Cvr1C/MQ=;
 b=PXmhRDBuDb2J9i8AKm2wnq9HwOKjRE+sAxlqQOfmCeL2U2tPUdeIuYdojtOCLu+VhW
 +JFYHLEqd3iI0ArgBfOqT/+x6pC6ffG5GNU3wJSLGRx0XNxM8c5QgU0C0N/KZR7+uMHt
 UVRXJg3VYwkv9+01KcUp0J9Q3V1H/ftnKrNjNkFI+OKAG0uEy8kYPp1sS5UKYLupxGCP
 LRsmpxrSLnGUlkys5kiXq2RNf/tblvvy5DvWzgvGazeUmyZW/5ERMSiiBGhB9Now43ho
 PlKkCnbQ97OSb3RssCRPxcKckoFU1VOIRC1jmw3RPlx6P3mOMlAxK+8x9bdIgLm2rV8a
 cXhg==
X-Gm-Message-State: AOAM533ayWsl6RxQOGD8fA/4BBYIKvyGtzkb5a+8xZOc6uYPM+zKSVvn
 0byoJgnv7fqBqAZJ0YCLseW9l2WQyaDOEhCkQ2M=
X-Google-Smtp-Source: ABdhPJxE+BHASIJb2P70nB3h0g9rv4KBGfYadHavqEUP3iqqnCvoDSpNs/bbOiRSn8OV+u6Gx//KSLpKDANnTjYHqVU=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr18239013ilj.227.1630379636059; 
 Mon, 30 Aug 2021 20:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Aug 2021 13:13:29 +1000
Message-ID: <CAKmqyKOiqe1wic+_0si7PTTCT62XqWXc3h=0LqCh229Q0x8R6A@mail.gmail.com>
Subject: Re: [PATCH 1/8] target/riscv: Settings for 128-bit extension support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Tue, 31 Aug 2021 03:14:00 -0000

On Tue, Aug 31, 2021 at 5:26 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Starting 128-bit extension support implies a few modifications in the
> existing sources because checking for 32-bit is done by checking that
> it is not 64-bit and vice-versa.
> We now consider the 3 possible xlen values so as to allow correct
> compilation for both existing targets while setting the compilation
> framework so that it can also handle the riscv128-softmmu target.
> This includes gdb configuration files, that are just the bare copy of the
> 64-bit ones as gdb does not honor, yet, 128-bit CPUs.
> To consider the 3 xlen values, we had to add a misah field, representing =
the
> upper 64 bits of the misa register.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  configs/devices/riscv128-softmmu/default.mak | 16 ++++++
>  configs/targets/riscv128-softmmu.mak         |  5 ++
>  gdb-xml/riscv-128bit-cpu.xml                 | 48 ++++++++++++++++++
>  gdb-xml/riscv-128bit-virtual.xml             | 12 +++++
>  include/hw/riscv/sifive_cpu.h                |  4 ++
>  target/riscv/Kconfig                         |  3 ++
>  target/riscv/arch_dump.c                     |  3 +-
>  target/riscv/cpu-param.h                     |  3 +-
>  target/riscv/cpu.c                           | 51 +++++++++++++++++---
>  target/riscv/cpu.h                           | 19 ++++++++
>  target/riscv/gdbstub.c                       |  3 ++
>  target/riscv/insn_trans/trans_rvd.c.inc      | 10 ++--
>  target/riscv/insn_trans/trans_rvf.c.inc      |  2 +-
>  target/riscv/translate.c                     | 45 ++++++++++++++++-
>  14 files changed, 209 insertions(+), 15 deletions(-)
>  create mode 100644 configs/devices/riscv128-softmmu/default.mak
>  create mode 100644 configs/targets/riscv128-softmmu.mak
>  create mode 100644 gdb-xml/riscv-128bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-128bit-virtual.xml

Hey!

Thanks for the patches!

Overall this patch looks good.

It would greatly help reviewing and the speed in which this can be
merged if you can split it up more. A lot of these changes probably
can be separate patches (for example a patch to add misah). I know it
can sometimes seem a little silly, but it greatly helps with reviewing
when patches are small and self contained.

>
> diff --git a/configs/devices/riscv128-softmmu/default.mak b/configs/devic=
es/riscv128-softmmu/default.mak
> new file mode 100644
> index 0000000000..31439dbcfe
> --- /dev/null
> +++ b/configs/devices/riscv128-softmmu/default.mak
> @@ -0,0 +1,16 @@
> +# Default configuration for riscv128-softmmu
> +
> +# Uncomment the following lines to disable these optional devices:
> +#
> +#CONFIG_PCI_DEVICES=3Dn
> +CONFIG_SEMIHOSTING=3Dy
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> +
> +# Boards:
> +#
> +CONFIG_SPIKE=3Dn
> +CONFIG_SIFIVE_E=3Dn
> +CONFIG_SIFIVE_U=3Dn
> +CONFIG_RISCV_VIRT=3Dy
> +CONFIG_MICROCHIP_PFSOC=3Dn
> +CONFIG_SHAKTI_C=3Dn
> diff --git a/configs/targets/riscv128-softmmu.mak b/configs/targets/riscv=
128-softmmu.mak
> new file mode 100644
> index 0000000000..e300c43c8e
> --- /dev/null
> +++ b/configs/targets/riscv128-softmmu.mak
> @@ -0,0 +1,5 @@
> +TARGET_ARCH=3Driscv128
> +TARGET_BASE_ARCH=3Driscv
> +TARGET_SUPPORTS_MTTCG=3Dy
> +TARGET_XML_FILES=3D gdb-xml/riscv-128bit-cpu.xml gdb-xml/riscv-32bit-fpu=
.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-128bit-virtual.xml
> +TARGET_NEED_FDT=3Dy
> diff --git a/gdb-xml/riscv-128bit-cpu.xml b/gdb-xml/riscv-128bit-cpu.xml
> new file mode 100644
> index 0000000000..c98168148f
> --- /dev/null
> +++ b/gdb-xml/riscv-128bit-cpu.xml
> @@ -0,0 +1,48 @@
> +<?xml version=3D"1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification=
,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!-- Register numbers are hard-coded in order to maintain backward
> +     compatibility with older versions of tools that didn't use xml
> +     register descriptions.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<!-- FIXME : All GPRs are marked as 64-bits since gdb doesn't like 128-b=
it registers for now. -->
> +<feature name=3D"org.gnu.gdb.riscv.cpu">
> +  <reg name=3D"zero" bitsize=3D"64" type=3D"int" regnum=3D"0"/>
> +  <reg name=3D"ra" bitsize=3D"64" type=3D"code_ptr"/>
> +  <reg name=3D"sp" bitsize=3D"64" type=3D"data_ptr"/>
> +  <reg name=3D"gp" bitsize=3D"64" type=3D"data_ptr"/>
> +  <reg name=3D"tp" bitsize=3D"64" type=3D"data_ptr"/>
> +  <reg name=3D"t0" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t1" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t2" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"fp" bitsize=3D"64" type=3D"data_ptr"/>
> +  <reg name=3D"s1" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a0" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a1" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a2" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a3" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a4" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a5" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a6" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"a7" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s2" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s3" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s4" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s5" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s6" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s7" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s8" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s9" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s10" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"s11" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t3" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t4" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t5" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"t6" bitsize=3D"64" type=3D"int"/>
> +  <reg name=3D"pc" bitsize=3D"64" type=3D"code_ptr"/>
> +</feature>
> diff --git a/gdb-xml/riscv-128bit-virtual.xml b/gdb-xml/riscv-128bit-virt=
ual.xml
> new file mode 100644
> index 0000000000..db9a0ff677
> --- /dev/null
> +++ b/gdb-xml/riscv-128bit-virtual.xml
> @@ -0,0 +1,12 @@
> +<?xml version=3D"1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification=
,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<!-- FIXME : priv marked as 64-bits since gdb doesn't like 128-bit regis=
ters for now. -->
> +<feature name=3D"org.gnu.gdb.riscv.virtual">
> +  <reg name=3D"priv" bitsize=3D"64"/>
> +</feature>
> diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.=
h
> index 136799633a..2fd441664f 100644
> --- a/include/hw/riscv/sifive_cpu.hthat
> +++ b/include/hw/riscv/sifive_cpu.h
> @@ -26,6 +26,10 @@
>  #elif defined(TARGET_RISCV64)
>  #define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
>  #define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
> +#elif defined(TARGET_RISCV128)
> +/* 128-bit uses 64-bit CPU for now, since no cpu implements RV128 */
> +#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
> +#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
>  #endif
>
>  #endif /* HW_SIFIVE_CPU_H */
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> index b9e5932f13..f9ea52a59a 100644
> --- a/target/riscv/Kconfig
> +++ b/target/riscv/Kconfig
> @@ -3,3 +3,6 @@ config RISCV32
>
>  config RISCV64
>      bool
> +
> +config RISCV128
> +    bool
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> index 709f621d82..f756ed2988 100644
> --- a/target/riscv/arch_dump.c
> +++ b/target/riscv/arch_dump.c
> @@ -176,7 +176,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>
>      info->d_machine =3D EM_RISCV;
>
> -#if defined(TARGET_RISCV64)
> +#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
> +    /* FIXME : No 128-bit ELF class exists (for now), use 64-bit one. */
>      info->d_class =3D ELFCLASS64;
>  #else
>      info->d_class =3D ELFCLASS32;
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index 80eb615f93..e6d0651f60 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -8,7 +8,8 @@
>  #ifndef RISCV_CPU_PARAM_H
>  #define RISCV_CPU_PARAM_H 1
>
> -#if defined(TARGET_RISCV64)
> +/* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 6=
4 */
> +#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
>  # define TARGET_LONG_BITS 64
>  # define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
>  # define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..1f15026e9c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -110,18 +110,38 @@ const char *riscv_cpu_get_trap_name(target_ulong ca=
use, bool async)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env)
>  {
> -    if (env->misa & RV64) {
> -        return false;
> -    }
> +    return (env->misa & MXLEN_MASK) =3D=3D RV32;
> +}
>
> -    return true;
> +bool riscv_cpu_is_64bit(CPURISCVState *env)
> +{
> +    return (env->misa & MXLEN_MASK) =3D=3D RV64;
>  }
>
> +#if defined(TARGET_RISCV128)

Don't add any TARGET_* defines.

We are trying to move to a point where the 64-bit RISC-V softmmu can
run 32-bit CPUs. Ideally we want the same with 128-bit. You don't have
to get that working, but don't add any compile time conditionals.

That applies to all code, not just this patch. Unless there is already
a conditional TARGET_* compile please don't add one.

Alistair

