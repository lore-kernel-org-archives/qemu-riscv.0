Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRMew-0005bj-4M
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 14:35:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMeu-0005bQ-2P
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:35:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMeq-000099-S9
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:35:04 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gRMeq-00008Y-LM
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:35:00 -0500
Received: by mail-pl1-x643.google.com with SMTP id u18so1782107plq.7
	for <qemu-riscv@nongnu.org>; Mon, 26 Nov 2018 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id;
	bh=XSaymw8ZHIDAxZCZ/rJmX3GByBJ+XvOFq6M0Y2O4a1I=;
	b=gALv40WLnoYw3mj/X19d/+RjDjfBXt8mGD4LU/ZGzhok6zyYlirpsU1lRDOtxBDYqj
	LhEP10Zw1zhocdDbx7IFshm7ZfMhRt9NpOQ6qpktezRAPC/RwwvnVPlX1GyFTT0IqtwV
	d07AcTemARALbY8QiInJthcybDJnzSfidUlLMcu+ebd6A4wVoMKetMwsDpBwUYVyqmni
	iZQBS9vKDgpiXtFssukg3e2KwbRp0Mxz2HGn1635AChDL8C0MJpH05ode4IBxc9MmFI2
	piVVxjYRbofwcduOXQ4pf+mdwHrgDoZ3z2DWIm90UUc4HZp5mX8/i/kHBlOjKCVK8vLG
	XMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
	bh=XSaymw8ZHIDAxZCZ/rJmX3GByBJ+XvOFq6M0Y2O4a1I=;
	b=IJnw+EoTud/A+YPx557m3jonq3IYPSx9FpvI7v/JXFWEIPJJfWwGZ0MET5bD+YL04p
	ECk7Li2XUyLsDWvl5UEibvPKGWKXw04oXcomukcARGvg4UcFZ9fWwtDva3cZZwA4HMfc
	cXB3+oiOB7E/ffBjZ30I0DMfEcFblzdB0qA09QQjaeFHtGwi+pzS+7bI057lP5SAJSYr
	QJCJjEg0rRyyqz6MHsGGhQZd9eudseE4a8WPUZ10Qh90mhWsswh3CyR7oYa9v9PsSdTA
	nwHWO3/jn+RtITNUoxvToR2n63GzQE4wqqUluS6lUeSytMD/qfMhpCjOtLzCzJZ2d4Q+
	HpGQ==
X-Gm-Message-State: AA+aEWZSBKvWkh9lGIU/L6dSpIT38iYjhlz4QNz9TlzBmVLfHxbfKgco
	Hij81Ms5hKtvotJEfe09t3G1Tw==
X-Google-Smtp-Source: AFSGD/XVOXlaluM4sxH/ip3BYF36/L21Vyuy9PAYY2wqfKpbzoE1za/uzYew7IMbslokNL9ExmKcNg==
X-Received: by 2002:a17:902:a983:: with SMTP id
	bh3-v6mr4892673plb.31.1543260899551; 
	Mon, 26 Nov 2018 11:34:59 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d65-v6sm1641620pfc.144.2018.11.26.11.34.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 11:34:58 -0800 (PST)
Date: Mon, 26 Nov 2018 11:34:58 -0800 (PST)
X-Google-Original-Date: Mon, 26 Nov 2018 11:28:16 PST (-0800)
In-Reply-To: <84778e31610b0b98aea9b2dec5570a02dbf52180.camel@redhat.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, alistair23@gmail.com, logang@deltatee.com,
	linux@roeck-us.net
From: Palmer Dabbelt <palmer@sifive.com>
To: abologna@redhat.com
Message-ID: <mhng-b12cc231-a10a-454f-a088-21932acd8edf@palmer-si-x1c4>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Mon, 26 Nov 2018 19:35:04 -0000

On Thu, 22 Nov 2018 02:59:18 PST (-0800), abologna@redhat.com wrote:
> On Wed, 2018-11-21 at 17:02 +0000, Alistair Francis wrote:
>> V7:
>>  - Fix the GPEX memory mapping thanks to Bin Meng
>>  - Fix the interrupt mapping thanks to Logan Gunthorpe
>>
> [...]
>>
>> Alistair Francis (6):
>>   hw/riscv/virt: Increase the number of interrupts
>>   hw/riscv/virt: Adjust memory layout spacing
>>   hw/riscv/virt: Connect the gpex PCIe
>>   riscv: Enable VGA and PCIE_VGA
>>   hw/riscv/sifive_u: Connect the Xilinx PCIe
>>   hw/riscv/virt: Connect a VirtIO net PCIe device
>
> Using QEMU master + these patches, libvirt master + my own patches,
> a disk image from [1] and the bbl from [2], I was able to run a pure
> PCI RISC-V guest, including connecting to it through ssh and
> performing a system update using dnf; based on these results, the
> series gets a big old
>
>   Tested-by: Andrea Bolognani <abologna@redhat.com>
>
>
> [1] https://fedora-riscv.tranquillity.se/koji/
>     Unfortunately the site is broken at the moment :(

FWIW, I get my images from here

    https://fedorapeople.org/groups/risc-v/disk-images/

which is linked to from the Fedora wiki

    https://fedoraproject.org/wiki/Architectures/RISC-V/Disk_images

the stage4 there is quite old (April, 2018), is yours newer?  I'm having some 
problems updating my disk image and since I'm not a Fedora user I have no idea 
what's going on.

> [2] https://fedorapeople.org/groups/risc-v/disk-images/
>     PCI support is included in the bbl now! \o/

Great!  I've yet to figure out how to get all the PCI stuff working, but I was 
trying to go with a virgl-based GPU which I suspect is broken for other 
reasons.  What sort of devices did you attach?

