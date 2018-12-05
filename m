Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUWsT-0000Zp-LE
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 08:06:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gUSRW-0001yV-HQ
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:22:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gUSDS-0007GE-88
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:07:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gUSDK-00077I-1m; Wed, 05 Dec 2018 03:07:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E4895F722;
	Wed,  5 Dec 2018 08:07:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B851001944;
	Wed,  5 Dec 2018 08:07:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9A4F1113860E; Wed,  5 Dec 2018 09:07:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Tony Krowiak <akrowiak@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
	Pierre Morel <pmorel@linux.ibm.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>, Palmer Dabbelt <palmer@sifive.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20181204172535.2799-1-armbru@redhat.com>
	<ae25db42-74e7-0870-46f8-7def27e5cf43@redhat.com>
Date: Wed, 05 Dec 2018 09:07:13 +0100
In-Reply-To: <ae25db42-74e7-0870-46f8-7def27e5cf43@redhat.com> (Eric Blake's
	message of "Tue, 4 Dec 2018 11:46:01 -0600")
Message-ID: <874lbs2y8e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 05 Dec 2018 08:07:21 +0000 (UTC)
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
X-List-Received-Date: Wed, 05 Dec 2018 08:22:06 -0000

Eric Blake <eblake@redhat.com> writes:

> On 12/4/18 11:25 AM, Markus Armbruster wrote:
>> Clean up includes so that osdep.h is included first and headers
>> which it implies are not included manually.
>>
>> This commit was created with scripts/clean-includes, with the changes
>> to the following files manually reverted:
>>
>>      contrib/libvhost-user/libvhost-user-glib.h
>>      contrib/libvhost-user/libvhost-user.c
>>      contrib/libvhost-user/libvhost-user.h
>
> The script should probably auto-exclude contrib/ if none of those
> files make it into our final binary, and especially if they are meant
> to be compiled as stand-alone examples.



>>      linux-user/mips64/cpu_loop.c
>>      linux-user/mips64/signal.c
>>      linux-user/sparc64/cpu_loop.c
>>      linux-user/sparc64/signal.c
>>      linux-user/x86_64/cpu_loop.c
>>      linux-user/x86_64/signal.c
>>      target/s390x/gen-features.c
>>      tests/migration/s390x/a-b-bios.c
>>      tests/test-rcu-simpleq.c
>>      tests/test-rcu-tailq.c
>
> Should any of these files be renamed *.c.inc to match their usage?
> (Presuming that you excluded them because they are pulled in via
> another .c file?)

The linux-user/T64/N.c contain nothing but

    #include "../T/N.c"

plus sometimes a #define T_TARGET_SINGAL_H thrown in to suppress
inclusion of a header.

Perhaps moving the actual meat into a common .inc.c would be cleaner.

Similarly, tests/test-rcu-simpleq.c contains nothing but

    #define TEST_LIST_TYPE 2
    #include "test-rcu-list.c"

and tests/test-rcu-tailq.c is the same with 3 instead of 2.

Again, we could move the actual meat into a common .inc.c.  But I'd
first investigate compiling the test three times with the appropriate
-DTEST_LIST_TYPE, using GNU Make's target-specific variable values.

target/s390x/gen-features.c is a standalone program that is compiled in
a way that breaks when we include osdep.h.  If that's fixable, fixing it
would be nice.  Aside: not sure I'd have written this in C.

tests/migration/s390x/ is a s390x guest firmware program for
migration-test.c.  It's compiled as a freestanding application.  I guess
osdep.h just gets in the way there.

All of the above is well beyond the scope of this simple cleanup patch.

>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   contrib/elf2dmp/pdb.h                     | 2 --
>>   contrib/elf2dmp/pe.h                      | 1 -
>>   contrib/elf2dmp/qemu_elf.h                | 1 -
>>   contrib/vhost-user-blk/vhost-user-blk.c   | 1 -
>>   contrib/vhost-user-scsi/vhost-user-scsi.c | 1 -
>
> Hmm - my earlier question about auto-excluding contrib/ gets
> trickier. What's the rationale for including some files in here?

These are standalone programs that already include osdep.h.  My patch
simply drops superfluous include directives.

>>   hw/rdma/rdma_utils.c                      | 1 +
>>   hw/rdma/rdma_utils.h                      | 1 -
>>   hw/rdma/vmw/pvrdma_dev_ring.h             | 1 -
>>   hw/vfio/ap.c                              | 2 +-
>>   include/qemu/vfio-helpers.h               | 1 -
>>   include/sysemu/whpx.h                     | 1 -
>>   target/i386/sev.c                         | 3 ++-
>>   target/i386/whp-dispatch.h                | 1 -
>>   target/riscv/fpu_helper.c                 | 1 -
>>   tests/fp/platform.h                       | 1 -
>>   tests/tpm-util.h                          | 1 -
>>   tests/vhost-user-bridge.c                 | 2 +-
>>   util/qemu-thread-common.h                 | 1 -
>>   18 files changed, 5 insertions(+), 18 deletions(-)
>
> The remainder of these files look reasonable.

Thanks!

