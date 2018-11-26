Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gROVc-0008I9-Ng
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 16:33:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gROVa-0008Fq-45
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 16:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gROVZ-0006nZ-51
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 16:33:34 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gROVU-0006ko-An; Mon, 26 Nov 2018 16:33:29 -0500
Received: by mail-pg1-x543.google.com with SMTP id g189so6779960pgc.5;
	Mon, 26 Nov 2018 13:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=byVFESQGdoHWWzeakPNk+l6LNXE9e6v1nFCu8/lqPgE=;
	b=R7C6Ial7yGHjcVUpaVqOyG/hYP1Q5NXynF9ZsNVcDJa5VeicKZWxJ6C4ZeHbKOhz0j
	gj7VY8WCGOt5ouAso7iJkPqLHTPX7tlfu5jmIrUjLfhnRuA5qtw1AbVVd2lJLWoSVnJ3
	quenxISbpojmkGNMZiNSxIr4o0y2GIaZ9G9n9ZdAu6NUQ0EIuNx9IyfATEmaQXnco9v8
	clas94Ecmp8LbGqiRBzIrE8eQ382dVVJ40c/sOr9imW78qdC1LYyU8jX7J2gbmabLerI
	uqsM0P4I8AM+pLbVDVzC3FCvoqa4Cl+rxqJfLBrHKfxA1U6z3/DG8w+G8lPjIN2ITJeB
	Vtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=byVFESQGdoHWWzeakPNk+l6LNXE9e6v1nFCu8/lqPgE=;
	b=W1rql+jSH4bhlR95woeGA9f/ANaFYZv8Zaqfyg9Ks7YI3W9ZHAtemWvRpUSY+orfTE
	HShMojZ+BviYa22C9e54nbRS1yrr7sT2//o3bq72nxcGWKOcsxO1s7OPJAvRoZWQwSjt
	hLgyZgULBy84L0zbluy9O4ws3BsdyWSPvAmOTQDqDDIEqopz+eIz7+/ap1LAfA9Hana6
	KjbZckgxjIllRNFDn/tY2ts9QxS/Y3BYmwYBccLb/pp6tJdDYX4nbEbK9UJXCGx+QckZ
	S53pEVRE+m18vZadmr/jBJnb7mCFuB32ZatDEftP996LNl06QwLp9wGjDHXMrnGjq0j1
	xRBA==
X-Gm-Message-State: AGRZ1gLVSrhlnfX3Y5pjZVq8cmDE4OmeCftpPOppfqoCETYLBOOByZw9
	PRSey2dPGbO9pog164W4oqE=
X-Google-Smtp-Source: AJdET5ebaKYbOQDEWEWRYojQ236UKRw8e/7AX0UXjwO0sY/UfBhFH3aCpCvzK33w6Q/kEExDK8WkGg==
X-Received: by 2002:a62:4641:: with SMTP id t62mr28908011pfa.141.1543268006998;
	Mon, 26 Nov 2018 13:33:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	l11sm1720874pff.65.2018.11.26.13.33.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 13:33:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Nov 2018 13:33:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: abologna@redhat.com, Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	logang@deltatee.com
Message-ID: <20181126213325.GA4937@roeck-us.net>
References: <84778e31610b0b98aea9b2dec5570a02dbf52180.camel@redhat.com>
	<mhng-b12cc231-a10a-454f-a088-21932acd8edf@palmer-si-x1c4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-b12cc231-a10a-454f-a088-21932acd8edf@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 0/6] Connect a PCIe
 host and graphics support to RISC-V
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
X-List-Received-Date: Mon, 26 Nov 2018 21:33:35 -0000

On Mon, Nov 26, 2018 at 11:34:58AM -0800, Palmer Dabbelt wrote:
> On Thu, 22 Nov 2018 02:59:18 PST (-0800), abologna@redhat.com wrote:
> > On Wed, 2018-11-21 at 17:02 +0000, Alistair Francis wrote:
> >> V7:
> >>  - Fix the GPEX memory mapping thanks to Bin Meng
> >>  - Fix the interrupt mapping thanks to Logan Gunthorpe
> >>
> > [...]
> >>
> >> Alistair Francis (6):
> >>   hw/riscv/virt: Increase the number of interrupts
> >>   hw/riscv/virt: Adjust memory layout spacing
> >>   hw/riscv/virt: Connect the gpex PCIe
> >>   riscv: Enable VGA and PCIE_VGA
> >>   hw/riscv/sifive_u: Connect the Xilinx PCIe
> >>   hw/riscv/virt: Connect a VirtIO net PCIe device
> >
> > Using QEMU master + these patches, libvirt master + my own patches,
> > a disk image from [1] and the bbl from [2], I was able to run a pure
> > PCI RISC-V guest, including connecting to it through ssh and
> > performing a system update using dnf; based on these results, the
> > series gets a big old
> >
> >   Tested-by: Andrea Bolognani <abologna@redhat.com>
> >
> >
> > [1] https://fedora-riscv.tranquillity.se/koji/
> >     Unfortunately the site is broken at the moment :(
> 
> FWIW, I get my images from here
> 
>     https://fedorapeople.org/groups/risc-v/disk-images/
> 
> which is linked to from the Fedora wiki
> 
>     https://fedoraproject.org/wiki/Architectures/RISC-V/Disk_images
> 
> the stage4 there is quite old (April, 2018), is yours newer?  I'm having some 
> problems updating my disk image and since I'm not a Fedora user I have no idea 
> what's going on.
> 
> > [2] https://fedorapeople.org/groups/risc-v/disk-images/
> >     PCI support is included in the bbl now! \o/
> 
> Great!  I've yet to figure out how to get all the PCI stuff working, but I was 
> trying to go with a virgl-based GPU which I suspect is broken for other 
> reasons.  What sort of devices did you attach?

FWIW, here is my list of tests.

Building riscv:virt:defconfig:initrd ... running ....... passed
Building riscv:virt:defconfig:virtio-blk:rootfs ... running ........ passed
Building riscv:virt:defconfig:virtio:rootfs ... running ........ passed
Building riscv:virt:defconfig:virtio-pci:rootfs ... running ........ passed
Building riscv:virt:defconfig:mmc:rootfs ... running ........ passed
Building riscv:virt:defconfig:nvme:rootfs ... running ........ passed
Building riscv:virt:defconfig:usb-ohci:rootfs ... running ........ passed
Building riscv:virt:defconfig:usb-ehci:rootfs ... running ........ passed
Building riscv:virt:defconfig:usb-xhci:rootfs ... running ......... passed
Building riscv:virt:defconfig:usb-uas-ehci:rootfs ... running ......... passed
Building riscv:virt:defconfig:usb-uas-xhci:rootfs ... running ......... passed
Building riscv:virt:defconfig:scsi[53C810]:rootfs ... running ........... passed
Building riscv:virt:defconfig:scsi[53C895A]:rootfs ... running ......... passed
Building riscv:virt:defconfig:scsi[AM53C974]:rootfs ... skipped
Building riscv:virt:defconfig:scsi[DC395]:rootfs ... skipped
Building riscv:virt:defconfig:scsi[MEGASAS]:rootfs ... running ......... passed
Building riscv:virt:defconfig:scsi[MEGASAS2]:rootfs ... running ........ passed
Building riscv:virt:defconfig:scsi[FUSION]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[virtio]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[virtio-pci]:rootfs ... running ........ passed

The skipped tests work as well, but the emulation is flaky and fails once
in a while. This is obviously with usb enabled.

Guenter

