Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDqdo-0004j2-R9
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 09:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rjones@redhat.com>) id 1iDpyo-00088s-4l
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 09:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rjones@redhat.com>) id 1iDpym-0005PZ-KW
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 09:08:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49932)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rjones@redhat.com>)
 id 1iDpyg-0005O9-6d; Fri, 27 Sep 2019 09:08:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C0D210C0954;
 Fri, 27 Sep 2019 11:50:49 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91EC71001281;
 Fri, 27 Sep 2019 11:50:48 +0000 (UTC)
Date: Fri, 27 Sep 2019 12:50:47 +0100
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
Message-ID: <20190927115047.GA6575@redhat.com>
References: <20190924084201.107958-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924084201.107958-1-anup.patel@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 27 Sep 2019 11:50:49 +0000 (UTC)
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
X-List-Received-Date: Fri, 27 Sep 2019 13:08:17 -0000


On Tue, Sep 24, 2019 at 08:42:36AM +0000, Anup Patel wrote:
> This series adds RTC device to QEMU RISC-V virt machine. We have
> selected Goldfish RTC device model for this. It's a pretty simple
> synthetic device with few MMIO registers and no dependency external
> clock. The driver for Goldfish RTC is already available in Linux so
> we just need to enable it in Kconfig for RISCV and also update Linux
> defconfigs.
> 
> We have tested this series with Linux-5.3 plus defconfig changes
> available in 'goldfish_rtc_v1' branch of:
> https://github.com/avpatel/linux.git

Why was this device chosen instead of kvm-clock?

Rich.

> Anup Patel (2):
>   hw: timer: Add Goldfish RTC device
>   riscv: virt: Use Goldfish RTC device
> 
>  hw/riscv/Kconfig                |   1 +
>  hw/riscv/virt.c                 |  15 +++
>  hw/timer/Kconfig                |   3 +
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/goldfish_rtc.c         | 221 ++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h         |   2 +
>  include/hw/timer/goldfish_rtc.h |  45 +++++++
>  7 files changed, 288 insertions(+)
>  create mode 100644 hw/timer/goldfish_rtc.c
>  create mode 100644 include/hw/timer/goldfish_rtc.h
> 
> --
> 2.17.1

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

