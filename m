Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPauT-0002mY-7s
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:23:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPauO-0002kZ-HF
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:23:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPauN-0006jJ-CO
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:23:44 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:41157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPauN-0006hQ-50; Wed, 21 Nov 2018 17:23:43 -0500
Received: by mail-lf1-x141.google.com with SMTP id c16so5132119lfj.8;
	Wed, 21 Nov 2018 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/1yYSLwKG2L6wO3MTeBxYJwD6BqyFY5bgBzSkkopHhw=;
	b=iyTZtXkfrAeC927svp6ntGyDNU32hGNVACmg4dKpurCl9TIRLtJUXzql95wWpS+NQi
	mzQkFWPxa2T1uxb0ivq1Z7J0DjWIkg50gHLf1nq9cS9hB+OVMb0tBuQJhqP4NI+eDQeI
	MglE2oVHP9f5eJ6mFGqerlC6SNE5CoD+yBmEvII8N7ULIlZG/YcMX38YY3I7hMseUiLd
	mFKS952Y9CE2W3r22jUCyl+7QMBHn728Cm9UkJREI3WGWI0uKH8syI9i1qoLeMndvZ0F
	YF+71mi3VAvM0WxmCSo2ewcqMoEnrPifTME6rDS1VuAwzJ7zi9m+rWjiOfwBIzooctTn
	1VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/1yYSLwKG2L6wO3MTeBxYJwD6BqyFY5bgBzSkkopHhw=;
	b=fKao2qp7Pm+bcww9u+Bt0iaTxjD9y6VnlynZg9GfxKZMXPci/BTEc8rn+KD1v9WDzE
	jfT7qZZELAGLjKoKTmFWsLY5zj+IlVKXKS/KOkk3QgtPT0BnUrvIPsRqCV+dzsjtFR7z
	OsKL5CnJn93rbgtI3TzlSjTvlWwSlKTntO3V3RerKCw3H8gweSZPbSYNUjvQetnqvdEw
	Q2ireW/+mq/mumg4QbC/QyNGdG2HQmLmrp+ep2fmP8VcHCIls+CiizZs6uKXRuMVKBFT
	R5ys4K1uMbHIft4Iqun0zrxPOXHDwLPIxaQOniTEPTM+yTgbiZepKcHE1vYgTAFPAPSA
	/Z/g==
X-Gm-Message-State: AGRZ1gIQmp2sNVIRVwt+H2FzcbYfYT3tfITv6rx2trX9b1KLEB7nghr2
	yJ1+ouqnLe5CAcaoSsfX0Speo8y4+pT0yoZ+HFM=
X-Google-Smtp-Source: AJdET5cuje0JVdV9QVJwAW047edaQIC4hObasLyu+g8IenRK0PUZFPJTvfSVGOdWx6wwz3hoX7pGQ1qzd3OaqF5F4PI=
X-Received: by 2002:a19:ae03:: with SMTP id f3mr5130194lfc.86.1542839021779;
	Wed, 21 Nov 2018 14:23:41 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKM2pmF_D812mp1hcJe8KcLGiNz9vLpy7OpsbS0XxNwo+w@mail.gmail.com>
	<mhng-39e17271-363f-4e08-ba7e-779c2f46b54f@palmer-si-x1c4>
In-Reply-To: <mhng-39e17271-363f-4e08-ba7e-779c2f46b54f@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 14:23:13 -0800
Message-ID: <CAKmqyKNpSWpaUVzJobNPvB=_T+tXhGdiWPTkWmQxdKQf8SHbig@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
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
X-List-Received-Date: Wed, 21 Nov 2018 22:23:45 -0000

On Wed, Nov 21, 2018 at 2:15 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 13:49:53 PST (-0800), alistair23@gmail.com wrote:
> > On Wed, Nov 21, 2018 at 1:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Wed, 21 Nov 2018 10:32:45 PST (-0800), alistair23@gmail.com wrote:
> >> > On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >> >>
> >> >>
> >> >>
> >> >> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> >> >> > Connect the Xilinx PCIe device based on the information in the device
> >> >> > tree stored in the ROM of the HiFish Unleashed board.
> >> >>
> >> >> I only briefly tested this patch but could not get any PCI devices to
> >> >> come up with the sifive_u machine. Depending on the kernel I tried, it
> >> >> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
> >> >> the DT) or it appears to successfully initialize a Microsemi device but
> >> >> did not enumerate any devices underneath.
> >> >
> >> > That seems like either a kernel or bbl issue.
> >> >
> >> > You need to make sure that bbl doesn't edit the device tree (to add
> >> > the Microsemi device or remove the Xilinx one) and ensure your kernel
> >> > supports the Xilinx one.
> >> >
> >> >>
> >> >> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> >> >> least explained in the commit message.
> >> >
> >> > What should we say? The QEMU machine accurately models the real
> >> > hardware which reports a Xilinx PCIe. The confusion generally appears
> >> > above QEMU where people are used to using the MicroSemi one.
> >>
> >> I think the real issue here is that "sifive_u" doesn't actually fully describe
> >> the device we're trying to emulate.  Is it a:
> >>
> >> * Generic SiFive U core?  In that case we just have a 64-bit core and
> >>   essentially no devices.  This is kind of useless.
> >> * A HiFive Unleashed?  In that case there's no PCIe, as it requires an
> >>   expansion board.
> >> * A HiFive Unleashed + VC707?  Here we have Xilinx PCIe.
> >> * A HiFive Unleashed + Microsemi Expansion?  Here have Microsemi PCIe.
> >
> > This isn't even always consistent. For example the sifive_u machine
> > exists for 32-bit cores, but the PCIe address reported by the hardware
> > only works for 64-bit machines.
> >
> > So we need a trade off between accurately modelling the hardware or
> > having 32-bit support.
>
> Yep, there's another issue.
>
> >> There's a tradeoff between accurately emulating the hardware and blowing up the
> >> amount of targets we support in QEMU.  We went through this discussion before
> >> and ended up where we are now, but maybe it's best to go have the discussion
> >> again?
> >
> > Up to you, it is your board :)
> >
> > I think it makes more sense to remove these generic boards (that is
> > what the virt board is for) and model real hardware boards.
>
> That seems reasonable to me.  Is removing boards allowed?  If so I'd be OK

It's possible, but takes some releases and deprecation warnings.

You can see info about it here:
https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features

As it sounds like no one uses sifive u board (you can't specify a
rootFS) it probably isn't that bad to remove.

> renaming these to "sifive-hifive1" and "sifive-hifive-unleashed", and possibly
> adding a "sifive-hifive-unleashed-vc707" as it's possible to emulate most of
> that.  Then we at least have accurate names for the boards.

That sounds good to me.

>
> We do have an issue where I'd like to be able to have some system by which we
> can configure the memory map of the target, but maybe that's separate
> discussion.

Yeah, that would also be nice, but I think is separate.

Alistair

