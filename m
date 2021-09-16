Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQwQG-0007dX-QE
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 14:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwQD-0007Xc-EY
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 14:47:45 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwQ9-0000u0-B3
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 14:47:45 -0400
Received: by mail-qk1-x72f.google.com with SMTP id m21so9488163qkm.13
 for <qemu-riscv@nongnu.org>; Thu, 16 Sep 2021 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fw0ckO/c4YoOZkh9qK9ECXyTrA103RGu0ONUbSGPmoI=;
 b=I3FakBEJR9Fvobh3mgNPHpGR6Li7qgqH3iW7yjo6metqXMKyYQ5TRbQeuJ2ttOVtGK
 dPVQbmhb7OCVw9dS5isfG5c5Nzb3nYD5EfHdgQWT2IaS/EqOGNR2CrL6eK/M/zKm/YHT
 h0Ai/rDQzUJXbKw/fOF2A5H2CsrJQAYiijMgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fw0ckO/c4YoOZkh9qK9ECXyTrA103RGu0ONUbSGPmoI=;
 b=gvhCiOgISeXq5Ai5VHClig5RIyI28MD0IsP8u8Doc93vvF8HC8WSKNkoF4eAqFR/V8
 IqRQEIKfp4axWpq0FcCziJt/Re4BkbNb1fUmYnMqBmy+2bvAi2h9Y8nI3/Rhq+y65X8K
 R+xbLGVF1hkAnUQc5L3AZbPZPtG8H/p/ulbQu3Wn68ftU/9ZrAoKvSct9INHZAWrWhkp
 JYO1SA50GjIKjDDAUth/TlyT/lDxNHrFlpDpUkMJ2TNe8+ynC4hk6eIMQWrLRJKGmQv8
 oRRPyK8Fo7KXDZ5gK3TozXjF3TuMn6ijQW2ZFPHgCBx4yTfa48dH86B91AKMix15WpKA
 SzGQ==
X-Gm-Message-State: AOAM530aqpmTfNuelL+kBWlhX83TpGHMEIHv+ETiudmCb0f3kCnHA0Wp
 21l14BSSfOEc3A4StD4wFf76sCA3nZ2wQcQUb8hVdfcTtM9C
X-Google-Smtp-Source: ABdhPJzrCElJ1rHZTp5ZIqI20GptFU61Wq0X8OuNEYX5whAZIgao9q7uKGz19iQAXikO5iLmhEoiiA+kRupkz7dIzOA=
X-Received: by 2002:a25:44d:: with SMTP id 74mr9743173ybe.54.1631818060068;
 Thu, 16 Sep 2021 11:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-5-atish.patra@wdc.com>
 <CAEUhbmUgEaxsT+FmkJ6E_A2mQASh8GwBsAD7=214snZsSjOXNg@mail.gmail.com>
In-Reply-To: <CAEUhbmUgEaxsT+FmkJ6E_A2mQASh8GwBsAD7=214snZsSjOXNg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Sep 2021 11:47:29 -0700
Message-ID: <CAOnJCUKJY2JApp=x6Ume8DfB+H+BQxDOveR5YZX7Q7jAtNrL2g@mail.gmail.com>
Subject: Re: [ RFC v2 4/9] target/riscv: Implement mcountinhibit CSR
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=atishp@atishpatra.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Sep 2021 18:47:45 -0000

On Wed, Sep 15, 2021 at 7:54 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 10, 2021 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > As per the privilege specification v1.11, mcountinhibit allows to start/stop
> > a pmu counter selectively.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/cpu.h      |  2 ++
> >  target/riscv/cpu_bits.h |  4 ++++
> >  target/riscv/csr.c      | 25 +++++++++++++++++++++++++
> >  target/riscv/machine.c  |  5 +++--
> >  4 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0e2e88f3bbea..bdb488cdbccc 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -219,6 +219,8 @@ struct CPURISCVState {
> >      target_ulong scounteren;
> >      target_ulong mcounteren;
> >
> > +    target_ulong mcountinhibit;
> > +
> >      target_ulong sscratch;
> >      target_ulong mscratch;
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 7330ff5a194c..ac519dcdc4df 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -275,6 +275,10 @@
> >  #define CSR_MHPMCOUNTER29   0xb1d
> >  #define CSR_MHPMCOUNTER30   0xb1e
> >  #define CSR_MHPMCOUNTER31   0xb1f
> > +
> > +/* Machine counter-inhibit register */
> > +#define CSR_MCOUNTINHIBIT   0x320
> > +
> >  #define CSR_MHPMEVENT3      0x323
> >  #define CSR_MHPMEVENT4      0x324
> >  #define CSR_MHPMEVENT5      0x325
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index fa014bac72ab..a155a4370d6b 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
> > +                                         target_ulong *val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
>
> This should be RISCV_EXCP_ILLEGAL_INST
>

Argh. Not sure how this happen :(. My bad.

> > +    }
> > +
> > +    *val = env->mcountinhibit;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
> > +                                          target_ulong val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
>
> ditto
>
> > +    }
> > +
> > +    env->mcountinhibit = val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
> >                                        target_ulong *val)
> >  {
> > @@ -1781,6 +1803,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> >      [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
> >
> > +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
>
> missing 't' in the register name

Thanks. Will fix it in the next version.

>
> > +                                                       write_mcountinhibit },
> > +
> >      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
> >      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> >      [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 16a08302daff..20dea0843604 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
> >
> >  const VMStateDescription vmstate_riscv_cpu = {
> >      .name = "cpu",
> > -    .version_id = 2,
> > -    .minimum_version_id = 2,
> > +    .version_id = 3,
> > +    .minimum_version_id = 3,
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> > @@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          VMSTATE_UINTTL(env.mtval, RISCVCPU),
> >          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> > +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> >          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > --
>
> Regards,
> Bin
>


-- 
Regards,
Atish

