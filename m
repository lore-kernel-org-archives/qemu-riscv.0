Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnNAt-000338-Mm
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44326)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hnNAq-0002n7-Au
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hnNAp-00016K-C0
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:07:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hnNAj-00010Z-Kf; Tue, 16 Jul 2019 09:07:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E90B83F3B;
 Tue, 16 Jul 2019 13:07:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328F419C59;
 Tue, 16 Jul 2019 13:06:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EA9C11386A0; Tue, 16 Jul 2019 15:06:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,  "open
 list\:RISC-V" <qemu-riscv@nongnu.org>,  Eduardo Habkost
 <ehabkost@redhat.com>,  Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Collin Walling <walling@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,  "open list\:S390"
 <qemu-s390x@nongnu.org>,  qemu-arm <qemu-arm@nongnu.org>,  Alistair
 Francis <Alistair.Francis@wdc.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,  qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?= <philmd@redhat.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Richard Henderson <rth@twiddle.net>
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
Date: Tue, 16 Jul 2019 15:06:58 +0200
In-Reply-To: <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com> (Paolo
 Bonzini's message of "Mon, 15 Jul 2019 20:22:41 +0200")
Message-ID: <87h87m2knh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 16 Jul 2019 13:07:08 +0000 (UTC)
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
X-List-Received-Date: Tue, 16 Jul 2019 13:07:18 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/07/19 18:12, Cornelia Huck wrote:
>>> Is it INTx vs. MSI vs. MSI-X?
>> 
>> I think for s390x we need (INTx || MSI) vs MSI-X...
>
> I think MSI vs MSI-X is just how it's configured, not the actual
> behavior, so it should be irrelevant.

My best guesses from confusing information, please correct
misunderstandings:

1. PCI devices need to support MSI or MSI-X to work with s390x.

2. We want a way to Kconfig the PCI devices that work, i.e. only the
   ones that support MSI or MSI-X.

I don't like calling devices without any MSI capability "classic" or
"conventional devices".  I'd rather call them "MSI-capable" or
"MSI/MSI-X devices".

Since PCI-E devices must implement MSI or MSI-X, we could perhaps
configure just the PCI-E devices for s390x.  No need to invent a new
name then.  Do we even have device models that can do MSI but not E?

