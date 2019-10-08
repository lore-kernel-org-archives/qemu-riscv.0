Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHoaN-0005jH-6p
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 08:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iHoaK-0005f2-Nj
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 08:27:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iHoaJ-0006rM-CW
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 08:27:24 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:34315)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iHoaG-0006h0-3U; Tue, 08 Oct 2019 08:27:20 -0400
Received: by mail-yw1-xc43.google.com with SMTP id d192so6352079ywa.1;
 Tue, 08 Oct 2019 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bSYOvoaaEcla2RS3jLfW+5vehVBBroKMDgQ7QHGKMcE=;
 b=kVQ+PsWEMbyaHYR5bb68WrIhXYCtBYydZ/YCj8CbrxKXqpn6lSqhFGcLamaONv3b50
 KAn6Wkapr3vd8fZ4dqKwQQnRCgA/1FwFasdEYBLPrFqgnx2Z6aTp0cjHhzwCyflrI8po
 C3kjlDsiUaYbk4doYzgE024j6nyTGoSxzEW/ixQGRaZ3+zhWefFQd5epnbIhgPLKKdNQ
 uBRUeHUceJQ8DUXkvmMkwD/Iq1T0HQg4f3NHtZI3d5EvEE9JKwE8N6gf6PR5zNow3fmG
 zALChOsM2d1hI6n1nZBdUkH2Ps046pUDLn+cByK8Vfc/I2NWMV2qlpGpCNBovjt2UI13
 4G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bSYOvoaaEcla2RS3jLfW+5vehVBBroKMDgQ7QHGKMcE=;
 b=EXtEVfhwsklvwNGdcpfOYgs5R+q5vZgUlXpx+D7jU7WL4TVs/gUVheOs0jLkPJ4qMG
 JR2HvEAMA4IHhJfD6hGlNY0qDHEeZxYE1kqrBgZ6ctje/Vc7YyYhd1rYsc5Vi2QWDgxo
 YbfPtqqd7UmzT1aNTuZb5OjJxx6rVv2VjMnGZjznqLQtOw96X5X/u9bGGeEv0PlI7eJW
 r4X275MltXofi+FnEEPxEYeMmHnPCOSfvQqwLuPbruWTnGm2krny7oPR8VqzOr7f/WW/
 gJZ7FP67nXM4mG5shVqMOXZ0zNja7qaD0vlewhkzarrbc/5sR2Jz5x5rxY37UpDoLq+P
 FAmQ==
X-Gm-Message-State: APjAAAVFh0dzPIY78EZkbCPnuwYx4DXqfcInzbLnWbOK6Zq/ynFPdpnF
 I1EjHjDbzUMZoyK7EftYI8vjU03BcfPal5XXsxo=
X-Google-Smtp-Source: APXvYqzfT56dKUSvpWtpT1okkyTiBnuMPKtwoX2B12RTtgXUzPhUDNzE0KwgSsy3UDSoLNJnTJk43CrJhAoPXlWjzHY=
X-Received: by 2002:a81:a401:: with SMTP id b1mr22739020ywh.280.1570537638909; 
 Tue, 08 Oct 2019 05:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-3-jonathan@fintelia.io>
In-Reply-To: <20191008001318.219367-3-jonathan@fintelia.io>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 8 Oct 2019 20:27:05 +0800
Message-ID: <CAEUhbmWcwUhVjO97z7z3prg1WYU4ushOBgDMW9_ruaMk4___Zg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: Expose priv register for GDB for
 reads
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
X-List-Received-Date: Tue, 08 Oct 2019 12:27:26 -0000

On Tue, Oct 8, 2019 at 8:18 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> This patch enables a debugger to read the current privilege level via a virtual
> "priv" register. When compiled with CONFIG_USER_ONLY the register is still
> visible but always reports the value zero.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  configure                       |  4 ++--
>  gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
>  gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
>  target/riscv/gdbstub.c          | 23 +++++++++++++++++++++++
>  4 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 gdb-xml/riscv-32bit-virtual.xml
>  create mode 100644 gdb-xml/riscv-64bit-virtual.xml
>
> diff --git a/configure b/configure
> index 30544f52e6..6118a6a045 100755
> --- a/configure
> +++ b/configure
> @@ -7520,13 +7520,13 @@ case "$target_name" in
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> -    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml"
> +    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
>    ;;
>    riscv64)
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> -    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
> +    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml riscv-64bit-virtual.xml"
>    ;;
>    sh4|sh4eb)
>      TARGET_ARCH=sh4
> diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
> new file mode 100644
> index 0000000000..905f1c555d
> --- /dev/null
> +++ b/gdb-xml/riscv-32bit-virtual.xml
> @@ -0,0 +1,11 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.virtual">
> +  <reg name="priv" bitsize="32"/>
> +</feature>
> diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
> new file mode 100644
> index 0000000000..62d86c237b
> --- /dev/null
> +++ b/gdb-xml/riscv-64bit-virtual.xml
> @@ -0,0 +1,11 @@
> +<?xml version="1.0"?>
> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.riscv.virtual">
> +  <reg name="priv" bitsize="64"/>
> +</feature>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index cb5bfd3d50..33cf7c4c7d 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -373,6 +373,23 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>
> +static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
> +{
> +    if (n == 0) {
> +#ifdef CONFIG_USER_ONLY
> +        return gdb_get_regl(mem_buf, 0);
> +#else
> +        return gdb_get_regl(mem_buf, cs->priv);
> +#endif
> +    }
> +    return 0;
> +}
> +
> +static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
> +{
> +    return 0;
> +}
> +
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
> @@ -385,6 +402,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               240, "riscv-32bit-csr.xml", 0);
> +
> +    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
> +                             1, "riscv-32bit-csr.xml", 0);

This should be riscv-32bit-virtual.xml

>  #elif defined(TARGET_RISCV64)
>      if (env->misa & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> @@ -393,5 +413,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               240, "riscv-64bit-csr.xml", 0);
> +
> +    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
> +                             1, "riscv-64bit-virtual.xml", 0);
>  #endif
>  }

Regards,
Bin

