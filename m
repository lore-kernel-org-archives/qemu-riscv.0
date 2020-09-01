Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCvIQ-0005Iu-JA
	for mharc-qemu-riscv@gnu.org; Mon, 31 Aug 2020 21:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvIO-0005Fr-3V; Mon, 31 Aug 2020 21:41:12 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvIK-0005cu-Np; Mon, 31 Aug 2020 21:41:11 -0400
Received: by mail-pg1-x544.google.com with SMTP id d19so1752176pgl.10;
 Mon, 31 Aug 2020 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sAbpCl3RR7KLPH+sRyoheIJi5FuOOV33ufa8wSoG0y8=;
 b=VPmdXOja0GPr7TOExPhgtVmgv3Gww9uRBsphjAFOFo3I5Cn1IBAQPvzetZXoSF9+Zi
 0Z50A0IUL3LV4CBghYAmS6wUuYiGQOhoszwLk2b3Aa0R0bfauv4O32jAuS87wc8nDUFG
 FZ8ODc2AO0+fYVYIpPoht6qAr9/tTWx2gTuPhloi8toJq7Erdr+Vx0UmrkjJsN5NcvU/
 Gv5GpuQIK0BJmEoE6lWpIeMRLf3BXoa3ZT+DJSY66tv4aR26XBmm4FilGNrpL1lCRjmZ
 3PjEKlK27kSh3yoIt4o4C5CTWOfcAbaBIbRxs5wPNHJFsPAQj071J9lMHDVSUmGT3gXs
 MRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sAbpCl3RR7KLPH+sRyoheIJi5FuOOV33ufa8wSoG0y8=;
 b=StqUgd6cfzZ3puUf7vM7AP4S8mu6AvpVZsKxQbqnVITkTlAjwUNJLHsHqDdF0zRql/
 +J5YwtyS6Hjn023NdDAkZQJL1ivgJj/5vYd2uQ5uGB4S26501GomaXqWk9mk9+O38ytz
 cI3YOr6CdYn+CiMhPawy771UcHtLUXYCN3jreK9vTRDBOaLWwRRs7JeXPwl/aPTZuf/Y
 I+mASpZXbDb8ypWmnkMbv94RTj2cE07iGsCCjDJWE4SaVg6f7tt9Wq8dD8SiUiDDoW80
 hXuD2mZc5+mzGJc8vVNgGSpQSSdyfmw9nrLV/YwnP/1tH2Ba9Z9McHxe0koRmniao3Yj
 AiiA==
X-Gm-Message-State: AOAM531Ozpow5bBW5kwZgcUHgSS5TYBcnq+jXqQQx51xinH3IMokybVz
 Tcui+ZV82ztt9U52RiXQ/us=
X-Google-Smtp-Source: ABdhPJzWkTXQ+0Aq10rYZC3/Gj+jLMWtmbAs1YgBumXNa5vgLYYsmAa6PvlLVsSIFcm02NK49pbMNg==
X-Received: by 2002:a63:cd0b:: with SMTP id i11mr3461965pgg.306.1598924466878; 
 Mon, 31 Aug 2020 18:41:06 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id l13sm8887520pgq.33.2020.08.31.18.41.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 18:41:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v3 12/16] hw/arm: xlnx: Set all boards' GEM 'phy-addr'
 property value to 23
Date: Tue,  1 Sep 2020 09:39:07 +0800
Message-Id: <1598924352-89526-13-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Sep 2020 01:41:13 -0000

From: Bin Meng <bin.meng@windriver.com>

When cadence_gem model was created for Xilinx boards, the PHY address
was hard-coded to 23 in the GEM model. Now that we have introduced a
property we can use that to tell GEM model what our PHY address is.
Change all boards' GEM 'phy-addr' property value to 23, and set the
PHY address default value to 0 in the GEM model.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- use the correct (Object *) to set the 'phy-addr' in xlnx-zynqmp.c

 hw/arm/xilinx_zynq.c | 1 +
 hw/arm/xlnx-versal.c | 1 +
 hw/arm/xlnx-zynqmp.c | 2 ++
 hw/net/cadence_gem.c | 6 +++---
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 969ef07..9ffcc56 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -119,6 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(dev, nd);
     }
+    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, base);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index e3aa4bd..12ba6c4 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -165,6 +165,7 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
             qemu_check_nic_model(nd, "cadence_gem");
             qdev_set_nic_properties(dev, nd);
         }
+        object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
         object_property_set_int(OBJECT(dev), "num-priority-queues", 2,
                                 &error_abort);
         object_property_set_link(OBJECT(dev), "dma", OBJECT(&s->mr_ps),
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c435b9d..7885bb1 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -460,6 +460,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
         object_property_set_int(OBJECT(&s->gem[i]), "revision", GEM_REVISION,
                                 &error_abort);
+        object_property_set_int(OBJECT(&s->gem[i]), "phy-addr", 23,
+                                &error_abort);
         object_property_set_int(OBJECT(&s->gem[i]), "num-priority-queues", 2,
                                 &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem[i]), errp)) {
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d80096b..7a53469 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -250,7 +250,7 @@
 #define GEM_PHYMNTNC_REG_SHIFT 18
 
 /* Marvell PHY definitions */
-#define BOARD_PHY_ADDRESS    23 /* PHY address we will emulate a device at */
+#define BOARD_PHY_ADDRESS    0 /* PHY address we will emulate a device at */
 
 #define PHY_REG_CONTROL      0
 #define PHY_REG_STATUS       1
@@ -1446,7 +1446,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
             uint32_t phy_addr, reg_num;
 
             phy_addr = (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == s->phy_addr || phy_addr == 0) {
+            if (phy_addr == s->phy_addr) {
                 reg_num = (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 retval &= 0xFFFF0000;
                 retval |= gem_phy_read(s, reg_num);
@@ -1569,7 +1569,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
             uint32_t phy_addr, reg_num;
 
             phy_addr = (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == s->phy_addr || phy_addr == 0) {
+            if (phy_addr == s->phy_addr) {
                 reg_num = (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 gem_phy_write(s, reg_num, val);
             }
-- 
2.7.4


