Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E090C88E45
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 14:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x52UK-0004CF-7G; Fri, 11 Sep 2026 10:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52OH-000393-Ik
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1x52OC-0008Ts-V9
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 10:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789137484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4kE0kwvfDbuBRKymnLbUvEO8flRNgMjBGhpmSiGsh0=;
 b=WfAG/Gc4hh5sW86UmGnypDJmLpmUnsNQ/SBR5R1DgQaTLmKQz3QZwX9inGPc9SjbzNsTyV
 Bc1Y+vAARaB6YG4jLFy+UHW9n3pZ6jwyQQJ4RAo/65PzOlsnVL5/00NvUHytDHT2TyU7Jj
 gBDyxxlx4imc4ziVa9/g2jnIsD3RrvE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-Woi66CdzNE63mR1L80XvTw-1; Fri,
 11 Sep 2026 10:37:58 -0400
X-MC-Unique: Woi66CdzNE63mR1L80XvTw-1
X-Mimecast-MFC-AGG-ID: Woi66CdzNE63mR1L80XvTw_1789137476
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F99F195395E; Fri, 11 Sep 2026 14:37:33 +0000 (UTC)
Received: from berrange.csb (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 42B0C3000229; Fri, 11 Sep 2026 14:37:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 28/28] hw/i386: mark vmmouse / vmport as secure
Date: Fri, 11 Sep 2026 15:36:27 +0100
Message-ID: <20260911143627.2743803-29-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-1-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: FnxrQU50wQOO5a570V9VdEyAPmGjd2bLD5yBlthq83Q_1789137476
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

These paravirtualized devices are relevant to virtualization
use cases.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/vmmouse.c | 1 +
 hw/i386/vmport.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index e289bce8e2..612e7f7d3b 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -390,6 +390,7 @@ static const TypeInfo vmmouse_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(VMMouseState),
     .class_init    = vmmouse_class_initfn,
+    .secure        = true,
 };
 
 static void vmmouse_register_types(void)
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 865e0e70db..24c4fb27a3 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -301,6 +301,7 @@ static const TypeInfo vmport_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(VMPortState),
     .class_init    = vmport_class_initfn,
+    .secure        = true,
 };
 
 static void vmport_register_types(void)
-- 
2.55.0


