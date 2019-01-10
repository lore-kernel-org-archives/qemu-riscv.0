Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghioZ-0006Pf-RX
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jan 2019 17:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ghioY-0006Op-4N
	for qemu-riscv@nongnu.org; Thu, 10 Jan 2019 17:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ghioX-0001MM-CT
	for qemu-riscv@nongnu.org; Thu, 10 Jan 2019 17:28:38 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ghioV-0001Kv-8x; Thu, 10 Jan 2019 17:28:35 -0500
Received: by mail-lj1-x242.google.com with SMTP id v15-v6so11154289ljh.13;
	Thu, 10 Jan 2019 14:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uL66QoIEjMWq7w0IM0GiZsOyy+ahsjSY3tjtkiBeScw=;
	b=GtbYIWHRmGjGbzwPZtOq9AbHC2MnGY75wRKHW+TlwduMkMSesgUrsefHtHgi5OzlAE
	rsuPdMR71fYrqwGkkJoO0bSHiDTG63OBlQ4aZ64mByxM0X5ScwfBtqsHqjbO7+uGsQKY
	5HbCYTPyAqC1T9rTW6WfxzTx1anF4BfDrUIQ0GqFNN5cQyhlfjIRG7ZsOzIX2XVB0KQH
	g0UqoMELe62/RxUhi4FKtFnYLbneDTOyh8A0Hc8lSUxiEoBDuAm6E1bY4ACXzfL/rsYz
	6jmenpcnrhQrdvATyUYx2hl6wieVFnTKeFJ4b90T+InGuOfpNoq0OedfJXz0mK9f5xkh
	e/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uL66QoIEjMWq7w0IM0GiZsOyy+ahsjSY3tjtkiBeScw=;
	b=I3aGIuqKv2Un4HgmwCj/EOdzaJ5G1FWU7HoMeh94QD56H0iGKMoR7Tnaxe+0QrCanl
	aonnJ50EeBca+rvLkQjII0EvKEU7d44lIvhxneIN1n4uCmASToWZxn8eBt2QmPMbB4qm
	hnwkFlrEqEku3ogRq066XrxBaxUIDSrDzQnbUtmI7TDlVDiLFHbrZ/WktS11mkSRH5eM
	fzmxnElNQB1CdxDUySqMQSfr6HIuj3nXGiogV0+c/MZTOUE3X7bWbyQPXliiaS+PJeSS
	eWgK+RsrTOdN+XdgbSEnQ+mDmoh4UVk+87paoxqrjgdg/2bZyRziemwnZFiIUlDuR6xR
	iy/w==
X-Gm-Message-State: AJcUukdIOK9h8n791UhakBc3zSic+8iF1RuujeGX9s7sdxbFng3SzopZ
	DHzseFgwcwoN5uDUQCaURgJT9xLNC+lOKs3YqTY=
X-Google-Smtp-Source: ALg8bN5JX2ixY8X59s1d4xnoRih9EMECOSACR0tFn2LBF727uieXGYklfM6yLpd+jVYIS/JogHylyNIv98Ev00CV3IE=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr6927842lja.58.1547159313766; 
	Thu, 10 Jan 2019 14:28:33 -0800 (PST)
MIME-Version: 1.0
References: <c162ffeb1bb1cbcdeb47ea62a829294168a0ebdf.1547078463.git.alistair.francis@wdc.com>
	<mhng-cf28bdac-e5b7-46a3-b53d-b01a329f9100@palmer-si-x1c4>
In-Reply-To: <mhng-cf28bdac-e5b7-46a3-b53d-b01a329f9100@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Jan 2019 14:28:07 -0800
Message-ID: <CAKmqyKOceCJrZcK-3JTObRjpif-TXQ8N2sTv=Z-bGGgCyOgNTw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] default-configs:
 Enable USB support for RISC-V machines
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
X-List-Received-Date: Thu, 10 Jan 2019 22:28:39 -0000

On Thu, Jan 10, 2019 at 8:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 09 Jan 2019 16:01:34 PST (-0800), Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  default-configs/riscv32-softmmu.mak | 1 +
> >  default-configs/riscv64-softmmu.mak | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> > index dbc9398284..c9c5971409 100644
> > --- a/default-configs/riscv32-softmmu.mak
> > +++ b/default-configs/riscv32-softmmu.mak
> > @@ -1,6 +1,7 @@
> >  # Default configuration for riscv-softmmu
> >
> >  include pci.mak
> > +include usb.mak
> >
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> > diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> > index dbc9398284..c9c5971409 100644
> > --- a/default-configs/riscv64-softmmu.mak
> > +++ b/default-configs/riscv64-softmmu.mak
> > @@ -1,6 +1,7 @@
> >  # Default configuration for riscv-softmmu
> >
> >  include pci.mak
> > +include usb.mak
> >
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> > --
> > 2.19.1
>
> Does this work for you?  I tried it out but my kernel hangs in early boot if I
> enable the generic PCI controller.  This is my WIP kernel so the problem is
> probably on my end.

I had tested it awhile ago when I was working on the PCIe patches and
it worked for Linux.

I didn't runtime test it this time as by default there is no change it
just lets users have more boot options. Even if it doesn't work for
Linux it will be useful for other non-Linux guests.

Alistair

>
> I'm trying to boot with
>
>     -device usb-ehci
>     -drive id=my_usb_disk,file=usbdisk.img,if=none,format=raw
>     -device usb-storage,drive=my_usb_dis

