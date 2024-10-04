Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A91CFA763
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 10:48:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swfqf-0003OV-1A; Fri, 04 Oct 2024 06:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1swfqZ-0003LO-JZ
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 06:47:45 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1swfqX-0002Km-18
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 06:47:43 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e037a7d2c3so1036896b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1728038859; x=1728643659; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbclNKWlQeocfWH96H2fInmvfZv7Ua5kpU90qZnIBuM=;
 b=ktxjYUlsE+a5/sQia1vF51kHIAgqVlgfU/CvES5YsynO8xQo6L6bYVoP8cWXFUZbjc
 dJ1gjTuYLdNeSj9aTbTwMm25XKT3BSlP4ATJrm2eXN31un8VMQN88421j0FDP09fVzYk
 2iYXAhNNLdr1hcViCOAPnEx314JQGbxE8n3nmxj8ZS5AX3SqpTZc3kviS13Q7plzIMD2
 2tQPwSBZdqmeKMbh1lNQvYTx5w0Tf6bpjSM1dsfPThrrAB8eaHHmZOj12I0LKNYKu3nI
 F40kVMqN11KIOCidGajQfrgoMc/lx0Z0Fq1ODipUyZX5a1sxDJuXKiy5qRdpB5J2bU7E
 AzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728038859; x=1728643659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wbclNKWlQeocfWH96H2fInmvfZv7Ua5kpU90qZnIBuM=;
 b=fsEhTCOBRnEdVdtudkqWTEl2ewuFbclgvQFs+rrVxlCGwQVG/E0gzykjCxyxQ/DlIh
 tW+UL37pdKRnryS+l9bZC767Q+uRFf17DLrvXA0O44T7lkGMRkTl9lxR7B+saIJ3f/L1
 P3C2/vmwdpapc/0tK6LVa0SnwGuFd+AG+irWlT2KuKrAwf7I5hV0ZtU9vyE2u1Xa/AqE
 f2cVv1Gc8CQTCEoi+Sq3vSh9mY89hH8jzB9kX+0BGwGvAn2BJlZPRYULV0nzI8hIc5JW
 fjzLCcVsr+x7TMeRGu/IF4rDckIsGOmGSghW22rixVgcVdrKEQ0nA3YHr5PpgxVdJBjB
 z9fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHLe7N71HzZuzLUXiiVHBmZo5UcDz4NYsmHHI+vP2nAzIatSrrlvc2b2vOLOxKBcmFD1OSkXh+1NR@nongnu.org
X-Gm-Message-State: AOJu0YygeaJZF9P7OUB8RqHPrC+tZw4tNbIeS1/ViWCcbFtAexQXF19V
 rjqyFXx0Z3wWHzNH35HbRQAo1f3dMhV0K21P1lkrq7+U3EFYB4pr6v+68c6iMsYjm1TrFg4aL9a
 29cu2fv0FF0jxopXjp7bkN16iZBKGz8bk3b35sw==
X-Google-Smtp-Source: AGHT+IE311UPTJfIJtLbL/BgRhPb672q6w7DTdCAJSHWLgBhfZAhWkmEdCsCBxuu/2dgVWGyjRGbAd3c5a9l4Sz4cK4=
X-Received: by 2002:a05:6808:1284:b0:3df:2ea:51cb with SMTP id
 5614622812f47-3e3ba1ad7a3mr2914362b6e.6.1728038859557; Fri, 04 Oct 2024
 03:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240808082030.25940-1-yongxuan.wang@sifive.com>
 <aad11c6d-8c5d-40bd-8b0d-3dae10b80d4d@ventanamicro.com>
 <CAMWQL2h6=MO1YFW2tUONM_yDnmdtG-CfGyk+RCPZo3u2s6o4Uw@mail.gmail.com>
In-Reply-To: <CAMWQL2h6=MO1YFW2tUONM_yDnmdtG-CfGyk+RCPZo3u2s6o4Uw@mail.gmail.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 4 Oct 2024 18:47:28 +0800
Message-ID: <CAMWQL2iXud84Uu8=i7eRque0ixA9pRU+=ZSG9jaju_ZfTR7gtw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/intc/riscv_aplic: Fix APLIC in clrip and clripnum
 write emulation
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ping

On Fri, Aug 9, 2024 at 11:28=E2=80=AFAM Yong-Xuan Wang <yongxuan.wang@sifiv=
e.com> wrote:
>
> Hi Daniel,
>
> On Fri, Aug 9, 2024 at 5:40=E2=80=AFAM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Ccing Anup
> >
> > On 8/8/24 5:20 AM, Yong-Xuan Wang wrote:
> > > In the section "4.7 Precise effects on interrupt-pending bits"
> > > of the RISC-V AIA specification defines that:
> > >
> > > If the source mode is Level1 or Level0 and the interrupt domain
> > > is configured in MSI delivery mode (domaincfg.DM =3D 1):
> > > The pending bit is cleared whenever the rectified input value is
> > > low, when the interrupt is forwarded by MSI, or by a relevant
> > > write to an in clrip register or to clripnum.
> > >
> > > Update the riscv_aplic_set_pending() to match the spec.
> > >
> >
> > This would need a
> >
> > Fixes: bf31cf06eb ("hw/intc/riscv_aplic: Fix setipnum_le write emulatio=
n for APLIC MSI-mode")
> >
>
> I will add it into next version. Thank you!
>
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >   hw/intc/riscv_aplic.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> > > index c1748c2d17d1..45d8b4089229 100644
> > > --- a/hw/intc/riscv_aplic.c
> > > +++ b/hw/intc/riscv_aplic.c
> > > @@ -247,7 +247,7 @@ static void riscv_aplic_set_pending(RISCVAPLICSta=
te *aplic,
> > >
> > >       if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
> > >           (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)) {
> > > -        if (!aplic->msimode || (aplic->msimode && !pending)) {
> > > +        if (!aplic->msimode) {
> >
> > The change you're doing here seems sensible to me but I'd rather have A=
nup take
> > a look to see if this somehow undo what was made here in commit bf31cf0=
6.
> >
> > In particular w.r.t this paragraph from section 4.9.2 of AIA:
> >
> > "A second option is for the interrupt service routine to write the
> > APLIC=E2=80=99s source identity number for the interrupt to the domain=
=E2=80=99s
> > setipnum register just before exiting. This will cause the interrupt=E2=
=80=99s
> > pending bit to be set to one again if the source is still asserting
> > an interrupt, but not if the source is not asserting an interrupt."
> >
>
> I think that this patch won't affect setipnum. For the setipnum case,
> the pending value would
> be true. And it is handled by the 2 if conditions below.
>
> Regards,
> Yong-Xuan
>
> >
> > Thanks,
> >
> > Daniel
> >
> >
> > >               return;
> > >           }
> > >           if ((aplic->state[irq] & APLIC_ISTATE_INPUT) &&

