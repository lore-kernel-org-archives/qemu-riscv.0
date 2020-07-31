Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1S73-0008Lr-0a
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 06:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k1S71-0008Jy-CS
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 06:18:03 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:40824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k1S6z-00013c-MH
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 06:18:03 -0400
Received: by mail-ot1-x329.google.com with SMTP id h16so2209289oti.7
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAevHYOMUCxW8wCIyWkQiy80AHfiQ3gSTdimD+dt2uQ=;
 b=jLc9Eb1yxAKSD6i7nVYaNUPc8WVeUEqz4wnF9ZkgGkSSgpjXvs3hqKgR1Ywfvrix/U
 f1+TmOE1sXvcwaks8AZDjt9F4oAgcwmBWLKeoxkxzE9OIjKwVaodF8fLQlH+92SlI7aF
 ZgrtpraECoX34fCraor5ZBjs0toXViHuALzdGmns5roT3Sm+DWOA768jKTh2Rm29vDvm
 SWy5QpeCfjPPubyIztuFjxd7PowpZMZmOPtEmj00js+NK/kG3gLTpD/k5jEclLrCRYzE
 xB8i9zeeHPHKwo/5IVwW5DhxyHy80TqpPc/B7Nm5RlqYgkEyi6oovSV8bjDgHCs+BMni
 PChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAevHYOMUCxW8wCIyWkQiy80AHfiQ3gSTdimD+dt2uQ=;
 b=jznHbmoSi5FVFD2ZC8vyF6wp6UgV2lwDVdPElryTcODKsIuQjzqZoWOgNdmhab18G4
 nXgGofHuHc09HOZI2x64GKyNaDJ9vfCq+s8xDL19B2vvXedBtfAkuMVTIOP43iEegFgp
 Rjxie63vHciVlcLWsyGqdaU0MDI9Rv51NZi4IPjefCOpy//CBuPxojcaKs0GA1Zu8qC7
 iDMLFlJLBhKydn7vgujj2g+xZyTXrz/y8CAhAGMHwd6xD/ZtG8qGdPHQQDohtCcpME6v
 y/5Bz8Cp6CxRzdWBzxbQaduD07reW/4GpuukyzdZJ6v55nsMe1DZP3eqdgLUZC90MZg9
 lDWQ==
X-Gm-Message-State: AOAM5329DUEbq/5IZRKEr+uPJFwFCkdZ9Ag7qYW3vKUwbGh+M7WDPX7q
 PAR2dVN9aSSeQ8c5uK5k4tCfbXvf6PAgsDc7ikqOhg==
X-Google-Smtp-Source: ABdhPJx9W5UaJnCOPoCT3osRt38Cjsh0RRNU4ZMcGXZvlLrxQpvHq/MNkgPQagbZikabldrYylRIhEmWlI00czdxMzU=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr2426326oti.139.1596190679582; 
 Fri, 31 Jul 2020 03:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-44-frank.chang@sifive.com>
 <0b042afa-61e4-d6a4-7fbd-2c359026b8aa@linaro.org>
In-Reply-To: <0b042afa-61e4-d6a4-7fbd-2c359026b8aa@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 31 Jul 2020 18:17:48 +0800
Message-ID: <CAE_xrPhOJ3nUJJ_9o2m8EcJsBbpdEUz78qEt71mtFoF8gKgtiA@mail.gmail.com>
Subject: Re: [RFC v2 43/76] target/riscv: rvv-0.9: integer extension
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000073685805abba1aac"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 10:18:03 -0000

--00000000000073685805abba1aac
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 31, 2020 at 4:35 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> > +    static gen_helper_gvec_3_ptr * const fns[6][4] = {
> > +        {
> > +            NULL, gen_helper_vzext_vf2_h,
> > +            gen_helper_vzext_vf2_w, gen_helper_vzext_vf2_d
> > +        },
> > +        {
> > +            NULL, NULL,
> > +            gen_helper_vzext_vf4_w, gen_helper_vzext_vf4_d,
> > +        },
> > +        {
> > +            NULL, NULL,
> > +            NULL, gen_helper_vzext_vf8_d
> > +        },
> > +        {
> > +            NULL, gen_helper_vsext_vf2_h,
> > +            gen_helper_vsext_vf2_w, gen_helper_vsext_vf2_d
> > +        },
> > +        {
> > +            NULL, NULL,
> > +            gen_helper_vsext_vf4_w, gen_helper_vsext_vf4_d,
> > +        },
> > +        {
> > +            NULL, NULL,
> > +            NULL, gen_helper_vsext_vf8_d
> > +        }
> > +    };
>
> I don't understand why there aren't more functions in this table.  As far
> as I
> can see, the only NULLs should be at [*][0].
>
>
> r~
>

As source EEW has to be 1/2, 1/4, 1/8 of SEW and the source EEW must be
a supported width (Section 12.3).

Shouldn't it impossible to have the cases, e.g.
vzext.vf4 with SEW = 16, i.e. EEW = SEW / 4 = 4 bits
vzext.vf8 with SEW = 16, i.e. EEW = SEW / 8 = 2 bits
vzext.vf8 with SEW = 32, i.e. EEW = SEW / 8 = 4 bits

Frank Chang

--00000000000073685805abba1aac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jul 31, 2020 at 4:35 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_bla=
nk">richard.henderson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/22/20 2:16 =
AM, <a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang=
@sifive.com</a> wrote:<br>
&gt; +=C2=A0 =C2=A0 static gen_helper_gvec_3_ptr * const fns[6][4] =3D {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, gen_helper_vzext_vf2_=
h,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vzext_vf2_w, gen=
_helper_vzext_vf2_d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vzext_vf4_w, gen=
_helper_vzext_vf4_d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, gen_helper_vzext_vf8_=
d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, gen_helper_vsext_vf2_=
h,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vsext_vf2_w, gen=
_helper_vsext_vf2_d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vsext_vf4_w, gen=
_helper_vsext_vf4_d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, gen_helper_vsext_vf8_=
d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
<br>
I don&#39;t understand why there aren&#39;t more functions in this table.=
=C2=A0 As far as I<br>
can see, the only NULLs should be at [*][0].<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>As source EEW has to be 1/2, 1/4, 1/=
8 of SEW and the source EEW must be</div><div>a supported width (Section 12=
.3).</div><div><br></div><div>Shouldn&#39;t it impossible to have the cases=
, e.g.</div><div>vzext.vf4 with SEW =3D 16, i.e. EEW =3D SEW / 4 =3D 4 bits=
</div><div>vzext.vf8 with SEW =3D 16, i.e. EEW =3D SEW / 8 =3D 2 bits</div>=
<div>vzext.vf8 with SEW =3D 32, i.e. EEW =3D SEW / 8 =3D 4 bits</div><div><=
br></div><div>Frank Chang</div></div></div>

--00000000000073685805abba1aac--

