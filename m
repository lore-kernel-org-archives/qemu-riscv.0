Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPahV-0006vl-R5
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:10:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPahT-0006su-9l
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:10:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPahR-0005pC-P3
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:10:23 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPahK-0005BP-Tm; Wed, 21 Nov 2018 17:10:16 -0500
Received: by mail-lj1-x241.google.com with SMTP id z80-v6so6198830ljb.8;
	Wed, 21 Nov 2018 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n8m8jYg7Mpm33zAjh/RbU9lKeq0y1W3pr3tmI1IcaDI=;
	b=dp9F6lCNKtQ8QESwowYpbqCW65Q7Pq3+B4Z1gRhXu8SgYJzfH6aOjA7Uj00Gxm0osy
	Y0+xOsBvPMuTMMK1WnxROv5atTBeZTQSsYEbjangtvhHGQryFk/gvwazUirNyEieeoAI
	gbHPZEKXwZ4ma3i09Lb4R5m7DQnsq+/m/3FucQR0h4PX02i7hEXNjxSElfuDcyXIBtAy
	oJNW6zwAp9YkKeHz527T//RF5UNlIOV0O2HsIXz0bk1m5/CfxaNnjkAFEp9LFWhPxnhh
	XtmkSE0av1/M7k2mlDRFIRBdfFHjpG5k8W5loLrlRu0zlCPg2SeUk29tgiQ36LuzcPYX
	vZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n8m8jYg7Mpm33zAjh/RbU9lKeq0y1W3pr3tmI1IcaDI=;
	b=UznfndkbLq0pujaQZKKf7gPGwY0Y0Y7mlHYHBHTpyrwZsY0kPUIT8amTLmX9oJ9XiX
	EWJjY3SodJe5onViH2dCVMEchQfACDQGbirUK96s0hG5I0FPxb5Zp83h5IaWTaUQ06VM
	XJ2odtNxuDgwVmx7BvkuohWp92eeD0viQjvsBDizODAMKTk5z7oU9cxFDaKaYxPA4xuo
	MJckkfpSrAuV9qsMTwtDP5ZDDZ0Ec3KmZeYeazYeryQYTPxhFBX0gdHhK0PYvQBOTcWg
	45vEdb2FfzQ2Lr3z5eyHtl1ryNNK9mBFxY/JGxs4iONrCbiIg0Fc8FVpw4U0Z0C2b8y6
	eoIQ==
X-Gm-Message-State: AGRZ1gIkEfysCVDKyOciT1LNfLVEINxCmSNR9maov8M5j1/4VG3+6Whr
	zuN/H77hfLUCTLmRRzXZnPrkosTpyVHswf8ItYQ=
X-Google-Smtp-Source: AFSGD/W9SrYIGY/9h43/Alr0SZ8HHX7+ODwGhrQsRGhL7HitMOtsFGRew8muVbA0Oi6iwmEGbQyjCBOMzjj4BiEgZmA=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr5115971lji.145.1542838205734; 
	Wed, 21 Nov 2018 14:10:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
	<CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
	<33646fef-adb7-26b4-ba01-79f9a0f5bdae@deltatee.com>
	<CAKmqyKMJvTb=JebfA1N-40-MqgHkAj98JOH51t6K--zjYLXSnA@mail.gmail.com>
	<d316a936-c726-dd4c-f90a-9690b4e3fc3d@deltatee.com>
	<CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
	<6480496b-dbb5-37bb-57e2-7a4819c61511@deltatee.com>
	<CAKmqyKMPHg7nGr-Ua1Cb7yvdZzWAs6HOM4eB+SinMypXQ5Ni6w@mail.gmail.com>
	<CAKmqyKMTiMJKCc=oEP97XLWFQMMfE0PFHB8ZKGm2=AP5_HEoNg@mail.gmail.com>
	<00f7a2ba-8eb1-77fd-1c4b-14e83e553bed@deltatee.com>
In-Reply-To: <00f7a2ba-8eb1-77fd-1c4b-14e83e553bed@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 14:09:38 -0800
Message-ID: <CAKmqyKOVKd0Wn1+t1rFbFJX3q3TQjovKVQ1_cC5P9oXHD_ZMpQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 22:10:24 -0000

On Wed, Nov 21, 2018 at 2:01 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 2:54 p.m., Alistair Francis wrote:
> > The last time I tested this it worked (although I might not have
> > tested interrupts) and now it doesn't. Nothing has changed in the
> > series, my guest software has changed though. I can see the root
> > complex, but no devices underneath it.
> >
> > Sorry for the confusion with the MicroSemi PCIe root complex.
> >
> > I think I'll just drop this patch. It doesn't work for 32-bit guests,
> > but I would like to model the hardware so I don't want to change the
> > addresses. We can revisit this in the future along with the gpex high
> > MMIO support and USB support.
>
> Yeah, I'm less concerned about all the board variant stuff as I am about
> having something actually work. I don't want to have to jump through any
> bbl hoops or anything to use it if it doesn't work out of the box. And
> you're right, getting the virt pci support upstream seems more important
> and this issue can be revisited later.
>
> On an slight tangent: what root device do you use with the sifive_u
> machine? I can't find any virtual hardware that works. If I had PCI I
> could use NVMe, but that's not working. And for this reason I've only
> been using the 'virt' device.

Yeah, it's a real pain. I had a go at adding the SD card [1] but never
got it fully working. Normally I just hack in the virtIO MMIO regions
and use those.

1: https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_spi.next
    I just did a quick rebase, fully untested

Alistair

>
> Thanks,
>
> Logan

