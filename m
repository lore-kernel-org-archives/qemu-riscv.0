Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOLxZ-0001le-TV
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 10:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLxV-0001hP-Pk; Mon, 22 Mar 2021 10:55:10 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLxS-0002IH-S8; Mon, 22 Mar 2021 10:55:09 -0400
Received: by mail-il1-x136.google.com with SMTP id u10so15081978ilb.0;
 Mon, 22 Mar 2021 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8weedN8TrEf7xpV9DYh/TqZ3xq2lwy7ldXCiTEz9YY=;
 b=NKu5RUM5x5A03J19dm51Rj7EqcstdvyrjgkVs/V7u9aN0tAI9HliKvSu9hgX5WNj8E
 wfcOwOSFHSdz6ZAeXU0Pn/nqpMTQGYRb+Oj8B1KcH2F/rMntKdxCMM2X36jOs4TfiNX7
 caqH1ipKhcQoDHH5oZhr8AYpADUQDnwm7IARAfuV31edS0zIWrxie15vHbzWEbGlGtD0
 VONom8txfYwhv1ojEeHK6faADdp4NRrCQH/b1LP16VEcwybsc3ESBZcqO0ctknTkIKsO
 +2EVCHxb2/fYKr7uiKYjw3bV215M+5kp/Qb9wrgcFkJvpTAOO3S8ozlqWqygwqulfdTY
 blag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8weedN8TrEf7xpV9DYh/TqZ3xq2lwy7ldXCiTEz9YY=;
 b=NuPzB2gTcncFyvX+8RI7GlpV6eIqLSF+y9l2htBsBwKzUHGjucMSJUs1Xn8KUjYpmT
 P7HJTkaYWt9liTdv4fC50TXGXR5nM5BFhfNChFf4dBkgPlOsLw/M4HQKOMPwBJcqIBag
 tGvdnR8P0AV37O7dpY4hW9bFo/bemDSwflMZlIgUIJeF4d9EGLUpNNdcZobnmJOWQtY4
 hT6Dtp1cCJJ9cuhF0rgFylwuoQghBNrFou1bqVIRi0i4J8URX/OSrqP8Nst6H/7suRhk
 jdck+TqqmiavVv5Hr49gqMN3MHDBnAha84QgoRRyrJvtyJTcLRynxbmR4yQ1h5VKBjQO
 SDxQ==
X-Gm-Message-State: AOAM530hpYy1LJi/N944DBRiZajpYq422CJdVKujoG/N0BELtoMvrWOJ
 82IHp27/n3Mdi3YKzc8Pw+uR5K77pf6cduVfqXs=
X-Google-Smtp-Source: ABdhPJzQNrsKZHJUeMolr/2l9xSEULFbLXgQ9Tm43QBANwJALVRRrETWfsB8OE0RtdAZg5OWVii13nqfb1astNRwujA=
X-Received: by 2002:a05:6e02:f81:: with SMTP id
 v1mr305739ilo.267.1616424904396; 
 Mon, 22 Mar 2021 07:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210319194534.2082397-1-atish.patra@wdc.com>
 <20210319194534.2082397-2-atish.patra@wdc.com>
In-Reply-To: <20210319194534.2082397-2-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 10:53:08 -0400
Message-ID: <CAKmqyKPytnptOGAz=wGoG+JMG7Jbk4yH=pjuMn0K-voAas5giA@mail.gmail.com>
Subject: Re: [ RFC 1/6] target/riscv: Remove privilege v1.9 specific CSR
 related code
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 14:55:12 -0000

On Fri, Mar 19, 2021 at 3:46 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Qemu doesn't support RISC-V privilege specification v1.9. Remove the
> remaining v1.9 specific references from the implementation.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

This is a great change. There is actually a patch around on the
mailing list doing something similar, but it was never merged.

> ---
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu.h        |  4 +---
>  target/riscv/cpu_bits.h   | 23 ---------------------
>  target/riscv/cpu_helper.c | 12 +++++------
>  target/riscv/csr.c        | 43 ++++++++++-----------------------------
>  target/riscv/machine.c    |  4 +---
>  target/riscv/translate.c  |  4 ++--
>  7 files changed, 22 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddea8fbeeb39..c76e4c1a09c9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -282,7 +282,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
>      }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb2826a27a..7bee351f3c99 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -163,10 +163,8 @@ struct CPURISCVState {
>      target_ulong mie;
>      target_ulong mideleg;
>
> -    target_ulong sptbr;  /* until: priv-1.9.1 */
>      target_ulong satp;   /* since: priv-1.10.0 */
> -    target_ulong sbadaddr;
> -    target_ulong mbadaddr;
> +    target_ulong stval;
>      target_ulong medeleg;
>
>      target_ulong stvec;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf45992070a..b42dd4f8d8b1 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -153,12 +153,6 @@
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> -/* Legacy Counter Setup (priv v1.9.1) */
> -/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
> -#define CSR_MUCOUNTEREN     0x320
> -#define CSR_MSCOUNTEREN     0x321
> -#define CSR_MHCOUNTEREN     0x322
> -
>  /* Machine Trap Handling */
>  #define CSR_MSCRATCH        0x340
>  #define CSR_MEPC            0x341
> @@ -166,9 +160,6 @@
>  #define CSR_MTVAL           0x343
>  #define CSR_MIP             0x344
>
> -/* Legacy Machine Trap Handling (priv v1.9.1) */
> -#define CSR_MBADADDR        0x343
> -
>  /* Supervisor Trap Setup */
>  #define CSR_SSTATUS         0x100
>  #define CSR_SEDELEG         0x102
> @@ -184,9 +175,6 @@
>  #define CSR_STVAL           0x143
>  #define CSR_SIP             0x144
>
> -/* Legacy Supervisor Trap Handling (priv v1.9.1) */
> -#define CSR_SBADADDR        0x143
> -
>  /* Supervisor Protection and Translation */
>  #define CSR_SPTBR           0x180
>  #define CSR_SATP            0x180
> @@ -354,14 +342,6 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> -/* Legacy Machine Protection and Translation (priv v1.9.1) */
> -#define CSR_MBASE           0x380
> -#define CSR_MBOUND          0x381
> -#define CSR_MIBASE          0x382
> -#define CSR_MIBOUND         0x383
> -#define CSR_MDBASE          0x384
> -#define CSR_MDBOUND         0x385
> -
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -375,10 +355,8 @@
>  #define MSTATUS_FS          0x00006000
>  #define MSTATUS_XS          0x00018000
>  #define MSTATUS_MPRV        0x00020000
> -#define MSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
>  #define MSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>  #define MSTATUS_MXR         0x00080000
> -#define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
>  #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
>  #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
>  #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
> @@ -416,7 +394,6 @@
>  #define SSTATUS_SPP         0x00000100
>  #define SSTATUS_FS          0x00006000
>  #define SSTATUS_XS          0x00018000
> -#define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
>  #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>  #define SSTATUS_MXR         0x00080000
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6d4..bb0a709c9cab 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -136,8 +136,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>          env->vscause = env->scause;
>          env->scause = env->scause_hs;
>
> -        env->vstval = env->sbadaddr;
> -        env->sbadaddr = env->stval_hs;
> +        env->vstval = env->stval;
> +        env->stval = env->stval_hs;
>
>          env->vsatp = env->satp;
>          env->satp = env->satp_hs;
> @@ -159,8 +159,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>          env->scause_hs = env->scause;
>          env->scause = env->vscause;
>
> -        env->stval_hs = env->sbadaddr;
> -        env->sbadaddr = env->vstval;
> +        env->stval_hs = env->stval;
> +        env->stval = env->vstval;
>
>          env->satp_hs = env->satp;
>          env->satp = env->vsatp;
> @@ -972,7 +972,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mstatus = s;
>          env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
>          env->sepc = env->pc;
> -        env->sbadaddr = tval;
> +        env->stval = tval;
>          env->htval = htval;
>          env->pc = (env->stvec >> 2 << 2) +
>              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
> @@ -1003,7 +1003,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mstatus = s;
>          env->mcause = cause | ~(((target_ulong)-1) >> async);
>          env->mepc = env->pc;
> -        env->mbadaddr = tval;
> +        env->mtval = tval;
>          env->mtval2 = mtval2;
>          env->pc = (env->mtvec >> 2 << 2) +
>              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e6363f397..7166f8d710a8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -643,26 +643,6 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> -/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
> -static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
> -{
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    *val = env->mcounteren;
> -    return 0;
> -}
> -
> -/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
> -static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
> -{
> -    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    env->mcounteren = val;
> -    return 0;
> -}
> -
>  /* Machine Trap Handling */
>  static int read_mscratch(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -700,15 +680,15 @@ static int write_mcause(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> -static int read_mbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
> +static int read_mtval(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    *val = env->mbadaddr;
> +    *val = env->mtval;
>      return 0;
>  }
>
> -static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
> +static int write_mtval(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->mbadaddr = val;
> +    env->mtval = val;
>      return 0;
>  }
>
> @@ -840,18 +820,19 @@ static int write_scause(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> -static int read_sbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
> +static int read_stval(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    *val = env->sbadaddr;
> +    *val = env->stval;
>      return 0;
>  }
>
> -static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
> +static int write_stval(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->sbadaddr = val;
> +    env->stval = val;
>      return 0;
>  }
>
> +
>  static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
> @@ -1418,13 +1399,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>
> -    [CSR_MSCOUNTEREN] = { "msounteren", any,   read_mscounteren, write_mscounteren },
> -
>      /* Machine Trap Handling */
>      [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
>      [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
>      [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
> -    [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
> +    [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>
>      /* Supervisor Trap Setup */
> @@ -1437,7 +1416,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
>      [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
>      [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
> -    [CSR_SBADADDR] = { "sbadaddr", smode, read_sbadaddr, write_sbadaddr },
> +    [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
>      [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
>
>      /* Supervisor Protection and Translation */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 44d4015bd675..27fcc770aa4b 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -165,10 +165,8 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINT32(env.miclaim, RISCVCPU),
>          VMSTATE_UINTTL(env.mie, RISCVCPU),
>          VMSTATE_UINTTL(env.mideleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.sptbr, RISCVCPU),
>          VMSTATE_UINTTL(env.satp, RISCVCPU),
> -        VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
> -        VMSTATE_UINTTL(env.mbadaddr, RISCVCPU),
> +        VMSTATE_UINTTL(env.stval, RISCVCPU),
>          VMSTATE_UINTTL(env.medeleg, RISCVCPU),
>          VMSTATE_UINTTL(env.stvec, RISCVCPU),
>          VMSTATE_UINTTL(env.sepc, RISCVCPU),

As you are changing the vmstate you also need to bump the vmstate
version. I'll just squash that in with this patch as I would really
like to see this merged.

Alistair

> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0f28b5f41e4f..1740be3d4bd9 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -130,7 +130,7 @@ static void generate_exception(DisasContext *ctx, int excp)
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
> -static void generate_exception_mbadaddr(DisasContext *ctx, int excp)
> +static void generate_exception_mtval(DisasContext *ctx, int excp)
>  {
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>      tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
> @@ -174,7 +174,7 @@ static void gen_exception_illegal(DisasContext *ctx)
>
>  static void gen_exception_inst_addr_mis(DisasContext *ctx)
>  {
> -    generate_exception_mbadaddr(ctx, RISCV_EXCP_INST_ADDR_MIS);
> +    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
>  }
>
>  static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> --
> 2.25.1
>
>

