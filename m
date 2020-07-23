Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyVPt-0000HT-B9
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 03:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyVPr-0000GC-BN
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 03:13:19 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyVPo-0005m7-9R
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 03:13:19 -0400
Received: by mail-oi1-x22f.google.com with SMTP id r8so4163315oij.5
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgxpCz3r5iBBrc3aC3OMCcuIqFIoYcP5JlEdaJPGS3g=;
 b=Ce11y5gDx521//CmmkgmUUC/DqplDbtRME7MJ78Dn5pAJnXrW+K+Ez8fiq1huNpgrH
 GyPa78sluzL7you3BPDT+BbOuJ4FoPYo4a8W4K9Q/Bj94mo2DWMG3EYO4lIvR/H7J00X
 fkB2dE+StugwUOafEYlbfvlaeC9Pbnsn4aNG+5TO9CtowoS1bifjI1d4PP8TJThgltlo
 A1m7X2baiYGDyYCKiYKfaPBYzSLUboag0nKO5DHI8cU04TQy6JwgUMbGDeNM6AHgoTKR
 0EALoc3kbjxjV058hZX8k2i/aU/v9g6v34i0JJW7gWk0MuVJRiGFmyL6hykAxxIw8ztP
 Q6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgxpCz3r5iBBrc3aC3OMCcuIqFIoYcP5JlEdaJPGS3g=;
 b=BjvomAPARk5PY707+nuNusXooMLdqZlXawjM0RQqdyjmZ/W0hlMbNxDW+5nJmkBN0g
 XGPqwJopqPtdvReovBXb/JwyeyIsaa4crrf7BS+uQxWs2kcV57kkwDEOCcv4zzChedb9
 rGfmwCZhDVugdlJacErUwc4s/S7dGDgppP0ad/CvkM2oEc/Cg8f1ylAi+X7xVekbRtQ/
 rbJ6dCj2T1N+yMYQ2EjkDnJ+rS/IdYbvb+52NyQcpS3nGD4EDbftdR/nVWK/Ujzup1t1
 gUZOduD7DSDESZxLgQHGygJveBqqF0jVSAhcRyMPU6XqdTgvd7RHFzIAQk/TCF7PUS8S
 v9Cg==
X-Gm-Message-State: AOAM531niT9CmAUi2yXy2jfTn/gKNT0q778hxlad+bAPXSvc1L0dVpef
 Z6W9hwbiyhWBAfk9o/VNHKAjkluSmwfZarMOut4B6g==
X-Google-Smtp-Source: ABdhPJzje6F6z7N5MTfEHzXJYQxv2EBZ1yjF9oYJZgTBHPAKxM1+1/kocS0mzwRCEwQwJOf0xWe5/dDkVZuqcQhwbmw=
X-Received: by 2002:aca:6289:: with SMTP id w131mr2500020oib.122.1595488394827; 
 Thu, 23 Jul 2020 00:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-20-frank.chang@sifive.com>
 <87cba14d-0ff5-97b8-b1ed-34872906495a@linaro.org>
In-Reply-To: <87cba14d-0ff5-97b8-b1ed-34872906495a@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 23 Jul 2020 15:13:04 +0800
Message-ID: <CAE_xrPgbj9aMJ3k6-WW72_Ng=hz=GNkVu5y1zu57efNiqkEd3g@mail.gmail.com>
Subject: Re: [RFC v2 19/76] target/riscv: rvv-0.9: add narrower_nanbox_fpr
 helper
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000046ff305ab169785"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x22f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2020 07:13:19 -0000

--000000000000046ff305ab169785
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 3:15 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > For floating-point operations, the scalar can be taken from a scalar
> > f register. If FLEN > SEW, the value in the f registers is checked for
> > a valid NaN-boxed value, in which case the least-significant SEW bits
> > of the f register are used, else the canonical NaN value is used.
> >
> > Add helper to generate the correspond NaN-boxed value or the SEW-bit
> > canonical NaN for floating-point operations.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  target/riscv/helper.h        |  2 ++
> >  target/riscv/vector_helper.c | 32 ++++++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+)
>
> The helper can be done inline in two tcg ops.
>
> Though, really, we need to coordinate with Liu Zhiwei's other patch set
> that
> also deals with nan-boxing.
>
>
So, it's better to leverage the codes at:
https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_liu@c-sky.com/
but has to extend for the case of SEW=16?

Frank Chang


>
> r~
>

--000000000000046ff305ab169785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 23, 2020 at 3:15 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 7/22/20 2:15 AM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; <br>
&gt; For floating-point operations, the scalar can be taken from a scalar<b=
r>
&gt; f register. If FLEN &gt; SEW, the value in the f registers is checked =
for<br>
&gt; a valid NaN-boxed value, in which case the least-significant SEW bits<=
br>
&gt; of the f register are used, else the canonical NaN value is used.<br>
&gt; <br>
&gt; Add helper to generate the correspond NaN-boxed value or the SEW-bit<b=
r>
&gt; canonical NaN for floating-point operations.<br>
&gt; <br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br=
>
&gt;=C2=A0 target/riscv/vector_helper.c | 32 ++++++++++++++++++++++++++++++=
++<br>
&gt;=C2=A0 2 files changed, 34 insertions(+)<br>
<br>
The helper can be done inline in two tcg ops.<br>
<br>
Though, really, we need to coordinate with Liu Zhiwei&#39;s other patch set=
 that<br>
also deals with nan-boxing.<br>
<br></blockquote><div><br></div><div>So, it&#39;s better to leverage the co=
des at:=C2=A0<a href=3D"https://patchew.org/QEMU/20200626205917.4545-1-zhiw=
ei_liu@c-sky.com/">https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_li=
u@c-sky.com/</a></div><div>but has to extend for the case of SEW=3D16?=C2=
=A0</div><div><br></div><div>Frank Chang</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000046ff305ab169785--

