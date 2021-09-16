Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQwV3-00041X-WC
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 14:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwUv-0003yB-0q
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 14:52:43 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:41702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1mQwUs-0005Cu-VB
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 14:52:36 -0400
Received: by mail-qk1-x734.google.com with SMTP id bk29so9566680qkb.8
 for <qemu-riscv@nongnu.org>; Thu, 16 Sep 2021 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zn2PYiZVymQ+gwAk75LHSWUTGTPORBbTC/kfbYOgSiA=;
 b=pkZTHSTWy+JWt+lfIaeTQ0JTDaWKunDBm/1/kNzKwnTs5vMoB42GKmv/Oa35akHdcL
 1oRoIl7CTM7G+sd+Om8PtoDpWdX/OIXYBXftSFmDea78z7Sp6zWWWagXyKpIJkYWDeJ0
 6Zz7FSSMssv/HGFAR4kEgr1UXHcYztAdR0gf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zn2PYiZVymQ+gwAk75LHSWUTGTPORBbTC/kfbYOgSiA=;
 b=Fjv0pgGEGatQJmRUcNoLnJxw8AD48dnGfRQnvHhWSApA6AOeukg/uJ+qt82rZoWdgl
 48Em+7+CXX3yGEoLz8gZ1LzcbzBQSCHKN6gDnyY7/xJs8WT1EMAdY290gXMExZVS/tC+
 ADRua65egqk/tVjIY//IU7rlCSySr81sCN9i8KTFsJHavVARmpj2ywDxhBxfiJqcAIfp
 aKd7tO7XSyzHFo5TZfh7TlbMfu6p1Q4tws/GaR8/BhUwomkuNQ5iOr1DpI7BpmNBf55y
 kWeRJgzpeHqFlXCUY2ec1hH5d40OemZzDXq1QGEHc2xEzgs3IxcUu/nm2x0LzF2tvXm2
 dKuQ==
X-Gm-Message-State: AOAM532Wq6gr6tKvsfMWUlWV6rT59YMgnXqDQ7AR0iYl17zhlY4GfajE
 SKpkfIKVuZmEWKujXhzbBaMVnOtFVFNADB808bua
X-Google-Smtp-Source: ABdhPJy7knRgkyborMLg5fJL2Aq3+kVHocv42GkzT+i4HWhrZN2nBGLyCQxhtMFbXUeVY/gtHLsljLvlFHn1aEQW5UU=
X-Received: by 2002:a25:21c5:: with SMTP id h188mr8349218ybh.23.1631818353845; 
 Thu, 16 Sep 2021 11:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-4-atish.patra@wdc.com>
 <CAEUhbmWFhsFMge6O+P+5zu_F-i46F4axmspnPFOOUve681FnsA@mail.gmail.com>
In-Reply-To: <CAEUhbmWFhsFMge6O+P+5zu_F-i46F4axmspnPFOOUve681FnsA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Sep 2021 11:52:23 -0700
Message-ID: <CAOnJCU+q0T0TrG3JwFAaJnE-X6QUG2nnW4=GsUSE5srmQSc5mw@mail.gmail.com>
Subject: Re: [ RFC v2 3/9] target/riscv: pmu: Make number of counters
 configurable
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=atishp@atishpatra.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 16 Sep 2021 18:52:43 -0000

On Wed, Sep 15, 2021 at 7:51 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 10, 2021 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > The RISC-V privilege specification provides flexibility to implement
> > any number of counters from 29 programmable counters. However, the Qemu
>
> nits: %s/Qemu/QEMU
>
> > implements all the counters.
> >
> > Make it configurable through pmu config parameter which now will indicate
> > how many programmable counters should be implemented by the cpu.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/cpu.c |  2 +-
> >  target/riscv/cpu.h |  2 +-
> >  target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
> >  3 files changed, 65 insertions(+), 35 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7a486450ebc6..eba6050324a0 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -587,7 +587,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
> >      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> >      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> > -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> > +    DEFINE_PROP_UINT16("pmu", RISCVCPU, cfg.ext_pmu, 16),
>
> UINT8 should be enough. The name should better be changed to pmu-num
> (cfg.pmu_num).

ok. will change it.

>
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 5e67003e58a3..0e2e88f3bbea 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -293,9 +293,9 @@ struct RISCVCPU {
> >          bool ext_u;
> >          bool ext_h;
> >          bool ext_v;
> > -        bool ext_pmu;
> >          bool ext_ifencei;
> >          bool ext_icsr;
> > +        uint16_t ext_pmu;
> >
> >          char *priv_spec;
> >          char *user_spec;
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index c3ce7d83a6b2..fa014bac72ab 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -57,15 +57,45 @@ static RISCVException vs(CPURISCVState *env, int csrno)
> >      return RISCV_EXCP_ILLEGAL_INST;
> >  }
> >
> > +static RISCVException mctr(CPURISCVState *env, int csrno)
> > +{
> > +#if !defined(CONFIG_USER_ONLY)
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    int ctr_index;
> > +    int base_csrno = CSR_MHPMCOUNTER3;
> > +
> > +    if (riscv_cpu_is_32bit(env) && csrno >= CSR_MCYCLEH) {
> > +        /* Offset for RV32 hpmcounternh counters */
>
> should be mhpmcounternh

yeah.

>
> > +        base_csrno += 0x80;
> > +    }
> > +    ctr_index = csrno - base_csrno;
> > +    if (!cpu->cfg.ext_pmu || ctr_index > cpu->cfg.ext_pmu) {
>
> ctr_index >= cpu->cfg.ext_pmu

Yup.

>
> > +        /* The Counters extensions is not enabled or out of range*/
>
> PMU extension
>
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +#endif
> > +}
> > +
> >  static RISCVException ctr(CPURISCVState *env, int csrno)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> >      int ctr_index;
> > +    int base_csrno = CSR_CYCLE;
> > +    bool brv32 = riscv_cpu_is_32bit(env);
> > +
> > +    if (brv32 && csrno >= CSR_CYCLEH) {
> > +        /* Offset for RV32 hpmcounternh counters */
> > +        base_csrno += 0x80;
> > +    }
> > +    ctr_index = csrno - base_csrno;
> >
> > -    if (!cpu->cfg.ext_pmu) {
> > -        /* The Counters extensions is not enabled */
> > +    if (!cpu->cfg.ext_pmu || ctr_index > (cpu->cfg.ext_pmu + 3)) {
>
> ctr_index >=
>
> > +        /* The Counters extensions is not enabled or out of range */
>
> PMU extension

Thanks. I will address all these in v3.

>
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > @@ -93,7 +123,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >              }
> >              break;
> >          }
> > -        if (riscv_cpu_is_32bit(env)) {
> > +        if (brv32) {
> >              switch (csrno) {
> >              case CSR_CYCLEH:
> >                  if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> > @@ -148,7 +178,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >              }
> >              break;
> >          }
> > -        if (riscv_cpu_is_32bit(env)) {
> > +        if (brv32) {
> >              switch (csrno) {
> >              case CSR_CYCLEH:
> >                  if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> > @@ -1721,35 +1751,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
> >      [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
> >
> > -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
> > -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
> > -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
> > +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> > +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
> >
> >      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
> >      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> > --
>
> Regards,
> Bin
>


-- 
Regards,
Atish

