Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B12EE49A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 07:07:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYhxI-0006Vr-B5; Wed, 23 Aug 2023 03:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhxG-0006VZ-Lc
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:07:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhxE-00043y-SH
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:07:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31c63cd4ec2so1102442f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Aug 2023 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692774419; x=1693379219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JvqFLjsjUTfJaLVSyxitLTq0Nr1RR6VPuAyEzznU0UI=;
 b=GydaORqqhoj+sAjFy7p8afEBY+demOKM3Cg/wBbBrITF3g4jqHB2pRGFBK9J9xVKBK
 MAPpGYIUOmWWZ7MwafXKd69OaQjSwgH64aUTvCGuNdJpXE7EhQi/1uoCe4i7b68f2DRj
 TJ3BWHJKd2LRnVqzB0DTMJvEplDDXafvmggo3XZcDGz8gWJcR2smvVVeA/+jqOOAifst
 98tEHQ4XhbRqR6qpxFk+xD0w8dJ1v6RoqE8t4pysSMdsOnc7yBUT3Z1JMwK+zxZfeTZz
 uhepJJN894hKnGHpOcaYrIR+IWQ1FyoTVNWtaWwv5XpqzQGuPO27YerT8jgo2ViSwjKT
 /E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692774419; x=1693379219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JvqFLjsjUTfJaLVSyxitLTq0Nr1RR6VPuAyEzznU0UI=;
 b=Daz3zy+KqBcMEmJZotzbbwQL5IrnxZ4G1dp+MAQccrcfub/rMPzItrmYSHIV8iedFT
 ViRRLEhnx6CjIfJvOaSMCYfv9L4b7WV1Vg8J+7VnuuzyEPxV70zspiaAmucH5GwNq998
 Fpm8HrjPQFJ5+qeakDiMQ2+R0alvCxQRWqxIM0twbzQOAl9fgWf9U4tgx1CGRKUQbDGQ
 GQfs4XwaGjzLXClYVsfmO5LiBfr2LJVjIAFBYJkX6WCqcpQrflU1C6xDqmp5S6osCsxs
 rwk7d87OEzefQw++m5GFCiTLia5tj7hyNhLdKtEOPFAJ/DjReSAaVP3ZoLPmuY0qUou3
 OxPg==
X-Gm-Message-State: AOJu0YzBrLdZjLEyISX3/YiN4WjjaOSTsv8nSCm5JfGQrI/k57BkDm0T
 2zBUkeNhIpk5S0+dFLn7Sod6SQ==
X-Google-Smtp-Source: AGHT+IG7x4XgWfcWuMVrSB1O5RNZFrF7vvbwlnQ/jgAIu/HiHoOhMGAuzVIgpvqnpFrQe14/0ZAIqA==
X-Received: by 2002:adf:fb87:0:b0:314:1b4d:bb27 with SMTP id
 a7-20020adffb87000000b003141b4dbb27mr7272910wrr.64.1692774419059; 
 Wed, 23 Aug 2023 00:06:59 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:d434:6b1d:751:97d0])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfe703000000b0031433443265sm17924811wrm.53.2023.08.23.00.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 00:06:58 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/3] hw/misc/sifive_test.c: replace exit(0) with proper
 shutdown
Date: Wed, 23 Aug 2023 09:06:56 +0200
Message-Id: <20230823070656.363032-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x432.google.com
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

This replaces the exit(0) call by a shutdown request, ensuring a proper
cleanup of Qemu. Otherwise, some connections like gdb could be broken
without being correctly flushed.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/misc/sifive_test.c b/hw/misc/sifive_test.c
index 56df45bfe5..ab0674f8fe 100644
--- a/hw/misc/sifive_test.c
+++ b/hw/misc/sifive_test.c
@@ -25,6 +25,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/misc/sifive_test.h"
+#include "sysemu/sysemu.h"
 
 static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -41,7 +42,8 @@ static void sifive_test_write(void *opaque, hwaddr addr,
         case FINISHER_FAIL:
             exit(code);
         case FINISHER_PASS:
-            exit(0);
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            return;
         case FINISHER_RESET:
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             return;
-- 
2.25.1


