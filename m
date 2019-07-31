Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hsjhM-0003kP-D8
	for mharc-qemu-riscv@gnu.org; Wed, 31 Jul 2019 04:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hsjhJ-0003k9-Nz
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 04:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hsjhI-0000XR-Aw
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 04:10:57 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:40865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hsjhI-0000Wj-4P
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 04:10:56 -0400
Received: by mail-io1-xd41.google.com with SMTP id h6so9172805iom.7
 for <qemu-riscv@nongnu.org>; Wed, 31 Jul 2019 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G/K/PyX4B0akf076L0odxGe527aEzLjjI+CBAn8LeQU=;
 b=i2MNGkwwM/d5zNhKW4rviz6AqmaMdOEbW3ENeBBqq9YeaeXKUXo/cYF+T0jygDEiPJ
 5Zs3T3aFAA1ISmuQ4CfRqPkHJI9J5BUMOxxG24hhFH9clCPS7iaAehIC4dWSkQPLrqye
 CNU0UYqblTalnEK72tX+kCjMVY1tkvBZRz0n1vxc1CF/KLfiCtveyDyklHtcw37xhEw3
 MrqUx8APoF48oJd1OFcAshfqZhHHR3rWG3OfGcE/6M00Md4qw37TrKyh6S77icKInrjI
 0wUX0PZQRFfCbdifCYVmQ7HZnpxXdmqLYxWxIXRWnDAdfk7pmpmiZjdIOb5Lfmg8jPGU
 zazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G/K/PyX4B0akf076L0odxGe527aEzLjjI+CBAn8LeQU=;
 b=L1HCf6g9dEt+0KWRTJ/heGk3zoJdgp9YXkSdlIUALnyHW3sDSkon+5NdLsTCfp1nyq
 oaJmgvvl3wpvs9brtNs9Acm2sXvS7+Xmb0xd0+omlb5lDUfBav4bVz4fRTmVVmCvehcC
 2P9zH5PQgisV5p+Wxz6V2wwntKLVTcMuRPnCBUn0b1LQb+nXVTFzIk/DOc81eaKpcKzX
 p44FO3Oy2ektFVCSnZbgBl3n1TzDYCQbvTbs6eRazhYSmfeFrqVYmrAUwJ8nUhx4IlYv
 sQXkOYg5IubkGaMWlUwtbwLMXr3d0FV74grS0G0m85S/+6qfWcs/YBGxynbf4vPF7pIK
 /C5g==
X-Gm-Message-State: APjAAAU9qXRUVe+sJgrzDc7hlVQ2w0B5VWCiwJ7MmP6VlXwjth/cjTLU
 HGdW3kLgPdmYcyRuMdFVTBWpVBHjOVm5o0CIS37iqA==
X-Google-Smtp-Source: APXvYqy+WKIGvNqyBfj9iCu9dls2jndTPCHMErVBs1d+YGOoDiuVKDQCcfP49bHJpo9kXyq11GUDj3dr0zFdulNQp70=
X-Received: by 2002:a5d:91d7:: with SMTP id
 k23mr108858690ior.163.1564560654789; 
 Wed, 31 Jul 2019 01:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <4116c27c037b5e7f4822cfd7199724450dc6b5da.1564080680.git.alistair.francis@wdc.com>
 <CAEiOBXUcwp5rZbdH7VuQjnM3Xq5-ONTWmcDp1Da+C1n_-w95Uw@mail.gmail.com>
 <CAKmqyKMJ-Kji0n_HjBX_73T2PerxOF5XWK7mhguegXJ6BztL_A@mail.gmail.com>
In-Reply-To: <CAKmqyKMJ-Kji0n_HjBX_73T2PerxOF5XWK7mhguegXJ6BztL_A@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 31 Jul 2019 16:10:42 +0800
Message-ID: <CAEiOBXXSHojFUtkvTXYrhQQcjmqnDSoMAQHqRhvQz_0g=K_SZw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000000f15b3058ef5aa89"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 6/6] target/riscv: Fix
 Floating Point register names
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
X-List-Received-Date: Wed, 31 Jul 2019 08:10:59 -0000

--0000000000000f15b3058ef5aa89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 2:41 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Jul 29, 2019 at 8:19 AM Chih-Min Chao <chihmin.chao@sifive.com>
> wrote:
> >
> >
> > On Fri, Jul 26, 2019 at 2:56 AM Alistair Francis <
> alistair.francis@wdc.com> wrote:
> >>
> >> From: Atish Patra <atish.patra@wdc.com>
> >>
> >> As per the RISC-V spec, Floating Point registers are named as f0..f31
> >> so lets fix the register names accordingly.
> >>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  target/riscv/cpu.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index f8d07bd20a..af1e9b7690 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] =3D {
> >>  };
> >>
> >>  const char * const riscv_fpr_regnames[] =3D {
> >> -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
> >> -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
> >> -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
> >> -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
> >> +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
> >> +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
> >> +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
> >> +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
> >>  };
> >
> >
> > Could you indicate the section of the spec ?
>
> Chapter 11: "=E2=80=9CF=E2=80=9D Standard Extension for Single-Precision
> Floating-Point, Version 2.2", section 11.1, Figure 11.1 shows f0 -
> f32.
>
> > By chapter 20 of user spec, the patch changes the floating register nam=
e
> to architecture name but leave the integer register use the ABI name.
>
> You mean the Packed-SIMD extension?
>
> Alistair
>

I means  "Chapter 20RISC-V Assembly Programmer=E2=80=99s Handbook".
There is an table, "Table 20.1: Assembler mnemonics for RISC-V integer and
=EF=AC=82oating-point registers.",  describes
the architecture name and ABI name for integer and floating-point register.

By the way,  I reference the riscv-spec-2.2

chihmin



> >
> > chihmin
> >>
> >>  const char * const riscv_excp_names[] =3D {
> >> --
> >> 2.22.0
> >>
> >>
>

--0000000000000f15b3058ef5aa89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 31, 2019 at 2:41 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Mon, Jul 29, 2019 at 8:19 AM Chih-Min Chao &lt;<a href=3D"mailto:chihmi=
n.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Jul 26, 2019 at 2:56 AM Alistair Francis &lt;<a href=3D"mailto=
:alistair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; As per the RISC-V spec, Floating Point registers are named as f0..=
f31<br>
&gt;&gt; so lets fix the register names accordingly.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.c=
om" target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fra=
ncis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.c | 8 ++++----<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index f8d07bd20a..af1e9b7690 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] =3D {<=
br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 const char * const riscv_fpr_regnames[] =3D {<br>
&gt;&gt; -=C2=A0 &quot;ft0&quot;, &quot;ft1&quot;, &quot;ft2&quot;,=C2=A0 &=
quot;ft3&quot;,=C2=A0 &quot;ft4&quot;, &quot;ft5&quot;, &quot;ft6&quot;,=C2=
=A0 &quot;ft7&quot;,<br>
&gt;&gt; -=C2=A0 &quot;fs0&quot;, &quot;fs1&quot;, &quot;fa0&quot;,=C2=A0 &=
quot;fa1&quot;,=C2=A0 &quot;fa2&quot;, &quot;fa3&quot;, &quot;fa4&quot;,=C2=
=A0 &quot;fa5&quot;,<br>
&gt;&gt; -=C2=A0 &quot;fa6&quot;, &quot;fa7&quot;, &quot;fs2&quot;,=C2=A0 &=
quot;fs3&quot;,=C2=A0 &quot;fs4&quot;, &quot;fs5&quot;, &quot;fs6&quot;,=C2=
=A0 &quot;fs7&quot;,<br>
&gt;&gt; -=C2=A0 &quot;fs8&quot;, &quot;fs9&quot;, &quot;fs10&quot;, &quot;=
fs11&quot;, &quot;ft8&quot;, &quot;ft9&quot;, &quot;ft10&quot;, &quot;ft11&=
quot;<br>
&gt;&gt; +=C2=A0 &quot;f0&quot;, &quot;f1&quot;, &quot;f2&quot;,=C2=A0 &quo=
t;f3&quot;,=C2=A0 &quot;f4&quot;, &quot;f5&quot;, &quot;f6&quot;, &quot;f7&=
quot;,<br>
&gt;&gt; +=C2=A0 &quot;f8&quot;, &quot;f9&quot;, &quot;f10&quot;,=C2=A0 &qu=
ot;f11&quot;,=C2=A0 &quot;f12&quot;, &quot;f13&quot;, &quot;f14&quot;, &quo=
t;f15&quot;,<br>
&gt;&gt; +=C2=A0 &quot;f16&quot;, &quot;f17&quot;, &quot;f18&quot;,=C2=A0 &=
quot;f19&quot;,=C2=A0 &quot;f20&quot;, &quot;f21&quot;, &quot;f22&quot;, &q=
uot;f23&quot;,<br>
&gt;&gt; +=C2=A0 &quot;f24&quot;, &quot;f25&quot;, &quot;f26&quot;, &quot;f=
27&quot;, &quot;f28&quot;, &quot;f29&quot;, &quot;f30&quot;, &quot;f31&quot=
;<br>
&gt;&gt;=C2=A0 };<br>
&gt;<br>
&gt;<br>
&gt; Could you indicate the section of the spec ?<br>
<br>
Chapter 11: &quot;=E2=80=9CF=E2=80=9D Standard Extension for Single-Precisi=
on<br>
Floating-Point, Version 2.2&quot;, section 11.1, Figure 11.1 shows f0 -<br>
f32.<br>
<br>
&gt; By chapter 20 of user spec, the patch changes the floating register na=
me to architecture name but leave the integer register use the ABI name.<br=
>
<br>
You mean the Packed-SIMD extension?<br>
<br>
Alistair<br></blockquote><div><br></div><div>I means=C2=A0 &quot;Chapter 20=
RISC-V Assembly Programmer=E2=80=99s Handbook&quot;.=C2=A0=C2=A0</div><div>=
There is an table, &quot;Table 20.1: Assembler mnemonics for RISC-V integer=
 and =EF=AC=82oating-point registers.&quot;,=C2=A0 describes=C2=A0</div><di=
v>the architecture name and ABI name for integer and floating-point registe=
r.</div><div><br></div><div>By the way,=C2=A0 I reference the riscv-spec-2.=
2</div><div><br></div><div>chihmin</div><div><br></div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; chihmin<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 const char * const riscv_excp_names[] =3D {<br>
&gt;&gt; --<br>
&gt;&gt; 2.22.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000000f15b3058ef5aa89--

