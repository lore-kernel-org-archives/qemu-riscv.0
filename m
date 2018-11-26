Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRJNE-0004ee-Pe
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 11:04:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJN7-0004b8-Lc
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 11:04:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJN6-0003r3-Tt
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 11:04:29 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRJN0-0003ma-9G; Mon, 26 Nov 2018 11:04:22 -0500
Received: by mail-lf1-x142.google.com with SMTP id b20so13926508lfa.12;
	Mon, 26 Nov 2018 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BPyJ7Tqwt6HYxq5piHslsaPr9fITQIBvn/Qx0YXSyv4=;
	b=VzFNd53tB5aMKv4dQilDUJCQrYLBjUXG83dQr2b9/5TaQChivAnxGlkuTC3/mR5MNt
	HnznT7KnpY11XkQRFplM/CwXkaBHar/4gROSLZ1SQXVJAeDDWcfBdAAX2PpHshhR2bak
	PzR8SB6XGfyp59b8k+SNamt+ydcd7e8Xhfp6B/v2q5ymPTSP16Y4XPun2mC5oBGN1TiX
	GEV7fYySg52WTQcinjNV8LZs9kgduXg1cnZ1u269aKeSlU8nmwIA7bdTdzsoDsouQyuC
	mf979Q1N+9aHiS9gZERlknER6xCXcwgRct1jH+lhj4W74efvTYGW9HMM64+DkUL5Ny+7
	a5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BPyJ7Tqwt6HYxq5piHslsaPr9fITQIBvn/Qx0YXSyv4=;
	b=rK10txz5LWVTWUJZWjLijCz7Ep6jQ1SrZC9+fmT7EuupUGsxP7VV9z4fcXePxiCNQ6
	fi0Cc/EMBKCQ4GXHERjT6QD5lD4NZi8AF57F0Bly7M/ocFITIXKf7W1CIL0/py0sn2vQ
	tXZZCIv4ZGYahtSZ2kgrcrFwhpD308Pm79rAFsl6j3DUhi8nPhB4zoWnH+klt/04xOil
	XzreB2xzBw09T5qxNecw0QYniI3n41YhVfNqQltXkVYj4NuKiJP/0RTrk2PYRW8qzj76
	Xb/V7gMH7XvTF7ziKMKxmCQ+x27Hra6uVbJB0CJkKD+KRBpqUwYMlA2yxe5H8Qt9BFwb
	bA9A==
X-Gm-Message-State: AGRZ1gIDd6TiGill/TgxhUF2bnti1yqm7r6dRqSz5j0IAOAlF1iDLoX+
	kclRGLbKwgl1+d0JwZigpdIo0FAvTKeWIBgd9Fg=
X-Google-Smtp-Source: AJdET5chHYAm+ilKEBXMK0jYRTpiJ/NAJzXuK/FsPARNmvkBDauWQgp/N4WHUDPXNucXltxjzL7rWuTTSGENeAs4Yo0=
X-Received: by 2002:a19:1f0a:: with SMTP id f10mr15221594lff.94.1543248260965; 
	Mon, 26 Nov 2018 08:04:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<84778e31610b0b98aea9b2dec5570a02dbf52180.camel@redhat.com>
In-Reply-To: <84778e31610b0b98aea9b2dec5570a02dbf52180.camel@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Nov 2018 08:03:51 -0800
Message-ID: <CAKmqyKPb0C5Y7HvEz5e5=fqQh4YPnCeo4nUPaq1VvVS0y_CmrQ@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 0/6] Connect a PCIe host and
 graphics support to RISC-V
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
X-List-Received-Date: Mon, 26 Nov 2018 16:04:34 -0000

On Thu, Nov 22, 2018 at 2:59 AM Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Wed, 2018-11-21 at 17:02 +0000, Alistair Francis wrote:
> > V7:
> >  - Fix the GPEX memory mapping thanks to Bin Meng
> >  - Fix the interrupt mapping thanks to Logan Gunthorpe
> >
> [...]
> >
> > Alistair Francis (6):
> >   hw/riscv/virt: Increase the number of interrupts
> >   hw/riscv/virt: Adjust memory layout spacing
> >   hw/riscv/virt: Connect the gpex PCIe
> >   riscv: Enable VGA and PCIE_VGA
> >   hw/riscv/sifive_u: Connect the Xilinx PCIe
> >   hw/riscv/virt: Connect a VirtIO net PCIe device
>
> Using QEMU master + these patches, libvirt master + my own patches,
> a disk image from [1] and the bbl from [2], I was able to run a pure
> PCI RISC-V guest, including connecting to it through ssh and
> performing a system update using dnf; based on these results, the
> series gets a big old
>
>   Tested-by: Andrea Bolognani <abologna@redhat.com>

Great! Thanks for testing.

Alistair

>
>
> [1] https://fedora-riscv.tranquillity.se/koji/
>     Unfortunately the site is broken at the moment :(
> [2] https://fedorapeople.org/groups/risc-v/disk-images/
>     PCI support is included in the bbl now! \o/
> --
> Andrea Bolognani / Red Hat / Virtualization
>

