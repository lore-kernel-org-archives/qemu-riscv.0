Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4QHk-00055L-R3
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 09:20:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h4QHh-00047R-Vz
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h4Q1o-00009j-Ie
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 09:04:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1h4Q1T-0008Ta-If; Thu, 14 Mar 2019 09:03:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACC7330992D7;
	Thu, 14 Mar 2019 12:53:54 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F4B5C231;
	Thu, 14 Mar 2019 12:53:49 +0000 (UTC)
Message-ID: <100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
	qemu-riscv@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>, thuth@redhat.com, "Michael S.
	Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Alistair
	Francis <Alistair.Francis@wdc.com>, "Richard W.M. Jones"
	<rjones@redhat.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 14 Mar 2019 13:53:48 +0100
In-Reply-To: <1551723614-1823-16-git-send-email-pbonzini@redhat.com>
References: <1551723614-1823-1-git-send-email-pbonzini@redhat.com>
	<1551723614-1823-16-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 14 Mar 2019 12:53:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 15/54] build: convert pci.mak
 to Kconfig
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
X-List-Received-Date: Thu, 14 Mar 2019 13:20:35 -0000

On Mon, 2019-03-04 at 19:19 +0100, Paolo Bonzini wrote:
> Instead of including the same list of devices for each target,
> set CONFIG_PCI to true, and make the devices default to present
> whenever PCI is available.  However, s390x does not want all the
> PCI devices, so there is a separate symbol to enable them.
[...]
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -1,8 +1,8 @@
>  # Default configuration for riscv-softmmu
>  
> -include pci.mak
>  include usb.mak
> -
> +CONFIG_PCI=y
> +CONFIG_PCI_DEVICES=y
>  CONFIG_SERIAL=y
>  CONFIG_VIRTIO_MMIO=y

I *think* this might have caused some unwanted changes for RISC-V.

pcie-root-port is built into qemu-system-riscv64 by default as of
dbbc277510aa (along with ioh3420!), but if you actually try to use it
you'll get:

  $ ./riscv64-softmmu/qemu-system-riscv64 \
    -M virt \
    -device pcie-root-port
  qemu-system-riscv64: -device pcie-root-port: MSI-X is not
                       supported by interrupt controller

This is a limitation we have been aware of, and the plan was to
enable the device in QEMU once it had been addressed: from the
libvirt side, the availability of the device would have meant that it
was safe to use it, but if the device is enabled in QEMU before it
can actually be used, then that makes detection on the libvirt side
problematic.

I haven't spent time digging further - and I'm not familiar enough
with the QEMU build system anyway O:-) - but I wouldn't be surprised
if the same happened for other architectures, too.

-- 
Andrea Bolognani / Red Hat / Virtualization


