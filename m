Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46732C88E50
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 14:44:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x52TT-0000a8-1h; Fri, 11 Sep 2026 10:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52NP-0002lH-Io
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52ND-00080Z-Ev
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789137422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj/OwkAk1e+UKX4NrQR8oViEsggR98ARpU/Hmyqd04o=;
 b=ccE1JuTuzSduEDnf/o7yczyy0WrOl8Ces1Cn+JQsZZOCM9GX6UqXxU+fVm004s50ZWoTY7
 bX1p6m2gZSW1lYIc/0QamZdIEerjIHkBo++2HDDhc+jU9fBsIcMspNuiywEkr3GJLoUPOv
 1DosZYbrKBz+StpOtLiYoN2uIy3JQgc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-teOpK41IPpaV3nA4a5Tv8Q-1; Fri,
 11 Sep 2026 10:37:01 -0400
X-MC-Unique: teOpK41IPpaV3nA4a5Tv8Q-1
X-Mimecast-MFC-AGG-ID: teOpK41IPpaV3nA4a5Tv8Q_1789137420
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1159919560BC; Fri, 11 Sep 2026 14:37:00 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3599A300022B; Fri, 11 Sep 2026 14:36:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 13/28] hw/scsi: mark SCSI disk endpoint devices as secure
Date: Fri, 11 Sep 2026 15:36:12 +0100
Message-ID: <20260911143627.2743803-14-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: KvtlRSyUNkvfuWWRHUBdYj5-_JKH_SPA9gdYSnrdMSY_1789137420
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

All these devices can be used together with supported SCSI controllers
in a virtualization use case, so must be treated as secure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/scsi/scsi-disk.c    | 4 ++++
 hw/scsi/scsi-generic.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a42f7d8e77..4474400a38 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -3218,6 +3218,7 @@ static const TypeInfo scsi_disk_base_info = {
     .instance_size = sizeof(SCSIDiskState),
     .class_size    = sizeof(SCSIDiskClass),
     .abstract      = true,
+    .secure        = true,
 };
 
 #define DEFINE_SCSI_DISK_PROPERTIES()                                   \
@@ -3338,6 +3339,7 @@ static const TypeInfo scsi_hd_info = {
     .name          = "scsi-hd",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_hd_class_initfn,
+    .secure        = true,
 };
 
 static const Property scsi_cd_properties[] = {
@@ -3381,6 +3383,7 @@ static const TypeInfo scsi_cd_info = {
     .name          = "scsi-cd",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_cd_class_initfn,
+    .secure        = true,
 };
 
 #ifdef __linux__
@@ -3423,6 +3426,7 @@ static const TypeInfo scsi_block_info = {
     .name          = "scsi-block",
     .parent        = TYPE_SCSI_DISK_BASE,
     .class_init    = scsi_block_class_initfn,
+    .secure        = true,
 };
 #endif
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 8999f3b720..5588400b60 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -1225,6 +1225,7 @@ static const TypeInfo scsi_generic_info = {
     .parent        = TYPE_SCSI_DEVICE,
     .instance_size = sizeof(SCSIDevice),
     .class_init    = scsi_generic_class_initfn,
+    .secure        = true,
 };
 
 static void scsi_generic_register_types(void)
-- 
2.55.0


