Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouiku-0005Jz-19
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1ouifG-0004o9-9J; Mon, 14 Nov 2022 18:14:55 -0500
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1ouZsH-0006hl-L9; Mon, 14 Nov 2022 08:51:47 -0500
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 3800B3E0EB3;
 Mon, 14 Nov 2022 13:51:34 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id A3A8D3E0D9F;
 Mon, 14 Nov 2022 13:51:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1668433893; a=rsa-sha256;
 cv=none;
 b=28z8YPwizWDVJTiyYFxAZLebKjZKu569ZeVqpOg3kxU81hW2Bu2bupx6vmNlIRn8zeNL58
 L/IeodUAtoTJwly6F/u3W+/nHozF9XMj/HtoP9huwfcVutHC0LUvhAHSpB45iZHKUc+sia
 g7Z66seO+IzL3hiaHE/NmH3VRbMD8IrnnxCaisVScGf4uNWHmTZZgsULEiqLJsGca5+5kO
 kyICAdeY/UmJ7xByKPJ4AvbKcXTDuRfThz1D1KYvFV8goM/W6+OdaiCYbFJAbMBCpOi6rY
 phmaL1KeIeNonUz6YQ1fnuFKi/fXTD9Bk3NVFAWE3XiYzCuu/5nDGNiuAXP3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1668433893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=Mu3hPS2b8Xlse2AAmX/Q+D/0A7F/bAn0XSXUSXg8Hcs=;
 b=sNrV/suvhT60mVvgWYnWEO0N/F/21tIfOzSwHt+itbgDn0z7sO1+xPe2X2hQ72U8vBzpRr
 gfdmpc+CBEs6sPZf9us3Hi2fZHI/Z020UJ2pxF1Pwc+12SBkAJFDuwPCC0FTYo4fn1e3uI
 s1CTmTsDmagga6aJHV+Yk06sl48ukQqYF+snohlypTnLYBh3kFsu0+Vl/rnjB6qiQbC7Gs
 3Oau4IUNNpISvb6H+8sUYc4Rgv8v+YlglKv3eD+X7ZBnkAFrixQVuWgmiZaHud+/+Kol38
 DOK/2mOzf6RuYBOiz1G6juL6hBFIErj1FjtNU/ctqVD1/I8xtYsm9xISDTgnzQ==
ARC-Authentication-Results: i=1; rspamd-7f9bbcf788-8nkdq;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Shelf-Chief: 2dc2997b5cabc903_1668433893460_1824083079
X-MC-Loop-Signature: 1668433893459:1603757137
X-MC-Ingress-Time: 1668433893459
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.97.48.91 (trex/6.7.1); Mon, 14 Nov 2022 13:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fBWz1zmXRoAghBo/o/i3iFYZ8muec8TtN3QVBqai9jU=; b=GuF3JwLqnx5OmlLJmfqYXJ9JHA
 RYagNtD3spAtepfBJBtkfBAZC1QIheHGihDKYHaOForUFG84NzGRnZs82C63CsO0XeNu/DBlOe3Fb
 thHTvReqZvOPCw1WfL8cMKGWDGmdV1OAKYHy08jm2v8zndvSd/a7NYi99MscvmtiBFzVstDCgBYHi
 QGiSZ4Yd9K84g8kdR8C9wjToiySfF5YpydoSxLCDFa4HXO+Y8Qunna+CGFrSxwHorjpydmiJdIafH
 e9xJoeM3lviu9OL9Q4QBOeIugoUDt74FtegpkGKNNU/KQW7sxo3pZERIIK/u+uTfNZsR/RYgChVqr
 UAwCGjKw==;
Received: from 35.201.90.79.rev.sfr.net ([79.90.201.35]:50660
 helo=palmier.tima.u-ga.fr)
 by hp220.hostpapa.com with esmtpa (Exim 4.95)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1ouZs3-00FefJ-12; Mon, 14 Nov 2022 14:51:31 +0100
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: Alistair.Francis@wdc.com,
	bin.meng@windriver.com,
	palmer@dabbelt.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/intc: sifive_plic: Renumber the S irqs for numa support
Date: Mon, 14 Nov 2022 14:51:22 +0100
Message-Id: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.209.14;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=bee.birch.relay.mailchannels.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 14 Nov 2022 23:15:06 -0000

Commit 40244040a7a changed the way the S irqs are numbered. This breaks when
using numa configuration, e.g.:
./qemu-system-riscv64 -nographic -machine virt,dumpdtb=numa-tree.dtb \
                      -m 2G -smp cpus=16 \
		      -object memory-backend-ram,id=mem0,size=512M \
		      -object memory-backend-ram,id=mem1,size=512M \
		      -object memory-backend-ram,id=mem2,size=512M \
		      -object memory-backend-ram,id=mem3,size=512M \
		      -numa node,cpus=0-3,memdev=mem0,nodeid=0 \
		      -numa node,cpus=4-7,memdev=mem1,nodeid=1 \
		      -numa node,cpus=8-11,memdev=mem2,nodeid=2 \
		      -numa node,cpus=12-15,memdev=mem3,nodeid=3
leads to:
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
found

This patch makes the nubering of the S irqs identical to what it was before.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..b4949bef97 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
         CPUState *cpu = qemu_get_cpu(cpu_num);
 
         if (plic->addr_config[i].mode == PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
         }
         if (plic->addr_config[i].mode == PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
         }
     }
-- 
2.37.2


