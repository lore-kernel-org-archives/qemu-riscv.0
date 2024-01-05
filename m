Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80869C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLeZ0-0008Av-NQ; Fri, 05 Jan 2024 02:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeYq-00083w-Ry; Fri, 05 Jan 2024 02:24:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeYm-0006We-1B; Fri, 05 Jan 2024 02:24:08 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5555f9061b9so1650157a12.0; 
 Thu, 04 Jan 2024 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704439442; x=1705044242; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tRECgNh8GWl/aOo/puRnTpqNvX6VKaDQ1ZS2GPNnfBI=;
 b=jlKG5HZ5oO8gY3PQq6v2B6gFI2TL4nqZ0oZAXp4vhaR3fHPECMC+IMbYhv4uN/gSGs
 0HbzboXp8SffYTeOZAma4F4pqbVNFGPD/+5xyhKpD45q4DqDxshd8zpHaBFHufkePYMu
 SxDgQ2ylWAcJ9144dxfSle2e1N6aIV3vi8nbE5CRbLF9/AAhvQdQdfD3FyNVIol8fROT
 gD83FP4xhI2TlMRdeE7OJmnZ1YU8Wg6sQoZOCYtn0iKmNY7+O++qLo8v1aMEzu8+RyAJ
 /sjuNUOILtovy5+JrxNpQlm2o8ZtB+r6GR4CCFKOIW4s0nmyuT6tCSLFgI5hmDevstHq
 e4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704439442; x=1705044242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRECgNh8GWl/aOo/puRnTpqNvX6VKaDQ1ZS2GPNnfBI=;
 b=c+xQ9YEekm7ilB+jTEXK54i/fca27NlVG77RdlNAZcghXvm3XolR2bd1qJ4jJRr41Z
 TlOQ2l0iCwImUhoVGPcXURVxiO72wgdw+G0kEiObQt5nft3YvpVwqP4HMrYLjVdUVwrJ
 zXq+U8mftwlqPWyqm9AKdqJXllqv+RFJGseYRhyJaHBBAzzeZ/v4dkFBcClYjInKr4cs
 6Nl62rXZb2MB0fotRhFd7o9rGcPuRbiG063X/Q8o8RPYLWEoLp9neqwzgcaqTi6+8D+d
 KicFg0jUfIIfF0u2tHx3jlY3iWcV4k3+j0HcGWqvGTx/lgZ3xBiMK0hsTrZB9Y50Fdad
 +YGA==
X-Gm-Message-State: AOJu0Ywzi3bwudSztNhtIaENJM1Nhpeb2LGqSCXVS26QQI97nVuUEsgV
 ub9N9cvADHrX835Ml625BQWShgpBSBkehNjctzc=
X-Google-Smtp-Source: AGHT+IEe1s/bg6ggexZm60Kt+poVTPmBf724GfREPPuDk++4fSnefUPS6CZnJ5e1HvGGp+cvFWA6wImRFuurl0Ntrts=
X-Received: by 2002:aa7:cd06:0:b0:553:4aab:3bc5 with SMTP id
 b6-20020aa7cd06000000b005534aab3bc5mr924962edw.83.1704439442012; Thu, 04 Jan
 2024 23:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-2-me@deliversmonkey.space>
 <CAKmqyKNFMg+Woq-0hTd3dbNWf+963A7KonjW7FAgK=618yXp_A@mail.gmail.com>
In-Reply-To: <CAKmqyKNFMg+Woq-0hTd3dbNWf+963A7KonjW7FAgK=618yXp_A@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 5 Jan 2024 10:23:50 +0300
Message-ID: <CAFukJ-BWuduppea8r+b6j7w7mam4fr_nxfoNGUNwM+j41Ajc+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: Remove obsolete pointer masking
 extension code.
To: Alistair Francis <alistair23@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007b7e63060e2dbbe3"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000007b7e63060e2dbbe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, I would do it in the next updated series.

=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 08:04, Alis=
tair Francis <alistair23@gmail.com>:

> On Thu, Jan 4, 2024 at 6:33=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail=
.com>
> wrote:
> >
> > From: Alexey Baturo <baturo.alexey@gmail.com>
> >
> > Zjpm v0.8 is almost frozen and it's much simplier compared to the
> existing one:
> > The newer version doesn't allow to specify custom mask or base for
> masking.
> > Instead it allows only certain options for masking top bits.
> >
> > Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> > ---
> >  target/riscv/cpu.c           |  10 --
> >  target/riscv/cpu.h           |  32 +---
> >  target/riscv/cpu_bits.h      |  87 ----------
> >  target/riscv/cpu_helper.c    |  52 ------
> >  target/riscv/csr.c           | 326 -----------------------------------
> >  target/riscv/machine.c       |   9 -
> >  target/riscv/translate.c     |  27 +--
> >  target/riscv/vector_helper.c |   2 +-
> >  8 files changed, 10 insertions(+), 535 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 83c7c0cf07..1e6571ce99 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -710,13 +710,6 @@ static void riscv_cpu_dump_state(CPUState *cs, FIL=
E
> *f, int flags)
> >              CSR_MSCRATCH,
> >              CSR_SSCRATCH,
> >              CSR_SATP,
> > -            CSR_MMTE,
> > -            CSR_UPMBASE,
> > -            CSR_UPMMASK,
> > -            CSR_SPMBASE,
> > -            CSR_SPMMASK,
> > -            CSR_MPMBASE,
> > -            CSR_MPMMASK,
> >          };
> >
> >          for (i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> > @@ -891,8 +884,6 @@ static void riscv_cpu_reset_hold(Object *obj)
> >          }
> >          i++;
> >      }
> > -    /* mmte is supposed to have pm.current hardwired to 1 */
> > -    env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> >
> >      /*
> >       * Clear mseccfg and unlock all the PMP entries upon reset.
> > @@ -906,7 +897,6 @@ static void riscv_cpu_reset_hold(Object *obj)
> >      pmp_unlock_entries(env);
> >  #endif
> >      env->xl =3D riscv_cpu_mxl(env);
> > -    riscv_cpu_update_mask(env);
> >      cs->exception_index =3D RISCV_EXCP_NONE;
> >      env->load_res =3D -1;
> >      set_default_nan_mode(1, &env->fp_status);
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index d74b361be6..73f7004936 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -374,18 +374,7 @@ struct CPUArchState {
> >      /* True if in debugger mode.  */
> >      bool debugger;
> >
> > -    /*
> > -     * CSRs for PointerMasking extension
> > -     */
> > -    target_ulong mmte;
> > -    target_ulong mpmmask;
> > -    target_ulong mpmbase;
> > -    target_ulong spmmask;
> > -    target_ulong spmbase;
> > -    target_ulong upmmask;
> > -    target_ulong upmbase;
> > -
> > -    /* CSRs for execution environment configuration */
> > +    /* CSRs for execution enviornment configuration */
> >      uint64_t menvcfg;
> >      uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> >      uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> > @@ -393,8 +382,6 @@ struct CPUArchState {
> >      target_ulong senvcfg;
> >      uint64_t henvcfg;
> >  #endif
> > -    target_ulong cur_pmmask;
> > -    target_ulong cur_pmbase;
> >
> >      /* Fields from here on are preserved across CPU reset. */
> >      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > @@ -543,17 +530,14 @@ FIELD(TB_FLAGS, VILL, 14, 1)
> >  FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
> >  /* The combination of MXL/SXL/UXL that applies to the current cpu mode=
.
> */
> >  FIELD(TB_FLAGS, XL, 16, 2)
> > -/* If PointerMasking should be applied */
> > -FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
> > -FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
> > -FIELD(TB_FLAGS, VTA, 20, 1)
> > -FIELD(TB_FLAGS, VMA, 21, 1)
> > +FIELD(TB_FLAGS, VTA, 18, 1)
> > +FIELD(TB_FLAGS, VMA, 19, 1)
> >  /* Native debug itrigger */
> > -FIELD(TB_FLAGS, ITRIGGER, 22, 1)
> > +FIELD(TB_FLAGS, ITRIGGER, 20, 1)
> >  /* Virtual mode enabled */
> > -FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> > -FIELD(TB_FLAGS, PRIV, 24, 2)
> > -FIELD(TB_FLAGS, AXL, 26, 2)
> > +FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> > +FIELD(TB_FLAGS, PRIV, 22, 2)
> > +FIELD(TB_FLAGS, AXL, 24, 2)
> >
> >  #ifdef TARGET_RISCV32
> >  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> > @@ -680,8 +664,6 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu=
,
> target_ulong vtype)
> >  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
> >                            uint64_t *cs_base, uint32_t *pflags);
> >
> > -void riscv_cpu_update_mask(CPURISCVState *env);
> > -
> >  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> >                             target_ulong *ret_value,
> >                             target_ulong new_value, target_ulong
> write_mask);
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index ebd7917d49..1c92458a01 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -491,37 +491,6 @@
> >  #define CSR_MHPMCOUNTER30H  0xb9e
> >  #define CSR_MHPMCOUNTER31H  0xb9f
> >
> > -/*
> > - * User PointerMasking registers
> > - * NB: actual CSR numbers might be changed in future
> > - */
> > -#define CSR_UMTE            0x4c0
> > -#define CSR_UPMMASK         0x4c1
> > -#define CSR_UPMBASE         0x4c2
> > -
> > -/*
> > - * Machine PointerMasking registers
> > - * NB: actual CSR numbers might be changed in future
> > - */
> > -#define CSR_MMTE            0x3c0
> > -#define CSR_MPMMASK         0x3c1
> > -#define CSR_MPMBASE         0x3c2
> > -
> > -/*
> > - * Supervisor PointerMaster registers
> > - * NB: actual CSR numbers might be changed in future
> > - */
> > -#define CSR_SMTE            0x1c0
> > -#define CSR_SPMMASK         0x1c1
> > -#define CSR_SPMBASE         0x1c2
> > -
> > -/*
> > - * Hypervisor PointerMaster registers
> > - * NB: actual CSR numbers might be changed in future
> > - */
> > -#define CSR_VSMTE           0x2c0
> > -#define CSR_VSPMMASK        0x2c1
> > -#define CSR_VSPMBASE        0x2c2
> >  #define CSR_SCOUNTOVF       0xda0
> >
> >  /* Crypto Extension */
> > @@ -741,11 +710,6 @@ typedef enum RISCVException {
> >  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP))
> >  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS)=
)
> >
> > -/* General PointerMasking CSR bits */
> > -#define PM_ENABLE       0x00000001ULL
> > -#define PM_CURRENT      0x00000002ULL
> > -#define PM_INSN         0x00000004ULL
> > -
> >  /* Execution environment configuration bits */
> >  #define MENVCFG_FIOM                       BIT(0)
> >  #define MENVCFG_CBIE                       (3UL << 4)
> > @@ -778,57 +742,6 @@ typedef enum RISCVException {
> >  #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
> >  #define HENVCFGH_STCE                       MENVCFGH_STCE
> >
> > -/* Offsets for every pair of control bits per each priv level */
> > -#define XS_OFFSET    0ULL
> > -#define U_OFFSET     2ULL
> > -#define S_OFFSET     5ULL
> > -#define M_OFFSET     8ULL
> > -
> > -#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
> > -#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
> > -#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
> > -#define U_PM_INSN    (PM_INSN    << U_OFFSET)
> > -#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
> > -#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
> > -#define S_PM_INSN    (PM_INSN    << S_OFFSET)
> > -#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
> > -#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
> > -#define M_PM_INSN    (PM_INSN    << M_OFFSET)
> > -
> > -/* mmte CSR bits */
> > -#define MMTE_PM_XS_BITS     PM_XS_BITS
> > -#define MMTE_U_PM_ENABLE    U_PM_ENABLE
> > -#define MMTE_U_PM_CURRENT   U_PM_CURRENT
> > -#define MMTE_U_PM_INSN      U_PM_INSN
> > -#define MMTE_S_PM_ENABLE    S_PM_ENABLE
> > -#define MMTE_S_PM_CURRENT   S_PM_CURRENT
> > -#define MMTE_S_PM_INSN      S_PM_INSN
> > -#define MMTE_M_PM_ENABLE    M_PM_ENABLE
> > -#define MMTE_M_PM_CURRENT   M_PM_CURRENT
> > -#define MMTE_M_PM_INSN      M_PM_INSN
> > -#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT |
> MMTE_U_PM_INSN | \
> > -                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT |
> MMTE_S_PM_INSN | \
> > -                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT |
> MMTE_M_PM_INSN | \
> > -                      MMTE_PM_XS_BITS)
> > -
> > -/* (v)smte CSR bits */
> > -#define SMTE_PM_XS_BITS     PM_XS_BITS
> > -#define SMTE_U_PM_ENABLE    U_PM_ENABLE
> > -#define SMTE_U_PM_CURRENT   U_PM_CURRENT
> > -#define SMTE_U_PM_INSN      U_PM_INSN
> > -#define SMTE_S_PM_ENABLE    S_PM_ENABLE
> > -#define SMTE_S_PM_CURRENT   S_PM_CURRENT
> > -#define SMTE_S_PM_INSN      S_PM_INSN
> > -#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT |
> SMTE_U_PM_INSN | \
> > -                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT |
> SMTE_S_PM_INSN | \
> > -                      SMTE_PM_XS_BITS)
> > -
> > -/* umte CSR bits */
> > -#define UMTE_U_PM_ENABLE    U_PM_ENABLE
> > -#define UMTE_U_PM_CURRENT   U_PM_CURRENT
> > -#define UMTE_U_PM_INSN      U_PM_INSN
> > -#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT |
> UMTE_U_PM_INSN)
> > -
> >  /* MISELECT, SISELECT, and VSISELECT bits (AIA) */
> >  #define ISELECT_IPRIO0                     0x30
> >  #define ISELECT_IPRIO15                    0x3f
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index e7e23b34f4..a3d477d226 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -135,61 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env,
> vaddr *pc,
> >      flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
> >      flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> >      flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> > -    if (env->cur_pmmask !=3D 0) {
> > -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> > -    }
> > -    if (env->cur_pmbase !=3D 0) {
> > -        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
> > -    }
> >
> >      *pflags =3D flags;
> >  }
> >
> > -void riscv_cpu_update_mask(CPURISCVState *env)
> > -{
> > -    target_ulong mask =3D 0, base =3D 0;
> > -    RISCVMXL xl =3D env->xl;
> > -    /*
> > -     * TODO: Current RVJ spec does not specify
> > -     * how the extension interacts with XLEN.
> > -     */
> > -#ifndef CONFIG_USER_ONLY
> > -    int mode =3D cpu_address_mode(env);
> > -    xl =3D cpu_get_xl(env, mode);
> > -    if (riscv_has_ext(env, RVJ)) {
> > -        switch (mode) {
> > -        case PRV_M:
> > -            if (env->mmte & M_PM_ENABLE) {
> > -                mask =3D env->mpmmask;
> > -                base =3D env->mpmbase;
> > -            }
> > -            break;
> > -        case PRV_S:
> > -            if (env->mmte & S_PM_ENABLE) {
> > -                mask =3D env->spmmask;
> > -                base =3D env->spmbase;
> > -            }
> > -            break;
> > -        case PRV_U:
> > -            if (env->mmte & U_PM_ENABLE) {
> > -                mask =3D env->upmmask;
> > -                base =3D env->upmbase;
> > -            }
> > -            break;
> > -        default:
> > -            g_assert_not_reached();
> > -        }
> > -    }
> > -#endif
> > -    if (xl =3D=3D MXL_RV32) {
> > -        env->cur_pmmask =3D mask & UINT32_MAX;
> > -        env->cur_pmbase =3D base & UINT32_MAX;
> > -    } else {
> > -        env->cur_pmmask =3D mask;
> > -        env->cur_pmbase =3D base;
> > -    }
> > -}
> > -
> >  #ifndef CONFIG_USER_ONLY
> >
> >  /*
> > @@ -721,7 +670,6 @@ void riscv_cpu_set_mode(CPURISCVState *env,
> target_ulong newpriv)
> >      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
> >      env->priv =3D newpriv;
> >      env->xl =3D cpu_recompute_xl(env);
> > -    riscv_cpu_update_mask(env);
> >
> >      /*
> >       * Clear the load reservation - otherwise a reservation placed in
> one
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index fde7ce1a53..ea4e1ac6ef 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -483,16 +483,6 @@ static RISCVException hgatp(CPURISCVState *env, in=
t
> csrno)
> >      return hmode(env, csrno);
> >  }
> >
> > -/* Checks if PointerMasking registers could be accessed */
> > -static RISCVException pointer_masking(CPURISCVState *env, int csrno)
> > -{
> > -    /* Check if j-ext is present */
> > -    if (riscv_has_ext(env, RVJ)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -    return RISCV_EXCP_ILLEGAL_INST;
> > -}
> > -
> >  static int aia_hmode(CPURISCVState *env, int csrno)
> >  {
> >      if (!riscv_cpu_cfg(env)->ext_ssaia) {
> > @@ -1355,7 +1345,6 @@ static RISCVException write_mstatus(CPURISCVState
> *env, int csrno,
> >          env->xl =3D cpu_recompute_xl(env);
> >      }
> >
> > -    riscv_cpu_update_mask(env);
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > @@ -3900,302 +3889,6 @@ static RISCVException read_tinfo(CPURISCVState
> *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -/*
> > - * Functions to access Pointer Masking feature registers
> > - * We have to check if current priv lvl could modify
> > - * csr in given mode
> > - */
> > -static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
> > -{
> > -    int csr_priv =3D get_field(csrno, 0x300);
> > -    int pm_current;
> > -
> > -    if (env->debugger) {
> > -        return false;
> > -    }
> > -    /*
> > -     * If priv lvls differ that means we're accessing csr from higher
> priv lvl,
> > -     * so allow the access
> > -     */
> > -    if (env->priv !=3D csr_priv) {
> > -        return false;
> > -    }
> > -    switch (env->priv) {
> > -    case PRV_M:
> > -        pm_current =3D get_field(env->mmte, M_PM_CURRENT);
> > -        break;
> > -    case PRV_S:
> > -        pm_current =3D get_field(env->mmte, S_PM_CURRENT);
> > -        break;
> > -    case PRV_U:
> > -        pm_current =3D get_field(env->mmte, U_PM_CURRENT);
> > -        break;
> > -    default:
> > -        g_assert_not_reached();
> > -    }
> > -    /* It's same priv lvl, so we allow to modify csr only if
> pm.current=3D=3D1 */
> > -    return !pm_current;
> > -}
> > -
> > -static RISCVException read_mmte(CPURISCVState *env, int csrno,
> > -                                target_ulong *val)
> > -{
> > -    *val =3D env->mmte & MMTE_MASK;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_mmte(CPURISCVState *env, int csrno,
> > -                                 target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -    target_ulong wpri_val =3D val & MMTE_MASK;
> > -
> > -    if (val !=3D wpri_val) {
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> > -                      TARGET_FMT_lx "\n", "MMTE: WPRI violation writte=
n
> 0x",
> > -                      val, "vs expected 0x", wpri_val);
> > -    }
> > -    /* for machine mode pm.current is hardwired to 1 */
> > -    wpri_val |=3D MMTE_M_PM_CURRENT;
> > -
> > -    /* hardwiring pm.instruction bit to 0, since it's not supported ye=
t
> */
> > -    wpri_val &=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> > -    env->mmte =3D wpri_val | EXT_STATUS_DIRTY;
> > -    riscv_cpu_update_mask(env);
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_smte(CPURISCVState *env, int csrno,
> > -                                target_ulong *val)
> > -{
> > -    *val =3D env->mmte & SMTE_MASK;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_smte(CPURISCVState *env, int csrno,
> > -                                 target_ulong val)
> > -{
> > -    target_ulong wpri_val =3D val & SMTE_MASK;
> > -
> > -    if (val !=3D wpri_val) {
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> > -                      TARGET_FMT_lx "\n", "SMTE: WPRI violation writte=
n
> 0x",
> > -                      val, "vs expected 0x", wpri_val);
> > -    }
> > -
> > -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -
> > -    wpri_val |=3D (env->mmte & ~SMTE_MASK);
> > -    write_mmte(env, csrno, wpri_val);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_umte(CPURISCVState *env, int csrno,
> > -                                target_ulong *val)
> > -{
> > -    *val =3D env->mmte & UMTE_MASK;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_umte(CPURISCVState *env, int csrno,
> > -                                 target_ulong val)
> > -{
> > -    target_ulong wpri_val =3D val & UMTE_MASK;
> > -
> > -    if (val !=3D wpri_val) {
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
> > -                      TARGET_FMT_lx "\n", "UMTE: WPRI violation writte=
n
> 0x",
> > -                      val, "vs expected 0x", wpri_val);
> > -    }
> > -
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -
> > -    wpri_val |=3D (env->mmte & ~UMTE_MASK);
> > -    write_mmte(env, csrno, wpri_val);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->mpmmask;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    env->mpmmask =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_M) && (env->mmte & M_PM_ENAB=
LE)) {
> > -        env->cur_pmmask =3D val;
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_spmmask(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->spmmask;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_spmmask(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -    env->spmmask =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_S) && (env->mmte & S_PM_ENAB=
LE)) {
> > -        env->cur_pmmask =3D val;
> > -        if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV32) {
> > -            env->cur_pmmask &=3D UINT32_MAX;
> > -        }
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_upmmask(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->upmmask;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_upmmask(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -    env->upmmask =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_U) && (env->mmte & U_PM_ENAB=
LE)) {
> > -        env->cur_pmmask =3D val;
> > -        if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV32) {
> > -            env->cur_pmmask &=3D UINT32_MAX;
> > -        }
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->mpmbase;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    env->mpmbase =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_M) && (env->mmte & M_PM_ENAB=
LE)) {
> > -        env->cur_pmbase =3D val;
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_spmbase(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->spmbase;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_spmbase(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -    env->spmbase =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_S) && (env->mmte & S_PM_ENAB=
LE)) {
> > -        env->cur_pmbase =3D val;
> > -        if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV32) {
> > -            env->cur_pmbase &=3D UINT32_MAX;
> > -        }
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException read_upmbase(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > -{
> > -    *val =3D env->upmbase;
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> > -static RISCVException write_upmbase(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    uint64_t mstatus;
> > -
> > -    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
> > -    if (check_pm_current_disabled(env, csrno)) {
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -    env->upmbase =3D val;
> > -    if ((cpu_address_mode(env) =3D=3D PRV_U) && (env->mmte & U_PM_ENAB=
LE)) {
> > -        env->cur_pmbase =3D val;
> > -        if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV32) {
> > -            env->cur_pmbase &=3D UINT32_MAX;
> > -        }
> > -    }
> > -    env->mmte |=3D EXT_STATUS_DIRTY;
> > -
> > -    /* Set XS and SD bits, since PM CSRs are dirty */
> > -    mstatus =3D env->mstatus | MSTATUS_XS;
> > -    write_mstatus(env, csrno, mstatus);
> > -    return RISCV_EXCP_NONE;
> > -}
> > -
> >  #endif
> >
> >  /* Crypto Extension */
> > @@ -4800,25 +4493,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >      [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata
>  },
> >      [CSR_TINFO]     =3D  { "tinfo",   debug, read_tinfo,   write_ignor=
e
> },
> >
> > -    /* User Pointer Masking */
> > -    [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,
> write_umte },
> > -    [CSR_UPMMASK] =3D    { "upmmask", pointer_masking, read_upmmask,
> > -                         write_upmmask
>     },
> > -    [CSR_UPMBASE] =3D    { "upmbase", pointer_masking, read_upmbase,
> > -                         write_upmbase
>     },
> > -    /* Machine Pointer Masking */
> > -    [CSR_MMTE]    =3D    { "mmte",    pointer_masking, read_mmte,
> write_mmte },
> > -    [CSR_MPMMASK] =3D    { "mpmmask", pointer_masking, read_mpmmask,
> > -                         write_mpmmask
>     },
> > -    [CSR_MPMBASE] =3D    { "mpmbase", pointer_masking, read_mpmbase,
> > -                         write_mpmbase
>     },
> > -    /* Supervisor Pointer Masking */
> > -    [CSR_SMTE]    =3D    { "smte",    pointer_masking, read_smte,
> write_smte },
> > -    [CSR_SPMMASK] =3D    { "spmmask", pointer_masking, read_spmmask,
> > -                         write_spmmask
>     },
> > -    [CSR_SPMBASE] =3D    { "spmbase", pointer_masking, read_spmbase,
> > -                         write_spmbase
>     },
> > -
> >      /* Performance Counters */
> >      [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_hpmcount=
er
> },
> >      [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_hpmcount=
er
> },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index fdde243e04..860fe56d43 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -164,14 +164,6 @@ static const VMStateDescription
> vmstate_pointermasking =3D {
> >      .minimum_version_id =3D 1,
>
> The version_id and minimum_version_id should be bumped here
>
> Alistair
>
> >      .needed =3D pointermasking_needed,
> >      .fields =3D (VMStateField[]) {
> > -        VMSTATE_UINTTL(env.mmte, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
> > -        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
> > -        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
> > -        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
> > -        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
> > -
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > @@ -267,7 +259,6 @@ static int riscv_cpu_post_load(void *opaque, int
> version_id)
> >      CPURISCVState *env =3D &cpu->env;
> >
> >      env->xl =3D cpu_recompute_xl(env);
> > -    riscv_cpu_update_mask(env);
> >      return 0;
> >  }
> >
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index f0be79bb16..6b4b9a671c 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -42,9 +42,6 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl=
,
> cpu_vstart;
> >  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
> >  static TCGv load_res;
> >  static TCGv load_val;
> > -/* globals for PM CSRs */
> > -static TCGv pm_mask;
> > -static TCGv pm_base;
> >
> >  /*
> >   * If an operation is being performed on less than TARGET_LONG_BITS,
> > @@ -106,9 +103,6 @@ typedef struct DisasContext {
> >      bool vl_eq_vlmax;
> >      CPUState *cs;
> >      TCGv zero;
> > -    /* PointerMasking extension */
> > -    bool pm_mask_enabled;
> > -    bool pm_base_enabled;
> >      /* Use icount trigger for native debug */
> >      bool itrigger;
> >      /* FRM is known to contain a valid value. */
> > @@ -582,14 +576,9 @@ static TCGv get_address(DisasContext *ctx, int rs1=
,
> int imm)
> >      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
> >
> >      tcg_gen_addi_tl(addr, src1, imm);
> > -    if (ctx->pm_mask_enabled) {
> > -        tcg_gen_andc_tl(addr, addr, pm_mask);
> > -    } else if (get_address_xl(ctx) =3D=3D MXL_RV32) {
> > +    if (get_address_xl(ctx) =3D=3D MXL_RV32) {
> >          tcg_gen_ext32u_tl(addr, addr);
> >      }
> > -    if (ctx->pm_base_enabled) {
> > -        tcg_gen_or_tl(addr, addr, pm_base);
> > -    }
> >
> >      return addr;
> >  }
> > @@ -601,14 +590,9 @@ static TCGv get_address_indexed(DisasContext *ctx,
> int rs1, TCGv offs)
> >      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
> >
> >      tcg_gen_add_tl(addr, src1, offs);
> > -    if (ctx->pm_mask_enabled) {
> > -        tcg_gen_andc_tl(addr, addr, pm_mask);
> > -    } else if (get_xl(ctx) =3D=3D MXL_RV32) {
> > +    if (get_xl(ctx) =3D=3D MXL_RV32) {
> >          tcg_gen_ext32u_tl(addr, addr);
> >      }
> > -    if (ctx->pm_base_enabled) {
> > -        tcg_gen_or_tl(addr, addr, pm_base);
> > -    }
> >      return addr;
> >  }
> >
> > @@ -1192,8 +1176,6 @@ static void
> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
> >      ctx->address_xl =3D FIELD_EX32(tb_flags, TB_FLAGS, AXL);
> >      ctx->cs =3D cs;
> > -    ctx->pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS,
> PM_MASK_ENABLED);
> > -    ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS,
> PM_BASE_ENABLED);
> >      ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> >      ctx->zero =3D tcg_constant_tl(0);
> >      ctx->virt_inst_excp =3D false;
> > @@ -1325,9 +1307,4 @@ void riscv_translate_init(void)
> >                               "load_res");
> >      load_val =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState,
> load_val),
> >                               "load_val");
> > -    /* Assign PM CSRs to tcg globals */
> > -    pm_mask =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState,
> cur_pmmask),
> > -                                 "pmmask");
> > -    pm_base =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState,
> cur_pmbase),
> > -                                 "pmbase");
> >  }
> > diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.=
c
> > index c1c3a4d1ea..8e7a8e80a0 100644
> > --- a/target/riscv/vector_helper.c
> > +++ b/target/riscv/vector_helper.c
> > @@ -94,7 +94,7 @@ static inline uint32_t vext_max_elems(uint32_t desc,
> uint32_t log2_esz)
> >
> >  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulon=
g
> addr)
> >  {
> > -    return (addr & ~env->cur_pmmask) | env->cur_pmbase;
> > +    return addr;
> >  }
> >
> >  /*
> > --
> > 2.34.1
> >
> >
>

--0000000000007b7e63060e2dbbe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, I would do it in the next updated series.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=
=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 08:04, Alistair Fran=
cis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt=
;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 4=
, 2024 at 6:33=E2=80=AFAM Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey=
@gmail.com" target=3D"_blank">baturo.alexey@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" tar=
get=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Zjpm v0.8 is almost frozen and it&#39;s much simplier compared to the =
existing one:<br>
&gt; The newer version doesn&#39;t allow to specify custom mask or base for=
 masking.<br>
&gt; Instead it allows only certain options for masking top bits.<br>
&gt;<br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail=
.com" target=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 10 --<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 32 +---<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 87 ---------=
-<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 |=C2=A0 52 ------<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 326=
 -----------------------------------<br>
&gt;=C2=A0 target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09=
 -<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 27 +--<br>
&gt;=C2=A0 target/riscv/vector_helper.c |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 8 files changed, 10 insertions(+), 535 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 83c7c0cf07..1e6571ce99 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -710,13 +710,6 @@ static void riscv_cpu_dump_state(CPUState *cs, FI=
LE *f, int flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_MSCRATCH,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_SSCRATCH,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_SATP,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_MMTE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_UPMBASE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_UPMMASK,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_SPMBASE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_SPMMASK,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_MPMBASE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CSR_MPMMASK,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(dump=
_csrs); ++i) {<br>
&gt; @@ -891,8 +884,6 @@ static void riscv_cpu_reset_hold(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 /* mmte is supposed to have pm.current hardwired to 1 *=
/<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRE=
NT);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Clear mseccfg and unlock all the PMP entri=
es upon reset.<br>
&gt; @@ -906,7 +897,6 @@ static void riscv_cpu_reset_hold(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pmp_unlock_entries(env);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;xl =3D riscv_cpu_mxl(env);<br>
&gt; -=C2=A0 =C2=A0 riscv_cpu_update_mask(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;load_res =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_default_nan_mode(1, &amp;env-&gt;fp_status);<b=
r>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index d74b361be6..73f7004936 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -374,18 +374,7 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* True if in debugger mode.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool debugger;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* CSRs for PointerMasking extension<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 target_ulong mmte;<br>
&gt; -=C2=A0 =C2=A0 target_ulong mpmmask;<br>
&gt; -=C2=A0 =C2=A0 target_ulong mpmbase;<br>
&gt; -=C2=A0 =C2=A0 target_ulong spmmask;<br>
&gt; -=C2=A0 =C2=A0 target_ulong spmbase;<br>
&gt; -=C2=A0 =C2=A0 target_ulong upmmask;<br>
&gt; -=C2=A0 =C2=A0 target_ulong upmbase;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* CSRs for execution environment configuration */<br>
&gt; +=C2=A0 =C2=A0 /* CSRs for execution enviornment configuration */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t menvcfg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mstateen[SMSTATEEN_MAX_COUNT];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t hstateen[SMSTATEEN_MAX_COUNT];<br>
&gt; @@ -393,8 +382,6 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong senvcfg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t henvcfg;<br>
&gt;=C2=A0 #endif<br>
&gt; -=C2=A0 =C2=A0 target_ulong cur_pmmask;<br>
&gt; -=C2=A0 =C2=A0 target_ulong cur_pmbase;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Fields from here on are preserved across CPU re=
set. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMUTimer *stimer; /* Internal timer for S-mode in=
terrupt */<br>
&gt; @@ -543,17 +530,14 @@ FIELD(TB_FLAGS, VILL, 14, 1)<br>
&gt;=C2=A0 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)<br>
&gt;=C2=A0 /* The combination of MXL/SXL/UXL that applies to the current cp=
u mode. */<br>
&gt;=C2=A0 FIELD(TB_FLAGS, XL, 16, 2)<br>
&gt; -/* If PointerMasking should be applied */<br>
&gt; -FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)<br>
&gt; -FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)<br>
&gt; -FIELD(TB_FLAGS, VTA, 20, 1)<br>
&gt; -FIELD(TB_FLAGS, VMA, 21, 1)<br>
&gt; +FIELD(TB_FLAGS, VTA, 18, 1)<br>
&gt; +FIELD(TB_FLAGS, VMA, 19, 1)<br>
&gt;=C2=A0 /* Native debug itrigger */<br>
&gt; -FIELD(TB_FLAGS, ITRIGGER, 22, 1)<br>
&gt; +FIELD(TB_FLAGS, ITRIGGER, 20, 1)<br>
&gt;=C2=A0 /* Virtual mode enabled */<br>
&gt; -FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)<br>
&gt; -FIELD(TB_FLAGS, PRIV, 24, 2)<br>
&gt; -FIELD(TB_FLAGS, AXL, 26, 2)<br>
&gt; +FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)<br>
&gt; +FIELD(TB_FLAGS, PRIV, 22, 2)<br>
&gt; +FIELD(TB_FLAGS, AXL, 24, 2)<br>
&gt;<br>
&gt;=C2=A0 #ifdef TARGET_RISCV32<br>
&gt;=C2=A0 #define riscv_cpu_mxl(env)=C2=A0 ((void)(env), MXL_RV32)<br>
&gt; @@ -680,8 +664,6 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cp=
u, target_ulong vtype)<br>
&gt;=C2=A0 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *cs_base, uint32_t *pflags);<br>
&gt;<br>
&gt; -void riscv_cpu_update_mask(CPURISCVState *env);<br>
&gt; -<br>
&gt;=C2=A0 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_value, target_ulong writ=
e_mask);<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index ebd7917d49..1c92458a01 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -491,37 +491,6 @@<br>
&gt;=C2=A0 #define CSR_MHPMCOUNTER30H=C2=A0 0xb9e<br>
&gt;=C2=A0 #define CSR_MHPMCOUNTER31H=C2=A0 0xb9f<br>
&gt;<br>
&gt; -/*<br>
&gt; - * User PointerMasking registers<br>
&gt; - * NB: actual CSR numbers might be changed in future<br>
&gt; - */<br>
&gt; -#define CSR_UMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4c0<br>
&gt; -#define CSR_UPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4c1<br>
&gt; -#define CSR_UPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4c2<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Machine PointerMasking registers<br>
&gt; - * NB: actual CSR numbers might be changed in future<br>
&gt; - */<br>
&gt; -#define CSR_MMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3c0<br>
&gt; -#define CSR_MPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3c1<br>
&gt; -#define CSR_MPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3c2<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Supervisor PointerMaster registers<br>
&gt; - * NB: actual CSR numbers might be changed in future<br>
&gt; - */<br>
&gt; -#define CSR_SMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1c0<br>
&gt; -#define CSR_SPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1c1<br>
&gt; -#define CSR_SPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1c2<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Hypervisor PointerMaster registers<br>
&gt; - * NB: actual CSR numbers might be changed in future<br>
&gt; - */<br>
&gt; -#define CSR_VSMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2c0<br>
&gt; -#define CSR_VSPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c1<br>
&gt; -#define CSR_VSPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c2<br>
&gt;=C2=A0 #define CSR_SCOUNTOVF=C2=A0 =C2=A0 =C2=A0 =C2=A00xda0<br>
&gt;<br>
&gt;=C2=A0 /* Crypto Extension */<br>
&gt; @@ -741,11 +710,6 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | M=
IP_VSEIP))<br>
&gt;=C2=A0 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTER=
RUPTS))<br>
&gt;<br>
&gt; -/* General PointerMasking CSR bits */<br>
&gt; -#define PM_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A00x00000001ULL<br>
&gt; -#define PM_CURRENT=C2=A0 =C2=A0 =C2=A0 0x00000002ULL<br>
&gt; -#define PM_INSN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000004ULL<br>
&gt; -<br>
&gt;=C2=A0 /* Execution environment configuration bits */<br>
&gt;=C2=A0 #define MENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt;=C2=A0 #define MENVCFG_CBIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3UL &lt;&lt; 4)<br>
&gt; @@ -778,57 +742,6 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 #define HENVCFGH_PBMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFGH_PBMTE<br>
&gt;=C2=A0 #define HENVCFGH_STCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFGH_STCE<br>
&gt;<br>
&gt; -/* Offsets for every pair of control bits per each priv level */<br>
&gt; -#define XS_OFFSET=C2=A0 =C2=A0 0ULL<br>
&gt; -#define U_OFFSET=C2=A0 =C2=A0 =C2=A02ULL<br>
&gt; -#define S_OFFSET=C2=A0 =C2=A0 =C2=A05ULL<br>
&gt; -#define M_OFFSET=C2=A0 =C2=A0 =C2=A08ULL<br>
&gt; -<br>
&gt; -#define PM_XS_BITS=C2=A0 =C2=A0(EXT_STATUS_MASK &lt;&lt; XS_OFFSET)<b=
r>
&gt; -#define U_PM_ENABLE=C2=A0 (PM_ENABLE=C2=A0 &lt;&lt; U_OFFSET)<br>
&gt; -#define U_PM_CURRENT (PM_CURRENT &lt;&lt; U_OFFSET)<br>
&gt; -#define U_PM_INSN=C2=A0 =C2=A0 (PM_INSN=C2=A0 =C2=A0 &lt;&lt; U_OFFSE=
T)<br>
&gt; -#define S_PM_ENABLE=C2=A0 (PM_ENABLE=C2=A0 &lt;&lt; S_OFFSET)<br>
&gt; -#define S_PM_CURRENT (PM_CURRENT &lt;&lt; S_OFFSET)<br>
&gt; -#define S_PM_INSN=C2=A0 =C2=A0 (PM_INSN=C2=A0 =C2=A0 &lt;&lt; S_OFFSE=
T)<br>
&gt; -#define M_PM_ENABLE=C2=A0 (PM_ENABLE=C2=A0 &lt;&lt; M_OFFSET)<br>
&gt; -#define M_PM_CURRENT (PM_CURRENT &lt;&lt; M_OFFSET)<br>
&gt; -#define M_PM_INSN=C2=A0 =C2=A0 (PM_INSN=C2=A0 =C2=A0 &lt;&lt; M_OFFSE=
T)<br>
&gt; -<br>
&gt; -/* mmte CSR bits */<br>
&gt; -#define MMTE_PM_XS_BITS=C2=A0 =C2=A0 =C2=A0PM_XS_BITS<br>
&gt; -#define MMTE_U_PM_ENABLE=C2=A0 =C2=A0 U_PM_ENABLE<br>
&gt; -#define MMTE_U_PM_CURRENT=C2=A0 =C2=A0U_PM_CURRENT<br>
&gt; -#define MMTE_U_PM_INSN=C2=A0 =C2=A0 =C2=A0 U_PM_INSN<br>
&gt; -#define MMTE_S_PM_ENABLE=C2=A0 =C2=A0 S_PM_ENABLE<br>
&gt; -#define MMTE_S_PM_CURRENT=C2=A0 =C2=A0S_PM_CURRENT<br>
&gt; -#define MMTE_S_PM_INSN=C2=A0 =C2=A0 =C2=A0 S_PM_INSN<br>
&gt; -#define MMTE_M_PM_ENABLE=C2=A0 =C2=A0 M_PM_ENABLE<br>
&gt; -#define MMTE_M_PM_CURRENT=C2=A0 =C2=A0M_PM_CURRENT<br>
&gt; -#define MMTE_M_PM_INSN=C2=A0 =C2=A0 =C2=A0 M_PM_INSN<br>
&gt; -#define MMTE_MASK=C2=A0 =C2=A0 (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT =
| MMTE_U_PM_INSN | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 MMTE_PM_XS_BITS)<br>
&gt; -<br>
&gt; -/* (v)smte CSR bits */<br>
&gt; -#define SMTE_PM_XS_BITS=C2=A0 =C2=A0 =C2=A0PM_XS_BITS<br>
&gt; -#define SMTE_U_PM_ENABLE=C2=A0 =C2=A0 U_PM_ENABLE<br>
&gt; -#define SMTE_U_PM_CURRENT=C2=A0 =C2=A0U_PM_CURRENT<br>
&gt; -#define SMTE_U_PM_INSN=C2=A0 =C2=A0 =C2=A0 U_PM_INSN<br>
&gt; -#define SMTE_S_PM_ENABLE=C2=A0 =C2=A0 S_PM_ENABLE<br>
&gt; -#define SMTE_S_PM_CURRENT=C2=A0 =C2=A0S_PM_CURRENT<br>
&gt; -#define SMTE_S_PM_INSN=C2=A0 =C2=A0 =C2=A0 S_PM_INSN<br>
&gt; -#define SMTE_MASK=C2=A0 =C2=A0 (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT =
| SMTE_U_PM_INSN | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 SMTE_PM_XS_BITS)<br>
&gt; -<br>
&gt; -/* umte CSR bits */<br>
&gt; -#define UMTE_U_PM_ENABLE=C2=A0 =C2=A0 U_PM_ENABLE<br>
&gt; -#define UMTE_U_PM_CURRENT=C2=A0 =C2=A0U_PM_CURRENT<br>
&gt; -#define UMTE_U_PM_INSN=C2=A0 =C2=A0 =C2=A0 U_PM_INSN<br>
&gt; -#define UMTE_MASK=C2=A0 =C2=A0 =C2=A0(UMTE_U_PM_ENABLE | MMTE_U_PM_CU=
RRENT | UMTE_U_PM_INSN)<br>
&gt; -<br>
&gt;=C2=A0 /* MISELECT, SISELECT, and VSISELECT bits (AIA) */<br>
&gt;=C2=A0 #define ISELECT_IPRIO0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x30<br>
&gt;=C2=A0 #define ISELECT_IPRIO15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3f<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index e7e23b34f4..a3d477d226 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -135,61 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, va=
ddr *pc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env-&gt;=
xl);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_add=
ress_xl(env));<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;cur_pmmask !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, PM_=
MASK_ENABLED, 1);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;cur_pmbase !=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, PM_=
BASE_ENABLED, 1);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *pflags =3D flags;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -void riscv_cpu_update_mask(CPURISCVState *env)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 target_ulong mask =3D 0, base =3D 0;<br>
&gt; -=C2=A0 =C2=A0 RISCVMXL xl =3D env-&gt;xl;<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* TODO: Current RVJ spec does not specify<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* how the extension interacts with XLEN.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -#ifndef CONFIG_USER_ONLY<br>
&gt; -=C2=A0 =C2=A0 int mode =3D cpu_address_mode(env);<br>
&gt; -=C2=A0 =C2=A0 xl =3D cpu_get_xl(env, mode);<br>
&gt; -=C2=A0 =C2=A0 if (riscv_has_ext(env, RVJ)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (mode) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PRV_M:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;mmte &amp; M_PM=
_ENABLE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D env-=
&gt;mpmmask;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D env-=
&gt;mpmbase;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PRV_S:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;mmte &amp; S_PM=
_ENABLE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D env-=
&gt;spmmask;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D env-=
&gt;spmbase;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PRV_U:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;mmte &amp; U_PM=
_ENABLE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D env-=
&gt;upmmask;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D env-=
&gt;upmbase;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -#endif<br>
&gt; -=C2=A0 =C2=A0 if (xl =3D=3D MXL_RV32) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask =3D mask &amp; UINT32_=
MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase =3D base &amp; UINT32_=
MAX;<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask =3D mask;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase =3D base;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; @@ -721,7 +670,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, target=
_ulong newpriv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* tlb_flush is unnecessary as mode is contained i=
n mmu_idx */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;priv =3D newpriv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;xl =3D cpu_recompute_xl(env);<br>
&gt; -=C2=A0 =C2=A0 riscv_cpu_update_mask(env);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Clear the load reservation - otherwise a r=
eservation placed in one<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index fde7ce1a53..ea4e1ac6ef 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -483,16 +483,6 @@ static RISCVException hgatp(CPURISCVState *env, i=
nt csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return hmode(env, csrno);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -/* Checks if PointerMasking registers could be accessed */<br>
&gt; -static RISCVException pointer_masking(CPURISCVState *env, int csrno)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 /* Check if j-ext is present */<br>
&gt; -=C2=A0 =C2=A0 if (riscv_has_ext(env, RVJ)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static int aia_hmode(CPURISCVState *env, int csrno)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!riscv_cpu_cfg(env)-&gt;ext_ssaia) {<br>
&gt; @@ -1355,7 +1345,6 @@ static RISCVException write_mstatus(CPURISCVStat=
e *env, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;xl =3D cpu_recompute_xl(env)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 riscv_cpu_update_mask(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -3900,302 +3889,6 @@ static RISCVException read_tinfo(CPURISCVState=
 *env, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -/*<br>
&gt; - * Functions to access Pointer Masking feature registers<br>
&gt; - * We have to check if current priv lvl could modify<br>
&gt; - * csr in given mode<br>
&gt; - */<br>
&gt; -static bool check_pm_current_disabled(CPURISCVState *env, int csrno)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 int csr_priv =3D get_field(csrno, 0x300);<br>
&gt; -=C2=A0 =C2=A0 int pm_current;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;debugger) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* If priv lvls differ that means we&#39;re access=
ing csr from higher priv lvl,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* so allow the access<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;priv !=3D csr_priv) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 switch (env-&gt;priv) {<br>
&gt; -=C2=A0 =C2=A0 case PRV_M:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_current =3D get_field(env-&gt;mmte, M_=
PM_CURRENT);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case PRV_S:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_current =3D get_field(env-&gt;mmte, S_=
PM_CURRENT);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case PRV_U:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_current =3D get_field(env-&gt;mmte, U_=
PM_CURRENT);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 /* It&#39;s same priv lvl, so we allow to modify csr on=
ly if pm.current=3D=3D1 */<br>
&gt; -=C2=A0 =C2=A0 return !pm_current;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_mmte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mmte &amp; MMTE_MASK;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_mmte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -=C2=A0 =C2=A0 target_ulong wpri_val =3D val &amp; MMTE_MASK;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (val !=3D wpri_val) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s&q=
uot; TARGET_FMT_lx &quot; %s&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 TARGET_FMT_lx &quot;\n&quot;, &quot;MMTE: WPRI violation written 0x=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 val, &quot;vs expected 0x&quot;, wpri_val);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 /* for machine mode pm.current is hardwired to 1 */<br>
&gt; -=C2=A0 =C2=A0 wpri_val |=3D MMTE_M_PM_CURRENT;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* hardwiring pm.instruction bit to 0, since it&#39;s n=
ot supported yet */<br>
&gt; -=C2=A0 =C2=A0 wpri_val &amp;=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | M=
MTE_U_PM_INSN);<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte =3D wpri_val | EXT_STATUS_DIRTY;<br>
&gt; -=C2=A0 =C2=A0 riscv_cpu_update_mask(env);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_smte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mmte &amp; SMTE_MASK;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_smte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 target_ulong wpri_val =3D val &amp; SMTE_MASK;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (val !=3D wpri_val) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s&q=
uot; TARGET_FMT_lx &quot; %s&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 TARGET_FMT_lx &quot;\n&quot;, &quot;SMTE: WPRI violation written 0x=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 val, &quot;vs expected 0x&quot;, wpri_val);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* if pm.current=3D=3D0 we can&#39;t modify current PM =
CSRs */<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 wpri_val |=3D (env-&gt;mmte &amp; ~SMTE_MASK);<br>
&gt; -=C2=A0 =C2=A0 write_mmte(env, csrno, wpri_val);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_umte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mmte &amp; UMTE_MASK;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_umte(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 target_ulong wpri_val =3D val &amp; UMTE_MASK;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (val !=3D wpri_val) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s&q=
uot; TARGET_FMT_lx &quot; %s&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 TARGET_FMT_lx &quot;\n&quot;, &quot;UMTE: WPRI violation written 0x=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 val, &quot;vs expected 0x&quot;, wpri_val);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 wpri_val |=3D (env-&gt;mmte &amp; ~UMTE_MASK);<br>
&gt; -=C2=A0 =C2=A0 write_mmte(env, csrno, wpri_val);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_mpmmask(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mpmmask;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_mpmmask(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mpmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_M) &amp;&amp; (en=
v-&gt;mmte &amp; M_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_spmmask(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;spmmask;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_spmmask(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* if pm.current=3D=3D0 we can&#39;t modify current PM =
CSRs */<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;spmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_S) &amp;&amp; (en=
v-&gt;mmte &amp; S_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV3=
2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask &amp;=3D=
 UINT32_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_upmmask(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;upmmask;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_upmmask(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* if pm.current=3D=3D0 we can&#39;t modify current PM =
CSRs */<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;upmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_U) &amp;&amp; (en=
v-&gt;mmte &amp; U_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV3=
2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmmask &amp;=3D=
 UINT32_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_mpmbase(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mpmbase;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_mpmbase(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mpmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_M) &amp;&amp; (en=
v-&gt;mmte &amp; M_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_spmbase(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;spmbase;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_spmbase(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* if pm.current=3D=3D0 we can&#39;t modify current PM =
CSRs */<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;spmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_S) &amp;&amp; (en=
v-&gt;mmte &amp; S_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_get_xl(env, PRV_S) =3D=3D MXL_RV3=
2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase &amp;=3D=
 UINT32_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException read_upmbase(CPURISCVState *env, int csrno,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;upmbase;<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static RISCVException write_upmbase(CPURISCVState *env, int csrno,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 uint64_t mstatus;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* if pm.current=3D=3D0 we can&#39;t modify current PM =
CSRs */<br>
&gt; -=C2=A0 =C2=A0 if (check_pm_current_disabled(env, csrno)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;upmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 if ((cpu_address_mode(env) =3D=3D PRV_U) &amp;&amp; (en=
v-&gt;mmte &amp; U_PM_ENABLE)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_get_xl(env, PRV_U) =3D=3D MXL_RV3=
2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;cur_pmbase &amp;=3D=
 UINT32_MAX;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mmte |=3D EXT_STATUS_DIRTY;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Set XS and SD bits, since PM CSRs are dirty */<br>
&gt; -=C2=A0 =C2=A0 mstatus =3D env-&gt;mstatus | MSTATUS_XS;<br>
&gt; -=C2=A0 =C2=A0 write_mstatus(env, csrno, mstatus);<br>
&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt;=C2=A0 /* Crypto Extension */<br>
&gt; @@ -4800,25 +4493,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TDATA3]=C2=A0 =C2=A0 =3D=C2=A0 { &quot;tdata3=
&quot;,=C2=A0 debug, read_tdata,=C2=A0 =C2=A0write_tdata=C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TINFO]=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 { &quot;t=
info&quot;,=C2=A0 =C2=A0debug, read_tinfo,=C2=A0 =C2=A0write_ignore=C2=A0 }=
,<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* User Pointer Masking */<br>
&gt; -=C2=A0 =C2=A0 [CSR_UMTE]=C2=A0 =C2=A0 =3D=C2=A0 =C2=A0 { &quot;umte&q=
uot;,=C2=A0 =C2=A0 pointer_masking, read_umte,=C2=A0 write_umte },<br>
&gt; -=C2=A0 =C2=A0 [CSR_UPMMASK] =3D=C2=A0 =C2=A0 { &quot;upmmask&quot;, p=
ointer_masking, read_upmmask,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_upmmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_UPMBASE] =3D=C2=A0 =C2=A0 { &quot;upmbase&quot;, p=
ointer_masking, read_upmbase,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_upmbase=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 /* Machine Pointer Masking */<br>
&gt; -=C2=A0 =C2=A0 [CSR_MMTE]=C2=A0 =C2=A0 =3D=C2=A0 =C2=A0 { &quot;mmte&q=
uot;,=C2=A0 =C2=A0 pointer_masking, read_mmte,=C2=A0 write_mmte },<br>
&gt; -=C2=A0 =C2=A0 [CSR_MPMMASK] =3D=C2=A0 =C2=A0 { &quot;mpmmask&quot;, p=
ointer_masking, read_mpmmask,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_mpmmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_MPMBASE] =3D=C2=A0 =C2=A0 { &quot;mpmbase&quot;, p=
ointer_masking, read_mpmbase,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_mpmbase=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 /* Supervisor Pointer Masking */<br>
&gt; -=C2=A0 =C2=A0 [CSR_SMTE]=C2=A0 =C2=A0 =3D=C2=A0 =C2=A0 { &quot;smte&q=
uot;,=C2=A0 =C2=A0 pointer_masking, read_smte,=C2=A0 write_smte },<br>
&gt; -=C2=A0 =C2=A0 [CSR_SPMMASK] =3D=C2=A0 =C2=A0 { &quot;spmmask&quot;, p=
ointer_masking, read_spmmask,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_spmmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_SPMBASE] =3D=C2=A0 =C2=A0 { &quot;spmbase&quot;, p=
ointer_masking, read_spmbase,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0write_spmbase=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Performance Counters */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_HPMCOUNTER3]=C2=A0 =C2=A0 =3D { &quot;hpmcoun=
ter3&quot;,=C2=A0 =C2=A0 ctr,=C2=A0 =C2=A0 read_hpmcounter },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_HPMCOUNTER4]=C2=A0 =C2=A0 =3D { &quot;hpmcoun=
ter4&quot;,=C2=A0 =C2=A0 ctr,=C2=A0 =C2=A0 read_hpmcounter },<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index fdde243e04..860fe56d43 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -164,14 +164,6 @@ static const VMStateDescription vmstate_pointerma=
sking =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
<br>
The version_id and minimum_version_id should be bumped here<br>
<br>
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .needed =3D pointermasking_needed,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mmte, RISCVCPU),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mpmmask, RISCVCPU),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mpmbase, RISCVCPU),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.spmmask, RISCVCPU),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.spmbase, RISCVCPU),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.upmmask, RISCVCPU),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.upmbase, RISCVCPU),<br=
>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 };<br>
&gt; @@ -267,7 +259,6 @@ static int riscv_cpu_post_load(void *opaque, int v=
ersion_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;xl =3D cpu_recompute_xl(env);<br>
&gt; -=C2=A0 =C2=A0 riscv_cpu_update_mask(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index f0be79bb16..6b4b9a671c 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -42,9 +42,6 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_v=
l, cpu_vstart;<br>
&gt;=C2=A0 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */<br>
&gt;=C2=A0 static TCGv load_res;<br>
&gt;=C2=A0 static TCGv load_val;<br>
&gt; -/* globals for PM CSRs */<br>
&gt; -static TCGv pm_mask;<br>
&gt; -static TCGv pm_base;<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* If an operation is being performed on less than TARGET_L=
ONG_BITS,<br>
&gt; @@ -106,9 +103,6 @@ typedef struct DisasContext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool vl_eq_vlmax;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TCGv zero;<br>
&gt; -=C2=A0 =C2=A0 /* PointerMasking extension */<br>
&gt; -=C2=A0 =C2=A0 bool pm_mask_enabled;<br>
&gt; -=C2=A0 =C2=A0 bool pm_base_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Use icount trigger for native debug */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool itrigger;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* FRM is known to contain a valid value. */<br>
&gt; @@ -582,14 +576,9 @@ static TCGv get_address(DisasContext *ctx, int rs=
1, int imm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_tl(addr, src1, imm);<br>
&gt; -=C2=A0 =C2=A0 if (ctx-&gt;pm_mask_enabled) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andc_tl(addr, addr, pm_mask);<br>
&gt; -=C2=A0 =C2=A0 } else if (get_address_xl(ctx) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 if (get_address_xl(ctx) =3D=3D MXL_RV32) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ext32u_tl(addr, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (ctx-&gt;pm_base_enabled) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_or_tl(addr, addr, pm_base);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return addr;<br>
&gt;=C2=A0 }<br>
&gt; @@ -601,14 +590,9 @@ static TCGv get_address_indexed(DisasContext *ctx=
, int rs1, TCGv offs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tcg_gen_add_tl(addr, src1, offs);<br>
&gt; -=C2=A0 =C2=A0 if (ctx-&gt;pm_mask_enabled) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andc_tl(addr, addr, pm_mask);<br>
&gt; -=C2=A0 =C2=A0 } else if (get_xl(ctx) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 if (get_xl(ctx) =3D=3D MXL_RV32) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ext32u_tl(addr, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (ctx-&gt;pm_base_enabled) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_or_tl(addr, addr, pm_base);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return addr;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -1192,8 +1176,6 @@ static void riscv_tr_init_disas_context(DisasCon=
textBase *dcbase, CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;address_xl =3D FIELD_EX32(tb_flags, TB_FLA=
GS, AXL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;cs =3D cs;<br>
&gt; -=C2=A0 =C2=A0 ctx-&gt;pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLA=
GS, PM_MASK_ENABLED);<br>
&gt; -=C2=A0 =C2=A0 ctx-&gt;pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLA=
GS, PM_BASE_ENABLED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS=
, ITRIGGER);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;zero =3D tcg_constant_tl(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;virt_inst_excp =3D false;<br>
&gt; @@ -1325,9 +1307,4 @@ void riscv_translate_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;load_res&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 load_val =3D tcg_global_mem_new(tcg_env, offsetof(=
CPURISCVState, load_val),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;load_val&quot;);<br>
&gt; -=C2=A0 =C2=A0 /* Assign PM CSRs to tcg globals */<br>
&gt; -=C2=A0 =C2=A0 pm_mask =3D tcg_global_mem_new(tcg_env, offsetof(CPURIS=
CVState, cur_pmmask),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pmmask&quot;);<br>
&gt; -=C2=A0 =C2=A0 pm_base =3D tcg_global_mem_new(tcg_env, offsetof(CPURIS=
CVState, cur_pmbase),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pmbase&quot;);<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper=
.c<br>
&gt; index c1c3a4d1ea..8e7a8e80a0 100644<br>
&gt; --- a/target/riscv/vector_helper.c<br>
&gt; +++ b/target/riscv/vector_helper.c<br>
&gt; @@ -94,7 +94,7 @@ static inline uint32_t vext_max_elems(uint32_t desc,=
 uint32_t log2_esz)<br>
&gt;<br>
&gt;=C2=A0 static inline target_ulong adjust_addr(CPURISCVState *env, targe=
t_ulong addr)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return (addr &amp; ~env-&gt;cur_pmmask) | env-&gt;cur_p=
mbase;<br>
&gt; +=C2=A0 =C2=A0 return addr;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000007b7e63060e2dbbe3--

