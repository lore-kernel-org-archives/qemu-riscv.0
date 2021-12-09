Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mv856-000898-1y
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 20:18:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mv851-000887-Sn; Wed, 08 Dec 2021 20:18:41 -0500
Received: from [2607:f8b0:4864:20::d31] (port=36681
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mv84z-0007Rm-JS; Wed, 08 Dec 2021 20:18:39 -0500
Received: by mail-io1-xd31.google.com with SMTP id p65so4941108iof.3;
 Wed, 08 Dec 2021 17:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l/XZ+qUZ+Ff7TjK87cm06BIHhm8XHmC221hoV0PUP60=;
 b=j8Nlzn3le283QqeCBAghe80cxkKFk1TD1r5d+5O7yFVVk/9WOiQuOYbBYVFoh4K1B/
 gWcAQPZXZxrxNwYAxWx+esxT8k2WPHpuCmn858q6L6hkVMLfUYUKcNNQU8o/Z9Wx+VlT
 v0iu+qf9cBPl3A9SdH8xV9ivmbaJ53XVQBnnG91KUJNqVeqkNpeICoP1OcCBNvnHxPTd
 0mCakwL42dTtvaatJpQ1y6Mt4gZrrqhkcfsWcaaCudm9+w2e92/R/J2vG0NexD9YBWZv
 rtBktOlPrQpKTUE5FJI/Pa/CK5H/MaLV/6dYG9Nwyo4Y7KXf+8kQ73gfY/OuWbQ/q/4C
 AhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l/XZ+qUZ+Ff7TjK87cm06BIHhm8XHmC221hoV0PUP60=;
 b=UvjBtEXfCQwyRCbr8/pHg6Hq0V/GQHwFNuTdgNivQz7gk1auSiPaPKmyttDmTiOWOP
 0olQgTz07MeSmkAeObFE0gDQNhXFyyDYhUD9w78ZuC1Q0YUzY26Qf1Fppf4+mt6Awz8q
 rkiaqoZR7MESGo5lZ4gmS1iwCZ7RwkyWixt4dPEZ3xgFlzzBH1rgoDkWEC+ZGgM3t32+
 p120qEMPHULobOgOVLFSAQdIeT4Gatg34xSG5sOXcbcVC84zw/DS9r2OuP8fV2bwT0kb
 FPddXcx+FamElbm2SWqLdF/GKZgtd8muFtcZIriRQ6KJpSQEWtTLwZLNjdYgjixXQwll
 KNdQ==
X-Gm-Message-State: AOAM533XIrG3I/ZoHWtUQ9GC1/+AQ8d8xMfRubhWTWRpTYUMu+mgX5ub
 OAV4bOGyrG06uQkw4Je9BH6qPVzPnGFU/NGs2vI=
X-Google-Smtp-Source: ABdhPJz39L0Q3/DgocJ/qD0Z7V1PZPAKN9c/L/WE/VADp3DyFOjbffAMm8klIprzLZaJgOJ9ZGdM8od3ydijQzstybI=
X-Received: by 2002:a05:6638:d84:: with SMTP id
 l4mr4855756jaj.18.1639012714300; 
 Wed, 08 Dec 2021 17:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-8-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211128135719.50444-8-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Dec 2021 11:18:08 +1000
Message-ID: <CAKmqyKO=DPD5jKHd79zZuGMr=KO_xKBjsT_d97Cr+GK=v_5Y4Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] target/riscv: setup everything for rv64 to
 support rv128 execution
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 09 Dec 2021 01:18:42 -0000

On Mon, Nov 29, 2021 at 12:08 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This patch adds the support of the '-cpu rv128' option to
> qemu-system-riscv64 so that we can indicate that we want to run rv128
> executables.
> Still, there is no support for 128-bit insns at that stage so qemu fails
> miserably (as expected) if launched with this option.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/disas/dis-asm.h |  1 +
>  target/riscv/cpu.h      |  1 +
>  disas/riscv.c           |  5 +++++
>  target/riscv/cpu.c      | 20 ++++++++++++++++++++
>  target/riscv/gdbstub.c  |  5 +++++
>  5 files changed, 32 insertions(+)
>
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 08e1beec85..102a1e7f50 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
>  int print_insn_xtensa           (bfd_vma, disassemble_info*);
>  int print_insn_riscv32          (bfd_vma, disassemble_info*);
>  int print_insn_riscv64          (bfd_vma, disassemble_info*);
> +int print_insn_riscv128         (bfd_vma, disassemble_info*);
>  int print_insn_rx(bfd_vma, disassemble_info *);
>  int print_insn_hexagon(bfd_vma, disassemble_info *);
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 53a295efb7..cbd4daa6d9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -38,6 +38,7 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 793ad14c27..03c8dc9961 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -3090,3 +3090,8 @@ int print_insn_riscv64(bfd_vma memaddr, struct disa=
ssemble_info *info)
>  {
>      return print_insn_riscv(memaddr, info, rv64);
>  }
> +
> +int print_insn_riscv128(bfd_vma memaddr, struct disassemble_info *info)
> +{
> +    return print_insn_riscv(memaddr, info, rv128);
> +}
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 364140f5ff..7f5370f2b2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -178,6 +178,19 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +
> +static void rv128_base_cpu_init(Object *obj)
> +{
> +    if (qemu_tcg_mttcg_enabled()) {
> +        /* Missing 128-bit aligned atomics */
> +        error_report("128-bit RISC-V currently does not work with Multi =
"
> +                     "Threaded TCG. Please use: -accel tcg,thread=3Dsing=
le");
> +        exit(EXIT_FAILURE);
> +    }
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    /* We set this in the realise function */
> +    set_misa(env, MXL_RV128, 0);
> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -402,6 +415,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>      case MXL_RV64:
>          info->print_insn =3D print_insn_riscv64;
>          break;
> +    case MXL_RV128:
> +        info->print_insn =3D print_insn_riscv128;
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -464,6 +480,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
>  #ifdef TARGET_RISCV64
>      case MXL_RV64:
>          break;
> +    case MXL_RV128:
> +        break;
>  #endif
>      case MXL_RV32:
>          break;
> @@ -670,6 +688,7 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
>      case MXL_RV32:
>          return g_strdup("riscv:rv32");
>      case MXL_RV64:
> +    case MXL_RV128:
>          return g_strdup("riscv:rv64");
>      default:
>          g_assert_not_reached();
> @@ -822,6 +841,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 23429179e2..2fbdcc5879 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -164,6 +164,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, i=
nt base_reg)
>      int bitsize =3D 16 << env->misa_mxl_max;
>      int i;
>
> +    /* Until gdb knows about 128-bit registers */
> +    if (bitsize > 64) {
> +        bitsize =3D 64;
> +    }
> +
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd=
\">");
>      g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.csr\"=
>");
> --
> 2.34.0
>
>

