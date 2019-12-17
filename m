Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihFsA-0005QD-7N
	for mharc-qemu-riscv@gnu.org; Tue, 17 Dec 2019 11:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihFs3-0005KK-5i
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:38:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihFrz-00009g-9q
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:38:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihFrz-00008f-6c
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576600726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6a8mxHo3cySJx2vpicwTxKmGILKeHDrQeQCRS52voSg=;
 b=g6xCKi38tPOVUmOBnb9RND0bedDBQKsv4DAr0C1laBvbIHub1Y554yFpxGRoZerHRLiImi
 lD4F2Zcc6zUOIusz1kqnzq+PtCfhakw7Cx/vIgvXMCGH3KsjFzfxpcGiA4Io58jItekm5I
 jj62X/QZ9EOEN9VM1U+fXuLVfCE+yKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-rojm5KUGNQak6JPZ_E3JYA-1; Tue, 17 Dec 2019 11:38:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9102DBA5;
 Tue, 17 Dec 2019 16:38:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C22D675BF;
 Tue, 17 Dec 2019 16:38:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alberto Garcia <berto@igalia.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Amit Shah <amit@kernel.org>, qemu-riscv@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <huth@tuxfamily.org>
Subject: [PATCH 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler typedef
Date: Tue, 17 Dec 2019 17:37:54 +0100
Message-Id: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: rojm5KUGNQak6JPZ_E3JYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 17 Dec 2019 16:38:56 -0000

Hi,

After this chat on #qemu IRC:
13:20 <stsquad> so what is the difference between a IOReadHandler and IOEve=
ntHandler?
13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
13:27 <f4bug> see QEMUChrEvent for IOEventHandler

I thought it might be a good opportunity to make the IOEventHandler
typedef meaning more obvious, by using the QEMUChrEvent enum.

To be able to build I had to explicit a 'default' case when frontends
use a switch(event) case and do not handle all events.

Then I used a coccinelle spatch to change the various IOEventHandler.
I don't think the last patch can be split, but suggestions are welcome!

Regards,

Phil.

PD: I use git-publish. To avoid spamming too much, I'm using per-patch
Cc tag, after the '---' separator. This way each recipient should get
the cover and the specific patches of interests, + the last one.

Sent with: 'git publish --suppress-cc=3Dcccmd'

Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Corey Minyard <minyard@acm.org>
Cc: Paul Burton <pburton@wavecomp.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-riscv@nongnu.org

Philippe Mathieu-Daud=C3=A9 (14):
  hw/ipmi: Remove unnecessary declarations
  chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
  vhost-user: Explicit we ignore some QEMUChrEvent in IOEventHandler
  virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
  hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
  hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandler
  ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
  hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
  monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
  monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
  net/vhost-user: Explicit we ignore few QEMUChrEvent in IOEventHandler
  vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
  hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
  chardev: Use QEMUChrEvent enum in IOEventHandler typedef

 include/chardev/char-fe.h       |  2 +-
 include/chardev/char-mux.h      |  2 +-
 include/chardev/char.h          |  4 ++--
 backends/cryptodev-vhost-user.c |  5 ++++-
 chardev/char-mux.c              |  8 ++++----
 chardev/char.c                  |  7 +++++--
 gdbstub.c                       |  2 +-
 hw/arm/pxa2xx.c                 |  2 +-
 hw/arm/strongarm.c              |  2 +-
 hw/block/vhost-user-blk.c       |  5 ++++-
 hw/char/cadence_uart.c          |  2 +-
 hw/char/digic-uart.c            |  2 +-
 hw/char/escc.c                  |  2 +-
 hw/char/etraxfs_ser.c           |  2 +-
 hw/char/exynos4210_uart.c       |  2 +-
 hw/char/grlib_apbuart.c         |  2 +-
 hw/char/imx_serial.c            |  2 +-
 hw/char/ipoctal232.c            |  2 +-
 hw/char/lm32_juart.c            |  2 +-
 hw/char/lm32_uart.c             |  2 +-
 hw/char/mcf_uart.c              |  2 +-
 hw/char/milkymist-uart.c        |  2 +-
 hw/char/nrf51_uart.c            |  2 +-
 hw/char/pl011.c                 |  2 +-
 hw/char/serial.c                |  2 +-
 hw/char/sh_serial.c             |  2 +-
 hw/char/terminal3270.c          |  5 ++++-
 hw/char/virtio-console.c        |  5 ++++-
 hw/char/xilinx_uartlite.c       |  2 +-
 hw/ipmi/ipmi_bmc_extern.c       | 10 +++++-----
 hw/mips/boston.c                |  2 +-
 hw/mips/mips_malta.c            |  2 +-
 hw/riscv/riscv_htif.c           |  2 +-
 hw/riscv/sifive_uart.c          |  2 +-
 hw/usb/ccid-card-passthru.c     |  5 ++++-
 hw/usb/dev-serial.c             |  5 ++++-
 hw/usb/redirect.c               |  5 ++++-
 monitor/hmp.c                   |  6 +++++-
 monitor/qmp.c                   |  5 ++++-
 net/filter-mirror.c             |  2 +-
 net/vhost-user.c                |  7 +++++--
 qtest.c                         |  2 +-
 tests/test-char.c               |  6 +++---
 tests/vhost-user-test.c         |  2 +-
 44 files changed, 90 insertions(+), 56 deletions(-)

--=20
2.21.0


