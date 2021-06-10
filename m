Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTSF-0008Q1-CB
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 18:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTSE-0008OZ-Js; Thu, 10 Jun 2021 18:47:14 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTSB-0006Ch-Le; Thu, 10 Jun 2021 18:47:14 -0400
Received: by mail-io1-xd2e.google.com with SMTP id k22so28864304ioa.9;
 Thu, 10 Jun 2021 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDZ+iDXeSwxVsCAhoZ/HWe9xmUoTr02O4OF0WNDFd0U=;
 b=lPzJ67aqmMmuBX42ct3qwHINVm0VoudR3fENBZsU18KAa+z+UikafLyv7JfuMU9Abc
 tCHg8IExkFhMiS8WOTAZMEX7K9vqEEoaA+gz4ryfadCWCY20MY/PtOVIvX3HSo3oIUnr
 rvPZjb3I4d5Z2R6srh3rVvsMtRUOZuLCvy0Nxnmj9Y+qxBR5AxSIM8mg07wZISKogUlE
 AjkEwBYVG5CsUSnry0SEAsXzafSqbKUWXeTDYViDex0fCz8qnz1VE2thSl5EqegTK4b3
 XfOBUzel95+GOSnmiCn7szQgUrRZ32FvWMminqMIA9RyRaPqjmKfI5075IZyOTg2fWpr
 2WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDZ+iDXeSwxVsCAhoZ/HWe9xmUoTr02O4OF0WNDFd0U=;
 b=DeV05r0CIdSQiRMdvHKXnfPBYxWLjtdr5fLRz7LZXjVX2XxCHBwcuv/tHWaGsP3UlX
 ZAq9CDrGsRpmOd2oM5udjoayPcYlZHitdm1TXZdJRHSMX+Nd6aaJPUYoSZtWyasoikFf
 QIU/EE2/vU6mVGF756YymhAKZZeknQEA59jX/gAYX97VCJLatRBSa897HKvfqNkq4DCD
 ketRahpGA3s3VV6K9qtm2i8QpiBMA/yr7MqqQ+q3+2e7vfheWfbAuEody6jz82Ivn9su
 JWtyXkIDEa9ZzQBoCqoib13ZSa6D7zIkim+yqaeXiBjClFg9gGqfUMiCA/6uAH4OfmmB
 L29w==
X-Gm-Message-State: AOAM532Mpm6qX0/sfQpvECn/R6Dzq1K4jRlMtuRwQGchlptQadgTlaXI
 +W8sgIFsyLonFfu9bcooAbJ4aADVHgWrMa1CtQY=
X-Google-Smtp-Source: ABdhPJxE0pr1K1VVbnIoQB6VWKWOcFt/jF9t52+cnMbcavHxnit7v4l2TbvbngYnhNQ7WmGTL9qT8O21U/2+HX/M9cU=
X-Received: by 2002:a05:6638:1355:: with SMTP id
 u21mr861617jad.106.1623365229941; 
 Thu, 10 Jun 2021 15:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
 <20210526175749.25709-3-space.monkey.delivers@gmail.com>
In-Reply-To: <20210526175749.25709-3-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 08:46:43 +1000
Message-ID: <CAKmqyKMNuqRqKyewHb-ZWVcGXzoUDPY6HskgDY=OtYysawqZ+Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 22:47:14 -0000

On Thu, May 27, 2021 at 4:23 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Hey,

Thanks for the patch. Sorry it takes me so long to get to. It would
help if you could split this patch up just a little bit more.

Overall it looks good. Thanks for updating it to use the new CSR mechanism.

> ---
>  target/riscv/cpu.c      |   6 +
>  target/riscv/cpu.h      |  12 ++
>  target/riscv/cpu_bits.h |  97 +++++++++++++
>  target/riscv/csr.c      | 306 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 421 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3191fd0082..9841711e71 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -486,6 +486,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_h) {
>              target_misa |= RVH;
>          }
> +        if (cpu->cfg.ext_j) {
> +#ifndef CONFIG_USER_ONLY
> +            /* mmte is supposed to have pm.current hardwired to 1 */
> +            env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> +#endif
> +        }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1673872223..a68e523d87 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -233,6 +233,18 @@ struct CPURISCVState {
>
>      /* True if in debugger mode.  */
>      bool debugger;
> +
> +    /*
> +     * CSRs for PointerMasking extension
> +     * TODO: move these csr to appropriate groups

I don't think we need this TODO here.

> +     */
> +    target_ulong mmte;
> +    target_ulong mpmmask;
> +    target_ulong mpmbase;
> +    target_ulong spmmask;
> +    target_ulong spmbase;
> +    target_ulong upmmask;
> +    target_ulong upmbase;
>  #endif
>
>      float_status fp_status;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 52640e6856..97e2aa8a97 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -334,6 +334,39 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> +
> +/*
> + * User PointerMasking registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_UMTE            0x4c0
> +#define CSR_UPMMASK         0x4c1
> +#define CSR_UPMBASE         0x4c2
> +
> +/*
> + * Machine PointerMasking registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_MMTE            0x3c0
> +#define CSR_MPMMASK         0x3c1
> +#define CSR_MPMBASE         0x3c2
> +
> +/*
> + * Supervisor PointerMaster registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_SMTE            0x1c0
> +#define CSR_SPMMASK         0x1c1
> +#define CSR_SPMBASE         0x1c2
> +
> +/*
> + * Hypervisor PointerMaster registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_VSMTE           0x2c0
> +#define CSR_VSPMMASK        0x2c1
> +#define CSR_VSPMBASE        0x2c2
> +

I do expect these to change. Have they been submitted yet to determine
the final addresses?

>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -530,4 +563,68 @@ typedef enum RISCVException {
>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> +
> +/* General PointerMasking CSR bits*/
> +#define PM_ENABLE       0x00000001ULL
> +#define PM_CURRENT      0x00000002ULL
> +#define PM_INSN         0x00000004ULL
> +#define PM_XS_MASK      0x00000003ULL
> +
> +/* PointerMasking XS bits values */
> +#define PM_EXT_DISABLE  0x00000000ULL
> +#define PM_EXT_INITIAL  0x00000001ULL
> +#define PM_EXT_CLEAN    0x00000002ULL
> +#define PM_EXT_DIRTY    0x00000003ULL
> +
> +/* Offsets for every pair of control bits per each priv level */
> +#define XS_OFFSET    0ULL
> +#define U_OFFSET     2ULL
> +#define S_OFFSET     5ULL
> +#define M_OFFSET     8ULL
> +
> +#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
> +#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
> +#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
> +#define U_PM_INSN    (PM_INSN    << U_OFFSET)
> +#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
> +#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
> +#define S_PM_INSN    (PM_INSN    << S_OFFSET)
> +#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
> +#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
> +#define M_PM_INSN    (PM_INSN    << M_OFFSET)
> +
> +/* mmte CSR bits */
> +#define MMTE_PM_XS_BITS     PM_XS_BITS
> +#define MMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define MMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define MMTE_U_PM_INSN      U_PM_INSN
> +#define MMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define MMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define MMTE_S_PM_INSN      S_PM_INSN
> +#define MMTE_M_PM_ENABLE    M_PM_ENABLE
> +#define MMTE_M_PM_CURRENT   M_PM_CURRENT
> +#define MMTE_M_PM_INSN      M_PM_INSN
> +#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_INSN | \
> +                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \
> +                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \
> +                      MMTE_PM_XS_BITS)
> +
> +/* (v)smte CSR bits */
> +#define SMTE_PM_XS_BITS     PM_XS_BITS
> +#define SMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define SMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define SMTE_U_PM_INSN      U_PM_INSN
> +#define SMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define SMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define SMTE_S_PM_INSN      S_PM_INSN
> +#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_INSN | \
> +                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \
> +                      SMTE_PM_XS_BITS)
> +
> +/* umte CSR bits */
> +#define UMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define UMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define UMTE_U_PM_INSN      U_PM_INSN
> +#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
> +
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fe5628fea6..e1c5bb9c35 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -192,6 +192,16 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
>
>  }
>
> +/* Checks if PointerMasking registers could be accessed */
> +static RISCVException pointer_masking(CPURISCVState *env, int csrno)
> +{
> +    /* Check if j-ext is present */
> +    if (riscv_has_ext(env, RVJ)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
>  static RISCVException pmp(CPURISCVState *env, int csrno)
>  {
>      if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> @@ -1420,6 +1430,289 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +/*
> + * Functions to access Pointer Masking feature registers
> + * We have to check if current priv lvl could modify
> + * csr in given mode
> + */
> +static int check_pm_current_disabled(CPURISCVState *env, int csrno)
> +{
> +    int csr_priv = get_field(csrno, 0x300);
> +    /*
> +     * If priv lvls differ that means we're accessing csr from higher priv lvl,
> +     * so allow the access
> +     */
> +    if (env->priv != csr_priv) {
> +        return 0;
> +    }
> +    int cur_bit_pos;
> +    switch (env->priv) {
> +    case PRV_M:
> +        cur_bit_pos = M_PM_CURRENT;
> +        break;
> +    case PRV_S:
> +        cur_bit_pos = S_PM_CURRENT;
> +        break;
> +    case PRV_U:
> +        cur_bit_pos = U_PM_CURRENT;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    int pm_current = get_field(env->mmte, cur_bit_pos);
> +    /* It's same priv lvl, so we allow to modify csr only if pm.current==1 */
> +    return !pm_current;
> +}

This function should return a bool

> +
> +static RISCVException read_mmte(CPURISCVState *env, int csrno,
> +                                target_ulong *val)
> +{
> +    *val = env->mmte & MMTE_MASK;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mmte(CPURISCVState *env, int csrno,
> +                                 target_ulong val)
> +{
> +    uint64_t mstatus;
> +    target_ulong wpri_val = val & MMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    /* for machine mode pm.current is hardwired to 1 */
> +    wpri_val |= MMTE_M_PM_CURRENT;
> +    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
> +    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> +    env->mmte = wpri_val | PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_smte(CPURISCVState *env, int csrno,
> +                                target_ulong *val)
> +{
> +    *val = env->mmte & SMTE_MASK;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_smte(CPURISCVState *env, int csrno,
> +                                 target_ulong val)
> +{
> +    target_ulong wpri_val = val & SMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;

Is this not an exception?

> +    }

You could also do with some more new lines in your functions to split
it up a bit :)

> +    target_ulong new_val = wpri_val | (env->mmte & ~SMTE_MASK);
> +    write_mmte(env, csrno, new_val);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_umte(CPURISCVState *env, int csrno,
> +                                target_ulong *val)
> +{
> +    *val = env->mmte & UMTE_MASK;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_umte(CPURISCVState *env, int csrno,
> +                                 target_ulong val)
> +{
> +    target_ulong wpri_val = val & UMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "UMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    target_ulong new_val = wpri_val | (env->mmte & ~UMTE_MASK);
> +    write_mmte(env, csrno, new_val);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->mpmmask;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    env->mpmmask = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;

Maybe it's worth splitting out the mstatus update into it's own helper?

Alistair

> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_spmmask(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->spmmask;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_spmmask(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    env->spmmask = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_upmmask(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->upmmask;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_upmmask(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    env->upmmask = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->mpmbase;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    env->mpmbase = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_spmbase(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->spmbase;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_spmbase(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    env->spmbase = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_upmbase(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = env->upmbase;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_upmbase(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    uint64_t mstatus;
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +    env->upmbase = val;
> +    env->mmte |= PM_EXT_DIRTY;
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus;
> +    if (riscv_cpu_is_32bit(env)) {
> +        mstatus = set_field(mstatus, MSTATUS32_SD, 1);
> +    } else {
> +        mstatus = set_field(mstatus, MSTATUS64_SD, 1);
> +    }
> +    env->mstatus |= MSTATUS_XS;
> +    env->mstatus = mstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #endif
>
>  /*
> @@ -1652,6 +1945,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
>      [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
>
> +    /* User Pointer Masking */
> +    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
> +    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> +    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
> +    /* Machine Pointer Masking */
> +    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
> +    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
> +    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
> +    /* Supervisor Pointer Masking */
> +    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
> +    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
> +    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
> +
>      /* Performance Counters */
>      [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
>      [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
> --
> 2.20.1
>
>

