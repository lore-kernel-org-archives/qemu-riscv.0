Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68931C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcNs-0006Eb-De; Fri, 05 Jan 2024 00:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcNr-0006EH-6N; Fri, 05 Jan 2024 00:04:39 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcNn-0007KY-24; Fri, 05 Jan 2024 00:04:38 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7ccdb4b764cso436240241.2; 
 Thu, 04 Jan 2024 21:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431074; x=1705035874; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzOwp5RD3IFMung121Y+a3IHvt950W9NfCyoMu6JMZE=;
 b=GEM+b+77eejnuj2n0JgKhTeYWnq8+DZZL5mappyE9gBVH4Vp8ue28gGNi3a0ZSyhcM
 /d7Dmklxxy5wQc3xKTRpM+qmy0k1FHeRPPK0lbv1a9Lq6ImGCwmxRYJA5ZAuyUvSfvQo
 iuTFKE1AvIYihJsRlM96u74g749qKwu09cC0i3ycAcpsQMYEYgMmuc2ZIjptXP/YLip2
 5XrKjSEGq7A/FtmScBRjl26T747YolalrdZ8M0AJX9jI/FYfdeLrIZ/870T+8nvcwP7W
 ooE3tiJSGGm3ozlR9QnrpEjgmgEiW6HaupxraISnEg+OViy4wgx7QhfI8o23ta/G02bF
 COLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431074; x=1705035874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzOwp5RD3IFMung121Y+a3IHvt950W9NfCyoMu6JMZE=;
 b=EcPLB6LkSFIETjqqq9vi/4Xck6PzxGP63+txKS5zHPe+3+Rly9al+2rrOwdhqf1JdV
 IE1buDFsgoRNLjsfsDREwDAaoZB+5yLeoqyrGuJAEFLoi7FWS5WJOjsXmyxRPeQJsPFF
 T7Z764HFs7gNdTrLwI3W6AUnoUwMZJux0XS/rSrjY4JcyhIMDTj/2CxL+cvI4VTM+UWP
 Yrz2CQuKiaAvdyZkNvUUjXGDX37SBLJK5oFleNF0n6SwjEDRz1SQFQR7BAOPAPwWGCNP
 GeqHx9mOz3sL2mzGnycTeHQzxwFvfF1hcszORXgU7e07JPEe7w4EFF0gOXZXCagiwK4s
 Pz6Q==
X-Gm-Message-State: AOJu0YymE+jqAFQpr0ai8qJHhkMHdL77NOfm3xvkoiiPI1yLEfs+fpZ8
 L6+1EERjTGJ4JmxFHSbBoFT3L41TLXt93I2OoJamY5ZsTrk=
X-Google-Smtp-Source: AGHT+IFOqbhbTghe78RL5gAi/aEChahLhukizM0Iqdf3WtPs6qDNzaaS4L1gxV8f+CoVePARzi2MM9Cq2aa4M+Jdbwg=
X-Received: by 2002:a05:6102:3713:b0:467:759f:b00b with SMTP id
 s19-20020a056102371300b00467759fb00bmr1726814vst.5.1704431073684; Thu, 04 Jan
 2024 21:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-2-me@deliversmonkey.space>
In-Reply-To: <20240103185716.1790546-2-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:04:07 +1000
Message-ID: <CAKmqyKNFMg+Woq-0hTd3dbNWf+963A7KonjW7FAgK=618yXp_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: Remove obsolete pointer masking
 extension code.
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jan 4, 2024 at 6:33=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Zjpm v0.8 is almost frozen and it's much simplier compared to the existin=
g one:
> The newer version doesn't allow to specify custom mask or base for maskin=
g.
> Instead it allows only certain options for masking top bits.
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.c           |  10 --
>  target/riscv/cpu.h           |  32 +---
>  target/riscv/cpu_bits.h      |  87 ----------
>  target/riscv/cpu_helper.c    |  52 ------
>  target/riscv/csr.c           | 326 -----------------------------------
>  target/riscv/machine.c       |   9 -
>  target/riscv/translate.c     |  27 +--
>  target/riscv/vector_helper.c |   2 +-
>  8 files changed, 10 insertions(+), 535 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..1e6571ce99 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -710,13 +710,6 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
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
>          for (i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> @@ -891,8 +884,6 @@ static void riscv_cpu_reset_hold(Object *obj)
>          }
>          i++;
>      }
> -    /* mmte is supposed to have pm.current hardwired to 1 */
> -    env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>
>      /*
>       * Clear mseccfg and unlock all the PMP entries upon reset.
> @@ -906,7 +897,6 @@ static void riscv_cpu_reset_hold(Object *obj)
>      pmp_unlock_entries(env);
>  #endif
>      env->xl =3D riscv_cpu_mxl(env);
> -    riscv_cpu_update_mask(env);
>      cs->exception_index =3D RISCV_EXCP_NONE;
>      env->load_res =3D -1;
>      set_default_nan_mode(1, &env->fp_status);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361be6..73f7004936 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -374,18 +374,7 @@ struct CPUArchState {
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
> -    /* CSRs for execution environment configuration */
> +    /* CSRs for execution enviornment configuration */
>      uint64_t menvcfg;
>      uint64_t mstateen[SMSTATEEN_MAX_COUNT];
>      uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> @@ -393,8 +382,6 @@ struct CPUArchState {
>      target_ulong senvcfg;
>      uint64_t henvcfg;
>  #endif
> -    target_ulong cur_pmmask;
> -    target_ulong cur_pmbase;
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> @@ -543,17 +530,14 @@ FIELD(TB_FLAGS, VILL, 14, 1)
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
> @@ -680,8 +664,6 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, =
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
> index ebd7917d49..1c92458a01 100644
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
> @@ -741,11 +710,6 @@ typedef enum RISCVException {
>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> -/* General PointerMasking CSR bits */
> -#define PM_ENABLE       0x00000001ULL
> -#define PM_CURRENT      0x00000002ULL
> -#define PM_INSN         0x00000004ULL
> -
>  /* Execution environment configuration bits */
>  #define MENVCFG_FIOM                       BIT(0)
>  #define MENVCFG_CBIE                       (3UL << 4)
> @@ -778,57 +742,6 @@ typedef enum RISCVException {
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
> index e7e23b34f4..a3d477d226 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -135,61 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr=
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
> @@ -721,7 +670,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ul=
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
> index fde7ce1a53..ea4e1ac6ef 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -483,16 +483,6 @@ static RISCVException hgatp(CPURISCVState *env, int =
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
> @@ -1355,7 +1345,6 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>          env->xl =3D cpu_recompute_xl(env);
>      }
>
> -    riscv_cpu_update_mask(env);
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -3900,302 +3889,6 @@ static RISCVException read_tinfo(CPURISCVState *e=
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
> @@ -4800,25 +4493,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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
> index fdde243e04..860fe56d43 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,14 +164,6 @@ static const VMStateDescription vmstate_pointermaski=
ng =3D {
>      .minimum_version_id =3D 1,

The version_id and minimum_version_id should be bumped here

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
> @@ -267,7 +259,6 @@ static int riscv_cpu_post_load(void *opaque, int vers=
ion_id)
>      CPURISCVState *env =3D &cpu->env;
>
>      env->xl =3D cpu_recompute_xl(env);
> -    riscv_cpu_update_mask(env);
>      return 0;
>  }
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0be79bb16..6b4b9a671c 100644
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
> @@ -1192,8 +1176,6 @@ static void riscv_tr_init_disas_context(DisasContex=
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
> @@ -1325,9 +1307,4 @@ void riscv_translate_init(void)
>                               "load_res");
>      load_val =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, loa=
d_val),
>                               "load_val");
> -    /* Assign PM CSRs to tcg globals */
> -    pm_mask =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, cur_=
pmmask),
> -                                 "pmmask");
> -    pm_base =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, cur_=
pmbase),
> -                                 "pmbase");
>  }
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index c1c3a4d1ea..8e7a8e80a0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -94,7 +94,7 @@ static inline uint32_t vext_max_elems(uint32_t desc, ui=
nt32_t log2_esz)
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

