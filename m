Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hsWzb-00074L-1y
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jul 2019 14:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46473)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hsWzX-0006zG-Nq
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2019 14:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hsWzW-0000NA-9u
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2019 14:36:55 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:40102)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hsWzT-0000KW-Ab; Tue, 30 Jul 2019 14:36:51 -0400
Received: by mail-lf1-x144.google.com with SMTP id b17so45492918lff.7;
 Tue, 30 Jul 2019 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQKZGEGRGqwXa1PHqJAW8SArvks8z7pc8q47hmNRjOY=;
 b=qrVnPeMFFgoU5jtKjfG3E0t8Pftt4/1ghBCZ2eCMv3QfUG8E6twT5oW6iIo2cdGsvb
 2e3yee/jDkMujYBtm0N8Id1MGG1KzYw66FSjXBUweLpwOAY4evYpUdFA6qXriKnxDNcG
 XpvI3EhsCQZqpTbLr0Nx4ZGaKUEbhnaPZt7Cxwv0BPXwj4502Jg4bLedoMsoIGWokG8T
 cVYuLAS8JaKNzSk1+wEX0NQFIaq8cPBF6sm+YFK6p5XjugUx0KwIlhPBidrmvtbGQI2U
 KHBLOxaja0qDSCGGZCBZenqwADvxOcQcDP9uTvlLsupjLKF6DO2IzA5yb91GXpdslLNI
 MyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQKZGEGRGqwXa1PHqJAW8SArvks8z7pc8q47hmNRjOY=;
 b=dXB0/AYLnSFrDLhor2XH970eKgKyHWl19r1DncKLXOc+9dl9gPHmF0qQa9QRgNKm1L
 lRGXg9c0hVxKRozfpYfD5/nc4Mn1HaogBKNdC7lkazm/43F7mIVZxjLW8XwF/IDhQyi4
 +RRG11Oi0B70puHBMCzgN4jxwc/HreoX/C/hJhWw54jBN9FUAfpim+JtVfppOldhM6k0
 YD0tWpBnt5tKBciPIKYGLFf0mSFybT3R/2+wiRB5lQmoXve1ZwS2TB0antLO2lQBKTKp
 uk8VSSIa73WK9BCaI8Jw6ozBuVztJD7L7nvf1lBUI/7jfsA9ewnQuXfaYpmTluBNwSyI
 pKQA==
X-Gm-Message-State: APjAAAVA0eNsNMtu1dbQO+b/I3cafQ31GcO+w0ADrJI2gk8kwkRGGT47
 hjI0GxDT4+icVEin43U/YdOGEbFtOC8t3peI20w+Jh1M
X-Google-Smtp-Source: APXvYqyQRWKJQyDeFHi/fPg4cwsirG9Mw+CC0lGg8WqhWWFRyt3hKZ3Spl3k466OSLBHY9jWBrz7+BHH58Kqm1L0vu4=
X-Received: by 2002:a19:6904:: with SMTP id e4mr36851559lfc.156.1564511809937; 
 Tue, 30 Jul 2019 11:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <edea77ff4aa6900d01ab7146d5b52c2dae4a856e.1564080680.git.alistair.francis@wdc.com>
 <m1zhkvoqjt.fsf@redhat.com>
In-Reply-To: <m1zhkvoqjt.fsf@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jul 2019 11:33:16 -0700
Message-ID: <CAKmqyKPjJgOW8KvgbXX-8hJpkA=sHcsYJSPTE9pSrUCPaNjhgw@mail.gmail.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 4/6] target/riscv:
 Create function to test if FP is enabled
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
X-List-Received-Date: Tue, 30 Jul 2019 18:36:57 -0000

On Tue, Jul 30, 2019 at 1:49 AM Christophe de Dinechin
<dinechin@redhat.com> wrote:
>
>
> Alistair Francis writes:
>
> > Let's creaate a function that tests if floating point support is
>
> Typo: create

Fixed

>
> > enabled. We can then protect all floating point operations based on if
> > they are enabled.
> >
> > This patch so far doesn't change anything, it's just preparing for the
> > Hypervisor support for floating point operations.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.h        |  6 +++++-
> >  target/riscv/cpu_helper.c | 10 ++++++++++
> >  target/riscv/csr.c        | 19 ++++++++++---------
> >  3 files changed, 25 insertions(+), 10 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0adb307f32..2dc9b17678 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -255,6 +255,7 @@ void riscv_cpu_do_interrupt(CPUState *cpu);
> >  int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
> >  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> >  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> > +bool riscv_cpu_fp_enabled(CPURISCVState *env);
> >  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
> >  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> > @@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> >  #ifdef CONFIG_USER_ONLY
> >      *flags = TB_FLAGS_MSTATUS_FS;
> >  #else
> > -    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
> > +    *flags = cpu_mmu_index(env, 0);
> > +    if (riscv_cpu_fp_enabled(env)) {
> > +        *flags |= env->mstatus & MSTATUS_FS;
> > +    }
> >  #endif
> >  }
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index f027be7f16..225e407cff 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -71,6 +71,16 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> >
> >  #if !defined(CONFIG_USER_ONLY)
> >
> > +/* Return true is floating point support is currently enabled */
> > +bool riscv_cpu_fp_enabled(CPURISCVState *env)
> > +{
> > +    if (env->mstatus & MSTATUS_FS) {
> > +        return true;
> > +    }
> > +
> > +    return false;
>
> Will there be more conditions that lead to the "true" case?
> If not, please consider making it a one-liner for readability, e.g.
>
>    return env->mstatus & MSTATUS_FS;
>
> (just a personal preference, feel free to ignore)

There are going to be more conditionals when adding the Hypervisor extension.

>
> > +}
> > +
> >  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> >  {
> >      CPURISCVState *env = &cpu->env;
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index af3b762c8b..7b73b73cf7 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
> >  static int fs(CPURISCVState *env, int csrno)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>
> This was existing behavior, but I'm curious why all these
> tests are disabled when env->debugger is set. This was introduced
> in 753e3fe20, but I see no rationale in the commit message.
> I find it odd, maybe even suspicious, that activating the debugger
> would change the behavior :-)

This is to allow GDB to access the registers.

>
> >          return -1;
> >      }
> >  #endif
> > @@ -108,7 +108,7 @@ static int pmp(CPURISCVState *env, int csrno)
> >  static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >  #endif
> > @@ -119,7 +119,7 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
> >  static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >      env->mstatus |= MSTATUS_FS;
> > @@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
> >  static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >  #endif
> > @@ -142,7 +142,7 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
> >  static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >      env->mstatus |= MSTATUS_FS;
> > @@ -154,7 +154,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
> >  static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >  #endif
> > @@ -166,7 +166,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
> >  static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >          return -1;
> >      }
> >      env->mstatus |= MSTATUS_FS;
> > @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> >      target_ulong mstatus = env->mstatus;
> >      target_ulong mask = 0;
> > +    int dirty;
> >
> >      /* flush tlb on mstatus fields that affect VM */
> >      if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> > @@ -340,8 +341,8 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> >
> >      mstatus = (mstatus & ~mask) | (val & mask);
> >
> > -    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> > -                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > +    dirty = riscv_cpu_fp_enabled(env) |
> > +            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
> >      env->mstatus = mstatus;
>
> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>

Thanks!

Alistair

>
> --
> Cheers,
> Christophe de Dinechin (IRC c3d)

