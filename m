Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5efM-0007TA-G1
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5efK-0007SJ-R1; Thu, 06 Jan 2022 21:07:38 -0500
Received: from [2607:f8b0:4864:20::b30] (port=37401
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5efJ-0007e0-4W; Thu, 06 Jan 2022 21:07:38 -0500
Received: by mail-yb1-xb30.google.com with SMTP id e202so12739289ybf.4;
 Thu, 06 Jan 2022 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fq/RmabYvBPVyKatqZCdDXtVyOZiruR7u1FNU7lJ/7c=;
 b=dvJzkgsHDVdLjbWZRdveHpBYcX1IZpgX10K/+8q868DicP1Tg02WYaGen709b9oSPu
 CE5AfmWrT0HeUUKNMfy4UrqrbgZLiTnSM2rPnoNdvyTFYokgjxYQ5rwfnc+rSzFj6Fcd
 q3HnQkQX/88W4ssKNofZeVYBz8u6vYGR4eOQDMP4BZWV3XAxZybIBNMnIbaDmQZc8YCJ
 4WvqTIl9gteruB4hBBBlN5pmbIlTItsk3fdY38sMDeGn6rHo22SJaG8VvlPp0e+w6EmH
 CBPAUYfHbRyYISycMPU4Q07QZncJVEGnyacKKOmRkbPP/lHzsgPyVdgrvPn8a64Uj0O9
 Fdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fq/RmabYvBPVyKatqZCdDXtVyOZiruR7u1FNU7lJ/7c=;
 b=irrG+xrOCG3ItlVGeVzExxGyVyxeihRITAo9Mv2t8JFN/S8ExkoKrsyRRQfTHmnRPS
 WvILNwDO4v8f5NYVpf/zDC1+XEa9cNqrvi+LvYit6l1+tdBvQDMg85wddt/caRHcJ9PY
 kzbtDQGtTvA06GabD1G559dow7zhnZ5wGdWbcR15YZhTeQm+nNaxYyHwOFxMBtTv86t5
 zxTWLchyuRBnVwmooBTYfsXDPE00Tz6U1TOm0DgsbBcseyX7DvLlPrHE6hsRvdSEbLN9
 c5Qan3RTBT3yQOLQeg5BM6k/7gsjl3zsQ6R3yL0Pgb0DjDbEOvpBXrPUGv6m1ki52An/
 dQYw==
X-Gm-Message-State: AOAM532e+2Kdp3osrVOUCEG8roecX3LLMnRLQ92kcGZU0UZuPUsUejbj
 BOgV4wYB/ND6V+ttnFyunSkKDQzMJk2pg4uYh8I=
X-Google-Smtp-Source: ABdhPJwzsGslMG5jU4CPPLysM5OWhkJ9lH0Yvt2kF5X7abST637nHn05Jk3HrE9KT/h8C6n39th5pl/Bw11I6+JL28Q=
X-Received: by 2002:a25:3242:: with SMTP id y63mr65237847yby.670.1641521255770; 
 Thu, 06 Jan 2022 18:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
 <CAEUhbmU7Z7sbgE934=R+UV3XvOjoG5hOC_DqA7OscRLppcAtSw@mail.gmail.com>
 <CAKmqyKMZA=Uq9AxGP+O2R7SFEFGUcLhjqqbQ+E-PQSYtemPqrQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMZA=Uq9AxGP+O2R7SFEFGUcLhjqqbQ+E-PQSYtemPqrQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 7 Jan 2022 10:07:24 +0800
Message-ID: <CAEUhbmVCofveAk4D-HFJ+uKngNuoFUwSc1rv4V5stfnhZKN7tA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/riscv: Fixup setting GVA
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 02:07:39 -0000

On Thu, Jan 6, 2022 at 12:04 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Dec 21, 2021 at 5:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Dec 20, 2021 at 2:49 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > In preperation for adding support for the illegal instruction address
> >
> > typo: preparation
>
> Fixed
>
> >
> > > let's fixup the Hypervisor extension setting GVA logic and improve the
> > > variable names.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu_helper.c | 21 ++++++---------------
> > >  1 file changed, 6 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 9eeed38c7e..9e1f5ee177 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -967,6 +967,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >
> > >      RISCVCPU *cpu = RISCV_CPU(cs);
> > >      CPURISCVState *env = &cpu->env;
> > > +    bool write_gva = false;
> > >      uint64_t s;
> > >
> > >      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> > > @@ -975,7 +976,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >      bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
> > >      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
> > >      target_ulong deleg = async ? env->mideleg : env->medeleg;
> > > -    bool write_tval = false;
> > >      target_ulong tval = 0;
> > >      target_ulong htval = 0;
> > >      target_ulong mtval2 = 0;
> > > @@ -1004,7 +1004,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >          case RISCV_EXCP_INST_PAGE_FAULT:
> > >          case RISCV_EXCP_LOAD_PAGE_FAULT:
> > >          case RISCV_EXCP_STORE_PAGE_FAULT:
> > > -            write_tval  = true;
> > > +            write_gva = true;
> > >              tval = env->badaddr;
> > >              break;
> > >          default:
> > > @@ -1041,18 +1041,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >          if (riscv_has_ext(env, RVH)) {
> > >              target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
> > >
> > > -            if (env->two_stage_lookup && write_tval) {
> > > -                /*
> > > -                 * If we are writing a guest virtual address to stval, set
> > > -                 * this to 1. If we are trapping to VS we will set this to 0
> > > -                 * later.
> > > -                 */
> > > -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> > > -            } else {
> > > -                /* For other HS-mode traps, we set this to 0. */
> > > -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> > > -            }
> > > -
> > >              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
> > >                  /* Trap to VS mode */
> > >                  /*
> > > @@ -1063,7 +1051,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >                      cause == IRQ_VS_EXT) {
> > >                      cause = cause - 1;
> > >                  }
> > > -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> > > +                write_gva = false;
> > >              } else if (riscv_cpu_virt_enabled(env)) {
> > >                  /* Trap into HS mode, from virt */
> > >                  riscv_cpu_swap_hypervisor_regs(env);
> > > @@ -1072,6 +1060,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
> > >                                           riscv_cpu_virt_enabled(env));
> > >
> > > +
> > >                  htval = env->guest_phys_fault_addr;
> > >
> > >                  riscv_cpu_set_virt_enabled(env, 0);
> > > @@ -1079,7 +1068,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >                  /* Trap into HS mode */
> > >                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> > >                  htval = env->guest_phys_fault_addr;
> > > +                write_gva = false;
> > >              }
> > > +            env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
> >
> > This does not look correct to me.
> >
> > The env->hstatus[GVA] should remain untouched in the 2nd and 3rd
> > branch. It only needs to be set in the first branch.
>
> The RISC-V spec says:
>
> ""'
> Field GVA (Guest Virtual Address) is written by the implementation
> whenever a trap is taken
> into HS-mode. For any trap (breakpoint, address misaligned, access
> fault, page fault, or guest-
> page fault) that writes a guest virtual address to stval, GVA is set
> to 1. For any other trap into
> HS-mode, GVA is set to 0.
> """
>
> So it has to be set in the second and third branches as they are
> trapping into HS mode. I guess we could not touch it in the first
> branch (Trap to VS mode), but that means we would need to ensure it is
> updated later, so it seems easiest to just clear it here.

Thanks for the info.

>
> In the second branch (Trap into HS mode, from virt) we set GVA based
> on the trap cause, which seems correct.
>
> In the third case (Trap into HS mode) we are trapping from HS to HS so
> we want to clear GVA.

With these explanations, I feel this patch mixed up two things into one patch.

The changes to 2nd and 3rd branch probably merit a separate patch with
a better commit message as it *explicitely* clear or set GVA field as
per the spec while current codes don't do that.
A follow-up patch can be made to consolidate other "write_tval" cases.

But that's up to you. FWIW:
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

