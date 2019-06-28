Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgxHT-0007IG-JO
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 16:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hgxHP-0007I2-IY
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 16:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hgxHM-0002xb-Lq
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 16:15:31 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:43466)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hgxHM-0002kz-4X; Fri, 28 Jun 2019 16:15:28 -0400
Received: by mail-lj1-x243.google.com with SMTP id 16so7155120ljv.10;
 Fri, 28 Jun 2019 13:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aYTK9J99y9emOJnlzqzmby9UkQbrIF0+cvqmwJd/X4A=;
 b=ZKXamYw5XAEvVFZ5wPUPeIXB9ZpCNtawUm3daJon43STP7+0W/32AsLFVJ4EZmNWEC
 oppoiuL4e5d0tpKqK0bjUbE9NyI1NatOy8or3ypZuYCTkjALXXc/h518k/uqnpNA1wXM
 J5lawBtK6cUfNpEWJ3IY6D9PjgT3sAMh9YpKhDwLngPwi48xor9912ZJdJvd1mmDrDJe
 gnnf0rIP3/4MINET+06VqnE/oc3cK6MHjhLWhw0xOU8hdwJL70whATZpT7KiiqMUgks5
 cktcFELYpVIN9ctcCpsov36x5zjuzV38qENBhcpxtmcGpPrsIA5ynT3QvEC6oZW4H/+Q
 yCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYTK9J99y9emOJnlzqzmby9UkQbrIF0+cvqmwJd/X4A=;
 b=j5hbA+o80oT/XiixiwsN6tW3jUD87YKtMJ6fdQ3VL7vdDV2f+l9/7hbzDu7FJJX+Ke
 udjSYMLZanWbmsILeTxjER2KuciW+dV2MsCMyWPbmR7Akkbo6FhbUy2FEC1E/Uadjy4B
 gIXDcBNbAAJtiv98mHNyYZnll6JCYp/6nft67JwbqH6SYu1wvy6uei9HiGv+uOIFKC7G
 12pZ5FEBQt0Ap1I6/ZYnGRnIuReNKTQea+QQuj7s4HYnZV5PYnvYZo25S2xjrA+mQEka
 Jb0I9VtiRqXEwmFBaR9lsacjVSQ7USPRIFkEpdp8CfovkV7DS4RKsXAP7n20a4SV6Ei5
 3PpA==
X-Gm-Message-State: APjAAAWngJX7Wo6Ta4eEHVzz6vJA68TY7uKPFuMj+JHiP48WEXNXH4NA
 Rgaf8SVH5nuHIpkdBjwzDxmvT1nbCrJEod2MdN4=
X-Google-Smtp-Source: APXvYqwjvQfw5RdO5SUD/EbcWgeOf0IfFYd8acgydvAEODWBiyIP3eg32VQc6DLqVuxx1emOhHiJq8Y85/96SP4yONY=
X-Received: by 2002:a2e:8847:: with SMTP id z7mr7382711ljj.51.1561752917783;
 Fri, 28 Jun 2019 13:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMAGJFgJV1Y9W+ne_=jipqGMtZMKRHJmN5qpNVZrKUTeg@mail.gmail.com>
 <mhng-89e59e27-71b5-4452-93af-a889983f711c@palmer-si-x1e>
 <CAKmqyKNiZheaqC5UHkOMY+s54vgR8ho1gequAM4Sts3=25DzkA@mail.gmail.com>
In-Reply-To: <CAKmqyKNiZheaqC5UHkOMY+s54vgR8ho1gequAM4Sts3=25DzkA@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Fri, 28 Jun 2019 16:14:45 -0400
Message-ID: <CANnJOVE_cQRVhcHGiJ3m9Tu4H89D_Tb9_UvSnhoDCgF_ddgo8Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000e43a2b058c67ef60"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v3] target/riscv:
 Expose time CSRs when allowed by [m|s]counteren
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
X-List-Received-Date: Fri, 28 Jun 2019 20:15:34 -0000

--000000000000e43a2b058c67ef60
Content-Type: text/plain; charset="UTF-8"

 > Taking a patch that matches the out-of-spec FU540 behavior doesn't make
any
> sense, I don't want to implement errata in QEMU :)

QEMU actually currently matches the out of spec behavior of the FU540, I
just sent out a patch to fix this.

Jonathan

On Fri, Jun 28, 2019 at 2:26 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Jun 27, 2019 at 11:12 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Thu, 27 Jun 2019 12:56:57 PDT (-0700), alistair23@gmail.com wrote:
> > > On Wed, Jun 26, 2019 at 1:25 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> > >>
> > >> On Tue, 25 Jun 2019 23:58:34 PDT (-0700), bmeng.cn@gmail.com wrote:
> > >> > On Wed, Jun 26, 2019 at 4:23 AM Jonathan Behrens <
> fintelia@gmail.com> wrote:
> > >> >>
> > >> >> I just did some testing on a HiFive Unleashed board and can
> confirm what
> > >> >> you are saying. The low 5 bits of both mcounteren and scounteren
> are
> > >> >> writable (if you try to write 0xFFFFFFFF to them, they'll take on
> the value
> > >> >> 0x1F) but even with the TM bit set in both mcounteren and
> scounteren the
> > >> >> rdtime instruction always generates an illegal instruction
> exception.
> > >> >>
> > >> >
> > >> > Then I would think the FU540 is not spec complaint :)
> > >>
> > >> Ya, it's an errata.  There's a handful of them :)
> > >>
> > >> >> Reading through the relevant chapter of the spec, I still think
> that having
> > >> >> mcounteren.TM be writable but making rdtime unconditionally trap is
> > >> >> non-conformant. If other people feel strongly that rdtime should
> always
> > >> >
> > >> > Agree. To test hardware (FU540) compatibility in QEMU, maybe we can
> > >> > add a cpu property to allow hard-wiring mcounteren.TM to zero?
> > >>
> > >> In theory we should have properties to control the behavior of all
> WARL fields,
> > >> but it's a lot of work.  I'd be happy to take a patch for any of them.
> > >
> > > Hmmm... We should avoid taking patches that don't adhere to the spec
> > > just to match some hardware. In the case that core/popular software
> > > doesn't work it probably makes sense, but in general it's probably not
> > > the best move.
> >
> > WARL is Write Any Read Legal.  Essentially it means that the hardware
> gets to
> > decide what sort of behavior that field has, and is the mechanism for
> optional
> > features in the ISA.  In this case it'd be entirely within spec,
> specifically:
> >
> >     Registers mcounteren and scounteren are WARL registers that must be
> >     implemented if U-mode and S-mode are implemented. Any of the bits may
> >     contain a hardwired value of zero, indicating reads to the
> corresponding
> >     counter will cause an illegal instruction exception when executing
> in a
> >     less-privileged mode.
> >
> > Taking a patch that matches the out-of-spec FU540 behavior doesn't make
> any
> > sense, I don't want to implement errata in QEMU :)
>
> Ah, I misread your email. That is fine then :)
>
> Alistair
>
> >
> > >
> > > Alistair
> > >
> > >>
> > >> >> require trapping into firmware then the natural change would be to
> simply
> > >> >> hardwire mcounteren.TM to zero (the value in scounteren wouldn't
> matter in
> > >> >> that case so it could be left writable). My own (biased) personal
> feeling
> > >> >> is that this full implementation makes sense at least for the
> `virt`
> > >> >> machine type because it represents a clear case where deviating
> from
> > >> >> current hardware enables a performance boost, and would not break
> > >> >> compatibility with any current software: both OpenSBI and BBL try
> to enable
> > >> >> hardware handling of rdtime when the platform claims to support it.
> > >> >>
> > >> >
> > >> > Regards,
> > >> > Bin
> > >>
>

--000000000000e43a2b058c67ef60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
&gt; Taking a patch that matches the out-of-spec FU540 behavior doesn&#39;t=
 make any<br><div>
&gt; sense, I don&#39;t want to implement errata in QEMU :)</div><div><br><=
/div><div>QEMU actually currently matches the out of spec behavior of the F=
U540, I just sent out a patch to fix this.</div><div><br></div><div>Jonatha=
n<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 28, 2019 at 2:26 PM Alistair Francis &lt;<a href=3D"=
mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 27, 2019 at 11=
:12 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com" target=3D"_b=
lank">palmer@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 27 Jun 2019 12:56:57 PDT (-0700), <a href=3D"mailto:alistair23=
@gmail.com" target=3D"_blank">alistair23@gmail.com</a> wrote:<br>
&gt; &gt; On Wed, Jun 26, 2019 at 1:25 AM Palmer Dabbelt &lt;<a href=3D"mai=
lto:palmer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, 25 Jun 2019 23:58:34 PDT (-0700), <a href=3D"mailto:b=
meng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a> wrote:<br>
&gt; &gt;&gt; &gt; On Wed, Jun 26, 2019 at 4:23 AM Jonathan Behrens &lt;<a =
href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; I just did some testing on a HiFive Unleashed board =
and can confirm what<br>
&gt; &gt;&gt; &gt;&gt; you are saying. The low 5 bits of both mcounteren an=
d scounteren are<br>
&gt; &gt;&gt; &gt;&gt; writable (if you try to write 0xFFFFFFFF to them, th=
ey&#39;ll take on the value<br>
&gt; &gt;&gt; &gt;&gt; 0x1F) but even with the TM bit set in both mcountere=
n and scounteren the<br>
&gt; &gt;&gt; &gt;&gt; rdtime instruction always generates an illegal instr=
uction exception.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Then I would think the FU540 is not spec complaint :)<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Ya, it&#39;s an errata.=C2=A0 There&#39;s a handful of them :=
)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Reading through the relevant chapter of the spec, I =
still think that having<br>
&gt; &gt;&gt; &gt;&gt; mcounteren.TM be writable but making rdtime uncondit=
ionally trap is<br>
&gt; &gt;&gt; &gt;&gt; non-conformant. If other people feel strongly that r=
dtime should always<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Agree. To test hardware (FU540) compatibility in QEMU, m=
aybe we can<br>
&gt; &gt;&gt; &gt; add a cpu property to allow hard-wiring mcounteren.TM to=
 zero?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In theory we should have properties to control the behavior o=
f all WARL fields,<br>
&gt; &gt;&gt; but it&#39;s a lot of work.=C2=A0 I&#39;d be happy to take a =
patch for any of them.<br>
&gt; &gt;<br>
&gt; &gt; Hmmm... We should avoid taking patches that don&#39;t adhere to t=
he spec<br>
&gt; &gt; just to match some hardware. In the case that core/popular softwa=
re<br>
&gt; &gt; doesn&#39;t work it probably makes sense, but in general it&#39;s=
 probably not<br>
&gt; &gt; the best move.<br>
&gt;<br>
&gt; WARL is Write Any Read Legal.=C2=A0 Essentially it means that the hard=
ware gets to<br>
&gt; decide what sort of behavior that field has, and is the mechanism for =
optional<br>
&gt; features in the ISA.=C2=A0 In this case it&#39;d be entirely within sp=
ec, specifically:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Registers mcounteren and scounteren are WARL regist=
ers that must be<br>
&gt;=C2=A0 =C2=A0 =C2=A0implemented if U-mode and S-mode are implemented. A=
ny of the bits may<br>
&gt;=C2=A0 =C2=A0 =C2=A0contain a hardwired value of zero, indicating reads=
 to the corresponding<br>
&gt;=C2=A0 =C2=A0 =C2=A0counter will cause an illegal instruction exception=
 when executing in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0less-privileged mode.<br>
&gt;<br>
&gt; Taking a patch that matches the out-of-spec FU540 behavior doesn&#39;t=
 make any<br>
&gt; sense, I don&#39;t want to implement errata in QEMU :)<br>
<br>
Ah, I misread your email. That is fine then :)<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alistair<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; require trapping into firmware then the natural chan=
ge would be to simply<br>
&gt; &gt;&gt; &gt;&gt; hardwire mcounteren.TM to zero (the value in scounte=
ren wouldn&#39;t matter in<br>
&gt; &gt;&gt; &gt;&gt; that case so it could be left writable). My own (bia=
sed) personal feeling<br>
&gt; &gt;&gt; &gt;&gt; is that this full implementation makes sense at leas=
t for the `virt`<br>
&gt; &gt;&gt; &gt;&gt; machine type because it represents a clear case wher=
e deviating from<br>
&gt; &gt;&gt; &gt;&gt; current hardware enables a performance boost, and wo=
uld not break<br>
&gt; &gt;&gt; &gt;&gt; compatibility with any current software: both OpenSB=
I and BBL try to enable<br>
&gt; &gt;&gt; &gt;&gt; hardware handling of rdtime when the platform claims=
 to support it.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Regards,<br>
&gt; &gt;&gt; &gt; Bin<br>
&gt; &gt;&gt;<br>
</blockquote></div>

--000000000000e43a2b058c67ef60--

