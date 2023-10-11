Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFE2CDB471
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 17:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqdK2-0006nl-Qp; Wed, 11 Oct 2023 13:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqdK1-0006nU-MY
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 13:48:37 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqdJz-0004sf-BO
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 13:48:37 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-452b0430cc5so45230137.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697046514; x=1697651314; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqmr9yyZfdU1r9ABt/A9Y5Q8yZ8+IsAg/FOEq2CzDhE=;
 b=A3Y7EnZISMABfK2r6vE2iNb4YBt24PDrFjGjzhsGcrRMpAhKO3MbQvUXxNG33y4Zze
 ojC4Jr6zIIkI5u6lpWLB7SXIgbg3mg6O63kFukjz3eIxK3bYEZ1RIGob2cD0uM+SXyg1
 c38/28n+kXD+zpBVdiJmCS+7lDYgeeGQod98fxPjYzFUjdnMgR1yCxa4nJuTToqA+d4o
 D2mjWYSzLnjlc/HfCNlxn/2HuRf7fUl3vCwwB3wARusd6iOkpXynZx1R6z8+ZxVP+29A
 Y6RccPjCjF0v1YQMRbqgc851Ljb7CLGXgG7K+0K7r5LjOWiH3rL781jB6ytqT4eh6Hvi
 NRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697046514; x=1697651314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqmr9yyZfdU1r9ABt/A9Y5Q8yZ8+IsAg/FOEq2CzDhE=;
 b=V9oxtKVkoMbLBhsZbSCwtUflk68NGKy2qpig1P1hzaHifivC1+3tQQty2bnmxlP8e/
 /ebx47PhTwgJnlKAfLKXWHu/L4LH4FIRdLgxIQzkbJnnU9/ZQuSofh+APoLXN8yjzUIp
 ZAJCrKDNDV2cERwxcrvewcFJgGxbL9gSQgVyNYJLTeqbmy8ejLGIeuYyw9Hdoj2Xdcq+
 ut9vhlnv8KQXfjSKZDtEY9ts3d4IH3lReCcUERo4pCi/apKMAtWYwu++y0Xc2My7FTPb
 mXxLn0ej2SCcAK2SbpWrkqrbW6+jyfmIznGHHSL/6UTGwen4c+BIjLPrJorUcPSmDijC
 WPzg==
X-Gm-Message-State: AOJu0YyNIn2GdOMvkZIkLgizbOzScDNidjycuMzZFwBTnaCkYxcLNBZU
 /42sZRsglyzJRqIr1Fmv8//O7L8ANFJ8hcwEKwstaw==
X-Google-Smtp-Source: AGHT+IFPKAmwQm3DGk7gxgQ9gvbeKUlQxKJfoobUnM5VApbYYPs+lCB96FvOGehAe1ojcU/UhRVyVp7sYE/2eVi7RmA=
X-Received: by 2002:a67:bb06:0:b0:452:6d14:2bea with SMTP id
 m6-20020a67bb06000000b004526d142beamr20987057vsn.13.1697046513737; Wed, 11
 Oct 2023 10:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230925110946.541019-1-mchitale@ventanamicro.com>
 <20e19d9a-c8cd-414d-ba6c-abdafbda0255@syntacore.com>
In-Reply-To: <20e19d9a-c8cd-414d-ba6c-abdafbda0255@syntacore.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 11 Oct 2023 23:17:57 +0530
Message-ID: <CAN37VV5qksy5ZEBagxn3xGF+FbD=O=f+KpxcZ6kgyFw4TPRtfA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Clear pmp/smepmp bits on reset
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=mchitale@ventanamicro.com; helo=mail-vs1-xe34.google.com
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

Hi Vladimir,

On Fri, Oct 6, 2023 at 5:08=E2=80=AFPM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> Hi Mayuresh,
>
> 25.09.2023 14:09, Mayuresh Chitale wrote:
> > As per the Priv and Smepmp specifications, certain bits such as the 'L'
> > bit of pmp entries and mseccfg.MML can only be cleared upon reset and i=
t
> > is necessary to do so to allow 'M' mode firmware to correctly reinitial=
ize
> > the pmp/smpemp state across reboots.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 11 +++++++++++
> >  target/riscv/pmp.c | 10 ++++++++++
> >  target/riscv/pmp.h |  1 +
> >  3 files changed, 22 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 0fb01788e7..561567651e 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -761,6 +761,17 @@ static void riscv_cpu_reset_hold(Object *obj)
> >      }
> >      /* mmte is supposed to have pm.current hardwired to 1 */
> >      env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> > +
> > +    /*
> > +     * Clear mseccfg and unlock all the PMP entries upon reset.
> > +     * This is allowed as per the priv and smepmp specifications
> > +     * and is needed to clear stale entries across reboots.
> > +     */
> > +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> > +        env->mseccfg =3D 0;
> > +    }
> > +
> > +    pmp_unlock_entries(env);
> >  #endif
> >      env->xl =3D riscv_cpu_mxl(env);
> >      riscv_cpu_update_mask(env);
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index f498e414f0..5b14eb511a 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -129,6 +129,16 @@ static void pmp_write_cfg(CPURISCVState *env, uint=
32_t pmp_index, uint8_t val)
> >      }
> >  }
> >
> > +void pmp_unlock_entries(CPURISCVState *env)
> > +{
> > +    uint32_t pmp_num =3D pmp_get_num_rules(env);
> > +    int i;
> > +
> > +    for (i =3D 0; i < pmp_num; i++) {
> > +        env->pmp_state.pmp[i].cfg_reg &=3D ~PMP_LOCK;
>
> According to spec:
>
> Writable PMP registers=E2=80=99 A and L fields are set to 0, unless the
> platform mandates a different reset value for some PMP registers=E2=80=99=
 A and L fields.
Yes.
>
> So should we also set PMP_AMATCH_OFF in cfg?
I think clearing the 'A' field should be sufficient.

>
> Thank you,
> Vladimir Isaev
>
> > +    }
> > +}
> > +
> >  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> >                               target_ulong *ea)
> >  {
> > diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> > index b296ea1fc6..0ab60fe15f 100644
> > --- a/target/riscv/pmp.h
> > +++ b/target/riscv/pmp.h
> > @@ -82,6 +82,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_=
t pmp_index);
> >  void pmp_update_rule_nums(CPURISCVState *env);
> >  uint32_t pmp_get_num_rules(CPURISCVState *env);
> >  int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
> > +void pmp_unlock_entries(CPURISCVState *env);
> >
> >  #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
> >  #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> > --
> > 2.34.1
> >
> >

