Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F500CC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIdf-0000a4-5J; Thu, 15 Oct 2026 06:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdG-0000Vk-72
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:20 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdD-0003BQ-Ry
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:17 -0400
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so33290825e9.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059854; x=1792664654;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vlJ0YMKurtXs9nd1yudaJA57cD2SNCrzN2aA7xi4zDY=;
 b=VayLtxO18LmaRH0n9mA2j6/GtYQt/OCg8v5EUEiEeaWA5MfHz+jo6QoYNH/0i/m15V
 lrcFhUcrxjLIDp0dG6snxoZ2M1q3oj56lEOyEq7FlMFngCnxlaz+HNybTupXBo0aDq5Y
 ClgqrqD5Juk3JDCvK+ADBTB+Y9W1gSEtM2eholkfq4+tgY19qL9y633omK4O4g6J1bHl
 /KHG73ADe7I0N60wxucrPJujZ7wxTqrXzqjOlN1RNApwf4BsfdU4tYLcAJRA1kyRb5VH
 9c2fa9qaoGARywz0SJBlgpTWy4tvTfrKgw/pXMlzBw5VZxuX86nDNQmXaiI0aDji+9rA
 Jhvw==
X-Forwarded-Encrypted: i=1;
 AKwUvByNrcoHvZx2Aju5wzM5UWQsmhqLafEKsixlDoXEipzD8BpQArbTIzWyw2OfPsxVGSFxEuUIoqdwnCcD@nongnu.org
X-Gm-Message-State: AFq9FYICU8c4mYpbVRRxoLJ/ffIdSw3FYPpOygu7HSB5uLdNqgec4kVq
 33PYbpbxEIkemRlzta9AHFa4yurFrhadQ7zOZxGsb2m/JvDiHAkjj4/G
X-Gm-Gg: AYBFou2BWCYIr5gyoWFRmf3HiIGLmoFP2RgNSW67qmG49RedSJnNDaoS7wM1sYWKNNU
 fw8i6byCwCgBUYnOo2zVf/79C8Z/6PwjECYS5D0ZHRBzJ7T784aYA3tZ9hQj+WFdvzUM98/ez4S
 o4bdDJ+68KcYakkUfSl9fOXvfCEPysUZlGieKpiZMC+ZcfIh/qTNbEq7i6btvHb+wzidD6innbW
 Ynh7Vw7WG3aM1PIM/nXt8xPpNy0O0oycYJvs0kwqWdD9NJ7QhbXNuaRWzCUYuLjFIgY9fm+hxqq
 ooTZxCXYG8qNFsXjJW2s6OKhc6/JXhTwAYVmOPhkP/WCuKxTLrNQnWjOhLESc3tNBy6rwAPeipR
 Q4j+spKnhb5MmG3crpYLWiV8f+ZOCOLeA0RfCMyeI/oy1QNv7gGQiIHlxi+LQlByso2bYnNXg2a
 AEnCVKu+UKXxdTNn/7Yuo3a2YNaAjZCQmhxsK/kXbbjmsqnCQiH2393wbaBkY4kIqsqDdGfZ4sB
 JzeCrE32zEJDRrBTZFYF+N/yy2bsutxjU5xRV6NhVuglg==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a45a:88f with SMTP id
 5b1f17b1804b1-4a1a45a08f7mr231984865e9.20.1792059854088; 
 Thu, 15 Oct 2026 03:24:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd68144fsm43698635e9.4.2026.10.15.03.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:48 +0200
Subject: [PATCH v3 01/50] docs/system/arm/aspeed: add the catalina-bmc machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-1-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=2095;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=ohO/cxfhzUynwcpNUOnDO3N8MbcDCcR99qBjLp7ftAQ=;
 b=ZKsJLrtK7bOG060LP680C6YTJKyi/EjFZFOJ/P4eeqVxAIDrSPCn/737cUSu4Exy21Ag4JMsf
 xBXb2C5eUyLC7z3z0GM9LpOxpFlMcRaifRPj9Xe87pn7RY1SeXko9Wr
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f52.google.com
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

The Facebook Catalina BMC machine is supported by hw/arm but has never
been listed in the Aspeed documentation. Add it to the AST2600 machine
table.

While at it, shorten the document title. Listing every machine name in
the title duplicates the tables right below it, and made the title (and
its underline) grow past 350 columns. The machine list stays available
where it is readable, in the per-SoC tables.

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 docs/system/arm/aspeed.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 2d51ceeb84..933df41f96 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``anacapa-bmc``, ``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-===============================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards
+====================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -33,6 +33,7 @@ AST2600 SoC based machines :
 - ``fuji-bmc``             Facebook Fuji BMC
 - ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
+- ``catalina-bmc``         Facebook Catalina BMC
 - ``anacapa-bmc``          Facebook Anacapa BMC
 - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 

-- 
2.53.0-Meta


