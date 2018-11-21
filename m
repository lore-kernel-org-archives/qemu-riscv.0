Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPY0A-0004Z6-0V
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:17:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY07-0004Xw-SZ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:17:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY07-0006XD-0z
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:17:27 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPY05-0006Ux-6Q; Wed, 21 Nov 2018 14:17:25 -0500
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so5811180lji.11;
	Wed, 21 Nov 2018 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u5v1ElqjcvRyX4HdryHCzfCv6qpD9dH7cRjT1nkZLRk=;
	b=EqqKkFpny2ySVL0W50wPU9Nt5EX6h3JgOT2FFn7aWAAu/GKYdXdVhxlqYM+iONAOOK
	Ldi4aCGeKPwPvj7/3jdhcdsRpIXz4D5JMDj/Pp+tQ7TvgNa2J5sKZ5l/wMUXG5PCNVme
	2bcj4v4r7Oh2h9/L7nGXsYYwoGqChIlpk4Hkh56da4pNGxvg/oZC0NiJsUU4JGEJnh8s
	azJYKXBXoxJ75NOLceBkmVC38X8h96Zy27pDg1KDzeUYyaOFiwEewe9xmpz8EWCxjibp
	ePGWYkRSBL0sFOxWjpKcau6FEi85y1fjWhJh75JpT3jpLVO2AoGl/rAdRgW5p9L7EXNy
	gt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u5v1ElqjcvRyX4HdryHCzfCv6qpD9dH7cRjT1nkZLRk=;
	b=NvnBmARPtfuRmaBNLcYaC5ECbf2RbPWO58yIJBqLay2Mhse6zFTkAUDfH+IKEZ2U6f
	nw5SXRhui/SxV3QpG158RFVj30p322cJ+M7KKTDy00txxsf5QhSVBA0hkMBkNe+WND1B
	FdDGsWrvtjZ7gv+JPvJe76B2NPttYhAyd8aFXwSc69VgrNPhK058LExei0QSQcUB3C/c
	X4PRU2lUEngUxGiuG/2U9zNdlb4dRZzgQzLVn+NVUSIkQELwh28VzYciuwnzj9zz7izO
	fRkCaWhYgFkD5K2y6zekXNZtJyk2K7paU0sG2duuK0XkQv80MUfSAzkMi2YEeKDc5ncB
	EpmA==
X-Gm-Message-State: AGRZ1gI2X0b9r94iIwvFxQqrur8G4EJZmD3Xf0IOUZK97couymBJIWyn
	rxeAkNn5gREJU7udSB36RDJ9gZmbACfk34JftB8=
X-Google-Smtp-Source: AFSGD/XfyjB7fkSzi5xU9Q+7Vw4LyyjGAdpib5b0mTk1lWjoU45LSztsnV+X4+T7RgIIff+QZZGXTBQuquq8HEAoU+c=
X-Received: by 2002:a2e:7801:: with SMTP id t1-v6mr4779081ljc.84.1542827843771;
	Wed, 21 Nov 2018 11:17:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
	<CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
	<33646fef-adb7-26b4-ba01-79f9a0f5bdae@deltatee.com>
In-Reply-To: <33646fef-adb7-26b4-ba01-79f9a0f5bdae@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 11:16:57 -0800
Message-ID: <CAKmqyKMJvTb=JebfA1N-40-MqgHkAj98JOH51t6K--zjYLXSnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 19:17:28 -0000

On Wed, Nov 21, 2018 at 11:09 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 12:02 p.m., Alistair Francis wrote:
> >> Ok, how do I stop bbl from editing the device tree? I have a kernel with
> >> Xilinx PCI support but it fails initializing on that machine (see below).
> >
> > You should just be able to edit the source, grep for "microsemi".
>
> Gross.
>
> > Do you see the MicroSemi PCIe probe in your dmesg?
>
> I do when I have a kernel with microsemi PCI Support (specifically the
> one included in the bbl you sent us a while back).

Yeah, so you need to make sure that doesn't happen.

They are practically the same device so they end up conflicting.

>
> >>
> >>>> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> >>>> least explained in the commit message.
> >>>
> >>> What should we say? The QEMU machine accurately models the real
> >>> hardware which reports a Xilinx PCIe. The confusion generally appears
> >>> above QEMU where people are used to using the MicroSemi one.
> >>
> >> Maybe describing the bbl issue and what to do to overcome it would be
> >> sufficient.
> >
> > This is not really a QEMU problem though. If you tried to use the
> > Xilinx PCIe board on hardware you would see the same thing. Most
> > people don't have a MicroSemi board so most aren't using bbl versions
> > that are editing it into their device tree.
>
> It's a qemu problem in that people will want to be able to actually use
> qemu... somehow. It has to be documented what's required here. You can't
> just say that the sifive_u machine won't work and it's someone else's
> problem. People using qemu will not be able to figure out there are bbl
> issues.

I'm not saying the SiFive U won't work.

For people who have modified the standard bbl to edit the device tree
before passing it to Linux to add the MicroSemi PCIe node, it won't
work. That's a very small number of people who have modified the
standard boot loader. I don't think we need to document how those
people get back to the default set-up.

Alistair

>
> Logan

