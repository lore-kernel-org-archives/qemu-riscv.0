Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4md4-000387-66
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:12:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4mcz-00033y-Jv
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:12:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4mct-0004pV-0N
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:11:58 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:38550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4mcp-0004oD-OH
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:11:53 -0400
Received: by mail-qt1-x832.google.com with SMTP id s1so9959187qte.5
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GLrgUsnqXZ3XZpsfMem3u5aVBthdwPvasKIxOvCO5FY=;
	b=Nq0HRpp4p5ARObKpa/26quWfTFTow2VxqWNVcGlsqUkooJZIruwN/D8rJmBxF+3yMg
	7l0KWoAAtO8osjUp4WEMkfCYU95PxWs3GYqAmJ4r9BK3J91Og7MKL9b6jkwpOossuWUK
	mjI4I7uZfb+hEmmBuntcmwLeCEEb9x+YIXhncWKb50xLDCHdEV7D0u+e2Wak0qgfnk8M
	LsSZjyN7UfPeUddmu2JNPSRNJAaiknbNNCD1A9KxcWe2MKMovwtKKP48bgdTuQY+xJNQ
	89PolgEE60hwwwnkzgJw2K/BfQ2xJz4fdCkEeyXAZdJn/PD/aiLhbtEToga/gH3Vsj46
	K9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GLrgUsnqXZ3XZpsfMem3u5aVBthdwPvasKIxOvCO5FY=;
	b=QbH6KRws6/4eXWuO8uYWfps3LS0oCzfxopSWbfH7ze2sfoJC1bBMtP+5oJwIDcIsUd
	90Ga3J5COUEKAARe+zJoBVvDSzCLkzSoIPqVdxwpCMqIVH8wcilC13cvAxgJuiP3SePa
	5sWRxH5vLNCfRarf6kPa6PhsxdnCGSdPCoSAr3v2DXwKjSO6zVBQzTQ5xP4cBai1ju80
	aTPLLFs6B7hNw89Z7mLF18AkLrBO9IRhXK9H5q67XCKk8qLJIKKAWGiHum7UoQ0e4ikf
	HQuMfQBsobqLVOP7YwJVcsFEC5BfmwDQpNgKHpFtYf47jaTHolfi3i81/inZaUfLDWPh
	jjEA==
X-Gm-Message-State: APjAAAXfSKeZHHoD9XizQrWs0wUFCj6FNOuyToZJAw3cyBHNBUqz9pbn
	nTYnRmhMeTwvt3YgiyejaNDL1cXNUgJrkQ==
X-Google-Smtp-Source: APXvYqzaGnbfvpS6Yckp57M5H7gjIfNs2Sum/yEwHa3CYms9Yb2Uckw27dfPHVNBnx39PgdhbfIQQg==
X-Received: by 2002:a0c:e703:: with SMTP id d3mr2238771qvn.47.1552651670710;
	Fri, 15 Mar 2019 05:07:50 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
	[209.85.160.178]) by smtp.gmail.com with ESMTPSA id
	m128sm1016622qkf.53.2019.03.15.05.07.49 for <qemu-riscv@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 05:07:49 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id b3so9727972qtj.3
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 05:07:49 -0700 (PDT)
X-Received: by 2002:aed:3687:: with SMTP id f7mr2411860qtb.147.1552651669025; 
	Fri, 15 Mar 2019 05:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <2d60f4a8-66ae-12e0-6de4-2440eab2459a@mail.uni-paderborn.de>
	<mhng-c6f37e6f-035e-4bdd-9853-de6c69edef3a@palmer-si-x1c4>
In-Reply-To: <mhng-c6f37e6f-035e-4bdd-9853-de6c69edef3a@palmer-si-x1c4>
From: Palmer Dabbelt <palmer@sifive.com>
Date: Fri, 15 Mar 2019 05:07:37 -0700
X-Gmail-Original-Message-ID: <CANs6eMnXic+ypkQRrgCFuUKLe+Q9p00BYEDkoYbhT-rfiC0WBQ@mail.gmail.com>
Message-ID: <CANs6eMnXic+ypkQRrgCFuUKLe+Q9p00BYEDkoYbhT-rfiC0WBQ@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: alistair23@gmail.com, Peter Maydell <peter.maydell@linaro.org>, 
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000031572e058420e377"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::832
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 17/29] target/riscv: Convert
 quadrant 1 of RVXC insns to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 13:12:04 -0000

--00000000000031572e058420e377
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 4:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Fri, 15 Mar 2019 02:06:07 PDT (-0700), Bastian Koppelmann wrote:
> > Hi Alistair
> >
> > On 3/14/19 9:28 PM, Alistair Francis wrote:
> >> On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> >>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> >>>
> >>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> >>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> >> This commit is the first bad commit in breaking 32-bit boot.
> >>
> >> It looks like the jal doesn't jump to the correct address:
> >>
> >> ----------------
> >> IN:
> >> 0x80000022:  00050433          add             s0,a0,zero
> >> 0x80000026:  000584b3          add             s1,a1,zero
> >> 0x8000002a:  2c79              jal             ra,670          #
> 0x800002c8
> >>
> >> ----------------
> >> IN:
> >> 0x800002c8:  00000533          add             a0,zero,zero
> >> 0x800002cc:  8082              ret
> >
> >
> > Oops! Can you point me to the binary to reproduce this?
>
> I think I've traced it down to something simple: in my hello world binary
> I see
>
>     20401a8c:       2a45                    jal     20401c3c <atexit>
>
> in the objdump, and I see
>
>     IN: _start
>     0x20401a8c:  2a45              jal             ra,432          #
> 0x20401c3c
>
> but then QEMU jumps to 0x20401a9d.  I have a feeling it's something wrong
> with
> gen_jal() that disappeared during the cleanups that we dropped in order to
> fix
> the build issues.
>
> I'm running
>
>     ./riscv32-softmmu/qemu-system-riscv32 -machine sifive_e -kernel
> ~/work/sifive/freedom-e-sdk/software/hello/hello -nographic -d
> in_asm,out_asm,exec,cpu -singlestep |& tee out.log
>
> on the "hifive1" branch of github.com/palmer-dabbelt/qemu, which just has
> a
> PRCI fixup that I forgot about and haven't sent upstream yet (I'll do that
> after this issue).  The binary should be at
>
>     http://www.dabbelt.com/~palmer/hello.elf
>
> and the debug log at
>
>     http://www.dabbelt.com/~palmer/out.log
>
> You can build the binary from github.com/sifive/freedom-e-sdk via
>
>    make software PROGRAM=hello TARGET=sifive-hifive1
>
> using the riscv64-unknown-elf-gcc-20181127-x86_64-linux-ubuntu14 toolchain
> binaries from our website (newer ones should work, but probably won't
> produce
> exactly the same output).
>
> I'll poke around after grabbing some dinner...
>

OK, I'm pretty sure this is it:

c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm
manually

static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
{
#ifdef TARGET_RISCV32
    /* C.JAL */
    arg_jal arg = { .rd = 1, .imm = a->imm };
    return trans_jal(ctx, &arg);
#else
    /* C.ADDIW */
    arg_addiw arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
    return trans_addiw(ctx, &arg);
#endif
}

It parses RD manually, but not IMM :)  I'm actually going to eat now...

--00000000000031572e058420e377
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Fri,=
 Mar 15, 2019 at 4:19 AM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive=
.com">palmer@sifive.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 15 Mar 2019 02:06=
:07 PDT (-0700), Bastian Koppelmann wrote:<br>
&gt; Hi Alistair<br>
&gt;<br>
&gt; On 3/14/19 9:28 PM, Alistair Francis wrote:<br>
&gt;&gt; On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt &lt;<a href=3D"mail=
to:palmer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br=
>
&gt;&gt;&gt; From: Bastian Koppelmann &lt;<a href=3D"mailto:kbastian@mail.u=
ni-paderborn.de" target=3D"_blank">kbastian@mail.uni-paderborn.de</a>&gt;<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.h=
enderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;=
<br>
&gt;&gt;&gt; Signed-off-by: Bastian Koppelmann &lt;<a href=3D"mailto:kbasti=
an@mail.uni-paderborn.de" target=3D"_blank">kbastian@mail.uni-paderborn.de<=
/a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Peer Adelt &lt;<a href=3D"mailto:peer.adelt@hni=
.uni-paderborn.de" target=3D"_blank">peer.adelt@hni.uni-paderborn.de</a>&gt=
;<br>
&gt;&gt; This commit is the first bad commit in breaking 32-bit boot.<br>
&gt;&gt;<br>
&gt;&gt; It looks like the jal doesn&#39;t jump to the correct address:<br>
&gt;&gt;<br>
&gt;&gt; ----------------<br>
&gt;&gt; IN:<br>
&gt;&gt; 0x80000022:=C2=A0 00050433=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s0,a0,zero<br>
&gt;&gt; 0x80000026:=C2=A0 000584b3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s1,a1,zero<br>
&gt;&gt; 0x8000002a:=C2=A0 2c79=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 jal=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra,670=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # 0x800002c8<br>
&gt;&gt;<br>
&gt;&gt; ----------------<br>
&gt;&gt; IN:<br>
&gt;&gt; 0x800002c8:=C2=A0 00000533=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a0,zero,zero<br>
&gt;&gt; 0x800002cc:=C2=A0 8082=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret<br>
&gt;<br>
&gt;<br>
&gt; Oops! Can you point me to the binary to reproduce this?<br>
<br>
I think I&#39;ve traced it down to something simple: in my hello world bina=
ry I see<br>
<br>
=C2=A0 =C2=A0 20401a8c:=C2=A0 =C2=A0 =C2=A0 =C2=A02a45=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jal=C2=A0 =C2=A0 =C2=A0204=
01c3c &lt;atexit&gt;<br>
<br>
in the objdump, and I see<br>
<br>
=C2=A0 =C2=A0 IN: _start<br>
=C2=A0 =C2=A0 0x20401a8c:=C2=A0 2a45=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 jal=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra,432=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 0x20401c3c<br>
<br>
but then QEMU jumps to 0x20401a9d.=C2=A0 I have a feeling it&#39;s somethin=
g wrong with <br>
gen_jal() that disappeared during the cleanups that we dropped in order to =
fix <br>
the build issues.<br>
<br>
I&#39;m running<br>
<br>
=C2=A0 =C2=A0 ./riscv32-softmmu/qemu-system-riscv32 -machine sifive_e -kern=
el ~/work/sifive/freedom-e-sdk/software/hello/hello -nographic -d in_asm,ou=
t_asm,exec,cpu -singlestep |&amp; tee out.log<br>
<br>
on the &quot;hifive1&quot; branch of <a href=3D"http://github.com/palmer-da=
bbelt/qemu" rel=3D"noreferrer" target=3D"_blank">github.com/palmer-dabbelt/=
qemu</a>, which just has a <br>
PRCI fixup that I forgot about and haven&#39;t sent upstream yet (I&#39;ll =
do that <br>
after this issue).=C2=A0 The binary should be at<br>
<br>
=C2=A0 =C2=A0 <a href=3D"http://www.dabbelt.com/~palmer/hello.elf" rel=3D"n=
oreferrer" target=3D"_blank">http://www.dabbelt.com/~palmer/hello.elf</a><b=
r>
<br>
and the debug log at <br>
<br>
=C2=A0 =C2=A0 <a href=3D"http://www.dabbelt.com/~palmer/out.log" rel=3D"nor=
eferrer" target=3D"_blank">http://www.dabbelt.com/~palmer/out.log</a><br>
<br>
You can build the binary from <a href=3D"http://github.com/sifive/freedom-e=
-sdk" rel=3D"noreferrer" target=3D"_blank">github.com/sifive/freedom-e-sdk<=
/a> via<br>
<br>
=C2=A0 =C2=A0make software PROGRAM=3Dhello TARGET=3Dsifive-hifive1<br>
<br>
using the riscv64-unknown-elf-gcc-20181127-x86_64-linux-ubuntu14 toolchain =
<br>
binaries from our website (newer ones should work, but probably won&#39;t p=
roduce <br>
exactly the same output).<br>
<br>
I&#39;ll poke around after grabbing some dinner...<br></blockquote><div><br=
></div><div>OK, I&#39;m pretty sure this is it:</div><div><br></div><div>c_=
jal_addiw=C2=A0 =C2=A0 =C2=A0 =C2=A0001 .=C2=A0 .....=C2=A0 ..... 01 @ci #N=
ote: parse rd and/or imm manually</div><div><br></div><div><div>static bool=
 trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)</div><div>{</div>=
<div>#ifdef TARGET_RISCV32</div><div>=C2=A0 =C2=A0 /* C.JAL */</div><div>=
=C2=A0 =C2=A0 arg_jal arg =3D { .rd =3D 1, .imm =3D a-&gt;imm };</div><div>=
=C2=A0 =C2=A0 return trans_jal(ctx, &amp;arg);</div><div>#else</div><div>=
=C2=A0 =C2=A0 /* C.ADDIW */</div><div>=C2=A0 =C2=A0 arg_addiw arg =3D { .rd=
 =3D a-&gt;rd, .rs1 =3D a-&gt;rd, .imm =3D a-&gt;imm };</div><div>=C2=A0 =
=C2=A0 return trans_addiw(ctx, &amp;arg);</div><div>#endif</div><div>}</div=
></div><div><br></div><div>It parses RD manually, but not IMM :)=C2=A0 I&#3=
9;m actually going to eat now...</div><div><br></div></div></div></div></di=
v>

--00000000000031572e058420e377--

