Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oed1S-0004vl-Rg
	for mharc-qemu-riscv@gnu.org; Sat, 01 Oct 2022 09:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oed1F-0004pt-WB
 for qemu-riscv@nongnu.org; Sat, 01 Oct 2022 09:59:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oed1E-0002dE-5l
 for qemu-riscv@nongnu.org; Sat, 01 Oct 2022 09:59:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so6530487pjk.2
 for <qemu-riscv@nongnu.org>; Sat, 01 Oct 2022 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date; bh=OANG3hCly8xioKnSPBEPApxy/TrXGJu40wEgG/HchG0=;
 b=P0UjpUNimifilXgnA0ARbDvJGDm1nkez9DqHhx0uNGHnZ7/t5U3waWhxrE54Uw8aKp
 /wKZBh/5YR1CSK4sYE+viye9ADqwMfTYfdND9wGLD8+qf4rM5Q44MGGrM3SQbVL2RMuR
 OQIUqzSYJGPOkx9X9xDnE3xrR7QkEwTGCSwHITiTYWwcwu5XzKmDjwqsPYfqQ/+Wn7i4
 p8TvVoAh/RzV9B24sNK2RP5sYIdfbhitiwy8srng2VCIP6fvmdfCREDFEG7OyoXySwVQ
 wPkmC+A3Oy9AL1hMW9GaTn2vZrVesORBeKPCW/fs19It2gkzCOjTzJ+T9rITNuoT40oZ
 QzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=OANG3hCly8xioKnSPBEPApxy/TrXGJu40wEgG/HchG0=;
 b=r3b73+Qe5Cx80nsSyMubKsTPEHTgJj1BTYFkr+TX7I7jRUGsZiPJKPaSKgLOVEQd5E
 49JJXcITSFDx9+XXShj83BjDAHa7CI7/8WHQZmStF7SQIYtzO0YCCfF8/mqJP5ajnWs5
 R2DLiKs9It+XPcl0ikDg6P9x9MHzONz0mzLSrOzWrosdUatqHTG9cAtNDRNGtNaCM1F8
 868CfLmC0FwKne8wBpxAiJ2VCrgBEHkqikX7JLr/yeOvzQgwPLqjL0fGXs/1vbFdhL/I
 IA/c0HUo+GsflqH4fV1XIHCb4ZQz1eGVY8YNn2MlJEIwByFg2lpuUheUiRlWRpmEULAF
 EHjA==
X-Gm-Message-State: ACrzQf0OUcAbatO1HvItQDO8skj1aAUIt6EAHyTtgA4/I/X7v6Iq48Z5
 joMQA1ED+u8+P+cl9mgcgKsNwg==
X-Google-Smtp-Source: AMsMyM6bOZ8O8OLxZIe3F39KXwPNu20ep6lR8tn9QhSubYxN3i7Zh2mg20DQwmghhNwRv20EjR2zZQ==
X-Received: by 2002:a17:902:7887:b0:178:5e8a:e84e with SMTP id
 q7-20020a170902788700b001785e8ae84emr14087763pll.64.1664632741649; 
 Sat, 01 Oct 2022 06:59:01 -0700 (PDT)
Received: from ThinkPad-T490 ([182.70.42.58]) by smtp.gmail.com with ESMTPSA id
 c144-20020a621c96000000b0054ee4b632dasm3743434pfc.169.2022.10.01.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 06:59:00 -0700 (PDT)
Message-ID: <c18aa5cc1057da4b0727be51bc9cfe37b7d5fd93.camel@ventanamicro.com>
Subject: Re: [PATCH v9 3/4] target/riscv: smstateen check for fcsr
From: mchitale@ventanamicro.com
To: weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Sat, 01 Oct 2022 19:28:55 +0530
In-Reply-To: <be7628b4-ed39-aebb-0eed-6fdd899185c0@iscas.ac.cn>
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
 <20220919062908.643945-4-mchitale@ventanamicro.com>
 <be7628b4-ed39-aebb-0eed-6fdd899185c0@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 01 Oct 2022 13:59:06 -0000

On Thu, 2022-09-29 at 09:09 +0800, weiwei wrote:
> On 2022/9/19 14:29, Mayuresh Chitale wrote:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point
> > operations must return illegal instruction exception or virtual
> > instruction
> > trap, if relevant.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c                        | 23 +++++++++++++
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 40
> > +++++++++++++++++++++--
> >   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
> >   3 files changed, 72 insertions(+), 3 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 59d5aa74ee..edaecf53ce 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int
> > csrno)
> >           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> > +
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > +    }
> >   #endif
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -2024,6 +2028,9 @@ static RISCVException
> > write_mstateen0(CPURISCVState *env, int csrno,
> >                                         target_ulong new_val)
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> >   
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -2072,6 +2079,10 @@ static RISCVException
> > write_mstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2121,6 +2132,10 @@ static RISCVException
> > write_hstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2172,6 +2187,10 @@ static RISCVException
> > write_hstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2231,6 +2250,10 @@ static RISCVException
> > write_sstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_sstateen(env, csrno, wr_mask, new_val);
> >   }
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
> > b/target/riscv/insn_trans/trans_rvf.c.inc
> > index a1d3eb52ad..ce8a0cc34b 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,43 @@
> >               return false; \
> >   } while (0)
> >   
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +#ifndef CONFIG_USER_ONLY
> > +static inline bool smstateen_check(DisasContext *ctx, int index)
> > +{
> > +    CPUState *cpu = ctx->cs;
> > +    CPURISCVState *env = cpu->env_ptr;
> > +    uint64_t stateen = env->mstateen[index];
> > +
> > +    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
> > +        return true;
> > +    }
> > +
> > +    if (ctx->virt_enabled) {
> > +        stateen &= env->hstateen[index];
> > +    }
> > +
> > +    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
> > +        stateen &= env->sstateen[index];
> > +    }
> > +
> > +    if (!(stateen & SMSTATEEN0_FCSR)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +#else
> > +#define smstateen_check(ctx, index) (true)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        if (!smstateen_check(ctx, 0)) { \
> > +            return false; \
> > +        } \
> >       } \
> >   } while (0)
> 
> I think the potential exception triggered by smstateen_check is not 
> correct here:
> 
> "return false"  can only trigger illegal instruction exception.
> 
> However, smstateen_check  is for accessing fcsr CSR, It may trigger 
> illegal or  virtual instruction exception
> 
> based on the privilege mode and Xstateen CSRs.
> 
> Regards,
> 
> Weiwei Li

Ok. Need to check on how to do it.
> 
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > index 5d07150cd0..44d962c920 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -20,18 +20,27 @@
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
> >           return false;                         \
> >       }                                         \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> > @@ -39,6 +48,9 @@
> >             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) 
> > {     \
> >           return false;                                        \
> >       }                                                        \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)


