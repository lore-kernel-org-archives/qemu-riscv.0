Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXoB-00068d-Pe
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:05:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXo8-00066b-A1
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:05:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXo5-0003W9-TQ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:05:03 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPXo3-0003Rg-V6; Wed, 21 Nov 2018 14:05:00 -0500
Received: by mail-pl1-x644.google.com with SMTP id t13so6772354ply.13;
	Wed, 21 Nov 2018 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hP8BqlJKKZMhVtqT6A2Zx3ATRq/eeQf2/3EY80dajfU=;
	b=RF+qbM0XFwR19qYQKYioXJ3Zecj2ed08oe0vME5v+x9/8ywnXhgwcIiUsImnQTuEcr
	7paIcXzSkBhLcCZCAol5Op6usGni6KY4o75GgEslujHwHEXAyK0N4wr6JxeJtsYMqzeM
	RdIepqNrY2bGuZ30jl1jBiMELcmrwTRMJp/vD783e+lbnlXRCkReuyC6bnDhoPIG9Rq7
	yTkDGVEDKLxpqFANL5ifuoF023O9wZM6GJTBqLls83Jsk0upSOUYndJNazFE7rtxcrKA
	VkfnjpvheQxzip8MLiF6NLSuJOofK/WkkDN2l0G0ARbCpq5Xk/3XpPlq1/D+XwCqM8G8
	zsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hP8BqlJKKZMhVtqT6A2Zx3ATRq/eeQf2/3EY80dajfU=;
	b=CbzZjFVRo5zusFLlMauaGVQ87+n2tmhlqUo+a8n8AZaIezupAfvbZSUbWmFV+M9wZv
	J57WnAtjs44kBNgfQuJaULZHKSDomT2fsvWvbRqZyvNbVuK6zUpD36MR2q6gJQ/HE0mj
	AjhZDVgbJgsHB/GDBu+Yq2tkmh566LPq3fE2miG23lDMUXzLvteVoWEmDBhxIHgLz0pm
	UtIRMLwU3THlZvwrad/d4lozefEZYaBPNJ9bn6mAnIJfWMuBTWVxN1JhzIvbTdLrayFp
	yg6FZYePOuQHBhUAy6d2PmpiA5hEx9goSfZnVeb6rFXu0xtR8yi01d5gn7Fs0qGMv6DO
	G1RA==
X-Gm-Message-State: AGRZ1gJKppPzIUXXWg0Fge5Cxj578eueWOF7gVlnM4XteC8Hfu2XHpEp
	tkQ0nS8OSB4fEzuvvBWoqF0=
X-Google-Smtp-Source: AJdET5evVY+NZsK+F+bTUDPz0nGJl/F4ImQdik6mFBvf45cz859Znp++yhXGzm/T9wooTYadFip5kA==
X-Received: by 2002:a62:6204:: with SMTP id w4mr8157672pfb.5.1542827096992;
	Wed, 21 Nov 2018 11:04:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	d68-v6sm53902024pfa.80.2018.11.21.11.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 11:04:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Nov 2018 11:04:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
Message-ID: <20181121190455.GA9571@roeck-us.net>
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
	<d793d87c-3825-9a72-971d-856291286d57@roeck-us.net>
	<CAKmqyKNEE-9kA+yhcbs5cbGhD_Miza=hvXSrJ5F+V6fkYR0yfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNEE-9kA+yhcbs5cbGhD_Miza=hvXSrJ5F+V6fkYR0yfQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/2] riscv: virt: Fix pcie
 memory ranges
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
X-List-Received-Date: Wed, 21 Nov 2018 19:05:06 -0000

On Wed, Nov 21, 2018 at 08:00:45AM -0800, Alistair Francis wrote:
> On Tue, Nov 20, 2018 at 8:08 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Hi Alistair,
> >
> > On 11/20/18 4:43 PM, Alistair Francis wrote:
> > > On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
> > >>    VIRT_PCIE_MMIO_HIGH (64 bit)
> > >> - VIRT_PCIE_PIO is for IO ports, not for the physical address
> > >> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
> > >> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
> > >>    to calculate the bus number range
> > >> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
> > >> - Fix parameters for gpex_pcie_init()
> > >>    (ECAM and MMIO addresses were swapped)
> > >>
> > >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > >
> > > Hey Gunter,
> > >
> > > Thanks for the patch! This was causing me all kinds of headaches.
> > > Unfortunately I had managed to figure out the memory addresses thanks
> > > to Bin Meng's help.
> > >
> > > You can see the new tree here:
> > > https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next
> > >
> >
> > Looks good. With your patch series applied on top of v3.1-rc2 and usb.mak
> > added to the build:
> >
> > Building riscv:virt:defconfig:initrd ... running ....... passed
> > Building riscv:virt:defconfig:virtio-blk:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:virtio:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:virtio-pci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:mmc:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:nvme:rootfs ... running ................... passed
> > Building riscv:virt:defconfig:usb-ohci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:usb-ehci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:usb-xhci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:usb-uas-ehci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:usb-uas-xhci:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:scsi[53C810]:rootfs ... running ........ passed
> > Building riscv:virt:defconfig:scsi[53C895A]:rootfs ... running ........ passed
> > Building riscv:virt:defconfig:scsi[MEGASAS]:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:scsi[MEGASAS2]:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:scsi[FUSION]:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:scsi[virtio]:rootfs ... running ....... passed
> > Building riscv:virt:defconfig:scsi[virtio-pci]:rootfs ... running ....... passed
> 
> Awesome! Can I add your tested by tag?
> 
Sure, go ahead.

Guenter

> Alistair
> 
> >
> > Guenter

