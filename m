Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaSc-0006ZH-UH
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 16:55:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaSZ-0006XV-TD
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaSY-0002y7-Cw
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:54:59 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPaSU-0002vI-CS; Wed, 21 Nov 2018 16:54:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so6144213ljh.13;
	Wed, 21 Nov 2018 13:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8lM24MxExnmGiY46Yo0nwvftvvw0L9iUcjWvG9WXU2c=;
	b=M2kH1jDaSfFh3jnvfqnaeYrl8yoLleZpXL0jnrV9rNq2CpuHB86XYSXttT+BRcNpEG
	mslk4pkhvuZ/mCitEW4dT3erSAnD/TQsMGw+h8m+x1re2zOajAer2l0tPfN4YJqywlpT
	F2IuO+tEw7/nQOya0dEYb5EFvxeY7KJMmjs5PQczidMG4KaKOWppEqbY9z6ZJT7Mw6u5
	2KmoPJteHC/IJb9hgrLFIpqxAjI/qy9u/EPhfyjdIkkfyeDBGKf3cVRY/WZKCdZ9c1H+
	HpsU6CsGeTF5wyCGVyT1/yqnrsD2OrXhbZEDvzU6QHFo6K5Uxk94DNMzp5Xg3auAnVhm
	FQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8lM24MxExnmGiY46Yo0nwvftvvw0L9iUcjWvG9WXU2c=;
	b=CmdQRbzK0nPdtEnjju1t7t8KxS41bPCwXiQ0bp+xOgzWrSoxPdRIaisaYlO+Cb+Dfy
	Mc0EcDJcmvSb5DkzSAmBTgkanIQx8iomS//O/pC00GXhgN3/Z/1qXWCc7J3eug8mbpjh
	2VYFJYs+d6xUtvHjxnAhP93Cb2F3JXIQuVGzWDVf5hR+9HqKU12oq/GHvsGOup8cqZYo
	NLSaWbBdQWuPDCQ6Ra2q1AsFqcpc4u0ExqOhYxLHw3Z18ijejZQXgVxjrgUN0FTb9r4P
	hRpqwcwgSxhYi+7ds85wCQ80VXjRdoMXYWu80hdvdy5jqTPXTMnrcwT9RUOfcYQVI7RJ
	i/NQ==
X-Gm-Message-State: AGRZ1gJP0A0g/3MIHeX/5YNqAPXeHp88HlQKU+VmXO3UMbVelf99/FY6
	oboalDAOT/AlcKVWZrs4S4u4m4tIaCul32HaBQNLog==
X-Google-Smtp-Source: AFSGD/XmiljoSKj6N2ax95Najhz0wRX3BhLkcWZpWwctZwd2+w7NdYeNDnf60MyXXETD2V0xvB4qlUvLxfkX0GNzubA=
X-Received: by 2002:a2e:7801:: with SMTP id t1-v6mr5053540ljc.84.1542837292731;
	Wed, 21 Nov 2018 13:54:52 -0800 (PST)
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
In-Reply-To: <CAKmqyKMPHg7nGr-Ua1Cb7yvdZzWAs6HOM4eB+SinMypXQ5Ni6w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 13:54:25 -0800
Message-ID: <CAKmqyKMTiMJKCc=oEP97XLWFQMMfE0PFHB8ZKGm2=AP5_HEoNg@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Wed, 21 Nov 2018 21:55:01 -0000

On Wed, Nov 21, 2018 at 11:51 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 21, 2018 at 11:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >
> >
> >
> > On 2018-11-21 12:21 p.m., Alistair Francis wrote:
> > > On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> > >> Well, I also have a kernel (one I've built myself) without microsemi
> > >> support, but with Xilinx support and it also doesn't work (see my dmesg
> > >> logs I sent).
> > >
> > > So this one should work.
> >
> > It does not, see the dmesgs I sent a few emails ago.
> >
> > >>
> > >>> For people who have modified the standard bbl to edit the device tree
> > >>> before passing it to Linux to add the MicroSemi PCIe node, it won't
> > >>> work. That's a very small number of people who have modified the
> > >>> standard boot loader. I don't think we need to document how those
> > >>> people get back to the default set-up.
> > >>
> > >> I have not done that. And it's not working for me.
> > >
> > > If you haven't done this then how can Linux know to probe the
> > > MicroSemi PCIe root complex?
> >
> > Oh, well actually, in this case I was using the bbl/kernel you sent us,
> > so I'm not actually sure what's in it. The stuff I built myself doesn't
> > have any of the microsemi stuff, so it sounds like all that was a red
> > herring.
>
> Ah ok. There was some confusion there then.
>
> So now it sounds like it's not working and there is no MicroSemi
> device. I will check and see what I find.

Yep, I have no idea.

The last time I tested this it worked (although I might not have
tested interrupts) and now it doesn't. Nothing has changed in the
series, my guest software has changed though. I can see the root
complex, but no devices underneath it.

Sorry for the confusion with the MicroSemi PCIe root complex.

I think I'll just drop this patch. It doesn't work for 32-bit guests,
but I would like to model the hardware so I don't want to change the
addresses. We can revisit this in the future along with the gpex high
MMIO support and USB support.

Alistair

>
> Alistair
>
> >
> > Logan

