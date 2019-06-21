Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1heImE-0001qR-Rm
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jun 2019 08:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <abologna@redhat.com>) id 1heIm6-0001p1-5J
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2019 08:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1heIm0-0001qt-RE
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2019 08:36:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58640)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1heIlp-0001fi-AD; Fri, 21 Jun 2019 08:35:57 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E53D85541;
 Fri, 21 Jun 2019 12:35:55 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE61C1001B30;
 Fri, 21 Jun 2019 12:35:51 +0000 (UTC)
Message-ID: <4f52c3fff226a31963a5be52ddf0049475b6036c.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, Alistair Francis
 <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>,  "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Palmer Dabbelt
 <palmer@sifive.com>
Date: Fri, 21 Jun 2019 14:35:50 +0200
In-Reply-To: <CAEn-LTo_e-Owk3hKGGsfSDkWLVEK2reO3ZU=y_hNDOtYVKgusw@mail.gmail.com>
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
 <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
 <CAEUhbmUwAVLXY9SSoryWBDeNL8gUfBCE+xweSSmuE9KwzWeX=w@mail.gmail.com>
 <CAKmqyKMmm-38DijX_wL=pAbvxzLQ+KSOtd1xg_GrT4Az70GKsw@mail.gmail.com>
 <11f4e4ff6037427f52824ba586f8a330c12d8dfd.camel@redhat.com>
 <CAKmqyKOh3J07yg3dbaNcOaSzfbDZJJ-kjN3pBh+KqAKq05hzTA@mail.gmail.com>
 <CAEn-LTo_e-Owk3hKGGsfSDkWLVEK2reO3ZU=y_hNDOtYVKgusw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 21 Jun 2019 12:35:55 +0000 (UTC)
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
X-List-Received-Date: Fri, 21 Jun 2019 12:36:19 -0000

On Thu, 2019-06-20 at 21:43 +0300, David Abdurachmanov wrote:
> On Thu, Jun 20, 2019 at 9:18 PM Alistair Francis <alistair23@gmail.com> wrote:
> > On Thu, Jun 20, 2019 at 1:16 AM Andrea Bolognani <abologna@redhat.com> wrote:
> > > but one question comes to mind: once this is in, we will probably
> > > want to have OpenSBI packaged separately in distributions, the same
> > > way it already happens for SeaBIOS, SLOF and edk2-based firmwares.
> > > 
> > > Will using either of the formats prevent that from happening?
> > 
> > Both options allow this.
> > 
> > OE-Core already packages OpenSBI by default, Fedora and Debian are
> > moving to OpenSBI for RISC-V targets as well.
> >
> > Any distro that supports the RISC-V toolchain (which is all
> > upstreamed) can build OpenSBI.
> 
> Fedora uses OpenSBI for the last 2 or 3 months now. I don't plan to update
> BBL builds. OpenSBI packages in Fedora/RISCV isn't finalized, but it does
> ship *.elf and *.bin files.

Sounds good to me, thanks for confirming!

-- 
Andrea Bolognani / Red Hat / Virtualization


