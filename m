Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29BFCA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHW6-0002or-12; Mon, 12 Oct 2026 11:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHW3-0002nN-CR
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:00:39 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHW1-00064r-Pt
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:00:39 -0400
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48870973bddso1207117f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817236; x=1792422036;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wDP5WL+nHMCrP+FkWkhyy3PeP+6u4U2NxCql/xvInIk=;
 b=u7LJGEZiTDrybIlQ65eNAa5RetLLbZQQYkUNh/AXsFbk8Be7dReyGhFjJuccbl+hDj
 RhURJIaXznQTLYReGifnDXq+tAFrKB0FdwYx6vWNIdVgOYujU/EKWBV32mxogcEjVdET
 1wh01c8WQfat6RvC6r4Kjy9LuECM9hbsOUol0Ko1vKDMAgysMgUbJdjWNJxXFpbxbZZ5
 OGw/l0QQ3sUSndwy0U3YeBFY0XVtFAJ7tsQv1kt0s61rqja4DK/KBdeIBKOHB/0AO60b
 bkEaXfH20CA60GlRSDIwi/yYXAL6ZSmLCnIWXm66Bjiau0PbcOIViljdzHhdoxh6Lpk9
 5JVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2S7t8vUIY91NtGfirsrF5/aPHCfZK2F1m25Wme9iQkrXk3TCOYHnZBetLp0qieamZ6HrQ+mwPht3e@nongnu.org
X-Gm-Message-State: AFq9FYJ9lXbx36K4OcYeRSvGx58r6JCVWeg3FCBmJwvq5JJouLnDj7Fy
 BWj97lSaXFiYOfRIrypjvg0J01RgbFeNc27JmCNVdNde2VtAN4g4qdxg
X-Gm-Gg: AYBFou2IoGpw/3/ePXMJgzcFeopJT/3rzlI8en8LY/+dtQek31qGjUylMbQ2XDnK+DV
 mv7QltDN6DoPcJil6KZNw0BwQItG/78vrSvb3gHoHM0FV3dPfRZUpcypIqspuhWMQgc7auha87y
 zI0xVB7jlBVz4jnpNBE6y4pitUY5GiXOVDCYwqGNNpaK2uuMkmVpzB1eO3KO287HbGzRysY32Dd
 ICeRDr90mYsTFJFUhsmdBgP0nshKzw5QVysi/6jhHgjq49CFoqEUlEQUEvA551J1ogXI6uNuPV9
 FhKwKQsLbYNV1K/7tahI3+iV2teevNNH+CmL+TtAVJ+tKkPzwFkKBMC5E38R74tAyFeMQwsMJK4
 fOfR84ya04GtisMfLiKFvmum8GdWSavAfFwBMEb1rCYbJYPlt4S7nPUwbhkX9+YNj5jh2SoFWll
 mLFv9wyf9kg2iNmIglRMA4Z43ifVMdcXHe6SdK6691tUwD8ZouAP0XY27PoaiKSa6NK9+oFbzfY
 /CWeUeQQuP/B5lfaFFz1Jy2Y52ArbefVguf8ZbiNHbdVw==
X-Received: by 2002:a05:6000:2dc5:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-48dbaaecd68mr16588887f8f.13.1791817235263; 
 Mon, 12 Oct 2026 08:00:35 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e33c7sm21497260f8f.10.2026.10.12.08.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:00:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:01 +0200
Subject: [PATCH v2 08/50] hw/rtc: ds1338: move TYPE_DS1338 to a public header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-8-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1551;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=CHjHyVACEubRQ9qO4x11bxK9mverbnzeYmmxFnXvHD0=;
 b=yapktyvu/svjNL2CFX5Cpg6XHqC/ipce2Avu9bNxnA+14JfTypvk6lSLDsaLyy9OrJjH7QXfS
 qpkRvmEu7ULC40cJaIK3TCBUkHmftyYUc/s3lfaxWzcUgwE3XqQHnAs
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Move the TYPE_DS1338 type name definition from ds1338.c into a new
include/hw/rtc/ds1338.h header so that boards instantiating the device
no longer need to redefine the type name string locally.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c         |  2 +-
 include/hw/rtc/ds1338.h | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 5f1ee2e410..f8b3340bf0 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
+#include "hw/rtc/ds1338.h"
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qom/object.h"
@@ -29,7 +30,6 @@
 #define HOURS_PM   0x20
 #define CTRL_OSF   0x20
 
-#define TYPE_DS1338 "ds1338"
 OBJECT_DECLARE_SIMPLE_TYPE(DS1338State, DS1338)
 
 struct DS1338State {
diff --git a/include/hw/rtc/ds1338.h b/include/hw/rtc/ds1338.h
new file mode 100644
index 0000000000..f4cfe6a8e7
--- /dev/null
+++ b/include/hw/rtc/ds1338.h
@@ -0,0 +1,20 @@
+/*
+ * MAXIM DS1338 I2C RTC+NVRAM
+ *
+ * Copyright (c) 2009 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_RTC_DS1338_H
+#define HW_RTC_DS1338_H
+
+#define TYPE_DS1338 "ds1338"
+
+#endif

-- 
2.50.1


