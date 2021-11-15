Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmbWd-0001hN-5O
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 07:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWc-0001e2-Bh
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 07:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWW-0005Ws-Jm
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 07:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PWNgJ5yREbVUL4cueOOSpyMLOmwhu2CnPaawQtlSMyM=;
 b=M270V2qspe+0RSPNQJqvNWWqkWrwZzvMXGELsQtPDLBaZSQFy6E3yYNpYkpYhm9fRBRYhS
 m196preKle19OtI/7QzLN6TLGoTbF1EYnv4uyU6IHxguTq3JlyJak0+c4wSIlLqirMmSCk
 nfMuGWj5XcIRUlh/I6wcnzr/+a399X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-KyDG0duiPEmvhKHBzzUj3w-1; Mon, 15 Nov 2021 07:55:44 -0500
X-MC-Unique: KyDG0duiPEmvhKHBzzUj3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 413D318D6A25;
 Mon, 15 Nov 2021 12:55:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CF15D6D7;
 Mon, 15 Nov 2021 12:55:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71FE611380A7; Mon, 15 Nov 2021 13:55:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 b.galvani@gmail.com, jcd@tribudubois.net, andrew.smirnov@gmail.com,
 sundeep.lkml@gmail.com, hskinnemoen@google.com, kfting@nuvoton.com,
 nieklinnenbank@gmail.com, Andrew.Baumann@microsoft.com, f4bug@amsat.org,
 edgar.iglesias@gmail.com, alistair@alistair23.me, bin.meng@windriver.com,
 palmer@dabbelt.com, atar4qemu@gmail.com, mark.cave-ayland@ilande.co.uk,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH RFC 0/2] Eliminate drive_get_next()
Date: Mon, 15 Nov 2021 13:55:34 +0100
Message-Id: <20211115125536.3341681-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Nov 2021 12:55:54 -0000

This is RFC because I'm unsure about the removal of

    /* Reason: init() method uses drive_get_next() */
    dc->user_creatable = false;

in PATCH 1.  Both users appear to wire up some GPIO.  If that's
necessary for the thing to work, we should just replace the comment.

Aside: there may be devices that need manual wiring to work, yet don't
have user_creatable unset.  Bugs if you ask me.  I don't have smart
ideas on how to track them down.

Markus Armbruster (2):
  hw/sd/ssi-sd: Do not create SD card within controller's realize
  hw: Replace drive_get_next() by drive_get()

 include/sysemu/blockdev.h           |  1 -
 blockdev.c                          | 10 ----------
 hw/arm/aspeed.c                     | 21 +++++++++++++--------
 hw/arm/cubieboard.c                 |  2 +-
 hw/arm/imx25_pdk.c                  |  2 +-
 hw/arm/integratorcp.c               |  2 +-
 hw/arm/mcimx6ul-evk.c               |  2 +-
 hw/arm/mcimx7d-sabre.c              |  2 +-
 hw/arm/msf2-som.c                   |  2 +-
 hw/arm/npcm7xx_boards.c             |  6 +++---
 hw/arm/orangepi.c                   |  2 +-
 hw/arm/raspi.c                      |  2 +-
 hw/arm/realview.c                   |  2 +-
 hw/arm/sabrelite.c                  |  2 +-
 hw/arm/stellaris.c                  | 15 ++++++++++++++-
 hw/arm/versatilepb.c                |  4 ++--
 hw/arm/vexpress.c                   |  6 +++---
 hw/arm/xilinx_zynq.c                | 16 +++++++++-------
 hw/arm/xlnx-versal-virt.c           |  3 ++-
 hw/arm/xlnx-zcu102.c                |  6 +++---
 hw/microblaze/petalogix_ml605_mmu.c |  2 +-
 hw/misc/sifive_u_otp.c              |  2 +-
 hw/riscv/microchip_pfsoc.c          |  2 +-
 hw/riscv/sifive_u.c                 | 15 +++++++++++++--
 hw/sd/ssi-sd.c                      | 29 -----------------------------
 hw/sparc64/niagara.c                |  2 +-
 26 files changed, 76 insertions(+), 84 deletions(-)

-- 
2.31.1


