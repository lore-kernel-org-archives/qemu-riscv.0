Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A06CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 14:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHRE-00082K-Fj; Mon, 12 Oct 2026 10:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHR5-0007y4-UM
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:55:33 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHR2-0005Ic-Gy
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:55:30 -0400
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49e73611928so25301265e9.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 07:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816927; x=1792421727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ImldGJ+S970Bf5OYd6GaXlG8v143fN7qBqQiDylCmP4=;
 b=j68HsA5QHdiKNylZ7EKF696pCqtT9Sl6+hd+6sz+bGbCTGaKGIqNwIGcg0EhObCRY1
 EK9EXyjyGhXy5gWSECraZUGSTW3zsTAcEwS22W8H+U5GtLwQxbSDF0QE8GbEsRps6eMk
 flVZdSiPm1OyzMYuUq/cT4KF6in0K1Twwe41Nm18/rveA/+vCj5Xt/OZNhO0yGZD/8R1
 KP1Jp5yXO9GE9n4WY3UfbqjiVD3Kr/uBKUASVcbUe6/bfV7G1jHJbd8169iLaLvx01F6
 fUs7qezpCJ77aVVz8034V/kUUlbmA8y86iFzU6/bRY01QGCH8hFzawViXM2sXK/dXAJ6
 N1PA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIpnAtWbqmVXp1nWV38H9G3kPoEHNHNwQHxLgP1xqw17bz5yb7iWvSUs4mwoRlrXMiEOcoS85gMfRT@nongnu.org
X-Gm-Message-State: AFq9FYIBEzm+tCbashFeuKPi1jd9zDnLqrYLrctkH5BcThkhby+1nzRm
 190HB0R4gUoHiAi77NyZwCBi9x+wuQfmJY0qTwev6wF+iVwEgvTyRqIf
X-Gm-Gg: AYBFou2eT6uXFVxP9Nt3rjsEIpJhE4lkmGGW1WvJuZVNhKDZ5ocGq/tLiqCJLjsW/FC
 K2pDq8WaRSdiUijbHL71NMMUDO4SuysFK07JCbYBAcCsfi++XJoFmah9HOaz4HSd7CKQ86IPock
 6t2rzn1IandjuoI2O0OmWVYYhO5V5kVlYNZjf7UNQe08/S5VzqWRVGqab/uR5Bzbvo6m38FBjAn
 Bxsc28PjgtdBrhgzFO9b19TGDV7Spv66uTQ+SkcY/ew4hioZAsXvOI6FrzkTCQ0n+Gtwp+QKcJT
 oP8qIinke4Vp7XC3FZELBYkYTyXmgituvoKPlqZm6Dr3bNR8Z2dLxXwCN6rEk0qbtkBQXYdJ7BW
 sc6N+sHDaLWGoe59kvvJ2Nkvr74khCYN9a8YXCRtAGr3obUh99woPGxMdJZcmypZFWoXTKl+SxZ
 /MCy/qkAIvYUFK2qYj0zk9NcBMvbg/XSJKZWwVtP9b3Wt/eF3uQpEVRp3CFf79rR/gYKUj3ryUa
 JIDWz1KOODy4VYrHLHIAoyDgbH0u5ln+fihhO6GCS2QLt2JZO0CeE9Y
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a18e4837f2mr176377965e9.5.1791816926905; 
 Mon, 12 Oct 2026 07:55:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm312212015e9.11.2026.10.12.07.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:55:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:56 +0200
Subject: [PATCH v2 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1273;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=d5avXaQSHf6bIfiDvZv67RY5xgd1U3dm0wZh/dvYVAk=;
 b=M4EuneDWmdSo+VtSiaypHuk5+OfyPHsRFymuYjEK1qqATk/7ayeW0LBEEEiBPYzFJmbzIduyd
 R3YCUJRus7NCKQNRfHveC+Klhxdd6mCFzXBTgwRcm6g7weRdqcb+h2e
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f53.google.com
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

The board only populates the flash device attached to the FMC
controller; the SoC SPI controllers are left unused. Advertising a
part there presents the guest with a flash device the hardware does
not have.

While here, add the missing year to the copyright line.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_sanmiguel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
index 345a9c9416..ac2aef740a 100644
--- a/hw/arm/aspeed_ast2600_sanmiguel.c
+++ b/hw/arm/aspeed_ast2600_sanmiguel.c
@@ -1,7 +1,7 @@
 /*
  * Facebook SanMiguel BMC
  *
- * Copyright (c) Meta Platforms, Inc. and affiliates.
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -384,7 +384,7 @@ static void aspeed_machine_sanmiguel_class_init(ObjectClass *oc,
     amc->hw_strap1 = SANMIGUEL_BMC_HW_STRAP1;
     amc->hw_strap2 = SANMIGUEL_BMC_HW_STRAP2;
     amc->fmc_model = "mx66l1g45g";
-    amc->spi_model = "mx66l1g45g";
+    amc->spi_model = NULL;
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC0_ON;
     amc->i2c_init  = sanmiguel_bmc_i2c_init;

-- 
2.50.1


