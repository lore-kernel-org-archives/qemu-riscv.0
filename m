Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB82CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 07:48:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkgKe-00036z-Rf; Mon, 25 Sep 2023 03:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkgKc-00036Z-47
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 03:48:38 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkgKa-0006IM-Je
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 03:48:37 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-452832dbb5dso2449447137.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695628115; x=1696232915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ns556nGWeROzcHpNUUqxQir3WMfmjPXAuwsfnLYZEUI=;
 b=AKH2JissRmmVBv65GvV4a0BKS3AhZ1t1iJMtcurHE5elrUsl/6BTePnX1c8M8VIGdT
 elEZPUPULJmS2979WTp3d4wa7QJJoHZfdsz9vMxbYJWsMK1gLJ/bSmTiy27qei4A6BO8
 zLU6bBcksch0akbsvzdsOAqVOxdLRp2vLOLcHSSThuXU1xZOMwaZz16U5nUvKpXnqL/a
 EEw4MyH1ceXzAyWLF8MfPf47kG8Uqfq0UPsYFE70+VO4TWyPpcmHeaMA3S92f0WBj3my
 aEFK0zHCQIGS2+R7JD7R+gn2miFz+gWbhnX2XhwZAdL91k+eXAQXUUNqyM/gNN3xJppR
 03xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695628115; x=1696232915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ns556nGWeROzcHpNUUqxQir3WMfmjPXAuwsfnLYZEUI=;
 b=e4Y1yiY1qMWZDhDRnWL6l5MSAk9muK8mi2bRJTDLOCQPeJ6c4JtaKK0gynf/ZHiNJh
 sBrUzekFbQxDV3Sj7wROPZZ7611+OH3bFJX6e3tQV4gLrhvjflJCEoplPxO7qAmkVWoO
 lCTpPwwNJgFIgJra/ooJ3/7HWaF7DnSPEdNzDVzN/CcRKJ2hxB8Zji7gJb4vc7VqaQhs
 ui320nC3S6EN3pDtE1a4odwn8u7XGjfydqmeyvu7l//s+4yP/MsaHTrOg1AlpfNr73Dp
 DdV8yZtj0MS8VPxBHXt/fe8200kFBrFTt1ui8qEKrznofJ/rr5X/0tIdD19vQSjMbESF
 E2kg==
X-Gm-Message-State: AOJu0YwrygXsRxPOSjbWLDRezmYhxvomYWBNOthEhhg0z+EV/8kMuTpL
 aS3ZzFAe6vGtZ6A1cKjoCOYmTU3kS2EJBjBNVOCTTA==
X-Google-Smtp-Source: AGHT+IETk5McJL4iuuznvbW6ici95N5VEsFu5MdrXBmNZdzwfkrh4KoOdTgnnrkgE/hpSa6X97rNd8l+Hhyz+7nlsJQ=
X-Received: by 2002:a67:fc48:0:b0:44d:6256:ac8b with SMTP id
 p8-20020a67fc48000000b0044d6256ac8bmr3427820vsq.4.1695628115321; Mon, 25 Sep
 2023 00:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230914101751.772576-1-mchitale@ventanamicro.com>
 <CAKmqyKNv+Wk6duL4Ww1QiC30O-W7kyypdd+kh3tjKDzFOy0Ybg@mail.gmail.com>
In-Reply-To: <CAKmqyKNv+Wk6duL4Ww1QiC30O-W7kyypdd+kh3tjKDzFOy0Ybg@mail.gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 25 Sep 2023 13:17:59 +0530
Message-ID: <CAN37VV7AvDk3JtdNDEdTStpTevGrhXYSMScvZKREdZWnKhsz+A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Ignore writes when RW=01
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
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

On Mon, Sep 18, 2023 at 7:02=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Thu, Sep 14, 2023 at 10:35=E2=80=AFPM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> >
> > As per the Priv spec: "The R, W, and X fields form a collective WARL
> > field for which the combinations with R=3D0 and W=3D1 are reserved."
> > However currently such writes are not ignored as ought to be. The
> > combinations with RW=3D01 are allowed only when the Smepmp extension
> > is enabled and mseccfg.MML is set.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/pmp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index f3eb6e6585..5b430be18c 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -119,6 +119,14 @@ static bool pmp_write_cfg(CPURISCVState *env, uint=
32_t pmp_index, uint8_t val)
> >          if (locked) {
> >              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lo=
cked\n");
> >          } else if (env->pmp_state.pmp[pmp_index].cfg_reg !=3D val) {
> > +            /* If !mseccfg.MML then ignore writes with encoding RW=3D0=
1 */
> > +            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> > +                (!riscv_cpu_cfg(env)->ext_smepmp ||
> > +                !MSECCFG_MML_ISSET(env))) {
>
> MSECCFG_MML can only be set if ext_smepmp exists, so I don't think we
> need both checks here
Ok.
>
> > +                val &=3D ~(PMP_WRITE | PMP_READ);
> > +                val |=3D env->pmp_state.pmp[pmp_index].cfg_reg &
> > +                       (PMP_WRITE | PMP_READ);
>
> Why do we restore the previous value? It's a WARL so we should just
> guarantee a legal value (which would be 0x0 I guess)
Yes. It can be set to 0x0.
>
> Alistair
>
> > +            }
> >              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
> >              pmp_update_rule_addr(env, pmp_index);
> >              return true;
> > --
> > 2.34.1
> >
> >

