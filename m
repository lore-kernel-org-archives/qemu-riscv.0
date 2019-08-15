Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hy6JF-0006Zb-GK
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 23:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hy6JC-0006XH-2j
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 23:20:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hy6JA-0000XZ-SH
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 23:20:13 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:57994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hy6JA-0000Qg-LZ
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 23:20:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1565839209; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=TGRmOencxkNJKKjbOhlM38uvH+S9TS7YhpbtNU8KsUo=;
 b=Vkm8/MWm2Y3MLiNOdIGFM5H4tA2fkmLYMkvAZLUahbYX6ik/xuXpgTs6sPfxD/ewlr2x+lpC
 6K7iQPYlALmJU/zQ6CcG9aJgCRPpWSOnNtrmsAdHxZT5z8cuBWeY5Z2EZUH1ETODRy7FoIJd
 ddiuSnkt3zrDbr17fvOa6NkVMgzGqlzDEIs4PipSqrzFPXs6vLr3c4ieVnRJW3Wh3xXv7Ipa
 JjMx3TmLkX8MOitBHJl9ZLPJnmpQyuBhAbS2+v0tRU9vpGl041U5gNSg53njDcFthHqTAxK2
 j0FGfEze1tN+labGxXO4Kpac1+GQz3UnkPoV2GZk1+D+GE3bL4JnEg==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mxa.mailgun.org with ESMTP id 5d54cf67.7fe250f0ebf0-smtp-out-n03;
 Thu, 15 Aug 2019 03:20:07 -0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x3so774345lfc.0;
 Wed, 14 Aug 2019 20:20:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVCtMJQQkq3/AH3mkEHtel47ZsJLAVwAocSiQWWlt7n6kQtJeSX
 24AQhmtkXNocmlBqTbRrZRwCEk/uKQM7e/PGmEE=
X-Google-Smtp-Source: APXvYqwZFRkstBb1VAzkVdfbew4AawzIrkKGElCn1QcxgEZMyab1OvQT+XWlX75BvdTIVpeT4SIceHRbymph9yAtN7Q=
X-Received: by 2002:a19:6f09:: with SMTP id k9mr1318809lfc.102.1565839205247; 
 Wed, 14 Aug 2019 20:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190701154617.22908-1-jonathan@fintelia.io>
 <CAKmqyKOsMO7SvvDfiqhywxb=oaqo=NDjw==reVpU9sLh+3dGuw@mail.gmail.com>
 <CAEUhbmXBnu_Fet99AjQj6XZ10m045N8kY7d8VNy28ktmFBsrQQ@mail.gmail.com>
 <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
In-Reply-To: <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Wed, 14 Aug 2019 23:19:39 -0400
X-Gmail-Original-Message-ID: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
Message-ID: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
To: "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000009ab18f05901f59c7"
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
X-List-Received-Date: Thu, 15 Aug 2019 03:20:15 -0000

--0000000000009ab18f05901f59c7
Content-Type: text/plain; charset="UTF-8"

Ping! What is the status of this patch?

On Wed, Jul 3, 2019 at 2:02 PM Jonathan Behrens <jonathan@fintelia.io>
wrote:

> Bin, that proposal proved to be somewhat more controversial than I was
> expecting, since it was different than how currently available hardware
> worked. This option seemed much more likely to be accepted in the short
> term.
>
> Jonathan
>
> On Mon, Jul 1, 2019 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>> On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis <alistair23@gmail.com>
>> wrote:
>> >
>> > On Mon, Jul 1, 2019 at 8:56 AM <jonathan@fintelia.io> wrote:
>> > >
>> > > From: Jonathan Behrens <jonathan@fintelia.io>
>> > >
>> > > QEMU currently always triggers an illegal instruction exception when
>> > > code attempts to read the time CSR. This is valid behavor, but only if
>> > > the TM bit in mcounteren is hardwired to zero. This change also
>> > > corrects mcounteren and scounteren CSRs to be 32-bits on both 32-bit
>> > > and 64-bit targets.
>> > >
>> > > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
>> >
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>>
>> I am a little bit lost here. I think we agreed to allow directly read
>> to time CSR when mcounteren.TM is set, no?
>>
>> Regards,
>> Bin
>>
>

--0000000000009ab18f05901f59c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping! What is the status of this patch?<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, =
2019 at 2:02 PM Jonathan Behrens &lt;<a href=3D"mailto:jonathan@fintelia.io=
">jonathan@fintelia.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div>Bin, that proposal proved to be=
 somewhat more controversial than I was expecting, since it was different t=
han how currently available hardware worked. This option seemed much more l=
ikely to be accepted in the short term. <br></div><div><br></div><div>Jonat=
han<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Jul 1, 2019 at 9:26 PM Bin Meng &lt;<a href=3D"mailto:=
bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jul 2, 2019=
 at 8:20 AM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com" ta=
rget=3D"_blank">alistair23@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div>

--0000000000009ab18f05901f59c7--

