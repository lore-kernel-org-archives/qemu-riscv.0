Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUWsU-0000bD-Sl
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 08:06:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gUUgx-0003O7-1K
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 05:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gUUgv-0004vk-TF
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 05:46:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gUUgp-0004pa-GU; Wed, 05 Dec 2018 05:45:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9DFB30B7A13;
	Wed,  5 Dec 2018 10:45:56 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB6519741;
	Wed,  5 Dec 2018 10:45:50 +0000 (UTC)
Date: Wed, 5 Dec 2018 11:45:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, Tony Krowiak
	<akrowiak@linux.ibm.com>, qemu-riscv@nongnu.org, Pierre Morel
	<pmorel@linux.ibm.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Richard Henderson
	<rth@twiddle.net>, Palmer Dabbelt <palmer@sifive.com>, Alex Williamson
	<alex.williamson@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>, Halil
	Pasic <pasic@linux.ibm.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, Michael Clark
	<mjc@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, Sagar
	Karandikar <sagark@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, Eduardo Habkost
	<ehabkost@redhat.com>
Message-ID: <20181205114547.6d1f2c2d.cohuck@redhat.com>
In-Reply-To: <874lbs2y8e.fsf@dusky.pond.sub.org>
References: <20181204172535.2799-1-armbru@redhat.com>
	<ae25db42-74e7-0870-46f8-7def27e5cf43@redhat.com>
	<874lbs2y8e.fsf@dusky.pond.sub.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Dec 2018 10:45:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 05 Dec 2018 08:06:08 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] Clean up includes
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
X-List-Received-Date: Wed, 05 Dec 2018 10:46:07 -0000

On Wed, 05 Dec 2018 09:07:13 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> > On 12/4/18 11:25 AM, Markus Armbruster wrote:  
> >> Clean up includes so that osdep.h is included first and headers
> >> which it implies are not included manually.
> >>
> >> This commit was created with scripts/clean-includes, with the changes
> >> to the following files manually reverted:

(...)

> >>      target/s390x/gen-features.c

(..)

> target/s390x/gen-features.c is a standalone program that is compiled in
> a way that breaks when we include osdep.h.  If that's fixable, fixing it
> would be nice.  Aside: not sure I'd have written this in C.

Yes, that file is a bit of an oddball. Might make sense to add a
comment there that it is standalone, so you can find that out without
looking at the Makefile. I don't think rewriting this to something else
is worth the effort.

