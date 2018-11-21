Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaOB-0004PL-Q8
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 16:50:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaO8-0004NE-UE
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:50:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaO6-0006RS-MY
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:50:24 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPaO6-0006Q0-EC; Wed, 21 Nov 2018 16:50:22 -0500
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so6144770lji.11;
	Wed, 21 Nov 2018 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YiymdL26slICpdTKkRFAIn8qYHQD+9w21dYVbeqE+S8=;
	b=gJ/GtUtYcI8083dbdNNUSSDK4sUY8if8Xumi1ETbnnzcr5rHoIjs4up5Y9db6C6P3w
	6Kh2iRlZF5NwgeZ8XJzOn3XjoSzAyMlY6f7rlSq7wjL41AHlqHpEHf0Q9JqX6Ue8NweK
	7KkWn1lUlWDSQSeu/76nSU48D/JiLCXjbtiYJtw91CyCIsPORdtBw0AiE++KUfKa1AMP
	Bl6VJ6vALXIl13olPZ+m/2hH7arD9KrGh7rGd8cLf/EC/j4QJy9QjTecWPUaNPsxZXAq
	dKwXmJEtky56UZjCd3GzAosp6UwFnmH+ByquwARRNUxk611C7DA0l2a4MeOun+Y0eVLz
	VnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YiymdL26slICpdTKkRFAIn8qYHQD+9w21dYVbeqE+S8=;
	b=JS8dxAf8OAAKC4jFUqrL1xhVXcNwyfVcyC04G2ZFY7Ee0whQCnoHMrngo9V0Fvj/PJ
	rwtYPTdrWhb/EC+DRo6QzXCRqJyVJnRIBz1Fev0jrP6ffzB0ki7nI6yuiJZ0dkvZIwcu
	IIPwAn0RuUnDhZqY5ByCqtCMXQxQTQoVeFy1fdLezZb5DHpR/TNUogZfSs4pyzOCAHcV
	NaceCgmsH0o4zEwe43NCFWMm59toifHzNa0kaUCAoW9lPRgq/bXHUxsGrsAHBE7F4h+d
	H5polTw+5f2KD3Kd5mQPXz0Fgba8ussw8hCD3HmJHhlEtEc1zp04XP4tHk/ACjfLZNue
	vpqw==
X-Gm-Message-State: AA+aEWZGPkNvuJTNqQyxOMI+Dzwd5rF0noxB8Igp6TpV8nv6pnAT9t+d
	eej5XeZp8JgtHu3zIIPDDsExl1Pw4fPlCTurUps=
X-Google-Smtp-Source: AFSGD/VloPE+kHlM5hS16W1N+r9rT6XnGctF+m1HfwthTHfFL1ATiiiEIEgqIlXfthBczJDeo91maVlPBnEEJt4YR4A=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr5088697lja.58.1542837020554; 
	Wed, 21 Nov 2018 13:50:20 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<mhng-ac7d7069-f2ae-45b5-a950-17410b48481f@palmer-si-x1c4>
In-Reply-To: <mhng-ac7d7069-f2ae-45b5-a950-17410b48481f@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 13:49:53 -0800
Message-ID: <CAKmqyKM2pmF_D812mp1hcJe8KcLGiNz9vLpy7OpsbS0XxNwo+w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 21:50:26 -0000

On Wed, Nov 21, 2018 at 1:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 10:32:45 PST (-0800), alistair23@gmail.com wrote:
> > On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>
> >>
> >>
> >> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> >> > Connect the Xilinx PCIe device based on the information in the device
> >> > tree stored in the ROM of the HiFish Unleashed board.
> >>
> >> I only briefly tested this patch but could not get any PCI devices to
> >> come up with the sifive_u machine. Depending on the kernel I tried, it
> >> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
> >> the DT) or it appears to successfully initialize a Microsemi device but
> >> did not enumerate any devices underneath.
> >
> > That seems like either a kernel or bbl issue.
> >
> > You need to make sure that bbl doesn't edit the device tree (to add
> > the Microsemi device or remove the Xilinx one) and ensure your kernel
> > supports the Xilinx one.
> >
> >>
> >> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> >> least explained in the commit message.
> >
> > What should we say? The QEMU machine accurately models the real
> > hardware which reports a Xilinx PCIe. The confusion generally appears
> > above QEMU where people are used to using the MicroSemi one.
>
> I think the real issue here is that "sifive_u" doesn't actually fully describe
> the device we're trying to emulate.  Is it a:
>
> * Generic SiFive U core?  In that case we just have a 64-bit core and
>   essentially no devices.  This is kind of useless.
> * A HiFive Unleashed?  In that case there's no PCIe, as it requires an
>   expansion board.
> * A HiFive Unleashed + VC707?  Here we have Xilinx PCIe.
> * A HiFive Unleashed + Microsemi Expansion?  Here have Microsemi PCIe.

This isn't even always consistent. For example the sifive_u machine
exists for 32-bit cores, but the PCIe address reported by the hardware
only works for 64-bit machines.

So we need a trade off between accurately modelling the hardware or
having 32-bit support.

>
> There's a tradeoff between accurately emulating the hardware and blowing up the
> amount of targets we support in QEMU.  We went through this discussion before
> and ended up where we are now, but maybe it's best to go have the discussion
> again?

Up to you, it is your board :)

I think it makes more sense to remove these generic boards (that is
what the virt board is for) and model real hardware boards.

Alistair

