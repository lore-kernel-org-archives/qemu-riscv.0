Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ion0G-0005oP-Jw
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 06:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ion0C-0005jz-4Q
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 06:26:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ion0A-0007Tm-Ot
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 06:26:24 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33832)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ion0A-0007Sn-HT
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 06:26:22 -0500
Received: by mail-wm1-x342.google.com with SMTP id c127so13980378wme.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 03:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=3wqjZF5vvOisdbTUNGvI2Ps9JGJEyq1eaGvIxI8yav0=;
 b=F4f6vAyNyHeUftwdwnuj2Z1o5n/ueRfyaBnajIr5XmOmLWAgRJfPBYFZIi6eBjDTDn
 xijtzqAJz3MLtii319k8g1E57CvfGl/bCOrVey5nWFCdnv/Uh8yPaepuaMDlsVQ6Rn9f
 zVEmGpymQ5q2aqreUnwI9gJjXsqt14NjyJceUMud2nJTnZUX+l9THfA9XQJ6Q7BK3+T1
 NUGPUjjR82RmI04yex7jDjCT8yqhWHaRv71htvhnKP34l0MuulQ8peKDBa+yUAkGTEBS
 s2MCIDXUTbPQ1J1PufWj4qc2e6U4wBoVKWnCdSCfcVg0HMciKDZIsbfMtV4FNPpa2ZWt
 ud+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=3wqjZF5vvOisdbTUNGvI2Ps9JGJEyq1eaGvIxI8yav0=;
 b=dBeAmXS56+poAOBCe36AKzMe3AJ2jU/6ol3iJzC62QEO5I9iCqA56heJq9Z/c52sME
 uqzqxeuNe8gKSTajD/h+6qA0VY3/4IczO8FGcY7Xq3HxyYnE9Kk6kF5LVZsZGPWLaFGI
 pakck0VdqhjpfNY1NqHVMXr39bocuh6LrFvu8NC3uYREskH/kVUIqF7+3LsLeReI0jMg
 RrAHg+5ekqrbjdDTmu3rskGBy8jVAx9EF4kRoHlhd3CCJi2sQYG31v0kwyaCMyZ7O3UK
 lWronOZOSiNBMN/VrXUTtbNGYNpNIzNn1WJvo22WZbOOggdBaZFOEZDOmn/+Ewg55SyV
 xhxw==
X-Gm-Message-State: APjAAAX3uki+geExsjf8Bnzy1BNSniFg0V06Kcftf3dr4fQSGSNYK+hI
 YTrqnB6XsYo4ecpukwkGHuJRBQ==
X-Google-Smtp-Source: APXvYqyEwohLaYCfYIocUYE1yfFY5DNqnnO/VDZk7IPT0L0zOWGY01hxKGjKZhjjqe84AgzauYwmgg==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr39502258wml.3.1578396380121;
 Tue, 07 Jan 2020 03:26:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z4sm26463994wma.2.2020.01.07.03.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:26:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CAA31FF87;
 Tue,  7 Jan 2020 11:26:18 +0000 (GMT)
References: <20190821162831.27811-1-georg.kotheimer@kernkonzept.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt
 <palmer@sifive.com>, qemu-riscv@nongnu.org, Georg Kotheimer
 <georg.kotheimer@kernkonzept.com>
Subject: Re: [Qemu-devel] [PATCH v3] RISC-V: Select FPU gdb xml file based
 on the supported extensions
In-reply-to: <20190821162831.27811-1-georg.kotheimer@kernkonzept.com>
Date: Tue, 07 Jan 2020 11:26:18 +0000
Message-ID: <87zhez4ied.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Tue, 07 Jan 2020 11:26:27 -0000


Georg Kotheimer <georg.kotheimer@kernkonzept.com> writes:

> The size of the FPU registers depends solely on the floating point
> extensions supported by the target architecture.
> However, in the previous implementation the floating point register
> size was derived from whether the target architecture is 32-bit or
> 64-bit.
>
> To allow RVF without RVD, changes to riscv_gdb_get_fpu() and
> riscv_gdb_set_fpu() were necessary.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
> ---
>  configure              |  4 ++--
>  target/riscv/gdbstub.c | 45 ++++++++++++++++++++++++------------------
>  2 files changed, 28 insertions(+), 21 deletions(-)
>
> diff --git a/configure b/configure
> index 714e7fb6a1..44ee953022 100755
> --- a/configure
> +++ b/configure
> @@ -7596,14 +7596,14 @@ case "$target_name" in
>      TARGET_BASE_ARCH=3Driscv
>      TARGET_ABI_DIR=3Driscv
>      mttcg=3Dyes
> -    gdb_xml_files=3D"riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit=
-csr.xml"
> +    gdb_xml_files=3D"riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit=
-fpu.xml riscv-32bit-csr.xml"
>      target_compiler=3D$cross_cc_riscv32
>    ;;
>    riscv64)
>      TARGET_BASE_ARCH=3Driscv
>      TARGET_ABI_DIR=3Driscv
>      mttcg=3Dyes
> -    gdb_xml_files=3D"riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit=
-csr.xml"
> +    gdb_xml_files=3D"riscv-64bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit=
-fpu.xml riscv-64bit-csr.xml"
>      target_compiler=3D$cross_cc_riscv64
>    ;;
>    sh4|sh4eb)
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 27be93279b..89b2543c9d 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -303,19 +303,22 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint=
8_t *mem_buf, int n)
>  static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>  {
>      if (n < 32) {
> -        return gdb_get_reg64(mem_buf, env->fpr[n]);
> +        if (env->misa & RVD) {
> +            return gdb_get_reg64(mem_buf, env->fpr[n]);
> +        }
> +        return gdb_get_reg32(mem_buf, env->fpr[n]);
>      /* there is hole between ft11 and fflags in fpu.xml */
>      } else if (n < 36 && n > 32) {
>          target_ulong val =3D 0;
>          int result;
>          /*
> -         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is =
FP
> -         * register 33, so we recalculate the map index.
> +         * CSR_FFLAGS is at index 1 in the csr space, and gdb says it is=
 FP
> +         * register 33, so we recalculate the csr index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result =3D riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
> +        result =3D riscv_csrrw_debug(env, n - 33 + CSR_FFLAGS, &val, 0, =
0);
>          if (result =3D=3D 0) {
> -            return gdb_get_regl(mem_buf, val);
> +            return gdb_get_reg32(mem_buf, val);
>          }
>      }
>      return 0;
> @@ -324,20 +327,25 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, ui=
nt8_t *mem_buf, int n)
>  static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>  {
>      if (n < 32) {
> -        env->fpr[n] =3D ldq_p(mem_buf); /* always 64-bit */
> -        return sizeof(uint64_t);
> +        if (env->misa & RVD) {
> +            env->fpr[n] =3D ldq_p(mem_buf);
> +            return sizeof(uint64_t);
> +        } else {
> +            env->fpr[n] =3D ldl_p(mem_buf);
> +            return sizeof(uint32_t);
> +        }

What endianess can RISC-V support? Unless specifically stated by the
architecture values should be returned in tgarget endian format.

>      /* there is hole between ft11 and fflags in fpu.xml */
>      } else if (n < 36 && n > 32) {
> -        target_ulong val =3D ldtul_p(mem_buf);
> +        target_ulong val =3D ldl_p(mem_buf);
>          int result;
>          /*
> -         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is =
FP
> -         * register 33, so we recalculate the map index.
> +         * CSR_FFLAGS is at index 1 in the csr space, and gdb says it is=
 FP
> +         * register 33, so we recalculate the csr index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result =3D riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
> +        result =3D riscv_csrrw_debug(env, n - 33 + CSR_FFLAGS, NULL, val=
, -1);
>          if (result =3D=3D 0) {
> -            return sizeof(target_ulong);
> +            return sizeof(uint32_t);
>          }
>      }
>      return 0;
> @@ -375,20 +383,19 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -#if defined(TARGET_RISCV32)
> -    if (env->misa & RVF) {
> +
> +    if (env->misa & RVD) {
> +        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
> +                                 36, "riscv-64bit-fpu.xml", 0);
> +    } else if (env->misa & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
>                                   36, "riscv-32bit-fpu.xml", 0);
>      }
>=20=20
> +#if defined(TARGET_RISCV32)
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               4096, "riscv-32bit-csr.xml", 0);
>  #elif defined(TARGET_RISCV64)
> -    if (env->misa & RVF) {
> -        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
> -                                 36, "riscv-64bit-fpu.xml", 0);
> -    }
> -
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               4096, "riscv-64bit-csr.xml", 0);
>  #endif


--=20
Alex Benn=C3=A9e

