Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXL7-0005eI-QW
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:35:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXL4-0005bZ-36
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:35:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXL2-0005lH-Vz
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:35:02 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPXKz-0005dv-3e; Wed, 21 Nov 2018 13:34:57 -0500
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so5693018ljh.13;
	Wed, 21 Nov 2018 10:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/bwSvtNRT4czl1K+Wv3zXbfUyhFWOrphqKVq4wqywf4=;
	b=qYTLY1XP5hnpbxB0GRXk58ulodfWRj8q+Oe2OBwXYMW5cx2ZSy0rF4Xp0Cj63zhXY5
	oHRq0lKch5SiuZhPtO3UOwPBSTIKpvTvtfg/uytU6v1LTaX4KIBdg6opvKpwutYjuqi6
	wA6zTTAqbnpV8QInt40p6tS72lFja+tHt4m8gO0ofPyMe80neUfqpv3SWH6/c8rYXHeK
	4rNFxh6XQK5W+cZVWnm4Cd7Ys4+CEOrRoPOpYFhdaFgrVKf0tSGecP8Pk0gK2ao/PEcl
	q9QaazsjZwdYl9eGGaJV07tzChB/mXnER4w6ao3hpk9CUeo9NyRHNNhE7y0h9MftmnX6
	zpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/bwSvtNRT4czl1K+Wv3zXbfUyhFWOrphqKVq4wqywf4=;
	b=LzZg+4VlVzUlVJuOPJVuHd8czQT5Zu8MH4rIKU3qHOXnXBwI3+mUabg1Smmop/Om2J
	i8zry+aQWBm1JAi9g/EF2YfCZAZ2pr0VDj3vjGjo8BYBahwmjPpfjwGll2qAUV7fbgfZ
	NQlA1L8a/Zptt/0OD4xes1j1jveWFozVvup8Ah6HxcAh5/aL4bYdmK+BGHaMnI5leJj1
	qMZqAqMwJdcGBkOthnY+5N+VBhJEBn/IpN0hdpkb2zZ5JybfzpgVZKsb9v1xRlpYxtgZ
	8xYjvFU3oOdMYG4zh8JYgqCXb5FOd882eWdiUNnAa8JQ1lury/xXLpDvFsJ3LTFyvank
	ffTg==
X-Gm-Message-State: AA+aEWaAacW3vUgmtLVz7sRAYsiNZPOzW/TFrLYXFHw0b0qPVH6kG0b5
	8/a/dKAjyT21CVXjaol4VP8IDe+WSt2/s2b6o+c=
X-Google-Smtp-Source: AJdET5cS/vFgfHgwf5nxuuZvqsrJ6Yd0CEqTQU1X88nfeLik5IDLjyRxyPxeBVEWaUYXrLAd4HRecckhEOhnIT9R2u8=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr5136365lja.111.1542825295409; 
	Wed, 21 Nov 2018 10:34:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
	<0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
In-Reply-To: <0ddaeccd-94fd-22a8-f5e0-91fbafdf1761@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:34:26 -0800
Message-ID: <CAKmqyKNitWerbpVzQrNye3KiPj=5DVFXan4SpiN-+br_P-RG+Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 18:35:04 -0000

On Wed, Nov 21, 2018 at 10:07 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
> On 2018-11-21 10:03 a.m., Alistair Francis wrote:
> > +    pci_bus = PCI_HOST_BRIDGE(dev)->bus;
> > +
> > +    for (i = 0; i < nb_nics; i++) {
> > +        NICInfo *nd = &nd_table[i];
> > +
> > +        if (!nd->model) {
> > +            nd->model = g_strdup("virtio");
> > +        }
> > +
> > +        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
> > +    }
>
> I don't understand what this patch actually accomplishes. It doesn't
> seem to affect my network devices when running QEMU. Can you provide a
> commit message explaining this?

Could you connect a PCIe networking device without this commit? This
is what the other architectures all do as well.

I'll rejig the commit message/title to make this clearer.

Alistair

>
> Thanks,
>
> Logan

