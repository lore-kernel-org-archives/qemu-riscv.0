Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iv0JD-0001TC-9a
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 09:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1iuxVF-0004sc-0Z
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 06:51:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1iuxVD-0007j8-Cz
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 06:51:56 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:45968)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>)
 id 1iuxUt-0007IX-Po; Fri, 24 Jan 2020 06:51:35 -0500
Received: by mail-qk1-x742.google.com with SMTP id x1so1670774qkl.12;
 Fri, 24 Jan 2020 03:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GrVMXjfrcr2eF7DXVXKBVq1WpBAlVvsTbTzoO22R6VA=;
 b=JRHqhCW9MeRS1vU8M8vpEr7qo/g9HCDyJxVPsl1UOi9SLiDmAVgh6T6cMqY9/ygX7a
 4EFZyFyN+BfqKn8Mkwlenq/4KkcZXMRSDfDm6Epm2N0lX0b0/gEt0nLej4iIWr5eWFF7
 pkG3gCHdfbku8ysvp/StRsrmwP4vCKHco4QKCoSkXI9V/jMQBJJpwU37amDFNul7Awbh
 JOOhEUjkOZKYgjFPOJP7gjeZrsLr76n39Qn5lAv3Ge3CXe8PNaSxQHQJ8/rObFbYmCmX
 kQDV9ArSps2QNPYhK9+dLZFMW0oaHsRqihaM7mYUubWW2hC0AN3iZIQgFbaBeDqRQNKU
 R0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrVMXjfrcr2eF7DXVXKBVq1WpBAlVvsTbTzoO22R6VA=;
 b=e9wjJERCQdNHrFnx6EPx9iTYzXfWXZ8wDdc2qqMt9cKPZITgCnefZ3oHebvsMfTdtm
 zCsI8Kr5lF5Li6i4cY+3nL6gnPXpFBlq4QkrUCT2fD51JxARf+p5rb60CmLgbpxZYBi0
 I7N+fR5IQ2dMTM4CAwoyfXvf6XC2VyQpfIfXRN850aYptH2tTrGDf+vFxcbFctJy08mz
 ge20MSSkPOViz0Ewrj99FGi0IvXEheX/04oK1iy1t7eWcyl+ZWu++59C/p/JykBFqahD
 nByqZaEVtcx6Z5l5nHDjZxFT0td6vo/0v63hztXV95jjxgtCIwxlQsP6jVDDGraU0n0m
 cN1A==
X-Gm-Message-State: APjAAAUIwaSnfp2c8BF5fqyVQPJol/g4k4MEA+E8n2af3ZCfd7/hMI3Y
 KBqcLhCDR7UPBFRgZSInFaH3hdwebWGLDRKhkpM=
X-Google-Smtp-Source: APXvYqxQtpvIK1sSJsGRhgreUN5Lc+h3/GxiFEFigO5h8FjtJFQ8dYbpwwJ+Qa/SAZnt6HOrbmOAUz+I772vpfNhHds=
X-Received: by 2002:ae9:dc85:: with SMTP id q127mr2091509qkf.460.1579866694568; 
 Fri, 24 Jan 2020 03:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-15-f4bug@amsat.org>
 <50348fa2-0fda-78fd-ad64-f7cc94d6d158@redhat.com>
In-Reply-To: <50348fa2-0fda-78fd-ad64-f7cc94d6d158@redhat.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Fri, 24 Jan 2020 13:50:52 +0200
Message-ID: <CAK4993g9pssL5ikSCHxbdnPDoxiwiGYeOenYOjRvtBgXU2H0Rg@mail.gmail.com>
Subject: Re: [PATCH rc2 14/25] target/avr: Add section about AVR into QEMU
 documentation
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake <eblake@redhat.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Eduardo Habkost <ehabkost@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000001f4f71059ce16156"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
X-Mailman-Approved-At: Fri, 24 Jan 2020 09:51:40 -0500
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
X-List-Received-Date: Fri, 24 Jan 2020 11:51:58 -0000

--0000000000001f4f71059ce16156
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas.

I will fix it. thanks.

Michael Rolnik

On Fri, Jan 24, 2020 at 9:14 AM Thomas Huth <thuth@redhat.com> wrote:

> On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
> > From: Michael Rolnik <mrolnik@gmail.com>
> >
> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> > Message-Id: <20200118191416.19934-16-mrolnik@gmail.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > [PMD: Fixed typos]
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > rc2: Fixed typos, s/sample/Arduino/, removed -serial section (thuth)
> > ---
> >  qemu-doc.texi | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/qemu-doc.texi b/qemu-doc.texi
> > index 39f950471f..89df1d325e 100644
> > --- a/qemu-doc.texi
> > +++ b/qemu-doc.texi
> > @@ -1741,6 +1741,7 @@ differences are mentioned in the following
> sections.
> >  * Microblaze System emulator::
> >  * SH4 System emulator::
> >  * Xtensa System emulator::
> > +* AVR System emulator::
> >  @end menu
> >
> >  @node PowerPC System emulator
> > @@ -2514,6 +2515,56 @@ so should only be used with trusted guest OS.
> >
> >  @c man end
> >
> > +@node AVR System emulator
> > +@section AVR System emulator
> > +@cindex system emulation (AVR)
> > +
> > +Use the executable @file{qemu-system-avr} to emulates a AVR 8 bit base=
d
> machine
> > +having one for the following cores: avr1, avr2, avr25, avr3, avr31,
> avr35, avr4,
> > +avr5, avr51, avr6, avrtiny, xmega2, xmega3, xmega4, xmega5, xmega6 and
> xmega7.
> > +
> > +As for now it supports few Arduino boards for educational and testing
> purposes.
> > +These boards use a ATmega controller, which model is limited to USART =
&
> 16 bit
> > +timer devices, enought to run FreeRTOS based applications (like this
> @url{
> https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/Demo/AVR=
_ATMega2560_GCC/demo.elf,,demo
> })
> > +
> > +Following are examples of possible usages, assuming program.elf is
> compiled for
> > +AVR cpu
> > +@itemize
> > +
> > +@item Continuous non interrupted execution
> > +@example
> > +qemu-system-avr -kernel program.elf
> > +@end example
> > +
> > +@item Continuous non interrupted execution with serial output into
> telnet window
> > +@example
> > +qemu-system-avr -kernel program.elf -serial tcp::5678,server,nowait
> -nographic
> > +@end example
> > +and then in another shell
> > +@example
> > +telnet localhost 5678
> > +@end example
> > +
> > +@item Debugging wit GDB debugger
> > +@example
> > +qemu-system-avr -kernel program.elf -s -S
> > +@end example
> > +and then in another shell
> > +@example
> > +avr-gdb program.elf
> > +@end example
> > +and then within GDB shell
> > +@example
> > +target remote :1234
> > +@end example
> > +
> > +@item Print out executed instructions
> > +@example
> > +qemu-system-avr -kernel program.elf -d in_asm
>
> If you don't have a default board anymore, I think you need to list -M
> here, too.
> And didn't you mention that -kernel is not working anyway? Do you need
> to replace it with -bios ?
>
>  Thomas
>
>

--=20
Best Regards,
Michael Rolnik

--0000000000001f4f71059ce16156
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas.<div><br></div><div>I will fix it. thanks.</div>=
<div><br></div><div>Michael Rolnik</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 24, 2020 at 9:14 AM Tho=
mas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 24/01/2=
020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; From: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=
=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com"=
 target=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20200118191416.19934-16-mrolnik@gmai=
l.com" target=3D"_blank">20200118191416.19934-16-mrolnik@gmail.com</a>&gt;<=
br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; [PMD: Fixed typos]<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt; rc2: Fixed typos, s/sample/Arduino/, removed -serial section (thuth)<b=
r>
&gt; ---<br>
&gt;=C2=A0 qemu-doc.texi | 51 +++++++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 51 insertions(+)<br>
&gt; <br>
&gt; diff --git a/qemu-doc.texi b/qemu-doc.texi<br>
&gt; index 39f950471f..89df1d325e 100644<br>
&gt; --- a/qemu-doc.texi<br>
&gt; +++ b/qemu-doc.texi<br>
&gt; @@ -1741,6 +1741,7 @@ differences are mentioned in the following secti=
ons.<br>
&gt;=C2=A0 * Microblaze System emulator::<br>
&gt;=C2=A0 * SH4 System emulator::<br>
&gt;=C2=A0 * Xtensa System emulator::<br>
&gt; +* AVR System emulator::<br>
&gt;=C2=A0 @end menu<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 @node PowerPC System emulator<br>
&gt; @@ -2514,6 +2515,56 @@ so should only be used with trusted guest OS.<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 @c man end<br>
&gt;=C2=A0 <br>
&gt; +@node AVR System emulator<br>
&gt; +@section AVR System emulator<br>
&gt; +@cindex system emulation (AVR)<br>
&gt; +<br>
&gt; +Use the executable @file{qemu-system-avr} to emulates a AVR 8 bit bas=
ed machine<br>
&gt; +having one for the following cores: avr1, avr2, avr25, avr3, avr31, a=
vr35, avr4,<br>
&gt; +avr5, avr51, avr6, avrtiny, xmega2, xmega3, xmega4, xmega5, xmega6 an=
d xmega7.<br>
&gt; +<br>
&gt; +As for now it supports few Arduino boards for educational and testing=
 purposes.<br>
&gt; +These boards use a ATmega controller, which model is limited to USART=
 &amp; 16 bit<br>
&gt; +timer devices, enought to run FreeRTOS based applications (like this =
@url{<a href=3D"https://github.com/seharris/qemu-avr-tests/blob/master/free=
-rtos/Demo/AVR_ATMega2560_GCC/demo.elf,,demo" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/De=
mo/AVR_ATMega2560_GCC/demo.elf,,demo</a>})<br>
&gt; +<br>
&gt; +Following are examples of possible usages, assuming program.elf is co=
mpiled for<br>
&gt; +AVR cpu<br>
&gt; +@itemize<br>
&gt; +<br>
&gt; +@item Continuous non interrupted execution<br>
&gt; +@example<br>
&gt; +qemu-system-avr -kernel program.elf<br>
&gt; +@end example<br>
&gt; +<br>
&gt; +@item Continuous non interrupted execution with serial output into te=
lnet window<br>
&gt; +@example<br>
&gt; +qemu-system-avr -kernel program.elf -serial tcp::5678,server,nowait -=
nographic<br>
&gt; +@end example<br>
&gt; +and then in another shell<br>
&gt; +@example<br>
&gt; +telnet localhost 5678<br>
&gt; +@end example<br>
&gt; +<br>
&gt; +@item Debugging wit GDB debugger<br>
&gt; +@example<br>
&gt; +qemu-system-avr -kernel program.elf -s -S<br>
&gt; +@end example<br>
&gt; +and then in another shell<br>
&gt; +@example<br>
&gt; +avr-gdb program.elf<br>
&gt; +@end example<br>
&gt; +and then within GDB shell<br>
&gt; +@example<br>
&gt; +target remote :1234<br>
&gt; +@end example<br>
&gt; +<br>
&gt; +@item Print out executed instructions<br>
&gt; +@example<br>
&gt; +qemu-system-avr -kernel program.elf -d in_asm<br>
<br>
If you don&#39;t have a default board anymore, I think you need to list -M<=
br>
here, too.<br>
And didn&#39;t you mention that -kernel is not working anyway? Do you need<=
br>
to replace it with -bios ?<br>
<br>
=C2=A0Thomas<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000001f4f71059ce16156--

