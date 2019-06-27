Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgUmh-00067B-7B
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 09:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <abologna@redhat.com>) id 1hgUme-000623-DL
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 09:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1hgUmd-0003Om-At
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 09:49:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1hgUmW-00032s-PK; Thu, 27 Jun 2019 09:49:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 65FC54DB10;
 Thu, 27 Jun 2019 13:49:11 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8775D71D;
 Thu, 27 Jun 2019 13:49:05 +0000 (UTC)
Message-ID: <7e2155a516d7c6eb432cd0aec12adc95a2cda1f4.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, Alistair Francis
 <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bmeng.cn@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Palmer Dabbelt
 <palmer@sifive.com>
Date: Thu, 27 Jun 2019 15:49:04 +0200
In-Reply-To: <4f52c3fff226a31963a5be52ddf0049475b6036c.camel@redhat.com>
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
 <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
 <CAEUhbmUwAVLXY9SSoryWBDeNL8gUfBCE+xweSSmuE9KwzWeX=w@mail.gmail.com>
 <CAKmqyKMmm-38DijX_wL=pAbvxzLQ+KSOtd1xg_GrT4Az70GKsw@mail.gmail.com>
 <11f4e4ff6037427f52824ba586f8a330c12d8dfd.camel@redhat.com>
 <CAKmqyKOh3J07yg3dbaNcOaSzfbDZJJ-kjN3pBh+KqAKq05hzTA@mail.gmail.com>
 <CAEn-LTo_e-Owk3hKGGsfSDkWLVEK2reO3ZU=y_hNDOtYVKgusw@mail.gmail.com>
 <4f52c3fff226a31963a5be52ddf0049475b6036c.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 13:49:16 +0000 (UTC)
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
X-List-Received-Date: Thu, 27 Jun 2019 13:49:53 -0000

On Fri, 2019-06-21 at 14:35 +0200, Andrea Bolognani wrote:
> On Thu, 2019-06-20 at 21:43 +0300, David Abdurachmanov wrote:
> > On Thu, Jun 20, 2019 at 9:18 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > OE-Core already packages OpenSBI by default, Fedora and Debian are
> > > moving to OpenSBI for RISC-V targets as well.
> > > 
> > > Any distro that supports the RISC-V toolchain (which is all
> > > upstreamed) can build OpenSBI.
> > 
> > Fedora uses OpenSBI for the last 2 or 3 months now. I don't plan to update
> > BBL builds. OpenSBI packages in Fedora/RISCV isn't finalized, but it does
> > ship *.elf and *.bin files.
> 
> Sounds good to me, thanks for confirming!

From further off-list discussion with David, I have learned that
recent Fedora images include an OpenSBI build with embedded U-Boot
payload, such that you only need to have that single file on the host
and pass it to QEMU via -kernel[1] for RISC-V guest boot to work. I
played with it over the past few days, and it works very nicely.

I think this is the result that we want to ultimately reach: a single
RISC-V "firmware" binary installed on the host through an appropriate
distro package, shared among guests, with everything else that is
guest-specific being contained in the corresponding disk image.

This is what other architectures are already doing, with SeaBIOS and
OVMF on x86_64, AAVMF on aarch64 and SLOF on ppc64 all being handled
this way: RISC-V should, where it makes sense, follow suit.

QEMU also recently introduced a JSON-based specification that can be
used to advertise guest firmwares and libvirt already supports it,
which makes firmware configuration either extremely convenient or
entirely automatic for the user: the OpenSBI support should also be
advertised this way.


[1] I guess that'd be -bios after these patches?
-- 
Andrea Bolognani / Red Hat / Virtualization


