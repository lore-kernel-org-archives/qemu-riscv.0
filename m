Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPJyl-0007AW-50
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 23:19:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPJyi-0007AB-TP
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 23:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPJo4-0004Ts-1C
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 23:08:05 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPJo2-0004QM-Kr; Tue, 20 Nov 2018 23:08:02 -0500
Received: by mail-pl1-x644.google.com with SMTP id u6so3475092plm.8;
	Tue, 20 Nov 2018 20:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FdzDsuccgGTtVsGYG0rqmsfat6vsgrj3fNBQAPOuK4Q=;
	b=PGR1740kGYV7O2f/aM0Hwu5gpTs7uJ773dJAbwO+hOyZ5SMwRkMHUEYiMI29wGspXq
	n8QEvpp/6mOmgJPNna+o6lon85iCB1Yic8r+VjWdgkdYtpdLvpwHhj4zxOPoaafpp+oe
	q4p/G9JPiYDca9So40Bz5JDjOqn3if7/GUZS5xJmFUurv4QEmNm0iXhFaz+UhUDFX2ob
	9sYbJYAJtLNYyDi0kSODACEKd7zTEQ/jKALiE3m2mEl6RQA0Pv8ReywUhbbe6+wt4v1E
	zHPawTUk+1goKPmmYN0bflkYn3ki0MsjDLDczORa9yjcwKZPkJHUxvaQzvv3JMINJGrP
	23Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FdzDsuccgGTtVsGYG0rqmsfat6vsgrj3fNBQAPOuK4Q=;
	b=dHsOCngS3F69i97ZtL9AB2G7paj5pS7C/1qwT3pqacKvjGTAZKkxLbUROVJMwddTyx
	BE3pGf5Lp2/7b9JdaZWPjQTwyEbNpGy1SHD8vvzcq7aqUBj0hu+nNT+92nXjH0d1Lhsw
	+RNL945fSnNXNRKrRJr40TJK9UN8V09k+D4KcdW6iNPIXGxpxVZodFOr5sHVN1e3qLBa
	YAegOMjUCdp4wrwQJrkyd69oa6diPVkMNsuIVH2zUOz+kjLyE/amEi8peN4vdRT6iOPZ
	uyc262doAxQ7VIh6Do72OnajUYcQXy/k8Ts7TNvpeP2XVJuaazosJUv9y/P9cXCBFcAd
	B9hw==
X-Gm-Message-State: AA+aEWYoqv00HDbCfOZqS+40I0PezgO7cmhamZE0So8qp7Lvjf8C9VTB
	umbe+SwcGiXzn99n9K8BbJw=
X-Google-Smtp-Source: AFSGD/X73tORC09Zir/xsj9fUOSRBCmzSYCbdtGJVB7N9SVzmQwdBiVBXiZJgNVtkazB7/lAlJjivg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr4514755pgb.76.1542773281467; 
	Tue, 20 Nov 2018 20:08:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	s184sm50264460pgc.38.2018.11.20.20.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 20:08:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d793d87c-3825-9a72-971d-856291286d57@roeck-us.net>
Date: Tue, 20 Nov 2018 20:07:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 21 Nov 2018 04:19:05 -0000

Hi Alistair,

On 11/20/18 4:43 PM, Alistair Francis wrote:
> On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
>>    VIRT_PCIE_MMIO_HIGH (64 bit)
>> - VIRT_PCIE_PIO is for IO ports, not for the physical address
>> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
>> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
>>    to calculate the bus number range
>> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
>> - Fix parameters for gpex_pcie_init()
>>    (ECAM and MMIO addresses were swapped)
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Hey Gunter,
> 
> Thanks for the patch! This was causing me all kinds of headaches.
> Unfortunately I had managed to figure out the memory addresses thanks
> to Bin Meng's help.
> 
> You can see the new tree here:
> https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next
> 

Looks good. With your patch series applied on top of v3.1-rc2 and usb.mak
added to the build:

Building riscv:virt:defconfig:initrd ... running ....... passed
Building riscv:virt:defconfig:virtio-blk:rootfs ... running ....... passed
Building riscv:virt:defconfig:virtio:rootfs ... running ....... passed
Building riscv:virt:defconfig:virtio-pci:rootfs ... running ....... passed
Building riscv:virt:defconfig:mmc:rootfs ... running ....... passed
Building riscv:virt:defconfig:nvme:rootfs ... running ................... passed
Building riscv:virt:defconfig:usb-ohci:rootfs ... running ....... passed
Building riscv:virt:defconfig:usb-ehci:rootfs ... running ....... passed
Building riscv:virt:defconfig:usb-xhci:rootfs ... running ....... passed
Building riscv:virt:defconfig:usb-uas-ehci:rootfs ... running ....... passed
Building riscv:virt:defconfig:usb-uas-xhci:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[53C810]:rootfs ... running ........ passed
Building riscv:virt:defconfig:scsi[53C895A]:rootfs ... running ........ passed
Building riscv:virt:defconfig:scsi[MEGASAS]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[MEGASAS2]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[FUSION]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[virtio]:rootfs ... running ....... passed
Building riscv:virt:defconfig:scsi[virtio-pci]:rootfs ... running ....... passed

Guenter

