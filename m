Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E3E7542D
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnZcA-0007Re-KC; Tue, 03 Oct 2023 03:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZcA-0007R3-8i
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZc8-0001gf-LJ
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso611116f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1696317279; x=1696922079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HOWFAUIjoYOvAaPK+iqc8J3TSNnmeBOgrcE2Swe+lQ=;
 b=CwA26jvo7hlAtBHt0wdwQ0AQ/QA7OiariXhgYZy3JMGKQMUQoGO1HbOSP+aR2NhKuY
 QQCG71b4qW9/G9tvqPczQu26TlacEoyqPu8lK80RqUc1wlMYBEF+xppKdiM490NxrjST
 f16dxJIm5S7Bo1ZTteNpDC5iz1oiJB3Bkb3Qb2SB5XoDtOdxDHgYGgSXZZlVE67jojHV
 9X4BWJATEsZE4MELkbm7bHyi+eFVrvV0IF8wB9kEPAkpjvm8El2do4/n11E71a6WrZ3q
 O55WyspsO+UxsZgm3zmbepC42sMkJ87lgacoPD8jmHMgfhIBU63cQeDfJ/wpK+BiQJ2i
 9l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696317279; x=1696922079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HOWFAUIjoYOvAaPK+iqc8J3TSNnmeBOgrcE2Swe+lQ=;
 b=ovdReUmm1nukJ5rjfEn4zLLWNx1WoWxgpwxY17/rWxR3wGHW78SWmo1Rt+eTBDEEGZ
 2Idpu/CF+MKfjI20YYPNbpBin8rB6HjpmznaSgS51ucEBLikA/IK6i/78HtC+DY/gNI0
 616s0THqsnCpDjRmbyMCJH//mvztNoUtBvHGLmX1+60wL32y7jnLOhu3Wk2PCsgKNpJM
 Ay8T5xNxql6QiApCff7wXyqBU3qtgrTFmSeEeYmiU45D40cvd1J/hJHywR2zzpWeOr85
 CHWwsGJ+8wL0GKyr2nddJQkNX+0EUwWxxeWMUc3vWoGfPd8Xri3XfT88b+hQ/vxpLjwl
 EKbQ==
X-Gm-Message-State: AOJu0YyiGyLtjo9SiefpDqrv5qifnRrZMV707SXucJWqIIykvJc5Fu2R
 9K3pDntcTB5B+VQSXz1wZIUI6A==
X-Google-Smtp-Source: AGHT+IFWW3YuS9cACNEFJy4rebJE0chXVjrJcnS5IEZCiLXLXDXHiPZj+NUx1gd+TctGbWdl6OlZtQ==
X-Received: by 2002:a5d:6a50:0:b0:314:2fdd:28ef with SMTP id
 t16-20020a5d6a50000000b003142fdd28efmr11141052wrw.18.1696317279299; 
 Tue, 03 Oct 2023 00:14:39 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b003179d5aee67sm832196wrq.94.2023.10.03.00.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 00:14:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/5] hw/misc/sifive_test.c: replace exit calls with proper
 shutdown
Date: Tue,  3 Oct 2023 09:14:25 +0200
Message-Id: <20231003071427.188697-4-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003071427.188697-1-chigot@adacore.com>
References: <20231003071427.188697-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This replaces the exit calls by shutdown requests, ensuring a proper
cleanup of Qemu. Otherwise, some connections like gdb could be broken
before its final packet ("Wxx") is being sent. This part, being done
inside qemu_cleanup function, can be reached only when the main loop
exits after a shutdown request.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_test.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/misc/sifive_test.c b/hw/misc/sifive_test.c
index 56df45bfe5..ad688079c4 100644
--- a/hw/misc/sifive_test.c
+++ b/hw/misc/sifive_test.c
@@ -25,6 +25,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/misc/sifive_test.h"
+#include "sysemu/sysemu.h"
 
 static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -39,9 +40,13 @@ static void sifive_test_write(void *opaque, hwaddr addr,
         int code = (val64 >> 16) & 0xffff;
         switch (status) {
         case FINISHER_FAIL:
-            exit(code);
+            qemu_system_shutdown_request_with_code(
+                SHUTDOWN_CAUSE_GUEST_PANIC, code);
+            return;
         case FINISHER_PASS:
-            exit(0);
+            qemu_system_shutdown_request_with_code(
+                SHUTDOWN_CAUSE_GUEST_SHUTDOWN, code);
+            return;
         case FINISHER_RESET:
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             return;
-- 
2.25.1


