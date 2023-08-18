Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A687DC001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 09:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWvNR-0006rJ-SL; Fri, 18 Aug 2023 05:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWvNP-0006q4-Az
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 05:02:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qWvNK-00078Y-UE
 for qemu-riscv@nongnu.org; Fri, 18 Aug 2023 05:02:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31783d02093so648092f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 18 Aug 2023 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692349353; x=1692954153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fved5JBmSGzkEQy46dK2oq2AR9k7CcaobXassrhX24c=;
 b=LLBR4hMFuy74i0P7i56ZqpWEvyMOnX1KZBkNSGPmeCva1smRq62nDH5Clv2wKYiF0J
 WoLwTwXVs2BbbOC4HzZEcXtUHaHEqKeYtwpH9BLVmZfj1GfOCYniqS9RmaL6sHX6KPC/
 3N3xG9gS605VyMKmixeE4pojyR8lc0B95zBWCkzqmTXd3iHodwgG9CNWEsPVEEuLJLHt
 8XRC6ZR9JVqffcsV/OoHE8AMPFX7tbX8flBVzKWrUAx9WSJa5m3HtJ4lH4P+rNXeyker
 ZhJazSHQxLUlUzQCOB2XN3GHHIYFupbkzaiig8AC8iK7gF0i5fzUkLtLWgTPif38RWJo
 RhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692349353; x=1692954153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fved5JBmSGzkEQy46dK2oq2AR9k7CcaobXassrhX24c=;
 b=kLfMZ3z3GWkINmkAJB1TLaxVw4O9DjWKCZyL6zsfsFOltT6lJxK7dp8v3OIMP1J29d
 LJ/QhD+skBHm+ikc4V97oxt6cX/isr5QxzVFXlAqONZi/IjZDsgz93Bz2s9SREAYqxqW
 Un1NiU/3h/P1UK5LlUwwUym7gWSBzA+tBeB98d/+sUMuaK/uww1C7dbV+J7cEP7QFi0x
 JqiFODpybaNydlxerYRfze8jbNebTjgrdwrjCWMBciCfi91HRBNrfkuhc62uZnj0oiVt
 f5gYdd03AJknYLFWaHwoNswF1UXdhIneOGaBRmYfAuVL3NVIj4lRePyjh1Nja664khou
 ZUAw==
X-Gm-Message-State: AOJu0YxWyEH5I1xNuG51lYdXRCe9v5zuesYRFk47HvP7D86YgT0/B5Ei
 2GYlM0kZnRDkp8cCy6XsO4SpoON88XBS0ZH8dHM=
X-Google-Smtp-Source: AGHT+IHtGF+Pz63KSD2RhE08BE2hsrCbnfTMq9RCmNErJLqJjtcVLAOc26JbTw+Ls8N61l141OFTpQ==
X-Received: by 2002:a5d:568b:0:b0:319:7a72:5d82 with SMTP id
 f11-20020a5d568b000000b003197a725d82mr1388614wrv.21.1692349353076; 
 Fri, 18 Aug 2023 02:02:33 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:44f6:7cae:4aa1:4fb7])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b0030647449730sm2085745wrm.74.2023.08.18.02.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 02:02:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 1/3] hw/misc/sifive_test.c: replace exit(0) with proper
 shutdown
Date: Fri, 18 Aug 2023 11:02:22 +0200
Message-Id: <20230818090224.409192-2-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818090224.409192-1-chigot@adacore.com>
References: <20230818090224.409192-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42e.google.com
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


