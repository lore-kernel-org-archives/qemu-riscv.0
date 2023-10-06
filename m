Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFCDE92FCF
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 01:13:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qoZOl-0007He-AV; Thu, 05 Oct 2023 21:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qoZOj-0007Fo-69; Thu, 05 Oct 2023 21:12:57 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qoZOc-0000YJ-Mi; Thu, 05 Oct 2023 21:12:56 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3af608eb34bso1015186b6e.1; 
 Thu, 05 Oct 2023 18:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696554768; x=1697159568; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DZf2XzojIROwNHEpJwTrAE99W6mSgs7eao52uT4WHY0=;
 b=SFuuyLsy9/7kuE3bZC5aSg4eLCuymGFB6P1Qc3ZQiATM6OnPzNUoB04+zeHcHHeJWj
 AnzfZQZyp4f0+gYU72uINlB5+x4WoaNqkbwe+Wzm4cKaMFBIfGuF+B1SSF2aciyy4QXK
 2BA7eb2TX7aIgxM3bu8/Uv6YRLwpmxW310tFnuQJ0wOGf/rCvQPaKThV/LzrDSPT58Hq
 c3mI6A11tjz4Ashdj253Kut1mBCZArVw0b5Vsuffbkvua1VLj+RA0uyLUhKZg39Lz2G6
 x7GL3eKLtR6o2DEydcK1VhlRwMjEBBn7bkLzpRpqbn+7uTdzXslh4idBiVALUEkvpOAZ
 3B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696554768; x=1697159568;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZf2XzojIROwNHEpJwTrAE99W6mSgs7eao52uT4WHY0=;
 b=OsFJuOSh0SjJ4ZM0J/1DfRn5PiUsQTwwxEraLK8RY44zIu96UHWsau52xtieX3xtXi
 E3d7lmHGjJ6X7lTNZOYgeKzD6EBFzlBXzCp2ib+vd+demYbIawwkqoNAGqFBE68Ghp+/
 hU/sufFEds8Hq/YrALUQGsmxWoCoiZdGol8YIdbik6Yyk8wVryI660j6lt/DqpnZ0ZKm
 QtWM9S43IhssWy3/aWcB21cg/yyUwoaDLQtwa/60lUqwnUkuk7LZO7CpiaQtjVdzILsd
 g0zZJY2JOKXImUZ8BAzMNDaGh417ocBfNL0VkpRbNChobzvIIMCM5gg61cTP0rE6oshW
 PFcQ==
X-Gm-Message-State: AOJu0Yy6SO9D/PiaXxRVMu6EYNzLsdqYuvn1XGL15DThIdd2Q6n1DQdc
 J6mcsVxwBAVj4HX+wzZKxD6Rva5jKQPsKtwEpSc=
X-Google-Smtp-Source: AGHT+IH+mNdK/iuCFUjZodZq/Rz1jcZqXl0VttHdohc95QeSNGLec00twQMGrsoSzNgNT23c8+aBME+j4iMtAu9yn+4=
X-Received: by 2002:a05:6358:885:b0:143:91a2:8e0a with SMTP id
 m5-20020a056358088500b0014391a28e0amr7307491rwj.4.1696554768362; Thu, 05 Oct
 2023 18:12:48 -0700 (PDT)
MIME-Version: 1.0
From: Chang Alvin <vivahavey@gmail.com>
Date: Fri, 6 Oct 2023 09:12:37 +0800
Message-ID: <CAEV2DRoEYc35sm0BCJ42XrBu11FSkWwoQxmdYcB49gsC1VX5QQ@mail.gmail.com>
Subject: RE: [PATCH v4] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Andrew Jones <ajones@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: multipart/alternative; boundary="0000000000004f7134060701f07f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=vivahavey@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000004f7134060701f07f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Mon, Sep 25, 2023 at 2:11=E2=80=AFAM Alvin Chang <alvinga@andestech.co=
m>

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

> > Changes from v3: Modify "epmp_operation" to "smepmp_operation".

>

> This has the same issue as all the previous versions.

>

> QEMU is currently not shipping with Smepmp support. So updating some of
the

> code to support Smepmp is confusing.

>

> As I pointed out for the v3, we currently only support ePMP 0.9.3. So
that is

> what the code must work with.

>

> In order for this change to go in, we also need to upgrade QEMU to suppor=
t

> Smepmp 1.0.

>

> This patch is an attempt to do that:

> https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html

>

> You basically need to combine the changes from

> https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html into

> this patch. So there is a single patch that updates to Smepmp.

>

> Alistair

>


Hi Alistair,


Mayuresh has sent that patch again recently:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg991428.html

Since the author is from Ventana, I would like to send my patch separately.

I think our patches can be merged/applied together.

Thanks!


Alvin


> >

> > Changes from v2: Adopt switch case ranges and numerical order.

> >

> > Changes from v1: Convert ePMP over to Smepmp.

> >

> >  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------

> >  1 file changed, 32 insertions(+), 8 deletions(-)

> >

> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index

> > a08cd95658..2ebf18c941 100644

> > --- a/target/riscv/pmp.c

> > +++ b/target/riscv/pmp.c

> > @@ -99,16 +99,40 @@ static void pmp_write_cfg(CPURISCVState *env,

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

> pmp_index)) {

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

--0000000000004f7134060701f07f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">=C2=A0</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US" style=3D"font-size:12pt">&gt; =
On Mon, Sep 25, 2023 at 2:11</span><span lang=3D"EN-US" style=3D"font-size:=
12pt;font-family:&quot;Times New Roman&quot;,serif">=E2=80=AF</span><span l=
ang=3D"EN-US" style=3D"font-size:12pt">AM Alvin Chang &lt;</span><a href=3D=
"mailto:alvinga@andestech.com" style=3D"font-size:12pt"><span lang=3D"EN-US=
" style=3D"color:windowtext;text-decoration-line:none">alvinga@andestech.co=
m</span></a><span lang=3D"EN-US" style=3D"font-size:12pt">&gt;</span><br></=
p>

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
ot be removed or modified until a PMP reset,
unless</span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0 =C2=A0ig=
nored, leaving pmpcfg unchanged.</span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v3: Mod=
ify &quot;epmp_operation&quot; to
&quot;smepmp_operation&quot;.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; This has the same issue a=
s all the previous versions.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; QEMU is currently not shi=
pping with Smepmp support. So updating
some of the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; code to support Smepmp is=
 confusing.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; As I pointed out for the =
v3, we currently only support ePMP
0.9.3. So that is</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; what the code must work w=
ith.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; In order for this change =
to go in, we also need to upgrade QEMU
to support</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Smepmp 1.0.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; This patch is an attempt =
to do that:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span><a href=3D"https:/=
/www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html"><span lang=3D"E=
N-US" style=3D"color:windowtext;text-decoration-line:none">https://www.mail=
-archive.com/qemu-devel@nongnu.org/msg967676.html</span></a><span lang=3D"E=
N-US"></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; You basically need to com=
bine the changes from</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span><a href=3D"https:/=
/www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html"><span lang=3D"E=
N-US" style=3D"color:windowtext;text-decoration-line:none">https://www.mail=
-archive.com/qemu-devel@nongnu.org/msg967676.html</span></a><span lang=3D"E=
N-US"> into</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; this patch. So there is a=
 single patch that updates to Smepmp.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Alistair</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTex=
t" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span=
 lang=3D"EN-US">Hi Alistair,</span></p><p class=3D"gmail-MsoPlainText" styl=
e=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainText" style=3D"margin:0=
cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">Mayu=
resh has sent that patch again recently:</span></p><p class=3D"gmail-MsoPla=
inText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">=
<span lang=3D"EN-US"><a href=3D"https://www.mail-archive.com/qemu-devel@non=
gnu.org/msg991428.html">https://www.mail-archive.com/qemu-devel@nongnu.org/=
msg991428.html</a></span></p><p class=3D"gmail-MsoPlainText" style=3D"margi=
n:0cm;font-size:12pt;font-family:Calibri,sans-serif">Since the author is fr=
om Ventana, I would like to send my patch separately.</p><p class=3D"gmail-=
MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-s=
erif">I think our patches can be merged/applied together.</p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif">Thanks!</p><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;fo=
nt-size:12pt;font-family:Calibri,sans-serif"><br></p><p class=3D"gmail-MsoP=
lainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif=
">Alvin</p><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12=
pt;font-family:Calibri,sans-serif"><br></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; a08cd95658..2ebf18c9=
41 100644</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; --- a/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +++ b/target/riscv/p=
mp.c</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; @@ -99,16 +99,40 @@ =
static void
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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; pmp_index)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0* Convert the PMP permissions to match the
truth</span></p>

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
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0(val &amp; PMP_WRITE) | ((val
&amp; PMP_EXEC) &gt;&gt; 2);</span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;</span></p>

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

--0000000000004f7134060701f07f--

