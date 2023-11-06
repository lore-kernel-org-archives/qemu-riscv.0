Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FA8C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 20:00:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r05hb-0001K7-TA; Mon, 06 Nov 2023 14:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05gr-0006N8-Pm; Mon, 06 Nov 2023 14:55:21 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05gj-00065W-S8; Mon, 06 Nov 2023 14:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GDtrv5GSjA400CLJSMbKuasKGDSmgWJXtlHBLRSiC9o=; b=O65gB/NMeHk0pDk66c4543YPTN
 dCsd0FF68SdwaefhDnsvm+bQXVXdLxqE42V5S2xHeiaL98Ca6P3X2IvdOpHGgI0Q6aSnct7FPITfB
 +lb89XQd1MZv8RvJDO/P9NIiwhRKDpZIaOrTGXnkuYhDX1kHDSsH2tzYn3Rgj8IrpdC1o6cUSdW87
 VvNoGoiN2tOz5H8+vXXbfyZ2qfpsDdXPdjrBTEjPImCLiJ29gXxSb1NeKCoZFkTItmQ/lU/fby3IM
 +KYCRHFexwezBgIxpVevVmNyi5dsqNPNXfbY3dTDV9MAzbPNv40sA6zxjzSm8kWXMUt6vU4W63NH1
 MasqHlug==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fc-00AkG4-34; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GOw-1N; Mon, 06 Nov 2023 19:54:00 +0000
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
Subject: [PATCH for-8.3 v2 33/46] hw/m68k/q800: use qemu_find_nic_info()
Date: Mon,  6 Nov 2023 19:49:38 +0000
Message-ID: <20231106195352.301038-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

If a corresponding NIC configuration was found, it will have a MAC address
already assigned, so use that. Else, generate and assign a default one.

Using qemu_find_nic_info() is simpler than the alternative of using
qemu_configure_nic_device() and then having to fetch the "mac" property
as a string and convert it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/m68k/q800.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1d7cd5ff1c..165def9c35 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -48,6 +48,7 @@
 #include "hw/display/macfb.h"
 #include "hw/block/swim.h"
 #include "net/net.h"
+#include "net/util.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
@@ -271,6 +272,8 @@ static void q800_machine_init(MachineState *machine)
     BusState *adb_bus;
     NubusBus *nubus;
     DriveInfo *dinfo;
+    NICInfo *nd;
+    MACAddr mac;
     uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
@@ -371,13 +374,6 @@ static void q800_machine_init(MachineState *machine)
 
     /* MACSONIC */
 
-    if (nb_nics > 1) {
-        error_report("q800 can only have one ethernet interface");
-        exit(1);
-    }
-
-    qemu_check_nic_model(&nd_table[0], "dp83932");
-
     /*
      * MacSonic driver needs an Apple MAC address
      * Valid prefix are:
@@ -387,14 +383,21 @@ static void q800_machine_init(MachineState *machine)
      * 08:00:07 Apple
      * (Q800 use the last one)
      */
-    nd_table[0].macaddr.a[0] = 0x08;
-    nd_table[0].macaddr.a[1] = 0x00;
-    nd_table[0].macaddr.a[2] = 0x07;
-
     object_initialize_child(OBJECT(machine), "dp8393x", &m->dp8393x,
                             TYPE_DP8393X);
     dev = DEVICE(&m->dp8393x);
-    qdev_set_nic_properties(dev, &nd_table[0]);
+    nd = qemu_find_nic_info(TYPE_DP8393X, true, "dp83932");
+    if (nd) {
+        qdev_set_nic_properties(dev, nd);
+        memcpy(mac.a, nd->macaddr.a, sizeof(mac.a));
+    } else {
+        qemu_macaddr_default_if_unset(&mac);
+    }
+    mac.a[0] = 0x08;
+    mac.a[1] = 0x00;
+    mac.a[2] = 0x07;
+    qdev_prop_set_macaddr(dev, "mac", mac.a);
+
     qdev_prop_set_uint8(dev, "it_shift", 2);
     qdev_prop_set_bit(dev, "big_endian", true);
     object_property_set_link(OBJECT(dev), "dma_mr",
@@ -415,7 +418,7 @@ static void q800_machine_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = revbit8(nd_table[0].macaddr.a[i]);
+        prom[i] = revbit8(mac.a[i]);
         checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
-- 
2.41.0


