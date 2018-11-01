Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gI8Df-0004P1-P9
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 04:20:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gI8Dd-0004O4-JZ
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 04:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gI8Dc-0003gq-QR
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 04:20:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1gI8DY-0003aA-SS; Thu, 01 Nov 2018 04:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66A8B3082DD4;
	Thu,  1 Nov 2018 08:20:36 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17B7B5C22B;
	Thu,  1 Nov 2018 08:20:34 +0000 (UTC)
Message-ID: <f91286ff09066c577d359b1d185aca9fb7d21331.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org
	Developers" <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org
Date: Thu, 01 Nov 2018 09:20:33 +0100
In-Reply-To: <CAKmqyKNF+tQFf50BCj91_RypYeHbnoZLvpm8gH71iW1og9uWfA@mail.gmail.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
	<CAKmqyKNF+tQFf50BCj91_RypYeHbnoZLvpm8gH71iW1og9uWfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 01 Nov 2018 08:20:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 0/5] Connect a PCIe host
 and graphics support to RISC-V
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
X-List-Received-Date: Thu, 01 Nov 2018 08:20:46 -0000

On Wed, 2018-10-31 at 13:10 -0700, Alistair Francis wrote:
> On Wed, Oct 31, 2018 at 7:51 AM Andrea Bolognani <abologna@redhat.com> wrote:
> > With the pcie.0 <- pcie-root-port <- virtio-net-pci setup I get
> > 
> >   qemu-system-riscv64: -device pcie-root-port,port=0x8,chassis=1,\
> >   id=pci.1,bus=pcie.0,multifunction=on,addr=0x1: MSI-X is not \
> >   supported by interrupt controller
> > 
> > just like last time, which as I mentioned is a problem for libvirt
> > because we follow the recommendations outlined in qemu/docs/pcie.txt
> > and never plug devices into pcie.0 directly.
> 
> At the moment we can't support MSI, the interrupt controller doesn't
> support MSI.

I see. Are there plans for that to change? Will we eventually need
something like Arm's 'gic-version' machine option to pick a more
featureful interrupt controller?

Either way, as it is we certainly can't flip the default to
virtio-pci at the libvirt level quite yet, so we'll have to stick
with virtio-mmio for a while longer... Not exactly the outcome I
was hoping for :(

> > Let me know if you need me to try anything else :)
> 
> Any ideas on how to debug the confusing memory mappings or
> non-existent interrupts would be helpful :)

Sorry, not really my area of expertise O:-)

-- 
Andrea Bolognani / Red Hat / Virtualization


