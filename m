Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvjSK-0004XP-8X
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56073)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjSD-0004Vf-T8
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:31:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjSC-0002E1-0M
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:31:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjSB-0002D7-Qg; Thu, 08 Aug 2019 10:31:43 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F3FD30C242A;
 Thu,  8 Aug 2019 14:31:41 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8EFA194B9;
 Thu,  8 Aug 2019 14:31:04 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:31:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Cc: <qemu-devel@nongnu.org>, <frederic.konrad@adacore.com>,
 <berto@igalia.com>, <qemu-block@nongnu.org>, <arikalo@wavecomp.com>,
 <pasic@linux.ibm.com>, <hpoussin@reactos.org>, <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, <lersek@redhat.com>,
 <jasowang@redhat.com>, <jiri@resnulli.us>, <ehabkost@redhat.com>,
 <b.galvani@gmail.com>, <eric.auger@redhat.com>,
 <alex.williamson@redhat.com>, <stefanha@redhat.com>, <jsnow@redhat.com>,
 <rth@twiddle.net>, <kwolf@redhat.com>, <andrew@aj.id.au>,
 <crwulff@gmail.com>, <laurent@vivier.eu>, <sundeep.lkml@gmail.com>,
 <michael@walle.cc>, <qemu-ppc@nongnu.org>,
 <kbastian@mail.uni-paderborn.de>, <imammedo@redhat.com>, <fam@euphon.net>,
 <peter.maydell@linaro.org>, <david@redhat.com>, <palmer@sifive.com>,
 <keith.busch@intel.com>, <jcmvbkbc@gmail.com>, <hare@suse.com>,
 <sstabellini@kernel.org>, <andrew.smirnov@gmail.com>, <deller@gmx.de>,
 <magnus.damm@gmail.com>, <atar4qemu@gmail.com>, <minyard@acm.org>,
 <sw@weilnetz.de>, <yuval.shaia@oracle.com>, <qemu-s390x@nongnu.org>,
 <qemu-arm@nongnu.org>, <jan.kiszka@web.de>, <clg@kaod.org>,
 <shorne@gmail.com>, <qemu-riscv@nongnu.org>, <i.mitsyanko@gmail.com>,
 <philmd@redhat.com>, <amarkovic@wavecomp.com>, <peter.chubb@nicta.com.au>,
 <aurelien@aurel32.net>, <pburton@wavecomp.com>, <sagark@eecs.berkeley.edu>,
 <green@moxielogic.com>, <kraxel@redhat.com>, <edgar.iglesias@gmail.com>,
 <gxt@mprc.pku.edu.cn>, <robh@kernel.org>, <borntraeger@de.ibm.com>,
 <joel@jms.id.au>, <antonynpavlov@gmail.com>, <chouteau@adacore.com>,
 <Andrew.Baumann@microsoft.com>, <mreitz@redhat.com>,
 <walling@linux.ibm.com>, <dmitry.fleytman@gmail.com>, <mst@redhat.com>,
 <mark.cave-ayland@ilande.co.uk>, <jslaby@suse.cz>, <marex@denx.de>,
 <proljc@gmail.com>, <marcandre.lureau@redhat.com>,
 <alistair@alistair23.me>, <paul.durrant@citrix.com>,
 <david@gibson.dropbear.id.au>, <xiaoguangrong.eric@gmail.com>,
 <huth@tuxfamily.org>, <jcd@tribudubois.net>, <pbonzini@redhat.com>,
 <stefanb@linux.ibm.com>
Message-ID: <20190808163102.47c8f056.cohuck@redhat.com>
In-Reply-To: <1565166454836.5266@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166454836.5266@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 14:31:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 05/26] hw/s390x: Access
 MemoryRegion with MemOp
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
X-List-Received-Date: Thu, 08 Aug 2019 14:31:48 -0000

On Wed, 7 Aug 2019 08:27:35 +0000
<tony.nguyen@bt.com> wrote:

> The memory_region_dispatch_{read|write} operand "unsigned size" is
> being converted into a "MemOp op".
> 
> Convert interfaces by using no-op size_memop.
> 
> After all interfaces are converted, size_memop will be implemented
> and the memory_region_dispatch_{read|write} operand "unsigned size"
> will be converted into a "MemOp op".
> 
> As size_memop is a no-op, this patch does not change any behaviour.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/s390x/s390-pci-inst.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

