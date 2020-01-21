Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ittEV-0005i1-IO
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 08:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittEO-0005Xk-1V
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittEJ-00009f-Nm
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:06:07 -0500
Received: from rs224.mailgun.us ([209.61.151.224]:18516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1ittEJ-0008UM-J7
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 08:06:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1579611953; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=AO4uiXu3ecvaYatTI1v/4EKvdGj5NK0QIjh304qeVOU=;
 b=HREncNaE5bUB1obLaRkCcPGcBaySlrzKVzm4XEjSghW3p8Tubr1IlSFCw8ksmnzmWh31UIDl
 lLlXdekKz/ww4zAO2UWHm4l0xFZYem2xoMpZc6wq741HPMVfnY23sEPlJ4wz0uWVVCilAsPh
 q/ZhNE/S7ZqLuqDtU7umuzw8Flm3jKBN2b9RtJcQug23vzekucvp9Jte250ZnH2pMV1BxiL1
 v6cNI0QZ8xiIGJ7dM8wqR+XrDfsSgtlUNAsLJkqRfKyIh4f+vrJU0yU55IcKSS1IVdPI0pTT
 vMPGYgc5F4omZvroppqiIS5SUphjPn7rGNtX5jQ8uxPCXg2jgtA49A==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mxa.mailgun.org with ESMTP id 5e26f72f.7f374620ab70-smtp-out-n03;
 Tue, 21 Jan 2020 13:05:51 -0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id r19so2703694ljg.3;
 Tue, 21 Jan 2020 05:05:50 -0800 (PST)
X-Gm-Message-State: APjAAAV1F9/9vFYGEFUaRXKIJCMvZvFdi9RfWySqpPr+HsiNZyQLbP9R
 QCoPsUouKV9ddlv0Wqgvs1lQaDEYh20zsnKl7Rg=
X-Google-Smtp-Source: APXvYqz4qQ8oNQNzEokMOUd5Vtmh0pgRqKd0htmZBnLrk721oKLb1/2yj1Oq+1SLR7r/S2AETfuwXm5RtAzeMhkL2to=
X-Received: by 2002:a2e:9118:: with SMTP id m24mr16627128ljg.105.1579611949593; 
 Tue, 21 Jan 2020 05:05:49 -0800 (PST)
MIME-Version: 1.0
References: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
 <mhng-4545b3da-b9ba-4fa2-91e8-b0d7e66329d8@palmer-si-x1c4>
In-Reply-To: <mhng-4545b3da-b9ba-4fa2-91e8-b0d7e66329d8@palmer-si-x1c4>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Tue, 21 Jan 2020 08:05:23 -0500
X-Gmail-Original-Message-ID: <CANnJOVFZmmwvpdvLfr8r3VK1pudV_rmh3-iq_sgLZNsjkwQ_2A@mail.gmail.com>
Message-ID: <CANnJOVFZmmwvpdvLfr8r3VK1pudV_rmh3-iq_sgLZNsjkwQ_2A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2] target/riscv: Hardwire mcounter.TM and
 upper bits of [m|s]counteren
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000237b3f059ca611ad"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Tue, 21 Jan 2020 13:06:13 -0000

--000000000000237b3f059ca611ad
Content-Type: text/plain; charset="UTF-8"

I was just doubling checking the status of this patch because it conflicts
with the "RISC-V TIME CSR for privileged mode" PR that was just sent out,
and it seems this never got merged? In any case, perhaps these changes
should be rolled into that patch?

On Wed, Aug 21, 2019 at 1:37 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Wed, 14 Aug 2019 20:19:39 PDT (-0700), jonathan@fintelia.io wrote:
> > Ping! What is the status of this patch?
>
> Sorry, I must have lost track of it.  I've added it to my patch queue.
>
> >
> > On Wed, Jul 3, 2019 at 2:02 PM Jonathan Behrens <jonathan@fintelia.io>
> > wrote:
> >
> >> Bin, that proposal proved to be somewhat more controversial than I was
> >> expecting, since it was different than how currently available hardware
> >> worked. This option seemed much more likely to be accepted in the short
> >> term.
> >>
> >> Jonathan
> >>
> >> On Mon, Jul 1, 2019 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >>> On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis <alistair23@gmail.com>
> >>> wrote:
> >>> >
> >>> > On Mon, Jul 1, 2019 at 8:56 AM <jonathan@fintelia.io> wrote:
> >>> > >
> >>> > > From: Jonathan Behrens <jonathan@fintelia.io>
> >>> > >
> >>> > > QEMU currently always triggers an illegal instruction exception
> when
> >>> > > code attempts to read the time CSR. This is valid behavor, but
> only if
> >>> > > the TM bit in mcounteren is hardwired to zero. This change also
> >>> > > corrects mcounteren and scounteren CSRs to be 32-bits on both
> 32-bit
> >>> > > and 64-bit targets.
> >>> > >
> >>> > > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> >>> >
> >>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>> >
> >>>
> >>> I am a little bit lost here. I think we agreed to allow directly read
> >>> to time CSR when mcounteren.TM is set, no?
> >>>
> >>> Regards,
> >>> Bin
> >>>
> >>
>

--000000000000237b3f059ca611ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was just doubling checking the status of this patch beca=
use it conflicts with the &quot;RISC-V TIME CSR for privileged mode&quot; P=
R that was just sent out, and it seems this never got merged? In any case, =
perhaps these changes should be rolled into that patch?<br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 21, =
2019 at 1:37 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com">pal=
mer@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, 14 Aug 2019 20:19:39 PDT (-0700), <a href=3D"mailto:j=
onathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a> wrote:<br>
&gt; Ping! What is the status of this patch?<br>
<br>
Sorry, I must have lost track of it.=C2=A0 I&#39;ve added it to my patch qu=
eue.<br>
<br>
&gt;<br>
&gt; On Wed, Jul 3, 2019 at 2:02 PM Jonathan Behrens &lt;<a href=3D"mailto:=
jonathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Bin, that proposal proved to be somewhat more controversial than I=
 was<br>
&gt;&gt; expecting, since it was different than how currently available har=
dware<br>
&gt;&gt; worked. This option seemed much more likely to be accepted in the =
short<br>
&gt;&gt; term.<br>
&gt;&gt;<br>
&gt;&gt; Jonathan<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 1, 2019 at 9:26 PM Bin Meng &lt;<a href=3D"mailto:bmen=
g.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis &lt;<a href=3D=
"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt=
;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Mon, Jul 1, 2019 at 8:56 AM &lt;<a href=3D"mailto:jona=
than@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; From: Jonathan Behrens &lt;<a href=3D"mailto:jonatha=
n@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; QEMU currently always triggers an illegal instructio=
n exception when<br>
&gt;&gt;&gt; &gt; &gt; code attempts to read the time CSR. This is valid be=
havor, but only if<br>
&gt;&gt;&gt; &gt; &gt; the TM bit in mcounteren is hardwired to zero. This =
change also<br>
&gt;&gt;&gt; &gt; &gt; corrects mcounteren and scounteren CSRs to be 32-bit=
s on both 32-bit<br>
&gt;&gt;&gt; &gt; &gt; and 64-bit targets.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailt=
o:jonathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alist=
air.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am a little bit lost here. I think we agreed to allow direct=
ly read<br>
&gt;&gt;&gt; to time CSR when mcounteren.TM is set, no?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Bin<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000237b3f059ca611ad--

