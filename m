Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvjC2-0005kf-CF
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjC0-0005jL-6K
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjBz-0000gr-0c
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:15:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjBy-0000g0-PK; Thu, 08 Aug 2019 10:14:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 850C630860CB;
 Thu,  8 Aug 2019 14:14:57 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F18B95D772;
 Thu,  8 Aug 2019 14:14:23 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:14:21 +0200
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
Message-ID: <20190808161421.0e4f85f5.cohuck@redhat.com>
In-Reply-To: <1565166381875.37725@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166381875.37725@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 08 Aug 2019 14:14:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 02/26] tcg: TCGMemOp is now
 accelerator independent MemOp
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
X-List-Received-Date: Thu, 08 Aug 2019 14:15:01 -0000

On Wed, 7 Aug 2019 08:26:23 +0000
<tony.nguyen@bt.com> wrote:

> Preparation for collapsing the two byte swaps, adjust_endianness and
> handle_bswap, along the I/O path.
> 
> Target dependant attributes are conditionalize upon NEED_CPU_H.

s/conditionalize/conditionalized/ ?

> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  MAINTAINERS                             |   1 +
>  accel/tcg/cputlb.c                      |   2 +-
>  include/exec/memop.h                    | 110 ++++++++++++++++++++++++++
>  target/alpha/translate.c                |   2 +-
>  target/arm/translate-a64.c              |  48 ++++++------
>  target/arm/translate-a64.h              |   2 +-
>  target/arm/translate-sve.c              |   2 +-
>  target/arm/translate.c                  |  32 ++++----
>  target/arm/translate.h                  |   2 +-
>  target/hppa/translate.c                 |  14 ++--
>  target/i386/translate.c                 | 132 ++++++++++++++++----------------
>  target/m68k/translate.c                 |   2 +-
>  target/microblaze/translate.c           |   4 +-
>  target/mips/translate.c                 |   8 +-
>  target/openrisc/translate.c             |   4 +-
>  target/ppc/translate.c                  |  12 +--
>  target/riscv/insn_trans/trans_rva.inc.c |   8 +-
>  target/riscv/insn_trans/trans_rvi.inc.c |   4 +-
>  target/s390x/translate.c                |   6 +-
>  target/s390x/translate_vx.inc.c         |  10 +--
>  target/sparc/translate.c                |  14 ++--
>  target/tilegx/translate.c               |  10 +--
>  target/tricore/translate.c              |   8 +-
>  tcg/README                              |   2 +-
>  tcg/aarch64/tcg-target.inc.c            |  26 +++----
>  tcg/arm/tcg-target.inc.c                |  26 +++----
>  tcg/i386/tcg-target.inc.c               |  24 +++---
>  tcg/mips/tcg-target.inc.c               |  16 ++--
>  tcg/optimize.c                          |   2 +-
>  tcg/ppc/tcg-target.inc.c                |  12 +--
>  tcg/riscv/tcg-target.inc.c              |  20 ++---
>  tcg/s390/tcg-target.inc.c               |  14 ++--
>  tcg/sparc/tcg-target.inc.c              |   6 +-
>  tcg/tcg-op.c                            |  38 ++++-----
>  tcg/tcg-op.h                            |  86 ++++++++++-----------
>  tcg/tcg.c                               |   2 +-
>  tcg/tcg.h                               | 101 ++----------------------
>  trace/mem-internal.h                    |   4 +-
>  trace/mem.h                             |   4 +-
>  39 files changed, 421 insertions(+), 399 deletions(-)
>  create mode 100644 include/exec/memop.h

Acked-by: Cornelia Huck <cohuck@redhat.com>

