Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8DCA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 14:57:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHSA-0000O7-7Q; Mon, 12 Oct 2026 10:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHS4-0000LC-Tw
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:56:33 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHS2-0005S2-1S
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:56:32 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso1387523f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 07:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816988; x=1792421788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MVSG8EzaWLj+Z754/87jnXfWdb4zSMi3q66mrxn3Q8s=;
 b=Hw9dvL7e3LQZ9jmLSjmMw8uvM2kOJrJbpOso+jD0zfnX3Arvo9qLfg71wFtkee3qb3
 SBgYr6jrxqBX66ny62iuuzWXvMk57XPx1l+NQwltkE6eKaZbcUHNUauoO1QeX1LcV4E3
 pKG7w9FXwJheGCkbKAejDO2krNUqVCI/yjlEJ6OxAroGX8gbsTYUp54I/k6uoWt2p1QT
 6gnr2S9A1CAweltEVqR/bnWMFLtOXik/FGSnaAJ4/mZ4hRQPEH4GjyvCjy6i+dzXw2OE
 rEByxQeNuKVT/aZEPyj99yW1JSiXZyi0UJAmfZlq7wIQsYiZE6mayeAFR0wyQH3SoZQd
 R4NQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6sZQIWHC90Ej+Yyv32feIy/dr7YsyOalNQbycvnOD9NFnFMYyHlxik8bE7qSxbtho4JbDBSERtcr8@nongnu.org
X-Gm-Message-State: AFq9FYLSQfP0tew+gGS2L9gE6FVgV3jOBXQZZ3CNBnRnVjld3u1FjSjz
 i5wFpvGJmZRaeqccJLnTFxuXuWzfJbqeN5znI3NpYSEpydnvPoviMYDj
X-Gm-Gg: AYBFou2xPQ+LP4XBYTPOmfIMfy0ptVirSLnef09Wi63f//5Hi8KqAYoKt+/v0UlqCpU
 WO4DGBUlD8szeTZhjQsn33jhCI2Z252lvQWl2R4UWlOb1avptMG7HskSbiIPPxqdHFxSSti3NGH
 MCO0I8M8AUN0sblRgo+joDjptFzWIN8MeKt2TebSm9qcM2o7rCvl4Aq+bxDdaTK6UTfgxWPx+Zi
 6yE7EdYog4kGHX/r6ja5eJ12ZfvRbYB8wJVUVrThvMi+jwr1dthr11r/+OzIL5M33vwgmAuDXpX
 KrV8Fjslj/l0/aEZma0NvTkLn6iSCFo5tE37YF/kbz4AdfcTJplcO2oycDZbkI4abnk/Ud7tRRB
 REoDOwRhxhnrvD5jDtp9IFAIt+yW6oZ9TNlkjlmdb7AYaiONepGHUDQobyNIdop4aWApboKmBpw
 SgZc/JKPWV9RgMXVotXsECBJ9vG/qHR8o/FpfArgaZpzm7tDX7Jlu3lWZQ0xppmTrPcXJdxubBr
 cjQ5eS9pmkt9BmfcbZG/yyzugysP+iU2yvTY8sL2QyuAg==
X-Received: by 2002:a05:6000:3102:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48dca32e9b5mr11121631f8f.55.1791816988226; 
 Mon, 12 Oct 2026 07:56:28 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd57fsm19265393f8f.37.2026.10.12.07.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:56:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:57 +0200
Subject: [PATCH v2 04/50] hw/i2c: pca954x: drop unused header inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-4-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=838;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=b9K700bDZsWgDrz5nZ97CmrXARWhU1wSPXweUqGmEJM=;
 b=Tl71FE+9JTd2lCFH9MHeRy9QCAflu+bF7+oW1C+qsX1R2DLonL4r/bn1gjB2xxkmFQeDlxpZc
 +kpBqMhNRD0C6okC3kOgx6cDYO2/aPSPQiSICheFlZcE4sPWrBhIhBS
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
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

The qapi/error.h, hw/core/sysbus.h and qemu/module.h headers are
included but not used by i2c_mux_pca954x.c. Remove them.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index c603446028..c8e75da8b2 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -15,15 +15,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
-#include "hw/core/sysbus.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
 #include "trace.h"

-- 
2.50.1


