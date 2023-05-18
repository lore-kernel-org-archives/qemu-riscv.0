Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BD3C7EE24
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 04:49:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzVZy-0004p2-6F; Thu, 18 May 2023 00:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVZw-0004oo-O2; Thu, 18 May 2023 00:49:28 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVZv-00009y-5h; Thu, 18 May 2023 00:49:28 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-456ddefe8acso56266e0c.1; 
 Wed, 17 May 2023 21:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684385365; x=1686977365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skXBZmLcI8RBYaTkRZA+sW8HGs0lLmaLf/JSZVxSd7Y=;
 b=VKTuFLPWugbDKOR/ksb1cN/brDvAY3fnuufKSi+XyO3GuLx2kdjjwPZaVtIVY7TOX6
 RE1b+APy11ioN3rkuJSFPvAnIA1HpLYYLG+bGGoB4wbZYFFTETwXf69eNSdZRxHkNkEe
 /S+/WZYpSLEa2kcAPECJNJxnbFUGTNym+8dhIE6oikN4BFkG6/9gAKX+xwPjokOI+aOn
 o6djRTbL2l4ousN7GrRYuCYskPnPMn3XBn3ziLU++xHfAiFJQmmq9H3csCdhfoxJc4fi
 zYUDgm4TVr4d2BiENDrsg+IRM/bKSI4OXPLQ6AJT/3ZbKLjVaFt0tafud/6+fU+z4q5Y
 L8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684385365; x=1686977365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skXBZmLcI8RBYaTkRZA+sW8HGs0lLmaLf/JSZVxSd7Y=;
 b=Kk6hsWQKOSOkB83PQ5X8FkzGwDzjG1xJD6RUitRJ6MUJZNpNmXXt9taUZWYyuzfIMr
 RDv3GH2dMJy0H4wilGEevDKjoN8yxBzdXfZZ57RxxtElYZGQCboic6jZuDY+o4iZTyq5
 sdAFtM4H0fe8zS2Masc1LH0UMi+aYKNTOxvzAHTKTxKt2IwebWnA8/DVEYKn1wJKwyvA
 0Zuod+QEopMR2nxIEpFCbAjnyeDtm+x4UTUHUCPbrrjQbtqfMM2Q0heg2RmeU4Wa8j6q
 cjCEcQFoClZqSWmPm4xDQBorMVU9oRKODAvRh5A4RLWfLudCC8Eg6Bel14K5O62wYFYo
 9X0w==
X-Gm-Message-State: AC+VfDz4oVq7QkNsvfaS3Y4y2cI/i4064SpsSgBPvQnuNSOfYaxUlq0s
 b0sJVSYVlgatRO4wSasRrcCtyYqebCLvVAdM7R0=
X-Google-Smtp-Source: ACHHUZ4lxctCSTK/W4K9/1fsMYEmSglVW7VOLHVgOWry5uiGRnf+qLQ4ROZfu2BoNMHxdCdCHL6oTC50jhK9tqoOlaI=
X-Received: by 2002:a1f:5f06:0:b0:453:8a02:8d9 with SMTP id
 t6-20020a1f5f06000000b004538a0208d9mr255589vkb.11.1684385365293; Wed, 17 May
 2023 21:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230501140020.3667219-1-mchitale@ventanamicro.com>
 <20230501140020.3667219-2-mchitale@ventanamicro.com>
 <CAKmqyKN9vAAtXtRaUN3_im5k8kO+GoJ-V1mFbJPniSEdeswLnw@mail.gmail.com>
 <CAN37VV6Ms0hs_vAAr0n-P8chb-77jhQTQrv0qjBLKXiuBiDA_Q@mail.gmail.com>
In-Reply-To: <CAN37VV6Ms0hs_vAAr0n-P8chb-77jhQTQrv0qjBLKXiuBiDA_Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 14:48:59 +1000
Message-ID: <CAKmqyKOT03o5kAe8M3tTDr1Rv4jTNWwfkUkLt6d7xW7pVChL6g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, May 18, 2023 at 12:49=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> On Wed, May 17, 2023 at 8:42=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com> wrote:
> >
> > On Tue, May 2, 2023 at 12:00=E2=80=AFAM Mayuresh Chitale
> > <mchitale@ventanamicro.com> wrote:
> > >
> > > If smstateen is implemented and smtateen0.fcsr is clear and misa.F
> > > is off then the floating point operations must return illegal
> > > instruction exception or virtual instruction trap, if relevant.
> >
> > Do you mind re-wording this commit message? I can't get my head around
> > it. You talk about returning an illegal instruction exception, but
> > most of this patch is just adding SMSTATEEN0_FCSR to the write mask if
> > floating point is disabled.
> >
> Sure. The generic code for access check was added in a previous patch.
> > It looks to me like you are returning an exception trying to access a
> > floating pointer register if FP is off and SMSTATEEN0_FCSR is not set
> > (which you describe) but also then only allow changing SMSTATEEN0_FCSR
> > if the RVF is not enabled, which is where I'm confused.
> The smstateen0.fcsr bit is writable only when misa.F =3D=3D 0.
>
> >
> > Your patch seems to be correct, I think the commit message and title
> > just needs a small tweak. Maybe something like this:
> >
> > ```
> > target/riscv: smstateen add support for fcsr bit
> >
> > If smstateen is implemented and SMSTATEEN0.FCSR is zero floating point
> > CSR access should raise an illegal instruction exception or virtual
> > equivalent as required.
> >
> > We also allow the guest to set/unset the FCSR bit, but only if misa.F
> > =3D=3D 0, as defined in the spec.
>
> How about:
>
> target/riscv: smstateen check for fcsr
>
> Implement the s/h/mstateen.fcsr bit as as defined in the smstateen spec
> and check for it when accessing the fcsr register and its fields.

That works as well

Alistair

>
> > ```
> >
> > Alistair
> >
> > >
> > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > > ---
> > >  target/riscv/csr.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 4451bd1263..3f6b824bd2 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int c=
srno)
> > >          !riscv_cpu_cfg(env)->ext_zfinx) {
> > >          return RISCV_EXCP_ILLEGAL_INST;
> > >      }
> > > +
> > > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > > +    }
> > >  #endif
> > >      return RISCV_EXCP_NONE;
> > >  }
> > > @@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVS=
tate *env, int csrno,
> > >                                        target_ulong new_val)
> > >  {
> > >      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > > +    if (!riscv_has_ext(env, RVF)) {
> > > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > > +    }
> > >
> > >      return write_mstateen(env, csrno, wr_mask, new_val);
> > >  }
> > > @@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCV=
State *env, int csrno,
> > >  {
> > >      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > >
> > > +    if (!riscv_has_ext(env, RVF)) {
> > > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > > +    }
> > > +
> > >      return write_hstateen(env, csrno, wr_mask, new_val);
> > >  }
> > >
> > > @@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCV=
State *env, int csrno,
> > >  {
> > >      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > >
> > > +    if (!riscv_has_ext(env, RVF)) {
> > > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > > +    }
> > > +
> > >      return write_sstateen(env, csrno, wr_mask, new_val);
> > >  }
> > >
> > > --
> > > 2.34.1
> > >

