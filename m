Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaiy-0008Cy-Sn
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:11:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaiw-0008Ao-4t
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:11:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaiu-0007zD-91
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:11:53 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:35764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPair-0007uc-Ua; Wed, 21 Nov 2018 17:11:50 -0500
Received: by mail-lj1-x242.google.com with SMTP id x85-v6so6225997ljb.2;
	Wed, 21 Nov 2018 14:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R/D2afYNSOAEs6i+/4jVKxpEE4bsdF3XQcEIjnUycWs=;
	b=K1oGrevq7hAnpZWWxZaLBGfmTiARwjnadHszOPBRjTkUGgwus4tEFghd4KPq+yCvrp
	Q0B4lcFF7mSvqq1ZQ9K0IdB5LPvz74PZ/KUou3OQigUavzigCyrZWSrnYzuazYgO8Gxe
	Ofay3yVHo5ViOAt2vfK93YWhPhFy9hQZwGImF8CdI5ynrvjnBNlo2swcalc0sL8jgkAT
	AbJy4XyC7an81ZNQjUe/AmWv8LD0gHw101E7y6mhlvJiTIQWKAzcK/m0mdrhdRx5y0dY
	CfoTEy6VW48oTNY21CjA+0M8UB7iNG2Nu9zo4bNVh/DmVcGudhs7mZTsSbf7k6Zzu57i
	F7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R/D2afYNSOAEs6i+/4jVKxpEE4bsdF3XQcEIjnUycWs=;
	b=TdG7nDXLTPux127Iqi0GNJmOQMsF7KNnJsl2WvqiBe1UUDyRrebJzMRe24gxZtHQmR
	KjgVAS6W9L5uun/1wcane0wVilRa54KS2Y/SowXqFkalChcvZRYKrUUQIzdH7dh5gLM0
	3SQPjAs1MjQpNdVm852fTjwyxwx8fWsmMJnh98arAIdco/41GGvyO8Yrg+AxGDJMpJp8
	2i7IkMI8tTYODGwyErjJCo+iex92zWYE4LGTXi4XyWAZTtHY1p9UF73qhj1MT8KfepyJ
	N/K4LFzMmvQg689iib5hxHie8+jxJgg4js45FkHNj8kcNCyEtvzMi6KHhxpbGsJcCzTz
	mVUg==
X-Gm-Message-State: AA+aEWYDtcg+LxWDH+nsrhLk3Tt7K6bex5MWlprpuKfUYP6VHnt2I8Nd
	qJBPIKEcpDFfLeiabMAQjZF3Z+T1fy/YYppgJds=
X-Google-Smtp-Source: AJdET5cjAKWzFxAw8Gl2hg3M/gPzQefziyqiA/A+hLzonl04Tr/Gb7kiIlH1q/XyVsMr4jpRnD27hBeXjyCoD+hHq9A=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr5558108lja.111.1542838308593; 
	Wed, 21 Nov 2018 14:11:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
	<0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
	<CAKmqyKNitWerbpVzQrNye3KiPj=5DVFXan4SpiN-+br_P-RG+Q@mail.gmail.com>
	<0fac09ca-12d5-1462-4456-66646f168ab5@deltatee.com>
	<CAKmqyKMTxgk41cBz=hW-meCUAi-_20vguqN40f_ThRU-rsaJXA@mail.gmail.com>
	<17256c59-cf5e-2247-985a-84c26f9d64a9@deltatee.com>
In-Reply-To: <17256c59-cf5e-2247-985a-84c26f9d64a9@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 14:11:21 -0800
Message-ID: <CAKmqyKMij-hfwFn8snBni0D7puJMwb1bHXiJP939QEPGznENEQ@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Wed, 21 Nov 2018 22:11:55 -0000

On Wed, Nov 21, 2018 at 2:07 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 2:55 p.m., Alistair Francis wrote:
> > It is required for networking for PCIe devices. What PCIe device works
> > for you without this patch? Can you tell me your command line
> > arguments.
>
> I can run it without that patch using a e1000e device and it works just
> fine.
>
> Command line:
>
> $QEMU -s -nographic -machine virt -m 2G -kernel $BBL \
>    -object rng-random,filename=/dev/urandom,id=rng0 \
>    -append "console=hvc0 ro root=/dev/vda" \
>    -device e1000e,netdev=net0 \
>    -netdev user,id=net0 \
>    -device virtio-rng-device,rng=rng0 \
>    -device virtio-blk-device,drive=hd0 \
>    -drive file=rootfs.img,format=raw,id=hd0 \
>    -device nvme,drive=nvme0,serial=nvme0 \
>    -drive file=nvme0.qcow2,if=none,id=nvme0
>
> --
>
> lspcirv-hfu-01:~#
> 00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge
> 00:01.0 Ethernet controller: Intel Corporation 82574L Gigabit Network
> Connection
> 00:02.0 Non-Volatile memory controller: Intel Corporation QEMU NVM
> Express Controller (rev 02)
> root@rv-hfu-01:~#
>
> QEMU 3.0.92 monitor - type 'help' for more information
> (qemu) info pci
>   Bus  0, device   0, function 0:
>     Host bridge: PCI device 1b36:0008
>       PCI subsystem 1af4:1100
>       id ""
>   Bus  0, device   1, function 0:
>     Ethernet controller: PCI device 8086:10d3
>       PCI subsystem 8086:0000
>       IRQ 11.
>       BAR0: 32 bit memory at 0x40040000 [0x4005ffff].
>       BAR1: 32 bit memory at 0x40060000 [0x4007ffff].
>       BAR2: I/O at 0xffffffffffffffff [0x001e].
>       BAR3: 32 bit memory at 0x40080000 [0x40083fff].
>       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
>       id ""
>   Bus  0, device   2, function 0:
>     Class 0264: PCI device 8086:5845
>       PCI subsystem 1af4:1100
>       IRQ 9.
>       BAR0: 64 bit memory at 0x40084000 [0x40085fff].
>       id ""
> (qemu)

and networking works?

Alistair

