Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97DECD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3CO-00027h-1v; Sun, 17 Sep 2023 21:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3CM-000277-Gy; Sun, 17 Sep 2023 21:37:14 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3CJ-0000e8-M8; Sun, 17 Sep 2023 21:37:14 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4936b401599so1750440e0c.0; 
 Sun, 17 Sep 2023 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695001030; x=1695605830; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rfK4Z1tbf7T61xujtGtuB+hBhBah9IO/Nc1mMBXCCo=;
 b=A8kCocWdLYfssMyiDnZqxzbkZxUYdnKEtPQiIFomcARP4LOuIfDozgqqRS14GUu8kj
 yJwl65Xv2uyN4t/Px84aToWXixCdq05XEC85EoYz1O4Nd7mQ2dMuaMcM6p64lSv5w5I7
 sOQ1IfLLT70A9xskdDDkRrnF9GfXAsUyXlBR+C4pQJDNp3I3JrX59LAkn378nPbxHhhk
 LnSDcn3VrVrbcKQZWyamWp9ABlkQHzLlOgexZCDLZb3Q9Oxlly5NV6hraaQ+fCpRikSO
 UospuhwA4/4jPAEzW0Ch4DJ3zBu2BwBC+5uaIcljB93fO5k5FCrGMkvkPMrf+VOYxlEh
 aJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695001030; x=1695605830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rfK4Z1tbf7T61xujtGtuB+hBhBah9IO/Nc1mMBXCCo=;
 b=X41gUVAsT+FG5YiM7N/83yQAqKGMw2uCwcvLTMfk8qKRtsTpKNN81hDpDdF1/cqzs/
 EOJ6Y5UlZqFQBBaO9xbNdCU15XUx847MNBMl1HvzSZ+X1MT9/r+S4qV1wYTOvPHbqKbg
 PXAdpLGpsJK0MvYOpiYQTYDB87SjmrfaR9YQDyE7lZcQCG6UT7SoIk9jDHvuene5PEk9
 BjPrvhAqo9LYLMozThBpHQHFTPj8EUPIB0jdBTbChJiX4RY4apLDt4HLmdOJN+NGJWEo
 c4buO7zF3BuT00bMT7zgK5I166EyORLW5VfIqyedmoE1hA5QtCEi6ycNldynEYKv3hIL
 GqEg==
X-Gm-Message-State: AOJu0YzOzXd9mvUZzh3vy5pZgIZWVNJrabzCp9rdI1eYtDjEqONNicXI
 LWfhJvS1+YxyvxyBzUyF1Aa5lI9MNOrXrKxE4+6b5hVOwuY=
X-Google-Smtp-Source: AGHT+IE0c/0Z/Qos1Esu9QSn44f3u3dmvIOnd5LNOGk8ml9RuXU3pQD2m+lTXlwRT1bS+cbAxK6huqt9W4vOoPmYDWw=
X-Received: by 2002:a1f:4bc6:0:b0:495:bc5d:4e66 with SMTP id
 y189-20020a1f4bc6000000b00495bc5d4e66mr5794206vka.7.1695001030001; Sun, 17
 Sep 2023 18:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
 <20230908182640.1102270-2-baturo.alexey@gmail.com>
In-Reply-To: <20230908182640.1102270-2-baturo.alexey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:36:43 +1000
Message-ID: <CAKmqyKM67TSvsvPRCiSXcL20EbWUp5XJqsX1cPNb8rwhdCDHTg@mail.gmail.com>
Subject: Re: [RFC v1 1/8] target/riscv: Remove obsolete pointer masking
 extension code
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 zhiwei_liu@linux.alibaba.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Sat, Sep 9, 2023 at 4:28=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>

Can you add a commit message describing why the new extension is so
different that we should remove the old one?

> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.c           |  12 --
>  target/riscv/cpu.h           |  30 +---
>  target/riscv/cpu_bits.h      |  82 ---------
>  target/riscv/cpu_helper.c    |  52 ------
>  target/riscv/csr.c           | 326 -----------------------------------
>  target/riscv/machine.c       |   9 -
>  target/riscv/translate.c     |  27 +--
>  target/riscv/vector_helper.c |   2 +-
>  8 files changed, 9 insertions(+), 531 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..f937820976 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -673,13 +673,6 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
>              CSR_MSCRATCH,
>              CSR_SSCRATCH,
>              CSR_SATP,
> -            CSR_MMTE,
> -            CSR_UPMBASE,
> -            CSR_UPMMASK,
> -            CSR_SPMBASE,
> -            CSR_SPMMASK,
> -            CSR_MPMBASE,
> -            CSR_MPMMASK,
>          };
>
>          for (int i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> @@ -893,11 +886,8 @@ static void riscv_cpu_reset_hold(Object *obj)
>          }
>          i++;
>      }
> -    /* mmte is supposed to have pm.current hardwired to 1 */
> -    env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
>      env->xl =3D riscv_cpu_mxl(env);
> -    riscv_cpu_update_mask(env);
>      cs->exception_index =3D RISCV_EXCP_NONE;
>      env->load_res =3D -1;
>      set_default_nan_mode(1, &env->fp_status);
> @@ -1666,7 +1656,6 @@ static const MISAExtInfo misa_ext_info_arr[] =3D {
>      MISA_EXT_INFO(RVS, "s", "Supervisor-level instructions"),
>      MISA_EXT_INFO(RVU, "u", "User-level instructions"),
>      MISA_EXT_INFO(RVH, "h", "Hypervisor"),
> -    MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
>      MISA_EXT_INFO(RVV, "v", "Vector operations"),
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>  };
> @@ -1718,7 +1707,6 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
>      MISA_CFG(RVS, true),
>      MISA_CFG(RVU, true),
>      MISA_CFG(RVH, true),
> -    MISA_CFG(RVJ, false),
>      MISA_CFG(RVV, false),
>      MISA_CFG(RVG, false),
>  };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6ea22e0eea..62dabfa207 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -338,17 +338,6 @@ struct CPUArchState {
>      /* True if in debugger mode.  */
>      bool debugger;
>
> -    /*
> -     * CSRs for PointerMasking extension
> -     */
> -    target_ulong mmte;
> -    target_ulong mpmmask;
> -    target_ulong mpmbase;
> -    target_ulong spmmask;
> -    target_ulong spmbase;
> -    target_ulong upmmask;
> -    target_ulong upmbase;
> -
>      /* CSRs for execution enviornment configuration */
>      uint64_t menvcfg;
>      uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> @@ -357,8 +346,6 @@ struct CPUArchState {
>      target_ulong senvcfg;
>      uint64_t henvcfg;
>  #endif
> -    target_ulong cur_pmmask;
> -    target_ulong cur_pmbase;
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> @@ -495,17 +482,14 @@ FIELD(TB_FLAGS, VILL, 14, 1)
>  FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
>  /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
>  FIELD(TB_FLAGS, XL, 16, 2)
> -/* If PointerMasking should be applied */
> -FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
> -FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
> -FIELD(TB_FLAGS, VTA, 20, 1)
> -FIELD(TB_FLAGS, VMA, 21, 1)
> +FIELD(TB_FLAGS, VTA, 18, 1)
> +FIELD(TB_FLAGS, VMA, 19, 1)
>  /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 22, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 20, 1)
>  /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> -FIELD(TB_FLAGS, PRIV, 24, 2)
> -FIELD(TB_FLAGS, AXL, 26, 2)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> +FIELD(TB_FLAGS, PRIV, 22, 2)
> +FIELD(TB_FLAGS, AXL, 24, 2)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> @@ -632,8 +616,6 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, =
target_ulong vtype)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                            uint64_t *cs_base, uint32_t *pflags);
>
> -void riscv_cpu_update_mask(CPURISCVState *env);
> -
>  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value,
>                             target_ulong new_value, target_ulong write_ma=
sk);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 59f0ffd9e1..87a741fe66 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -491,37 +491,6 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> -/*
> - * User PointerMasking registers
> - * NB: actual CSR numbers might be changed in future
> - */
> -#define CSR_UMTE            0x4c0
> -#define CSR_UPMMASK         0x4c1
> -#define CSR_UPMBASE         0x4c2
> -
> -/*
> - * Machine PointerMasking registers
> - * NB: actual CSR numbers might be changed in future
> - */
> -#define CSR_MMTE            0x3c0
> -#define CSR_MPMMASK         0x3c1
> -#define CSR_MPMBASE         0x3c2
> -
> -/*
> - * Supervisor PointerMaster registers
> - * NB: actual CSR numbers might be changed in future
> - */
> -#define CSR_SMTE            0x1c0
> -#define CSR_SPMMASK         0x1c1
> -#define CSR_SPMBASE         0x1c2
> -
> -/*
> - * Hypervisor PointerMaster registers
> - * NB: actual CSR numbers might be changed in future
> - */
> -#define CSR_VSMTE           0x2c0
> -#define CSR_VSPMMASK        0x2c1
> -#define CSR_VSPMBASE        0x2c2
>  #define CSR_SCOUNTOVF       0xda0
>
>  /* Crypto Extension */
> @@ -772,57 +741,6 @@ typedef enum RISCVException {
>  #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>  #define HENVCFGH_STCE                       MENVCFGH_STCE
>
> -/* Offsets for every pair of control bits per each priv level */
> -#define XS_OFFSET    0ULL
> -#define U_OFFSET     2ULL
> -#define S_OFFSET     5ULL
> -#define M_OFFSET     8ULL
> -
> -#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
> -#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
> -#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
> -#define U_PM_INSN    (PM_INSN    << U_OFFSET)
> -#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
> -#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
> -#define S_PM_INSN    (PM_INSN    << S_OFFSET)
> -#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
> -#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
> -#define M_PM_INSN    (PM_INSN    << M_OFFSET)
> -
> -/* mmte CSR bits */
> -#define MMTE_PM_XS_BITS     PM_XS_BITS
> -#define MMTE_U_PM_ENABLE    U_PM_ENABLE
> -#define MMTE_U_PM_CURRENT   U_PM_CURRENT
> -#define MMTE_U_PM_INSN      U_PM_INSN
> -#define MMTE_S_PM_ENABLE    S_PM_ENABLE
> -#define MMTE_S_PM_CURRENT   S_PM_CURRENT
> -#define MMTE_S_PM_INSN      S_PM_INSN
> -#define MMTE_M_PM_ENABLE    M_PM_ENABLE
> -#define MMTE_M_PM_CURRENT   M_PM_CURRENT
> -#define MMTE_M_PM_INSN      M_PM_INSN
> -#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_I=
NSN | \
> -                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_I=
NSN | \
> -                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_I=
NSN | \
> -                      MMTE_PM_XS_BITS)
> -
> -/* (v)smte CSR bits */
> -#define SMTE_PM_XS_BITS     PM_XS_BITS
> -#define SMTE_U_PM_ENABLE    U_PM_ENABLE
> -#define SMTE_U_PM_CURRENT   U_PM_CURRENT
> -#define SMTE_U_PM_INSN      U_PM_INSN
> -#define SMTE_S_PM_ENABLE    S_PM_ENABLE
> -#define SMTE_S_PM_CURRENT   S_PM_CURRENT
> -#define SMTE_S_PM_INSN      S_PM_INSN
> -#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_I=
NSN | \
> -                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_I=
NSN | \
> -                      SMTE_PM_XS_BITS)
> -
> -/* umte CSR bits */
> -#define UMTE_U_PM_ENABLE    U_PM_ENABLE
> -#define UMTE_U_PM_CURRENT   U_PM_CURRENT
> -#define UMTE_U_PM_INSN      U_PM_INSN
> -#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_=
INSN)
> -
>  /* MISELECT, SISELECT, and VSISELECT bits (AIA) */
>  #define ISELECT_IPRIO0                     0x30
>  #define ISELECT_IPRIO15                    0x3f
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9f611d89bb..57859314e3 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -136,61 +136,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr=
 *pc,
>      flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> -    if (env->cur_pmmask !=3D 0) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> -    }
> -    if (env->cur_pmbase !=3D 0) {
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
> -    }
>
>      *pflags =3D flags;
>  }
>
> -void riscv_cpu_update_mask(CPURISCVState *env)
> -{
> -    target_ulong mask =3D 0, base =3D 0;
> -    RISCVMXL xl =3D env->xl;
> -    /*
> -     * TODO: Current RVJ spec does not specify
> -     * how the extension interacts with XLEN.
> -     */
> -#ifndef CONFIG_USER_ONLY
> -    int mode =3D cpu_address_mode(env);
> -    xl =3D cpu_get_xl(env, mode);
> -    if (riscv_has_ext(env, RVJ)) {
> -        switch (mode) {
> -        case PRV_M:
> -            if (env->mmte & M_PM_ENABLE) {
> -                mask =3D env->mpmmask;
> -                base =3D env->mpmbase;
> -            }
> -            break;
> -        case PRV_S:
> -            if (env->mmte & S_PM_ENABLE) {
> -                mask =3D env->spmmask;
> -                base =3D env->spmbase;
> -            }
> -            break;
> -        case PRV_U:
> -            if (env->mmte & U_PM_ENABLE) {
> -                mask =3D env->upmmask;
> -                base =3D env->upmbase;
> -            }
> -            break;
> -        default:
> -            g_assert_not_reached();
> -        }
> -    }
> -#endif
> -    if (xl =3D=3D MXL_RV32) {
> -        env->cur_pmmask =3D mask & UINT32_MAX;
> -        env->cur_pmbase =3D base & UINT32_MAX;
> -    } else {
> -        env->cur_pmmask =3D mask;
> -        env->cur_pmbase =3D base;
> -    }
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>
>  /*
> @@ -678,7 +627,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ul=
ong newpriv)
>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>      env->priv =3D newpriv;
>      env->xl =3D cpu_recompute_xl(env);
> -    riscv_cpu_update_mask(env);
>
>      /*
>       * Clear the load reservation - otherwise a reservation placed in on=
e
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..a08285e55d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -477,16 +477,6 @@ static RISCVException hgatp(CPURISCVState *env, int =
csrno)
>      return hmode(env, csrno);
>  }
>
> -/* Checks if PointerMasking registers could be accessed */
> -static RISCVException pointer_masking(CPURISCVState *env, int csrno)
> -{
> -    /* Check if j-ext is present */
> -    if (riscv_has_ext(env, RVJ)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -    return RISCV_EXCP_ILLEGAL_INST;
> -}
> -
>  static int aia_hmode(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> @@ -1331,7 +1321,6 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>          env->xl =3D cpu_recompute_xl(env);
>      }
>
> -    riscv_cpu_update_mask(env);
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -3497,302 +3486,6 @@ static RISCVException read_tinfo(CPURISCVState *e=
nv, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -/*
> - * Functions to access Pointer Masking feature registers
> - * We have to check if current priv lvl could modify
> - * csr in given mode
> - */
> -static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
> -{
> -    int csr_priv =3D get_field(csrno, 0x300);
> -    int pm_current;
> -
> -    if (env->debugger) {
> -        return false;
> -    }
> -    /*
> -     * If priv lvls differ that means we're accessing csr from higher pr=
iv lvl,
> -     * so allow the access
> -     */
> -    if (env->priv !=3D csr_priv) {
> -        return false;
> -    }
> -    switch (env->priv) {
> -    case PRV_M:
> -        pm_current =3D get_field(env->mmte, M_PM_CURRENT);
> -        break;
> -    case PRV_S:
> -        pm_current =3D get_field(env->mmte, S_PM_CURRENT);
> -        break;
> -    case PRV_U:
> -        pm_current =3D get_field(env->mmte, U_PM_CURRENT);
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    /* It's same priv lvl, so we allow to modify csr only if pm.current=
=3D=3D1 */
> -    return !pm_current;
> -}
> -
> -static RISCVException read_mmte(CPURISCVState *env, int csrno,
> -                                target_ulong *val)
> -{
> -    *val =3D env->mmte & MMTE_MASK;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_mmte(CPURISCVState *env, int csrno,
> -                                 target_ulong val)
> -{
> -    uint64_t mstatus;
> -    target_ulong wpri_val =3D val & MMTE_MASK;
> -
> -    if (val !=3D wpri_val) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> -                      TARGET_FMT_lx "\n", "MMTE: WPRI violation written =
0x",
> -                      val, "vs expected 0x", wpri_val);
> -    }
> -    /* for machine mode pm.current is hardwired to 1 */
> -    wpri_val |=3D MMTE_M_PM_CURRENT;
> -
> -    /* hardwiring pm.instruction bit to 0, since it's not supported yet =
*/
> -    wpri_val &=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> -    env->mmte =3D wpri_val | EXT_STATUS_DIRTY;
> -    riscv_cpu_update_mask(env);
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_smte(CPURISCVState *env, int csrno,
> -                                target_ulong *val)
> -{
> -    *val =3D env->mmte & SMTE_MASK;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_smte(CPURISCVState *env, int csrno,
> -                                 target_ulong val)
> -{
> -    target_ulong wpri_val =3D val & SMTE_MASK;
> -
> -    if (val !=3D wpri_val) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> -                      TARGET_FMT_lx "\n", "SMTE: WPRI violation written =
0x",
> -                      val, "vs expected 0x", wpri_val);
> -    }
> -
> -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    wpri_val |=3D (env->mmte & ~SMTE_MASK);
> -    write_mmte(env, csrno, wpri_val);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_umte(CPURISCVState *env, int csrno,
> -                                target_ulong *val)
> -{
> -    *val =3D env->mmte & UMTE_MASK;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_umte(CPURISCVState *env, int csrno,
> -                                 target_ulong val)
> -{
> -    target_ulong wpri_val =3D val & UMTE_MASK;
> -
> -    if (val !=3D wpri_val) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> -                      TARGET_FMT_lx "\n", "UMTE: WPRI violation written =
0x",
> -                      val, "vs expected 0x", wpri_val);
> -    }
> -
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    wpri_val |=3D (env->mmte & ~UMTE_MASK);
> -    write_mmte(env, csrno, wpri_val);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->mpmmask;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    env->mpmmask =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE=
)) {
> -        env->cur_pmmask =3D val;
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_spmmask(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->spmmask;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_spmmask(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -    env->spmmask =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE=
)) {
> -        env->cur_pmmask =3D val;
> -        if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV32) {
> -            env->cur_pmmask &=3D UINT32_MAX;
> -        }
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_upmmask(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->upmmask;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_upmmask(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -    env->upmmask =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE=
)) {
> -        env->cur_pmmask =3D val;
> -        if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV32) {
> -            env->cur_pmmask &=3D UINT32_MAX;
> -        }
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->mpmbase;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    env->mpmbase =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE=
)) {
> -        env->cur_pmbase =3D val;
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_spmbase(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->spmbase;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_spmbase(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -    env->spmbase =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE=
)) {
> -        env->cur_pmbase =3D val;
> -        if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV32) {
> -            env->cur_pmbase &=3D UINT32_MAX;
> -        }
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_upmbase(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> -{
> -    *val =3D env->upmbase;
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException write_upmbase(CPURISCVState *env, int csrno,
> -                                    target_ulong val)
> -{
> -    uint64_t mstatus;
> -
> -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> -    if (check_pm_current_disabled(env, csrno)) {
> -        return RISCV_EXCP_NONE;
> -    }
> -    env->upmbase =3D val;
> -    if ((cpu_address_mode(env) =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE=
)) {
> -        env->cur_pmbase =3D val;
> -        if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV32) {
> -            env->cur_pmbase &=3D UINT32_MAX;
> -        }
> -    }
> -    env->mmte |=3D EXT_STATUS_DIRTY;
> -
> -    /* Set XS and SD bits, since PM CSRs are dirty */
> -    mstatus =3D env->mstatus | MSTATUS_XS;
> -    write_mstatus(env, csrno, mstatus);
> -    return RISCV_EXCP_NONE;
> -}
> -
>  #endif
>
>  /* Crypto Extension */
> @@ -4393,25 +4086,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata  =
 },
>      [CSR_TINFO]     =3D  { "tinfo",   debug, read_tinfo,   write_ignore =
 },
>
> -    /* User Pointer Masking */
> -    [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,  write=
_umte },
> -    [CSR_UPMMASK] =3D    { "upmmask", pointer_masking, read_upmmask,
> -                         write_upmmask                                  =
    },
> -    [CSR_UPMBASE] =3D    { "upmbase", pointer_masking, read_upmbase,
> -                         write_upmbase                                  =
    },
> -    /* Machine Pointer Masking */
> -    [CSR_MMTE]    =3D    { "mmte",    pointer_masking, read_mmte,  write=
_mmte },
> -    [CSR_MPMMASK] =3D    { "mpmmask", pointer_masking, read_mpmmask,
> -                         write_mpmmask                                  =
    },
> -    [CSR_MPMBASE] =3D    { "mpmbase", pointer_masking, read_mpmbase,
> -                         write_mpmbase                                  =
    },
> -    /* Supervisor Pointer Masking */
> -    [CSR_SMTE]    =3D    { "smte",    pointer_masking, read_smte,  write=
_smte },
> -    [CSR_SPMMASK] =3D    { "spmmask", pointer_masking, read_spmmask,
> -                         write_spmmask                                  =
    },
> -    [CSR_SPMBASE] =3D    { "spmbase", pointer_masking, read_spmbase,
> -                         write_spmbase                                  =
    },
> -
>      /* Performance Counters */
>      [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_hpmcounter=
 },
>      [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_hpmcounter=
 },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c7c862cdd3..8b1a109275 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -161,14 +161,6 @@ static const VMStateDescription vmstate_pointermaski=
ng =3D {
>      .minimum_version_id =3D 1,

You need to bump the version_id as well

Alistair

>      .needed =3D pointermasking_needed,
>      .fields =3D (VMStateField[]) {
> -        VMSTATE_UINTTL(env.mmte, RISCVCPU),
> -        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
> -        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
> -        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
> -        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
> -        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
> -        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
> -
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -264,7 +256,6 @@ static int riscv_cpu_post_load(void *opaque, int vers=
ion_id)
>      CPURISCVState *env =3D &cpu->env;
>
>      env->xl =3D cpu_recompute_xl(env);
> -    riscv_cpu_update_mask(env);
>      return 0;
>  }
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 697df1be9e..ce47904590 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -42,9 +42,6 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, =
cpu_vstart;
>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> -/* globals for PM CSRs */
> -static TCGv pm_mask;
> -static TCGv pm_base;
>
>  /*
>   * If an operation is being performed on less than TARGET_LONG_BITS,
> @@ -106,9 +103,6 @@ typedef struct DisasContext {
>      bool vl_eq_vlmax;
>      CPUState *cs;
>      TCGv zero;
> -    /* PointerMasking extension */
> -    bool pm_mask_enabled;
> -    bool pm_base_enabled;
>      /* Use icount trigger for native debug */
>      bool itrigger;
>      /* FRM is known to contain a valid value. */
> @@ -582,14 +576,9 @@ static TCGv get_address(DisasContext *ctx, int rs1, =
int imm)
>      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
>
>      tcg_gen_addi_tl(addr, src1, imm);
> -    if (ctx->pm_mask_enabled) {
> -        tcg_gen_andc_tl(addr, addr, pm_mask);
> -    } else if (get_address_xl(ctx) =3D=3D MXL_RV32) {
> +    if (get_address_xl(ctx) =3D=3D MXL_RV32) {
>          tcg_gen_ext32u_tl(addr, addr);
>      }
> -    if (ctx->pm_base_enabled) {
> -        tcg_gen_or_tl(addr, addr, pm_base);
> -    }
>
>      return addr;
>  }
> @@ -601,14 +590,9 @@ static TCGv get_address_indexed(DisasContext *ctx, i=
nt rs1, TCGv offs)
>      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
>
>      tcg_gen_add_tl(addr, src1, offs);
> -    if (ctx->pm_mask_enabled) {
> -        tcg_gen_andc_tl(addr, addr, pm_mask);
> -    } else if (get_xl(ctx) =3D=3D MXL_RV32) {
> +    if (get_xl(ctx) =3D=3D MXL_RV32) {
>          tcg_gen_ext32u_tl(addr, addr);
>      }
> -    if (ctx->pm_base_enabled) {
> -        tcg_gen_or_tl(addr, addr, pm_base);
> -    }
>      return addr;
>  }
>
> @@ -1191,8 +1175,6 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->address_xl =3D FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>      ctx->cs =3D cs;
> -    ctx->pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENAB=
LED);
> -    ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENAB=
LED);
>      ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero =3D tcg_constant_tl(0);
>      ctx->virt_inst_excp =3D false;
> @@ -1324,9 +1306,4 @@ void riscv_translate_init(void)
>                               "load_res");
>      load_val =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, loa=
d_val),
>                               "load_val");
> -    /* Assign PM CSRs to tcg globals */
> -    pm_mask =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_=
pmmask),
> -                                 "pmmask");
> -    pm_base =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_=
pmbase),
> -                                 "pmbase");
>  }
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 4d06754826..af07e1067d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -169,7 +169,7 @@ static inline uint32_t vext_get_total_elems(CPURISCVS=
tate *env, uint32_t desc,
>
>  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong =
addr)
>  {
> -    return (addr & ~env->cur_pmmask) | env->cur_pmbase;
> +    return addr;
>  }
>
>  /*
> --
> 2.34.1
>
>

