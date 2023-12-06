Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E56C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 05:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAkao-00050n-GE; Wed, 06 Dec 2023 00:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1rAkag-00050O-U0; Wed, 06 Dec 2023 00:36:59 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1rAkae-0005IO-Jv; Wed, 06 Dec 2023 00:36:58 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d857f6f1c0so3837315a34.0; 
 Tue, 05 Dec 2023 21:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701841014; x=1702445814; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tkEC1fbfGrG2MzC4baBJMznHZnsR7/zxc277fQG6j4w=;
 b=Cl2WCJOB36wx4jPT1MsRgmcQ7cBX4VbsSVbUl8Key2/AIQy5Nvzlnl+CfpkuCLTdpG
 ANId7Uj/QEI2Y9NFUPgDW8oIpnu5hdc2ZJ4eIA5bjSFAo/fx5yB8tsrxXdQpfSoXhfx2
 yWV814kYjggemyxzaK0Pam3WiXpCcy4XpokkOfKGyf9ciZWGYuzDZrbc1+NaQVC5buwb
 4yFPLMsx1J0S1ebmCnDSEE22CeD/cXaaq1ZvxHkF5DcA26WJK6UOWez9UewvG7DL7xTB
 u2OPQPw6Zb8iQn+nKO3RWD0h/R48pvjZ3DkEoJLCUwU/RyUYFyY9LPEN5yK2JfHe3qF8
 jyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701841014; x=1702445814;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tkEC1fbfGrG2MzC4baBJMznHZnsR7/zxc277fQG6j4w=;
 b=hFXfq1ll/8jqN8Mzxd2T3VHVVFfGf+7ZMk0R4iu5bpc//wEu/0V53rpOviiEw5+9Tn
 04anHSA6UVDOx337ZW1vv6U72hX6PamRtCmcnGrX9Bp3on3gd7RhHGxfy029HvB1yY0z
 JOJ0q8DteJqfz/itWe+HwW55qUxWihC3eqoeacgC1ph+A88qB8vjjJaq7+IB0T1dQM7K
 8zQBcaIDrRxpj9eksAG1oMs/BtOAF/AxfpMH2qnUTWf4gogDfwwzMXJ8L6l4ZZDjcTaA
 iyUIubWbvdoKvNNLp5nnBI8LuztJKayNSazYa0+HV5faNRHQsUs4BRTM0d/+T1ePfHnb
 DZDw==
X-Gm-Message-State: AOJu0Yyh3CcHy11EANsGR/qbrNKtpgw+OeAaaz+DVKsGY02s14JkzVx4
 tHfarYJ2ju0mRJuQ7mNXpsHb2Amb4aMWZptPXzkdo4CRj4FtfA==
X-Google-Smtp-Source: AGHT+IEQQE0Udu4/1R0gebnYJ0cabrVmsPiZDc41fZCPWj3YVbQG35pE3IVqApgmyJ9AG5Y6MsSp15Jd1rdfDcR28YY=
X-Received: by 2002:a05:6830:1416:b0:6d8:1bf7:df35 with SMTP id
 v22-20020a056830141600b006d81bf7df35mr517824otp.29.1701841014313; Tue, 05 Dec
 2023 21:36:54 -0800 (PST)
MIME-Version: 1.0
From: Alvin Chang <vivahavey@gmail.com>
Date: Wed, 6 Dec 2023 13:36:38 +0800
Message-ID: <CAEV2DRrg5ekL9MUcO2xOKjKkYtrQYhORQ2n4qO+cxamrw82BGA@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com
Cc: liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="0000000000001f5868060bd0bd2f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=vivahavey@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01,
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

--0000000000001f5868060bd0bd2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----

> From: Alistair Francis <alistair23@gmail.com>

> Sent: Wednesday, December 6, 2023 11:39 AM

> To: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andestech.=
com>

> Cc: qemu-riscv@nongnu.org; qemu-devel@nongnu.org;

> alistair.francis@wdc.com; liweiwei@iscas.ac.cn

> Subject: Re: [PATCH v5] target/riscv: update checks on writing pmpcfg for

> Smepmp to version 1.0

>

> On Tue, Nov 14, 2023 at 12:24=E2=80=AFPM Alvin Chang via <qemu-devel@nong=
nu.org>

> wrote:

> >

> > Current checks on writing pmpcfg for Smepmp follows Smepmp version

> > 0.9.1. However, Smepmp specification has already been ratified, and

> > there are some differences between version 0.9.1 and 1.0. In this

> > commit we update the checks of writing pmpcfg to follow Smepmp version

> > 1.0.

> >

> > When mseccfg.MML is set, the constraints to modify PMP rules are:

> > 1. Locked rules cannot be removed or modified until a PMP reset, unless

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

> > Changes from v4: Rebase on master.

> >

> > Changes from v3: Modify "epmp_operation" to "smepmp_operation".

> >

> > Changes from v2: Adopt switch case ranges and numerical order.

> >

> > Changes from v1: Convert ePMP over to Smepmp.

> >

> >  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------

> >  1 file changed, 32 insertions(+), 8 deletions(-)

> >

> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index

> > 162e88a90a..4069514069 100644

> > --- a/target/riscv/pmp.c

> > +++ b/target/riscv/pmp.c

> > @@ -102,16 +102,40 @@ static bool pmp_write_cfg(CPURISCVState *env,

> uint32_t pmp_index, uint8_t val)

> >                  locked =3D false;

> >              }

> >

> > -            /* mseccfg.MML is set */

> > -            if (MSECCFG_MML_ISSET(env)) {

> > -                /* not adding execute bit */

> > -                if ((val & PMP_LOCK) !=3D 0 && (val & PMP_EXEC) !=3D

> PMP_EXEC) {

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

> > + pmp_index)) {

>

> This is tricky and took me a while to get my head around.

>

> From what I can tell, there is a bug in the spec.

>

> The spec specifically states that:

>

> """

> The meaning of pmpcfg.L changes: Instead of marking a rule as locked and

> enforced in all modes, it now marks a rule as M-mode-only when set and

> S/U-mode-only when unset.

> """

>

> So the check for !pmp_is_locked() sounds correct.

>

> But then they add:

>

> """

> The formerly reserved encoding of pmpcfg.RW=3D01, and the encoding

> pmpcfg.LRWX=3D1111, now encode a Shared-Region.

> """

>

> Which contradicts what they just said.


Yes you are right, it seems there are some misleading words.


>

> I *think* we want to ignore the locked bit here. We don't actually care
if it's

> already set, instead we care if the region is an M-mode only region from
the

> 2.1 table


The check for !pmp_is_locked() is because spec says (below table 2.1):

"*Locked rules cannot be removed or modified until a PMP reset, unless
mseccfg.RLB is set."

It is not related to M-mode-only or S/U-mode-only or Shared-Region.


In other words, a pmpcfg where the pmpcfg.L bit was set can not be
configured anymore. Therefore, I think we should not ignore it here, since
we are trying to write a new value into the pmpcfg. If we ignore it, the
locked pmpcfg will be modified and it would violate the spec.


If the pmpcfg was not locked, we also need to check the new value that the
user wants to write. Because chapter 2 section 4b says: "Adding a rule with
executable privileges that either is M-mode-only or a locked Shared-Region
is not possible and such pmpcfg writes are ignored, leaving pmpcfg
unchanged". This checking is implemented as that switch-case
statement, based on table 2.1 truth table.


Alvin Chang


>

> I think the best bet here is to create a helper function that takes a
pmpcfg

> value and returns if it is M-mode only. Then we should check if the
current

> pmp_index is M-mode only OR if we are adding one and then reject that.

>

> Does that make sense?

>

> Alistair

>

> > +                /*

> > +                 * Convert the PMP permissions to match the truth

> table in the

> > +                 * Smepmp spec.

> > +                 */

> > +                const uint8_t smepmp_operation =3D

> > +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) <<

> 2) |

> > +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);

> > +

> > +                switch (smepmp_operation) {

> > +                case 0 ... 8:

> >                      locked =3D false;

> > -                }

> > -                /* shared region and not adding X bit */

> > -                if ((val & PMP_LOCK) !=3D PMP_LOCK &&

> > -                    (val & 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {

> > +                    break;

> > +                case 9 ... 11:

> > +                    break;

> > +                case 12:

> > +                    locked =3D false;

> > +                    break;

> > +                case 13:

> > +                    break;

> > +                case 14:

> > +                case 15:

> >                      locked =3D false;

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

--0000000000001f5868060bd0bd2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><a name=3D"_MailOriginal" style=3D=
"font-size:12pt"><span lang=3D"EN-US">&gt; -----Original
Message-----</span></a></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; From: Alistair Francis &l=
t;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;</spa=
n></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Sent: Wednesday, December=
 6, 2023 11:39 AM</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; To: Alvin Che-Chia Chang(=
</span><span style=3D"font-family:=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94,seri=
f">=E5=BC=B5=E5=93=B2=E5=98=89</span><span lang=3D"EN-US">)
&lt;<a href=3D"mailto:alvinga@andestech.com">alvinga@andestech.com</a>&gt;<=
/span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Cc: <a href=3D"mailto:qem=
u-riscv@nongnu.org">qemu-riscv@nongnu.org</a>; <a href=3D"mailto:qemu-devel=
@nongnu.org">qemu-devel@nongnu.org</a>;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; <a href=3D"mailto:alistai=
r.francis@wdc.com">alistair.francis@wdc.com</a>; <a href=3D"mailto:liweiwei=
@iscas.ac.cn">liweiwei@iscas.ac.cn</a></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Subject: Re: [PATCH v5] t=
arget/riscv: update checks on writing
pmpcfg for</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Smepmp to version 1.0</sp=
an></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; On Tue, Nov 14, 2023 at 1=
2:24</span><span lang=3D"EN-US" style=3D"font-family:&quot;Times New Roman&=
quot;,serif">=E2=80=AF</span><span lang=3D"EN-US">PM Alvin Chang via &lt;</=
span><a href=3D"mailto:qemu-devel@nongnu.org"><span lang=3D"EN-US" style=3D=
"color:windowtext;text-decoration-line:none">qemu-devel@nongnu.org</span></=
a><span lang=3D"EN-US">&gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; wrote:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Current checks on wr=
iting pmpcfg for Smepmp follows Smepmp
version</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 0.9.1. However, Smep=
mp specification has already been
ratified, and</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; there are some diffe=
rences between version 0.9.1 and 1.0.
In this</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; commit we update the=
 checks of writing pmpcfg to follow
Smepmp version</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 1.0.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; When mseccfg.MML is =
set, the constraints to modify PMP
rules are:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 1. Locked rules cann=
ot be removed or modified until a PMP
reset, unless</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 ms=
eccfg.RLB is
set.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 2. From Smepmp speci=
fication version 1.0, chapter 2
section 4b:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 Ad=
ding a rule
with executable privileges that either is M-mode-only</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 or=
 a locked
Shared-Region is not possible and such pmpcfg writes are</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 ig=
nored, leaving
pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; The commit transfers=
 the value of pmpcfg into the index of
the Smepmp</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; truth table, and che=
cks the rules by aforementioned
specification</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; changes.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Signed-off-by: Alvin=
 Chang &lt;</span><a href=3D"mailto:alvinga@andestech.com"><span lang=3D"EN=
-US" style=3D"color:windowtext;text-decoration-line:none">alvinga@andestech=
.com</span></a><span lang=3D"EN-US">&gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; ---</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v4: Reb=
ase on master.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v3: Mod=
ify &quot;epmp_operation&quot; to
&quot;smepmp_operation&quot;.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v2: Ado=
pt switch case ranges and numerical
order.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v1: Con=
vert ePMP over to Smepmp.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0 target/riscv/p=
mp.c
| 40 ++++++++++++++++++++++++++++++++--------</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0 1 file changed=
, 32
insertions(+), 8 deletions(-)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; diff --git a/target/=
riscv/pmp.c b/target/riscv/pmp.c index</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 162e88a90a..40695140=
69 100644</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; --- a/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +++ b/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; @@ -102,16 +102,40 @=
@ static bool
pmp_write_cfg(CPURISCVState *env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; uint32_t pmp_index, uint8=
_t val)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
mseccfg.MML is set */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if
(MSECCFG_MML_ISSET(env)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
not adding execute bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if
((val &amp; PMP_LOCK) !=3D 0 &amp;&amp; (val &amp; PMP_EXEC) !=3D</span></p=
>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; PMP_EXEC) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
mseccfg.MML is set. Locked rules cannot be removed or</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; modified</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
until a PMP reset. Besides, from Smepmp specification</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; version 1.0</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ,
chapter 2 section 4b says:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
Adding a rule with executable privileges that either is</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
M-mode-only or a locked Shared-Region is not possible</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; and such</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
pmpcfg writes are ignored, leaving pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if
(MSECCFG_MML_ISSET(env) &amp;&amp; !pmp_is_locked(env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; + pmp_index)) {</spa=
n></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; This is tricky and took m=
e a while to get my head around.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; From what I can tell, the=
re is a bug in the spec.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; The spec specifically sta=
tes that:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &quot;&quot;&quot;</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; The meaning of pmpcfg.L c=
hanges: Instead of marking a rule as
locked and</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; enforced in all modes, it=
 now marks a rule as M-mode-only when
set and</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; S/U-mode-only when unset.=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &quot;&quot;&quot;</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; So the check for !pmp_is_=
locked() sounds correct.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; But then they add:</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &quot;&quot;&quot;</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; The formerly reserved enc=
oding of pmpcfg.RW=3D01, and the
encoding</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; pmpcfg.LRWX=3D1111, now e=
ncode a Shared-Region.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &quot;&quot;&quot;</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Which contradicts what th=
ey just said.</span></p><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm=
;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US"><br></=
span></p><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt=
;font-family:Calibri,sans-serif"><span lang=3D"EN-US">Yes you are right, it=
 seems there are some misleading words.</span></p><p class=3D"gmail-MsoPlai=
nText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US"><br></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; I *think* we want to igno=
re the locked bit here. We don&#39;t
actually care if it&#39;s</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; already set, instead we c=
are if the region is an M-mode only
region from the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 2.1 table</span></p><p cl=
ass=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:C=
alibri,sans-serif"><br></p><p class=3D"gmail-MsoPlainText" style=3D"margin:=
0cm;font-size:12pt;font-family:Calibri,sans-serif">The check for !pmp_is_lo=
cked() is because spec says (below table 2.1):<br></p><p class=3D"gmail-Mso=
PlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f">&quot;*Locked rules cannot be removed or modified until a PMP reset, unl=
ess mseccfg.RLB is set.&quot;<br></p><p class=3D"gmail-MsoPlainText" style=
=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">It is not rel=
ated to M-mode-only or S/U-mode-only or Shared-Region.</p><p class=3D"gmail=
-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-=
serif"><br></p><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-siz=
e:12pt;font-family:Calibri,sans-serif"><span style=3D"font-size:12pt">In ot=
her words, a pmpcfg where the pmpcfg.L bit was set can not be configured an=
ymore. Therefore, I think we should not ignore it here, since we are trying=
 to write a new value into the pmpcfg. If we ignore it, the locked pmpcfg w=
ill be modified and it would=C2=A0violate the spec.</span></p><p class=3D"g=
mail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,s=
ans-serif"><span style=3D"font-size:12pt"><br></span></p><p class=3D"gmail-=
MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-s=
erif"><span style=3D"font-size:12pt">If the pmpcfg was not locked, we also =
need to check the new value that the user wants to write. Because=C2=A0</sp=
an><span style=3D"font-size:12pt">chapter 2 section 4b says: &quot;</span><=
span style=3D"font-size:12pt">Adding a rule with executable privileges that=
 either is M-mode-only</span><span style=3D"font-size:12pt">=C2=A0or a lock=
ed Shared-Region is not possible and such pmpcfg writes are=C2=A0</span><sp=
an style=3D"font-size:12pt">ignored, leaving pmpcfg unchanged&quot;. This c=
hecking is implemented as that switch-case statement,=C2=A0based on table 2=
.1 truth table.</span></p><p class=3D"gmail-MsoPlainText" style=3D"margin:0=
cm;font-size:12pt;font-family:Calibri,sans-serif"><br></p><p class=3D"gmail=
-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-=
serif"><span lang=3D"EN-US">Alvin Chang</span></p><p class=3D"gmail-MsoPlai=
nText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainText" style=3D=
"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN=
-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; I think the best bet here=
 is to create a helper function that
takes a pmpcfg</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; value and returns if it i=
s M-mode only. Then we should check if
the current</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; pmp_index is M-mode only =
OR if we are adding one and then
reject that.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Does that make sense?</sp=
an></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Alistair</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *
Convert the PMP permissions to match the truth</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; table in the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *
Smepmp spec.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
const uint8_t smepmp_operation =3D</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
((val &amp; PMP_LOCK) &gt;&gt; 4) | ((val &amp; PMP_READ) &lt;&lt;</span></=
p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 2) |</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
(val &amp; PMP_WRITE) | ((val &amp; PMP_EXEC) &gt;&gt; 2);</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
switch (smepmp_operation) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 0 ... 8:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<=
/span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
shared region and not adding X bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if
((val &amp; PMP_LOCK) !=3D PMP_LOCK &amp;&amp;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
(val &amp; 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 9 ... 11:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 12:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 13:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 14:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
case 15:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
default:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
g_assert_not_reached();</span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span><span lang=3D"=
EN-US"></span></p></div>

--0000000000001f5868060bd0bd2f--

