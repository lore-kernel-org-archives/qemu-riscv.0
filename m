Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcj9K-00083T-Mf
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 03:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mcj9J-00082I-Ux; Tue, 19 Oct 2021 03:03:01 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:41542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mcj9I-000169-B0; Tue, 19 Oct 2021 03:03:01 -0400
Received: by mail-lf1-x134.google.com with SMTP id u21so5238416lff.8;
 Tue, 19 Oct 2021 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSKLXvZvL2/MxJBWWyOuBI4DqH3VyR3gjpsr+SL5eB0=;
 b=PIPiFH4r7PuuEZRv6Mw+qRP+G5WOYAOleFlPGxFu6xt0b3HrsBOT+6CjbH2R8u8Mrs
 HCN8ywaTme/mkkOh20KQcIPMnlL8tu2lQom99IgIfiVoDbA1I0MciGC+rhDroe7TfNQy
 b8kAQuNnOrvXH59IXIMoMFppeemmTDkbQTEhh9sMwJI94VhDfpq+31at1iTXNLjC2+PX
 TJ9MWJPxGow+9s8R3fvoqPtupMgK5ieyp29PRBx5pvfJlmvmC8ZzNmU/m9cOp/gP7+hX
 tkWNP10xpGOnwkvnRIhnCZ8obiVGGBLNwR8VEwL2WLFKGFhgYgAbVzqdm9fgJ9EbmpPm
 dY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSKLXvZvL2/MxJBWWyOuBI4DqH3VyR3gjpsr+SL5eB0=;
 b=CBkMKYSiPQResue1mOe2jey1ibU0qLsEfwFkTjzrwNeVi6OdCbE0G2oTsMuSmRs+1D
 9XstZ8lohh4G3EgYFn4GiIqH58EdEj75erhBACHIHDSqCpX7gVAsPgQasD2MTkLvWP1l
 c58CnJbJlupIm592F1ffl0F0XJoFfHU5SaVbuixGSBewGHL/H5/VwNzlfagZvSfwe5uq
 JmIGJ+KdHrvUcUgLAec15Xx3Lcd65bvfp2Q3BYUQKHhVid90T2BYCYTvvYmkvrbDTL4b
 Wz1ajmZ5vqcDK5ng9THce8T+ch+lteNMJ27DolGj4EJ4mG2x2AdWD/B5yimWR79Rdy6i
 iPzA==
X-Gm-Message-State: AOAM532PwyALp1HYYi+KhCTUfXx/sI3KMgvc1zI2PNxxwyHPpVvvzuaY
 vEkXpQONxcCTjXvKUJu88/46Szzam0armum94Ew=
X-Google-Smtp-Source: ABdhPJwP09R9jNT2M3OtRNZs4fr6LNf6PTzAjqDkJzyINj48kM2RCc85NG5ZVYMw+Ed9e383sA57E3owX1acOIkiCpw=
X-Received: by 2002:a05:6512:c3:: with SMTP id
 c3mr4578900lfp.409.1634626977411; 
 Tue, 19 Oct 2021 00:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
 <20211017172728.759687-5-space.monkey.delivers@gmail.com>
 <CAKmqyKPDfYan+czM+1AnJ7+gyjZAKDobxDvJ40R8Sor0FH4HNw@mail.gmail.com>
In-Reply-To: <CAKmqyKPDfYan+czM+1AnJ7+gyjZAKDobxDvJ40R8Sor0FH4HNw@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Tue, 19 Oct 2021 10:02:46 +0300
Message-ID: <CAFukJ-AogZ-cN9XUowC1VcgAfsbN_ZqZ98UPvJ7=0Tq1DPCEKQ@mail.gmail.com>
Subject: Re: [PATCH v14 4/8] [RISCV_PM] Add J extension state description
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "space.monkey.delivers@gmail.com" <space.monkey.delivers@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000054353905ceaf4085"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 07:03:02 -0000

--00000000000054353905ceaf4085
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, will fix that.
Thanks

=D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 09:53, Alistair Fr=
ancis <alistair23@gmail.com>:

> On Mon, Oct 18, 2021 at 3:36 AM Alexey Baturo <baturo.alexey@gmail.com>
> wrote:
> >
> > Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> > ---
> >  target/riscv/machine.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 16a08302da..4d99880797 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
> >      return riscv_has_ext(env, RVV);
> >  }
> >
> > +static bool pointermasking_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +    CPURISCVState *env =3D &cpu->env;
> > +
> > +    return riscv_has_ext(env, RVJ);
> > +}
> > +
> >  static const VMStateDescription vmstate_vector =3D {
> >      .name =3D "cpu/vector",
> >      .version_id =3D 1,
> > @@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper =3D =
{
> >      }
> >  };
> >
> > +static const VMStateDescription vmstate_pointermasking =3D {
> > +    .name =3D "cpu/pm",
>
> Can we write "cpu/pointer_masking"? pm sounds like power management
>
> Alistair
>

--00000000000054353905ceaf4085
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, will fix that.<div>Thanks</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 19 =D0=
=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 09:53, Alistair Francis &lt;<a href=3D=
"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, Oct 18, 2021 at 3:36 AM=
 Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" target=3D"_bl=
ank">baturo.alexey@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:space.monkey.delive=
rs@gmail.com" target=3D"_blank">space.monkey.delivers@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/machine.c | 27 +++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 27 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index 16a08302da..4d99880797 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return riscv_has_ext(env, RVV);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static bool pointermasking_needed(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return riscv_has_ext(env, RVJ);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const VMStateDescription vmstate_vector =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .name =3D &quot;cpu/vector&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; @@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static const VMStateDescription vmstate_pointermasking =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;cpu/pm&quot;,<br>
<br>
Can we write &quot;cpu/pointer_masking&quot;? pm sounds like power manageme=
nt<br>
<br>
Alistair<br>
</blockquote></div>

--00000000000054353905ceaf4085--

