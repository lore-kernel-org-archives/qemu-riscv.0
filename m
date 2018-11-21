Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVA4-0008LN-El
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 11:15:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPV9z-00084C-Qz
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 11:15:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPUwK-0000WM-Cy
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 11:01:22 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPUwK-0000Uu-4s; Wed, 21 Nov 2018 11:01:20 -0500
Received: by mail-lj1-x241.google.com with SMTP id u6-v6so5304559ljd.1;
	Wed, 21 Nov 2018 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ofOGrnWeeAMkihNcjixbAnhMlD2fTzld37o49leamgA=;
	b=n/litsXnw2fA2pjbVdMGfA4Xj854qX3ZXj7dCzVi1/hLNC0hSGc4Gk5bIp2pMdxG0Z
	6iCZHgMQ/CBx8PXxUohEIy1nv1OD0Ny7+JX5kEgANQ6laxb0pBvSlARqNLAcmSDgmMlj
	xmVP6PO5YMj33VDqpbNJCtm7vfOn/6WTGea4BkY/6zfgHL/rnt1EOMnUlGAoesNVUTqY
	6FJbgZITT8fcskcBkmUkRYrXxiVgRVGTwSHE5YMJqIQiKnTd0DpwBmzh+If7JBusR+e0
	ufR+Q5MvznCvW6eSyHmaNmfbsHndlD3DwNbvuohWEhFiv12E4A3YnepriLT+A22pxePQ
	3Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ofOGrnWeeAMkihNcjixbAnhMlD2fTzld37o49leamgA=;
	b=rXPSonqFfBNymd7EKugjHxZv4H83Kak1BXY8gJZ7Xxe2XOf75vDRM2QjYRgz3d1wSD
	hgOa77NJ4XsG/c71W9ZgFEkYV9MQzqjUv6/UKOtDd+SY0pgUquOn3PQKDXLLF8x6LSZP
	eHhUo5YgS9Xy68mbIjh0RhAd7B2Jj9qkE0MmV65+yxDKcHqHgHlL8ruJoKONFZm1+yE3
	MQnH0jx8QScI8F0X3+NtR5xSYgYTy5Wl9CLLf2xIM3NGVX6xYM6hqmyWkHx+y1Dtm42W
	HNXgvKiYoSD8jjXILxKKFyQ9ZSwWQfUU96fcf3wWqu4A2zk/wXwVXCo7mIYE1iZx6NlW
	d7tA==
X-Gm-Message-State: AA+aEWZT/xrceX0MGM8U8MKwAbxC2GPGo7zWr3a/p07dFQiXsTq6nPf2
	H08+oUMVUFSa/EEBgxkJ46u86zqLvLdXSX4aFG0=
X-Google-Smtp-Source: AFSGD/VhDrv8r6LqQTzWu0Vq1ASIajoV9Zr/0LUCNcHo+HY7IANtXtWtIeKr8FIHf49swGaWKF2V16qwDPLhnMnD7Fc=
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr4278133ljf.47.1542816078313; 
	Wed, 21 Nov 2018 08:01:18 -0800 (PST)
MIME-Version: 1.0
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
	<d793d87c-3825-9a72-971d-856291286d57@roeck-us.net>
In-Reply-To: <d793d87c-3825-9a72-971d-856291286d57@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 08:00:45 -0800
Message-ID: <CAKmqyKNEE-9kA+yhcbs5cbGhD_Miza=hvXSrJ5F+V6fkYR0yfQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Wed, 21 Nov 2018 16:15:29 -0000

On Tue, Nov 20, 2018 at 8:08 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Alistair,
>
> On 11/20/18 4:43 PM, Alistair Francis wrote:
> > On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
> >>    VIRT_PCIE_MMIO_HIGH (64 bit)
> >> - VIRT_PCIE_PIO is for IO ports, not for the physical address
> >> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
> >> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
> >>    to calculate the bus number range
> >> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
> >> - Fix parameters for gpex_pcie_init()
> >>    (ECAM and MMIO addresses were swapped)
> >>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Hey Gunter,
> >
> > Thanks for the patch! This was causing me all kinds of headaches.
> > Unfortunately I had managed to figure out the memory addresses thanks
> > to Bin Meng's help.
> >
> > You can see the new tree here:
> > https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next
> >
>
> Looks good. With your patch series applied on top of v3.1-rc2 and usb.mak
> added to the build:
>
> Building riscv:virt:defconfig:initrd ... running ....... passed
> Building riscv:virt:defconfig:virtio-blk:rootfs ... running ....... passed
> Building riscv:virt:defconfig:virtio:rootfs ... running ....... passed
> Building riscv:virt:defconfig:virtio-pci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:mmc:rootfs ... running ....... passed
> Building riscv:virt:defconfig:nvme:rootfs ... running ................... passed
> Building riscv:virt:defconfig:usb-ohci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:usb-ehci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:usb-xhci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:usb-uas-ehci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:usb-uas-xhci:rootfs ... running ....... passed
> Building riscv:virt:defconfig:scsi[53C810]:rootfs ... running ........ passed
> Building riscv:virt:defconfig:scsi[53C895A]:rootfs ... running ........ passed
> Building riscv:virt:defconfig:scsi[MEGASAS]:rootfs ... running ....... passed
> Building riscv:virt:defconfig:scsi[MEGASAS2]:rootfs ... running ....... passed
> Building riscv:virt:defconfig:scsi[FUSION]:rootfs ... running ....... passed
> Building riscv:virt:defconfig:scsi[virtio]:rootfs ... running ....... passed
> Building riscv:virt:defconfig:scsi[virtio-pci]:rootfs ... running ....... passed

Awesome! Can I add your tested by tag?

Alistair

>
> Guenter

