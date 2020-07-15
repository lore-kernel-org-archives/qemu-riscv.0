Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvi1l-0007SC-4j
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jul 2020 10:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1j-0007OW-Nv
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44004
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1h-0007JB-G2
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkBlyp40DiIM7TNyjoB2z5dsCGgUHKGkbokmCXgV6lk=;
 b=fPaN07xLwRJtlwtZI2esQOj7uwYM0SPXDfC/uXiMTPpZ1xoCklfl6ZP/RErfk4dEqyda+S
 cghH6lyUTLuHdvBsnjNMNiUt8DlFLLIlLMBzLECTmUq5yJfFsJKU4L6sQQ5OYv3sw7xI9h
 hKb964MOdVPArAfMkC0z8sIrmwD24tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-M1RE-x-FPd2E0MSC6IETBw-1; Wed, 15 Jul 2020 10:04:44 -0400
X-MC-Unique: M1RE-x-FPd2E0MSC6IETBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD5EB18C63C6;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3E479D00;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ABBD4113860C; Wed, 15 Jul 2020 16:04:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, nieklinnenbank@gmail.com,
 sundeep.lkml@gmail.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 mark.cave-ayland@ilande.co.uk, palmer@dabbelt.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, thuth@redhat.com
Subject: [PATCH for-5.1 2/2] hw: Mark nd_table[] misuse in realize methods
 FIXME
Date: Wed, 15 Jul 2020 16:04:40 +0200
Message-Id: <20200715140440.3540942-3-armbru@redhat.com>
In-Reply-To: <20200715140440.3540942-1-armbru@redhat.com>
References: <20200715140440.3540942-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 15 Jul 2020 14:04:52 -0000

nd_table[] contains NIC configuration for boards to pick up.  Device
code has no business looking there.  Several devices do it anyway.
Two of them already have a suitable FIXME comment: "allwinner-a10" and
"msf2-soc".  Copy it to the others: "allwinner-h3", "xlnx-versal",
"xlnx,zynqmp", "sparc32-ledma", "riscv.sifive.u.soc".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/allwinner-h3.c | 1 +
 hw/arm/xlnx-versal.c  | 1 +
 hw/arm/xlnx-zynqmp.c  | 1 +
 hw/dma/sparc32_dma.c  | 1 +
 hw/riscv/sifive_u.c   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 8e09468e86..ff92ded82c 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -358,6 +358,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
                               "sd-bus");
 
     /* EMAC */
+    /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_SUN8I_EMAC);
         qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index ead038b971..e3aa4bd1e5 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -160,6 +160,7 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
         object_initialize_child(OBJECT(s), name, &s->lpd.iou.gem[i],
                                 TYPE_CADENCE_GEM);
         dev = DEVICE(&s->lpd.iou.gem[i]);
+        /* FIXME use qdev NIC properties instead of nd_table[] */
         if (nd->used) {
             qemu_check_nic_model(nd, "cadence_gem");
             qdev_set_nic_properties(dev, nd);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 772cfa3771..5855e5d5bf 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -455,6 +455,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
         NICInfo *nd = &nd_table[i];
 
+        /* FIXME use qdev NIC properties instead of nd_table[] */
         if (nd->used) {
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 9459178866..bcd1626fbd 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -341,6 +341,7 @@ static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
     DeviceState *d;
     NICInfo *nd = &nd_table[0];
 
+    /* FIXME use qdev NIC properties instead of nd_table[] */
     qemu_check_nic_model(nd, TYPE_LANCE);
 
     d = qdev_new(TYPE_LANCE);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 19a976c9a6..e5682c38a9 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -714,6 +714,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
+    /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd->used) {
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(DEVICE(&s->gem), nd);
-- 
2.26.2


