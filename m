Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B319C88E45
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 14:42:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x52Qx-0005sf-2H; Fri, 11 Sep 2026 10:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52NK-0002eP-DT
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52NA-0007wJ-85
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789137415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcQmW3FrWiONRvVo20iIDURaSW8/Kg4toOjkYAWSQ3E=;
 b=OGMfJs60YEjJofTCuiNIjNBwVjQ1zUxF8egd2zZ23QzOzjALj6uhqaB5kw0AJHcCHqWf6e
 kxuzdgP2Wkxr6q3Bdhg78XhkfOWccSzuLWrgKGRD14+BHYCz4PtFVXA9h7VPPcJtbDEHdD
 X4Kl1QadD4rxN4sfUKsCmPBztqoh2nQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-RjoLMoGTNgqEVSmrTvbZWw-1; Fri,
 11 Sep 2026 10:36:50 -0400
X-MC-Unique: RjoLMoGTNgqEVSmrTvbZWw-1
X-Mimecast-MFC-AGG-ID: RjoLMoGTNgqEVSmrTvbZWw_1789137408
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 888A219539B0; Fri, 11 Sep 2026 14:36:48 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B23C63000229; Fri, 11 Sep 2026 14:36:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 08/28] hw/xen: mark all Xen related object types as being
 secure
Date: Fri, 11 Sep 2026 15:36:07 +0100
Message-ID: <20260911143627.2743803-9-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: NC_yFZq0dWPlJYDA_HOQsQ6gqMVBKBJ9M5pX4rTkF3Q_1789137408
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

All Xen paravirtualized devices are intended to provide a host /
guest security barrier, so mark all Xen object types as scure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/block/xen-block.c        | 3 +++
 hw/char/xen_console.c       | 1 +
 hw/i386/xen/xen_platform.c  | 1 +
 hw/i386/xen/xen_pvdevice.c  | 1 +
 hw/net/xen_nic.c            | 1 +
 hw/xen/xen-bus.c            | 3 +++
 hw/xen/xen-legacy-backend.c | 3 +++
 hw/xen/xen_pt.c             | 1 +
 8 files changed, 14 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 474c12fe4a..3296e591d4 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -699,6 +699,7 @@ static const TypeInfo xen_block_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenBlockDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(XenBlockDeviceClass),
     .class_init = xen_block_class_init,
 };
@@ -740,6 +741,7 @@ static const TypeInfo xen_disk_type_info = {
     .parent = TYPE_XEN_BLOCK_DEVICE,
     .instance_size = sizeof(XenDiskDevice),
     .class_init = xen_disk_class_init,
+    .secure = true,
 };
 
 static void xen_cdrom_unrealize(XenBlockDevice *blockdev)
@@ -787,6 +789,7 @@ static const TypeInfo xen_cdrom_type_info = {
     .parent = TYPE_XEN_BLOCK_DEVICE,
     .instance_size = sizeof(XenCDRomDevice),
     .class_init = xen_cdrom_class_init,
+    .secure = true,
 };
 
 static void xen_block_register_types(void)
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index bdeb76dc87..df6a708494 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -513,6 +513,7 @@ static const TypeInfo xen_console_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenConsole),
     .class_init = xen_console_class_init,
+    .secure = true,
 };
 
 static void xen_console_register_types(void)
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index c8b852be0c..ec0084d6fb 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -604,6 +604,7 @@ static const TypeInfo xen_platform_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIXenPlatformState),
     .class_init    = xen_platform_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index fab26a06af..74636046d0 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -139,6 +139,7 @@ static const TypeInfo xen_pv_type_info = {
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(XenPVDevice),
     .class_init    = xen_pv_class_init,
+    .secure        = true,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index f4d0b06013..e615303da6 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -579,6 +579,7 @@ static const TypeInfo xen_net_type_info = {
     .parent = TYPE_XEN_DEVICE,
     .instance_size = sizeof(XenNetDev),
     .class_init = xen_netdev_class_init,
+    .secure = true,
 };
 
 static void xen_net_register_types(void)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 1762816bf4..4623995e2c 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -404,6 +404,7 @@ static const TypeInfo xen_bus_type_info = {
     .instance_size = sizeof(XenBus),
     .class_size = sizeof(XenBusClass),
     .class_init = xen_bus_class_init,
+    .secure = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
@@ -1127,6 +1128,7 @@ static const TypeInfo xen_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(XenDevice),
     .abstract = true,
+    .secure = true,
     .class_size = sizeof(XenDeviceClass),
     .class_init = xen_device_class_init,
 };
@@ -1141,6 +1143,7 @@ static const TypeInfo xen_bridge_type_info = {
     .name = TYPE_XEN_BRIDGE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XenBridge),
+    .secure = true,
 };
 
 static void xen_register_types(void)
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 7977b52712..75f8ac7efd 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -648,6 +648,7 @@ static const TypeInfo xendev_type_info = {
     .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(XenLegacyDevice),
+    .secure        = true,
 };
 
 static void xen_sysbus_class_init(ObjectClass *klass, const void *data)
@@ -661,6 +662,7 @@ static const TypeInfo xensysbus_info = {
     .name       = TYPE_XENSYSBUS,
     .parent     = TYPE_BUS,
     .class_init = xen_sysbus_class_init,
+    .secure     = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
@@ -670,6 +672,7 @@ static const TypeInfo xensysbus_info = {
 static const TypeInfo xensysdev_info = {
     .name          = TYPE_XENSYSDEV,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .secure        = true,
 };
 
 static void xenbe_register_types(void)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0fe9c0aada..504c559318 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -1079,6 +1079,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
     .class_size = sizeof(XenPTDeviceClass),
+    .secure = true,
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (const InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.55.0


