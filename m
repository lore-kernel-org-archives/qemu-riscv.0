Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1jQG-0007Ak-UK
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 02:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jQE-00077z-7d; Thu, 16 Jun 2022 02:56:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jQC-0001rS-Di; Thu, 16 Jun 2022 02:56:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id i15so577436plr.1;
 Wed, 15 Jun 2022 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Slbt7lM4XIe7271hWE5kzIbPrl7OlhNGSV2B6PuTAkU=;
 b=QoBsxMrfghG5IgZnJqNn8Y6sV6OGiF7rBPXpfteyI24555JZkTjPcVib11oCYDm2qn
 JzmRR6KbH0hREk3A2027OzWonUt1ZT23Bgum188CCseXKvuB4AcQk8eQncYVR0BmfE0m
 XFu/m7untHZ4S8qQveFrjwTaaUxpV4RXUe13Yc0StSQlYtS4QqAclY6J7+HX8qeasIZn
 CNMsf55xSqdWFgRWgCtrOFlnTSAxGZx01M/f0zbCDZ/q59V97oB+WRcgX4B7gsap+MnG
 P1tbksj1946q6X33Hpz4QdGumwrSnQ4yY6prFLUHqMKcw7mboDMg6TRWwIqIjn8SvJEw
 /xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Slbt7lM4XIe7271hWE5kzIbPrl7OlhNGSV2B6PuTAkU=;
 b=YJyewXXIbf6LVCsBiC+Akvelby1Ttyy4klP+BTz2eXx+I13A5hnNDRzd7wzH9JiVow
 XsZHjLqDpPWBkBI+0QZf72YDY5mKrkm7g9tHsKx/iEf+a48MGNjwiQ2COUIWNeQsytm3
 +BonqD1vJHZqIBTNWFJLPhnR+CsFbC438XF88tB7rFXEbKYEhG5WkvMyS7AJHtjtONpU
 qD5gsbXaOnp1FunmmSciraP2Iv2N4zwZabqhgUyHkmnPdUqTlRcTpU3Y+ArrUvT5Avp0
 893UGD9l7XCIIGxIYWX4JEc5Yg/iBVBBnorvaQzdeivsiej1fuB4/AIBIsdnFO680SVM
 6gQw==
X-Gm-Message-State: AJIora+UU23peGvC0R0YMPd5/WXyBHlRh56cNbD6Bef1UXya7tuC9oIw
 AV+XMjIm1iKdTgMxOaHT3UD2oKigZllFQ3IUIME=
X-Google-Smtp-Source: AGRyM1tHELZ6JAkLIsbXstzYvrq6u+LedEdn7+dNo1UFAkd1vmuooQ9ducqYRLU8iqqoHqaIh7MHGEWWh5HJdSSPYdQ=
X-Received: by 2002:a17:902:d18c:b0:167:82d5:4710 with SMTP id
 m12-20020a170902d18c00b0016782d54710mr3288898plb.25.1655362562619; Wed, 15
 Jun 2022 23:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-3-mchitale@ventanamicro.com>
 <CAKmqyKNTKgSfLdZp4QSATi8mdmfV4YQ_n_+_6DPaMDQbAWRHMg@mail.gmail.com>
In-Reply-To: <CAKmqyKNTKgSfLdZp4QSATi8mdmfV4YQ_n_+_6DPaMDQbAWRHMg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 16:55:35 +1000
Message-ID: <CAKmqyKPywVPrnLLJ=pqBnYonHdSU5-JcoUtQntLOQ+aaJm4Q9w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jun 2022 06:56:06 -0000

On Thu, Jun 16, 2022 at 4:54 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jun 4, 2022 at 2:16 AM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> >
> > Accesses to henvcfg, henvcfgh and senvcfg are allowed
> > only if corresponding bit in mstateen0/hstateen0 is
> > enabled. Otherwise an illegal instruction trap is
> > generated.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 78 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 324fefce59..ae91ae1f7e 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
> >  }
> >
> >  /* Predicates */
> > +static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    bool virt = riscv_cpu_virt_enabled(env);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +#if !defined(CONFIG_USER_ONLY)
> > +    if (!(env->mstateen[0] & 1UL << bit)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (virt) {
> > +        if (!(env->hstateen[0] & 1UL << bit)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +    }
> > +
> > +    if (mode == PRV_U) {
> > +        if (!(env->sstateen[0] & 1UL << bit)) {
> > +            return RISCV_EXCP_ILLEGAL_INST;
> > +        }
> > +    }
> > +#endif
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException fs(CPURISCVState *env, int csrno)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > @@ -1557,6 +1588,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> >  static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>
> Couldn't this be part of the original permission check so we don't
> need a second check?

Whoops, misread the function. Ignore that

Alistair

>
> Alistair
>
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      *val = env->senvcfg;
> >      return RISCV_EXCP_NONE;
> >  }
> > @@ -1565,15 +1603,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong val)
> >  {
> >      uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> > +    RISCVException ret;
> >
> > -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >
> > +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> >      return RISCV_EXCP_NONE;
> >  }
> >
> >  static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      *val = env->henvcfg;
> >      return RISCV_EXCP_NONE;
> >  }
> > @@ -1582,6 +1632,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong val)
> >  {
> >      uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >
> >      if (riscv_cpu_mxl(env) == MXL_RV64) {
> >          mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> > @@ -1595,6 +1651,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> >  static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >      *val = env->henvcfg >> 32;
> >      return RISCV_EXCP_NONE;
> >  }
> > @@ -1604,9 +1667,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> >  {
> >      uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> >      uint64_t valh = (uint64_t)val << 32;
> > +    RISCVException ret;
> >
> > -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> > +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >
> > +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > @@ -1628,7 +1696,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
> >                                       target_ulong new_val)
> >  {
> >      uint64_t *reg;
> > -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> > +                       (1UL << SMSTATEEN0_HSENVCFG);
> >
> >      reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> >      write_smstateen(env, reg, wr_mask, new_val);
> > @@ -1649,7 +1718,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
> >  {
> >      uint64_t *reg;
> >      uint64_t val;
> > -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> > +                       (1UL << SMSTATEEN0_HSENVCFG);
> >
> >      reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> >      val = (uint64_t)new_val << 32;
> > @@ -1671,7 +1741,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
> >                                       target_ulong new_val)
> >  {
> >      uint64_t *reg;
> > -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> > +                       (1UL << SMSTATEEN0_HSENVCFG);
> >      int index = csrno - CSR_HSTATEEN0;
> >
> >      reg = &env->hstateen[index];
> > @@ -1694,8 +1765,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
> >  {
> >      uint64_t *reg;
> >      uint64_t val;
> > -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >      int index = csrno - CSR_HSTATEEN0H;
> > +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> > +                       (1UL << SMSTATEEN0_HSENVCFG);
> >
> >      reg = &env->hstateen[index];
> >      val = (uint64_t)new_val << 32;
> > --
> > 2.25.1
> >
> >

