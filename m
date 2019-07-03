Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hijbf-0001OT-6L
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 14:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hijbX-0001Fq-Pa
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 14:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hijbW-0005rH-Oo
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 14:03:39 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:56334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hijbU-0005lw-GG
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 14:03:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1562177012; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=cFsveXpt62Kbr2tJ04ztChy5Zigq6AHRo8hGSNeg8p4=;
 b=7PV+YFqSdg0FnA5FdHFZyGlU8IApcFNK+DFFQyvgPY3SfQtvqjN+KQmVij+bHpRtZyspb8DD
 +ujE8G1HO9BVAW62/5Z7iWpZlFFgc3UbGEud8jd5lakgDLECUxJANIqHzFEC/bkc73TvSCHO
 0xQBh0gaLS48mARhM6/oH7azSAlV94lYJWbsXe6qjRXCEHbcxdCHZCqBoEOzs2hR2YTAi2Kn
 kwjhRoz2cP8Q7/SFIeTOgjBwXvFpdqfNYe6IHEXHEytZU1TzTKlIsULLiA8poZ5Tv4ZYWETM
 R+Y3QAZSbaJndSTB4nKWrpWHZr2L/tc6hZSb19gCFhZLr+vddwvwfA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mxa.mailgun.org with ESMTP id 5d1cedf3.7fc2f111b030-smtp-out-n02;
 Wed, 03 Jul 2019 18:03:31 -0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z15so2392517lfh.13;
 Wed, 03 Jul 2019 11:03:31 -0700 (PDT)
X-Gm-Message-State: APjAAAUNo8WnduhiZa61H6vJ65JHFWDaNauAJurHs0s/9EJajyQkmGt7
 4r1rqJQGun0DKs4xQaaf5nmgFODwzqXShxBbC0A=
X-Google-Smtp-Source: APXvYqyfkgQCPmcR1HsXdOf3vkEZa5etH7twRV+o969RC9jqcMtEoMisHD18e7OZIoxF79/wPFUY0d7yrmPLsnxsQcM=
X-Received: by 2002:ac2:518d:: with SMTP id u13mr18744065lfi.40.1562177010158; 
 Wed, 03 Jul 2019 11:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190701154617.22908-1-jonathan@fintelia.io>
 <CAKmqyKOsMO7SvvDfiqhywxb=oaqo=NDjw==reVpU9sLh+3dGuw@mail.gmail.com>
 <CAEUhbmXBnu_Fet99AjQj6XZ10m045N8kY7d8VNy28ktmFBsrQQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXBnu_Fet99AjQj6XZ10m045N8kY7d8VNy28ktmFBsrQQ@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Wed, 3 Jul 2019 14:02:56 -0400
X-Gmail-Original-Message-ID: <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
Message-ID: <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000c45219058ccaad2f"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] target/riscv: Hardwire
 mcounter.TM and upper bits of [m|s]counteren
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
X-List-Received-Date: Wed, 03 Jul 2019 18:03:41 -0000

--000000000000c45219058ccaad2f
Content-Type: text/plain; charset="UTF-8"

Bin, that proposal proved to be somewhat more controversial than I was
expecting, since it was different than how currently available hardware
worked. This option seemed much more likely to be accepted in the short
term.

Jonathan

On Mon, Jul 1, 2019 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis <alistair23@gmail.com>
> wrote:
> >
> > On Mon, Jul 1, 2019 at 8:56 AM <jonathan@fintelia.io> wrote:
> > >
> > > From: Jonathan Behrens <jonathan@fintelia.io>
> > >
> > > QEMU currently always triggers an illegal instruction exception when
> > > code attempts to read the time CSR. This is valid behavor, but only if
> > > the TM bit in mcounteren is hardwired to zero. This change also
> > > corrects mcounteren and scounteren CSRs to be 32-bits on both 32-bit
> > > and 64-bit targets.
> > >
> > > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
>
> I am a little bit lost here. I think we agreed to allow directly read
> to time CSR when mcounteren.TM is set, no?
>
> Regards,
> Bin
>

--000000000000c45219058ccaad2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Bin, that proposal proved to be somewhat more controv=
ersial than I was expecting, since it was different than how currently avai=
lable hardware worked. This option seemed much more likely to be accepted i=
n the short term. <br></div><div><br></div><div>Jonathan<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, J=
ul 1, 2019 at 9:26 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" ta=
rget=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, Jul 2, 2019 at 8:20 AM Alistair F=
rancis &lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alista=
ir23@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jul 1, 2019 at 8:56 AM &lt;<a href=3D"mailto:jonathan@fintelia=
.io" target=3D"_blank">jonathan@fintelia.io</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Jonathan Behrens &lt;<a href=3D"mailto:jonathan@fintelia.io=
" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; QEMU currently always triggers an illegal instruction exception w=
hen<br>
&gt; &gt; code attempts to read the time CSR. This is valid behavor, but on=
ly if<br>
&gt; &gt; the TM bit in mcounteren is hardwired to zero. This change also<b=
r>
&gt; &gt; corrects mcounteren and scounteren CSRs to be 32-bits on both 32-=
bit<br>
&gt; &gt; and 64-bit targets.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:jonathan@fi=
ntelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;<br>
<br>
I am a little bit lost here. I think we agreed to allow directly read<br>
to time CSR when mcounteren.TM is set, no?<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--000000000000c45219058ccaad2f--

