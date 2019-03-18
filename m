Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5ock-0003d0-6R
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 05:32:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h5och-0003aM-6j
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h5oce-0000xK-Cz
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:31:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1h5ocX-0000tE-Gj; Mon, 18 Mar 2019 05:31:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30B4A307D848;
	Mon, 18 Mar 2019 09:31:48 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BAF65D70E;
	Mon, 18 Mar 2019 09:31:46 +0000 (UTC)
Message-ID: <6476b826e47844af3ca6f10650b434d5731d80a5.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "palmer@sifive.com" <palmer@sifive.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "david.abdurachmanov@gmail.com"
	<david.abdurachmanov@gmail.com>, "rjones@redhat.com" <rjones@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Date: Mon, 18 Mar 2019 10:31:44 +0100
In-Reply-To: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
References: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 18 Mar 2019 09:31:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] riscv: plic: Set msi_nonbroken as
 true
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
X-List-Received-Date: Mon, 18 Mar 2019 09:32:00 -0000

On Fri, 2019-03-15 at 20:05 +0000, Alistair Francis wrote:
> Set msi_nonbroken as true for the PLIC.
> 
> According to the comment located here:
> https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
> the msi_nonbroken variable should be set to true even if they don't
> support MSI. In this case that is what we are doing as we don't support
> MSI.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
> This should allow working pcie-root-ports in QEMU and allow libvirt
> to start using PCIe by default for RISC-V guests.
> 
> hw/riscv/sifive_plic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index d12ec3fc9a..4b0537c912 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -22,6 +22,7 @@
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "hw/sysbus.h"
> +#include "hw/pci/msi.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/riscv/sifive_plic.h"
>  
> @@ -443,6 +444,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>      plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
>      qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
> +
> +    msi_nonbroken = true;
>  }
>  
>  static void sifive_plic_class_init(ObjectClass *klass, void *data)

With this patch applied, I was able to bring up a riscv64/virt guest
with graphics, using PCIe devices only:

  https://imgur.com/a/taN06hE

Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization


