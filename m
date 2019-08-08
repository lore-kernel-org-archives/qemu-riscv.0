Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvj6I-0003g8-DP
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvj6E-0003eM-1Y
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvj6D-0005UY-0H
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:09:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20193)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvj6C-0005TT-Nz; Thu, 08 Aug 2019 10:09:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25C1D309DEF7;
 Thu,  8 Aug 2019 14:08:59 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8989260BF1;
 Thu,  8 Aug 2019 14:08:05 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:08:03 +0200
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
Message-ID: <20190808160803.1326a244.cohuck@redhat.com>
In-Reply-To: <1565166336833.46550@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166336833.46550@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 08 Aug 2019 14:08:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 01/26] configure: Define
 TARGET_ALIGNED_ONLY
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
X-List-Received-Date: Thu, 08 Aug 2019 14:09:03 -0000

On Wed, 7 Aug 2019 08:25:37 +0000
<tony.nguyen@bt.com> wrote:

> Rename ALIGNED_ONLY to TARGET_ALIGNED_ONLY for clarity and move
> defines out of target/foo/cpu.h into configure, as we do with
> TARGET_WORDS_BIGENDIAN, so that it is always defined early.
>=20
> Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.
>=20
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  configure             | 10 +++++++++-
>  include/exec/poison.h |  1 +
>  include/qom/cpu.h     |  2 +-
>  target/alpha/cpu.h    |  2 --
>  target/hppa/cpu.h     |  1 -
>  target/mips/cpu.h     |  2 --
>  target/sh4/cpu.h      |  2 --
>  target/sparc/cpu.h    |  2 --
>  target/xtensa/cpu.h   |  2 --
>  tcg/tcg.c             |  2 +-
>  tcg/tcg.h             |  8 +++++---
>  11 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

