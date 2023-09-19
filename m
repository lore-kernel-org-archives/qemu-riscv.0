Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D4FCD343B
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 05:09:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiSz5-0003Al-80; Tue, 19 Sep 2023 01:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qiSz0-0003AE-K7; Tue, 19 Sep 2023 01:09:10 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qiSyy-0001wn-IW; Tue, 19 Sep 2023 01:09:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-274cfc9b049so1277528a91.2; 
 Mon, 18 Sep 2023 22:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695100137; x=1695704937; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=loIVq2R1ohOTI//Aj7mKsJ8pbf5xwoFocsK6nZ+yuqs=;
 b=V6CiaXHWWpJOqOkmTgS8P1JQajELRctD/OpWYRi4xSSUeGvlML8yb2A9bSPIJpYMaQ
 0NkrvR3qGdgIU3Hvh1Tpcao8slb+550VwZtH6wPC1zs/Q3KASp28OqCNxXNkuSytpXIq
 gVLF6b1TUSLCYIyCtSJu8dtosMBx3GLyYA0eAMvFzFgVKzpE1P1e5Q5LXXaKf4BJey8W
 BfWBh8sInJMXr/MmATbS6wsFMxqe5R0/vu73o91M0kferzanrq2JkxD9UL47uVmunkSQ
 fK3ky18I6gO+3mZH1A6kchj9/QXDuk4omtMrzoG4eaQPPGULILXWEQEkCkEn1eA1UDeZ
 1blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695100137; x=1695704937;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=loIVq2R1ohOTI//Aj7mKsJ8pbf5xwoFocsK6nZ+yuqs=;
 b=pRz/CyZIbRNt/99SAhhDthvf6rsaeZYDrst9vfM7Ud6K7Pd0usbps4cSNcCI927o1n
 /AGPjc4ZcgJzTrDJdKy9jT+59Xx1usQtq9ZEt2APoZF1T90AXwd21weECkHYqSyzMc5I
 0egIeh/jJYzVCkAsrQM8MrCIbjdkSz4v3FJ0YeP06tEjo4iAkK2vgUpa9jf3Nvw+yfdj
 A7WBTeZSVEuDAtzRfPOHpaiMeFIcGoTuOgkobbSy6FfUsinWCVSoTVYCyKoriVdR6Dx0
 3ugUu61wSEroZ0J/HP4E1zrA+a1001leKjsXuZeFgK/68bT9PvRCvCG96YVcn6t6kPMw
 lviw==
X-Gm-Message-State: AOJu0Yz26qt6v+Ch2fWzBhLfVNPaWEDgZ2mWOAEV9P+1b624RNVMtd/Y
 L3LmHXWTrfuBJ/2WU5sM8u6TEXPFZhOffeDxABs=
X-Google-Smtp-Source: AGHT+IE+JiQKt/L/c5YXERd3/453FkEJkyp5K/rTLg2X8iEf+GduIEexYklODBZ/jg2PVpSOtqFV2QWC9F6+5XHbrOY=
X-Received: by 2002:a17:90a:d806:b0:273:e689:8dfc with SMTP id
 a6-20020a17090ad80600b00273e6898dfcmr8472019pjv.32.1695100136832; Mon, 18 Sep
 2023 22:08:56 -0700 (PDT)
MIME-Version: 1.0
From: Chang Alvin <vivahavey@gmail.com>
Date: Tue, 19 Sep 2023 13:08:45 +0800
Message-ID: <CAEV2DRqFS+UvqvgrW=6R=ahj+akKcmvH3MtAarJ70RphARMNdQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg for
 Smepmp
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/alternative; boundary="00000000000083c4530605af4142"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=vivahavey@gmail.com; helo=mail-pj1-x1029.google.com
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

--00000000000083c4530605af4142
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > -----Original Message-----

> From: Alistair Francis <alistair23@gmail.com>

> Sent: Tuesday, September 19, 2023 12:42 PM

> To: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andestech.=
com>

> Cc: qemu-riscv@nongnu.org; qemu-devel@nongnu.org;

> alistair.francis@wdc.com; ajones@ventanamicro.com

> Subject: Re: [PATCH v3] target/riscv: update checks on writing pmpcfg for

> Smepmp to version 1.0

>

> On Fri, Sep 15, 2023 at 6:32=E2=80=AFPM Alvin Chang <alvinga@andestech.co=
m> wrote:

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

> > Changes from v2: Adopt switch case ranges and numerical order.

> >

> > Changes from v1: Convert ePMP over to Smepmp.

>

> Did this part get lost?

>

> Alistair

>


Sorry, do you mean that the term "ePMP" should be changed to "Smepmp" in
source code?


Alvin Chang


> >

> >  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------

> >  1 file changed, 32 insertions(+), 8 deletions(-)

> >

> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index

> > a08cd95658..b144932b3b 100644

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

> > +                 * ePMP spec.

> > +                 */

> > +                const uint8_t epmp_operation =3D

> > +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) <<

> 2) |

> > +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);

> > +

> > +                switch (epmp_operation) {

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

--00000000000083c4530605af4142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">=C2=A0</span>=
<a name=3D"_MailOriginal" style=3D"font-size:12pt"><span lang=3D"EN-US">&gt=
; -----Original
Message-----</span></a></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; From: Alistair Francis &l=
t;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;</spa=
n></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Sent: Tuesday, September =
19, 2023 12:42 PM</span></p>

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
r.francis@wdc.com">alistair.francis@wdc.com</a>; <a href=3D"mailto:ajones@v=
entanamicro.com">ajones@ventanamicro.com</a></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Subject: Re: [PATCH v3] t=
arget/riscv: update checks on writing
pmpcfg for</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Smepmp to version 1.0</sp=
an></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; On Fri, Sep 15, 2023 at 6=
:32</span><span lang=3D"EN-US" style=3D"font-family:&quot;Times New Roman&q=
uot;,serif">=E2=80=AF</span><span lang=3D"EN-US">PM Alvin Chang &lt;</span>=
<a href=3D"mailto:alvinga@andestech.com"><span lang=3D"EN-US" style=3D"colo=
r:windowtext;text-decoration-line:none">alvinga@andestech.com</span></a><sp=
an lang=3D"EN-US">&gt; wrote:</span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v2: Ado=
pt switch case ranges and numerical
order.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v1: Con=
vert ePMP over to Smepmp.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Did this part get lost?</=
span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Alistair</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p><p class=3D"gm=
ail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTex=
t" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span=
 lang=3D"EN-US">Sorry, do you mean that=C2=A0the term &quot;ePMP&quot; shou=
ld be changed to &quot;Smepmp&quot; in source code?</span></p><p class=3D"g=
mail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,s=
ans-serif"><span lang=3D"EN-US"><br></span></p><p class=3D"gmail-MsoPlainTe=
xt" style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><spa=
n lang=3D"EN-US">Alvin Chang</span></p><p class=3D"gmail-MsoPlainText" styl=
e=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US"><br></span></p>

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
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; a08cd95658..b144932b=
3b 100644</span></p>

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
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *
Convert the PMP permissions to match the truth</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; table in the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *
ePMP spec.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
const uint8_t epmp_operation =3D</span></p>

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
switch (epmp_operation) {</span></p>

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

--00000000000083c4530605af4142--

