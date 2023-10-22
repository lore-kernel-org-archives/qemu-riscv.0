Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FEEC001DF
	for <qemu-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 16:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qub2d-0008Fb-Oy; Sun, 22 Oct 2023 12:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1quakq-0004lU-27; Sun, 22 Oct 2023 11:52:40 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1quako-00004r-EV; Sun, 22 Oct 2023 11:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EKjUCJKBd59P5cxJriDQFHF8sC3eB1BsnLW5Qch037k=; b=e2JwP3XOgcXNON2SV6S2by6iep
 34RgR39w+QTHdRpz5G3wLXbMGlpp2OwdWSD9zMC6mvvrB+qLY51mUjqzSevFFcVGrhD5lLVASVd+M
 TocwJShtBzKiZHJc8O405sOaERHgF8FZ/coOBR9VscvMhBhNr3m6mdkbeSgbTvkqfR2f2A9zY3bJm
 PHYRa4R7Ch6xFN3DXVUBzsitmK3COPKihJsAOj1x1FaOnhGhUow5RVvQKUAdbH1amNQ0Sksw++I22
 kolSa9ChKkx/F2TH+Omzll1cVli0qmDpwvXmwqaq8rcnknRrbhxXZfKL8gAkqdsZXrcy9isSlQO1A
 UbLogmLQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakJ-008TGW-Gu; Sun, 22 Oct 2023 15:52:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qZr-0Z; Sun, 22 Oct 2023 16:52:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 24/45] hw/arm/fsl: use qemu_configure_nic_device()
Date: Sun, 22 Oct 2023 16:51:39 +0100
Message-Id: <20231022155200.436340-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 22 Oct 2023 12:11:02 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/fsl-imx25.c  | 2 +-
 hw/arm/fsl-imx6.c   | 2 +-
 hw/arm/fsl-imx6ul.c | 2 +-
 hw/arm/fsl-imx7.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..28084d2e5a 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -170,7 +170,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num, &err);
-    qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->fec), true, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
         return;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4fa7f0b95e..273bc79283 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -380,7 +380,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num, &err);
-    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
+    qemu_configure_nic_device(DEVICE(&s->eth), true, NULL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
         return;
     }
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e37b69a5e1..ca3dd439ec 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -442,7 +442,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX6UL_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 474cfdc87c..1acbe065db 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -446,7 +446,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                                  s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX7_ETH_NUM_TX_RINGS, &error_abort);
-        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
         sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
-- 
2.40.1


