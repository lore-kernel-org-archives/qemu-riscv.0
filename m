Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5440BEE0205
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 02:54:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgyxu-00038c-Ub; Thu, 14 Sep 2023 22:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qgyxs-000359-NR; Thu, 14 Sep 2023 22:53:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qgyxp-000328-GP; Thu, 14 Sep 2023 22:53:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-573ccec985dso1323996a12.2; 
 Thu, 14 Sep 2023 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694746427; x=1695351227; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8jXCHtEJAWZeoPIuYXVU75s++ZwBDA0cQTXgVqcpMPo=;
 b=b3N2Lo7Py9KYv3RltcLR129sD/ie0ZCmf8S2TyipsjUD+fK6iv05wO2tzJn30WV3lF
 +0ry7bJwffuKQLkoy4DQn6WHueGy0ID4rnBnQlE6EKZaO6jgc1R2Vyy4phuOtr3E8upH
 PUGZskXrtsbpTEQeneu3KHO4FmEc/qO+hZ6zhgW9+1q1/SqEPMpH6XJi+Xwz0Kw/yG+2
 cZ70TdjYRIqI2BK/z3Fld5pYAUZhML3e6sV7JDzx4cIgBRNNuCz6K3ixhYNzdETPDZkH
 3KMOpBL/+MbPs7d0c5xzO4hlHFg2Y8BrJVAj1zq6obQjz8igmW9sUCZPzZ+wqMk9DFiA
 m81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694746427; x=1695351227;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jXCHtEJAWZeoPIuYXVU75s++ZwBDA0cQTXgVqcpMPo=;
 b=Jo1lsF1vlqS4pvMXkS6Ebq2wxSYMdCAGG0FL49De0d2F51OV2eE8taVMnH93KlcE+y
 Cbo3hvnQVxPluoK6XhDvL+U5myveOyCZ4I8iBRdFGqswLxlOdBzh9KnMftTX7r5tk/HT
 ESKMLzRuN5dmKeRGpTF6ISyoKv8pEZhwfXo229vv7LCJPZdZN8vQAW7MC2/zoZhVPZq6
 XC1FWhKA5NHZWjl20Cz47Z30/B66uTvARsrXbbTyMHDOkmq78zAeHrn+PEKtvbVUdWjl
 OxHhU9NZpIFyB/Y2MUfIP9qFMqN3lrZkZq7wgK7DqDsHehGOvSdHNdccE3ex0sR4xmGo
 uVXQ==
X-Gm-Message-State: AOJu0YxL8gds4qpjQN6/bjcvbpQ2m/9KpwRQNvfrsN6VP5KROWAwo3Ix
 2z4HBUMPWtRafstEksmDEKpyQQv20Ja+3fJP10U=
X-Google-Smtp-Source: AGHT+IHFMWPyxlMtBJ55J1VOEuExrJpqmlkLNv0qZmYG3DdiB6/wWL2+3PQaD5QCAiiFz5gWKkTDEsMvF/orqPZQPJw=
X-Received: by 2002:a17:90a:fd98:b0:274:686d:497b with SMTP id
 cx24-20020a17090afd9800b00274686d497bmr301145pjb.27.1694746427322; Thu, 14
 Sep 2023 19:53:47 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5by15ZOy5ZiJ?= <vivahavey@gmail.com>
Date: Fri, 15 Sep 2023 10:53:36 +0800
Message-ID: <CAEV2DRqhazSjVLF30Jy2C-5BdaSRFoFuRva16e2eG=Sf-S1Pog@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: update checks on writing pmpcfg for
 Smepmp version 1.0
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Che-Chia Chang <alvinga@andestech.com>
Content-Type: multipart/alternative; boundary="000000000000c8f9e706055ce62d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=vivahavey@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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

--000000000000c8f9e706055ce62d
Content-Type: text/plain; charset="UTF-8"

> On Fri, Sep 08, 2023 at 04:38:34PM +0800, Alvin Chang wrote:

> > Current checks on writing pmpcfg for Smepmp follows Smepmp version

> > 0.9.1. However, Smepmp specification has already been ratified, and

> > there are some differences between version 0.9.1 and 1.0. In this

> > commit we update the checks of writing pmpcfg to follow Smepmp version

> 1.0.

> >

> > When mseccfg.MML is set, the constraints to modify PMP rules are:

> > 1. Locked rules connot be removed or modified until a PMP reset, unless

> >    mseccfg.RLB is set.

> > 2. From Smepmp specification version 1.0, chapter 2 section 4b:

> >    Adding a rule with executable privileges that either is M-mode-only

> >    or a locked Shared-Region is not possible and such pmpcfg writes are

> >    ignored, leaving pmpcfg unchanged.

> >

> > The commit transfers the value of pmpcfg into the index of the Smepmp

> > truth table, and checks the rules by aforementioned specification

> > changes.

> >

> > Signed-off-by: Alvin Chang <alvinga@andestech.com>

> > ---

> > Changes from v1: Convert ePMP over to Smepmp.

> >

> >  target/riscv/pmp.c | 51

> > ++++++++++++++++++++++++++++++++++++++--------

> >  1 file changed, 42 insertions(+), 9 deletions(-)

> >

> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index

> > 9d8db493e6..d1c3fc1e4f 100644

> > --- a/target/riscv/pmp.c

> > +++ b/target/riscv/pmp.c

> > @@ -98,16 +98,49 @@ static bool pmp_write_cfg(CPURISCVState *env,

> uint32_t pmp_index, uint8_t val)

> >                  locked = false;

> >              }

> >

> > -            /* mseccfg.MML is set */

> > -            if (MSECCFG_MML_ISSET(env)) {

> > -                /* not adding execute bit */

> > -                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) !=

> PMP_EXEC) {

> > -                    locked = false;

> > -                }

> > -                /* shared region and not adding X bit */

> > -                if ((val & PMP_LOCK) != PMP_LOCK &&

> > -                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {

> > +            /*

> > +             * mseccfg.MML is set. Locked rules cannot be removed or

> modified

> > +             * until a PMP reset. Besides, from Smepmp specification

> version 1.0

> > +             * , chapter 2 section 4b says:

> > +             * Adding a rule with executable privileges that either is

> > +             * M-mode-only or a locked Shared-Region is not possible

> and such

> > +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.

> > +             */

> > +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env,

> pmp_index)) {

> > +                /*

> > +                 * Convert the PMP permissions to match the truth

> table in the

> > +                 * ePMP spec.

> > +                 */

> > +                const uint8_t epmp_operation =

> > +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) <<

> 2) |

> > +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);

> > +

> > +                switch (epmp_operation) {

> > +                /* pmpcfg.L = 0. Neither M-mode-only nor locked

> Shared-Region */

> > +                case 0:

> > +                case 1:

> > +                case 2:

> > +                case 3:

> > +                case 4:

> > +                case 5:

> > +                case 6:

> > +                case 7:

> > +                /* pmpcfg.L = 1 and pmpcfg.X = 0 (but case 10 is not

> allowed) */

> > +                case 8:

>

> case 0 ... 8:

>


OK, will apply case ranges.


> > +                case 12:

> > +                case 14:

> > +                /* pmpcfg.LRWX = 1111 */

> > +                case 15:  /* Read-only locked Shared-Region on all

> > + modes */

> >                      locked = false;

> > +                    break;

> > +                /* Other rules which add new code regions are not

> allowed */

> > +                case 9:

> > +                case 10:  /* Execute-only locked Shared-Region on all

> modes */

> > +                case 11:

>

> case 9 ... 11:

>

> And why not put these cases in numerical order?

>


Agree, I will put them in numerical order.


> > +                case 13:

> > +                    break;

> > +                default:

> > +                    g_assert_not_reached();

> >                  }

> >              }

> >          } else {

> > --

> > 2.34.1

> >

> >

>

> It looks like this patch has overlap with

>

> https://lore.kernel.org/all/20230907062440.1174224-1-mchitale@ventanamicr
<https://lore.kernel.org/all/20230907062440.1174224-1-mchitale@ventanamicro.com/>

> o.com/
<https://lore.kernel.org/all/20230907062440.1174224-1-mchitale@ventanamicro.com/>

>

> Maybe you and Mayuresh can work together on a final patch.

>


It seems Mayuresh's patch is to reset PMP entries and mseccfg when CPU
resets.

This patch is to check the valid setting of pmpcfg at runtime, when CPU
supports Smepmp.

I think they are two independent patches.


> Thanks,

> drew

--000000000000c8f9e706055ce62d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; On Fri, =
Sep 08, 2023 at 04:38:34PM
+0800, Alvin Chang wrote:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Current checks on wr=
iting
pmpcfg for Smepmp follows Smepmp version</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 0.9.1. However, Smep=
mp
specification has already been ratified, and</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; there are some diffe=
rences
between version 0.9.1 and 1.0. In this</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; commit we update the=
 checks of
writing pmpcfg to follow Smepmp version</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 1.0.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; When mseccfg.MML is =
set, the
constraints to modify PMP rules are:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 1. Locked rules conn=
ot be
removed or modified until a PMP reset, unless</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 ms=
eccfg.RLB is set.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 2. From Smepmp speci=
fication
version 1.0, chapter 2 section 4b:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 Ad=
ding a rule with executable privileges
that either is M-mode-only</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 or=
 a locked Shared-Region is not possible
and such pmpcfg writes are</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 ig=
nored, leaving pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; The commit transfers=
 the value
of pmpcfg into the index of the Smepmp</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; truth table, and che=
cks the
rules by aforementioned specification</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; changes.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Signed-off-by: Alvin=
 Chang
&lt;<a href=3D"mailto:alvinga@andestech.com"><span style=3D"color:windowtex=
t;text-decoration-line:none">alvinga@andestech.com</span></a>&gt;</span></p=
>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; ---</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v1: Con=
vert ePMP
over to Smepmp.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0 target/riscv/p=
mp.c | 51</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;
++++++++++++++++++++++++++++++++++++++--------</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0 1 file changed=
, 42 insertions(+), 9
deletions(-)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; diff --git
a/target/riscv/pmp.c b/target/riscv/pmp.c index</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 9d8db493e6..d1c3fc1e=
4f 100644</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; --- a/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +++ b/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; @@ -98,16 +98,49 @@ =
static
bool pmp_write_cfg(CPURISCVState *env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; uint32_t pmp_index, uint8=
_t val)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* mseccfg.MML is set */</=
span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSECCFG_MML_ISSET(env)=
) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 not adding execute bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ((val &amp; PMP_LOCK) !=3D 0
&amp;&amp; (val &amp; PMP_EXEC) !=3D</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; PMP_EXEC) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<=
/span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 shared region and not adding
X bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ((val &amp; PMP_LOCK) !=3D
PMP_LOCK &amp;&amp;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (val &amp; 0x7) !=3D
(PMP_WRITE | PMP_EXEC)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mseccfg.MML is set=
. Locked rules
cannot be removed or</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; modified</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * until a PMP reset.=
 Besides, from
Smepmp specification</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; version 1.0</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * , chapter 2 sectio=
n 4b says:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Adding a rule with=
 executable
privileges that either is</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * M-mode-only or a l=
ocked
Shared-Region is not possible</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; and such</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pmpcfg writes are =
ignored,
leaving pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSECCFG_MML_ISSET(env)
&amp;&amp; !pmp_is_locked(env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; pmp_index)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Convert the PMP permissions
to match the truth</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; table in the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * ePMP spec.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
nst uint8_t epmp_operation =3D</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ((val &amp; PMP_LOCK)
&gt;&gt; 4) | ((val &amp; PMP_READ) &lt;&lt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 2) |</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (val &amp; PMP_WRITE) |
((val &amp; PMP_EXEC) &gt;&gt; 2);</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sw=
itch (epmp_operation) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 pmpcfg.L =3D 0. Neither
M-mode-only nor locked</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Shared-Region */</span></=
p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 0:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 1:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 2:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 3:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 4:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 5:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 6:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 7:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 pmpcfg.L =3D 1 and pmpcfg.X =3D
0 (but case 10 is not</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; allowed) */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 8:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; case 0 ... 8:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTex=
t" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span=
 lang=3D"EN-US">OK, will apply case ranges.</span></p><p class=3D"gmail-Mso=
PlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US"><br></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 12:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 14:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 pmpcfg.LRWX =3D 1111 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 15:=C2=A0 /* Read-only locked Shared-Region on all</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; + modes */</span></p=
>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Other rules which add new
code regions are not</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; allowed */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 9:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 10:=C2=A0 /* Execute-only locked Shared-Region on all</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; modes */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 11:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; case 9 ... 11:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; And why not put these cas=
es in
numerical order?</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTex=
t" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span=
 lang=3D"EN-US">Agree, I will put them in numerical order.</span></p><p cla=
ss=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Ca=
libri,sans-serif"><span lang=3D"EN-US"><br></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se 13:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 g_assert_not_reached();</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; --</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 2.34.1</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; It looks like this patch =
has
overlap with</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; <a href=3D"https://lore.k=
ernel.org/all/20230907062440.1174224-1-mchitale@ventanamicro.com/"><span st=
yle=3D"color:windowtext;text-decoration-line:none">https://lore.kernel.org/=
all/20230907062440.1174224-1-mchitale@ventanamicr</span></a></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US"><a href=3D"https://lore.kernel=
.org/all/20230907062440.1174224-1-mchitale@ventanamicro.com/"><span style=
=3D"color:windowtext;text-decoration-line:none">&gt; o.com/</span></a></spa=
n></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Maybe you and Mayuresh ca=
n work
together on a final patch.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTex=
t" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span=
 lang=3D"EN-US">It seems Mayuresh&#39;s patch is to reset PMP entries and m=
seccfg when CPU resets.</span></p><p class=3D"gmail-MsoPlainText" style=3D"=
margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">This patch is to =
check the valid setting of pmpcfg at runtime, when CPU supports Smepmp.</p>=
<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif">I think they are two independent patches.</p><p cla=
ss=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Ca=
libri,sans-serif"><br></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Thanks,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; drew</span></p></div>

--000000000000c8f9e706055ce62d--

