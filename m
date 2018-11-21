Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPY4j-0007bC-L1
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:22:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY4h-0007Zk-Oe
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:22:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY4g-0002y2-QA
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:22:11 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:32770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPY4e-0002rt-Ie; Wed, 21 Nov 2018 14:22:08 -0500
Received: by mail-lf1-x141.google.com with SMTP id i26so4832978lfc.0;
	Wed, 21 Nov 2018 11:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7EGF4a2Ag17fHk18rF2U5z79ZRmUszw4tr16UhZDtG0=;
	b=e4wv6hzVUGiSN0UOMJDWTwm5XNaV+roxEzkWmy9K9frzDLuhUhDJIjfZESGk8kwo/3
	cPPfXJwJy24UbHVrzs+lXkiu1eJHZ8C5mVzzpahiSasPWMGjMmk0i7S0bXLcXEvynAid
	ztRAyq+miYnyjssKh1Zgx/XEq47tOhCxMi8g06GeZiLp3iAhZ9Cm7h2GX5xnkbKZPWzm
	teq9oxc9RKYNMdcFWO59NL204AvoeilFFsGjJkByNjLFYtNU5RDi2gUw9Yk8byH4tSmQ
	GhJ2H4mzceZDUbvzFIdcGZrl52UJtDOodKcnwVGu6OiCwPa5OY+SI5KuxrNN465j+3uW
	yccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7EGF4a2Ag17fHk18rF2U5z79ZRmUszw4tr16UhZDtG0=;
	b=NZF7+H1QjgTepj139cK2rXjfqegzXrOl6vQj45IfSLizMuErlHKdYsZhdy+623hge0
	p8CpIIJ8alQpp5ns8QnAeFJxwCb9acOCmN627PVcG2MJ/K6NoaviFOVOi5GhK23aKK2Z
	CgkFThOgb1dyOijLQ9EkteHqop/MHPfIRf16LdNxYYQPZ/yE1f8CRdR5HqavIO4ke+Xi
	cl2upH+Abj7ASVoPnzXSUDqnkqWUimhhCT7Ipj7C/xCWlzKzca5MKzp0JfcRFC/kXKFZ
	J7qNwxAk1I/pGijcTgR2bQQ+b6gOsYuiqxz7Y7hPEeqPAtY5hUnE3g9aIVWcKgGFg2Lr
	qYrQ==
X-Gm-Message-State: AGRZ1gJ33oabyTB/AkI3FsGgWlxtcZGuYmyqEVqnGBl/3qkR/zooX6RF
	ECVQHqtzvdy4gLDB7uA09yKLP0iO4FyNQQYbwJw=
X-Google-Smtp-Source: AJdET5erd63R2FRKBnaycOh0V/0fDxxdoC5Ycts5gnVDFAMrIjCkTmaHpwYJR4aoc2ysspmIiuJEK+i1JDMPGOG/qn4=
X-Received: by 2002:a19:5782:: with SMTP id l124mr4391607lfb.91.1542828127273; 
	Wed, 21 Nov 2018 11:22:07 -0800 (PST)
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
In-Reply-To: <d316a936-c726-dd4c-f90a-9690b4e3fc3d@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 11:21:40 -0800
Message-ID: <CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Wed, 21 Nov 2018 19:22:12 -0000

On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 12:16 p.m., Alistair Francis wrote:
> >>> Do you see the MicroSemi PCIe probe in your dmesg?
> >>
> >> I do when I have a kernel with microsemi PCI Support (specifically the
> >> one included in the bbl you sent us a while back).
> >
> > Yeah, so you need to make sure that doesn't happen.
>
> Well, I also have a kernel (one I've built myself) without microsemi
> support, but with Xilinx support and it also doesn't work (see my dmesg
> logs I sent).

So this one should work.

>
> > For people who have modified the standard bbl to edit the device tree
> > before passing it to Linux to add the MicroSemi PCIe node, it won't
> > work. That's a very small number of people who have modified the
> > standard boot loader. I don't think we need to document how those
> > people get back to the default set-up.
>
> I have not done that. And it's not working for me.

If you haven't done this then how can Linux know to probe the
MicroSemi PCIe root complex?

Alistair

>
> Logan

