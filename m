Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Wm4-0006fV-GQ
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 16:16:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h4Wlz-0006Ev-PS
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 16:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h4Wcp-00043h-FK
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 16:06:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h4Wcl-00040k-Kq; Thu, 14 Mar 2019 16:06:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CF9230B9302;
	Thu, 14 Mar 2019 18:49:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1691817DF5;
	Thu, 14 Mar 2019 18:49:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8428A11385E4; Thu, 14 Mar 2019 19:48:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>, thuth@redhat.com,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>
References: <1551723614-1823-1-git-send-email-pbonzini@redhat.com>
	<1551723614-1823-16-git-send-email-pbonzini@redhat.com>
	<100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
	<20190314085921-mutt-send-email-mst@kernel.org>
	<CAEn-LTrgapxSbiYK2MoBxg5q2mc9i2gDMpcp451NDY2ob7-c3g@mail.gmail.com>
	<105a7417-2f7d-22aa-1f65-a6ff94706d3e@redhat.com>
Date: Thu, 14 Mar 2019 19:48:58 +0100
In-Reply-To: <105a7417-2f7d-22aa-1f65-a6ff94706d3e@redhat.com> (Paolo
	Bonzini's message of "Thu, 14 Mar 2019 18:34:19 +0100")
Message-ID: <87o96d5m1x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 14 Mar 2019 18:49:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 15/54] build: convert pci.mak
 to Kconfig
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
X-List-Received-Date: Thu, 14 Mar 2019 20:16:17 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 14/03/19 14:03, David Abdurachmanov wrote:
>> Would it be enough to modify ./default-configs/riscv32-softmmu.mak by
>> adding:
>> 
>> CONFIG_PCIE_PORT=n
>
> The missing dependency is for any board that doesn't support MSI, not
> just RISC-V.
>
> Note that technically what we do with msi_nonbroken makes no sense from
> the PCI point of view.  An "MSI" is just a memory write so there is no
> such thing as a device that doesn't work because the board doesn't
> support MSI; it should be up to the OS not to configure MSI unless it
> knows the interrupt controller can be set up as a destination for MSIs.
>  The driver in the OS then can choose to use level-triggered interrupts
> (INTX) instead, or it can refuse to load.  At least, this is how QEMU
> *should* work.

Yes.

The problem is virtual interrupt controllers that claim to support MSI
when they don't.  The OS's probe returns "go ahead and use MSI", and the
system falls apart.

So we put in a lame work-around: if MSI is broken, mangle all PCI
devices to make them deny MSI capability.

The next problem is that we don't even know which of our interrupt
controllers have MSI working.  So we summarily declare them all broken,
then have the few we actually know declare themselves non-broken.

A bit of background in the thread around
Message-ID: <87wppi1vol.fsf@blackfin.pond.sub.org>
https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg00983.html

> However, we started doing this msi_nonbroken thing, and therefore, since
> we can model it correctly with Kconfig and obtain the same results as
> pre-Kconfig, it's a better way to do it.

As long as the MSI mess exists, we deal with it as well as we can.

