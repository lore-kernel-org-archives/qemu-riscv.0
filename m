Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXJR-0004pq-6r
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:33:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXJP-0004oA-6f
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:33:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXJO-0003GH-DO
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:33:19 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPXJK-00038x-TV; Wed, 21 Nov 2018 13:33:15 -0500
Received: by mail-lj1-x241.google.com with SMTP id z80-v6so5717887ljb.8;
	Wed, 21 Nov 2018 10:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TQBUT76e3j3umu3ZC3wF+jcz0REjtYp6lptI+UAt0oU=;
	b=DOYO+9Ly86Qb6QIkLbleknkK1OmOXuJ8DnffsL2WivITt6WQk2LO0/LjhaTztX6u5m
	+1mqMPekJKlHCwU43u4AIHjEgQOeqiP6i0juQuctCSt2dh1QhfEzv4D/qukoyp1NxJNt
	rs41w1Dv1ByvDzIbReOsMbjS1XcMlR2mcBYBbp8VVFR7jjyMYI228K1v+88xkA2SnMNh
	mDMLVGhMAXKg7CxORcgefIwFavODvZdfDCDN3GxeDd95qr9z0sgcvDA3InYtmw99QH1W
	FUuPHYGVGr9qHT/al63BpPsVft/YyazSeqv8K8d+00CCbthZxyEhckOOAxeR+JyAGwwd
	uNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TQBUT76e3j3umu3ZC3wF+jcz0REjtYp6lptI+UAt0oU=;
	b=EeZulXEYqMYRFOb694VaiTPJTHijhZTNtkbpvTHWSqnXqSU7ZSbaO0YLCl7KoGpJgO
	fc+SLVqUVBjuuw25rRNZ77IF54lDs68lp29eYcZlybWgJvplMlD4WewA0GlAa0Asyp8O
	gSpLrhmNo5kuUJO/7Bq/PBlC1rFGvBuwjBeSjvalb+wlPCYU0tm+r3xlOeUpk2JKvvYD
	xiujAAsGFN0ZsSvEXXUGlV9Taixbl6owXO8Xe0ryz/jmdCtDqapCgh/mFkS14RR612bN
	Sp3QA/WrBuYRXenVPNfVRB4kzOrhLX0MinIkyyzlaZ165MjeD4Y73uJtDF+hCHn1eNfZ
	1oxA==
X-Gm-Message-State: AGRZ1gJTmje9/FsKUzd0YkxZQD/Yp2p143YMC9480cJ1F9qT2R8M7Nq8
	exMy77Pe+LNAcCFbnW93chhx34cplTbRTREohJM=
X-Google-Smtp-Source: AFSGD/VkHlGCcdb5CklbmxP2AgSPImi0SSiE/eP5pxXUR4kyTcS9veZ7w4vxZ8iYzMnJQLYWsxrjP0WFW6QXBzx851c=
X-Received: by 2002:a2e:7801:: with SMTP id t1-v6mr4689303ljc.84.1542825193191;
	Wed, 21 Nov 2018 10:33:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
In-Reply-To: <e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:32:45 -0800
Message-ID: <CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Wed, 21 Nov 2018 18:33:20 -0000

On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> > Connect the Xilinx PCIe device based on the information in the device
> > tree stored in the ROM of the HiFish Unleashed board.
>
> I only briefly tested this patch but could not get any PCI devices to
> come up with the sifive_u machine. Depending on the kernel I tried, it
> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
> the DT) or it appears to successfully initialize a Microsemi device but
> did not enumerate any devices underneath.

That seems like either a kernel or bbl issue.

You need to make sure that bbl doesn't edit the device tree (to add
the Microsemi device or remove the Xilinx one) and ensure your kernel
supports the Xilinx one.

>
> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> least explained in the commit message.

What should we say? The QEMU machine accurately models the real
hardware which reports a Xilinx PCIe. The confusion generally appears
above QEMU where people are used to using the MicroSemi one.

Alistair

>
> Thanks,
>
> Logan

