Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F4EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqUX-0005ps-MC; Thu, 29 Jun 2023 08:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUW-0005pO-4D
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUU-0000Ae-Ix
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-311394406d0so564934f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688040673; x=1690632673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6YYX1dWztzELlCI3XT5PMGW/yG6v7BZW/N8+vfbi8Y=;
 b=dgqw1EbKpIXDe+Ln7FcLJoUI4Bx6KvOQi9fMMl4LkwWNvPlz4uc5mH+LQTGRWVGmMV
 stNfmAH5KXMEOkMkQyhRYl6SVmvcJJPK/4x0W+gKru5SX+L4pwa5TpRdSokrMivH/2Og
 JfZldQ1dKoS1THLmBl5RNTHTD3bwoK1BREdLRKGi+fXDBmAkGbvhzEXp6qWT9YFyMXEh
 JkW4Cl5GrG1tHo69jKf2LO/RNIuTNVOm8j3iakF9IzEtcGJoizgCBxYphNqC02lP93Po
 6BFp270OK95FCjbBIH0yJH4xUFQZIwg63HS1FmSWxWJqqS+kiv0RfYeniWJboX990EtU
 ooXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688040673; x=1690632673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6YYX1dWztzELlCI3XT5PMGW/yG6v7BZW/N8+vfbi8Y=;
 b=OKpcZcSZ/2GUBaIV2dE+GPH0MR9hRldhhvBisSAzbwlsoLIyziA/dr5+eUDZfkHxIp
 yhdCl3enxdn2q4NcB2hjO9KnU0Ac0m/1njq4UdbI55EU6ypiYepUSgfEJEJx+eYpv3g5
 jn/bdNX6+k8Nvbd21tPSMtiM0j9toNi0cT3VQ3bROGlgoliQMcqaBLmutmbBhEbM6N43
 bPg3ImGHDVVyNZsCl+5qyJpRWl/jXJ6xvfGlVh1Hm8/2QVosb85/JI/tljKHkxq56Fy+
 E3fLuTelxEXbGKQm/gHPEQGAF6e+YRMde3U5hwMnXcRiQz9H621tjHvJl0qCqvI516zP
 PSOg==
X-Gm-Message-State: ABy/qLY/BmlGDqYmyNgzwFRvKe/UEWKF250poRdu7kSDNX9KSkTu+5Pm
 D2o+YjcHmI4uD1Kj4AXOdIxbNg==
X-Google-Smtp-Source: APBJJlETgFANpG9InpSSMwhYBjwsU7sbZa/lV1Mt3gGIr+w7KDJqxP9A+bHwS6hq5RHi/SwcqBdEwg==
X-Received: by 2002:adf:fa4b:0:b0:314:1bb7:8a19 with SMTP id
 y11-20020adffa4b000000b003141bb78a19mr774490wrr.35.1688040673142; 
 Thu, 29 Jun 2023 05:11:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b00313e421c620sm14872185wrr.54.2023.06.29.05.11.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jun 2023 05:11:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/riscv/virt: Fix 'controller' typo
Date: Thu, 29 Jun 2023 14:11:02 +0200
Message-Id: <20230629121103.87733-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230629121103.87733-1-philmd@linaro.org>
References: <20230629121103.87733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ed4c27487e..68ccd0bde1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1692,7 +1692,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
-                                          "conttoller. Valid values are "
+                                          "controller. Valid values are "
                                           "none, aplic, and aplic-imsic.");
 
     object_class_property_add_str(oc, "aia-guests",
-- 
2.38.1


