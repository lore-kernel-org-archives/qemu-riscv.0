Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWqOn-0008Vg-6Y
	for mharc-qemu-riscv@gnu.org; Fri, 31 May 2019 18:53:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47171)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hWqOh-0008NO-4M
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 18:53:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hWqAf-0002py-Ql
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 18:38:47 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:27918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hWqAf-0002oc-K6
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 18:38:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.fintelia.io;
	q=dns/txt; 
	s=mailo; t=1559342325; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=LfctCIgpkBvXzrc7MpCqKZkpLZImxfqch844GhdAoaU=;
	b=bTfIF0qZF8ibqQ/QXKT6XdfUDAjoQRQWFemouN2IKUphIRpc5OhoU/9BVejEceaul/LxI0EX
	p+fAJGB8ZTas5PuDhY0eYWbMPAsVJG2/4cCcMvotnncswIglXm+NcchH6KrDW5Voci6LcPoP
	eEShZJ/OMQm2fmest6btTwA97bk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJjMjQ3ZCIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiYjc4YTQ4Il0=
Sender: jonathan=fintelia.io@mg.fintelia.io
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mxa.mailgun.org with ESMTP id 5cf1acf0.7fd09a51a7b0-smtp-out-n01;
	Fri, 31 May 2019 22:38:40 -0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id v18so9171698lfi.1;
	Fri, 31 May 2019 15:38:39 -0700 (PDT)
X-Gm-Message-State: APjAAAW54AO9jUuUwsxbI1K33gQTmz87evIaNojqxxryvSuw1sw3ujWe
	wTgVSenMqnD3SRCcSvtE/gtfYr0teNHCNXvMnr8=
X-Google-Smtp-Source: APXvYqxUfTtp434FTNau469kleD3qet0zPoO349Mhc/DB5m73Bacopij+Z14ER1w7f0xAMSwVMasOkG4pi+aTOex/FM=
X-Received: by 2002:ac2:518d:: with SMTP id u13mr6816795lfi.40.1559342318501; 
	Fri, 31 May 2019 15:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190517222342.26394-1-jonathan@fintelia.io>
	<20190517222342.26394-3-jonathan@fintelia.io>
	<CAKmqyKMG6ffhQ5VYgLZ3XVfZ2-E_O9BH6UCanmLJ3awDDUfS_w@mail.gmail.com>
	<CANnJOVFE51rFdV0h0T6_dV6r37kBLcBQCo7Csg8NOUoYkOELpQ@mail.gmail.com>
	<CAKmqyKM3C59_w214=mqLFpfwPhUjcLL0EuOY0Yk3DQePx8ZTQg@mail.gmail.com>
In-Reply-To: <CAKmqyKM3C59_w214=mqLFpfwPhUjcLL0EuOY0Yk3DQePx8ZTQg@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Fri, 31 May 2019 18:38:12 -0400
X-Gmail-Original-Message-ID: <CANnJOVGyY71-aZd+dmZWAOUzEfFEOHjAAzVdbGTP_XfP4CmgkA@mail.gmail.com>
Message-ID: <CANnJOVGyY71-aZd+dmZWAOUzEfFEOHjAAzVdbGTP_XfP4CmgkA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000fa440b058a36ac81"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 2/2] target/riscv: Add
 support for -bios "firmware_filename" flag
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
X-List-Received-Date: Fri, 31 May 2019 22:53:16 -0000

--000000000000fa440b058a36ac81
Content-Type: text/plain; charset="UTF-8"

I've thought some more about this issue, and long term I think there are a
couple different useful configurations:

   - For end users, having default firmware that loaded the OS from a block
   device would be easiest
      - Current invocation: impossible
      - Proposed: empty command line (i.e. pass neither -bios nor -kernel)
   - Custom firmware support would be good to test possible firmware
   improvements or if the default is missing something
      - Current invocation: -kernel firmware.elf
      - Proposed: -bios firmware.elf
      - A kernel developer may want to test a kernel binary without having
   to make a full disk image or bundle firmware (on x86 and perhaps other
   architectures this is done with the -kernel parameter, but for RISC-V that
   invocation currently is used to load M-mode code rather than supervisor
   code)
   - Current invocation: impossible
      - Proposed: -bios firmware.elf -kernel kernel.bin
      - Ideally `-kernel kernel.bin` be the same except using default
      firmware, but I don't know if QEMU would be willing to deprecate the
      current syntax to allow it

For now, it is probably too early to add default firmware (but perhaps
not?) which would leave only the firmware only and firmware + kernel
variants. What do other people think about this?

Jonathan

On Mon, May 20, 2019 at 12:56 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sat, May 18, 2019 at 2:57 PM Jonathan Behrens <jonathan@fintelia.io>
> wrote:
> >
> > > I've never been fully convinced of this, why not just use the generic
> loader?
> >
> > If I understand you are proposing passing bbl (or other firmware) with
> the -kernel flag, and then vmlinux (or another kernel) with the -initrd
> flag? Wouldn't this result in losing the ability to pass a real init
> ramdisk to Linux? It also seems to open the possibility for strange
> bugs/compatibility issues later if firmware starts recognizing any "initrd"
> entries in the device tree as kernel code to jump into.
>
> No I mean passing in OpenSBI (or some other boot loader) via the
> -kernel option and then passing in the kernel with QEMU's generic
> device loader. This is documented as part of the OpenSBI boot flow:
> https://github.com/riscv/opensbi/blob/master/docs/platform/qemu_virt.md
>
> The only disadvantage with that is that we don't get debug symbols
> from the kernel, but it does mean that the boot loader in QEMU is much
> simpler.
>
> >
> > I do wonder though how compatible the current design is with providing
> default firmware for riscv in the future.
> >
> > > This should be in a generic boot.c file and support added to all
> RISC-V boards.
> >
> > I can do this for v2.
>
> Thanks
>
> Alistair
>
> >
> > Jonathan
>

--000000000000fa440b058a36ac81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve thought some more about this issue, and long=
 term I think there are a couple different useful configurations:</div><div=
><ul><li>For end users, having default firmware that loaded the OS from a b=
lock device would be easiest</li><ul><li>Current invocation: impossible</li=
><li>Proposed: empty command line (i.e. pass neither -bios nor -kernel)</li=
></ul><li>Custom firmware support would be good to test possible firmware i=
mprovements or if the default is missing something</li><ul><li>Current invo=
cation: -kernel firmware.elf<br></li><li>Proposed: -bios firmware.elf<br></=
li></ul><li>A kernel developer may want to test a kernel binary without hav=
ing to make a full disk image or bundle firmware (on x86 and perhaps other =
architectures this is done with the -kernel parameter, but for RISC-V that =
invocation currently is used to load M-mode code rather than supervisor cod=
e)<br></li><ul><li>Current invocation: impossible<br></li><li>Proposed: -bi=
os firmware.elf -kernel kernel.bin</li><li>Ideally `-kernel kernel.bin` be =
the same except using  default firmware, but I don&#39;t know if QEMU would=
 be willing to deprecate the current syntax to allow it</li></ul></ul><div>=
For now, it is probably too early to add default firmware (but perhaps not?=
) which would leave only the firmware only and firmware + kernel variants. =
What do other people think about this?<br></div><div><br></div></div><div>J=
onathan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, May 20, 2019 at 12:56 PM Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, May 18, 2019 a=
t 2:57 PM Jonathan Behrens &lt;<a href=3D"mailto:jonathan@fintelia.io" targ=
et=3D"_blank">jonathan@fintelia.io</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; I&#39;ve never been fully convinced of this, why not just use the=
 generic loader?<br>
&gt;<br>
&gt; If I understand you are proposing passing bbl (or other firmware) with=
 the -kernel flag, and then vmlinux (or another kernel) with the -initrd fl=
ag? Wouldn&#39;t this result in losing the ability to pass a real init ramd=
isk to Linux? It also seems to open the possibility for strange bugs/compat=
ibility issues later if firmware starts recognizing any &quot;initrd&quot; =
entries in the device tree as kernel code to jump into.<br>
<br>
No I mean passing in OpenSBI (or some other boot loader) via the<br>
-kernel option and then passing in the kernel with QEMU&#39;s generic<br>
device loader. This is documented as part of the OpenSBI boot flow:<br>
<a href=3D"https://github.com/riscv/opensbi/blob/master/docs/platform/qemu_=
virt.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv/open=
sbi/blob/master/docs/platform/qemu_virt.md</a><br>
<br>
The only disadvantage with that is that we don&#39;t get debug symbols<br>
from the kernel, but it does mean that the boot loader in QEMU is much<br>
simpler.<br>
<br>
&gt;<br>
&gt; I do wonder though how compatible the current design is with providing=
 default firmware for riscv in the future.<br>
&gt;<br>
&gt; &gt; This should be in a generic boot.c file and support added to all =
RISC-V boards.<br>
&gt;<br>
&gt; I can do this for v2.<br>
<br>
Thanks<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Jonathan<br>
</blockquote></div>

--000000000000fa440b058a36ac81--

