Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lghpM-0006P8-Gy
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 01:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghpL-0006Os-4e; Wed, 12 May 2021 01:54:35 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghpH-0000ZY-Hr; Wed, 12 May 2021 01:54:34 -0400
Received: by mail-io1-xd36.google.com with SMTP id n10so20494244ion.8;
 Tue, 11 May 2021 22:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lVedLZTxo6Hj3yHEIqX+GF6b70JX9qxB6rP5/rt5Ip0=;
 b=PZ0xUDNZPsRwbYQA3TRmO2BmQXVwd+3HS/TPy3Iodzvk8kpJcbDbsmIJK5aLxOnQEC
 ATRLsv3TXYQtNYZGHaav3WPZLcDEGP+SLfXAwmfsUSW9mYwZgOnNxoDSk+tcop38maav
 Xa+kwDFhJjzGCry6PpUyfJNPW5a2hjxVuqiAuhB7mMhmmZ+aTDsZyHZaDw05gPIhpkbL
 lAWhgCdQnFLjT8WZFxCjAi8fNtH0WfiGQH7MstWvPxItb4BrnBZHPpqiWw0LxbUSwlmZ
 sJZhzpHC3h65Ddccwf1YxoGyMu8FojlhJJYllVa9XU6ZlAhM2WL2iVx+9/EYEhHHao4t
 /9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVedLZTxo6Hj3yHEIqX+GF6b70JX9qxB6rP5/rt5Ip0=;
 b=BkCrNrS7IYK6hWf9ZbeV5PjXZ5iFt+dcgkUKRjJC/OQBCCRB9IN66b3mmV5oMCu5LL
 nYBx8d5siJOSuH+Q5NehVHA6qqp56Hk+0GGzLoRrMpxHWQkdSALZwv5p0s7FaUcpCDyW
 0mZbFiYV/CdfDAn02sglMnL+ESRUiOl2dUuipzEKi3HGvs7QQ6cqagqLCitiEnM4Ol5n
 t/TTEXktf0A6HsBQOGe25whP39skMDwFXfPlAGAvb8HaEZ88/OeGuXTA1TGGWg7BUIW3
 YkKUfXMXXij+0GB7VCY4dhoQ7378XuP5Kw+t3ppaH72P5gZqeHTnxxGLI02MYcHx7jzo
 01bg==
X-Gm-Message-State: AOAM530YOwuU2+sJw09ic5w7xUT2LZeOIUuRIw69TgZF8zvuN1aShck2
 pdvu2VMjEj8UVT1AFBIWnRRtIWHo4UI5jusyE9M=
X-Google-Smtp-Source: ABdhPJzwvfBWKKmwh8jmxE4pmIUSr5Beo50j0JVocpdK11kzixMz5P59ISu60uiwoj0A5HviMOaX8WDGNTbXTr//csU=
X-Received: by 2002:a6b:c857:: with SMTP id y84mr24982002iof.118.1620798868874; 
 Tue, 11 May 2021 22:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
 <20210428041848.12982-3-space.monkey.delivers@gmail.com>
In-Reply-To: <20210428041848.12982-3-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 May 2021 15:54:02 +1000
Message-ID: <CAKmqyKP2_JXS4S3wxixx-1_9=RDeOsfrmVwbSQ1dLuXGgJwCiQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v8 2/6] [RISCV_PM] Support CSRs required for RISC-V
 PM extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Wed, 12 May 2021 05:54:35 -0000

On Wed, Apr 28, 2021 at 2:19 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
> resend:
>   minor codestyle fix
>
>  target/riscv/cpu.c      |   5 +
>  target/riscv/cpu.h      |  12 ++
>  target/riscv/cpu_bits.h |  66 +++++++++++
>  target/riscv/csr.c      | 240 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 323 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..c04911ec05 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -473,6 +473,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_h) {
>              target_misa |= RVH;
>          }
> +        if (cpu->cfg.ext_j) {
> +#ifndef CONFIG_USER_ONLY
> +            env->mmte |= PM_EXT_INITIAL;
> +#endif
> +        }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0ea9fc65c8..19aa3b4769 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -238,6 +238,18 @@ struct CPURISCVState {
>
>      /* True if in debugger mode.  */
>      bool debugger;
> +
> +    /*
> +     * CSRs for PM
> +     * TODO: move these csr to appropriate groups
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
> index caf4599207..f8e7cdb99b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -354,6 +354,21 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> +/* Custom user register */
> +#define CSR_UMTE            0x8c0
> +#define CSR_UPMMASK         0x8c1
> +#define CSR_UPMBASE         0x8c2
> +
> +/* Custom machine register */
> +#define CSR_MMTE            0x7c0
> +#define CSR_MPMMASK         0x7c1
> +#define CSR_MPMBASE         0x7c2
> +
> +/* Custom supervisor register */
> +#define CSR_SMTE            0x9c0
> +#define CSR_SPMMASK         0x9c1
> +#define CSR_SPMBASE         0x9c2

I don't like that the addresses aren't specified anywhere. Do you know
when they will be decided?

> +
>  /* Legacy Machine Protection and Translation (priv v1.9.1) */
>  #define CSR_MBASE           0x380
>  #define CSR_MBOUND          0x381
> @@ -592,4 +607,55 @@
>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> +
> +/* general mte CSR bits*/
> +#define PM_ENABLE       0x00000001ULL
> +#define PM_CURRENT      0x00000002ULL
> +#define PM_XS_MASK      0x00000003ULL
> +
> +/* PM XS bits values */
> +#define PM_EXT_DISABLE  0x00000000ULL
> +#define PM_EXT_INITIAL  0x00000001ULL
> +#define PM_EXT_CLEAN    0x00000002ULL
> +#define PM_EXT_DIRTY    0x00000003ULL
> +
> +/* offsets for every pair of control bits per each priv level */
> +#define XS_OFFSET    0ULL
> +#define U_OFFSET     2ULL
> +#define S_OFFSET     4ULL
> +#define M_OFFSET     6ULL
> +
> +#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
> +#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
> +#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
> +#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
> +#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
> +#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
> +
> +/* mmte CSR bits */
> +#define MMTE_PM_XS_BITS     PM_XS_BITS
> +#define MMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define MMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define MMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define MMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define MMTE_M_PM_ENABLE    M_PM_ENABLE
> +#define MMTE_MASK           (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | \
> +                             MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | \
> +                             MMTE_M_PM_ENABLE | MMTE_PM_XS_BITS)
> +
> +/* smte CSR bits */
> +#define SMTE_PM_XS_BITS     PM_XS_BITS
> +#define SMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define SMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define SMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define SMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define SMTE_MASK           (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | \
> +                             SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | \
> +                             SMTE_PM_XS_BITS)
> +
> +/* umte CSR bits */
> +#define UMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define UMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define UMTE_MASK           (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT)
> +
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..bef65c5ae1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -184,6 +184,39 @@ static int hmode32(CPURISCVState *env, int csrno)
>
>  }
>
> +static int umode(CPURISCVState *env, int csrno)
> +{
> +    return -!riscv_has_ext(env, RVU);
> +}
> +
> +/* Checks if PointerMasking registers could be accessed */
> +static int pointer_masking(CPURISCVState *env, int csrno)
> +{
> +    /* Check if j-ext is present */
> +    int j_check = -!riscv_has_ext(env, RVJ);
> +    int mode_check = 0;
> +    int csr_priv = get_field(csrno, 0x300);
> +    /* check if particular mode is present */
> +    switch (csr_priv) {
> +    case PRV_M:
> +        mode_check = any(env, csrno);
> +        break;
> +    case PRV_S:
> +        mode_check = smode(env, csrno);
> +        break;
> +    case PRV_U:
> +        mode_check = umode(env, csrno);
> +        break;
> +    default:

Can't we just use the generic check based on the CSR address?

Then this will be a simple `riscv_has_ext(env, RVJ)` check.

Alistair

> +        g_assert_not_reached();
> +    }
> +    /* raise fault if no j-ext or particular mode are present */
> +    if (j_check < 0) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    return mode_check;
> +}
> +
>  static int pmp(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_feature(env, RISCV_FEATURE_PMP);
> @@ -1263,6 +1296,200 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
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
> +        /* m-mode is always allowed to modify registers, so allow */
> +        return 0;
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
> +    /* It's same priv lvl, so we allow to modify csr only if pm_current==1 */
> +    return !pm_current;
> +}
> +
> +static int read_mmte(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mmte & MMTE_MASK;
> +    return  0;
> +}
> +
> +static int write_mmte(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    target_ulong wpri_val = val & MMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    env->mmte = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_smte(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mmte & SMTE_MASK;
> +    return 0;
> +}
> +
> +static int write_smte(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    target_ulong wpri_val = val & SMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    target_ulong new_val = val | (env->mmte & ~SMTE_MASK);
> +    write_mmte(env, csrno, new_val);
> +    return 0;
> +}
> +
> +static int read_umte(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mmte & UMTE_MASK;
> +    return 0;
> +}
> +
> +static int write_umte(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    target_ulong wpri_val = val & UMTE_MASK;
> +    if (val != wpri_val) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "UMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
> +                      val, wpri_val);
> +    }
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    target_ulong new_val = val | (env->mmte & ~UMTE_MASK);
> +    write_mmte(env, csrno, new_val);
> +    return 0;
> +}
> +
> +static int read_mpmmask(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mpmmask;
> +    return 0;
> +}
> +
> +static int write_mpmmask(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mpmmask = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_spmmask(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->spmmask;
> +    return 0;
> +}
> +
> +static int write_spmmask(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    env->spmmask = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_upmmask(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->upmmask;
> +    return 0;
> +}
> +
> +static int write_upmmask(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    env->upmmask = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_mpmbase(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mpmbase;
> +    return 0;
> +}
> +
> +static int write_mpmbase(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mpmbase = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_spmbase(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->spmbase;
> +    return 0;
> +}
> +
> +static int write_spmbase(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    env->spmbase = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
> +static int read_upmbase(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->upmbase;
> +    return 0;
> +}
> +
> +static int write_upmbase(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return 0;
> +    }
> +    env->upmbase = val;
> +    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
> +    env->mmte |= PM_EXT_DIRTY;
> +    return 0;
> +}
> +
>  #endif
>
>  /*
> @@ -1494,6 +1721,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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

