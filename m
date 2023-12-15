Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C5FC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 05:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE0ht-0006hy-Vc; Fri, 15 Dec 2023 00:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE0hp-0006hf-Pv; Fri, 15 Dec 2023 00:25:49 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE0hn-0001ca-Gk; Fri, 15 Dec 2023 00:25:49 -0500
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7cb0fdced70so116858241.1; 
 Thu, 14 Dec 2023 21:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702617945; x=1703222745; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAbGTrqsBi12JzUlTC3BDFK7dYGpXLIvG0BANQtgKRg=;
 b=O+f2Xu1RHLHDx4kTQrU70LQSZ8zaRq7yAxRiAMpK1HuZEA6l9KjTG7p/U7et9R0fg6
 Upxhp5eqgVzHEuhyxDrgvY6LteW94FrGzzHcxqPFoCZz0Q+nMcssLBPHfAau/9GnuSVQ
 4EcV8ry7OhdRtR00whbqfWNvJ4l6/WMVxGUjbK7s1lpup0wVT0bFhAvRb+vYbnK8v25g
 XpG5UNCvKhjE5UfDtpFoQG1wHPkJy6gsFBcp3yXXU1gvbpVpQpsLL3CjWLXumFfkYGl3
 ff0WcBUmOGJS/KHmYkKpX0Vr1r2iDBzcgepJCBlrEE7xkrKtqtG/yERpwtN2v+zOk8X0
 3liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702617945; x=1703222745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAbGTrqsBi12JzUlTC3BDFK7dYGpXLIvG0BANQtgKRg=;
 b=mBlX088V0vsiZlIPbj1UnukozjHRuxnrAul0aDAsVfv6bXUhjg/cdo9KTZBHOQ7PQw
 QJUUGlHgERZD6XdzDwbAy2uSKrBkKeNNGSgV0mElk/YFR325VZyNX/Smrq4rWim/kiBY
 e3puMmAZX5NUuUS3aBnNbT/SHuAveUopAn3ruHHRlB2uvSogKoCKht4S0PZbJAxOaMND
 4hdF8xDpYqkLTLJLLh6MRQ2Z/7YKNx6RmJEUQxNfB1sSK5E/b684lveETyXs1efkiji7
 W9bXU16zkcVJKhIvBZWV55dkcDquUqho+LZR4/ExRYfQKkMl1GIxhdPZnjwLPDLgI03I
 DKfA==
X-Gm-Message-State: AOJu0YyBOF6KtkIPynh6XiL0HgLZwOwxRxJvz1F0Y0opQsnzaP+R0AQ9
 ZUWOSqw5WDr3/wOo2yOGq29YPiPCuumFWklAzvw=
X-Google-Smtp-Source: AGHT+IEHOECN7ZxBjOcSoF1xv3qW5HXwuRCzttisv25V+JX+IybJviFWb9zw2cr3Murqd4gPShaNJdi11NvIgHs/5FU=
X-Received: by 2002:a05:6102:952:b0:464:8360:b520 with SMTP id
 a18-20020a056102095200b004648360b520mr11172646vsi.10.1702617944975; Thu, 14
 Dec 2023 21:25:44 -0800 (PST)
MIME-Version: 1.0
References: <CAEV2DRrg5ekL9MUcO2xOKjKkYtrQYhORQ2n4qO+cxamrw82BGA@mail.gmail.com>
In-Reply-To: <CAEV2DRrg5ekL9MUcO2xOKjKkYtrQYhORQ2n4qO+cxamrw82BGA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 15:25:18 +1000
Message-ID: <CAKmqyKPc538OEZUoARsHuRxfqg5LQuXUB7tRkJ-tu6Jujm8bRg@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alvin Chang <vivahavey@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Wed, Dec 6, 2023 at 3:37=E2=80=AFPM Alvin Chang <vivahavey@gmail.com> wr=
ote:
>
> > -----Original Message-----
>
> > From: Alistair Francis <alistair23@gmail.com>
>
> > Sent: Wednesday, December 6, 2023 11:39 AM
>
> > To: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andestec=
h.com>
>
> > Cc: qemu-riscv@nongnu.org; qemu-devel@nongnu.org;
>
> > alistair.francis@wdc.com; liweiwei@iscas.ac.cn
>
> > Subject: Re: [PATCH v5] target/riscv: update checks on writing pmpcfg f=
or
>
> > Smepmp to version 1.0
>
> >
>
> > On Tue, Nov 14, 2023 at 12:24=E2=80=AFPM Alvin Chang via <qemu-devel@no=
ngnu.org>
>
> > wrote:
>
> > >
>
> > > Current checks on writing pmpcfg for Smepmp follows Smepmp version
>
> > > 0.9.1. However, Smepmp specification has already been ratified, and
>
> > > there are some differences between version 0.9.1 and 1.0. In this
>
> > > commit we update the checks of writing pmpcfg to follow Smepmp versio=
n
>
> > > 1.0.
>
> > >
>
> > > When mseccfg.MML is set, the constraints to modify PMP rules are:
>
> > > 1. Locked rules cannot be removed or modified until a PMP reset, unle=
ss
>
> > >    mseccfg.RLB is set.
>
> > > 2. From Smepmp specification version 1.0, chapter 2 section 4b:
>
> > >    Adding a rule with executable privileges that either is M-mode-onl=
y
>
> > >    or a locked Shared-Region is not possible and such pmpcfg writes a=
re
>
> > >    ignored, leaving pmpcfg unchanged.
>
> > >
>
> > > The commit transfers the value of pmpcfg into the index of the Smepmp
>
> > > truth table, and checks the rules by aforementioned specification
>
> > > changes.
>
> > >
>
> > > Signed-off-by: Alvin Chang <alvinga@andestech.com>
>
> > > ---
>
> > > Changes from v4: Rebase on master.
>
> > >
>
> > > Changes from v3: Modify "epmp_operation" to "smepmp_operation".
>
> > >
>
> > > Changes from v2: Adopt switch case ranges and numerical order.
>
> > >
>
> > > Changes from v1: Convert ePMP over to Smepmp.
>
> > >
>
> > >  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------
>
> > >  1 file changed, 32 insertions(+), 8 deletions(-)
>
> > >
>
> > > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index
>
> > > 162e88a90a..4069514069 100644
>
> > > --- a/target/riscv/pmp.c
>
> > > +++ b/target/riscv/pmp.c
>
> > > @@ -102,16 +102,40 @@ static bool pmp_write_cfg(CPURISCVState *env,
>
> > uint32_t pmp_index, uint8_t val)
>
> > >                  locked =3D false;
>
> > >              }
>
> > >
>
> > > -            /* mseccfg.MML is set */
>
> > > -            if (MSECCFG_MML_ISSET(env)) {
>
> > > -                /* not adding execute bit */
>
> > > -                if ((val & PMP_LOCK) !=3D 0 && (val & PMP_EXEC) !=3D
>
> > PMP_EXEC) {
>
> > > +            /*
>
> > > +             * mseccfg.MML is set. Locked rules cannot be removed or
>
> > modified
>
> > > +             * until a PMP reset. Besides, from Smepmp specification
>
> > version 1.0
>
> > > +             * , chapter 2 section 4b says:
>
> > > +             * Adding a rule with executable privileges that either =
is
>
> > > +             * M-mode-only or a locked Shared-Region is not possible
>
> > and such
>
> > > +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
>
> > > +             */
>
> > > +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env,
>
> > > + pmp_index)) {
>
> >
>
> > This is tricky and took me a while to get my head around.
>
> >
>
> > From what I can tell, there is a bug in the spec.
>
> >
>
> > The spec specifically states that:
>
> >
>
> > """
>
> > The meaning of pmpcfg.L changes: Instead of marking a rule as locked an=
d
>
> > enforced in all modes, it now marks a rule as M-mode-only when set and
>
> > S/U-mode-only when unset.
>
> > """
>
> >
>
> > So the check for !pmp_is_locked() sounds correct.
>
> >
>
> > But then they add:
>
> >
>
> > """
>
> > The formerly reserved encoding of pmpcfg.RW=3D01, and the encoding
>
> > pmpcfg.LRWX=3D1111, now encode a Shared-Region.
>
> > """
>
> >
>
> > Which contradicts what they just said.

In future can you please reply in plain text? Otherwise the formatting
gets a little funky

>
>
> Yes you are right, it seems there are some misleading words.
>
>
> >
>
> > I *think* we want to ignore the locked bit here. We don't actually care=
 if it's
>
> > already set, instead we care if the region is an M-mode only region fro=
m the
>
> > 2.1 table
>
>
> The check for !pmp_is_locked() is because spec says (below table 2.1):
>
> "*Locked rules cannot be removed or modified until a PMP reset, unless ms=
eccfg.RLB is set."
>
> It is not related to M-mode-only or S/U-mode-only or Shared-Region.

Yes, but when mseccfg.MML is set

"The meaning of pmpcfg.L changes: Instead of marking a rule as locked
and enforced in all modes, it
now marks a rule as M-mode-only when set and S/U-mode-only when unset."

So the comment below table 2.1 no longer applies

>
>
> In other words, a pmpcfg where the pmpcfg.L bit was set can not be config=
ured anymore. Therefore, I think we should not ignore it here, since we are=
 trying to write a new value into the pmpcfg. If we ignore it, the locked p=
mpcfg will be modified and it would violate the spec.
>
>
> If the pmpcfg was not locked, we also need to check the new value that th=
e user wants to write. Because chapter 2 section 4b says: "Adding a rule wi=
th executable privileges that either is M-mode-only or a locked Shared-Regi=
on is not possible and such pmpcfg writes are ignored, leaving pmpcfg uncha=
nged". This checking is implemented as that switch-case statement, based on=
 table 2.1 truth table.

Yeah, that sounds right.

Alistair

>
>
> Alvin Chang
>
>
> >
>
> > I think the best bet here is to create a helper function that takes a p=
mpcfg
>
> > value and returns if it is M-mode only. Then we should check if the cur=
rent
>
> > pmp_index is M-mode only OR if we are adding one and then reject that.
>
> >
>
> > Does that make sense?
>
> >
>
> > Alistair
>
> >
>
> > > +                /*
>
> > > +                 * Convert the PMP permissions to match the truth
>
> > table in the
>
> > > +                 * Smepmp spec.
>
> > > +                 */
>
> > > +                const uint8_t smepmp_operation =3D
>
> > > +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) <<
>
> > 2) |
>
> > > +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
>
> > > +
>
> > > +                switch (smepmp_operation) {
>
> > > +                case 0 ... 8:
>
> > >                      locked =3D false;
>
> > > -                }
>
> > > -                /* shared region and not adding X bit */
>
> > > -                if ((val & PMP_LOCK) !=3D PMP_LOCK &&
>
> > > -                    (val & 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {
>
> > > +                    break;
>
> > > +                case 9 ... 11:
>
> > > +                    break;
>
> > > +                case 12:
>
> > > +                    locked =3D false;
>
> > > +                    break;
>
> > > +                case 13:
>
> > > +                    break;
>
> > > +                case 14:
>
> > > +                case 15:
>
> > >                      locked =3D false;
>
> > > +                    break;
>
> > > +                default:
>
> > > +                    g_assert_not_reached();
>
> > >                  }
>
> > >              }
>
> > >          } else {
>
> > > --
>
> > > 2.34.1
>
> > >
>
> > >

