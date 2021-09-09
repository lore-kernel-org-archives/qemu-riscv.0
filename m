Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOD4D-0006mG-GH
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 01:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOD4B-0006m0-Mw; Thu, 09 Sep 2021 01:57:43 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:45786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOD48-00075G-SP; Thu, 09 Sep 2021 01:57:43 -0400
Received: by mail-il1-x129.google.com with SMTP id x10so755989ilm.12;
 Wed, 08 Sep 2021 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tklu5SixxvbDgE59M7DylkNZWdMD7D/f+GnO20MVcrg=;
 b=AZUjJCUT1gc765JQGWOx0t2j9r9Yayyv4qoqZxsVL9UoYE6qy9PVFIrX4WZiJBMyHL
 FwLjaI/1JgHU48Yc9JYizkkaoWjgDAOIUvx7p3b6hclp7Vh4Me08/8K5xosZCWwNv6sK
 +Z/3T8dcZb8qT6Lpaa/li9nB2fPq39EygHXn9uCt7yXIvHxs647pyQVPn2RCnFYKmRsW
 D/RcR/Hk6J0GOcqxQYk9UItg9KwhsusH7qwYeLTb3Bfl4TGuTYH9/UqTCFKdGPWNkJGQ
 t9GuwP/GudKRbhovZu7BpH+P5WVYsPOfNLB4+lWUiM/C8aF+yzFFX7trQeYEtjAdjpWB
 t7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tklu5SixxvbDgE59M7DylkNZWdMD7D/f+GnO20MVcrg=;
 b=pC1tSbSdELM+dcjnZvUwrBXrkbdSCew+0zb2I/2CYDTU43++FLGdu7dy1yL4r9PKpR
 5vyiSo0cGbWt6Q1ik/y96L9jCJvk4kiwoXA3iMp9uvrTYIJSsWItsjIVZQQ1YTz507MU
 70StAmZn6MKL87VpOkIM5WzINtnaOf7ckT7ExQp+VtL5QOQwX+b+ix/ichdVGit4L34K
 e60lXSJjktFhSTOoIn+8L6+rcTjkOZuDPLGkhSkEZTh5VHpcFjl16kDf4NUf+Cz3dGHH
 dnclnhocK00g/AVSmnGGWKrUTWGGXjrrFvOgmOBPFmumz3hrn+NuN6AwYTmZ9+jQOz2+
 EjZg==
X-Gm-Message-State: AOAM531Zi2ykLKyOT2DrMj5MWzdccB8BdPHddoPH677QqnRYXKFVZUft
 yGTSYSHz730zrCJSHks/hXdQAfLRTUef726tijg=
X-Google-Smtp-Source: ABdhPJzJHUR0Kyrvmrb+QrF4eDtaMP0aqli8rsXgM/x/43lmmWvlD6tEcdGvDQM45M/XuCAIzjDicpubBMwkNAR91xU=
X-Received: by 2002:a92:280f:: with SMTP id l15mr1017551ilf.74.1631167059262; 
 Wed, 08 Sep 2021 22:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
 <20210829175120.19413-4-space.monkey.delivers@gmail.com>
In-Reply-To: <20210829175120.19413-4-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Sep 2021 15:57:11 +1000
Message-ID: <CAKmqyKOvPqSXiDYOch+8M_bAg9AZNhKE1v2aifENYhkHHv07SA@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Thu, 09 Sep 2021 05:57:44 -0000

On Mon, Aug 30, 2021 at 3:54 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c |   6 +
>  target/riscv/cpu.h |  11 ++
>  target/riscv/csr.c | 276 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 293 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..4178eecbec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -553,6 +553,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> +        if (cpu->cfg.ext_j) {
> +#ifndef CONFIG_USER_ONLY
> +            /* mmte is supposed to have pm.current hardwired to 1 */
> +            env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);

This should probably be in the reset function instead.

> +#endif
> +        }
>
>          set_misa(env, target_misa);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 451a1637a1..94e680cbd0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -238,6 +238,17 @@ struct CPURISCVState {
>
>      /* True if in debugger mode.  */
>      bool debugger;
> +
> +    /*
> +     * CSRs for PointerMasking extension
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
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..42a0867e5d 100644
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
> @@ -1404,6 +1414,259 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +/*
> + * Functions to access Pointer Masking feature registers
> + * We have to check if current priv lvl could modify
> + * csr in given mode
> + */
> +static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
> +{
> +    int csr_priv = get_field(csrno, 0x300);

Can you add a newline between declarations and code?

> +    /*
> +     * If priv lvls differ that means we're accessing csr from higher priv lvl,
> +     * so allow the access
> +     */
> +    if (env->priv != csr_priv) {
> +        return false;
> +    }
> +    int cur_bit_pos;

Can you keep all of the declarations at the start of blocks please.

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
> +
> +    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
> +    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> +    env->mmte = wpri_val | PM_EXT_DIRTY;
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* if pm.current==0 we can't modify current PM CSRs */
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    target_ulong new_val = wpri_val | (env->mmte & ~SMTE_MASK);
> +    write_mmte(env, csrno, new_val);

You don't really need the new_val variable here.

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
> +
> +    if (check_pm_current_disabled(env, csrno)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    target_ulong new_val = wpri_val | (env->mmte & ~UMTE_MASK);
> +    write_mmte(env, csrno, new_val);

Same here

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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
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
> +
> +    /* Set XS and SD bits, since PM CSRs are dirty */
> +    mstatus = env->mstatus | MSTATUS_XS;
> +    write_mstatus(env, csrno, mstatus);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #endif
>
>  /*
> @@ -1636,6 +1899,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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

Looks good! Just a few style nits and then this should be good to go.

Alistair

>      /* Performance Counters */
>      [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
>      [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
> --
> 2.20.1
>
>

