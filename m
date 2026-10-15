Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEC0CC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIdj-0000dA-MN; Thu, 15 Oct 2026 06:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdU-0000Xx-H3
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:33 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdR-0003Dz-TM
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:32 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso48096245e9.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059867; x=1792664667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dNC31SG6tiYYAq8uQ1zQOLn6F7XfN2if+RjCHtoxlkE=;
 b=hdzRps6vBTHP+/2mJ0SFraf8MbSCVM33nkFwkZ+mLR1pR1tD2doo3Vwaa6VUEVshoc
 BETTJ0nT2UGwm67893k3nyk0uAx4S6GHMXmN9BvGEyGTiG/BG1Y/8GWsF3Gn+hbdXRJw
 Z9waSQQZxmX1c6cgqaFAlhLAAP9YSOZc0vj9b5gn0sE33XAWZCYGvmZ2obipy4F+7XIO
 4wyMjqWbLYQ0OYDhKZUqZJsVJK7JNe42HlvW44sFqDJWTfByGmp2rrMerpPg3uTN19cf
 pQaGwep/ZKyEOrAwbm5YceMOEds+Egr9/CxkRlfn27wFuZNNdPhG3AeGG6QC7te4mSg4
 MCzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRRJR3opalc8fGUFTqyZ4lmnxwQWiqe0CfEDPx1y/KX1ArjGrPD7qciRI1hseW8i1NAhplhWRCdhcQ@nongnu.org
X-Gm-Message-State: AFq9FYJ/yoD+kcJRO4iADxFen2E3n/dM/7Rg4PYt2JOJP4wobtoblGG1
 5PUuXECeJYzqdwt2nIdc0+jI+WNiS2yFPml/RzwxMwrPFv+UPNsz8msA
X-Gm-Gg: AYBFou3OJ1PynzmJZEUJo1ovhmxf4DY9NSq9iPUkVqZiUX1fR3RPfXQj3jARlKrFKrY
 IRXMkpGOy0pss6wru+YEvSwP6DTPlLtT+EIBzGoYXeNWXQSstmQ9W/Xm+fiBxG18bQ2LS9WqcDQ
 PSQjkVEWjxePZzZahsg4sxd9nw1jaecIsuoRzsneL37JbA8P9J3WQyUx/aAqvapSoTU07pe0u2E
 ErXH58wCaecWi6nvCiFSq+hkOjv2zANO7lfqAjPMDMirn8Pcv+3lxFXMOuTxsxLPzxlE8ndi0BE
 KDhejYMXiULtVKMVZKpl7RVRJ6DsWwq9UaUxk4ENaGx7UCRQYYeeaC+LBaNiJMsgF10cWalpR59
 iKYSFBG/5aF8+wpuuogc/37yiTLrXCs/ff1j9aUywgzX2Wv6sPT2bQVV+5KVhj2tjzWNjtCoQze
 0iEzJERYi8+75ZdeCcD/sATu0WOEoS31ZhRTB7qDRl5KrNe6IxCzPst2zZs+Buv1n12xytsKuLQ
 GcLg7nMYHVPtxoIQrNJyV1XdMkC1gqIenwSZe14Bdlhyw==
X-Received: by 2002:a05:600c:8217:b0:4a1:a496:fc17 with SMTP id
 5b1f17b1804b1-4a1a4bd3da9mr208995325e9.5.1792059866880; 
 Thu, 15 Oct 2026 03:24:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd67a080sm58130415e9.3.2026.10.15.03.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:50 +0200
Subject: [PATCH v3 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-3-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>, Jamin Lin <jaminlin1207@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=1376;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=LoL21Mo6nZPDtcu3z5xfCRDOzqt2QUyWNp/sfG9scgA=;
 b=v7uLCb5TivHjhWB9UP6ai8dZtB0I9JfUwHYzvVT4LjgQUJ+jwNseXX6QZkhjENbfyuX0/Atjv
 dopfJQFiMacBtFvz/NXmPX/wHDIeWKD1e7WfGRFQwModuh6/WFlf6xV
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f47.google.com
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

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
2.53.0-Meta


