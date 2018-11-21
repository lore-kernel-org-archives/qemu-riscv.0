Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPald-0002np-3l
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:14:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPala-0002lS-HM
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:14:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPalZ-0002Yr-Gb
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:14:38 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPalW-0002VV-FB; Wed, 21 Nov 2018 17:14:34 -0500
Received: by mail-lj1-x244.google.com with SMTP id n18-v6so6210954lji.7;
	Wed, 21 Nov 2018 14:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cv1Id9ksZowyjZQvrgvGHYzJMh497s/jbFaJnQfdxL8=;
	b=XN2LAJoY/LAfEqsYp4ZKktSQP6oSGafs408gLOqGk98M40DjYXMwnx5oOY8klxUyU8
	+zo2PzXZR9oxF5IRmSNXN4Noc4CEfzpPXqX7B4M37iOmcM0mHY5K1h3A+gl1L++EEME8
	IVvoXTuCJyZRV4YGhnjq1t/691mTdY2kiwe2wBPgfd+31qU/6qmterov2a7LEHLJvZFg
	kaQmCKccZluNKInakAedbFtq2m+aRkZeHs7mMHZMP8H/CwC9Z3VFQ/getzGjJbmgi1/v
	2rClUdERXaMuL4bKEunJO0Ggo8+pYG2/B+PxOYFgB32QBdD+yhvengfGzAf677+geWt9
	bLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cv1Id9ksZowyjZQvrgvGHYzJMh497s/jbFaJnQfdxL8=;
	b=ZITnKQBwvxpSzeoORB9KyStEP4FRhS6vPawYca/o4WWFzR6HobQcfuhb+szkRchrzB
	Ha8tkqHaVJB0g5p1UdeRmBya5nPWEpKrJ7zW3kVnoKwwpfqqNpikAwcCfblRUJcqBnWR
	fUkjiiZj3qu84oXPO94ed6R42wisF68nvH1O+sVvL7fsormqtAbkAlIecM/tIwDCeBPI
	/W+HzKhiApTXXRIaf4XeOXZvZK9YYlMMa08cGR+sG4IWc/im5JOCTxWvGM6xn1EJhjwU
	7dCaNIzQ22vNzGdsyjlgCVYdE54f+1tacL/njjJxJcPqlyR91x8IuiM4YqkADiPr/4Jf
	X6sQ==
X-Gm-Message-State: AGRZ1gLmguV0H2+QdUlR8QhyLXcNc8n0FBWe7vjsS/udvQ6tAFcyILzQ
	JQBMI241sg1QsDHcbDsJrX4Cqa9mYi8lxrdho+I=
X-Google-Smtp-Source: AFSGD/UztRWMJGm0A8K/4STMql3WhrZp1t0APP6YUMzCILNO1/bpVmvPoCiisln8NpGlw5rrb32tBslZygbvzPlh1oE=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr5122901lji.145.1542838472756; 
	Wed, 21 Nov 2018 14:14:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
	<0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
	<CAKmqyKNitWerbpVzQrNye3KiPj=5DVFXan4SpiN-+br_P-RG+Q@mail.gmail.com>
	<0fac09ca-12d5-1462-4456-66646f168ab5@deltatee.com>
	<CAKmqyKMTxgk41cBz=hW-meCUAi-_20vguqN40f_ThRU-rsaJXA@mail.gmail.com>
	<17256c59-cf5e-2247-985a-84c26f9d64a9@deltatee.com>
	<CAKmqyKMij-hfwFn8snBni0D7puJMwb1bHXiJP939QEPGznENEQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMij-hfwFn8snBni0D7puJMwb1bHXiJP939QEPGznENEQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 14:14:05 -0800
Message-ID: <CAKmqyKPcoouWEC9KqP2z5n0tg-Zf_4FpJD9mDPWbm=z6QXwcJQ@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 6/6] hw/riscv/virt: Connect a
 VirtIO net PCIe device
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
X-List-Received-Date: Wed, 21 Nov 2018 22:14:39 -0000

On Wed, Nov 21, 2018 at 2:11 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 21, 2018 at 2:07 PM Logan Gunthorpe <logang@deltatee.com> wrote:
> >
> >
> >
> > On 2018-11-21 2:55 p.m., Alistair Francis wrote:
> > > It is required for networking for PCIe devices. What PCIe device works
> > > for you without this patch? Can you tell me your command line
> > > arguments.
> >
> > I can run it without that patch using a e1000e device and it works just
> > fine.
> >
> > Command line:
> >
> > $QEMU -s -nographic -machine virt -m 2G -kernel $BBL \
> >    -object rng-random,filename=/dev/urandom,id=rng0 \
> >    -append "console=hvc0 ro root=/dev/vda" \
> >    -device e1000e,netdev=net0 \
> >    -netdev user,id=net0 \
> >    -device virtio-rng-device,rng=rng0 \
> >    -device virtio-blk-device,drive=hd0 \
> >    -drive file=rootfs.img,format=raw,id=hd0 \
> >    -device nvme,drive=nvme0,serial=nvme0 \
> >    -drive file=nvme0.qcow2,if=none,id=nvme0
> >
> > --
> >
> > lspcirv-hfu-01:~#
> > 00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
> > 00:01.0 Ethernet controller: Intel Corporation 82574L Gigabit Network
> > Connection
> > 00:02.0 Non-Volatile memory controller: Intel Corporation QEMU NVM
> > Express Controller (rev 02)
> > root@rv-hfu-01:~#
> >
> > QEMU 3.0.92 monitor - type 'help' for more information
> > (qemu) info pci
> >   Bus  0, device   0, function 0:
> >     Host bridge: PCI device 1b36:0008
> >       PCI subsystem 1af4:1100
> >       id ""
> >   Bus  0, device   1, function 0:
> >     Ethernet controller: PCI device 8086:10d3
> >       PCI subsystem 8086:0000
> >       IRQ 11.
> >       BAR0: 32 bit memory at 0x40040000 [0x4005ffff].
> >       BAR1: 32 bit memory at 0x40060000 [0x4007ffff].
> >       BAR2: I/O at 0xffffffffffffffff [0x001e].
> >       BAR3: 32 bit memory at 0x40080000 [0x40083fff].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> >   Bus  0, device   2, function 0:
> >     Class 0264: PCI device 8086:5845
> >       PCI subsystem 1af4:1100
> >       IRQ 9.
> >       BAR0: 64 bit memory at 0x40084000 [0x40085fff].
> >       id ""
> > (qemu)
>
> and networking works?

Yep, it should. This is for the -nic option [1]. I misunderstood when
I was going through it.

We can drop this patch then.

1: https://github.com/qemu/qemu/commit/fea9b3ca9cc4685f89e0b929a61e51098fbb4f49

Alistair

>
> Alistair

