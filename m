Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJRfO-0001Ze-CA
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 23:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRfM-0001Vh-QB
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 23:36:56 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRf7-0003oq-JQ
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 23:36:56 -0400
Received: by mail-oi1-x22d.google.com with SMTP id p132so21971179oif.9
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=rAWXgRc2+e9qIo1+Fyc0fTo7xHKEo5HcJ9GwmQuJq3k=;
 b=DXV5RH6xepQf7Iita8ag0PaH8c56NuVNu2YJK9C4NhLpZdNyrbzsLvVWJ2RsHo7Kn5
 WwYskJ0HsjoJ4Lew5EwuiPzW5TnBdrzEMm/AemO3SJml//lRVIMMF2TPgTzUn41SMPsU
 SBgZGJ63ZgtgNy1quuHTArYPpKSr2a1C3JXFox7h1FjjS2aro66JTkRqJpDMTS9rj5zA
 xquNJkNvETQ5LwIgySESoLbgnvLRR6f5zjE/6SbbLIhKg5yiBg+vevhj/mNecvKiS2kv
 iVE8CT+OOmBhdkg77KOf6IIk1bfSqdaV4alkho0f4MM5SckC2IH1Fwsk9w+XgohF0BSB
 snfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=rAWXgRc2+e9qIo1+Fyc0fTo7xHKEo5HcJ9GwmQuJq3k=;
 b=eSnSKkxA8ofDkmlg+SA9HYa257kOgqg0Np81M3tc4eRQGiS4ABjAbE66DbpTyOsiWj
 BCRDMXHfVK3V3vHWvVyEfF+584WSsSJG6cBqm/PRscGg+X5mg9X8ETDxglm0d0541Pla
 BXILYfXamLEyvluJIwmKsRHlguO9f2s43AvICibWJW2DMgpaLm33kA9ogkTG/99bUBHX
 Sduj2rKvDCCJsnLYt3YjUvjf+p7VpMB0bGqGjOncRABQE6LMETf2C/+GefHt5xrm8SiY
 SPHLEHr4fn0WI/jMAtY3atWZPcXOWeCj2TnPO2wyXgpxISuMj7i/r2gZ1agR6DkZHi6a
 JOQQ==
X-Gm-Message-State: ACgBeo3pvd5EglhI/Qkkyta4q+bJtPDIxkEnVpUpo4D+m5OM7SghEHIS
 3bkchesP2ycdROIkpQjBS/72YA==
X-Google-Smtp-Source: AA6agR75KWuWWw8VfQMhgzg4E3ekNES04P17UEMkaj3Roe60yoIjm1Iw/jkZqSNTAnVfxvf0y18AFA==
X-Received: by 2002:a05:6808:e8a:b0:337:9846:931a with SMTP id
 k10-20020a0568080e8a00b003379846931amr3059716oil.215.1659584199374; 
 Wed, 03 Aug 2022 20:36:39 -0700 (PDT)
Received: from [192.168.1.18] ([182.70.65.172])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a0568301e4d00b0061c7f73611asm4285428otj.60.2022.08.03.20.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 20:36:38 -0700 (PDT)
Message-ID: <a837e4ca551bd1c2632801361c4e8eea2270f193.camel@ventanamicro.com>
Subject: Re: [PATCH v7 2/4] target/riscv: smstateen check for h/senvcfg
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Thu, 04 Aug 2022 09:06:32 +0530
In-Reply-To: <3e1bc732-caef-7a46-eaa8-933e4d92f07d@iscas.ac.cn>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
 <20220801171843.72986-3-mchitale@ventanamicro.com>
 <3e1bc732-caef-7a46-eaa8-933e4d92f07d@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 Aug 2022 03:36:57 -0000

On Wed, 2022-08-03 at 16:24 +0800, Weiwei Li wrote:
> 在 2022/8/2 上午1:18, Mayuresh Chitale 写道:
> > Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
> > corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
> > illegal instruction trap is generated.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   roms/opensbi       |  2 +-
> >   target/riscv/csr.c | 83
> > ++++++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 77 insertions(+), 8 deletions(-)
> > 
> > diff --git a/roms/opensbi b/roms/opensbi
> > index 4489876e93..48f91ee9c9 160000
> > --- a/roms/opensbi
> > +++ b/roms/opensbi
> > @@ -1 +1 @@
> > -Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
> > +Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index ad1642fb9b..011d6c5976 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -40,6 +40,38 @@ void riscv_set_csr_ops(int csrno,
> > riscv_csr_operations *ops)
> >   }
> >   
> >   /* Predicates */
> > +#if !defined(CONFIG_USER_ONLY)
> > +static RISCVException smstateen_acc_ok(CPURISCVState *env, int
> > index,
> > +                                       uint64_t bit)
> > +{
> > +    bool virt = riscv_cpu_virt_enabled(env);
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!(env->mstateen[index] & bit)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (virt) {
> > +        if (!(env->hstateen[index] & bit)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +    }
> > +
> > +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> > +        if (!(env->sstateen[index] & bit)) {
> > +            return RISCV_EXCP_ILLEGAL_INST;
> > +        }
> 
> VU mode seems not be taken into consideration. For VU mode, the 
> exception will be
> 
> RISCV_EXCP_VIRT_INSTRUCTION_FAULT instead if "!(env->sstateen[index]
> & bit)" here.
Ok. I will fix it in the next version.
> 
> 
> Regards,
> 
> Weiwei Li
> 
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +#endif
> > +
> >   static RISCVException fs(CPURISCVState *env, int csrno)
> >   {
> >   #if !defined(CONFIG_USER_ONLY)
> > @@ -1715,6 +1747,13 @@ static RISCVException
> > write_menvcfgh(CPURISCVState *env, int csrno,
> >   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->senvcfg;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1723,15 +1762,27 @@ static RISCVException
> > write_senvcfg(CPURISCVState *env, int csrno,
> >                                     target_ulong val)
> >   {
> >       uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
> > SENVCFG_CBZE;
> > +    RISCVException ret;
> >   
> > -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> > +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> >       return RISCV_EXCP_NONE;
> >   }
> >   
> >   static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->henvcfg;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1740,6 +1791,12 @@ static RISCVException
> > write_henvcfg(CPURISCVState *env, int csrno,
> >                                     target_ulong val)
> >   {
> >       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
> > HENVCFG_CBZE;
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> >       if (riscv_cpu_mxl(env) == MXL_RV64) {
> >           mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> > @@ -1753,6 +1810,13 @@ static RISCVException
> > write_henvcfg(CPURISCVState *env, int csrno,
> >   static RISCVException read_henvcfgh(CPURISCVState *env, int
> > csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->henvcfg >> 32;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1762,9 +1826,14 @@ static RISCVException
> > write_henvcfgh(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> >       uint64_t valh = (uint64_t)val << 32;
> > +    RISCVException ret;
> >   
> > -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> > +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> >       return RISCV_EXCP_NONE;
> >   }
> >   
> > @@ -1796,7 +1865,7 @@ static RISCVException
> > write_mstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_mstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1843,7 +1912,7 @@ static RISCVException
> > write_mstateenh(CPURISCVState *env, int csrno,
> >   static RISCVException write_mstateen0h(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1892,7 +1961,7 @@ static RISCVException
> > write_hstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_hstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1943,7 +2012,7 @@ static RISCVException
> > write_hstateenh(CPURISCVState *env, int csrno,
> >   static RISCVException write_hstateen0h(CPURISCVState *env, int
> > csrno,
> >                                          target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> > @@ -2002,7 +2071,7 @@ static RISCVException
> > write_sstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_sstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_sstateen(env, csrno, wr_mask, new_val);
> >   }


