Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNRq-0004pZ-P0
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lYNRn-0004pK-Ud; Mon, 19 Apr 2021 02:31:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lYNRe-0004yf-A1; Mon, 19 Apr 2021 02:31:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id lt13so8459677pjb.1;
 Sun, 18 Apr 2021 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIStX6wva8JwVZdtQnb+vPV9tifir+PIoCS80CmConE=;
 b=gvekoU/VkijIEMszx+xTHxuGoMfBAjBrnQDeJWM1ZE46VYZ1X+4MWsQt6o3p9x2DQZ
 Z3qzUDT94a+TZkwz/RqYobjYBNG7YTb+n9FG3VtSU56u24uQVUtml68mbFS1V8Px9vbA
 57hBOhI9RCgDZAKrc2GG0BcFSgQTVHtZRL2zTUT/Yo35wTaJCn78tVJWAmKSkL2TAMFu
 K0YlWWXHv0K6IYZp+ac7gsxb2BCXTFH9zvqVJK0uDhile7PjoIDqUkKhBzDjk2swABLd
 vXY44q2IPkc5AETe0vgGUFlJLKha7Kqz7+5N2BRiruUL9Hc+A2mrljg38fvwtRxjIDf2
 NJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIStX6wva8JwVZdtQnb+vPV9tifir+PIoCS80CmConE=;
 b=dfoESpLss4ORKdbGDCh/HIICLiArYeogegxrumfjBFap53ASnftlyZoj/VWrUfZKrr
 mDZHvsOqwE5xBbCKEtC890ABQM6/VC8ByEaC0WQM0hMNWdtLTdALQPRHs1w/Fy7IfEq5
 lhRHJGP97Eqi5tCS15CrhiS0eh3443yo4YawqkGmDAQJDRzholydGqljmFY7Ms90vBg6
 D4sYnFQWPQzGxxy3jbTjJU5mkTHTb3aDNfSxb8odw/Rm9VB/MF0bk1cZiFqR+Pwzj7y2
 +WAtWP3xSZ+/er+XF3U4jumBuXa54P/NbZ4MX6LSS7MFPfPX3quxhLrjhSqvEtQo5X08
 T+uw==
X-Gm-Message-State: AOAM532VK+40KdnSlHXyyquLnXMOgoznBAsh2VC2RGG6WoGvEiK5hz5P
 EGqYkcLCtxNYX44hfjdA/rsEtw6oyKZ/g4zOuts=
X-Google-Smtp-Source: ABdhPJzQioMICJsTo7rcF/rFunqXWJ/D0UrQ7skQEcCGCtUpbv1UePJUZDbE2G1z7s01REYT1Io60Vlct5IE1WaMgSE=
X-Received: by 2002:a17:902:c407:b029:ec:aeb7:667f with SMTP id
 k7-20020a170902c407b02900ecaeb7667fmr222340plk.9.1618813899545; Sun, 18 Apr
 2021 23:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210419060145.11152-1-frank.chang@sifive.com>
 <CAKmqyKOwZeqbbeZxQ2uGiKxGWZrBUk5Xq93kAeQecrFy9p718g@mail.gmail.com>
In-Reply-To: <CAKmqyKOwZeqbbeZxQ2uGiKxGWZrBUk5Xq93kAeQecrFy9p718g@mail.gmail.com>
From: Frank Chang <0xc0de0125@gmail.com>
Date: Mon, 19 Apr 2021 14:31:28 +0800
Message-ID: <CANzO1D2sRnzezeae89J4P+dBw_h0NSTX2SQUEStNo1K8dyquTQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix vssub.vv saturation bug
To: Alistair Francis <alistair23@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000709ed705c04d7bd3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=0xc0de0125@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 06:31:53 -0000

--000000000000709ed705c04d7bd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=8819=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Mon, Apr 19, 2021 at 4:02 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Doing a negate (0x0 =E2=80=93 0x80000000) using vssub.vv produces
> > an incorrect result of 0x80000000 (should saturate to 0x7fffffff)
> >
> > Fix this bug by treating zero as a positive number.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> Thanks for the patch!
>
> A similar fix is already in the riscv-to-apply.next queue
>
>    target/riscv: Fixup saturate subtract function
>
>    The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
>    However, when the predication is ture and a is 0, it should return
> maximum.
>
>    Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>    Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
>    Message-Id: <20210212150256.885-4-zhiwei_liu@c-sky.com>
>
>
> Alistair
>

Thanks, I might missed that patch.
Frank Chang


>
> > ---
> >  target/riscv/vector_helper.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.=
c
> > index a156573d281..356cef8a090 100644
> > --- a/target/riscv/vector_helper.c
> > +++ b/target/riscv/vector_helper.c
> > @@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, in=
t
> vxrm, int8_t a, int8_t b)
> >  {
> >      int8_t res =3D a - b;
> >      if ((res ^ a) & (a ^ b) & INT8_MIN) {
> > -        res =3D a > 0 ? INT8_MAX : INT8_MIN;
> > +        res =3D a >=3D 0 ? INT8_MAX : INT8_MIN;
> >          env->vxsat =3D 0x1;
> >      }
> >      return res;
> > @@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env,
> int vxrm, int16_t a, int16_t b)
> >  {
> >      int16_t res =3D a - b;
> >      if ((res ^ a) & (a ^ b) & INT16_MIN) {
> > -        res =3D a > 0 ? INT16_MAX : INT16_MIN;
> > +        res =3D a >=3D 0 ? INT16_MAX : INT16_MIN;
> >          env->vxsat =3D 0x1;
> >      }
> >      return res;
> > @@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env,
> int vxrm, int32_t a, int32_t b)
> >  {
> >      int32_t res =3D a - b;
> >      if ((res ^ a) & (a ^ b) & INT32_MIN) {
> > -        res =3D a > 0 ? INT32_MAX : INT32_MIN;
> > +        res =3D a >=3D 0 ? INT32_MAX : INT32_MIN;
> >          env->vxsat =3D 0x1;
> >      }
> >      return res;
> > @@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env,
> int vxrm, int64_t a, int64_t b)
> >  {
> >      int64_t res =3D a - b;
> >      if ((res ^ a) & (a ^ b) & INT64_MIN) {
> > -        res =3D a > 0 ? INT64_MAX : INT64_MIN;
> > +        res =3D a >=3D 0 ? INT64_MAX : INT64_MIN;
> >          env->vxsat =3D 0x1;
> >      }
> >      return res;
> > --
> > 2.17.1
> >
> >
>

--000000000000709ed705c04d7bd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Alistair Francis &lt;<a href=3D"mailto:al=
istair23@gmail.com">alistair23@gmail.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=
=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, Apr 19, 2021 at 4:02 PM &lt;<a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; Doing a negate (0x0 =E2=80=93 0x80000000) using vssub.vv produces<br>
&gt; an incorrect result of 0x80000000 (should saturate to 0x7fffffff)<br>
&gt;<br>
&gt; Fix this bug by treating zero as a positive number.<br>
&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Thanks for the patch!<br>
<br>
A similar fix is already in the riscv-to-apply.next queue<br>
<br>
=C2=A0 =C2=A0target/riscv: Fixup saturate subtract function<br>
<br>
=C2=A0 =C2=A0The overflow predication ((a - b) ^ a) &amp; (a ^ b) &amp; INT=
64_MIN is right.<br>
=C2=A0 =C2=A0However, when the predication is ture and a is 0, it should re=
turn maximum.<br>
<br>
=C2=A0 =C2=A0Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-s=
ky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
=C2=A0 =C2=A0Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.h=
enderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;=
<br>
=C2=A0 =C2=A0Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.f=
rancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
=C2=A0 =C2=A0Message-id: <a href=3D"mailto:20210212150256.885-4-zhiwei_liu@=
c-sky.com" target=3D"_blank">20210212150256.885-4-zhiwei_liu@c-sky.com</a><=
br>
=C2=A0 =C2=A0Message-Id: &lt;<a href=3D"mailto:20210212150256.885-4-zhiwei_=
liu@c-sky.com" target=3D"_blank">20210212150256.885-4-zhiwei_liu@c-sky.com<=
/a>&gt;<br>
<br>
<br>
Alistair<br></blockquote><div><br></div><div>Thanks, I might missed that pa=
tch.</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/vector_helper.c | 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper=
.c<br>
&gt; index a156573d281..356cef8a090 100644<br>
&gt; --- a/target/riscv/vector_helper.c<br>
&gt; +++ b/target/riscv/vector_helper.c<br>
&gt; @@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, i=
nt vxrm, int8_t a, int8_t b)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int8_t res =3D a - b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((res ^ a) &amp; (a ^ b) &amp; INT8_MIN) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt; 0 ? INT8_MAX : INT8_MIN;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt;=3D 0 ? INT8_MAX : INT8_MIN=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vxsat =3D 0x1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; @@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env,=
 int vxrm, int16_t a, int16_t b)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int16_t res =3D a - b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((res ^ a) &amp; (a ^ b) &amp; INT16_MIN) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt; 0 ? INT16_MAX : INT16_MIN;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt;=3D 0 ? INT16_MAX : INT16_M=
IN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vxsat =3D 0x1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; @@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env,=
 int vxrm, int32_t a, int32_t b)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int32_t res =3D a - b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((res ^ a) &amp; (a ^ b) &amp; INT32_MIN) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt; 0 ? INT32_MAX : INT32_MIN;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt;=3D 0 ? INT32_MAX : INT32_M=
IN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vxsat =3D 0x1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; @@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env,=
 int vxrm, int64_t a, int64_t b)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int64_t res =3D a - b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((res ^ a) &amp; (a ^ b) &amp; INT64_MIN) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt; 0 ? INT64_MAX : INT64_MIN;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D a &gt;=3D 0 ? INT64_MAX : INT64_M=
IN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vxsat =3D 0x1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return res;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;=C2=A0<br></blockquote></div></div>

--000000000000709ed705c04d7bd3--

