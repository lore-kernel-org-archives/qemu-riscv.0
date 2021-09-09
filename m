Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOHpr-0001yU-Dt
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 07:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpq-0001wJ-Mk
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpT-00029w-Ac
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id k24so1387646pgh.8
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U7O8e6aOZdYzwT4/6Bl910X1s+CPVyPB0Rr1jWR3b8I=;
 b=iEu9l/v4d0gDrMwDrPfIIbHYy5TSkY25ryUXv+RiEiATe1qM/Yyo2QiawhcM/YChfK
 hmKghwUE094TgQXFcZC9nqdcRmNyzEl3zshIdD3UYm+CY0l7CgyAEIuMhTXaY+K1SfCB
 CIj6hViG74lbAKWqn+ToEu7qvZX+eKH2x5EEmdlQIUIMwZ+gzJof6JEdZcVidzO+OHZW
 4JW7jbfAVAeP/RqcnBp3H511iyyjcUSWwtWHoSaF1TsJkv6nl/sF8Ndpyk1PkB14h37A
 YmlygyDACmy+dYX5q1hxIo/95mRsvIuRORmbbbYYvp2GzmQhMX7lTtIF7CJnIeaBjIIy
 WGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U7O8e6aOZdYzwT4/6Bl910X1s+CPVyPB0Rr1jWR3b8I=;
 b=OrzfV1FAdJeOkt1NBiED3F0xW+J4c/tjzBGO6ldiwK/nBnBjl/Nv/rnv3CknPv99WF
 IknlM1a7MjorRg2euvam1Xn/y8ijwmidAPbovksoruXFwPN+nJh9BdZJd67tVXAqi/zt
 8G+TfAuiny35bWP7PVcHUVwpyxG7/VL++mFoHr9UhFWRXcppioLfq06EkLOwy59ZPdQV
 8BtA7vRA1A1UQq8mu5+cpWKjEvxlSzK8YTJQOupJ1odidXQ6ndyrpnT1/35CyLSxdzUW
 UXN5Yy07KWcAdw8FCHFN1+Rru25QS5fXzM5ni9uO4w9yDI5PfOlnm3guSKCiKtND2nFT
 yXcQ==
X-Gm-Message-State: AOAM530u2s0Ag9oC29imwJ3p+O3wnsLeF3TAUU4XPhBoyXbGoF9ybx4p
 3N+Aw1b87CDIt7tz9eXigOJi5A==
X-Google-Smtp-Source: ABdhPJwpHtJqy82WMJOdMcn4EbgS54+0MIY7O+eQJcEhrIg52V+FfJpD+N3dQjMYmyy64KZSwkSa0Q==
X-Received: by 2002:a63:6e03:: with SMTP id j3mr2132467pgc.465.1631185369971; 
 Thu, 09 Sep 2021 04:02:49 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.198.246])
 by smtp.googlemail.com with ESMTPSA id g19sm1894103pjl.25.2021.09.09.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 04:02:49 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH v1 1/3] hw/pci/pcie.c: modify PCIe Express capability for
 RCiEP and RCEC
Date: Thu,  9 Sep 2021 16:32:19 +0530
Message-Id: <20210909110221.703-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909110221.703-1-mchitale@ventanamicro.com>
References: <20210909110221.703-1-mchitale@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 09 Sep 2021 11:03:15 -0000

Skip the link and slot capabilities' configuration for PCIe RCiEP
and PCIe RCEC.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 hw/pci/pcie.c         | 22 ++++++++++++++--------
 include/hw/pci/pcie.h |  2 ++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d82903..017d5075ae 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -64,6 +64,8 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
      * Specification revisions.
      */
     pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER);
+    if (type == PCI_EXP_TYPE_RC_EC || type == PCI_EXP_TYPE_RC_END)
+	    return;
 
     pci_set_long(exp_cap + PCI_EXP_LNKCAP,
                  (port << PCI_EXP_LNKCAP_PN_SHIFT) |
@@ -172,8 +174,9 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
     /* Filling values common with v1 */
     pcie_cap_v1_fill(dev, port, type, PCI_EXP_FLAGS_VER2);
 
-    /* Fill link speed and width options */
-    pcie_cap_fill_slot_lnk(dev);
+    if (type != PCI_EXP_TYPE_RC_EC && type != PCI_EXP_TYPE_RC_END)
+        /* Fill link speed and width options */
+        pcie_cap_fill_slot_lnk(dev);
 
     /* Filling v2 specific values */
     pci_set_long(exp_cap + PCI_EXP_DEVCAP2,
@@ -211,10 +214,10 @@ int pcie_cap_v1_init(PCIDevice *dev, uint8_t offset, uint8_t type,
     return pos;
 }
 
-static int
-pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size)
+int
+pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size,
+		uint8_t type)
 {
-    uint8_t type = PCI_EXP_TYPE_ENDPOINT;
     Error *local_err = NULL;
     int ret;
 
@@ -224,7 +227,8 @@ pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size)
      * should instead be Root Complex Integrated Endpoints.
      */
     if (pci_bus_is_express(pci_get_bus(dev))
-        && pci_bus_is_root(pci_get_bus(dev))) {
+        && pci_bus_is_root(pci_get_bus(dev))
+        && type != PCI_EXP_TYPE_RC_EC) {
         type = PCI_EXP_TYPE_RC_END;
     }
 
@@ -243,12 +247,14 @@ pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset, uint8_t cap_size)
 
 int pcie_endpoint_cap_init(PCIDevice *dev, uint8_t offset)
 {
-    return pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER2_SIZEOF);
+    return pcie_endpoint_cap_common_init(dev, offset,
+            PCI_EXP_VER2_SIZEOF, PCI_EXP_TYPE_ENDPOINT);
 }
 
 int pcie_endpoint_cap_v1_init(PCIDevice *dev, uint8_t offset)
 {
-    return pcie_endpoint_cap_common_init(dev, offset, PCI_EXP_VER1_SIZEOF);
+    return pcie_endpoint_cap_common_init(dev, offset,
+            PCI_EXP_VER1_SIZEOF, PCI_EXP_TYPE_ENDPOINT);
 }
 
 void pcie_cap_exit(PCIDevice *dev)
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 6063bee0ec..b40b088604 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -147,4 +147,6 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+int pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset,
+                                         uint8_t cap_size, uint8_t type);
 #endif /* QEMU_PCIE_H */
-- 
2.17.1


