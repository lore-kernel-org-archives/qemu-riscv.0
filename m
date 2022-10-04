Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofbmq-0000SR-F2
	for mharc-qemu-riscv@gnu.org; Tue, 04 Oct 2022 02:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofbmd-0000Ok-T8
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 02:52:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofbmY-0000iR-Ut
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 02:52:03 -0400
Received: by mail-pj1-x102f.google.com with SMTP id fw14so5046824pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Oct 2022 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date; bh=uYcUCfxcK1MsH06I3SCNIhSOaFuiEdHlYJWDpClgBKU=;
 b=FT26xavB0fWj1KfUarEyUpvl3QPebtCZX/jc+rDKfshN04qKn+obcfubSfcA03C0V3
 mKaz0XIqO+Pys0qvKYRRJAcPrI7fKGTv7nZ5vZyGD2nkRF2kPz87SXIpRovMy6No7Fv4
 yqFS6PU8Duc6Y5WkBT+Re03X1D2X7gJOd8FTCoXG/NcdqZ3rYNeCGXFsVOWkKsS/JMV2
 h1bf9PnefhEewhF54v5z2TXbM/N+/U5QpMvm8I+vzvGUcgyTGemI9Ohaa7+OH7aQ5E87
 lD9vLD8Lx590AbeHYDgcgY4f2nSvWoxlyLvWUmzEptZFJEmQA23KEZZBNQAeIiva+vcn
 oebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=uYcUCfxcK1MsH06I3SCNIhSOaFuiEdHlYJWDpClgBKU=;
 b=OkivxH3n/HCkDnuXJuK/xKwXJZVwSLmnuKP/aOw2y+xZDUVvB3xYcBRHl956aAFNs6
 HG5lsps7zuMXzYwfKkQhIxVFC+UxjunE9uUbUqQlLtPeW6rfgqrkhtiDu6yxDddTOdUd
 I4uM4roiq6sfqm0hswLYXfiHAfxlTP1ZpnFPEBlphQF6gfklgpEYakRrCuWxhXWOYMhl
 oFiWCfW76X5uhEaVnM0ybF3E6JF8/m5vyKgKR0hmeex5b1QOaFC/0FIc2DnPzvIZhSVm
 i1co4UWkYEFl08mNU9Bq5rVXCkKWI0Am9wqCGaRbWZTulCZ5EWlWhjB0GAP9RhTYdsil
 AI7g==
X-Gm-Message-State: ACrzQf3wltuNtDyPXs7sJbkZVMLpzXwYjO6Dpzlf+Wl9mbaGUrNPCjZp
 NQXDRezuH03nN47uM1sP3kZeFQ==
X-Google-Smtp-Source: AMsMyM5+LxEs1kxMKv0naHeU7OjRVWL/Ss+/jvcypjViBgApXTtWnhnI8jzq3cODRq12b2tLWZqnnA==
X-Received: by 2002:a17:90b:3903:b0:202:affa:1c9f with SMTP id
 ob3-20020a17090b390300b00202affa1c9fmr16266598pjb.27.1664866317144; 
 Mon, 03 Oct 2022 23:51:57 -0700 (PDT)
Received: from [192.168.1.5] ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a1709027e0f00b001752216ca51sm1194562plm.39.2022.10.03.23.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 23:51:56 -0700 (PDT)
Message-ID: <d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com>
Subject: Re: [PATCH v10 4/5] target/riscv: smstateen check for fcsr
From: mchitale@ventanamicro.com
To: weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Tue, 04 Oct 2022 12:21:51 +0530
In-Reply-To: <404205f5-9626-23b3-d388-b2288293c7d1@iscas.ac.cn>
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
 <20221003114718.30659-5-mchitale@ventanamicro.com>
 <404205f5-9626-23b3-d388-b2288293c7d1@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Tue, 04 Oct 2022 06:52:14 -0000

On Mon, 2022-10-03 at 21:02 +0800, weiwei wrote:
> On 2022/10/3 19:47, Mayuresh Chitale wrote:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point
> > operations must return illegal instruction exception or virtual
> > instruction
> > trap, if relevant.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c                        | 23 ++++++++++++
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 43
> > +++++++++++++++++++++--
> >   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
> >   3 files changed, 75 insertions(+), 3 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 71236f2b5d..8b25f885ec 100644
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
> > @@ -2023,6 +2027,9 @@ static RISCVException
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
> > @@ -2059,6 +2066,10 @@ static RISCVException
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
> > @@ -2096,6 +2107,10 @@ static RISCVException
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
> > @@ -2135,6 +2150,10 @@ static RISCVException
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
> > @@ -2182,6 +2201,10 @@ static RISCVException
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
> > index a1d3eb52ad..93657680c6 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,46 @@
> >               return false; \
> >   } while (0)
> >   
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +#ifndef CONFIG_USER_ONLY
> > +static inline bool smstateen_fcsr_check(DisasContext *ctx, int
> > index)
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
> > +        if (ctx->virt_enabled) {
> > +            ctx->virt_inst_excp = true;
> > +        }
> 
> Are there any considerations for adding  virt_inst_excp instead of
> directly
> 
> "generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)" here?
> 
> Regards,
> 
> Weiwei Li

I had considered it but I think this is a simpler approach as the rest
of the code path stays the same as generating an illegal instruction
exception, for e.g setting the bins value (tval). Also we need to
return true from all the caller trans_* functions even if the smstateen
check has failed.
> 
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +#else
> > +#define smstateen_fcsr_check(ctx, index) (true)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        if (!smstateen_fcsr_check(ctx, 0)) { \
> > +            return false; \
> > +        } \
> >       } \
> >   } while (0)
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > index 5d07150cd0..6c2e338c0a 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -20,18 +20,27 @@
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> > +    if (!smstateen_fcsr_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    if (!smstateen_fcsr_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
> >           return false;                         \
> >       }                                         \
> > +    if (!smstateen_fcsr_check(ctx, 0)) { \
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
> > +    if (!smstateen_fcsr_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)


