Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyQi7-0004FY-IQ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 22:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyQi4-0004Ed-VU
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 22:11:48 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyQi3-00089F-5g
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 22:11:48 -0400
Received: by mail-oi1-x229.google.com with SMTP id y22so3659791oie.8
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KbYNgsgBJmAHZsQjKptSpu2bBhleoE86Jtr1+h10AAw=;
 b=T2b/mjP30qHKLX3tIGzwqHn65TCB04olq5UONwak4FHMzjpBCGMYmmyTt/sQLFOUu5
 KnHu8opS4mBBfnzXea6JSIuAwAwkefsHw8txANejMjXg0QYquk+IJylU0SPXeQUSvaGO
 31FEpJ0UNreZMlqCUQZjbOLihzBwbgx2l6I4di2yz8wn6524UEva0VoL7tCbKj24hbDt
 qxq5YOfwjX3+y0qEae9PSY/pkbRP2yQDUvDh/OKz7AFLIYQEU2wnQWwwTTv2xHkbefpM
 Kwm0pH8pYc7JGOtWqg8W4NgdeMLu2Os5bwxb3gpQd3aIYWBPxMshkVlgDG5msu2d5dah
 3hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KbYNgsgBJmAHZsQjKptSpu2bBhleoE86Jtr1+h10AAw=;
 b=DSEBAnabNB0g4coah51UbJdnbLJClGBAs753y8v/eQNXK695rIGQNWLVHTFaZOkYed
 2M6VScaw20Ieleon0IMlYOtysOopkK719EnQqiNiWcJVNQ6VZp2xUTImChJBnMJVhE5L
 uMpM+XkBy8voGGkHMIfQkdsbxGgX13J1BJEuR74JE9yYL/VKS3vzB2RsKCYniA5RoKer
 UqpQZSWZ/VpyyawvBI1jO0w9HX03h1WA3beYuv3BcrDEh8Q0zt3Drt+USpmuh6FiR//m
 PxIgHg4KDGBOE+aE90tWpdzsm5qiUKUeJPZYld4kP2Md8Z5xSLTnpUrblq0lVHX6xIt3
 sHPQ==
X-Gm-Message-State: AOAM5314PdxYfprPineQZeBP4PpQFSEpzXSnHTlwIzqbQLl+en9O5B41
 blD5h+hUf+mtTofRywk7cQj8fGsTX6SYuSjpYnpi6g==
X-Google-Smtp-Source: ABdhPJwbgpyci8C3u7v/4irmf2D+0Mc/6VU6x0xoggy+JwgnxwoSc7iR/f8HB55yTGAoog98qosoGilugwXp1fIB9FI=
X-Received: by 2002:aca:b203:: with SMTP id b3mr2039002oif.118.1595470305808; 
 Wed, 22 Jul 2020 19:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-16-frank.chang@sifive.com>
 <d0d9b56e-5d8a-83c9-59b0-88b842380487@linaro.org>
In-Reply-To: <d0d9b56e-5d8a-83c9-59b0-88b842380487@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 23 Jul 2020 10:11:34 +0800
Message-ID: <CAE_xrPi-D9FtXukPiHwCvHYTyAmSU0gH7F-GrNnHjHOYdfiZMw@mail.gmail.com>
Subject: Re: [RFC v2 15/76] target/riscv: rvv-0.9: add fractional LMUL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000d3eb0605ab126083"
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x229.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jul 2020 02:11:49 -0000

--000000000000d3eb0605ab126083
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 1:30 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> >  FIELD(VTYPE, VLMUL, 0, 2)
> >  FIELD(VTYPE, VSEW, 2, 3)
> > -FIELD(VTYPE, VEDIV, 5, 2)
> > -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
> > +FIELD(VTYPE, VFLMUL, 5, 1)
> > +FIELD(VTYPE, VEDIV, 8, 9)
> > +FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
> >  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
> The ediv definition is wrong -- should be 8, 2.
>

OK, I will correct it.


>
>
> > @@ -37,4 +38,10 @@ target_ulong fclass_d(uint64_t frs1);
> >  #define SEW32 2
> >  #define SEW64 3
> >
> > +/* table to convert fractional LMUL value */
> > +static const float flmul_table[8] = {
> > +    1, 2, 4, 8,      /* LMUL */
> > +    -1,              /* reserved */
> > +    0.125, 0.25, 0.5 /* fractional LMUL */
> > +};
> >  #endif
>
> Don't define data in a header file; only declare it.
>

Fractional LMUL are used in cpu.h, translate.c and vector_helper.c.
I was trying to declare something which can be shared among these files
to calculate the fractional LMUL value.
Perhaps it's better to declare it as the inline function which
calculates fractional LMUL value in internals.h?
Or I can do the calculation explicitly at every place which requires the
fractional LMUL value?
(only 4 places require this value by far.)


> > @@ -60,6 +60,9 @@ typedef struct DisasContext {
> >      /* vector extension */
> >      bool vill;
> >      uint8_t lmul;
> > +    float flmul;
> > +    uint8_t eew;
> > +    float emul;
>
> Why are you adding floating-point values to DisasContext?
>

flmul, eew and emul are required during rvv-0.9 vector load/store
instructions.
Should I move these declarations to the vector load/store instructions
patch to make it clearer?


> > +static inline float vext_vflmul(uint32_t desc)
> > +{
> > +    uint32_t lmul = FIELD_EX32(simd_data(desc), VDATA, LMUL);
> > +    return flmul_table[lmul];
> >  }
>
> And in the helpers?  Are you planning on some sort of path through int ->
> float
> -> int for computation?  That seems questionable.
>

desc only saves the raw LMUL bits.
(total 3 bits, I've packed the fractional LMUL bit together with two other
LMUL bits in cpu_get_tb_cpu_state())
The helper here is to convert the 3-bits LMUL into the actual fractional
number it represents.


> r~
>

Frank Chang

--000000000000d3eb0605ab126083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 23, 2020 at 1:30 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 7/22/20 2:15 AM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt;=C2=A0 FIELD(VTYPE, VLMUL, 0, 2)<br>
&gt;=C2=A0 FIELD(VTYPE, VSEW, 2, 3)<br>
&gt; -FIELD(VTYPE, VEDIV, 5, 2)<br>
&gt; -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)<br>
&gt; +FIELD(VTYPE, VFLMUL, 5, 1)<br>
&gt; +FIELD(VTYPE, VEDIV, 8, 9)<br>
&gt; +FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)<br>
&gt;=C2=A0 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)<br>
<br>
The ediv definition is wrong -- should be 8, 2.<br></blockquote><div><br></=
div><div>OK, I will correct it.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
<br>
&gt; @@ -37,4 +38,10 @@ target_ulong fclass_d(uint64_t frs1);<br>
&gt;=C2=A0 #define SEW32 2<br>
&gt;=C2=A0 #define SEW64 3<br>
&gt;=C2=A0 <br>
&gt; +/* table to convert fractional LMUL value */<br>
&gt; +static const float flmul_table[8] =3D {<br>
&gt; +=C2=A0 =C2=A0 1, 2, 4, 8,=C2=A0 =C2=A0 =C2=A0 /* LMUL */<br>
&gt; +=C2=A0 =C2=A0 -1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
reserved */<br>
&gt; +=C2=A0 =C2=A0 0.125, 0.25, 0.5 /* fractional LMUL */<br>
&gt; +};<br>
&gt;=C2=A0 #endif<br>
<br>
Don&#39;t define data in a header file; only declare it.<br></blockquote><d=
iv><br></div><div>Fractional LMUL are used in cpu.h, translate.c and vector=
_helper.c.</div><div>I was trying to declare something which can be shared =
among these files to=C2=A0calculate the fractional LMUL value.</div><div>Pe=
rhaps it&#39;s better to declare it as the inline function which calculates=
=C2=A0fractional LMUL value in internals.h?</div><div>Or I can do the calcu=
lation explicitly at every place which requires the fractional LMUL value?<=
/div><div>(only 4 places require this value by far.)</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; @@ -60,6 +60,9 @@ typedef struct DisasContext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* vector extension */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool vill;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t lmul;<br>
&gt; +=C2=A0 =C2=A0 float flmul;<br>
&gt; +=C2=A0 =C2=A0 uint8_t eew;<br>
&gt; +=C2=A0 =C2=A0 float emul;<br>
<br>
Why are you adding floating-point values to DisasContext?<br></blockquote><=
div><br></div><div>flmul, eew and emul are required during rvv-0.9 vector l=
oad/store instructions.</div><div>Should I move these declarations to the v=
ector load/store instructions patch to make it clearer?</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +static inline float vext_vflmul(uint32_t desc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t lmul =3D FIELD_EX32(simd_data(desc), VDATA, LM=
UL);<br>
&gt; +=C2=A0 =C2=A0 return flmul_table[lmul];<br>
&gt;=C2=A0 }<br>
<br>
And in the helpers?=C2=A0 Are you planning on some sort of path through int=
 -&gt; float<br>
-&gt; int for computation?=C2=A0 That seems questionable.=C2=A0<br></blockq=
uote><div><br></div><div>desc only saves the raw LMUL bits.</div><div>(tota=
l 3 bits, I&#39;ve packed the fractional LMUL bit together with two other L=
MUL bits in cpu_get_tb_cpu_state())</div><div>The helper here is to convert=
 the 3-bits LMUL into the actual fractional number it represents.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br></blockquote><div><br></div><div>Frank Chang=C2=A0</div></div></div>

--000000000000d3eb0605ab126083--

