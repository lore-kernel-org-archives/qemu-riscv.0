Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGwoV-0007r1-29
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jul 2022 02:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGwoM-0007mN-Ku
 for qemu-riscv@nongnu.org; Thu, 28 Jul 2022 02:15:59 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGwoK-0001Lo-EU
 for qemu-riscv@nongnu.org; Thu, 28 Jul 2022 02:15:54 -0400
Received: by mail-pg1-x535.google.com with SMTP id h132so748976pgc.10
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 23:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=y+/CyGndx4zb9OmyEuZ7VbJIwOxTwcM6U9V/usfNHyc=;
 b=hAECxBItV+U8mAkOmD+teAO2+AmoHl4EbYVbTQz7uZvtdmaAqxAat8s9JlO9VWtngo
 aMvanhhseq4l+WluKNvPXMh9xqApe8+JWPHs3NgAQo2feJXvqWXdZmg0grV6t3aEMRMV
 xe65KQE0vCBhVCcq4Adhgk2AEQrGHX3+vk5z9/DJb9jU5eZsUEgnJMZk+xQHl1OPQBjM
 X2e/EN2ozte9+BW80Q4Dhm7QRsjRsbNbYQIfmlSyJE9r9+y8X2mz26Tg+utl+W6pJApS
 rNECHOUtj9D61G6ly3F49Q0Rt/HheM6uzkxjaph3ixC42Bf15ic53A5HZbVGU9Vk71R3
 6c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=y+/CyGndx4zb9OmyEuZ7VbJIwOxTwcM6U9V/usfNHyc=;
 b=tMiqBJITG2ajnzDmc0UnQ3cZx9Z90cB0p9pD1UmaicGM6Gns+MyFyPdyJ0kAxuL/6M
 yNhKVxqrT4hCtcnZfQWe0A+eQgmO92HqxdJo+NDFG4quuH6/igap5Tt+iFYWXQ5eUhzr
 2RtSJCvUfZBXqiA6KOtZAgshoSMw0A3hUoajcZFJbdk89VJL8kmpwc5QQ9B2OGRflu7Q
 H6zC80gRqrNQzC2F5t3KcjLDgg45FeM24i7hJD0yYCTKwn5vq5WPoxLCjFltCu2zVej6
 oV5F3wB9kN4XfZURaet8D5ndSRPG/HtfhRfmejdCHmO6daLUEiJKJhGyVp1+uScfJlEr
 EkGg==
X-Gm-Message-State: AJIora9RSc7wLGdtfXWtV5H2CEMlO+dXlBzzo0EBS64i4mE5sZyG4f+l
 WopKs1fs+Qmgp/BhlSSddVQnCA==
X-Google-Smtp-Source: AGRyM1vOTL4Odcb6qbrTQ6SW6V1iBxeWZUJ66lw97XAlf+T6wwytGVUTsVE7sm2vsV0Ca4fiL+lBJg==
X-Received: by 2002:a63:8142:0:b0:419:a843:1720 with SMTP id
 t63-20020a638142000000b00419a8431720mr21974071pgd.317.1658988951027; 
 Wed, 27 Jul 2022 23:15:51 -0700 (PDT)
Received: from [192.168.1.18] ([171.50.205.214])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a17090a550c00b001f2fbf2c42esm101361pji.26.2022.07.27.23.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:15:50 -0700 (PDT)
Message-ID: <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Thu, 28 Jul 2022 11:45:42 +0530
In-Reply-To: <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
 <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
 <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 28 Jul 2022 06:16:00 -0000

On Mon, 2022-07-25 at 15:23 +0800, Weiwei Li wrote:
> 
> 在 2022/7/24 下午11:49, Mayuresh Chitale 写道:
> > On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
> > > 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> > > > If smstateen is implemented and sstateen0.fcsr is clear then
> > > > the
> > > > floating point operations must return illegal instruction
> > > > exception.
> > > > 
> > > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > > ---
> > > >   target/riscv/csr.c                        | 23 ++++++++++++++
> > > >   target/riscv/insn_trans/trans_rvf.c.inc   | 38
> > > > +++++++++++++++++++++--
> > > >   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
> > > >   3 files changed, 63 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > index ab06b117f9..a597b6cbc7 100644
> > > > --- a/target/riscv/csr.c
> > > > +++ b/target/riscv/csr.c
> > > > @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env,
> > > > int
> > > > csrno)
> > > >           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> > > >           return RISCV_EXCP_ILLEGAL_INST;
> > > >       }
> > > > +
> > > > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > > > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > > > +    }
> > > >   #endif
> > > >       return RISCV_EXCP_NONE;
> > > >   }
> > > > @@ -1876,6 +1880,9 @@ static RISCVException
> > > > write_mstateen0(CPURISCVState *env, int csrno,
> > > >                                         target_ulong new_val)
> > > >   {
> > > >       uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > SMSTATEEN0_HSENVCFG;
> > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > +    }
> > > >   
> > > >       return write_mstateen(env, csrno, wr_mask, new_val);
> > > >   }
> > > > @@ -1924,6 +1931,10 @@ static RISCVException
> > > > write_mstateen0h(CPURISCVState *env, int csrno,
> > > >   {
> > > >       uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > SMSTATEEN0_HSENVCFG;
> > > >   
> > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > +    }
> > > > +
> > > >       return write_mstateenh(env, csrno, wr_mask, new_val);
> > > >   }
> > > >   
> > > > @@ -1973,6 +1984,10 @@ static RISCVException
> > > > write_hstateen0(CPURISCVState *env, int csrno,
> > > >   {
> > > >       uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > SMSTATEEN0_HSENVCFG;
> > > >   
> > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > +    }
> > > > +
> > > >       return write_hstateen(env, csrno, wr_mask, new_val);
> > > >   }
> > > >   
> > > > @@ -2024,6 +2039,10 @@ static RISCVException
> > > > write_hstateen0h(CPURISCVState *env, int csrno,
> > > >   {
> > > >       uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > SMSTATEEN0_HSENVCFG;
> > > >   
> > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > +    }
> > > > +
> > > >       return write_hstateenh(env, csrno, wr_mask, new_val);
> > > >   }
> > > >   
> > > > @@ -2083,6 +2102,10 @@ static RISCVException
> > > > write_sstateen0(CPURISCVState *env, int csrno,
> > > >   {
> > > >       uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > SMSTATEEN0_HSENVCFG;
> > > >   
> > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > +    }
> > > > +
> > > >       return write_sstateen(env, csrno, wr_mask, new_val);
> > > >   }
> > > >   
> > > > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
> > > > b/target/riscv/insn_trans/trans_rvf.c.inc
> > > > index a1d3eb52ad..c43c48336b 100644
> > > > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > > > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > > > @@ -24,9 +24,43 @@
> > > >               return false; \
> > > >   } while (0)
> > > >   
> > > > +#ifndef CONFIG_USER_ONLY
> > > > +#define SMSTATEEN_CHECK(ctx) do {\
> > > > +    CPUState *cpu = ctx->cs; \
> > > > +    CPURISCVState *env = cpu->env_ptr; \
> > > > +    if (ctx->cfg_ptr->ext_smstateen && \
> > > > +        (env->priv < PRV_M)) { \
> > > > +        uint64_t stateen = env->mstateen[0]; \
> > > > +        uint64_t hstateen = env->hstateen[0]; \
> > > > +        uint64_t sstateen = env->sstateen[0]; \
> > > > +        if (!(stateen & SMSTATEEN_STATEN)) {\
> > > > +            hstateen = 0; \
> > > > +            sstateen = 0; \
> > > > +        } \
> > > > +        if (ctx->virt_enabled) { \
> > > > +            stateen &= hstateen; \
> > > > +            if (!(hstateen & SMSTATEEN_STATEN)) {\
> > > > +                sstateen = 0; \
> > > > +            } \
> > > > +        } \
> > > > +        if (env->priv == PRV_U && has_ext(ctx, RVS))
> > > > {\eventually
> > > > meaning
> > > > +            stateen &= sstateen; \
> > > > +        } \
> > > > +        if (!(stateen & SMSTATEEN0_FCSR)) { \
> > > > +            return false; \
> > > > +        } \
> > > > +    } \
> > > > +} while (0)
> > > 
> > > It's better to add a space before '\'.
> > 
> > ok. will modify in the next version.
> > > > +#else
> > > > +#define SMSTATEEN_CHECK(ctx)
> > > > +#endif
> > > > +
> > > >   #define REQUIRE_ZFINX_OR_F(ctx) do {\
> > > > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > > > -        REQUIRE_EXT(ctx, RVF); \
> > > > +    if (!has_ext(ctx, RVF)) { \
> > > > +        SMSTATEEN_CHECK(ctx); \
> > > > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > > > +            return false; \
> > > > +        } \
> > > >       } \
> > > >   } while (0)
> > > 
> > > SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for
> > > Extension.
> > > I think It's better to separate them. By the way, if we want the
> > > smallest modification
> > > for current code, adding it to REQUIRE_FPU seems better.
> > 
> > Actually REQUIRE_FPU is checking for mstatus.fs but as per
> > smstateen
> > spec we need to check for misa.f which is done in
> > REQUIRE_ZFINX_OR_F.
> 
> OK. It's acceptable to me  even though I prefer separating them.
> 
> However, I find another question in SMSTATEEN_CHECK: when access is
> disallowed by Xstateen.FCSR,  
> 
> it's always return false  which will trigger illegal instruction
> exception finally.
> 
> However, this exception is triggered by accessing fcsr CSR which may
> trigger illegal instruction trap and virtual
> instruction trap in different situation.
> 
> "For convenience, when the stateen CSRs are implemented and misa.F =
> 0, then if bit 1 of a
> controlling stateen0 CSR is zero, all floating-point instructions
> cause an illegal instruction trap (or virtual
> instruction trap, if relevant), as though they all access fcsr,
> regardless of whether they really do."
> 
> And  stateen.fcsr is only work when zfinx is enabled, so  it's better
> to SMSTATEEN_CHECK(ctx) after check for 
> 
> "!ctx->cfg_ptr->ext_zfinx"

Actually the spec refers only to misa.F and not zfinx and regarding the
fcsr its :
"as though they all access fcsr, regardless of whether they really do"

> Regards,
> Weiwei Li
> > > Regards,
> > > Weiwei Li
> > > 
> > > >   
> > > > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > > > b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > > > index 5d07150cd0..b165ea9d58 100644
> > > > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > > > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > > > @@ -17,24 +17,28 @@
> > > >    */
> > > >   
> > > >   #define REQUIRE_ZFH(ctx) do { \
> > > > +    SMSTATEEN_CHECK(ctx); \
> > > >       if (!ctx->cfg_ptr->ext_zfh) {      \
> > > >           return false;         \
> > > >       }                         \
> > > >   } while (0)
> > > >   
> > > >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> > > > +    SMSTATEEN_CHECK(ctx); \
> > > >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) {
> > > > \
> > > >           return false;                  \
> > > >       }                                  \
> > > >   } while (0)
> > > >   
> > > >   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> > > > +    SMSTATEEN_CHECK(ctx); \
> > > >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) 
> > > > { \
> > > >           return false;                         \
> > > >       }                                         \
> > > >   } while (0)
> > > >   
> > > >   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do {
> > > > \
> > > > +    SMSTATEEN_CHECK(ctx); \
> > > >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin
> > > > ||          \
> > > >             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr-
> > > > >ext_zhinxmin)) 
> > > > {     \
> > > >           return
> > > > false;                                        \


