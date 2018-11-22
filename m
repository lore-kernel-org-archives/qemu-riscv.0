Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPmhm-0004ly-9g
	for mharc-qemu-riscv@gnu.org; Thu, 22 Nov 2018 05:59:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gPmhk-0004kN-3N
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 05:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gPmhj-0007h0-4S
	for qemu-riscv@nongnu.org; Thu, 22 Nov 2018 05:59:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1gPmhe-0007V4-Is; Thu, 22 Nov 2018 05:59:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A16483167697;
	Thu, 22 Nov 2018 10:59:21 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC62608E7;
	Thu, 22 Nov 2018 10:59:19 +0000 (UTC)
Message-ID: <84778e31610b0b98aea9b2dec5570a02dbf52180.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "logang@deltatee.com" <logang@deltatee.com>
Date: Thu, 22 Nov 2018 11:59:18 +0100
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 22 Nov 2018 10:59:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 0/6] Connect a PCIe host and
 graphics support to RISC-V
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
X-List-Received-Date: Thu, 22 Nov 2018 10:59:29 -0000

On Wed, 2018-11-21 at 17:02 +0000, Alistair Francis wrote:
> V7:
>  - Fix the GPEX memory mapping thanks to Bin Meng
>  - Fix the interrupt mapping thanks to Logan Gunthorpe
> 
[...]
> 
> Alistair Francis (6):
>   hw/riscv/virt: Increase the number of interrupts
>   hw/riscv/virt: Adjust memory layout spacing
>   hw/riscv/virt: Connect the gpex PCIe
>   riscv: Enable VGA and PCIE_VGA
>   hw/riscv/sifive_u: Connect the Xilinx PCIe
>   hw/riscv/virt: Connect a VirtIO net PCIe device

Using QEMU master + these patches, libvirt master + my own patches,
a disk image from [1] and the bbl from [2], I was able to run a pure
PCI RISC-V guest, including connecting to it through ssh and
performing a system update using dnf; based on these results, the
series gets a big old

  Tested-by: Andrea Bolognani <abologna@redhat.com>


[1] https://fedora-riscv.tranquillity.se/koji/
    Unfortunately the site is broken at the moment :(
[2] https://fedorapeople.org/groups/risc-v/disk-images/
    PCI support is included in the bbl now! \o/
-- 
Andrea Bolognani / Red Hat / Virtualization


