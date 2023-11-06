Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA75C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 19:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r05hW-0000t0-Mn; Mon, 06 Nov 2023 14:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gy-0006OR-3u; Mon, 06 Nov 2023 14:55:25 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gn-00066u-UM; Mon, 06 Nov 2023 14:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=53sT3CeDc9xXHXsxnlVgayDW0vZ6KE0BHHmNTnQfdBU=; b=HCwjrtiiJKiyFyU3x/NClKXi9b
 xvqGzELhrV7zmvpEhf70Qpc4Dv6Bo5o9kSmwVqFA/llaL/c2omY3KrJD96KvgRTOK8UqFxoTc5vLU
 HYxEf0aCK3PtGeFMO2Vkokgksqk9hPvQseo+afAp3kFPYf0yPdwUqzW346DhK6YVcENrldih7xm7x
 x0xgLqtgoOLOOlb6WY9heOhN98STW7gpFvgVWOUeuI8AQIfC+OyhKGIejtt0Vqq8iefPcJVNVp9lD
 lTBFgycuq+gi7+El6wIselkcLZRb9qGT/Z8QbjzGdnywxijjdBfaJ27zt09wtODTP4FCDxXeJWoxH
 ecMm0sOQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fa-007taP-Qm; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GNs-08; Mon, 06 Nov 2023 19:53:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
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
Subject: [PATCH for-8.3 v2 19/46] hw/sparc64/sun4u: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:24 +0000
Message-ID: <20231106195352.301038-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

The first sunhme NIC gets placed a function 1 on slot 1 of PCI bus A,
and the rest are dynamically assigned on PCI bus B.

Previously, any PCI NIC would get the special treatment purely by
virtue of being first in the list.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/sparc64/sun4u.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index c871170378..be06278f7d 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -642,29 +642,18 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
 
     memset(&macaddr, 0, sizeof(MACAddr));
     onboard_nic = false;
-    for (i = 0; i < nb_nics; i++) {
-        PCIBus *bus;
-        nd = &nd_table[i];
-
-        if (!nd->model || strcmp(nd->model, mc->default_nic) == 0) {
-            if (!onboard_nic) {
-                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
-                bus = pci_busA;
-                memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
-                onboard_nic = true;
-            } else {
-                pci_dev = pci_new(-1, mc->default_nic);
-                bus = pci_busB;
-            }
-        } else {
-            pci_dev = pci_new(-1, nd->model);
-            bus = pci_busB;
-        }
 
+    nd = qemu_find_nic_info(mc->default_nic, true, NULL);
+    if (nd) {
+        pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
         dev = &pci_dev->qdev;
         qdev_set_nic_properties(dev, nd);
-        pci_realize_and_unref(pci_dev, bus, &error_fatal);
+        pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
+
+        memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
+        onboard_nic = true;
     }
+    pci_init_nic_devices(pci_busB, mc->default_nic);
 
     /* If we don't have an onboard NIC, grab a default MAC address so that
      * we have a valid machine id */
-- 
2.41.0


