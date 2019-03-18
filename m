Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5rQL-0000Wp-I7
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 08:31:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h5rQJ-0000VI-2c
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 08:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h5rQH-0003Xs-1h
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 08:31:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h5rQD-0003To-5M; Mon, 18 Mar 2019 08:31:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2174307D86F;
	Mon, 18 Mar 2019 12:31:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808725D9E2;
	Mon, 18 Mar 2019 12:31:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0E7DE11385E4; Mon, 18 Mar 2019 13:31:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-riscv\@nongnu.org" <qemu-riscv@nongnu.org>,
	"david.abdurachmanov\@gmail.com" <david.abdurachmanov@gmail.com>,
	"palmer\@sifive.com" <palmer@sifive.com>,
	"qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>,
	"rjones\@redhat.com" <rjones@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"abologna\@redhat.com" <abologna@redhat.com>,
	"pbonzini\@redhat.com" <pbonzini@redhat.com>,
	"alistair23\@gmail.com" <alistair23@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>
References: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
	<87imwgimot.fsf@dusky.pond.sub.org>
	<CAFEAcA-i9N=W1e+UzO1Hxvw0Qv_GfUm-+9R7PhpMHPrUKyL0-w@mail.gmail.com>
Date: Mon, 18 Mar 2019 13:31:11 +0100
In-Reply-To: <CAFEAcA-i9N=W1e+UzO1Hxvw0Qv_GfUm-+9R7PhpMHPrUKyL0-w@mail.gmail.com>
	(Peter Maydell's message of "Mon, 18 Mar 2019 09:55:58 +0000")
Message-ID: <87a7hsfjow.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 18 Mar 2019 12:31:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: plic: Set
 msi_nonbroken as true
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
X-List-Received-Date: Mon, 18 Mar 2019 12:31:24 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 18 Mar 2019 at 08:59, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Alistair Francis <Alistair.Francis@wdc.com> writes:
>>
>> > Set msi_nonbroken as true for the PLIC.
>> >
>> > According to the comment located here:
>> > https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
>> > the msi_nonbroken variable should be set to true even if they don't
>> > support MSI. In this case that is what we are doing as we don't support
>> > MSI.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > Reported-by: Andrea Bolognani <abologna@redhat.com>
>> > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> > ---
>> > This should allow working pcie-root-ports in QEMU and allow libvirt
>> > to start using PCIe by default for RISC-V guests.
>>
>> Lovely!  If more people reviewed and updated their interrupt controllers
>> this way, we'd be in better shape.
>
> Why do we have a flag which each interrupt controller
> has to set rather than just making the right thing the
> default (and having the one or two interrupt controllers
> that need the wrong thing for backwards compatibility reasons
> be the ones that have to set the flag) ? This way round makes
> it way to easy to add a new interrupt controller with this
> bug without noticing it, I think.

This is ultimately a question for Michael (cc'ed).  However, I can
provide a bit of context right away.

The problem is virtual interrupt controllers that claim to support MSI
when they don't.  The OS's probe returns "go ahead and use MSI", and the
system falls apart.

So we put in a lame work-around to masks these interrupt controller
bugs: if MSI is broken, mangle all PCI devices to make them deny MSI
capability.

The next problem is that we don't even know which of our interrupt
controllers have MSI working.  So we summarily declare them all broken,
then have the few we actually know declare themselves non-broken.

The next problem is having multiple interrupt controllers, some broken,
some not.  The work-around falls apart there.  We currently use the
ostrich algorithm to deal with that.

More information in the thread around
Message-ID: <87wppi1vol.fsf@blackfin.pond.sub.org>
https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg00983.html

