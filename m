Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMb05-00079r-AU
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 10:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gMb02-00077R-FX
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 10:53:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gMb01-0007OM-J9
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 10:53:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59630)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1gMazw-0007Ji-03; Tue, 13 Nov 2018 10:53:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF9313154862;
	Tue, 13 Nov 2018 15:52:57 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C255D9D6;
	Tue, 13 Nov 2018 15:52:56 +0000 (UTC)
Message-ID: <d316de9ed544575a3c9f22882dd8befdf6e0309f.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org
	Developers" <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org
Date: Tue, 13 Nov 2018 16:52:55 +0100
In-Reply-To: <CAKmqyKMM=M-1G15k-0Rgo7+sp-jnq31z=GqcHaciXx5TuHNE2Q@mail.gmail.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
	<CAKmqyKNF+tQFf50BCj91_RypYeHbnoZLvpm8gH71iW1og9uWfA@mail.gmail.com>
	<f91286ff09066c577d359b1d185aca9fb7d21331.camel@redhat.com>
	<CAKmqyKMM=M-1G15k-0Rgo7+sp-jnq31z=GqcHaciXx5TuHNE2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 13 Nov 2018 15:52:58 +0000 (UTC)
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
X-List-Received-Date: Tue, 13 Nov 2018 15:53:11 -0000

On Wed, 2018-11-07 at 13:47 -0800, Alistair Francis wrote:
> I don't think there is even MSI support in the interrupt spec (I
> haven't looked at all though), yet alone in QEMU. Unfortunately it
> seems low down on the list of things we need to do so it will probably
> be awhile.

That's perfectly fine; just be aware of the fact that, until
pcie-root-port can be used successfully, libvirt users will still
get virtio-mmio by default for RISC-V guests and will have to jump
through significant hoops in order to use virtio-pci instead.

-- 
Andrea Bolognani / Red Hat / Virtualization


