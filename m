Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o2Ju8-0006Co-TH
	for mharc-qemu-riscv@gnu.org; Fri, 17 Jun 2022 17:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1o2Ju4-0006Bl-DF
 for qemu-riscv@nongnu.org; Fri, 17 Jun 2022 17:53:20 -0400
Received: from sender-of-o50.zoho.in ([103.117.158.50]:2927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1o2Ju2-0005rr-7w
 for qemu-riscv@nongnu.org; Fri, 17 Jun 2022 17:53:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1655502791; cv=none; d=zohomail.in; s=zohoarc; 
 b=eI7RIAvivd+F6jUfdy044zYSxMuHkDeKh+47sFfvoF6rQ0tG/KJB5moLPdoO/YmZ2Y9UCbKvCsDbpUk0TmBfL+WiJWR2P6xJt/brcClNEK2Yge5h3k8+EtR3AmAQr6MnxnfPdWhXWKLoOezX3Rd1i/kZPegTmHa09wOQDfw0bJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1655502791;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=/V4L3jWumjS+vBgA+d/M+7x1rDxv1+agZXey7TPlorA=; 
 b=HNBqa3Hm5+z9yn4Lgbw1g/SE+DTmZrw8f78BQQPlqCDCGux2614QJ/Kq1lHLkRz1koCGK2CFIiL7myjar52sXZtDDyerqF1h41DtFjdZGPi2i3OyBmubjZSiANV9+D3ctk4lHo5z2VoyA0elsWnrMDIL6q/9rbx1pY86XLibbB4=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1655502791; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=/V4L3jWumjS+vBgA+d/M+7x1rDxv1+agZXey7TPlorA=;
 b=rI6wEYi5g8juLUSfzcwUax39RnBpms+gWETthpaGV9XUygxGKnJ3O1QOs5HTRmVI
 oO8z+rn4cE3zYsBmdImmAIXrz5rYRAriWKH7A4ApupjKFx0mBQ7GzNc30f3SPIbERM4
 /0FMStKULSN0JUXRfYGvEbssLiOCk41DApAq7pj0=
Received: from localhost.localdomain (49.207.195.97 [49.207.195.97]) by
 mx.zoho.in with SMTPS id 1655502789428493.55113414367486;
 Sat, 18 Jun 2022 03:23:09 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Cc: Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20220617215306.75384-1-vijai@behindbytes.com>
Subject: [PATCH] include/hw/riscv: QOMify shakti_c
Date: Sat, 18 Jun 2022 03:23:06 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.50;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o50.zoho.in
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jun 2022 21:53:20 -0000

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 include/hw/riscv/shakti_c.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index daf0aae13f..2b50f1a2a7 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -1,7 +1,7 @@
 /*
  * Shakti C-class SoC emulation
  *
- * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ * Copyright (c) 2021-2022 Vijai Kumar K <vijai@behindbytes.com>
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -22,12 +22,12 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
 #include "hw/char/shakti_uart.h"
+#include "qom/object.h"
=20
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
-#define RISCV_SHAKTI_SOC(obj) \
-    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiCSoCState, RISCV_SHAKTI_SOC)
=20
-typedef struct ShaktiCSoCState {
+struct ShaktiCSoCState {
     /*< private >*/
     DeviceState parent_obj;
=20
@@ -37,18 +37,18 @@ typedef struct ShaktiCSoCState {
     ShaktiUartState uart;
     MemoryRegion rom;
=20
-} ShaktiCSoCState;
+};
=20
 #define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
-#define RISCV_SHAKTI_MACHINE(obj) \
-    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
-typedef struct ShaktiCMachineState {
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiCMachineState, RISCV_SHAKTI_MACHINE)
+
+struct ShaktiCMachineState {
     /*< private >*/
     MachineState parent_obj;
=20
     /*< public >*/
     ShaktiCSoCState soc;
-} ShaktiCMachineState;
+};
=20
 enum {
     SHAKTI_C_ROM,
--=20
2.25.1



