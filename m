Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9367C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 01:12:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAgSl-0000Mf-Lj; Tue, 05 Dec 2023 20:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1rAgSj-0000Ie-Le; Tue, 05 Dec 2023 20:12:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1rAgSh-0005Rb-FW; Tue, 05 Dec 2023 20:12:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-28647f4ebd9so4267543a91.3; 
 Tue, 05 Dec 2023 17:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701825143; x=1702429943; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5LVA5cuiOjLFoog+fIssZrpo7pzh/TQKcRxYcYMMapo=;
 b=DktUMuDKM4R91Iw9NbtGusAhaNUR2lhwnEzRfY2mY/NURUmrH7feswHJhjZK1RO8xi
 6ZqmaBIecx+sWl1suCwrbC8GSVdRL43G41Q/AVG7T253pz773sRKNQDHQ9WvLgsCA8lB
 wv/MH8tEOk9N4jXmQgWAvF7ChdLC4eDxXyibAmdxzlKH3ifIusai6YaG2nnv/puHjkum
 RIsnXFHJdb0P4icSz9xL/Pam36H41bDgkvQ+vpdmObpIWPvjblT4EvvBdx2BKPaPG+iJ
 09zWSTJUmzSOIuTd9AHstzLM7NfU1j4Yl9lcTKahQRbPcGcY4UgdHLj6bdk6ZT0gfmfZ
 RgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701825143; x=1702429943;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5LVA5cuiOjLFoog+fIssZrpo7pzh/TQKcRxYcYMMapo=;
 b=N/SIMHuYpkoxvxw9UmmqV2NWtUUHkXAWgNGli8RMrbrPuXlrdl2sPXAHeDedEVppcr
 J+P/NNfxLzRGLket5V/itSxBKBrrL2qUnROCBvkP8bj5qFCbVUKPvrliM3lgKkiA8vLm
 GuJ9v4VFdxAnY74crPvbS/H/mowY9L3lJJgEdiR2Ea6QRPsz5Bs0XYC69b6oaBrYsK4N
 4/+OK0r5aD8o7BopU4SPuZUj0QqjC/Vg8p6TyRPHDjoqrVLhTbg3VzRwk7OANja1f6X0
 zncZaITHPgpMIoLo3Q/oKLmvzxbCY/7tSJNeb7pP1IwZtymdK74YPJvV+T7MAJkygQjR
 SDKg==
X-Gm-Message-State: AOJu0YxGER4lzannFWtv1+1P029Qb979ZK4SiX/2lJ+O1EQUHz0inphA
 P/stMm+CZPWLPQUh3UA+2bfvu8Zv6IQ8F0L7rMCHH9GihyM=
X-Google-Smtp-Source: AGHT+IEjT1YwKW1CEVSSA0KrPeDdrPJ1NUsve8mDVtzClOUQqYb2nUZoMfUpd0CQZWjBVe0gfnLtCq8CeeRTREFoQc4=
X-Received: by 2002:a17:90b:3912:b0:286:8672:5199 with SMTP id
 ob18-20020a17090b391200b0028686725199mr109253pjb.35.1701825143259; Tue, 05
 Dec 2023 17:12:23 -0800 (PST)
MIME-Version: 1.0
From: Alvin Chang <vivahavey@gmail.com>
Date: Wed, 6 Dec 2023 09:12:12 +0800
Message-ID: <CAEV2DRr8HNQSM=kiv6+Rsaad28rw0eCaPrNeCpEaN8O5LOd5bg@mail.gmail.com>
Subject: RE: [PATCH v5] target/riscv: update checks on writing pmpcfg for
 Smepmp to version 1.0
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, Andrew Jones <ajones@ventanamicro.com>,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com
Content-Type: multipart/alternative; boundary="000000000000224769060bcd0bf5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=vivahavey@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000224769060bcd0bf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping for review.



> -----Original Message-----

> From: Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=E5=98=89) <alvinga@andestec=
h.com>

> Sent: Tuesday, November 14, 2023 10:23 AM

> To: qemu-riscv@nongnu.org; qemu-devel@nongnu.org

> Cc: alistair.francis@wdc.com; liweiwei@iscas.ac.cn; Alvin Che-Chia Chang(=
=E5=BC=B5

> =E5=93=B2=E5=98=89) <alvinga@andestech.com>

> Subject: [PATCH v5] target/riscv: update checks on writing pmpcfg for
Smepmp

> to version 1.0

>

> Current checks on writing pmpcfg for Smepmp follows Smepmp version 0.9.1.

> However, Smepmp specification has already been ratified, and there are
some

> differences between version 0.9.1 and 1.0. In this commit we update the

> checks of writing pmpcfg to follow Smepmp version 1.0.

>

> When mseccfg.MML is set, the constraints to modify PMP rules are:

> 1. Locked rules cannot be removed or modified until a PMP reset, unless

>    mseccfg.RLB is set.

> 2. From Smepmp specification version 1.0, chapter 2 section 4b:

>    Adding a rule with executable privileges that either is M-mode-only

>    or a locked Shared-Region is not possible and such pmpcfg writes are

>    ignored, leaving pmpcfg unchanged.

>

> The commit transfers the value of pmpcfg into the index of the Smepmp
truth

> table, and checks the rules by aforementioned specification changes.

>

> Signed-off-by: Alvin Chang <alvinga@andestech.com>

> ---

> Changes from v4: Rebase on master.

>

> Changes from v3: Modify "epmp_operation" to "smepmp_operation".

>

> Changes from v2: Adopt switch case ranges and numerical order.

>

> Changes from v1: Convert ePMP over to Smepmp.

>

>  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------

>  1 file changed, 32 insertions(+), 8 deletions(-)

>

> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c index

> 162e88a90a..4069514069 100644

> --- a/target/riscv/pmp.c

> +++ b/target/riscv/pmp.c

> @@ -102,16 +102,40 @@ static bool pmp_write_cfg(CPURISCVState *env,

> uint32_t pmp_index, uint8_t val)

>                  locked =3D false;

>              }

>

> -            /* mseccfg.MML is set */

> -            if (MSECCFG_MML_ISSET(env)) {

> -                /* not adding execute bit */

> -                if ((val & PMP_LOCK) !=3D 0 && (val & PMP_EXEC) !=3D

> PMP_EXEC) {

> +            /*

> +             * mseccfg.MML is set. Locked rules cannot be removed or

> modified

> +             * until a PMP reset. Besides, from Smepmp specification

> version 1.0

> +             * , chapter 2 section 4b says:

> +             * Adding a rule with executable privileges that either is

> +             * M-mode-only or a locked Shared-Region is not possible and

> such

> +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.

> +             */

> +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env,

> pmp_index)) {

> +                /*

> +                 * Convert the PMP permissions to match the truth table

> in the

> +                 * Smepmp spec.

> +                 */

> +                const uint8_t smepmp_operation =3D

> +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2)

> |

> +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);

> +

> +                switch (smepmp_operation) {

> +                case 0 ... 8:

>                      locked =3D false;

> -                }

> -                /* shared region and not adding X bit */

> -                if ((val & PMP_LOCK) !=3D PMP_LOCK &&

> -                    (val & 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {

> +                    break;

> +                case 9 ... 11:

> +                    break;

> +                case 12:

> +                    locked =3D false;

> +                    break;

> +                case 13:

> +                    break;

> +                case 14:

> +                case 15:

>                      locked =3D false;

> +                    break;

> +                default:

> +                    g_assert_not_reached();

>                  }

>              }

>          } else {

> --

> 2.34.1

--000000000000224769060bcd0bf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-s=
ize:12pt;font-family:Calibri,sans-serif"><span lang=3D"EN-US">Ping for revi=
ew.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">=C2=A0</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -----Original Message----=
-</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; From:
Alvin Che-Chia Chang(</span><span style=3D"font-family:=E6=96=B0=E7=B4=B0=
=E6=98=8E=E9=AB=94,serif">=E5=BC=B5=E5=93=B2=E5=98=89</span><span lang=3D"E=
N-US">) &lt;<a href=3D"mailto:alvinga@andestech.com" style=3D"color:rgb(5,9=
9,193)">alvinga@andestech.com</a>&gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Sent: Tuesday, November 1=
4, 2023
10:23 AM</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; To: <a href=3D"mailto:qem=
u-riscv@nongnu.org" style=3D"color:rgb(5,99,193)">qemu-riscv@nongnu.org</a>=
; <a href=3D"mailto:qemu-devel@nongnu.org" style=3D"color:rgb(5,99,193)">qe=
mu-devel@nongnu.org</a></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Cc: <a href=3D"mailto:ali=
stair.francis@wdc.com" style=3D"color:rgb(5,99,193)">alistair.francis@wdc.c=
om</a>; <a href=3D"mailto:liweiwei@iscas.ac.cn" style=3D"color:rgb(5,99,193=
)">liweiwei@iscas.ac.cn</a>; Alvin Che-Chia
Chang(</span><span style=3D"font-family:=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=
=94,serif">=E5=BC=B5</span><span lang=3D"EN-US"></span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span><span style=3D"fon=
t-family:=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94,serif">=E5=93=B2=E5=98=89</sp=
an><span lang=3D"EN-US">) &lt;<a href=3D"mailto:alvinga@andestech.com" styl=
e=3D"color:rgb(5,99,193)">alvinga@andestech.com</a>&gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Subject: [PATCH v5] targe=
t/riscv:
update checks on writing pmpcfg for Smepmp</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; to version 1.0</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Current checks on writing=
 pmpcfg
for Smepmp follows Smepmp version 0.9.1.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; However, Smepmp specifica=
tion has
already been ratified, and there are some</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; differences between versi=
on 0.9.1
and 1.0. In this commit we update the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; checks of writing pmpcfg =
to follow
Smepmp version 1.0.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; When mseccfg.MML is set, =
the
constraints to modify PMP rules are:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 1. Locked rules cannot be=
 removed
or modified until a PMP reset, unless</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0
mseccfg.RLB is set.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 2. From Smepmp specificat=
ion
version 1.0, chapter 2 section 4b:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0
Adding a rule with executable privileges that either is M-mode-only</span><=
/p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0
or a locked Shared-Region is not possible and such pmpcfg writes are</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0
ignored, leaving pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; The commit transfers the =
value of
pmpcfg into the index of the Smepmp truth</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; table, and checks the rul=
es by
aforementioned specification changes.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Signed-off-by: Alvin Chan=
g &lt;<a href=3D"mailto:alvinga@andestech.com" style=3D"color:rgb(5,99,193)=
">alvinga@andestech.com</a>&gt;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; ---</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Changes from v4: Rebase o=
n master.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Changes from v3: Modify
&quot;epmp_operation&quot; to &quot;smepmp_operation&quot;.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Changes from v2: Adopt sw=
itch case
ranges and numerical order.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; Changes from v1: Convert =
ePMP over
to Smepmp.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0
target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0
1 file changed, 32 insertions(+), 8 deletions(-)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; diff --git a/target/riscv=
/pmp.c
b/target/riscv/pmp.c index</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 162e88a90a..4069514069 10=
0644</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; --- a/target/riscv/pmp.c<=
/span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +++ b/target/riscv/pmp.c<=
/span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; @@ -102,16 +102,40 @@ sta=
tic bool
pmp_write_cfg(CPURISCVState *env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; uint32_t pmp_index, uint8=
_t val)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; </span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* mseccfg.MML is set */</span><=
/p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSECCFG_MML_ISSET(env)) {</s=
pan></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* not a=
dding execute bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((val=
 &amp; PMP_LOCK) !=3D 0
&amp;&amp; (val &amp; PMP_EXEC) !=3D</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; PMP_EXEC) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mseccfg.MML is set. Lock=
ed rules
cannot be removed or</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; modified</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * until a PMP reset. Besid=
es, from
Smepmp specification</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; version 1.0</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * , chapter 2 section 4b s=
ays:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Adding a rule with execu=
table
privileges that either is</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * M-mode-only or a locked
Shared-Region is not possible and</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; such</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * pmpcfg writes are ignore=
d,
leaving pmpcfg unchanged.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSECCFG_MML_ISSET(env)
&amp;&amp; !pmp_is_locked(env,</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; pmp_index)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</span=
></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * =
Convert the PMP permissions
to match the truth table</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; in the</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * =
Smepmp spec.</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const ui=
nt8_t smepmp_operation
=3D</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ((val &amp; PMP_LOCK)
&gt;&gt; 4) | ((val &amp; PMP_READ) &lt;&lt; 2)</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; |</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (val &amp; PMP_WRITE) |
((val &amp; PMP_EXEC) &gt;&gt; 2);</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (=
smepmp_operation) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0 .=
.. 8:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span>=
</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* share=
d region and not adding
X bit */</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((val=
 &amp; PMP_LOCK) !=3D
PMP_LOCK &amp;&amp;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (val &amp; 0x7) !=3D
(PMP_WRITE | PMP_EXEC)) {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 9 .=
.. 11:</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 12:=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 13:=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 14:=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 15:=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 locked =3D false;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:=
</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 g_assert_not_reached();</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; --</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">&gt; 2.34.1</span></p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:12pt;font-fam=
ily:Calibri,sans-serif"><span lang=3D"EN-US">=C2=A0</span></p></div>

--000000000000224769060bcd0bf5--

