Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADBDD3B987
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFtgd-0007Yt-Km; Tue, 26 Nov 2024 06:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfZ-0004PI-0T
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:23:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfV-0002wl-NA
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:23:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38232cebb0cso4206870f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620224; x=1733225024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbkFF2paUrkpAUmAqN3hhRRzk+I4qHRGaYiXnMozHls=;
 b=a12MTDIbHYNk/5NKUibpm6rJS/qv7ZIcaCul2JsIsHp8H6rniRJKhtQSoExIbk6Vb8
 oANoPtmBHYinCFRgX3+KTTosrbWK/ubV7pYTgswhBL0hpPU21uFoJUFzclzoML7fCFfa
 BvXyjo06bS0rJFkWqq34KuqpiJXjCTiuERYonAEQBSLJWvzn3+krkmEWR4+GvyS7upgo
 G1lrVmCqozSgY3fgZerC3Kdex1qWwXqyTtnZkz5DkDLUO/oY31Nl54HYvLwOoy3c6YXI
 dmoXFfNU4SYC38Aof1qlAu/cEM82hH5pnt+hzyFhem8YR9i10jSBfmfT5LGYnl2da/VO
 slmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620224; x=1733225024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbkFF2paUrkpAUmAqN3hhRRzk+I4qHRGaYiXnMozHls=;
 b=UdNK38LBe6d3hs4vqAUZaLrPd1zCDbXG70opKsS4Mbw2e/VbgQyAUeUhNTWbsMhDwD
 4+UJiagvab0qLetpXv0q8hS+5NK7pBwYsIche9UR8ivacy22jwtgVPdvlhBSGL/GIKLq
 +vuJyFHC/n3ySOGVZwPXye9PwHp5p/EHgA8sO8hb9Qv9zJ1YkBMTscQdrbKPhTYZCJ7+
 TFGgQh8e7VWKdi6sr7xSlB8rnA30NBCXMoGDe7XTuNyQHqnDjVEuoe/JVTQtQ+23ra6q
 WXAZPmT4ZsMMD2b0+AGpLTo5VSH8klSK/YnopRZ2dJ79pv1Xd40WrrjzrrRDFkqYUMeQ
 ycxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRLDVJPRKhFtVPhsaienIX+D9xaQAQU3SziVIKk9I0CrrZmrD9Nl/LlzrkngzmovM8/nnrElAWo4X/@nongnu.org
X-Gm-Message-State: AOJu0Yz73k2b3pTGHJ+gBYfNbGpXd6OYMhM15YWISAzoFY/BHY4YMjnF
 HN2Ra09aQkQbZOK/5e9TBn/5LqrgqM1JUXK2zyx+thzxOtlK676uUc2vkXQFvtc=
X-Gm-Gg: ASbGnctGNh7R/JIls/nU3nYsFtmdrokARAhXRsaKHYZfYl+e+MaBU7T8HWX2Y46r8YR
 7DK2aBvC9zDKn9s/oO4lVL9Rts0kIcEx3wMBYlwmMKLcCzKP6HfOY5AniycoU6DIgthwTWKF8kn
 UYlZsj9SeUWc9MwDs4+usknwgzpM8bpM8pPGwBLY51eseyCMFYhv+sxV5IzzayAKiq5prn118u4
 cbHjruw1BBG+TKLDkv6jveLQzNhOXB1TJPc17PaybiQ8PhgCBRY4V0dvQCh1uDnwmLakDNQ
X-Google-Smtp-Source: AGHT+IGVJGQGmqR2LIP3EyCzcTfjg1DnII8zvKaRsbXqZxvrY+rrJa/LEXrhLDekfN1yenvhqiAMhw==
X-Received: by 2002:adf:e18c:0:b0:382:2d59:b166 with SMTP id
 ffacd0b85a97d-38260b83dfbmr13189768f8f.31.1732620224148; 
 Tue, 26 Nov 2024 03:23:44 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6441sm13364242f8f.4.2024.11.26.03.23.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:23:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 10/13] hw/pci-host/gpex: Expose
 'refuse-bar-at-addr-0' property
Date: Tue, 26 Nov 2024 12:22:09 +0100
Message-ID: <20241126112212.64524-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Expose the "refuse-bar-at-addr-0" property so machines
using a GPEX host bridge can set this flag on the bus.
While the default property is set to 'false', all caller
set it to 'true' so there is no logical change so far.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci-host/gpex.h | 1 +
 hw/arm/sbsa-ref.c          | 2 ++
 hw/arm/virt.c              | 2 ++
 hw/i386/microvm.c          | 2 ++
 hw/loongarch/virt.c        | 2 ++
 hw/mips/loongson3_virt.c   | 2 ++
 hw/openrisc/virt.c         | 2 ++
 hw/pci-host/gpex.c         | 4 +++-
 hw/riscv/virt.c            | 2 ++
 hw/xen/xen-pvh-common.c    | 2 ++
 hw/xtensa/virt.c           | 2 ++
 11 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index dce883573ba..44c6463afb3 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -64,6 +64,7 @@ struct GPEXHost {
     int irq_num[GPEX_NUM_IRQS];
 
     bool allow_unmapped_accesses;
+    bool refuse_bar_at_addr_0;
 
     struct GPEXConfig gpex_cfg;
 };
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d54497..f6cf43cf0c9 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map ECAM space */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a381e9a2bd..06affc3638b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1510,6 +1510,8 @@ static void create_pcie(VirtMachineState *vms)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 86637afa0f3..2231fd8f9cf 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -108,6 +108,8 @@ static void create_gpex(MicrovmMachineState *mms)
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map only the first size_ecam bytes of ECAM space */
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9a635d1d3d3..b5a26d3c23d 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -712,6 +712,8 @@ static void virt_devices_init(DeviceState *pch_pic,
     int i;
 
     gpex_dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(gpex_dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     d = SYS_BUS_DEVICE(gpex_dev);
     sysbus_realize_and_unref(d, &error_fatal);
     pci_bus = PCI_HOST_BRIDGE(gpex_dev)->bus;
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index f3b6326cc59..21af0b5bc86 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -430,6 +430,8 @@ static inline void loongson3_virt_devices_init(MachineState *machine,
     LoongsonMachineState *s = LOONGSON_MACHINE(machine);
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     pci_bus = PCI_HOST_BRIDGE(dev)->bus;
 
diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 47d2c9bd3c7..cde9379a992 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -380,6 +380,8 @@ static void openrisc_virt_pcie_init(OR1KVirtState *state,
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map ECAM space. */
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 299f4d4f840..b888f4e831d 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -136,7 +136,7 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     pci->bus = pci_register_root_bus(dev, "pcie.0", gpex_set_irq,
                                      pci_swizzle_map_irq_fn, s, &s->io_mmio,
                                      &s->io_ioport, 0, 4, TYPE_PCIE_BUS,
-                                     true);
+                                     s->refuse_bar_at_addr_0);
 
     pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
     qdev_realize(DEVICE(&s->gpex_root), BUS(pci->bus), &error_fatal);
@@ -155,6 +155,8 @@ static Property gpex_host_properties[] = {
      */
     DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
                      allow_unmapped_accesses, true),
+    DEFINE_PROP_BOOL("refuse-bar-at-addr-0", GPEXHost,
+                     refuse_bar_at_addr_0, false),
     DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base, 0),
     DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0),
     DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0),
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 45a8c4f8190..8999fc348cb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1158,6 +1158,8 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                             pio_base, NULL);
     object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 218ac851cf7..3131a2dd280 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -139,6 +139,8 @@ static inline void xenpvh_gpex_init(XenPVHMachineState *s,
 
     object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
                             TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(s), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     dev = DEVICE(&s->pci.gpex);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 5310a888613..dcb39a67868 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -62,6 +62,8 @@ static void create_pcie(MachineState *ms, CPUXtensaState *env, int irq_base,
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map only the first size_ecam bytes of ECAM space. */
-- 
2.45.2


