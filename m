Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8QUC-0007o3-AY
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i8QU9-0007mR-97
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i8QU8-0003ib-0Q
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:54:13 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:46076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i8QU7-0003hx-OK
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:54:11 -0400
Received: by mail-io1-xd44.google.com with SMTP id f12so55266008iog.12
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbRovGJL1ys/q2wukbTOOY8adLV0Az6QtxpHk6uBFbw=;
 b=IVdAIplK9n52ntU2Pow8IrXJ+90KUT9W2CqqheuLIQaTgdhoRrgManupeYVuc/BOPl
 0ByfGEdlymTICgByaC/X+nXAWjMScFRMrFpxoD42iZdwec+PskpX1MlB5AQl1qZb8Clf
 R/vmDvbA8e8s5+4yP11Yzpwe48Z0/cxiqkPO4yrNwcSSQIVNWuEcJGwiJqbC99BY8ADe
 U0vLRT01t1+oGhpjpcrYdocLfSBNfgta7kUmmYyhRzaqR1pbOujmr+KQ1qUxuPx/gkTX
 zumuKntGaskLbuQA/AVJnfwLMeDU21FU0/t4gtDEwwj93W1T4IpMSR1uUsRSl/FXymTq
 lVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbRovGJL1ys/q2wukbTOOY8adLV0Az6QtxpHk6uBFbw=;
 b=c0Z7WV4erQAIQA5UiHX9o0nRpKogj/ANnLcTcLQl0it9MqXGMxx4JW1bAb6deERG51
 c4et2oKZX3IhApyQmFBjDNeO5vnOHho57OwHrnY9TNhnlTQkB9QgWKlXQfoq8g5+egjv
 rLBwDrra1gTQqKWLgQW3YLG9SiooNnZHQAT0gtMN2f9dd8dNvaHZDvIify7H8ANxySoD
 kYqE8d4B7xZzkS+fP1xquzKAecMo/dy95sqqg5Iw6JMxb1xZyE0oMoVpjv3c236RoTVx
 nscpkiVy5ORhE2r54aoUEX/ShGAhDAOC+XnkhQL6AzDbltPfig6mcdNMcMmk30Vy7sHj
 LZ5Q==
X-Gm-Message-State: APjAAAVyRvOpI8p1L2Qo6f73OY1m7VuUA68q8QDN2ArxspsDcpLAcnz3
 E3a/iHXfNB9UeCZF75bIHhGI3gg/cVYhdXGk1XHcKQ==
X-Google-Smtp-Source: APXvYqzFQgPIz3BCK6jmQh9qrkx3/l0CwCP1bBvD8YlgM3FqzMUzishwXi1TivXMAzMVEax/ydmFTmiOnxLuM3EGHEc=
X-Received: by 2002:a6b:ec16:: with SMTP id c22mr4953253ioh.185.1568300050272; 
 Thu, 12 Sep 2019 07:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
 <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
 <b9c89438-5346-e2ee-403b-3bc1fa1637bc@linaro.org>
In-Reply-To: <b9c89438-5346-e2ee-403b-3bc1fa1637bc@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 12 Sep 2019 22:53:59 +0800
Message-ID: <CAEiOBXXsag8hfHJGcqKLVKcVkndC67iPikcp-01WACoBA4ev3Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: liuzhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, wxy194768@alibaba-inc.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wenmeng_zhang@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000065fa0305925c4f52"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Thu, 12 Sep 2019 14:54:14 -0000

--00000000000065fa0305925c4f52
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2019 at 6:39 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/11/19 10:51 AM, Chih-Min Chao wrote:
> > Could  the VLEN be configurable in cpu initialization but not fixed in
> > compilation phase ?
> > Take the integer element as example  and the difference should be the
> > stride of vfp.vreg[x] isn't continuous
>
> Do you really want an unbounded amount of vector register storage?


 Hi Richard,

VLEN is implementation-defined parameter and the only limitation on spec is
that it must be power of 2.
What I prefer is the value could be adjustable in runtime.

>


> >     uint8_t *mem = malloc(size)
> >     for (int idx = 0; idx < 32; ++idx) {
> >         vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
> >         vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
> >         vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
> >    }
>
> This isn't adjusting the stride of the elements.  And in any case this
> would
> have to be re-adjusted for every vsetvl.
>
>  Not sure about the relation with vsetvl. Could you provide an example ?

Chih-Min

>
> r~
>

--00000000000065fa0305925c4f52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 12, 2019 at 6:39 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/11/19 10:51 AM, Chih-Min Chao wrote:<br>
&gt; Could=C2=A0 the VLEN be configurable in cpu initialization but not fix=
ed in<br>
&gt; compilation phase ?<br>
&gt; Take the integer element as example=C2=A0 and the difference should be=
 the<br>
&gt; stride of vfp.vreg[x] isn&#39;t continuous<br>
<br>
Do you really want an unbounded amount of vector register storage?</blockqu=
ote><div><br></div><div>=C2=A0Hi Richard,</div><div><br></div><div>VLEN is =
implementation-defined parameter and the only limitation on spec is that it=
 must be power of 2.</div><div>What I prefer is the value could be adjustab=
le in runtime.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint8_t *mem =3D malloc(size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (int idx =3D 0; idx &lt; 32; ++idx) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfp.vreg[idx].u64 =3D (void *)&amp;me=
m[idx * elem];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfp.vreg[idx].u32 =3D (void *)&amp;me=
m[idx * elem];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfp.vreg[idx].u16 =3D (void *)&amp;me=
m[idx * elem];<br>
&gt;=C2=A0 =C2=A0 }<br>
<br>
This isn&#39;t adjusting the stride of the elements.=C2=A0 And in any case =
this would<br>
have to be re-adjusted for every vsetvl.<br>
<br></blockquote><div>=C2=A0Not sure about the relation with vsetvl. Could =
you provide an example ?</div><div><br></div><div>Chih-Min=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000065fa0305925c4f52--

