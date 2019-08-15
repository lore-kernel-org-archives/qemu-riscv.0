Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyNSO-00032h-Pe
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 17:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNRx-0002w1-FF
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 17:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNRw-0006Ct-9z
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 17:38:25 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:19195)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNRt-0006Ao-Gr; Thu, 15 Aug 2019 17:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1565905101; x=1597441101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KhMKveagWI7BDqokS3HdF3E2uSk0r+2CqujjD2dHoA=;
 b=IiKpLwq/NafzjEOTt6Ksfc4vSfrzVBxz3MyEWz6+qUlPdw1aZSePCq5U
 yHfI0AL67kMeBijl2/98RiGbuKdjHhJovlsKQX2YRiOGE9N5tNz11D2gY
 /sZ7wktMFQJ+yCT+9IungpTC+nSXrqgo7nr/mDBA7AZErS5E+wBV5rTSy
 zPP2ksqz2xnoVK1BRbnZIW4j2Ka1k5zJRWFnQvp1I8a2MtFlKOwV2z777
 YMXmWzNcFDvVfxJkOTYDHKTGXkrbS5uhmRVkSPXSqsbHGYCCJN6bh2s90
 6i5kV/Je3jioqe4hR8MdOohAGJ5vfCwsF5qRgpRk+cjYv0+H7aCpxp1VS g==;
IronPort-SDR: OhdisHQWVWBUUKxyLyFnEqlyLtA3ctJaQTugrVM9vvX3mGOLh/2hfqp7M3YF9Qkryh8FPMjEDV
 N7OyoZI41yoBEXHqPwek9RbVwpd+kZebCgoLxglSToxBuht4afDE6evpG/5iDD3JFMkaWwK/6y
 LURQq9wf5NwXBMWTxIxSCbCfWO3/K1rzD7sh2jKZ+Hbh6TQ2SuyVIIqxuiBHtdrMLhdSfiaua2
 NBAi67cb+2yjTKfUucGIJi1jFcrka4cuPB60FGhvjCJEt4e2iYXpkd0y1zO54kqpKwrXWsbp6F
 24w=
X-IronPort-AV: E=Sophos;i="5.64,389,1559491200"; d="scan'208";a="222470292"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2019 05:38:18 +0800
IronPort-SDR: pFBbhC0FlRyQynaQ8smczfLEjrxUuUOXcMPcMG4XdAC+BZNyg9xXEmwVEQwamKx+h/9+CK4IYu
 94Dg9/iRE9Et1wfh1TfAz7hzo4F1gyfMPyXG4l4xq6IaEuMHeCw4Jpf/wRvaTJ2INCqEwKdBeP
 ipHqDHxITTHvsxMnM5aCgUz+l2ua/KiEAYGZRd+SyoxnXVVGwlfY7eiEc/dZkHeJtqQyCgb+Ub
 ciJbpWjC/3qrxZVgWnfnMXiTOZ/hkWPmpW9TE8JMDMQzXWDORtA0aBeRi1t4C/De+b5KMrBixr
 O3T3yVEFb8zD2nfVWiElflIA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 14:35:49 -0700
IronPort-SDR: Tx0/+WbOlFBDxAWZ6PZ7RpNKImU/jHuMnUqKpXePeIcE+uHqAKXsHWvZ+MhW+j7DPHEs175W9X
 4qhqXqQqni+xfITrxwwCdW92gepQs+oYzgXnR47yKDF7M8GEaD9AJl5K506GLFeakSw2jCWcoS
 Mv0O1nZQGwl9almFlWz8rFIO99AnW666xIVSok05lXVqhRHyX+hdplcCybFJ9HMMgE/+lAYjVf
 3JxookV1rdUlRSJg09DfDExR+u0oGIMZA7epwbK4VBd3BMKhS/pX+y1dHonNp+f8ivkgkaPQas
 i6M=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Aug 2019 14:38:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Thu, 15 Aug 2019 14:34:50 -0700
Message-Id: <9ecf08f99b17a0547cc5cc7a427453ce20389b4b.1565904855.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1565904855.git.alistair.francis@wdc.com>
References: <cover.1565904855.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v3 2/7] riscv: plic: Remove unused interrupt
 functions
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
X-List-Received-Date: Thu, 15 Aug 2019 21:38:26 -0000
X-List-Received-Date: Thu, 15 Aug 2019 21:38:26 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 hw/riscv/sifive_plic.c         | 12 ------------
 include/hw/riscv/sifive_plic.h |  3 ---
 2 files changed, 15 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 0950e89e15..864a1bed42 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -161,18 +161,6 @@ static void sifive_plic_update(SiFivePLICState *plic)
     }
 }
 
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq)
-{
-    sifive_plic_set_pending(plic, irq, true);
-    sifive_plic_update(plic);
-}
-
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq)
-{
-    sifive_plic_set_pending(plic, irq, false);
-    sifive_plic_update(plic);
-}
-
 static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
 {
     int i, j;
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
index ce8907f6aa..3b8a623919 100644
--- a/include/hw/riscv/sifive_plic.h
+++ b/include/hw/riscv/sifive_plic.h
@@ -69,9 +69,6 @@ typedef struct SiFivePLICState {
     uint32_t aperture_size;
 } SiFivePLICState;
 
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq);
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq);
-
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t num_sources, uint32_t num_priorities,
     uint32_t priority_base, uint32_t pending_base,
-- 
2.22.0


