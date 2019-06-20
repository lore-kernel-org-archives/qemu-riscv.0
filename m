Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdsFy-0001vl-KC
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jun 2019 04:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57563)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <abologna@redhat.com>) id 1hdsFu-0001oZ-Pd
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 04:17:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1hdsFG-0002DI-UQ
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 04:16:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1hdsFF-00025y-ER; Thu, 20 Jun 2019 04:16:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD1D6307D935;
 Thu, 20 Jun 2019 08:16:19 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8393E60FAB;
 Thu, 20 Jun 2019 08:16:16 +0000 (UTC)
Message-ID: <11f4e4ff6037427f52824ba586f8a330c12d8dfd.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt
 <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Date: Thu, 20 Jun 2019 10:16:14 +0200
In-Reply-To: <CAKmqyKMmm-38DijX_wL=pAbvxzLQ+KSOtd1xg_GrT4Az70GKsw@mail.gmail.com>
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
 <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
 <CAEUhbmUwAVLXY9SSoryWBDeNL8gUfBCE+xweSSmuE9KwzWeX=w@mail.gmail.com>
 <CAKmqyKMmm-38DijX_wL=pAbvxzLQ+KSOtd1xg_GrT4Az70GKsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 08:16:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 0/5] RISC-V: Add firmware
 loading support and default
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
X-List-Received-Date: Thu, 20 Jun 2019 08:17:16 -0000

On Wed, 2019-06-19 at 11:23 -0700, Alistair Francis wrote:
> On Wed, Jun 19, 2019 at 7:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > On Wed, Jun 19, 2019 at 10:30 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > On Wed, Jun 19, 2019 at 7:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
> > > > >  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
> > > > 
> > > > Since we are considering adding "bios" images, I prefer to add the
> > > > pure binary images instead of ELF images here.
> > > 
> > > I didn't think about that. Can we just boot them in QEMU like we do
> > > with the ELFs?
> > 
> > Yes, use load_image_targphys() instead of load_elf().
> 
> Ah, that is obvious. I'll update it to use the bin files then.

I'm unclear on the advantages of using one format over the other,
but one question comes to mind: once this is in, we will probably
want to have OpenSBI packaged separately in distributions, the same
way it already happens for SeaBIOS, SLOF and edk2-based firmwares.

Will using either of the formats prevent that from happening?

-- 
Andrea Bolognani / Red Hat / Virtualization


