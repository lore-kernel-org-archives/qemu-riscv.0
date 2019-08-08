Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvjfO-0002KP-KF
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58513)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjfN-0002KI-2m
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjfM-0002tb-3X
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:45:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjfL-0002sj-Tp; Thu, 08 Aug 2019 10:45:20 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C740A3024562;
 Thu,  8 Aug 2019 14:45:18 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F11FF6EA;
 Thu,  8 Aug 2019 14:44:40 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:44:38 +0200
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
Message-ID: <20190808164438.7045c4cc.cohuck@redhat.com>
In-Reply-To: <1565166604452.72353@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166604452.72353@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 14:45:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code
 size with MO_{8|16|32|64}
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
X-List-Received-Date: Thu, 08 Aug 2019 14:45:22 -0000

On Wed, 7 Aug 2019 08:30:04 +0000
<tony.nguyen@bt.com> wrote:

> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with

"Now that size_memop has been implemented properly, again hard code the
size but with..."

> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.

s/avoid/avoids/

> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/s390x/s390-pci-inst.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

