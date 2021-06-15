Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt4Ap-0005mu-AT
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 04:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt4An-0005ib-8r; Tue, 15 Jun 2021 04:11:49 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt4Ak-0007bm-DF; Tue, 15 Jun 2021 04:11:49 -0400
Received: by mail-il1-x12f.google.com with SMTP id b9so14584248ilr.2;
 Tue, 15 Jun 2021 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqHmY/V7cz9+ORqZsz7TqCM6eDhlT6E9EA/UbGTZ14Q=;
 b=eMtTUejUL+IxmZ5nnX1E6xTFeIZ2a5gemgA7xOn8XbbO/G/ZuQealNA5Md/oL0KQ0U
 HHSKGY7N/znDw9wUcFFmGh4MLlfogLmQRdNR/pmMW2LNAmriN2mq6xGb0Mx04FhWVJ1x
 5iocK18Zci2pPi297Za1kXn4mgaPPruBT8pSXVv8oN6O2Y2yqd123/fseDWrjQEjE0Tq
 qRBzZ+cVX9wHlbnjxGg4NlgEnEpGdwb7oZQ0+C8vPIQbLtxcganT54fE/4v5liCl+lxl
 v5nAsOH9gG+ct88PGl6K9nMSJbtO8RL67JlDcKuZUBUD5yOCl+7LPVfqilpIjKI8gVSs
 wFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqHmY/V7cz9+ORqZsz7TqCM6eDhlT6E9EA/UbGTZ14Q=;
 b=uQUzcBgQD5g6fY0u6XYyDZHaDjvTCrIZp5WtJAIKtoJvjoPDAmWK87ogEZZaeAN1/h
 nXdvn18wmajvkp+RLmrExdJHPJ5mZ79E+SITS7sub8vQOcQuo8t0SCz8mrpSaYkYESuw
 iuG4AcC7I0OPbR3INYHjRv0d+MMtSBK2JV5f5IeB7WrUpvoxgOUbKMLA5MwQ0jn0WZXI
 YsVgZT/Pg26BY01OuJLxQbOLcNT4yKVCScuItTzyH/kbQG0nuvb9pcUOStHYj3hMvWp0
 8fWmx20B2K4ovjSUoT4VmeTEYqXja+ooNtyMtC+T5+sXVUzBbj+z6cHWDk/0+icpNahD
 Aeig==
X-Gm-Message-State: AOAM5337UlpJ8YoTdWWSYuDlg7a16vQZlE2zhT34r/AtaP7jgl7jPnJ1
 Bibopxp3a7mfV7eR26bIntE5Mtwju5lYLtAZHtI=
X-Google-Smtp-Source: ABdhPJzsjl2kkyuuNsxTy8f/BddVv4h6vx0hOa7S29TaJB7ivL2D8ukavVN7kQvQnrv5Y6rgpy0QFUYD0XkU4HkD6OY=
X-Received: by 2002:a92:c56d:: with SMTP id b13mr17089829ilj.267.1623744704927; 
 Tue, 15 Jun 2021 01:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-4-anup.patel@wdc.com>
 <CAKmqyKOcsF32oLtfyh511JCcrwgONK1qvjwK-dMYdPPZABYOOg@mail.gmail.com>
 <CAAhSdy1eWW6bw55O1pLHvopRVvM6DVb-kzvhTAjAoyvB0qt5bQ@mail.gmail.com>
 <CAKmqyKO_hEpGUNkH99rk2XNERHFN_iQTJEuHzGDsNerHXqna0Q@mail.gmail.com>
 <CAAhSdy0ifGW6QJC+esbx9+V7huOrAFigJsh5LsCHh7MofT721A@mail.gmail.com>
In-Reply-To: <CAAhSdy0ifGW6QJC+esbx9+V7huOrAFigJsh5LsCHh7MofT721A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 18:11:18 +1000
Message-ID: <CAKmqyKM12-P-2Hg+Ynopj_i6BX4s1xAj9SJ6JvUrSsTn_LPcag@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Implement AIA local interrupt CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 08:11:49 -0000

On Sat, Jun 12, 2021 at 12:04 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jun 11, 2021 at 2:16 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Jun 11, 2021 at 3:04 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Fri, Jun 11, 2021 at 4:49 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Sat, May 15, 2021 at 12:34 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > >
> > > > > We implement various AIA local interrupt CSRs for M-mode, HS-mode,
> > > > > and VS-mode.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  target/riscv/cpu.c        |   27 +-
> > > > >  target/riscv/cpu.h        |   52 +-
> > > > >  target/riscv/cpu_helper.c |  245 ++++++++-
> > > > >  target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
> > > > >  target/riscv/machine.c    |   26 +-
> > > > >  5 files changed, 1309 insertions(+), 100 deletions(-)
> > > >
> > > > I feel this patch could be split up more :)
> > >
> > > This is patch is large because I did not want to break functionality.
> > >
> > > I try again to break this patch. At the moment, the best I can do is
> > > to break in to two parts.
> > > 1) AIA local interrupt CSRs without IMSIC
> > > 2) Extend AIA local interrupt CSRs to support IMSIC register access
> >
> > As the patch is being added while AIA isn't enabled you are able to
> > add the AIA in breaking stages. That is the AIA isn't fully
> > functional, you still have to make sure not to break existing users.
> >
> > >
> > > >
> > > > >
> > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > index f3702111ae..795162834b 100644
> > > > > --- a/target/riscv/cpu.c
> > > > > +++ b/target/riscv/cpu.c
> > > > > @@ -256,11 +256,11 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > > > >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> > > > >                       (target_ulong)env->vsstatus);
> > > > >      }
> > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
> > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> > > > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
> > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mip     ", env->mip);
> > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mie     ", env->mie);
> > > > > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mideleg ", env->mideleg);
> > > > >      if (riscv_has_ext(env, RVH)) {
> > > > > -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
> > > > > +        qemu_fprintf(f, " %s %016" PRIx64 "\n", "hideleg ", env->hideleg);
> > > > >      }
> > > > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> > > > >      if (riscv_has_ext(env, RVH)) {
> > > > > @@ -345,6 +345,8 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
> > > > >
> > > > >  static void riscv_cpu_reset(DeviceState *dev)
> > > > >  {
> > > > > +    uint8_t iprio;
> > > > > +    int i, irq, rdzero;
> > > > >      CPUState *cs = CPU(dev);
> > > > >      RISCVCPU *cpu = RISCV_CPU(cs);
> > > > >      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> > > > > @@ -357,6 +359,23 @@ static void riscv_cpu_reset(DeviceState *dev)
> > > > >      env->mcause = 0;
> > > > >      env->pc = env->resetvec;
> > > > >      env->two_stage_lookup = false;
> > > > > +
> > > > > +    /* Initialized default priorities of local interrupts. */
> > > > > +    for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
> > > > > +        iprio = riscv_cpu_default_priority(i);
> > > > > +        env->miprio[i] = iprio;
> > > > > +        env->siprio[i] = iprio;
> > > > > +        env->hviprio[i] = IPRIO_DEFAULT_MMAXIPRIO;
> > > > > +    }
> > > > > +    i = 0;
> > > > > +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> > > > > +        if (rdzero) {
> > > > > +            env->hviprio[irq] = 0;
> > > > > +        } else {
> > > > > +            env->hviprio[irq] = env->miprio[irq];
> > > > > +        }
> > > > > +        i++;
> > > > > +    }
> > > > >  #endif
> > > > >      cs->exception_index = EXCP_NONE;
> > > > >      env->load_res = -1;
> > > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > > index f00c60c840..780d3f9058 100644
> > > > > --- a/target/riscv/cpu.h
> > > > > +++ b/target/riscv/cpu.h
> > > > > @@ -157,12 +157,12 @@ struct CPURISCVState {
> > > > >       */
> > > > >      uint64_t mstatus;
> > > > >
> > > > > -    target_ulong mip;
> > > > > +    uint64_t mip;
> > > >
> > > > This isn't right. MIP is a MXLEN-1 CSR. I didn't check but I assume
> > > > all the other existing target_ulong CSRs are the same.
> > >
> > > When AIA is available the number of local interrupts are 64 for
> > > both RV32 and RV64.
> >
> > Is that going to be reflected in the priv spec?
>
> The AIA spec is going to be separate from priv spec since
> it is totally optional.
>
> This AIA local interrupt CSRs will be part of AIA spec and should
> only be implemented if a RISC-V implementations wants to use
> AIA.
>
> We have four types of changes as far as CSRs go:
> 1) RV32 CSRs to support 64 local interrupts on RV32

Hmmm... This isn't ideal. So implementations without AIA will have a
Xlen MIP while implementations with AIA will have a 64-bit MIP?

I guess we just don't expose all of MIP, so it isn't that bad. Still
that change should be it's own patch with good justification as why we
aren't following the priv spec.

> 2) Indirect CSRs to access local interrupt priorities
> 3) Interrupt filtering CSRs
> 4) IMSIC support CSRs

New AIA CSRs are fine, it's just core changes that are more of a worry.

Alistair

>
> From above #3 is totally optional and not implemented by this
> patch whereas #4 is only required when platform has RISC-V IMSIC.
>
> A platform can skip all four changes mentioned above, if the
> platform only wants AIA APLIC to manage wired interrupts.
>
> Regards,
> Anup

