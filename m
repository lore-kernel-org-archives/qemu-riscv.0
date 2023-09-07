Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92762EB8FB0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeDAN-0004XD-M7; Thu, 07 Sep 2023 07:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA7-0004Hd-Qw
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeD9z-000648-GL
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso9164125e9.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1694086014; x=1694690814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OEPSyw+MdZfz0ReAADR42z8ORf1HBCMspHfxG1kMUI=;
 b=ADyCv4nJXVyYqAu5qgrjaLVUAdLAbXU+4Cv8I3zo7iKK2oXiRBU4x777MvtJfoquFB
 G7LisxH6sa1Eq+ZHGcvABY/qXTZRYtvaF+wT9VvCdaCab9gS4dCfiIrn1AApgIQ8zTh+
 kUN9DhRHnUwunGCtR7bzXQNdJlrSpEI/UFiELVtuYbEP6W2k1qwaznLueXc+gv4QunOo
 TENDxeL84XEZXkuP8P2e2qEin3OdVQFbJ83I8kkCTK7mXiBoJ7+RWdJclLym7PXpa+Lu
 VojFoLpMrTx+eC/p5sz6yENWc4B2MZpJgeb7+bOFHvbdvLvWYoTsYGsyVkCJyWl9/Mgf
 RJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086014; x=1694690814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OEPSyw+MdZfz0ReAADR42z8ORf1HBCMspHfxG1kMUI=;
 b=GTNi1cnZFyZLhrM+yPxg18AfLanX3El0Mn9RYIyuAH55GsKIhrJnbXtEGzYCncWfd1
 giKGJgNttl72qWBQtjw5swyI692OZSe0GsorPKEiUxWDlKsoPyV5JnbsFS/EweHFODlN
 tW/Cz18d7VdiDjrHZkMwQRRXVLtuhfv7m+dlcHEFiVmxCe6uzwK8NIqxawzUDQLWDi07
 uWaPm8SSanvJdJqvOizOoubiLeRWNUJ7Ji8cOhqiYHHKIdCKbA3ZaBdQ0bssDDCgblZb
 teqR08cG+FpIKWn1rFexvJaQB+3NlrHjlu4aXabXgZAEXcTsnKwOcN+8SZ/fHn8exEhI
 yRwA==
X-Gm-Message-State: AOJu0YxXN7f3RDgbNyvjmD+QtIMkLFAdr5imJs6/sBFzw+zJDdZxUS0o
 UNRqczAdMz1xz7u/aeRsiEFYaA==
X-Google-Smtp-Source: AGHT+IF0s/Sa0+JYH9lv9ACp+DwmE8jk7UcN8qOn3TQyWxt3XdQzkPMmvcEzGI1UqeW7nno48ozk4w==
X-Received: by 2002:a5d:6550:0:b0:314:3fc0:ba82 with SMTP id
 z16-20020a5d6550000000b003143fc0ba82mr4063607wrv.37.1694086014159; 
 Thu, 07 Sep 2023 04:26:54 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c2c3:52c5:8306:a161])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b00317909f9985sm22998755wrm.113.2023.09.07.04.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 04:26:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 3/5] hw/misc/sifive_test.c: replace exit calls with proper
 shutdown
Date: Thu,  7 Sep 2023 13:26:38 +0200
Message-Id: <20230907112640.292104-4-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907112640.292104-1-chigot@adacore.com>
References: <20230907112640.292104-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x336.google.com
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


