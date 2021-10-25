Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meswD-00005c-QH
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 01:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mesw6-0008Va-Ji; Mon, 25 Oct 2021 01:54:18 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mesw2-0007b7-6F; Mon, 25 Oct 2021 01:54:17 -0400
Received: by mail-io1-xd2a.google.com with SMTP id z69so13920257iof.9;
 Sun, 24 Oct 2021 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dujFnobO2eioSEo3XQ/XsvE9E9+7ucSWQGQi+UGHrq4=;
 b=AVVA+wBXJ+MqFyX3FTGCQ7lj6veJduVT4aTD9UbAEY68H4thpr9l9Rww8fQxr7Hb/J
 wbkNaOiBAxpoeABjvn+cngWTZJcuZmcQqsOJoGI2NM45ZEjOIDReyV0frKaF6mcfZuhP
 WuZm9lr0buSrP6FzwTitmg5uyH1UlMyO36t2Cp8edHiW6ihJrhyHhGya28+sKrCKM9rT
 xRBhCa+dPj7Y4Ek7tKOf/UMZUS/WHHmX8ZPk5i3dfWGieODoTYI1Jg9OgwaIervhe2/s
 pMZesBN4N4qvaLPZwjOPBlQa5iOlgng7pwTo0LIStiFbLL9CFUKfM4FfNuCpjHs3KVIW
 Oxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dujFnobO2eioSEo3XQ/XsvE9E9+7ucSWQGQi+UGHrq4=;
 b=3wzzGYBeuMG9cq51ypWV7c55AbIA0i7QlGt7sWsHN6w+ESDNM/08iHqTe2oazKvCTv
 VlgrGzrNgyrlGoGNgQoWyBMhgueCEA8F2RlFuxygdR9VdHUmXGJqc54JW0jrkIzcHLIX
 PrD+pG+lyojAhoW5+04wjuaRA8Tc2PHEs3hFvsj4LO67x6SfgwqEL+xITcJ7ia3pQcrE
 gaS5Sj2kHL7FKLVR75mm3nLRSPo7mgAPH4le1r1vJ7UEf7Po2d/woU4Y61d8b0aCGfwc
 QcczObzFmcMEhkEAwMkN7hxbMYWEt7e3DgWML3gvlTvRdFvP2vDHwNrJDi7UxnnD8fae
 0Vcw==
X-Gm-Message-State: AOAM533tXIBvm0shi5vzP4cu1d/kH25NF3dsBnqWImc0azNg9OPfVnDR
 e1zkQ6eiZipmUMrQpCQJhGakS6kQ3+MU4hkyr28i0/GjJBHpDyfp
X-Google-Smtp-Source: ABdhPJxkDHN6EnhhTZjgV8h4UioGxam25xcynD/mDPjxFqNc/AyLADGOHug8mMb+fHvPrzNpj2Lhw/gPq4bKln5TYUA=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr9249261iow.91.1635141252370; 
 Sun, 24 Oct 2021 22:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
 <20211022181910.1999197-4-space.monkey.delivers@gmail.com>
In-Reply-To: <20211022181910.1999197-4-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 15:53:45 +1000
Message-ID: <CAKmqyKMaFHL8E7rz0YxrB1DH8WLwX6aEPJAsdhLhX584fHkVzQ@mail.gmail.com>
Subject: Re: [PATCH v16 3/8] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 05:54:18 -0000

On Sat, Oct 23, 2021 at 4:34 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c |   2 +
>  target/riscv/cpu.h |  11 ++
>  target/riscv/csr.c | 285 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 298 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 788fa0b11c..6b767a4a0b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -367,6 +367,8 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mcause = 0;
>      env->pc = env->resetvec;
>      env->two_stage_lookup = false;
> +    /* mmte is supposed to have pm.current hardwired to 1 */
> +    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
>      cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1cfc6a53a0..b2422e3f99 100644
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
> index 69e4d65fcd..7dd7bb7fbf 100644
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
> @@ -1425,6 +1435,268 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
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

This and other log messages fail to build for both RV64 and RV32.

The target_ulong can either be 32-bit or 64-bit, so printing with %lx
doesn't work. You can use TARGET_FMT_lx instead

Also, while re-sending this can you prefix the commit messages with
"target/riscv: "

Alistair

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
> @@ -1659,6 +1931,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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

