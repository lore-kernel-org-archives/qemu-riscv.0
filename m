Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FB7C001DF
	for <qemu-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 16:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qub3G-0000PU-1U; Sun, 22 Oct 2023 12:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual4-0004rZ-UE; Sun, 22 Oct 2023 11:52:55 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual0-0000Af-1v; Sun, 22 Oct 2023 11:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9qWbK+XlQ4g+snp8vZ6Q76nLv7WCuuiJelCPcWERw+E=; b=TH0DfNv+/GkrIUofo1aPAcDDb4
 PG7p3nn76qfe5trIKXpIKgCOdMA7VCkEXLmPHf6YAhBLZiWfHtUY5SMAmXIeAltfrEMfIpKFBvNh0
 BqfK3W7wLO8py6AAGGLc7xbtTtbVmZFiiaUPKaqvFT/MVb6qkqawlYDRoO3ivslXPp34+KDjV9dVj
 V1E7zn3zD3cZZQ4Af7UTo4anky3ZvbSDaeyCXNX/Yvjb2mqXqGofbI/DtnGjKPYVUqliSPUjUxOki
 AQOrEbXCu2H7uV9fodBW1G6PursGXHXvyzoxZFEOvfq9MqMmuizPfSimjBbTRs28WxLdc+BeHmnyS
 Co3VHILg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCmi-0T; Sun, 22 Oct 2023 15:52:10 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakG-001qYR-2u; Sun, 22 Oct 2023 16:52:04 +0100
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
Subject: [PATCH 04/45] hw/pci: add pci_init_nic_devices(),
 pci_init_nic_in_slot()
Date: Sun, 22 Oct 2023 16:51:19 +0100
Message-Id: <20231022155200.436340-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

The loop over nd_table[] to add PCI NICs is repeated in quite a few
places. Add a helper function to do it.

Some platforms also try to instantiate a specific model in a specific
slot, to match the real hardware. Add pci_init_nic_in_slot() for that
purpose.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/pci/pci.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h |  4 +++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b0d21bf43a..904f189d30 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1932,6 +1932,51 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     return pci_dev;
 }
 
+void pci_init_nic_devices(PCIBus *bus, const char *default_model)
+{
+    qemu_create_nic_bus_devices(&bus->qbus, TYPE_PCI_DEVICE, default_model,
+                                "virtio", "virtio-net-pci");
+}
+
+bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
+                          const char *alias, const char *devaddr)
+{
+    NICInfo *nd = qemu_find_nic_info(model, true, alias);
+    int dom, busnr, devfn;
+    PCIDevice *pci_dev;
+    unsigned slot;
+    PCIBus *bus;
+
+    if (!nd) {
+        return false;
+    }
+
+    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
+        error_report("Invalid PCI device address %s for device %s",
+                     devaddr, model);
+        exit(1);
+    }
+
+    if (dom != 0) {
+        error_report("No support for non-zero PCI domains");
+        exit(1);
+    }
+
+    devfn = PCI_DEVFN(slot, 0);
+
+    bus = pci_find_bus_nr(rootbus, busnr);
+    if (!bus) {
+        error_report("Invalid PCI device address %s for device %s",
+                     devaddr, model);
+        exit(1);
+    }
+
+    pci_dev = pci_new(devfn, model);
+    qdev_set_nic_properties(&pci_dev->qdev, nd);
+    pci_realize_and_unref(pci_dev, bus, &error_fatal);
+    return true;
+}
+
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
     vga_interface_created = true;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b70a0b95ff..76d3ddab25 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -320,7 +320,9 @@ void pci_device_reset(PCIDevice *dev);
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
                                const char *default_devaddr);
-
+void pci_init_nic_devices(PCIBus *bus, const char *default_model);
+bool pci_init_nic_in_slot(PCIBus *rootbus, const char *default_model,
+                          const char *alias, const char *devaddr);
 PCIDevice *pci_vga_init(PCIBus *bus);
 
 static inline PCIBus *pci_get_bus(const PCIDevice *dev)
-- 
2.40.1


