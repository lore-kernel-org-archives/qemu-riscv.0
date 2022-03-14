Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nThFX-00021e-3L
	for mharc-qemu-riscv@gnu.org; Mon, 14 Mar 2022 05:44:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nThFT-0001wo-PG; Mon, 14 Mar 2022 05:44:19 -0400
Received: from [2607:f8b0:4864:20::b31] (port=41741
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nThFR-0001W2-Ur; Mon, 14 Mar 2022 05:44:19 -0400
Received: by mail-yb1-xb31.google.com with SMTP id l2so29511946ybe.8;
 Mon, 14 Mar 2022 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRkBfxRh6rcS1E4aT62MAY87PcXygtZnejM1OB/pFyA=;
 b=Axojaemkl49PZZWvmep9oB4PQqbaJj/dVlHccuIXbDSVjpHaMGhYWom5tr2OlrjFaA
 MG+6W57ZJN0i1N6939gQjFkaDiJiFDAQOUnabULLcK5wWAx9JQ9791h1o7KJElxW9K2n
 tLYj6vuRNSUaVv/t6Our7r5uofVN9ZMB/4R6HxUejRAiFJqF5gLp4BfeYbhcQtaL7Fnh
 Vpxb8WYz8Uet1AsCNPrryLsSeFhWtaOmTVJh1pspDt2Z0n/RSQokwQZJJSiyW1vpA6fe
 yFJFl0fgjAfU+g2bs6kdxC6LMQmjx2owg/I/L+txQH4WIz2TBB9u5ItMztphcl4rYryR
 Dxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRkBfxRh6rcS1E4aT62MAY87PcXygtZnejM1OB/pFyA=;
 b=OMuNKbR6FJrV5Grt3BdLx93sy5fxQpfKjs99rK2te0a0OhrDUgLvw5GbWCXLbKlr0v
 tpzh2o/alp+g/If+VWnRqBD0vkk/E/W0YFk6+oilw872JL9RbhUvO5oaEYFfm5HPpZw9
 idZ09Sk5HyKyE/iseQIGaGafnpwAytgWgnXf9WomKe5d4N0RF6IaGrFlk4OGXgMAwhAz
 Ls1RsznhVpVbT9pPYDaA/QbPXLqueJnsVoEISgNuRh0nMnoa2x8ZH0rdkGpW5NXd3rAx
 cS+CVa0jdyXFVg0xo+Ph/BbKw/oFh0oroL4kwx+VtSzMhbFg/JoQ1DY9y0INxHInDNzq
 AL8w==
X-Gm-Message-State: AOAM532LvKv1XtX1g/7PztnvPhIQkq27TnojONctBw/HW8QhiVqmk4Aw
 vLp+5gPMiQt2Ao1puRQG7JzKxHZOEnF3heXOjgA=
X-Google-Smtp-Source: ABdhPJxPsLKtWwAaoXj0zaiZCg8I9nT+4EAqgADF7eXh1a72dxlrP3GHlq5D5lj1E0ZRLyhjxoPL73Obau8k6k8u1KU=
X-Received: by 2002:a25:d2c9:0:b0:62c:1233:a5a5 with SMTP id
 j192-20020a25d2c9000000b0062c1233a5a5mr16836265ybg.643.1647251055823; Mon, 14
 Mar 2022 02:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
 <20220105030844.780642-6-bmeng.cn@gmail.com>
 <CAKmqyKMA-s-1=mhAO3ODMUK00aNJkw5u2H2oOGbjbd9ODKw5=w@mail.gmail.com>
In-Reply-To: <CAKmqyKMA-s-1=mhAO3ODMUK00aNJkw5u2H2oOGbjbd9ODKw5=w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Mar 2022 17:44:04 +0800
Message-ID: <CAEUhbmWnzoHSrRKvLBS-zzczwCd_D5maXQP+A9_0QAdnWOWepw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 5/7] target/riscv: csr: Hook debug CSR read/write
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 14 Mar 2022 09:44:21 -0000

On Wed, Jan 19, 2022 at 11:06 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jan 5, 2022 at 1:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds debug CSR read/write support to the RISC-V CSR RW table.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v3:
> > - add riscv_trigger_init(), moved from patch #1 to this patch
> >
> >  target/riscv/debug.h |  2 ++
> >  target/riscv/cpu.c   |  6 +++++
> >  target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/debug.c | 27 +++++++++++++++++++++
> >  4 files changed, 92 insertions(+)
> >
> > diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> > index d0f63e2414..f4da2db35d 100644
> > --- a/target/riscv/debug.h
> > +++ b/target/riscv/debug.h
> > @@ -109,4 +109,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
> >  bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
> >  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
> >
> > +void riscv_trigger_init(CPURISCVState *env);
> > +
> >  #endif /* RISCV_DEBUG_H */
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d36c31ce9a..17dcc3c14f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -575,6 +575,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >
> >      riscv_cpu_register_gdb_regs_for_features(cs);
> >
> > +#ifndef CONFIG_USER_ONLY
> > +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> > +        riscv_trigger_init(env);
> > +    }
> > +#endif
> > +
> >      qemu_init_vcpu(cs);
> >      cpu_reset(cs);
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 146447eac5..189b9cc8c6 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -220,6 +220,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
> >
> >      return RISCV_EXCP_ILLEGAL_INST;
> >  }
> > +
> > +static RISCVException debug(CPURISCVState *env, int csrno)
> > +{
> > +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    return RISCV_EXCP_ILLEGAL_INST;
> > +}
> >  #endif
> >
> >  /* User Floating-Point CSRs */
> > @@ -1464,6 +1473,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException read_tselect(CPURISCVState *env, int csrno,
> > +                                   target_ulong *val)
> > +{
> > +    *val = tselect_csr_read(env);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_tselect(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    tselect_csr_write(env, val);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_tdata(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    /* return 0 in tdata1 to end the trigger enumeration */
> > +    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
> > +        *val = 0;
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    *val = tdata_csr_read(env, csrno - CSR_TDATA1);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_tdata(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    tdata_csr_write(env, csrno - CSR_TDATA1, val);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  /*
> >   * Functions to access Pointer Masking feature registers
> >   * We have to check if current priv lvl could modify
> > @@ -1962,6 +2013,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
> >      [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
> >
> > +    /* Debug CSRs */
> > +    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
> > +    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
> > +    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
> > +    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
> > +
> >      /* User Pointer Masking */
> >      [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
> >      [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> > diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> > index 7760c4611f..041a0d3a89 100644
> > --- a/target/riscv/debug.c
> > +++ b/target/riscv/debug.c
> > @@ -412,3 +412,30 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
> >
> >      return false;
> >  }
> > +
> > +void riscv_trigger_init(CPURISCVState *env)
> > +{
> > +    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
> > +    int i;
> > +
> > +    /* type 2 triggers */
> > +    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> > +        /*
> > +         * type = TRIGGER_TYPE_AD_MATCH
> > +         * dmode = 0 (both debug and M-mode can write tdata)
> > +         * maskmax = 0 (unimplemented, always 0)
> > +         * sizehi = 0 (match against any size, RV64 only)
> > +         * hit = 0 (unimplemented, always 0)
> > +         * select = 0 (always 0, perform match on address)
> > +         * timing = 0 (always 0, trigger before instruction)
> > +         * sizelo = 0 (match against any size)
> > +         * action = 0 (always 0, raise a breakpoint exception)
> > +         * chain = 0 (unimplemented, always 0)
> > +         * match = 0 (always 0, when any compare value equals tdata2)
> > +         */
> > +        env->trigger_type2[i].mcontrol = type2;
> > +        env->trigger_type2[i].maddress = 0;
> > +        env->trigger_type2[i].bp = NULL;
> > +        env->trigger_type2[i].wp = NULL;
> > +    }
>
> Should this be called at reset instead?

Yes, I think so.

Regards,
Bin

