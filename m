Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D92C00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv5i1-0008FB-BW; Mon, 23 Oct 2023 20:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qv5hx-0008EP-T2; Mon, 23 Oct 2023 20:55:47 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qv5hv-0000Zt-Px; Mon, 23 Oct 2023 20:55:45 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-27d1aee5aa1so2851701a91.0; 
 Mon, 23 Oct 2023 17:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698108941; x=1698713741; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HV5+lPbKKtckfQ0a5BPWFgFxZVTQ5lKqDjaGe+bmBv8=;
 b=TTz4vyRM7ADLRXlXBIpy0FMlQrIXKtlBFSv5cB/c+C94XT7NR9fCvFhvl1Wbpgjwax
 /CV7CQEh+K5NeWOgzSMatt3yWbbW6I3gmLwuwLLQOqEPnnxa2InnTN4GEfr5t+C8Dnsm
 zAFVYuB3MEm7C6+D4xsYpw1B3IAHSR5NufqBmF0cTBgCiYBJ+v6yUNiBq0DZqMF+crwM
 vCKaCUbqd+xiMi7zzCZdY8xC1mm+Q6KsyLqTA2hVxGwciLyxdwTlNcu1xpKlgE0trMHc
 Q3KcZeBalY2yraL6cEQYFdpBoCWycDKWWs+NDMQpd727PFKCD5kMaaOgBLwSSnqNXxYP
 797Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698108941; x=1698713741;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HV5+lPbKKtckfQ0a5BPWFgFxZVTQ5lKqDjaGe+bmBv8=;
 b=GdlfNHadektMs8Vs2EgnrdIcPON8TxYZ8R0xFlQVkPiOifakxxhQFnWCWf6jvgkQ8L
 GKpP4CZwFGatuBTlB9XCx9xYHbkfBqEzd1wflniyhjF+ui4OZm57LsUNjp8F2lTkHBZW
 OnhS9cK+/M3DvMHARNG6NKOFLXTU+mTHuQJbsDdhtaSSaTRO7rvBnTtlhrsU9Rdoe48+
 8lAc8MkP7yH38WDQ4PB488nbaIqIvtFmBuirefCToLMlZFV/DOKdAEoKWUknhfcMBrCI
 nkdj/ibdd/LNj0n3O5QlCr7CDl+fioNtj1aY6F7jG3OcezWpE/soH+39XX34l1VFuNKC
 bDSA==
X-Gm-Message-State: AOJu0Yzdr1xYZ1k6FFTYazgAKylRweytJfGA7QLPCUcmIUf0RNaEazFa
 LS5Ik2gFD06qku/gy+9NXfd5DMp0nNa4/oZddbk=
X-Google-Smtp-Source: AGHT+IFXKHNpWPwQkQ/OLQdwmIJ3dYu3ssZlFTqJ+jMMUYjCJXxAZRT7ljIpmIE1PIFoifZrYZ8Hl3/yKqgbU/P4c2k=
X-Received: by 2002:a17:90b:4f82:b0:274:77b3:64d0 with SMTP id
 qe2-20020a17090b4f8200b0027477b364d0mr18336160pjb.17.1698108940889; Mon, 23
 Oct 2023 17:55:40 -0700 (PDT)
MIME-Version: 1.0
From: Chang Alvin <vivahavey@gmail.com>
Date: Tue, 24 Oct 2023 08:55:30 +0800
Message-ID: <CAEV2DRq5i_jQuCv1-L99ru3+0HdOrKBp7B1hk0TKsazEs7k98g@mail.gmail.com>
Subject: RE: [PATCH v4] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com
Content-Type: multipart/alternative; boundary="00000000000036324c06086bcc75"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=vivahavey@gmail.com; helo=mail-pj1-x1031.google.com
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

--00000000000036324c06086bcc75
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


I saw patches from Mayuresh were merged into riscv-to-apply.next yesterday.

Would you also take a look at this patch?

Thanks!


Alvin Chang


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

--00000000000036324c06086bcc75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,=
sans-serif"><span lang=3D"EN-US" style=3D"font-size:12pt">&gt; On Mon, Sep =
25, 2023 at 2:11</span><span lang=3D"EN-US" style=3D"font-size:12pt;font-fa=
mily:&quot;Times New Roman&quot;,serif">=E2=80=AF</span><span lang=3D"EN-US=
" style=3D"font-size:12pt">AM Alvin Chang &lt;</span><a href=3D"mailto:alvi=
nga@andestech.com" target=3D"_blank" style=3D"font-size:12pt"><span lang=3D=
"EN-US" style=3D"color:windowtext;text-decoration-line:none">alvinga@andest=
ech.com</span></a><span lang=3D"EN-US" style=3D"font-size:12pt">&gt;</span>=
<br></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">&gt; wrote:</span></p><p style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</sp=
an></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif=
"><span lang=3D"EN-US">&gt; &gt; Current checks on writing pmpcfg for Smepm=
p follows Smepmp version</span></p><p style=3D"margin:0cm;font-size:12pt;fo=
nt-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 0.9.1. However=
, Smepmp specification has already been ratified, and</span></p><p style=3D=
"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN=
-US">&gt; &gt; there are some differences between version 0.9.1 and 1.0. In=
 this</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,s=
ans-serif"><span lang=3D"EN-US">&gt; &gt; commit we update the checks of wr=
iting pmpcfg to follow Smepmp version</span></p><p style=3D"margin:0cm;font=
-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 1=
.0.</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,san=
s-serif"><span lang=3D"EN-US">&gt; &gt;</span></p><p style=3D"margin:0cm;fo=
nt-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=
 When mseccfg.MML is set, the constraints to modify PMP rules are:</span></=
p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><sp=
an lang=3D"EN-US">&gt; &gt; 1. Locked rules cannot be removed or modified u=
ntil a PMP reset, unless</span></p><p style=3D"margin:0cm;font-size:12pt;fo=
nt-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=
=A0 mseccfg.RLB is set.</span></p><p style=3D"margin:0cm;font-size:12pt;fon=
t-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 2. From Smepmp =
specification version 1.0, chapter 2 section 4b:</span></p><p style=3D"marg=
in:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">=
&gt; &gt;=C2=A0=C2=A0=C2=A0 Adding a rule with executable privileges that e=
ither is M-mode-only</span></p><p style=3D"margin:0cm;font-size:12pt;font-f=
amily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0 =
or a locked Shared-Region is not possible and such pmpcfg writes are</span>=
</p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0 =C2=A0ignored, leaving pmpcfg unc=
hanged.</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri=
,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p><p style=3D"margin:0c=
m;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; =
&gt; The commit transfers the value of pmpcfg into the index of the Smepmp<=
/span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-se=
rif"><span lang=3D"EN-US">&gt; &gt; truth table, and checks the rules by af=
orementioned specification</span></p><p style=3D"margin:0cm;font-size:12pt;=
font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; changes.</sp=
an></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif=
"><span lang=3D"EN-US">&gt; &gt;</span></p><p style=3D"margin:0cm;font-size=
:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Signed=
-off-by: Alvin Chang &lt;</span><a href=3D"mailto:alvinga@andestech.com" ta=
rget=3D"_blank"><span lang=3D"EN-US" style=3D"color:windowtext;text-decorat=
ion-line:none">alvinga@andestech.com</span></a><span lang=3D"EN-US">&gt;</s=
pan></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">&gt; &gt; ---</span></p><p style=3D"margin:0cm;font=
-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; C=
hanges from v3: Modify &quot;epmp_operation&quot; to &quot;smepmp_operation=
&quot;.</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri=
,sans-serif"><span lang=3D"EN-US">&gt;</span></p><p style=3D"margin:0cm;fon=
t-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; This =
has the same issue as all the previous versions.</span></p><p style=3D"marg=
in:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">=
&gt;</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US">&gt; QEMU is currently not shipping with Sme=
pmp support. So updating some of the</span></p><p style=3D"margin:0cm;font-=
size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; code to=
 support Smepmp is confusing.</span></p><p style=3D"margin:0cm;font-size:12=
pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt;</span></p><p s=
tyle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lan=
g=3D"EN-US">&gt; As I pointed out for the v3, we currently only support ePM=
P 0.9.3. So that is</span></p><p style=3D"margin:0cm;font-size:12pt;font-fa=
mily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; what the code must work =
with.</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,s=
ans-serif"><span lang=3D"EN-US">&gt;</span></p><p style=3D"margin:0cm;font-=
size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; In orde=
r for this change to go in, we also need to upgrade QEMU to support</span><=
/p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><s=
pan lang=3D"EN-US">&gt; Smepmp 1.0.</span></p><p style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt;</span></=
p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><sp=
an lang=3D"EN-US">&gt; This patch is an attempt to do that:</span></p><p st=
yle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt;=C2=A0</span><a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg967676.html" target=3D"_blank"><span lang=3D"EN-US" style=
=3D"color:windowtext;text-decoration-line:none">https://www.mail-archive.co=
m/qemu-devel@nongnu.org/msg967676.html</span></a><span lang=3D"EN-US"></spa=
n></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"=
><span lang=3D"EN-US">&gt;</span></p><p style=3D"margin:0cm;font-size:12pt;=
font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; You basically nee=
d to combine the changes from</span></p><p style=3D"margin:0cm;font-size:12=
pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0</span><a=
 href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg967676.html"=
 target=3D"_blank"><span lang=3D"EN-US" style=3D"color:windowtext;text-deco=
ration-line:none">https://www.mail-archive.com/qemu-devel@nongnu.org/msg967=
676.html</span></a><span lang=3D"EN-US">=C2=A0into</span></p><p style=3D"ma=
rgin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US=
">&gt; this patch. So there is a single patch that updates to Smepmp.</span=
></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">=
<span lang=3D"EN-US">&gt;</span></p><p style=3D"margin:0cm;font-size:12pt;f=
ont-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Alistair</span></p=
><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><spa=
n lang=3D"EN-US">&gt;</span></p><p style=3D"margin:0cm;font-size:12pt;font-=
family:Calibri,sans-serif"><span lang=3D"EN-US"><br></span></p><p style=3D"=
margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-=
US">Hi Alistair,</span></p><p style=3D"margin:0cm;font-size:12pt;font-famil=
y:Calibri,sans-serif"><span lang=3D"EN-US"><br></span></p><p style=3D"margi=
n:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">I=
 saw patches from Mayuresh were merged into riscv-to-apply.next yesterday.<=
/span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-se=
rif">Would you also take a look at this patch?</p><p style=3D"margin:0cm;fo=
nt-size:12pt;font-family:Calibri,sans-serif">Thanks!</p><p style=3D"margin:=
0cm;font-size:12pt;font-family:Calibri,sans-serif"><br></p><p style=3D"marg=
in:0cm;font-size:12pt;font-family:Calibri,sans-serif">Alvin Chang</p><p sty=
le=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><br></p><p =
style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span la=
ng=3D"EN-US">&gt; &gt;</span></p><p style=3D"margin:0cm;font-size:12pt;font=
-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v2:=
 Adopt switch case ranges and numerical order.</span></p><p style=3D"margin=
:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&g=
t; &gt;</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri=
,sans-serif"><span lang=3D"EN-US">&gt; &gt; Changes from v1: Convert ePMP o=
ver to Smepmp.</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:=
Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p><p style=3D"ma=
rgin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US=
">&gt; &gt;=C2=A0 target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++-=
-------</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri=
,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0 1 file changed, 32 insert=
ions(+), 8 deletions(-)</span></p><p style=3D"margin:0cm;font-size:12pt;fon=
t-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span></p><p st=
yle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt; &gt; diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c i=
ndex</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sa=
ns-serif"><span lang=3D"EN-US">&gt; &gt; a08cd95658..2ebf18c941 100644</spa=
n></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"=
><span lang=3D"EN-US">&gt; &gt; --- a/target/riscv/pmp.c</span></p><p style=
=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D=
"EN-US">&gt; &gt; +++ b/target/riscv/pmp.c</span></p><p style=3D"margin:0cm=
;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &=
gt; @@ -99,16 +99,40 @@ static void pmp_write_cfg(CPURISCVState *env,</span=
></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">=
<span lang=3D"EN-US">&gt; uint32_t pmp_index, uint8_t val)</span></p><p sty=
le=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></=
p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><sp=
an lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p><p style=3D"margin:0cm;font-size=
:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</span>=
</p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* mseccfg.MML is set */</span></p><p style=3D"mar=
gin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US"=
>&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (MSECCFG_MML_ISSET(env)) {</span></p><p style=3D"margin:0cm;font-siz=
e:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* not adding execute bit */</span></p><p style=3D"margin:0cm;=
font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &g=
t; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ((val &amp; PMP_LOCK) !=3D 0 &amp;&amp; (val &amp;=
 PMP_EXEC) !=3D</span></p><p style=3D"margin:0cm;font-size:12pt;font-family=
:Calibri,sans-serif"><span lang=3D"EN-US">&gt; PMP_EXEC) {</span></p><p sty=
le=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /*</span></p><p style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mseccfg.MML is set=
. Locked rules cannot be removed or</span></p><p style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; modified=
</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-s=
erif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * until a PMP reset. Besides, from Sme=
pmp specification</span></p><p style=3D"margin:0cm;font-size:12pt;font-fami=
ly:Calibri,sans-serif"><span lang=3D"EN-US">&gt; version 1.0</span></p><p s=
tyle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lan=
g=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * , chapter 2 section 4b says:</span></p><p style=3D"=
margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-=
US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 * Adding a rule with executable privileges that either is</spa=
n></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"=
><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * M-mode-only or a locked Shared-Region is n=
ot possible</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Cal=
ibri,sans-serif"><span lang=3D"EN-US">&gt; and such</span></p><p style=3D"m=
argin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-U=
S">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 * pmpcfg writes are ignored, leaving pmpcfg unchanged.</span><=
/p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><s=
pan lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</span></p><p style=3D"margin:0cm;font-size:1=
2pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSECCFG_MM=
L_ISSET(env) &amp;&amp; !pmp_is_locked(env,</span></p><p style=3D"margin:0c=
m;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; =
pmp_index)) {</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:C=
alibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</span=
></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif">=
<span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* Convert the PMP pe=
rmissions to match the truth</span></p><p style=3D"margin:0cm;font-size:12p=
t;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; table in the</s=
pan></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Smepmp spec.</s=
pan></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</span></p><p s=
tyle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lan=
g=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const uint8_t smepmp_operation =3D<=
/span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-se=
rif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((val &amp; PMP_LOCK) &gt;&gt; 4) | ((val &amp; PMP_READ) &lt;&lt;</spa=
n></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"=
><span lang=3D"EN-US">&gt; 2) |</span></p><p style=3D"margin:0cm;font-size:=
12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(val &amp; PMP_WRITE) | ((val &amp; PMP=
_EXEC) &gt;&gt; 2);</span></p><p style=3D"margin:0cm;font-size:12pt;font-fa=
mily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +</span></p><p styl=
e=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (smepmp_operation) {</span><=
/p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><s=
pan lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0 ... 8:</span></p><p st=
yle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=
=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo=
cked =3D false;</span></p><p style=3D"margin:0cm;font-size:12pt;font-family=
:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</sp=
an></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif=
"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* shared region and no=
t adding X bit */</span></p><p style=3D"margin:0cm;font-size:12pt;font-fami=
ly:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; -=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ((val &amp; PMP_LOCK) !=3D PMP_LOCK &amp;&amp;</span></p><p style=3D"margi=
n:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&=
gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (val &amp; 0x7) !=3D (P=
MP_WRITE | PMP_EXEC)) {</span></p><p style=3D"margin:0cm;font-size:12pt;fon=
t-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</span></p><p style=3D"margin:0cm;font-si=
ze:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 case 9 ... 11:</span></p><p style=3D"margin:0cm;font-size:12pt=
;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</span></p><p style=3D"margin:0cm;font=
-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 case 12:</span></p><p style=3D"margin:0cm;font-size:12pt;fo=
nt-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p><p style=3D"margin:=
0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt=
; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</span></p><p style=
=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D=
"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 13:</span></p><p style=3D"margin:=
0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt=
; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</span></p><p style=
=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D=
"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 14:</span></p><p style=3D"margin:=
0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt=
; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 case 15:</span></p><p style=3D"margin:0cm;font-siz=
e:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p><=
p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span =
lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;</s=
pan></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-seri=
f"><span lang=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:</span></p><p s=
tyle=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><span lan=
g=3D"EN-US">&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_assert_no=
t_reached();</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Ca=
libri,sans-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans=
-serif"><span lang=3D"EN-US">&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p><p style=3D"margin:0=
cm;font-size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=
 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</span>=
</p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-serif"><=
span lang=3D"EN-US">&gt; &gt; --</span></p><p style=3D"margin:0cm;font-size=
:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt; 2.34.1=
</span></p><p style=3D"margin:0cm;font-size:12pt;font-family:Calibri,sans-s=
erif"><span lang=3D"EN-US">&gt; &gt;</span></p><p style=3D"margin:0cm;font-=
size:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">&gt; &gt;</s=
pan></p></div>

--00000000000036324c06086bcc75--

