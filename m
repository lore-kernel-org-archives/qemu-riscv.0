Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAPH5-0005YG-Gh
	for mharc-qemu-riscv@gnu.org; Tue, 17 Sep 2019 22:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1iAPGz-0005Y8-VI
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 22:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1iAPGv-0003oc-8I
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 22:00:49 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40580)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1iAPGu-0003nZ-Jj; Tue, 17 Sep 2019 22:00:45 -0400
Received: by mail-lj1-x243.google.com with SMTP id 7so5501882ljw.7;
 Tue, 17 Sep 2019 19:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEyyjGWN0VjfA1fiNtllsw7Ttm1POIOMnFca+ryuAXM=;
 b=sPcu3UPGPRqpDzyPo/NsAAs4+cLkmi4jI7fCOyuPQcVYGfwiKFK6ZSzTELUwEQdwsq
 thwIaUPLdmd0VmPZwoCDqFv7Di1kPZjSOc17SqlMiEhxufdVlodmPr+5cHusUCyn/ego
 wvSgyk1MpTWLvVYVx6wTvh879QKJaonGWvq/curzl1egtUlwYVnwSgvWFzHkc0WSiJ4b
 +T0g7Ay2r/sQDBdIPN9szYFuwsh07WarOc3yWOCejc2t6MDCbeXNzd1Ftu33wlafv4OD
 ncrvjxizax6vCVfg+rmg6g6+2VVHdJNlT9tqA7gWMg4Gg7AymfYiol6iUK4p3djxOcQN
 GVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEyyjGWN0VjfA1fiNtllsw7Ttm1POIOMnFca+ryuAXM=;
 b=n0648RDY3/+otKIpeV4AZt3P7H2gIsG42xUhrt+PF9oSDFyliuJ7BsA9SijL8IKWnE
 2htDVlg2gIxCBYN47NQQZi3WLv6nmH9y35OoM08pkMbgYlL3F7DW0OR8Uf8t6BPBz/Mj
 RqbehdAnImC7C4OX07NrBRIdnpvV+J0ocHaDoj9aVDJCgeRgwXL4yzLp0esr8Q3vuH3b
 bgEN07JkoBWhAxjHHZL7pbC1sOfO8Vx33/F67huS81znvCld1CK6okfnXcrc4aErzMSl
 j5mbba7dTUBuKmglWvnW6lW5qnyw6Yw/Feju9Qy+l5BkwDb3BFfeKcqYQ+XyCKp/rFnL
 IzZQ==
X-Gm-Message-State: APjAAAUPIfK3tjeVEVadPwqcO7RnwEwROGYInWLgxdmdpVR9PUyfgnTW
 3k6TonpmJLUBr29b9n9oqlsBKcibZrQ6c8M5tYc=
X-Google-Smtp-Source: APXvYqzIhTblfGJhJopv00C5T9fROJJSadmMKOO82nhe2dkS6BJj3lojO3Rv0+XYWdS9MjwjkBV3S7SNqMl2mjpjwnc=
X-Received: by 2002:a2e:9dc9:: with SMTP id x9mr647040ljj.147.1568772042355;
 Tue, 17 Sep 2019 19:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <850360df8fc15a3671bf2237f972ebaf09110015.1566603412.git.alistair.francis@wdc.com>
 <mhng-b813f03d-c23e-405a-8213-c4c9b22a6831@palmer-si-x1e>
 <CANnJOVFNqXEg9KkJC4CHkt0KTt2_6HjyhU2CvMROW+e79mDncA@mail.gmail.com>
 <CAKmqyKMfODSjbBm5ZgmHYYzzrf3B_4WEbANeKXo6rSO6V5Pzeg@mail.gmail.com>
In-Reply-To: <CAKmqyKMfODSjbBm5ZgmHYYzzrf3B_4WEbANeKXo6rSO6V5Pzeg@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 17 Sep 2019 21:59:43 -0400
Message-ID: <CANnJOVGPW1ppNdx+=KAvgNhgGQPvJxjyGY=rxunicu=f++xhiQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <Anup.Patel@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000517b810592ca3445"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [PATCH v1 10/28] target/riscv: Convert mie and
 mstatus to pointers
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
X-List-Received-Date: Wed, 18 Sep 2019 02:00:54 -0000

--000000000000517b810592ca3445
Content-Type: text/plain; charset="UTF-8"

I went through the uses of mie in the entire hypervisor patch series and it
seems like it would be much simpler to just have two non-pointer fields in
the CPU struct: mie and vsie. To if an interrupt is pending, you are either
running with V=0 in which case the contents of vsie can be ignored, or you
are running with V=1 and have to check both anyway. And the
read_sie/write_sie would just need a single extra branch return proper
results. The read_mie and write_mie function wouldn't need to be changed at
all: if M-mode is running to access them, then V=0. (When queried from a
debugger while V=1, I think the result would actually be more correct this
way: the bits of mie are supposed to always reflect sie rather than vsie).

Jonathan

On Tue, Sep 17, 2019 at 7:37 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Sep 11, 2019 at 7:55 AM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >
> > Version 0.4 of the hypervisor spec no longer talks about swapping
> registers. Instead when running in VS-mode some of the supervisor registers
> are "aliased" and actually refer to alternate versions. Implementations are
> of course still allowed to do swapping internally if desired, but it adds
> complexity compared to a more straightforward implementation and isn't
> obvious to me whether QEMU would get any benefit from it. At least, it is
> probably worth fleshing out the rest of the v0.4 implementation before
> deciding on this patch.
>
> This patch is to handle the aliasing. The commit message isn't clear
> (I'll fix that up) but this patch is required to handle the new alias
> method instead of the previous swapping.
>
> Alistair
>
> > Jonathan
> >
> > On Wed, Sep 11, 2019 at 4:24 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> >>
> >> On Fri, 23 Aug 2019 16:38:15 PDT (-0700), Alistair Francis wrote:
> >> > To handle the new Hypervisor CSR register swapping let's use pointers.
> >> >
> >> > We only need to convert the MIE and MSTATUS CSRs. With the exception
> of
> >> > MIP all of the other CSRs that swap with virtulsation changes are
> S-Mode
> >> > only, so we can just do a lazy switch. This because more challenging
> for
> >> > the M-Mode registers so it ends up being easier to use pointers.
> >> >
> >> > As the MIP CSR is always accessed atomicly the pointer swap doesn't
> work
> >> > so we leave that as is.
> >> >
> >> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> > ---
> >> >  target/riscv/cpu.c        | 16 ++++++++++++----
> >> >  target/riscv/cpu.h        | 12 ++++++++++--
> >> >  target/riscv/cpu_helper.c | 32 ++++++++++++++++----------------
> >> >  target/riscv/csr.c        | 28 ++++++++++++++--------------
> >> >  target/riscv/op_helper.c  | 14 +++++++-------
> >> >  5 files changed, 59 insertions(+), 43 deletions(-)
> >> >
> >> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> > index be8f643fc2..371d5845af 100644
> >> > --- a/target/riscv/cpu.c
> >> > +++ b/target/riscv/cpu.c
> >> > @@ -228,7 +228,7 @@ static void riscv_cpu_dump_state(CPUState *cs,
> FILE *f, int flags)
> >> >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
> >> >  #ifndef CONFIG_USER_ONLY
> >> >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ",
> env->mhartid);
> >> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ",
> env->mstatus);
> >> > +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ",
> *env->mstatus);
> >> >      if (riscv_has_ext(env, RVH)) {
> >> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ",
> env->hstatus);
> >> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bstatus ",
> env->vsstatus);
> >> > @@ -239,7 +239,7 @@ static void riscv_cpu_dump_state(CPUState *cs,
> FILE *f, int flags)
> >> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsip    ",
> >> >                       (target_ulong)atomic_read(&env->vsip));
> >> >      }
> >> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> >> > +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ",
> *env->mie);
> >> >      if (riscv_has_ext(env, RVH)) {
> >> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsie    ",
> env->vsie);
> >> >      }
> >> > @@ -309,7 +309,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
> >> >       * Definition of the WFI instruction requires it to ignore the
> privilege
> >> >       * mode and delegation registers, but respect individual enables
> >> >       */
> >> > -    return (atomic_read(&env->mip) & env->mie) != 0;
> >> > +    return (atomic_read(&env->mip) & *env->mie) != 0;
> >> >  #else
> >> >      return true;
> >> >  #endif
> >> > @@ -330,7 +330,7 @@ static void riscv_cpu_reset(CPUState *cs)
> >> >      mcc->parent_reset(cs);
> >> >  #ifndef CONFIG_USER_ONLY
> >> >      env->priv = PRV_M;
> >> > -    env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> >> > +    *env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> >> >      env->mcause = 0;
> >> >      env->pc = env->resetvec;
> >> >  #endif
> >> > @@ -459,8 +459,16 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >> >  static void riscv_cpu_init(Object *obj)
> >> >  {
> >> >      RISCVCPU *cpu = RISCV_CPU(obj);
> >> > +#ifndef CONFIG_USER_ONLY
> >> > +    CPURISCVState *env = &cpu->env;
> >> > +#endif
> >> >
> >> >      cpu_set_cpustate_pointers(cpu);
> >> > +
> >> > +#ifndef CONFIG_USER_ONLY
> >> > +    env->mie = &env->mie_novirt;
> >> > +    env->mstatus = &env->mstatus_novirt;
> >> > +#endif
> >> >  }
> >> >
> >> >  static const VMStateDescription vmstate_riscv_cpu = {
> >> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> > index 4c342e7a79..680592cb60 100644
> >> > --- a/target/riscv/cpu.h
> >> > +++ b/target/riscv/cpu.h
> >> > @@ -122,7 +122,7 @@ struct CPURISCVState {
> >> >      target_ulong resetvec;
> >> >
> >> >      target_ulong mhartid;
> >> > -    target_ulong mstatus;
> >> > +    target_ulong *mstatus;
> >> >
> >> >      /*
> >> >       * CAUTION! Unlike the rest of this struct, mip is accessed
> asynchonously
> >> > @@ -136,7 +136,7 @@ struct CPURISCVState {
> >> >      uint32_t mip;
> >> >      uint32_t miclaim;
> >> >
> >> > -    target_ulong mie;
> >> > +    target_ulong *mie;
> >> >      target_ulong mideleg;
> >> >
> >> >      target_ulong sptbr;  /* until: priv-1.9.1 */
> >> > @@ -154,6 +154,14 @@ struct CPURISCVState {
> >> >      target_ulong mcause;
> >> >      target_ulong mtval;  /* since: priv-1.10.0 */
> >> >
> >> > +    /* The following registers are the "real" versions that the
> pointer
> >> > +     * versions point to. These should never be used unless you know
> what you
> >> > +     * are doing. To access these use the pointer versions instead.
> This is
> >> > +     * required to handle the Hypervisor register swapping.
> >> > +     */
> >> > +    target_ulong mie_novirt;
> >> > +    target_ulong mstatus_novirt;
> >> > +
> >> >      /* Hypervisor CSRs */
> >> >      target_ulong hstatus;
> >> >      target_ulong hedeleg;
> >> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> > index 5bcfc2e090..c597523d74 100644
> >> > --- a/target/riscv/cpu_helper.c
> >> > +++ b/target/riscv/cpu_helper.c
> >> > @@ -36,9 +36,9 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool
> ifetch)
> >> >  #ifndef CONFIG_USER_ONLY
> >> >  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >> >  {
> >> > -    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
> >> > -    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
> >> > -    target_ulong pending = atomic_read(&env->mip) & env->mie;
> >> > +    target_ulong mstatus_mie = get_field(*env->mstatus, MSTATUS_MIE);
> >> > +    target_ulong mstatus_sie = get_field(*env->mstatus, MSTATUS_SIE);
> >> > +    target_ulong pending = atomic_read(env->mip) & *env->mie;
> >> >      target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M &&
> mstatus_mie);
> >> >      target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S &&
> mstatus_sie);
> >> >      target_ulong irqs = (pending & ~env->mideleg & -mie) |
> >> > @@ -74,7 +74,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
> >> >  /* Return true is floating point support is currently enabled */
> >> >  bool riscv_cpu_fp_enabled(CPURISCVState *env)
> >> >  {
> >> > -    if (env->mstatus & MSTATUS_FS) {
> >> > +    if (*env->mstatus & MSTATUS_FS) {
> >> >          return true;
> >> >      }
> >> >
> >> > @@ -219,8 +219,8 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> >> >      int mode = mmu_idx;
> >> >
> >> >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> >> > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> >> > -            mode = get_field(env->mstatus, MSTATUS_MPP);
> >> > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> >> > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
> >> >          }
> >> >      }
> >> >
> >> > @@ -234,11 +234,11 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> >> >
> >> >      target_ulong base;
> >> >      int levels, ptidxbits, ptesize, vm, sum;
> >> > -    int mxr = get_field(env->mstatus, MSTATUS_MXR);
> >> > +    int mxr = get_field(*env->mstatus, MSTATUS_MXR);
> >> >
> >> >      if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> >> >          base = get_field(env->satp, SATP_PPN) << PGSHIFT;
> >> > -        sum = get_field(env->mstatus, MSTATUS_SUM);
> >> > +        sum = get_field(*env->mstatus, MSTATUS_SUM);
> >> >          vm = get_field(env->satp, SATP_MODE);
> >> >          switch (vm) {
> >> >          case VM_1_10_SV32:
> >> > @@ -258,8 +258,8 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> >> >          }
> >> >      } else {
> >> >          base = env->sptbr << PGSHIFT;
> >> > -        sum = !get_field(env->mstatus, MSTATUS_PUM);
> >> > -        vm = get_field(env->mstatus, MSTATUS_VM);
> >> > +        sum = !get_field(*env->mstatus, MSTATUS_PUM);
> >> > +        vm = get_field(*env->mstatus, MSTATUS_VM);
> >> >          switch (vm) {
> >> >          case VM_1_09_SV32:
> >> >            levels = 2; ptidxbits = 10; ptesize = 4; break;
> >> > @@ -505,8 +505,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
> >> >      ret = get_physical_address(env, &pa, &prot, address,
> access_type, mmu_idx);
> >> >
> >> >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> >> > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> >> > -            mode = get_field(env->mstatus, MSTATUS_MPP);
> >> > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> >> > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
> >> >          }
> >> >      }
> >> >
> >> > @@ -606,12 +606,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >> >      if (env->priv <= PRV_S &&
> >> >              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> >> >          /* handle the trap in S-mode */
> >> > -        target_ulong s = env->mstatus;
> >> > +        target_ulong s = *env->mstatus;
> >> >          s = set_field(s, MSTATUS_SPIE, env->priv_ver >=
> PRIV_VERSION_1_10_0 ?
> >> >              get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE <<
> env->priv));
> >> >          s = set_field(s, MSTATUS_SPP, env->priv);
> >> >          s = set_field(s, MSTATUS_SIE, 0);
> >> > -        env->mstatus = s;
> >> > +        *env->mstatus = s;
> >> >          env->scause = cause | ((target_ulong)async <<
> (TARGET_LONG_BITS - 1));
> >> >          env->sepc = env->pc;
> >> >          env->sbadaddr = tval;
> >> > @@ -620,12 +620,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >> >          riscv_cpu_set_mode(env, PRV_S);
> >> >      } else {
> >> >          /* handle the trap in M-mode */
> >> > -        target_ulong s = env->mstatus;
> >> > +        target_ulong s = *env->mstatus;
> >> >          s = set_field(s, MSTATUS_MPIE, env->priv_ver >=
> PRIV_VERSION_1_10_0 ?
> >> >              get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE <<
> env->priv));
> >> >          s = set_field(s, MSTATUS_MPP, env->priv);
> >> >          s = set_field(s, MSTATUS_MIE, 0);
> >> > -        env->mstatus = s;
> >> > +        *env->mstatus = s;
> >> >          env->mcause = cause | ~(((target_ulong)-1) >> async);
> >> >          env->mepc = env->pc;
> >> >          env->mbadaddr = tval;
> >> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> > index e2e908fbc0..30ec8c0a8e 100644
> >> > --- a/target/riscv/csr.c
> >> > +++ b/target/riscv/csr.c
> >> > @@ -136,7 +136,7 @@ static int write_fflags(CPURISCVState *env, int
> csrno, target_ulong val)
> >> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >> >          return -1;
> >> >      }
> >> > -    env->mstatus |= MSTATUS_FS;
> >> > +    *env->mstatus |= MSTATUS_FS;
> >> >  #endif
> >> >      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
> >> >      return 0;
> >> > @@ -159,7 +159,7 @@ static int write_frm(CPURISCVState *env, int
> csrno, target_ulong val)
> >> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >> >          return -1;
> >> >      }
> >> > -    env->mstatus |= MSTATUS_FS;
> >> > +    *env->mstatus |= MSTATUS_FS;
> >> >  #endif
> >> >      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
> >> >      return 0;
> >> > @@ -183,7 +183,7 @@ static int write_fcsr(CPURISCVState *env, int
> csrno, target_ulong val)
> >> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >> >          return -1;
> >> >      }
> >> > -    env->mstatus |= MSTATUS_FS;
> >> > +    *env->mstatus |= MSTATUS_FS;
> >> >  #endif
> >> >      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> >> >      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
> >> > @@ -307,7 +307,7 @@ static int read_mhartid(CPURISCVState *env, int
> csrno, target_ulong *val)
> >> >  /* Machine Trap Setup */
> >> >  static int read_mstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
> >> >  {
> >> > -    *val = env->mstatus;
> >> > +    *val = *env->mstatus;
> >> >      return 0;
> >> >  }
> >> >
> >> > @@ -319,7 +319,7 @@ static int validate_vm(CPURISCVState *env,
> target_ulong vm)
> >> >
> >> >  static int write_mstatus(CPURISCVState *env, int csrno, target_ulong
> val)
> >> >  {
> >> > -    target_ulong mstatus = env->mstatus;
> >> > +    target_ulong mstatus = *env->mstatus;
> >> >      target_ulong mask = 0;
> >> >      int dirty;
> >> >
> >> > @@ -359,7 +359,7 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
> >> >               ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
> >> >              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> >> >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
> >> > -    env->mstatus = mstatus;
> >> > +    *env->mstatus = mstatus;
> >> >
> >> >      return 0;
> >> >  }
> >> > @@ -448,13 +448,13 @@ static int write_mideleg(CPURISCVState *env,
> int csrno, target_ulong val)
> >> >
> >> >  static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)
> >> >  {
> >> > -    *val = env->mie;
> >> > +    *val = *env->mie;
> >> >      return 0;
> >> >  }
> >> >
> >> >  static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
> >> >  {
> >> > -    env->mie = (env->mie & ~all_ints) | (val & all_ints);
> >> > +    *env->mie = (*env->mie & ~all_ints) | (val & all_ints);
> >> >      return 0;
> >> >  }
> >> >
> >> > @@ -608,7 +608,7 @@ static int read_sstatus(CPURISCVState *env, int
> csrno, target_ulong *val)
> >> >  {
> >> >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
> >> >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
> >> > -    *val = env->mstatus & mask;
> >> > +    *val = *env->mstatus & mask;
> >> >      return 0;
> >> >  }
> >> >
> >> > @@ -616,19 +616,19 @@ static int write_sstatus(CPURISCVState *env,
> int csrno, target_ulong val)
> >> >  {
> >> >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
> >> >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
> >> > -    target_ulong newval = (env->mstatus & ~mask) | (val & mask);
> >> > +    target_ulong newval = (*env->mstatus & ~mask) | (val & mask);
> >> >      return write_mstatus(env, CSR_MSTATUS, newval);
> >> >  }
> >> >
> >> >  static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
> >> >  {
> >> > -    *val = env->mie & env->mideleg;
> >> > +    *val = *env->mie & env->mideleg;
> >> >      return 0;
> >> >  }
> >> >
> >> >  static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> >> >  {
> >> > -    target_ulong newval = (env->mie & ~env->mideleg) | (val &
> env->mideleg);
> >> > +    target_ulong newval = (*env->mie & ~env->mideleg) | (val &
> env->mideleg);
> >> >      return write_mie(env, CSR_MIE, newval);
> >> >  }
> >> >
> >> > @@ -731,7 +731,7 @@ static int read_satp(CPURISCVState *env, int
> csrno, target_ulong *val)
> >> >      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> >> >          *val = 0;
> >> >      } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> >> > -        if (env->priv == PRV_S && get_field(env->mstatus,
> MSTATUS_TVM)) {
> >> > +        if (env->priv == PRV_S && get_field(*env->mstatus,
> MSTATUS_TVM)) {
> >> >              return -1;
> >> >          } else {
> >> >              *val = env->satp;
> >> > @@ -756,7 +756,7 @@ static int write_satp(CPURISCVState *env, int
> csrno, target_ulong val)
> >> >          validate_vm(env, get_field(val, SATP_MODE)) &&
> >> >          ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
> >> >      {
> >> > -        if (env->priv == PRV_S && get_field(env->mstatus,
> MSTATUS_TVM)) {
> >> > +        if (env->priv == PRV_S && get_field(*env->mstatus,
> MSTATUS_TVM)) {
> >> >              return -1;
> >> >          } else {
> >> >              if((val ^ env->satp) & SATP_ASID) {
> >> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> >> > index 331cc36232..d150551bc9 100644
> >> > --- a/target/riscv/op_helper.c
> >> > +++ b/target/riscv/op_helper.c
> >> > @@ -83,11 +83,11 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> >> >      }
> >> >
> >> >      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
> >> > -        get_field(env->mstatus, MSTATUS_TSR)) {
> >> > +        get_field(*env->mstatus, MSTATUS_TSR)) {
> >> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> >> >      }
> >> >
> >> > -    target_ulong mstatus = env->mstatus;
> >> > +    target_ulong mstatus = *env->mstatus;
> >> >      target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
> >> >      mstatus = set_field(mstatus,
> >> >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
> >> > @@ -96,7 +96,7 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> >> >      mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
> >> >      mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> >> >      riscv_cpu_set_mode(env, prev_priv);
> >> > -    env->mstatus = mstatus;
> >> > +    *env->mstatus = mstatus;
> >> >
> >> >      return retpc;
> >> >  }
> >> > @@ -112,7 +112,7 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> >> >          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS,
> GETPC());
> >> >      }
> >> >
> >> > -    target_ulong mstatus = env->mstatus;
> >> > +    target_ulong mstatus = *env->mstatus;
> >> >      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
> >> >      mstatus = set_field(mstatus,
> >> >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
> >> > @@ -121,7 +121,7 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> >> >      mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
> >> >      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
> >> >      riscv_cpu_set_mode(env, prev_priv);
> >> > -    env->mstatus = mstatus;
> >> > +    *env->mstatus = mstatus;
> >> >
> >> >      return retpc;
> >> >  }
> >> > @@ -132,7 +132,7 @@ void helper_wfi(CPURISCVState *env)
> >> >
> >> >      if (env->priv == PRV_S &&
> >> >          env->priv_ver >= PRIV_VERSION_1_10_0 &&
> >> > -        get_field(env->mstatus, MSTATUS_TW)) {
> >> > +        get_field(*env->mstatus, MSTATUS_TW)) {
> >> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> >> >      } else {
> >> >          cs->halted = 1;
> >> > @@ -147,7 +147,7 @@ void helper_tlb_flush(CPURISCVState *env)
> >> >      if (!(env->priv >= PRV_S) ||
> >> >          (env->priv == PRV_S &&
> >> >           env->priv_ver >= PRIV_VERSION_1_10_0 &&
> >> > -         get_field(env->mstatus, MSTATUS_TVM))) {
> >> > +         get_field(*env->mstatus, MSTATUS_TVM))) {
> >> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> >> >      } else {
> >> >          tlb_flush(cs);
> >>
> >> I don't think this is that bad.
> >>
> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >>
>

--000000000000517b810592ca3445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I went through the uses of mie in the entire hypervis=
or patch series and it seems like it would be much simpler to just have two=
 non-pointer fields in the CPU struct: mie and vsie. To if an interrupt is =
pending, you are either running with V=3D0 in which case the contents of vs=
ie can be ignored, or you are running with V=3D1 and have to check both any=
way. And the read_sie/write_sie would just need a single extra branch retur=
n proper results. The read_mie and write_mie function wouldn&#39;t need to =
be changed at all: if M-mode is running to access them, then V=3D0. (When q=
ueried from a debugger while V=3D1, I think the result would actually be mo=
re correct this way: the bits of mie are supposed to always reflect sie rat=
her than vsie).</div><div><br></div><div>Jonathan<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 17, =
2019 at 7:37 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com=
">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed, Sep 11, 2019 at 7:55 AM Jonathan Behrens &lt;=
<a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; Version 0.4 of the hypervisor spec no longer talks about swapping regi=
sters. Instead when running in VS-mode some of the supervisor registers are=
 &quot;aliased&quot; and actually refer to alternate versions. Implementati=
ons are of course still allowed to do swapping internally if desired, but i=
t adds complexity compared to a more straightforward implementation and isn=
&#39;t obvious to me whether QEMU would get any benefit from it. At least, =
it is probably worth fleshing out the rest of the v0.4 implementation befor=
e deciding on this patch.<br>
<br>
This patch is to handle the aliasing. The commit message isn&#39;t clear<br=
>
(I&#39;ll fix that up) but this patch is required to handle the new alias<b=
r>
method instead of the previous swapping.<br>
<br>
Alistair<br>
<br>
&gt; Jonathan<br>
&gt;<br>
&gt; On Wed, Sep 11, 2019 at 4:24 AM Palmer Dabbelt &lt;<a href=3D"mailto:p=
almer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 23 Aug 2019 16:38:15 PDT (-0700), Alistair Francis wrote:<=
br>
&gt;&gt; &gt; To handle the new Hypervisor CSR register swapping let&#39;s =
use pointers.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We only need to convert the MIE and MSTATUS CSRs. With the ex=
ception of<br>
&gt;&gt; &gt; MIP all of the other CSRs that swap with virtulsation changes=
 are S-Mode<br>
&gt;&gt; &gt; only, so we can just do a lazy switch. This because more chal=
lenging for<br>
&gt;&gt; &gt; the M-Mode registers so it ends up being easier to use pointe=
rs.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As the MIP CSR is always accessed atomicly the pointer swap d=
oesn&#39;t work<br>
&gt;&gt; &gt; so we leave that as is.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistai=
r.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++=
++++++++----<br>
&gt;&gt; &gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++=
++++++--<br>
&gt;&gt; &gt;=C2=A0 target/riscv/cpu_helper.c | 32 ++++++++++++++++--------=
--------<br>
&gt;&gt; &gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 ++++=
++++++++++--------------<br>
&gt;&gt; &gt;=C2=A0 target/riscv/op_helper.c=C2=A0 | 14 +++++++-------<br>
&gt;&gt; &gt;=C2=A0 5 files changed, 59 insertions(+), 43 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; &gt; index be8f643fc2..371d5845af 100644<br>
&gt;&gt; &gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; &gt; @@ -228,7 +228,7 @@ static void riscv_cpu_dump_state(CPUState=
 *cs, FILE *f, int flags)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_F=
MT_lx &quot;\n&quot;, &quot;pc=C2=A0 =C2=A0 =C2=A0 &quot;, env-&gt;pc);<br>
&gt;&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_F=
MT_lx &quot;\n&quot;, &quot;mhartid &quot;, env-&gt;mhartid);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx=
 &quot;\n&quot;, &quot;mstatus &quot;, env-&gt;mstatus);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx=
 &quot;\n&quot;, &quot;mstatus &quot;, *env-&gt;mstatus);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_has_ext(env, RVH)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &=
quot; TARGET_FMT_lx &quot;\n&quot;, &quot;hstatus &quot;, env-&gt;hstatus);=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &=
quot; TARGET_FMT_lx &quot;\n&quot;, &quot;bstatus &quot;, env-&gt;vsstatus)=
;<br>
&gt;&gt; &gt; @@ -239,7 +239,7 @@ static void riscv_cpu_dump_state(CPUState=
 *cs, FILE *f, int flags)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &=
quot; TARGET_FMT_lx &quot;\n&quot;, &quot;vsip=C2=A0 =C2=A0 &quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(target_ulong)atomic_read(&amp;env-&gt;vsip));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx=
 &quot;\n&quot;, &quot;mie=C2=A0 =C2=A0 =C2=A0&quot;, env-&gt;mie);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx=
 &quot;\n&quot;, &quot;mie=C2=A0 =C2=A0 =C2=A0&quot;, *env-&gt;mie);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_has_ext(env, RVH)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &=
quot; TARGET_FMT_lx &quot;\n&quot;, &quot;vsie=C2=A0 =C2=A0 &quot;, env-&gt=
;vsie);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; @@ -309,7 +309,7 @@ static bool riscv_cpu_has_work(CPUState *=
cs)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Definition of the WFI instruction=
 requires it to ignore the privilege<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* mode and delegation registers, bu=
t respect individual enables<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 return (atomic_read(&amp;env-&gt;mip) &amp; en=
v-&gt;mie) !=3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return (atomic_read(&amp;env-&gt;mip) &amp; *e=
nv-&gt;mie) !=3D 0;<br>
&gt;&gt; &gt;=C2=A0 #else<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt; @@ -330,7 +330,7 @@ static void riscv_cpu_reset(CPUState *cs)=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mcc-&gt;parent_reset(cs);<br>
&gt;&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;priv =3D PRV_M;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus &amp;=3D ~(MSTATUS_MIE | MSTAT=
US_MPRV);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus &amp;=3D ~(MSTATUS_MIE | MSTA=
TUS_MPRV);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D env-&gt;resetvec;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt; @@ -459,8 +459,16 @@ static void riscv_cpu_realize(DeviceStat=
e *dev, Error **errp)<br>
&gt;&gt; &gt;=C2=A0 static void riscv_cpu_init(Object *obj)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; &gt; +#ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt;&gt; &gt; +#endif<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpu_set_cpustate_pointers(cpu);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 env-&gt;mie =3D &amp;env-&gt;mie_novirt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 env-&gt;mstatus =3D &amp;env-&gt;mstatus_novir=
t;<br>
&gt;&gt; &gt; +#endif<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static const VMStateDescription vmstate_riscv_cpu =3D {=
<br>
&gt;&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; &gt; index 4c342e7a79..680592cb60 100644<br>
&gt;&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; &gt; @@ -122,7 +122,7 @@ struct CPURISCVState {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong resetvec;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mhartid;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong *mstatus;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* CAUTION! Unlike the rest of this =
struct, mip is accessed asynchonously<br>
&gt;&gt; &gt; @@ -136,7 +136,7 @@ struct CPURISCVState {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint32_t mip;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint32_t miclaim;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mie;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong *mie;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mideleg;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong sptbr;=C2=A0 /* until: priv-=
1.9.1 */<br>
&gt;&gt; &gt; @@ -154,6 +154,14 @@ struct CPURISCVState {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: priv-=
1.10.0 */<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 /* The following registers are the &quot;real&=
quot; versions that the pointer<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* versions point to. These should never =
be used unless you know what you<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* are doing. To access these use the poi=
nter versions instead. This is<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* required to handle the Hypervisor regi=
ster swapping.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mie_novirt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_novirt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hstatus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hedeleg;<br>
&gt;&gt; &gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_hel=
per.c<br>
&gt;&gt; &gt; index 5bcfc2e090..c597523d74 100644<br>
&gt;&gt; &gt; --- a/target/riscv/cpu_helper.c<br>
&gt;&gt; &gt; +++ b/target/riscv/cpu_helper.c<br>
&gt;&gt; &gt; @@ -36,9 +36,9 @@ int riscv_cpu_mmu_index(CPURISCVState *env,=
 bool ifetch)<br>
&gt;&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt;=C2=A0 static int riscv_cpu_local_irq_pending(CPURISCVState *e=
nv)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt=
;mstatus, MSTATUS_MIE);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env-&gt=
;mstatus, MSTATUS_SIE);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong pending =3D atomic_read(&amp;env-=
&gt;mip) &amp; env-&gt;mie;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(*env-&g=
t;mstatus, MSTATUS_MIE);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(*env-&g=
t;mstatus, MSTATUS_SIE);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong pending =3D atomic_read(env-&gt;m=
ip) &amp; *env-&gt;mie;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mie =3D env-&gt;priv &lt; PR=
V_M || (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_mie);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong sie =3D env-&gt;priv &lt; PR=
V_S || (env-&gt;priv =3D=3D PRV_S &amp;&amp; mstatus_sie);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong irqs =3D (pending &amp; ~env=
-&gt;mideleg &amp; -mie) |<br>
&gt;&gt; &gt; @@ -74,7 +74,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs,=
 int interrupt_request)<br>
&gt;&gt; &gt;=C2=A0 /* Return true is floating point support is currently e=
nabled */<br>
&gt;&gt; &gt;=C2=A0 bool riscv_cpu_fp_enabled(CPURISCVState *env)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if (env-&gt;mstatus &amp; MSTATUS_FS) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (*env-&gt;mstatus &amp; MSTATUS_FS) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -219,8 +219,8 @@ static int get_physical_address(CPURISCVS=
tate *env, hwaddr *physical,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int mode =3D mmu_idx;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (mode =3D=3D PRV_M &amp;&amp; access_t=
ype !=3D MMU_INST_FETCH) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(env-&gt;mstatus, M=
STATUS_MPRV)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field=
(env-&gt;mstatus, MSTATUS_MPP);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(*env-&gt;mstatus, =
MSTATUS_MPRV)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field=
(*env-&gt;mstatus, MSTATUS_MPP);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -234,11 +234,11 @@ static int get_physical_address(CPURISC=
VState *env, hwaddr *physical,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong base;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int levels, ptidxbits, ptesize, vm, sum;<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 int mxr =3D get_field(env-&gt;mstatus, MSTATUS=
_MXR);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int mxr =3D get_field(*env-&gt;mstatus, MSTATU=
S_MXR);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &gt;=3D PRIV_VERSION=
_1_10_0) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D get_field(env-&gt;=
satp, SATP_PPN) &lt;&lt; PGSHIFT;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D get_field(env-&gt;mstatu=
s, MSTATUS_SUM);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D get_field(*env-&gt;mstat=
us, MSTATUS_SUM);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(env-&gt;sa=
tp, SATP_MODE);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (vm) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV32:<br>
&gt;&gt; &gt; @@ -258,8 +258,8 @@ static int get_physical_address(CPURISCVS=
tate *env, hwaddr *physical,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D env-&gt;sptbr &lt;=
&lt; PGSHIFT;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D !get_field(env-&gt;mstat=
us, MSTATUS_PUM);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(env-&gt;mstatus=
, MSTATUS_VM);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D !get_field(*env-&gt;msta=
tus, MSTATUS_PUM);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(*env-&gt;mstatu=
s, MSTATUS_VM);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (vm) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_09_SV32:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 levels =3D 2; ptidxb=
its =3D 10; ptesize =3D 4; break;<br>
&gt;&gt; &gt; @@ -505,8 +505,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vad=
dr address, int size,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ret =3D get_physical_address(env, &amp;pa=
, &amp;prot, address, access_type, mmu_idx);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (mode =3D=3D PRV_M &amp;&amp; access_t=
ype !=3D MMU_INST_FETCH) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(env-&gt;mstatus, M=
STATUS_MPRV)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field=
(env-&gt;mstatus, MSTATUS_MPP);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(*env-&gt;mstatus, =
MSTATUS_MPRV)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field=
(*env-&gt;mstatus, MSTATUS_MPP);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -606,12 +606,12 @@ void riscv_cpu_do_interrupt(CPUState *c=
s)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv &lt;=3D PRV_S &amp;&amp;=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &lt; TA=
RGET_LONG_BITS &amp;&amp; ((deleg &gt;&gt; cause) &amp; 1)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* handle the trap in S-mod=
e */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D env-&gt;mstat=
us;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D *env-&gt;msta=
tus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
SPIE, env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 ?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(s, =
MSTATUS_SIE) : get_field(s, MSTATUS_UIE &lt;&lt; env-&gt;priv));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
SPP, env-&gt;priv);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
SIE, 0);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus =3D s;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *env-&gt;mstatus =3D s;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D cause | =
((target_ulong)async &lt;&lt; (TARGET_LONG_BITS - 1));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;sepc =3D env-&gt;pc=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;sbadaddr =3D tval;<=
br>
&gt;&gt; &gt; @@ -620,12 +620,12 @@ void riscv_cpu_do_interrupt(CPUState *c=
s)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, PRV=
_S);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* handle the trap in M-mod=
e */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D env-&gt;mstat=
us;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D *env-&gt;msta=
tus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
MPIE, env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 ?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(s, =
MSTATUS_MIE) : get_field(s, MSTATUS_UIE &lt;&lt; env-&gt;priv));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
MPP, env-&gt;priv);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_=
MIE, 0);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus =3D s;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *env-&gt;mstatus =3D s;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D cause | =
~(((target_ulong)-1) &gt;&gt; async);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mepc =3D env-&gt;pc=
;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mbadaddr =3D tval;<=
br>
&gt;&gt; &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt;&gt; &gt; index e2e908fbc0..30ec8c0a8e 100644<br>
&gt;&gt; &gt; --- a/target/riscv/csr.c<br>
&gt;&gt; &gt; +++ b/target/riscv/csr.c<br>
&gt;&gt; &gt; @@ -136,7 +136,7 @@ static int write_fflags(CPURISCVState *en=
v, int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_c=
pu_fp_enabled(env)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_fflags(env, val &amp; (FSR_=
AEXC &gt;&gt; FSR_AEXC_SHIFT));<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt; @@ -159,7 +159,7 @@ static int write_frm(CPURISCVState *env, =
int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_c=
pu_fp_enabled(env)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;frm =3D val &amp; (FSR_RD &gt;&gt=
; FSR_RD_SHIFT);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt; @@ -183,7 +183,7 @@ static int write_fcsr(CPURISCVState *env,=
 int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_c=
pu_fp_enabled(env)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;frm =3D (val &amp; FSR_RD) &gt;&g=
t; FSR_RD_SHIFT;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_fflags(env, (val &amp; FSR_=
AEXC) &gt;&gt; FSR_AEXC_SHIFT);<br>
&gt;&gt; &gt; @@ -307,7 +307,7 @@ static int read_mhartid(CPURISCVState *en=
v, int csrno, target_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 /* Machine Trap Setup */<br>
&gt;&gt; &gt;=C2=A0 static int read_mstatus(CPURISCVState *env, int csrno, =
target_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mstatus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -319,7 +319,7 @@ static int validate_vm(CPURISCVState *env=
, target_ulong vm)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static int write_mstatus(CPURISCVState *env, int csrno,=
 target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int dirty;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -359,7 +359,7 @@ static int write_mstatus(CPURISCVState *e=
nv, int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((mstat=
us &amp; MSTATUS_FS) =3D=3D MSTATUS_FS)) |<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &am=
p; MSTATUS_XS) =3D=3D MSTATUS_XS);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SD=
, dirty);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; @@ -448,13 +448,13 @@ static int write_mideleg(CPURISCVState =
*env, int csrno, target_ulong val)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static int read_mie(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mie;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mie;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static int write_mie(CPURISCVState *env, int csrno, tar=
get_ulong val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mie =3D (env-&gt;mie &amp; ~all_ints) =
| (val &amp; all_ints);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mie =3D (*env-&gt;mie &amp; ~all_ints=
) | (val &amp; all_ints);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -608,7 +608,7 @@ static int read_sstatus(CPURISCVState *en=
v, int csrno, target_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D ((env-&gt;priv_ver =
&gt;=3D PRIV_VERSION_1_10_0) ?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstatus_v1_10_mask : sstatus_v1_9_mask);=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mstatus &amp; mask;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mstatus &amp; mask;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -616,19 +616,19 @@ static int write_sstatus(CPURISCVState =
*env, int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D ((env-&gt;priv_ver =
&gt;=3D PRIV_VERSION_1_10_0) ?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstatus_v1_10_mask : sstatus_v1_9_mask);=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mstatus &amp;=
 ~mask) | (val &amp; mask);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong newval =3D (*env-&gt;mstatus &amp=
; ~mask) | (val &amp; mask);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return write_mstatus(env, CSR_MSTATUS, ne=
wval);<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static int read_sie(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; env-&gt;mideleg;<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mie &amp; env-&gt;mideleg;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static int write_sie(CPURISCVState *env, int csrno, tar=
get_ulong val)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~en=
v-&gt;mideleg) | (val &amp; env-&gt;mideleg);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong newval =3D (*env-&gt;mie &amp; ~e=
nv-&gt;mideleg) | (val &amp; env-&gt;mideleg);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return write_mie(env, CSR_MIE, newval);<b=
r>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -731,7 +731,7 @@ static int read_satp(CPURISCVState *env, =
int csrno, target_ulong *val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_MMU=
)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D 0;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (env-&gt;priv_ver &gt;=3D PRIV_=
VERSION_1_10_0) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &a=
mp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &a=
mp;&amp; get_field(*env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-=
&gt;satp;<br>
&gt;&gt; &gt; @@ -756,7 +756,7 @@ static int write_satp(CPURISCVState *env,=
 int csrno, target_ulong val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 validate_vm(env, get_field(=
val, SATP_MODE)) &amp;&amp;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((val ^ env-&gt;satp) &amp;=
 (SATP_MODE | SATP_ASID | SATP_PPN)))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &a=
mp;&amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &a=
mp;&amp; get_field(*env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((val ^ env=
-&gt;satp) &amp; SATP_ASID) {<br>
&gt;&gt; &gt; diff --git a/target/riscv/op_helper.c b/target/riscv/op_helpe=
r.c<br>
&gt;&gt; &gt; index 331cc36232..d150551bc9 100644<br>
&gt;&gt; &gt; --- a/target/riscv/op_helper.c<br>
&gt;&gt; &gt; +++ b/target/riscv/op_helper.c<br>
&gt;&gt; &gt; @@ -83,11 +83,11 @@ target_ulong helper_sret(CPURISCVState *e=
nv, target_ulong cpu_pc_deb)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &gt;=3D PRIV_VERSION=
_1_10_0 &amp;&amp;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTAT=
US_TSR)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(*env-&gt;mstatus, MSTA=
TUS_TSR)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, =
RISCV_EXCP_ILLEGAL_INST, GETPC());<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong prev_priv =3D get_field(msta=
tus, MSTATUS_SPP);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PR=
IV_VERSION_1_10_0 ?<br>
&gt;&gt; &gt; @@ -96,7 +96,7 @@ target_ulong helper_sret(CPURISCVState *env=
, target_ulong cpu_pc_deb)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SP=
IE, 0);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SP=
P, PRV_U);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, prev_priv);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return retpc;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; @@ -112,7 +112,7 @@ target_ulong helper_mret(CPURISCVState *e=
nv, target_ulong cpu_pc_deb)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, =
RISCV_EXCP_INST_ADDR_MIS, GETPC());<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong prev_priv =3D get_field(msta=
tus, MSTATUS_MPP);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PR=
IV_VERSION_1_10_0 ?<br>
&gt;&gt; &gt; @@ -121,7 +121,7 @@ target_ulong helper_mret(CPURISCVState *e=
nv, target_ulong cpu_pc_deb)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_MP=
IE, 0);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_MP=
P, PRV_U);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, prev_priv);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return retpc;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; @@ -132,7 +132,7 @@ void helper_wfi(CPURISCVState *env)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&amp;<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PR=
IV_VERSION_1_10_0 &amp;&amp;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTAT=
US_TW)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(*env-&gt;mstatus, MSTA=
TUS_TW)) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, =
RISCV_EXCP_ILLEGAL_INST, GETPC());<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;halted =3D 1;<br>
&gt;&gt; &gt; @@ -147,7 +147,7 @@ void helper_tlb_flush(CPURISCVState *env)=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;priv &gt;=3D PRV_S) ||<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S =
&amp;&amp;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;priv_ver &gt;=
=3D PRIV_VERSION_1_10_0 &amp;&amp;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env-&gt;mstatus,=
 MSTATUS_TVM))) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(*env-&gt;mstatus=
, MSTATUS_TVM))) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, =
RISCV_EXCP_ILLEGAL_INST, GETPC());<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tlb_flush(cs);<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think this is that bad.<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.co=
m" target=3D"_blank">palmer@sifive.com</a>&gt;<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000517b810592ca3445--

