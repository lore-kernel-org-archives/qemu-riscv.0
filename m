Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXmg-0005L3-8J
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:03:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXmd-0005Is-PL
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:03:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXmc-0002Oy-93
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:03:31 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:33427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPXmY-0002KQ-TA; Wed, 21 Nov 2018 14:03:27 -0500
Received: by mail-lj1-x243.google.com with SMTP id v1-v6so5817597ljd.0;
	Wed, 21 Nov 2018 11:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TmUhXQK0xHrQakQuaNRedNcwqioY/UIEv2ZiU7tbE8c=;
	b=hG5uINCZ4eIdAnZcmpzelQ9h6+0B2x7vlfxb+e1Jv893mqBA7+eSR3Y4Ss67BuqkPJ
	wu60U4vrnyOUMMo7lOpLndf2LBrZmG+joykbSIzb5Pub4o8pBtEfWUrh0TwqkBgJOu8c
	AeCGdYdVyY6X/c/Nj1ArS7ssCk9lEEposAQwFFYMM/WtFsTVQDcVfBfUM4zpGzjY+Se7
	3aPAonBKM2Y92DeW+OSz4Y71ZMSXsb8Hvc0iZK/bewarmMTrZuPnosagfCx3amuOfy+R
	7Fi8+ea93v7ei+sUoraQT32Ihscsrxj8XbMgc6AQE7+3Pn7sWKHsr7Pvk6GMEZ2QJxwF
	TyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TmUhXQK0xHrQakQuaNRedNcwqioY/UIEv2ZiU7tbE8c=;
	b=WPUFs8szZ+wa0tqRLwZZpsE2bA6lehASwDD/40Yq/ghOdlpXVbSOthyvgvbvs2+N4X
	mBB/qpFz2WGoYDW/GTZCOGNMYAh1MQxDlao4eMTapeT9uamBj0KQ97hTUM1X71XblF64
	5l38quB8C9wczHUW+TVshEURfLHMU7k/5g6z/cWhc8lkbNqcnSiMN2qi6rNBIc1BDpPb
	S378+aYpWS1AfMc4Tf+dcl6FjsnBZqM7ZG85Yawq1WRc03AnThoKSRBgQ3Lldbzs1aeC
	rc25vQQOYyeb4CoP9vS9LxPvRgPsCM8FXKMeM7hQ7oWl+65c3xwxqZkVXkbFXXg2NV9K
	sUDw==
X-Gm-Message-State: AA+aEWYj3nma5p9fzMeMDR6wmumk9WCxd4vYm/tKjWg/MFA3+ybu5xv9
	Gck36Hi98EqbWmp/IijPfjqFwMirCQXPeiQ4ygA=
X-Google-Smtp-Source: AFSGD/XSaE4xxs6D1AsDgSgqLXjVuo719FLT43ZxpfKMgBZ4G3gIHf5RyAkdhBkJnjJDXtrMLgtdhfav4ctNMggx+Yo=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr4795636lja.58.1542827004831; 
	Wed, 21 Nov 2018 11:03:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
In-Reply-To: <ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 11:02:57 -0800
Message-ID: <CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect
 the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 19:03:33 -0000

On Wed, Nov 21, 2018 at 10:50 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 11:32 a.m., Alistair Francis wrote:
> > That seems like either a kernel or bbl issue.
> >
> > You need to make sure that bbl doesn't edit the device tree (to add
> > the Microsemi device or remove the Xilinx one) and ensure your kernel
> > supports the Xilinx one.
>
> Ok, how do I stop bbl from editing the device tree? I have a kernel with
> Xilinx PCI support but it fails initializing on that machine (see below).

You should just be able to edit the source, grep for "microsemi".

Do you see the MicroSemi PCIe probe in your dmesg?

>
> >> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> >> least explained in the commit message.
> >
> > What should we say? The QEMU machine accurately models the real
> > hardware which reports a Xilinx PCIe. The confusion generally appears
> > above QEMU where people are used to using the MicroSemi one.
>
> Maybe describing the bbl issue and what to do to overcome it would be
> sufficient.

This is not really a QEMU problem though. If you tried to use the
Xilinx PCIe board on hardware you would see the same thing. Most
people don't have a MicroSemi board so most aren't using bbl versions
that are editing it into their device tree.

Alistair

>
> Logan
>
>
>
>
>
> [    0.312000] xilinx-pcie 2000000000.pci: PCIe Link is UP
> [    0.316000] xilinx-pcie 2000000000.pci: host bridge /pci@2000000000
> ranges:
> [    0.316000] xilinx-pcie 2000000000.pci:   No bus range found for
> /pci@2000000000, using [bus 00-ff]
> [    0.320000] xilinx-pcie 2000000000.pci:   MEM 0x40000000..0x5fffffff
> -> 0x40000000
> [    0.320000] xilinx-pcie 2000000000.pci: PCI host bridge to bus 0000:00
> [    0.324000] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.324000] pci_bus 0000:00: root bus resource [mem
> 0x40000000-0x5fffffff]
> [    0.332000] pci 0000:00:00.0: bridge configuration invalid ([bus
> 00-00]), reconfiguring
> [    0.336000] pci_bus 0000:01: extended config space not accessible
> [    0.340000] pci 0000:00:00.0: PCI bridge to [bus 01]

