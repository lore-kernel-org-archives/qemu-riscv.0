Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDqdo-0004io-Gy
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 09:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rjones@redhat.com>) id 1iDpxX-00077b-TV
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 09:06:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rjones@redhat.com>) id 1iDpxV-00059V-SD
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 09:06:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rjones@redhat.com>)
 id 1iDpxP-00057Z-UT; Fri, 27 Sep 2019 09:06:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4B2523083394;
 Fri, 27 Sep 2019 12:30:48 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDAC2600C6;
 Fri, 27 Sep 2019 12:30:47 +0000 (UTC)
Date: Fri, 27 Sep 2019 13:30:47 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 0/2] RTC support for QEMU RISC-V virt machine
Message-ID: <20190927123047.GO3888@redhat.com>
References: <20190924084201.107958-1-anup.patel@wdc.com>
 <20190927115047.GA6575@redhat.com>
 <MN2PR04MB6061BA18651453F590A1CE738D810@MN2PR04MB6061.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR04MB6061BA18651453F590A1CE738D810@MN2PR04MB6061.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 27 Sep 2019 12:30:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Fri, 27 Sep 2019 09:50:34 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 13:06:58 -0000

On Fri, Sep 27, 2019 at 12:05:43PM +0000, Anup Patel wrote:
> 
> 
> > -----Original Message-----
> > From: Richard W.M. Jones <rjones@redhat.com>
> > Sent: Friday, September 27, 2019 5:21 PM
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>; Sagar Karandikar <sagark@eecs.berkeley.edu>;
> > Bastian Koppelmann <kbastian@mail.uni-paderborn.de>; Atish Patra
> > <Atish.Patra@wdc.com>; qemu-riscv@nongnu.org; qemu-
> > devel@nongnu.org; Anup Patel <anup@brainfault.org>
> > Subject: Re: [PATCH 0/2] RTC support for QEMU RISC-V virt machine
> > 
> > 
> > On Tue, Sep 24, 2019 at 08:42:36AM +0000, Anup Patel wrote:
> > > This series adds RTC device to QEMU RISC-V virt machine. We have
> > > selected Goldfish RTC device model for this. It's a pretty simple
> > > synthetic device with few MMIO registers and no dependency external
> > > clock. The driver for Goldfish RTC is already available in Linux so we
> > > just need to enable it in Kconfig for RISCV and also update Linux
> > > defconfigs.
> > >
> > > We have tested this series with Linux-5.3 plus defconfig changes
> > > available in 'goldfish_rtc_v1' branch of:
> > > https://github.com/avpatel/linux.git
> > 
> > Why was this device chosen instead of kvm-clock?
> 
> We need a RTC device which worked fine in TCG mode (even without
> KVM). The KVMCLOCK is PTP clock which depends on KVM hypercalls.
> 
> On ARM virt machine, we have PL031 so instead of that we have
> Goldfish RTC on RISC-V virt machine.

Could we not make kvm-clock work on TCG (I wasn't aware that it needed
actual KVM - I wonder how timekeeping works on TCG?)

Alternately why not use PL031 here?

The reason I'm asking this is because adding a new virtual device
means we have to change this all the way up the stack (libvirt,
virt-*) _and_ have special cases everywhere just for RISC-V.  That's a
load of extra work for everyone.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

