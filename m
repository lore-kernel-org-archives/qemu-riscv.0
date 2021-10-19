Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcxau-0000pw-Pc
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 18:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxas-0000pc-UU; Tue, 19 Oct 2021 18:28:26 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxaq-0000ln-T9; Tue, 19 Oct 2021 18:28:26 -0400
Received: by mail-io1-xd2b.google.com with SMTP id o184so10249776iof.6;
 Tue, 19 Oct 2021 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1H8h5Y7nb6i2ThQ6+9ejTyIcSEqkRS4BCcAeKouEf5c=;
 b=ouYnuTkJFxkun/JY7y4hWLzNwtV1WtLqpOWh4uPYcvNDy0XFt+vgLO7PecCukslwut
 qm0BK0zyzzOb5KKbLINcBgP0iVXKLevyb4omU6PGE8H7fkZhTqWihzKI4/oMG+jt2x5u
 FWwtEC3Z1YgiPG4/xVGPhMdubFZTAGvRkcNMio3fOahnUOKFegG4iI+sIxj+MNgqs4Gu
 d9AaxoTbAecfJGpUktt92BepIz3JRZtqew2WPX1LOc/1mcTbhznvlNABCA13Cn9CAyPi
 IE1jyop+eqoPEx41ItKuBqtgkDHkwuGblSiEa7Vvs5MIEdEk4UpcBamwnjJMMvegUMC5
 Go/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1H8h5Y7nb6i2ThQ6+9ejTyIcSEqkRS4BCcAeKouEf5c=;
 b=VnikdckHBNg1QCXyhJuW0oLgcrAJJrHthhn2fdM956MmrLQC49OkiSJT3sX8tiGR75
 AY3P3qKVrNnQWFw3jODE0oP9GZAsnPuuYtnj36rb+VOGZy9+1szrzdC6f81I0J8Jsp6L
 FTVKACIHEd1NOjfycMWlTlUuyVOtHYC4mhsKfYBbJxOH9DSTi7cZWAohYy8LP1y9K4Bs
 SkKkA0C0d5vHkM3Qdfg5JZlJwOaaamWETXs5/+wryVfywXeda0C3HuWxI6/xeKEDPLbx
 vXTolB5DKTtWI5Yt044DfpmV8NjJd7rEch5qxp0uFlThT8RSs+AgcJd+jSAWfAHuYSnB
 DssA==
X-Gm-Message-State: AOAM531y0ukDVleQ9KoxpwFZIc+F4LmbpJdjnsj1ip0D82lcnJEoGJK+
 qkpF/06UgoqXz97zkbzPoeol4D7nYhl70qTkZSafvJh4t5jSvkwv
X-Google-Smtp-Source: ABdhPJyvbdUIKLVAaflS47EFEFNib3XpGL2Kb/NKcutLEihtMKQXI6i4kfF6H36X4VVUU+uzq8WFhiJtSxE0KVo26sQ=
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr6151593jat.35.1634682503353; 
 Tue, 19 Oct 2021 15:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
 <20211017172728.759687-4-space.monkey.delivers@gmail.com>
In-Reply-To: <20211017172728.759687-4-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 08:27:57 +1000
Message-ID: <CAKmqyKNztGH4EBqqmG9r_5QzrzT2__i0nCZXNHZP8QuOPqpD+w@mail.gmail.com>
Subject: Re: [PATCH v14 3/8] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 22:28:27 -0000

On Mon, Oct 18, 2021 at 3:34 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |   2 +
>  target/riscv/cpu.h |  11 ++
>  target/riscv/csr.c | 285 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 298 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e..75e8b8ca83 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -365,6 +365,8 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mcause = 0;
>      env->pc = env->resetvec;
>      env->two_stage_lookup = false;
> +    /* mmte is supposed to have pm.current hardwired to 1 */
> +    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
>      cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3f28dc5f3a..acb4ce9d23 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -236,6 +236,17 @@ struct CPURISCVState {
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
> index 23fbbd3216..d563289d37 100644
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
> @@ -1401,6 +1411,268 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
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
> +    int pm_current;
> +
> +    /*
> +     * If priv lvls differ that means we're accessing csr from higher priv lvl,
> +     * so allow the access
> +     */
> +    if (env->priv != csr_priv) {
> +        return false;
> +    }
> +    switch (env->priv) {
> +    case PRV_M:
> +        pm_current = get_field(env->mmte, M_PM_CURRENT);
> +        break;
> +    case PRV_S:
> +        pm_current = get_field(env->mmte, S_PM_CURRENT);
> +        break;
> +    case PRV_U:
> +        pm_current = get_field(env->mmte, U_PM_CURRENT);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
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
> +
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
> +
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
> +    wpri_val |= (env->mmte & ~SMTE_MASK);
> +    write_mmte(env, csrno, wpri_val);
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
> +
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
> +    wpri_val |= (env->mmte & ~UMTE_MASK);
> +    write_mmte(env, csrno, wpri_val);
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
> +
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
> +
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
> +
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
> +
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
> +
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
> +
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
> @@ -1635,6 +1907,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> 2.30.2
>
>

