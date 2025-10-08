Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3E8CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 09:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6Qnh-0002Vq-I9; Wed, 08 Oct 2025 05:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v6Qnf-0002Vb-Sm
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 05:49:36 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v6Qnd-0000XZ-V3
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 05:49:35 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6500448067dso186525eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1759916971; x=1760521771; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h248Y39NaeoKPvczexRmiByL3fhpX1/s6ccZjvtD08s=;
 b=f3tQPeLKJ68O21ka/eXISEjhPw1lrMGrhMkDLgXCtSSmdbeEUbwyzCVlUmh9YMwYlI
 yUuwBCEZ2r4dqFRWiLAkkF827y7rMSUlLk5pgnhwxORJf2AvSz+VmbYtIjCiF+QgCbMe
 U2VW23wtmYP0+ypOko4iPSue+p0gc/LFd0/i4MeLvhCISPOcIY7YI5keVliUKVHKabjz
 y9mSfN0PrWSZvw0GvKbqdPInJ0zIZDXKwDOsdzn3jtEo9Iwoewl55iJdprGv91NkNNIP
 qPL5/Njeq/KcssfvXQm+k2GMHPcWAolvYXS+oLeJWAOYwAJ9kBtukMhaFP9ZXSjdXM+5
 GgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759916971; x=1760521771;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h248Y39NaeoKPvczexRmiByL3fhpX1/s6ccZjvtD08s=;
 b=SM4SNCxsaOB6VHcKANfoiHCb6ulpEznJ00gUhjUHvLtn33pDKppSgExNNHg0xP/dxb
 lP5hla2erxomSFkkJ7YV6rhXlDVH/TVzg39sGKSBIbrso43iu3gEJb3tIzqJXp15y/tO
 5UCbQNmJdtXRDG+PuJeLjLeiX5aYflKWzBAy8aRo4UUynvQuhd2MHIpeecpyOZKAazUe
 Ex7B4AMFtRoHp8XeKn0+Z1pJ75tfZfVlkZlpjaalB0wOo4/6Sczu0e4+LilIg9JojPVe
 in2Mr4TeYGY6kFQ+MSb6fkJCoTLGRBLvUE9TR1aGLL1c4gUUf5lLlvZRY+PHtptoBAQS
 xLww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw5Kxq2DM9jLkbKqUjb1hbMqlax/fMqUkPLw7AJXPiQHljr+CwSADtqmJ032D2HOgfsgYgVFJmDrAj@nongnu.org
X-Gm-Message-State: AOJu0YwBlPVXI3+9c3YIcUrIBsce2vBplYPcKx7/rlOJxz9ur319V9cI
 gGHdDrSPbSHNJG1AZi1BpoTy3w0OX1gBMXtsMSNt0DVPNHYnHQpHhiCBFPh0rz6JzGiyOKus79l
 tgBj5N4sNPzbMF77JzCk9GPxjmRl26z07koT/ePDQQw==
X-Gm-Gg: ASbGncvsy2IK3qm3dec/EN8e7t/zOU3CrIIWXylsCO4zE2Y/IRc6c+gnk9UDfX7DthK
 CMfJDaMX9Ob+ZM//NZqVjhSXToHcP3/Fl0kILCBv3kFWRnRmjyEAYF+JqAebm17F0gxMWF9/fkV
 HihHEPpyqo+zvqBdJP02mgls1f+FF6ib+Tq8avRQ2FTmSRD9ZHEC3Zmsbvx0jWCol3BkiSNiRDm
 ILcn9pCJLzVt8yCgnO4x/6R4n8M9E1YJ2BaY/JdU9Nw
X-Google-Smtp-Source: AGHT+IGuXILsKqAYNZqQC2bYuAi6pWYN7l6Gug2zKoXKTPmKUq9BcGZWni5mQSKPSQoapCwuY8rgvJ9RcjBf5arbp88=
X-Received: by 2002:a05:6820:a01b:b0:621:cca4:d01b with SMTP id
 006d021491bc7-64fffc384b0mr1141915eaf.2.1759916971113; Wed, 08 Oct 2025
 02:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250923090729.1887406-1-max.chou@sifive.com>
 <19b1f55b-810c-46b8-a934-45ae2205f351@tls.msk.ru>
 <98cc2ae8-0354-42d1-ac52-a26d09d89544@tls.msk.ru>
In-Reply-To: <98cc2ae8-0354-42d1-ac52-a26d09d89544@tls.msk.ru>
From: Max Chou <max.chou@sifive.com>
Date: Wed, 8 Oct 2025 17:49:20 +0800
X-Gm-Features: AS18NWCXAATiSodcb4j0tTldINOUqZHTj6qNoBP0HQ_KqACuaSnPBdMAv1-nA5Y
Message-ID: <CANiaA1vyhHCt1skA977+5ZLf=f5zYY=-dCT5vc3qH9VotyEbzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: Modify minimum VLEN rule
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-stable <qemu-stable@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e5d0b00640a299b9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=max.chou@sifive.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000e5d0b00640a299b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Apologies for the delayed response to your question about qemu-stable.
Yes, I believe this patchset is appropriate for qemu-stable material.
The changes fix the VLEN minimum value to properly align with the RISC-V
specification requirements (VLEN >=3D ELEN), which could affect the
correctness of RISC-V vector extension behavior in QEMU.

Thank you for picking this up for the stable 10.0 and 10.1 releases.
This series is based on the riscv-to-apply.next branch (the VERSION file
shows 10.1.50).

Thanks,
Max


On Wed, Oct 8, 2025 at 3:13=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wro=
te:

> On 10/4/25 10:44, Michael Tokarev wrote:
> > On 9/23/25 12:07, Max Chou wrote:
> >> According to the RISC-V unprivileged specification, the VLEN should be
> >> greater
> >> or equal to the ELEN. This patchset provides following modifications:
> >>
> >> * Replace the checkings of standard V with the checkings of Zve32x
> >> * Introduces a check rule for VLEN and ELEN
> >> * Modifies the minimum VLEN based on the vector extensions
> >>
> >> Extension     Minimum VLEN
> >> V                      128
> >> Zve64[d|f|x]            64
> >> Zve32[f|x]              32
> >>
> >> v1: 20250627132156.440214-1-max.chou@sifive.com
> >> - Rebase to riscv-to-apply.next branch
> >> - Add patch 1 to replace checking RVV by checking Zve32x
> >>
> >> Max Chou (2):
> >>    target/riscv: rvv: Replace checking V by checking Zve32x
> >>    target/riscv: rvv: Modify minimum VLEN according to enabled vector
> >>      extensions
> >
> > Is this a qemu-stable material?
> > (these changes does not apply directly to 10.1.x, probably the
> > MonitorDef change in the first patch here can be dropped)
>
> Hi!
>
> I've picked this series for qemu-stable 10.0 and 10.1 series.
> I still haven't received any reply from y previous email asking
> about these, so I'm a bit uncomfortable by picking this up for
> stable.  But I'm releasing two stable releases today with these
> patches in.
>
> Thanks,
>
> /mjt
>

--000000000000e5d0b00640a299b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Michael,</div><div><br></div><div>Apologies f=
or the delayed response to your question about qemu-stable.<br></div><div>Y=
es, I believe this patchset is appropriate for qemu-stable material.</div><=
div>The changes fix the VLEN minimum value to properly align with the RISC-=
V specification requirements (VLEN &gt;=3D ELEN), which could affect the co=
rrectness of RISC-V vector extension behavior in QEMU.<br></div><div><br></=
div><div>Thank you for picking this up for the stable 10.0 and 10.1 release=
s.<br></div><div>This series is based on the=C2=A0riscv-to-apply.next branc=
h (the VERSION file shows 10.1.50).</div><div><br></div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr">Thanks,<br>Max</div></div></div><br></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct=
 8, 2025 at 3:13=E2=80=AFPM Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.m=
sk.ru">mjt@tls.msk.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">On 10/4/25 1=
0:44, Michael Tokarev wrote:<br>
&gt; On 9/23/25 12:07, Max Chou wrote:<br>
&gt;&gt; According to the RISC-V unprivileged specification, the VLEN shoul=
d be <br>
&gt;&gt; greater<br>
&gt;&gt; or equal to the ELEN. This patchset provides following modificatio=
ns:<br>
&gt;&gt;<br>
&gt;&gt; * Replace the checkings of standard V with the checkings of Zve32x=
<br>
&gt;&gt; * Introduces a check rule for VLEN and ELEN<br>
&gt;&gt; * Modifies the minimum VLEN based on the vector extensions<br>
&gt;&gt;<br>
&gt;&gt; Extension=C2=A0=C2=A0=C2=A0=C2=A0 Minimum VLEN<br>
&gt;&gt; V=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 128<br>
&gt;&gt; Zve64[d|f|x]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 64<br>
&gt;&gt; Zve32[f|x]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 32<br>
&gt;&gt;<br>
&gt;&gt; v1: <a href=3D"mailto:20250627132156.440214-1-max.chou@sifive.com"=
 target=3D"_blank">20250627132156.440214-1-max.chou@sifive.com</a><br>
&gt;&gt; - Rebase to riscv-to-apply.next branch<br>
&gt;&gt; - Add patch 1 to replace checking RVV by checking Zve32x<br>
&gt;&gt;<br>
&gt;&gt; Max Chou (2):<br>
&gt;&gt; =C2=A0=C2=A0 target/riscv: rvv: Replace checking V by checking Zve=
32x<br>
&gt;&gt; =C2=A0=C2=A0 target/riscv: rvv: Modify minimum VLEN according to e=
nabled vector<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 extensions<br>
&gt; <br>
&gt; Is this a qemu-stable material?<br>
&gt; (these changes does not apply directly to 10.1.x, probably the<br>
&gt; MonitorDef change in the first patch here can be dropped)<br>
<br>
Hi!<br>
<br>
I&#39;ve picked this series for qemu-stable 10.0 and 10.1 series.<br>
I still haven&#39;t received any reply from y previous email asking<br>
about these, so I&#39;m a bit uncomfortable by picking this up for<br>
stable.=C2=A0 But I&#39;m releasing two stable releases today with these<br=
>
patches in.<br>
<br>
Thanks,<br>
<br>
/mjt<br>
</blockquote></div>

--000000000000e5d0b00640a299b9--

