Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpYYf-0006AC-1b
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 09:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hpYYc-0005wz-0v
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 09:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hpYYa-0004eW-OE
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 09:40:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hpYYU-0004Y3-UT; Mon, 22 Jul 2019 09:40:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3EF7A3082E1E;
 Mon, 22 Jul 2019 13:40:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-244.ams2.redhat.com
 [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 046431017E30;
 Mon, 22 Jul 2019 13:40:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6201F113865F; Mon, 22 Jul 2019 15:40:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Collin Walling
 <walling@linux.ibm.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,  "open list\:RISC-V"
 <qemu-riscv@nongnu.org>,  Eduardo Habkost <ehabkost@redhat.com>,  Sagar
 Karandikar <sagark@eecs.berkeley.edu>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Helge Deller <deller@gmx.de>,  Cornelia Huck
 <cohuck@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,  Aurelien Jarno
 <aurelien@aurel32.net>,  "open list\:S390" <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,  Alistair Francis
 <Alistair.Francis@wdc.com>,  Gerd Hoffmann <kraxel@redhat.com>,  qemu-ppc
 <qemu-ppc@nongnu.org>,  Richard Henderson <rth@twiddle.net>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  David Gibson <david@gibson.dropbear.id.au>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
Date: Mon, 22 Jul 2019 15:40:29 +0200
In-Reply-To: <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com> (Thomas Huth's
 message of "Tue, 16 Jul 2019 17:04:24 +0200")
Message-ID: <87wogayype.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 22 Jul 2019 13:40:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
X-List-Received-Date: Mon, 22 Jul 2019 13:40:51 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 16/07/2019 15.06, Markus Armbruster wrote:
[...]
>> 2. We want a way to Kconfig the PCI devices that work, i.e. only the
>>    ones that support MSI or MSI-X.
>> 
>> I don't like calling devices without any MSI capability "classic" or
>> "conventional devices".  I'd rather call them "MSI-capable" or
>> "MSI/MSI-X devices".
>
> But you still need a config switch that you can set to enable the
> non-MSI devices ... what's so wrong with "conventional" if that's even
> the wording from the PCI SIG?

PCI Express Base Specification, rev. 3.0, section Terms and
Acronyms:

    conventional PCI    Behavior or features that conform to the PCI
                        Local Bus Specification.

In other words, "conventional PCI" is non-Express PCI.

A PCI Express device *must* support MSI or MSI-X.  See PCI Express Base
Specification, rev. 3.0, section 7.7. MSI and MSI-X Capability
Structures.

A "conventional" PCI device *may* support MSI or MSI-X.  See PCI Local
Bus Specification Revision 3.0 section 6.8.  Message Signaled
Interrupts.

Conflating MSI-capable with conventional vs. Express is therefore wrong.

[...]

