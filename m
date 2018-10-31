Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHrqM-0000qq-Ql
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 10:51:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gHrqK-0000oi-Ls
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 10:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1gHrqJ-0006NA-T7
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 10:51:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1gHrqH-0006IY-A5; Wed, 31 Oct 2018 10:51:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E791281DFE;
	Wed, 31 Oct 2018 14:51:27 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF81E29AD3;
	Wed, 31 Oct 2018 14:51:26 +0000 (UTC)
Message-ID: <3f834825634e34ad107fe9e7af1b417cb47fc1f1.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
Date: Wed, 31 Oct 2018 15:51:25 +0100
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 31 Oct 2018 14:51:28 +0000 (UTC)
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
X-List-Received-Date: Wed, 31 Oct 2018 14:51:37 -0000

On Tue, 2018-10-30 at 22:17 +0000, Alistair Francis wrote:
> V6:
>  - Fix the interrupt issue for the GPEX device

I gave this a spin.

With the pcie.0 <- pcie-root-port <- virtio-net-pci setup I get

  qemu-system-riscv64: -device pcie-root-port,port=0x8,chassis=1,\
  id=pci.1,bus=pcie.0,multifunction=on,addr=0x1: MSI-X is not \
  supported by interrupt controller

just like last time, which as I mentioned is a problem for libvirt
because we follow the recommendations outlined in qemu/docs/pcie.txt
and never plug devices into pcie.0 directly.

Even after working around that issue by manually placing the device
at 0000:00:01.0, it still doesn't work: I see

  pci 0000:00:01.0: BAR 6: assigned [mem 0x00000000-0x0003ffff pref]
  pci 0000:00:01.0: BAR 4: assigned [mem 0x00040000-0x00043fff 64bit pref]
  pci 0000:00:01.0: BAR 0: no space for [io  size 0x0020]
  pci 0000:00:01.0: BAR 0: failed to assign [io  size 0x0020]
  ...
  virtio_net virtio3: virtio: device uses modern interface but does not have VIRTIO_F_VERSION_1
  virtio_net: probe of virtio3 failed with error -22

in dmesg and, while the device shows up in the output of lspci(8),
it's nowhere to be seen when running 'ip addr' and friends.

Let me know if you need me to try anything else :)

-- 
Andrea Bolognani / Red Hat / Virtualization


