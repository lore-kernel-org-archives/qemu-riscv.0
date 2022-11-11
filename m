Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otT0k-0000U2-MA
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 07:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1otT0i-0000TV-SQ; Fri, 11 Nov 2022 07:19:52 -0500
Received: from black.elm.relay.mailchannels.net ([23.83.212.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1otT0g-0000Kx-Ai; Fri, 11 Nov 2022 07:19:52 -0500
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 823913C1BD3;
 Fri, 11 Nov 2022 12:19:39 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 35C193C237E;
 Fri, 11 Nov 2022 12:19:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1668169178; a=rsa-sha256;
 cv=none;
 b=a+yAEgXR8bqVNwXzptZKXi8HCe7XkwvuBG1wai/rLStmlwNr1IpDSeVcnOcUjaNbBP8TQr
 S+Epoop8d6eAt3ojdI0ch/yoV+bhx5BA43WrcyRb9nyUm4dHoRZnzKGTZfR9t97beJORCE
 p99sHdN5DcWq768SaYtaTWMeC6CHZPxHtJjQ8zqbTTYmSJ+NBps20wAdcNqGXPV/ZAxoEe
 c+bc9ti595TfPeg3cN4IDnH300IagUJnpXZ5oGX4m98OdiTLPE1arZXgE6JQvguBFDl9pw
 ThzWVUhYeo1uKbA29DDAcReSmJa11GKD+ZCWgg2SkNfxSEgbjO0vORED4LoaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1668169178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=r1FwpW/EPReNfmClr960YSQTrnH6dDDn3pT0s93/prc=;
 b=6hwtooWmPnUE0ekPcew/GYIDVE9VXAPBVp7pgwOdDfOmqJDS0yPDAc3AqpsU76i7oth6IJ
 owFbQkcP/tYmTMebynoTvz2shk12ea4ES8JuQ0/atXLMQCDv7yz7Nc6yzRhY22fvynvHKQ
 zgJ9v9waeIYTqNJ6jFXVhJJulU4O5GgKOKQlIsYQojYAI+Q3byHR7vr/X/k2rHcpVRd1Iw
 NBHQRqWi4W5xw9sjUr0CUaH4GwAYUVsajarl8T6UbY6l7w0hTQmmDLEU0NtP1D6hJeJ75T
 8NThqXZHCvSJYrZdv7+yRtiUQjGiyI3Vi+NJO3Lnqpc2YjSnPCs/0cBOcZVu6A==
ARC-Authentication-Results: i=1; rspamd-7f9bbcf788-nvvnz;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Stretch-Invention: 6a0f6a7c5d536f90_1668169179184_2628334900
X-MC-Loop-Signature: 1668169179184:4102703633
X-MC-Ingress-Time: 1668169179184
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.123.200.111 (trex/6.7.1); Fri, 11 Nov 2022 12:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3R/kYYYKj94ju+Pw9Fg0tLhS12GjyBLodX3wjlW+hAw=; b=XS/mbq/YWzLG0x9/Hxcf8fpiEv
 kgf0b9givc+5Fm1YtvMq5kF9fVfubhXMgXSSLm/3JZmWe8RFf6O6WY9jORjcN/I/txwUwgTOBzuyz
 wnPaoW3ZYIHv22yetERmvU0TI7vNvYj2BuBzp4F/U2w7350H7epFIgbaKy9WpX3DtvyfTcUyWR5Q/
 EBNJF6c2Tu3yDf4Atf50KjggBxCO5gK1ZdYbGV0e2f9EDtLYXZo0VLvD/mr8C9webjFNBuR4MNyNo
 akUKRnSj0VVJFAX7sUpDlTvi7K7L8L84TfOPecuhZHhkK8vrE46C8g2bwr3RWOn9VyWX6Ki8vgzuJ
 NuVvAW9A==;
Received: from pers-184-216.vpn-inp.grenoble-inp.fr ([147.171.184.216]:55290
 helo=palmier.grenoble-inp.fr)
 by hp220.hostpapa.com with esmtpa (Exim 4.95)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1otT0U-002f2u-LE; Fri, 11 Nov 2022 13:19:37 +0100
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
Date: Fri, 11 Nov 2022 13:19:13 +0100
Message-Id: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.212.19;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=black.elm.relay.mailchannels.net
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
X-List-Received-Date: Fri, 11 Nov 2022 12:19:53 -0000

Commit 40244040 changed the way the S irqs are numbered. This breaks when
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

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 hw/intc/sifive_plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..89d2122742 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -480,7 +480,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
         }
         if (plic->addr_config[i].mode == PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - plic->hartid_base,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
         }
     }
-- 
2.37.2


