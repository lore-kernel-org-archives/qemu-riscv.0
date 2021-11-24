Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mplWP-0007Ht-RT
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 01:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplWO-0007HU-21; Wed, 24 Nov 2021 01:12:44 -0500
Received: from [2607:f8b0:4864:20::d32] (port=45681
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplWL-0008UD-TS; Wed, 24 Nov 2021 01:12:43 -0500
Received: by mail-io1-xd32.google.com with SMTP id v23so1752655iom.12;
 Tue, 23 Nov 2021 22:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2VI9lKnA4myt6oP0h5AtnfGHzTy3+c7YL6kEFApPX7Q=;
 b=CbePO3nfTkZBPFxjqbTPV/lqeKPQPTRDbRcGjkqHkyEJss4x5aS0eICmcsDRjt4iTW
 ONl//lliWHTbZGBDj/Tf52ttZnd8ZJeMRosrUZ4Qbq/9gmw1o0lOT6fKgKRzvjPa3BFn
 ceOgJ1CkedXI0SIrDeRBf74KfXtJYc0x/fA+M52hmuzjCJNIIPuuJCHTt1HyDQV/S907
 a41w5RvjLIUq7nDPWW7LE1nguKcbRrlLA9EBhlqK5q4p7qtMdvQG4Dz19l9xh/O5vO/P
 dX72TEyZrkDa1n/I29x6q4uIiJWDitq7lbemfFNuxpcH9CEqcQ/tZL7+JownKAi0TrGD
 AEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2VI9lKnA4myt6oP0h5AtnfGHzTy3+c7YL6kEFApPX7Q=;
 b=zcvUgpl4txwadah+n5K5gYzdgbWsU9qg+E+TtRny4U7JBr4m4rzXYEdugFlHQmlZoA
 hhk/L/6roikaCk7eHOGUkY5vxVurrOuniErWzEQU5wpDgGEBZ1Uc5HuaN9LKBWRqEk4P
 KqQRTk+txX7qqn/QCnKAUgMw8XoMGNJvcHezpfR/rDMx5WLnREBfgYJsbxEYRDZhTRxZ
 ZQaorJaMxJbVyofoFuxMx6eKvZft+NQQVdO3JR+4asTq72Xk6Xs81P74Mjx2SI4kHeyt
 jKXJ/fyk3jxOWBHpjpt+cZ580UIp5axhsIYQA6mVbgeosoR5XFBuv3G7QvNObjMqzHx0
 Aj7w==
X-Gm-Message-State: AOAM5332NEWTnERRNQleLy5N6KUC/1cb/UaveofSG+imOFk46fFOBB0v
 L4t+SHBsmxwq7gYOBzk5s004OwbGI/ZSLAVS/zs=
X-Google-Smtp-Source: ABdhPJwmiQ1AREKmpmJ1pAhelPujFeSQlMmIBEN+oFJmpYfmJs7kZzhFO9l7cGph3OYkxz1t3XEtQC6XaBDRp6ORWXg=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr11628565ioc.187.1637734359740; 
 Tue, 23 Nov 2021 22:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-8-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-8-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Nov 2021 16:12:13 +1000
Message-ID: <CAKmqyKM_6QH40iesGaCYLxWHzRyfoFACEH+eiOY-_YQTpeo=nw@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] target/riscv: setup everything so that
 riscv128-softmmu compiles
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Wed, 24 Nov 2021 06:12:44 -0000

On Sat, Nov 13, 2021 at 1:16 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This patch is kind of a mess because several files have to be slightly
> modified to allow for a new target. In the current status, we have done
> our best to have RV64 and RV128 under the same RV64 umbrella, but there
> is still work to do to have a single executable for both.
> In particular, we have no atomic accesses for aligned 128-bit addresses.
>
> Once this patch applied, adding risc128-sofmmu to --target-list produces
> a (no so useful yet) executable.

I can't remember if we discussed this before, but do we need the
riscv128-sofmmu executable? Can we instead just use a riscv64-sofmmu
executable?

Alistair

>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  configs/devices/riscv128-softmmu/default.mak | 17 +++++++++++++++
>  configs/targets/riscv128-softmmu.mak         |  6 ++++++
>  include/disas/dis-asm.h                      |  1 +
>  include/hw/riscv/sifive_cpu.h                |  3 +++
>  target/riscv/cpu-param.h                     |  5 +++++
>  target/riscv/cpu.h                           |  3 +++
>  disas/riscv.c                                |  5 +++++
>  target/riscv/cpu.c                           | 22 ++++++++++++++++++--
>  target/riscv/gdbstub.c                       |  8 +++++++
>  target/riscv/insn_trans/trans_rvd.c.inc      | 12 +++++------
>  target/riscv/insn_trans/trans_rvf.c.inc      |  6 +++---
>  target/riscv/Kconfig                         |  3 +++
>  12 files changed, 80 insertions(+), 11 deletions(-)
>  create mode 100644 configs/devices/riscv128-softmmu/default.mak
>  create mode 100644 configs/targets/riscv128-softmmu.mak
>
> diff --git a/configs/devices/riscv128-softmmu/default.mak b/configs/devic=
es/riscv128-softmmu/default.mak
> new file mode 100644
> index 0000000000..e838f35785
> --- /dev/null
> +++ b/configs/devices/riscv128-softmmu/default.mak
> @@ -0,0 +1,17 @@
> +# Default configuration for riscv128-softmmu
> +
> +# Uncomment the following lines to disable these optional devices:
> +#
> +#CONFIG_PCI_DEVICES=3Dn
> +# No does not seem to be an option for these two parameters
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
> index 0000000000..d812cc1c80
> --- /dev/null
> +++ b/configs/targets/riscv128-softmmu.mak
> @@ -0,0 +1,6 @@
> +TARGET_ARCH=3Driscv128
> +TARGET_BASE_ARCH=3Driscv
> +# As long as we have no atomic accesses for aligned 128-bit addresses
> +TARGET_SUPPORTS_MTTCG=3Dn
> +TARGET_XML_FILES=3Dgdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.x=
ml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
> +TARGET_NEED_FDT=3Dy
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
> diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.=
h
> index 136799633a..64078feba8 100644
> --- a/include/hw/riscv/sifive_cpu.h
> +++ b/include/hw/riscv/sifive_cpu.h
> @@ -26,6 +26,9 @@
>  #elif defined(TARGET_RISCV64)
>  #define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
>  #define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
> +#else
> +#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
> +#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
>  #endif
>
>  #endif /* HW_SIFIVE_CPU_H */
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index 80eb615f93..c10459b56f 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -16,6 +16,11 @@
>  # define TARGET_LONG_BITS 32
>  # define TARGET_PHYS_ADDR_SPACE_BITS 34 /* 22-bit PPN */
>  # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
> +#else
> +/* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 6=
4 */
> +# define TARGET_LONG_BITS 64
> +# define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
> +# define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
>  #endif
>  #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
>  /*
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 53a295efb7..8ff5b08d15 100644
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
> @@ -50,6 +51,8 @@
>  # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
>  #elif defined(TARGET_RISCV64)
>  # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
> +#else
> +# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE128
>  #endif
>
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
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
> index 364140f5ff..292c916f46 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -152,6 +152,8 @@ static void riscv_any_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +#else
> +    set_misa(env, MXL_RV128, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>  }
> @@ -178,7 +180,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> -#else
> +#elif defined(TARGET_RISCV32)
>  static void rv32_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> @@ -218,6 +220,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +#else
> +static void rv128_base_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    /* We set this in the realise function */
> +    set_misa(env, MXL_RV128, 0);
> +}
>  #endif
>
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
> @@ -402,6 +411,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
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
> @@ -464,6 +476,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
>  #ifdef TARGET_RISCV64
>      case MXL_RV64:
>          break;
> +#elif !defined(TARGET_RISCV32)
> +    case MXL_RV128:
> +        break;
>  #endif
>      case MXL_RV32:
>          break;
> @@ -670,6 +685,7 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
>      case MXL_RV32:
>          return g_strdup("riscv:rv32");
>      case MXL_RV64:
> +    case MXL_RV128:
>          return g_strdup("riscv:rv64");
>      default:
>          g_assert_not_reached();
> @@ -733,7 +749,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      cc->gdb_num_core_regs =3D 33;
>  #if defined(TARGET_RISCV32)
>      cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> -#elif defined(TARGET_RISCV64)
> +#else
>      cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
>  #endif
>      cc->gdb_stop_before_watchpoint =3D true;
> @@ -822,6 +838,8 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> +#else
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 23429179e2..7672ae123f 100644
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
> @@ -204,6 +209,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>  #elif defined(TARGET_RISCV64)
>      gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_vi=
rtual,
>                               1, "riscv-64bit-virtual.xml", 0);
> +#else
> +    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_vi=
rtual,
> +                             1, "riscv-64bit-virtual.xml", 0);
>  #endif
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
> index ed444b042a..c8848bf300 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -395,11 +395,11 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fm=
v_x_d *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -#ifdef TARGET_RISCV64
> +#ifdef TARGET_RISCV32
> +    qemu_build_not_reached();
> +#else
>      gen_set_gpr(ctx, a->rd, cpu_fpr[a->rs1]);
>      return true;
> -#else
> -    qemu_build_not_reached();
>  #endif
>  }
>
> @@ -439,11 +439,11 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fm=
v_d_x *a)
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
>
> -#ifdef TARGET_RISCV64
> +#ifdef TARGET_RISCV32
> +    qemu_build_not_reached();
> +#else
>      tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
>      mark_fs_dirty(ctx);
>      return true;
> -#else
> -    qemu_build_not_reached();
>  #endif
>  }
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
> index b5459249c4..fa4681fb21 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -313,10 +313,10 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fm=
v_x_w *a)
>
>      TCGv dest =3D dest_gpr(ctx, a->rd);
>
> -#if defined(TARGET_RISCV64)
> -    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
> -#else
> +#if defined(TARGET_RISCV32)
>      tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
> +#else
> +    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
>  #endif
>
>      gen_set_gpr(ctx, a->rd, dest);
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
> --
> 2.33.1
>
>

