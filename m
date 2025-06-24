Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE440C77B7F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:49:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uU34z-0007sy-3r; Tue, 24 Jun 2025 08:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uU34x-0007sH-PB
 for qemu-riscv@nongnu.org; Tue, 24 Jun 2025 08:48:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uU34t-0005FS-8E
 for qemu-riscv@nongnu.org; Tue, 24 Jun 2025 08:48:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so35271375e9.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Jun 2025 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750769320; x=1751374120; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ROnm+hqEeowNBJl/GsmTVrAMZTru29bP822K0pMtTww=;
 b=EjsCLkNe1iRtFWztpgFaSUMal+GhJ9GxHsf0oR3AGuxll/kOpTt/r2PgTm2rT4jsvN
 YgJmjbZcB1jXYeC1N0A4qxSC71qtMQzi/p/bJnpBZmW4dCNzj68jjcum9a9C6tQk+gv2
 I0pISLr6gyIvD1UVAr0ZXJWz29AJAasUMZkCv3cVXeP+UcMIrv83dr6wujLlf4mmzkEG
 fRwkI7n4dR33agaFecuV4iZpKHMCzGcmx6pPBkBflfEg+yD5rJyrtk2l50Dy5VTLTtcS
 wacl66BFk4XprZiesJ+a+KTGCoSCwzk2eWku53cAqQ+rG/5fNShRNHNDeSP7ARv4DSQk
 G/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750769320; x=1751374120;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ROnm+hqEeowNBJl/GsmTVrAMZTru29bP822K0pMtTww=;
 b=XnQ+unJmyro+w/JKYKwWGmEE/N5pVNf+awrmAQFpbBcXpGMAbqxO8xX9q6Vf5xHSII
 p9R2HyTL9Kn+jhJLBEkFq3gkaZ++VkNFyXa9itU/IDWrgz9ZANvG54MU0lFbQl+m2neN
 O+W5AQpb1h1anyzBR43h6YTdom6OFs676Xz7yyLH8Gyi+L7E3J3Qr4dGEdOKkrb3mqGq
 E6Ri6c+zeu3L6GGgVHfE6svfY4ZUFf3t0pxtq4F7g2nmQZ7GLSgdAzWQHtRJ2Jev8XgL
 ei7+7xMFcYcN7ppQG40nzFOFeIiWdXYGuiPLMlpDEbiYEChWj8iibhutsiCBxY1OqyDH
 YvJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuWfcHGshyGuhkZ9r7/jywXbmoSVk2xVhqr7tUgdo0h0it65TFI+N+3dn0RK68+MOOaget8JGxmIFd@nongnu.org
X-Gm-Message-State: AOJu0YxBN5bm4AiAxajbeOPBI9AkdmzsA003AZ3d37Qew0/5YO7UM8Wi
 44LeYBklqcktDgZSalhjgE7kEC0JBz17anMeLRpFKSZ2Y4PHxCm5wtGHUHuzuQ9ALnE=
X-Gm-Gg: ASbGncsvbe/F6zuT4nNIw7K4fDMbT4hHqCUOtLzf6b3bH76gOCQuO0aBX9XIq8gU6sL
 bwaywJjzuKhM0rv7gv6C2scyDt4ehEFfY4o4rbsKwVkOCbPZiHZljU8PyYWU1FpdJRqHpZvKYuQ
 4snBRDl2HZUk1lfVxk91KEBUFebUbUhNzkO3nyg3YgiEqWJukIVAGaPNc7G70FcIyb9jzERez59
 9Stm/qEe3P/4MbqHq+PYDfn7f03YDgW+JCyyW9p0jL5tL5tyePVNtNnmpiiMWV0oAS83P+w9Q5K
 62lC/h3clRJMTGO4UScKu/LWtHsKbOQ8Vy+4WmAJEo3YAJyf6A==
X-Google-Smtp-Source: AGHT+IFyfQ/K3Eef0yA55Qu0dlUgRf6HTJu3nPRuksfS8xRTRlwA1TnKHCzxFkn+dwIG5YaBekA6XQ==
X-Received: by 2002:a05:600c:6015:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-4537b74c25amr23425665e9.7.1750769320391; 
 Tue, 24 Jun 2025 05:48:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f259dsm1903034f8f.50.2025.06.24.05.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 05:48:39 -0700 (PDT)
Date: Tue, 24 Jun 2025 14:48:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/2] target/riscv: disable *stimecmp interrupts without
 *envcfg.STCE
Message-ID: <20250624-78bc42d2ef7ff486394f4478@orel>
References: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
 <20250623165329.2759651-2-rkrcmar@ventanamicro.com>
 <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jun 23, 2025 at 06:39:02PM -0300, Daniel Henrique Barboza wrote:
> Hi Radim,
> 
> It seems like this patch is breaking 'make check-functional':
> 
> 12/12 qemu:func-quick+func-riscv64 / func-riscv64-riscv_opensbi   TIMEOUT         90.06s   killed by signal 15 SIGTERM
> 
> Checking the logs I verified that the problem can be reproduced by running the
> 'spike' machine as follows:
> 
> $ ./build/qemu-system-riscv64 -M spike   --nographic
> Segmentation fault (core dumped)
> 
> The expected result is to boot opensbi. The problem can't be reproduced with
> the 'virt' board, so something that you did here impacted 'spike' in particular
> for some reason.

FWIW, spike uses the masking approach for henvcfg.STCE. See [1]

[1] https://lists.riscv.org/g/tech-privileged/message/2385

Thanks,
drew

> 
> 
> Thanks,
> 
> Daniel
> 
> On 6/23/25 1:53 PM, Radim Krčmář wrote:
> > The specification states that menvcfg.STCE=0 prevents both *stimecmp
> > CSRs from having an effect on the pending interrupts.
> > henvcfg.STCE=0 disables only vstimecmp.
> > 
> > Make sure that when *envcfg.STCE is not set:
> > * writing the *stimecmp CSRs doesn't modify the *ip CSRs,
> > * and that the interrupt timer is disarmed.
> > 
> > Call the *stimecmp CSR update functions when *envcfg.STCE is toggled,
> > because the *ip CSRs need to immediately reflect the new behavior.
> > 
> > Fixes: 43888c2f1823 ("target/riscv: Add stimecmp support")
> > Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> > ---
> >   target/riscv/csr.c         | 12 ++++++++++++
> >   target/riscv/time_helper.c | 10 ++++++++++
> >   2 files changed, 22 insertions(+)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index fb149721691d..43eae9bcf153 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -3181,6 +3181,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> >       const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
> >       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
> >                       MENVCFG_CBZE | MENVCFG_CDE;
> > +    typeof(env->menvcfg) old = env->menvcfg;
> >       if (riscv_cpu_mxl(env) == MXL_RV64) {
> >           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> > @@ -3208,6 +3209,11 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> >           }
> >       }
> >       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
> > +
> > +    if ((old ^ env->menvcfg) & MENVCFG_STCE) {
> > +        riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
> > +    }
> > +
> >       return write_henvcfg(env, CSR_HENVCFG, env->henvcfg, ra);
> >   }
> > @@ -3314,6 +3320,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> >                                       target_ulong val, uintptr_t ra)
> >   {
> >       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> > +    typeof(env->henvcfg) old = env->henvcfg;
> >       RISCVException ret;
> >       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > @@ -3347,6 +3354,11 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> >           env->vsstatus &= ~MSTATUS_SDT;
> >       }
> > +    if ((old ^ env->henvcfg) & HENVCFG_STCE) {
> > +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
> > +                                  env->htimedelta, MIP_VSTIP);
> > +    }
> > +
> >       return RISCV_EXCP_NONE;
> >   }
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > index bc0d9a0c4c35..8198a2d8d92d 100644
> > --- a/target/riscv/time_helper.c
> > +++ b/target/riscv/time_helper.c
> > @@ -49,6 +49,16 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
> >       uint32_t timebase_freq = mtimer->timebase_freq;
> >       uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
> > +    /*
> > +     * *envcfg.STCE disables *stimecmp interrupts, but still allows higher
> > +     * privileges to write the *stimecmp CSRs.
> > +     */
> > +    if (!get_field(env->menvcfg, MENVCFG_STCE) ||
> > +        (timer_irq == MIP_VSTIP && !get_field(env->henvcfg, HENVCFG_STCE))) {
> > +        timer_del(timer);
> > +        return;
> > +    }
> > +
> >       if (timecmp <= rtc_r) {
> >           /*
> >            * If we're setting an stimecmp value in the "past",
> 
> 

