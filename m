Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJRuc-00069l-86
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 23:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRua-00067l-Ql
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 23:52:40 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRuW-00062B-4Y
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 23:52:40 -0400
Received: by mail-oi1-x232.google.com with SMTP id n133so22085588oib.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=FrzyCRep0ytAilZMMsRK3Fl1dES56DD/QAH69sn5JC0=;
 b=mmCIDEp2K8pn6XD06kYK7ACKoj+J4QyRsr2qAZABi2d/RbsGFOTU4iLN0XBB7oO0ni
 K1J92RWplbdkta1Uj2hTIUzY5uqjTUrpeWbAW564GRWTKHooO86P8G+Fb0L9pjqgXhQP
 KxL2YMCOqU7vHbflVvNjrVRXPwDUVQG5aOyYUlppOy1YeLwCenjztcEdjmeHXWztysnf
 jXB6CyCeSk8VaGeq5ZhT82SiRxw6V1+igOfn4OQJCU03PEkAZ7Mxbhxu+q+WOXvVIYH1
 uj46zaoPYj8vlRffox6EtsgS6XdMBuQ5ypODgnKSMauHZ4TSxV1uTeEIIr32BwRR8Bt1
 KLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=FrzyCRep0ytAilZMMsRK3Fl1dES56DD/QAH69sn5JC0=;
 b=rvxNleu4Gq9WxUspVoN8lWBLYqr4n87DrSfdw6XgVpCVMTeWnAzidji/gQeXhoO3vN
 Kq7r9HL3Drd1e7gTnDh2tM9UQIrV8r/zqXlPgxmHEbEo4AMr0jYTbmOU+6bL/sxccOzi
 oWW2d/7xvuyaD+adZfRH4jdEwmBeOwGELjL0D/BUy5NnQmYRxCgtX49TTod04CxZZKA2
 2RFXRTHuOf8FGUl/2KxbrIJTCIYw09tyDTyQ9NEJjlrsZJMkPXBbhpBH4nlX+1hOIi4k
 gEtJTGWPyeeYelKKpss9uj/dPJ/4/yV3GRlAxDKq7m8rmazietr6vJ+Z6sBpZOGF3g1s
 hegA==
X-Gm-Message-State: ACgBeo0C0g+VuH0FSiK0Zksu2HsD11seu26Vl6TcVs8ZGgOaMbDQClX+
 0st45suyPwBid6VAbeB7xr4xZQ==
X-Google-Smtp-Source: AA6agR5DJN1NpLBNZcUytU9hoARuB6J+ljl+dyVHHF7VqXS3swcjSFGw1WFGYjfVy5WXCiZeKjgtNQ==
X-Received: by 2002:a05:6808:11c3:b0:32e:b9ef:4cc9 with SMTP id
 p3-20020a05680811c300b0032eb9ef4cc9mr2872486oiv.125.1659585154283; 
 Wed, 03 Aug 2022 20:52:34 -0700 (PDT)
Received: from [192.168.1.18] ([182.70.65.172])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a9d5e0d000000b006359cd3e3b0sm1637803oti.77.2022.08.03.20.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 20:52:33 -0700 (PDT)
Message-ID: <cbf57485ce76ea2fe341f5d77d44f572bc4d29fb.camel@ventanamicro.com>
Subject: Re: [PATCH v7 3/4] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Thu, 04 Aug 2022 09:22:27 +0530
In-Reply-To: <c5d8304d-315c-bf5b-f63c-2d38348fdf4c@iscas.ac.cn>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
 <20220801171843.72986-4-mchitale@ventanamicro.com>
 <c5d8304d-315c-bf5b-f63c-2d38348fdf4c@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 04 Aug 2022 03:52:41 -0000

On Wed, 2022-08-03 at 16:32 +0800, Weiwei Li wrote:
> 在 2022/8/2 上午1:18, Mayuresh Chitale 写道:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point operations must return illegal instruction
> > exception.
> 
> I think this is not correct. The exception for float point
> operations 
> must be illegal instruction exception
> 
> if FCSR is not existed(that is misa.F is zero and Zfinx is not 
> supported). However, when FCSR is exsited,
> 
> the final exception should be decided by current privilege level and
> the 
> stateen related csr values just
> 
> like the access control of FCSR.
Ok. We can use the language from the spec itself.
> 
> Regards,
> 
> Weiwei Li
> 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c                        | 23 +++++++++++++
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 40
> > +++++++++++++++++++++--
> >   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
> >   3 files changed, 72 insertions(+), 3 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 011d6c5976..0512391220 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -79,6 +79,10 @@ static RISCVException fs(CPURISCVState *env, int
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
> > @@ -1866,6 +1870,9 @@ static RISCVException
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
> > @@ -1914,6 +1921,10 @@ static RISCVException
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
> > @@ -1963,6 +1974,10 @@ static RISCVException
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
> > @@ -2014,6 +2029,10 @@ static RISCVException
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
> > @@ -2073,6 +2092,10 @@ static RISCVException
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


