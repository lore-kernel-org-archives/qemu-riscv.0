Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6wkd-0007Gf-Sc
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 08:24:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h6wkZ-0006fI-GL
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 08:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1h6wWG-0001sj-2p
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 08:10:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1h6wRB-0005Qt-4a; Thu, 21 Mar 2019 08:04:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4D773082B1F;
	Thu, 21 Mar 2019 11:56:40 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4331160857;
	Thu, 21 Mar 2019 11:56:39 +0000 (UTC)
Message-ID: <bf5af2218f0b0e7deefd088ab8319851bed3c87c.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Palmer Dabbelt <palmer@sifive.com>, pbonzini@redhat.com
Cc: qemu-riscv@nongnu.org, David Abdurachmanov
	<david.abdurachmanov@gmail.com>, rjones@redhat.com, qemu-devel@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Date: Thu, 21 Mar 2019 12:56:37 +0100
In-Reply-To: <mhng-7fbbd7d2-fbc9-4c3a-8c1c-4e66c25d54dd@palmer-si-x1c4>
References: <mhng-7fbbd7d2-fbc9-4c3a-8c1c-4e66c25d54dd@palmer-si-x1c4>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 21 Mar 2019 11:56:41 +0000 (UTC)
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
X-List-Received-Date: Thu, 21 Mar 2019 12:24:48 -0000

On Mon, 2019-03-18 at 02:31 -0700, Palmer Dabbelt wrote:
> On Mon, 18 Mar 2019 01:39:46 PDT (-0700), pbonzini@redhat.com wrote:
> > On 15/03/19 21:05, Alistair Francis wrote:
> > > Set msi_nonbroken as true for the PLIC.
> > > 
> > > According to the comment located here:
> > > https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
> > > the msi_nonbroken variable should be set to true even if they don't
> > > support MSI. In this case that is what we are doing as we don't support
> > > MSI.
> > 
> > I can queue this patch, and add the "select MSI" to CONFIG_SIFIVE.
> 
> Works for me.  Thanks!

Just so we're on the same page, are you targeting this at 4.0.0?
If it gets merged in the next few days I can probably get the
corresponding libvirt patches in before our own freeze starts.

It would be great if we could make it so guests created with
QEMU 4.0.0 + libvirt 5.2.0 get PCI by default :)

-- 
Andrea Bolognani / Red Hat / Virtualization


