Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaZB-0001Mj-6j
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:01:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaZ6-0001LX-DM
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPaZ3-0001Tm-Vh
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:01:44 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:36475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPaZ3-0001S3-7c; Wed, 21 Nov 2018 17:01:41 -0500
Received: by mail-lf1-x143.google.com with SMTP id a16so5113668lfg.3;
	Wed, 21 Nov 2018 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oNPy/SpwmVBis33CwGRD+Rca3uuFFQ3JwGVmFuTMpsI=;
	b=QwjkReMO+6eaX2E490QHQ8ycCuKxZ9OxvUWsqbyEupAoE2gxVQ36aDe9OgjHo/JxJn
	JPFUb7ATDryyRxsIdAquRtpOwJu9AWUtpJVg0aV0GV5YHfByKtKImh2BADI3nXGHvWmz
	LmMoqR5d+TUlgEHF8xbTxJYkw2Iiesp7eRxu9G8c6b9CEgXCAB0HVLselK9X/gIIVSDw
	xVvIPUVIvQp4wmrq2PsTeV9yV8j/k5Lwkako8HcQdt+uHtSh6HBcc/nZUl4ZW+AYEsJv
	DtblVLBbUMKo2qysMsdMNTdyQaRv4bdwdoIB0ua0VP4mjv2W4h9nPJQqVu08NBvVPiDR
	jRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oNPy/SpwmVBis33CwGRD+Rca3uuFFQ3JwGVmFuTMpsI=;
	b=EawVts4gI3tFbZNabFXITgDbmvQMOwvyp0oyUvsKf33L9YETtpfBHe09dFaGFtzxnm
	qwY60nzAKxVlIpfYI8EExW7S7v9urutE6LKLmbEkvZODwHLYKxYnC+b79roUkj45PqOE
	Tf1XCEcVmzXgaHDlcdgOmcIHJ3PnjjuKEtWWxJdpxkB7d4HWHrF8Rub3jgtSele2MJG3
	3aC7wigHb4STzZzQ1DKFN1XDMDx+bjKJYXdGtFMhRw/MsD089faGEbh69zFmpphJr8Rm
	l1Iz6rYLyXF2Spp3GDz43U0c2rBZqnKPhMroLRccUn4TE1QPYlz8kAlDGQ2iGMN5I3ll
	A+/A==
X-Gm-Message-State: AGRZ1gL5MyzygPvJF9soY0buf1UiTLaMNmxWj5SeQKsxdrt74wV9NCdy
	A6fbQI7CxXDjiwFDwIMGFNJHTAI5wKeeLmMutqk=
X-Google-Smtp-Source: AJdET5fu/kVj2yrrtvIzE1gQs503QfxobQD1X0xS8LVRKk1uGeAFKua0nQln7NK4fLVFhFQZ0vXoBsYHI3qsI19ePKY=
X-Received: by 2002:a19:5782:: with SMTP id l124mr4646432lfb.91.1542837698314; 
	Wed, 21 Nov 2018 14:01:38 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
	<mhng-ad48cd5f-383f-427e-9bd6-db4947b3839f@palmer-si-x1c4>
In-Reply-To: <mhng-ad48cd5f-383f-427e-9bd6-db4947b3839f@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 14:01:10 -0800
Message-ID: <CAKmqyKMZ7+xAPcks33omgaEjQig9b-BSDGMbZBfTDSzW8eiThg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Wed, 21 Nov 2018 22:01:47 -0000

On Wed, Nov 21, 2018 at 1:37 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 11:21:40 PST (-0800), alistair23@gmail.com wrote:
> > On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>
> >>
> >>
> >> On 2018-11-21 12:16 p.m., Alistair Francis wrote:
> >> >>> Do you see the MicroSemi PCIe probe in your dmesg?
> >> >>
> >> >> I do when I have a kernel with microsemi PCI Support (specifically the
> >> >> one included in the bbl you sent us a while back).
> >> >
> >> > Yeah, so you need to make sure that doesn't happen.
> >>
> >> Well, I also have a kernel (one I've built myself) without microsemi
> >> support, but with Xilinx support and it also doesn't work (see my dmesg
> >> logs I sent).
> >
> > So this one should work.
> >
> >>
> >> > For people who have modified the standard bbl to edit the device tree
> >> > before passing it to Linux to add the MicroSemi PCIe node, it won't
> >> > work. That's a very small number of people who have modified the
> >> > standard boot loader. I don't think we need to document how those
> >> > people get back to the default set-up.
> >>
> >> I have not done that. And it's not working for me.
> >
> > If you haven't done this then how can Linux know to probe the
> > MicroSemi PCIe root complex?
>
> BBL passes this through from the FSBL, which has the DTB compiled in:
>
> https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts#L405

That's fairly new though. Our boards show a Xilinx PCIe device.

Alistair

