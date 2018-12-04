Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUFYB-0002Yd-Df
	for mharc-qemu-riscv@gnu.org; Tue, 04 Dec 2018 13:36:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gUEm2-0002dz-Vg
	for qemu-riscv@nongnu.org; Tue, 04 Dec 2018 12:46:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gUEm1-0002vA-AK
	for qemu-riscv@nongnu.org; Tue, 04 Dec 2018 12:46:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gUElu-0002sK-Mv; Tue, 04 Dec 2018 12:46:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0EAC12B9F;
	Tue,  4 Dec 2018 17:46:08 +0000 (UTC)
Received: from [10.10.120.230] (ovpn-120-230.rdu2.redhat.com [10.10.120.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0039160BF1;
	Tue,  4 Dec 2018 17:46:01 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Palmer Dabbelt
	<palmer@sifive.com>, qemu-riscv@nongnu.org,
	Pierre Morel <pmorel@linux.ibm.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Yuval Shaia <yuval.shaia@oracle.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>, Michael Clark
	<mjc@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
References: <20181204172535.2799-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ae25db42-74e7-0870-46f8-7def27e5cf43@redhat.com>
Date: Tue, 4 Dec 2018 11:46:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204172535.2799-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 04 Dec 2018 17:46:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 04 Dec 2018 13:36:02 -0500
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
X-List-Received-Date: Tue, 04 Dec 2018 17:46:21 -0000

On 12/4/18 11:25 AM, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>      contrib/libvhost-user/libvhost-user-glib.h
>      contrib/libvhost-user/libvhost-user.c
>      contrib/libvhost-user/libvhost-user.h

The script should probably auto-exclude contrib/ if none of those files 
make it into our final binary, and especially if they are meant to be 
compiled as stand-alone examples.

>      linux-user/mips64/cpu_loop.c
>      linux-user/mips64/signal.c
>      linux-user/sparc64/cpu_loop.c
>      linux-user/sparc64/signal.c
>      linux-user/x86_64/cpu_loop.c
>      linux-user/x86_64/signal.c
>      target/s390x/gen-features.c
>      tests/migration/s390x/a-b-bios.c
>      tests/test-rcu-simpleq.c
>      tests/test-rcu-tailq.c

Should any of these files be renamed *.c.inc to match their usage? 
(Presuming that you excluded them because they are pulled in via another 
.c file?)

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   contrib/elf2dmp/pdb.h                     | 2 --
>   contrib/elf2dmp/pe.h                      | 1 -
>   contrib/elf2dmp/qemu_elf.h                | 1 -
>   contrib/vhost-user-blk/vhost-user-blk.c   | 1 -
>   contrib/vhost-user-scsi/vhost-user-scsi.c | 1 -

Hmm - my earlier question about auto-excluding contrib/ gets trickier. 
What's the rationale for including some files in here?

>   hw/rdma/rdma_utils.c                      | 1 +
>   hw/rdma/rdma_utils.h                      | 1 -
>   hw/rdma/vmw/pvrdma_dev_ring.h             | 1 -
>   hw/vfio/ap.c                              | 2 +-
>   include/qemu/vfio-helpers.h               | 1 -
>   include/sysemu/whpx.h                     | 1 -
>   target/i386/sev.c                         | 3 ++-
>   target/i386/whp-dispatch.h                | 1 -
>   target/riscv/fpu_helper.c                 | 1 -
>   tests/fp/platform.h                       | 1 -
>   tests/tpm-util.h                          | 1 -
>   tests/vhost-user-bridge.c                 | 2 +-
>   util/qemu-thread-common.h                 | 1 -
>   18 files changed, 5 insertions(+), 18 deletions(-)

The remainder of these files look reasonable.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

