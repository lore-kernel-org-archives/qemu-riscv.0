Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt8VI-0006HX-Oc
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 08:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lt8VG-0006Ev-TA
 for qemu-riscv@nongnu.org; Tue, 15 Jun 2021 08:49:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lt8VE-0005XD-It
 for qemu-riscv@nongnu.org; Tue, 15 Jun 2021 08:49:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so18198385wri.11
 for <qemu-riscv@nongnu.org>; Tue, 15 Jun 2021 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVJL/glw3wQs8yLJqML+cu/28FARd0QZC/8PMozpSS4=;
 b=brbRBjOv9PzC+n04kHi3zzERi3WLIbd17XoCgVdtLMZZ6M+jnDMiP6YPLACIa/gXGL
 UMBQW01VQaScvQxgcwGA7qGD3NT//0RnmUleUCiQzDjj+qRwdFTzxzeLVRkQPiW2DXmm
 /uHYfM2VvqQpSb1vVEH8wgyVHl5+Jb2uRjilLjykutThCMIYORIpZPsAwJxdhcHhgOR0
 WojbBXgZOWZs5v64j221RAhviwQYCMySOlzKLwZMKkGdEEF+MsoQzhvo/T1DQDdDCFez
 FSPRX8oNmjBPwTj/2vzeIhYY1lue5Ke+v0SzlUvRNQmyEH4+zsvfz5pQNA5VIXWciied
 CeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVJL/glw3wQs8yLJqML+cu/28FARd0QZC/8PMozpSS4=;
 b=KOWja3sqqe8/ZyabEM+pfcVv1z3OYAqov1U0lIokvDPVoM5y9fnidyfiYjELzJUVOY
 0d6R/GapdFlB9pA6x+9JMtxvcPEYbRB0i+n21BPmaZr9EEhGhrpmabTaP1Ye+im/W1s7
 nvOalvMiN8Ixo8ZmjHjbdN/XDee6KQjh8Y8I4VWXRR32SLiH4+52FpYmZWKlRoeGjhgR
 gOzkYuvyDjXyLuSsfpKT34wQUkOmeLQZVTSCqUGg/jh0OJRegBSoDT3YWZZ572YQCnXk
 3S9BIBJCZxT4sQFRdRnkY/73ypRJoAmEvHMy/hUGxC0nD+NZvVzYrmtIP+t90WslqLe2
 gzOg==
X-Gm-Message-State: AOAM532WSe+FOWqy/mvFC2eSo3CwP4lcfAOCZLyFDgYhfC4cokQI+ht7
 djkHJ7fUkhueg1Flc7Fo3ppNgOYnfkw7cfv/IVPcsg==
X-Google-Smtp-Source: ABdhPJxZVijDLhGLVkp+ZTMUgdi4acHXlChbuu2hUs+UDrey6J+0E6hlWyEdtRtxoR0UF/zQhm8jdfdA+2QFWKeUvxI=
X-Received: by 2002:a5d:58f6:: with SMTP id f22mr24469489wrd.128.1623761350145; 
 Tue, 15 Jun 2021 05:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-4-anup.patel@wdc.com>
 <CAKmqyKOcsF32oLtfyh511JCcrwgONK1qvjwK-dMYdPPZABYOOg@mail.gmail.com>
 <CAAhSdy1eWW6bw55O1pLHvopRVvM6DVb-kzvhTAjAoyvB0qt5bQ@mail.gmail.com>
 <CAKmqyKO_hEpGUNkH99rk2XNERHFN_iQTJEuHzGDsNerHXqna0Q@mail.gmail.com>
 <CAAhSdy0ifGW6QJC+esbx9+V7huOrAFigJsh5LsCHh7MofT721A@mail.gmail.com>
 <CAKmqyKM12-P-2Hg+Ynopj_i6BX4s1xAj9SJ6JvUrSsTn_LPcag@mail.gmail.com>
In-Reply-To: <CAKmqyKM12-P-2Hg+Ynopj_i6BX4s1xAj9SJ6JvUrSsTn_LPcag@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Jun 2021 18:18:58 +0530
Message-ID: <CAAhSdy3iBNZt-SwiqFJK_HkwqP__baSaq_ozoA-iFKgd5cop6Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Implement AIA local interrupt CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 15 Jun 2021 12:49:15 -0000

On Tue, Jun 15, 2021 at 1:41 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jun 12, 2021 at 12:04 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Jun 11, 2021 at 2:16 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Fri, Jun 11, 2021 at 3:04 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Fri, Jun 11, 2021 at 4:49 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > >
> > > > > On Sat, May 15, 2021 at 12:34 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > > >
> > > > > > We implement various AIA local interrupt CSRs for M-mode, HS-mode,
> > > > > > and VS-mode.
> > > > > >
> > > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > > ---
> > > > > >  target/riscv/cpu.c        |   27 +-
> > > > > >  target/riscv/cpu.h        |   52 +-
> > > > > >  target/riscv/cpu_helper.c |  245 ++++++++-
> > > > > >  target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
> > > > > >  target/riscv/machine.c    |   26 +-
> > > > > >  5 files changed, 1309 insertions(+), 100 deletions(-)
> > > > >
> > > > > I feel this patch could be split up more :)
> > > >
> > > > This is patch is large because I did not want to break functionality.
> > > >
> > > > I try again to break this patch. At the moment, the best I can do is
> > > > to break in to two parts.
> > > > 1) AIA local interrupt CSRs without IMSIC
> > > > 2) Extend AIA local interrupt CSRs to support IMSIC register access
> > >
> > > As the patch is being added while AIA isn't enabled you are able to
> > > add the AIA in breaking stages. That is the AIA isn't fully
> > > functional, you still have to make sure not to break existing users.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > > index f3702111ae..795162834b 100644
> > > > > > --- a/target/riscv/cpu.c
> > > > > > +++ b/target/riscv/cpu.c
> > > > > > @@ -256,11 +256,11 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > > > > >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> > > > > >                       (target_ulong)env->vsstatus);
> > > > > >      }
> > > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
> > > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> > > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
> > > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mip     ", env->mip);
> > > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mie     ", env->mie);
> > > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mideleg ", env->mideleg);
> > > > > >      if (riscv_has_ext(env, RVH)) {
> > > > > > -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
> > > > > > +        qemu_fprintf(f, " %s %016" PRIx64 "\n", "hideleg ", env->hideleg);
> > > > > >      }
> > > > > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> > > > > >      if (riscv_has_ext(env, RVH)) {
> > > > > > @@ -345,6 +345,8 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
> > > > > >
> > > > > >  static void riscv_cpu_reset(DeviceState *dev)
> > > > > >  {
> > > > > > +    uint8_t iprio;
> > > > > > +    int i, irq, rdzero;
> > > > > >      CPUState *cs = CPU(dev);
> > > > > >      RISCVCPU *cpu = RISCV_CPU(cs);
> > > > > >      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> > > > > > @@ -357,6 +359,23 @@ static void riscv_cpu_reset(DeviceState *dev)
> > > > > >      env->mcause = 0;
> > > > > >      env->pc = env->resetvec;
> > > > > >      env->two_stage_lookup = false;
> > > > > > +
> > > > > > +    /* Initialized default priorities of local interrupts. */
> > > > > > +    for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
> > > > > > +        iprio = riscv_cpu_default_priority(i);
> > > > > > +        env->miprio[i] = iprio;
> > > > > > +        env->siprio[i] = iprio;
> > > > > > +        env->hviprio[i] = IPRIO_DEFAULT_MMAXIPRIO;
> > > > > > +    }
> > > > > > +    i = 0;
> > > > > > +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> > > > > > +        if (rdzero) {
> > > > > > +            env->hviprio[irq] = 0;
> > > > > > +        } else {
> > > > > > +            env->hviprio[irq] = env->miprio[irq];
> > > > > > +        }
> > > > > > +        i++;
> > > > > > +    }
> > > > > >  #endif
> > > > > >      cs->exception_index = EXCP_NONE;
> > > > > >      env->load_res = -1;
> > > > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > > > index f00c60c840..780d3f9058 100644
> > > > > > --- a/target/riscv/cpu.h
> > > > > > +++ b/target/riscv/cpu.h
> > > > > > @@ -157,12 +157,12 @@ struct CPURISCVState {
> > > > > >       */
> > > > > >      uint64_t mstatus;
> > > > > >
> > > > > > -    target_ulong mip;
> > > > > > +    uint64_t mip;
> > > > >
> > > > > This isn't right. MIP is a MXLEN-1 CSR. I didn't check but I assume
> > > > > all the other existing target_ulong CSRs are the same.
> > > >
> > > > When AIA is available the number of local interrupts are 64 for
> > > > both RV32 and RV64.
> > >
> > > Is that going to be reflected in the priv spec?
> >
> > The AIA spec is going to be separate from priv spec since
> > it is totally optional.
> >
> > This AIA local interrupt CSRs will be part of AIA spec and should
> > only be implemented if a RISC-V implementations wants to use
> > AIA.
> >
> > We have four types of changes as far as CSRs go:
> > 1) RV32 CSRs to support 64 local interrupts on RV32
>
> Hmmm... This isn't ideal. So implementations without AIA will have a
> Xlen MIP while implementations with AIA will have a 64-bit MIP?

That's an inherent limitation of the Priv spec.

>
> I guess we just don't expose all of MIP, so it isn't that bad. Still
> that change should be it's own patch with good justification as why we
> aren't following the priv spec.

The rationale with Priv spec allows implementations to support
32bit mode on RV64 HART so even RV64 HART running in
32bit mode can't use more than 32 local interrupts.

This means we have a hard limit of 32 local interrupts in the
Priv spec for both RV32 and RV64. The lower 13 interrupts
are already standardized by Priv spec but we need to support
good amount of per-HART local interrupts for future needs
hence the AIA spec mandates minimum 64 local interrupts.

Look at it this way, implementations which need future ready
local interrupt support will implement AIA style local interrupts
and implementations which don't can reduce hardware cost
by staying with only XLEN local interrupts.

The AIA style local interrupts are already approved by Andrew,
Greg, and other folks because everyone accepts the local interrupt
limitations of current Priv spec.

>
> > 2) Indirect CSRs to access local interrupt priorities
> > 3) Interrupt filtering CSRs
> > 4) IMSIC support CSRs
>
> New AIA CSRs are fine, it's just core changes that are more of a worry.

Backward compatibility is a key requirement for RISC-V AIA
and if you see this patch we keep the original Priv style
local interrupts as-is with minor improvements.

Regards,
Anup

>
> Alistair
>
> >
> > From above #3 is totally optional and not implemented by this
> > patch whereas #4 is only required when platform has RISC-V IMSIC.
> >
> > A platform can skip all four changes mentioned above, if the
> > platform only wants AIA APLIC to manage wired interrupts.
> >
> > Regards,
> > Anup

