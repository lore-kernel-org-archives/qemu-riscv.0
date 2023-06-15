Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D11EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 09:22:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9jBB-0003HA-Pr; Thu, 15 Jun 2023 05:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9jBA-0003GG-1w
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 05:22:08 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9jB8-0002dL-HY
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 05:22:07 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-39c7f7a151fso4679629b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Jun 2023 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686820925; x=1689412925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WEHITo7+8H3wYsbs6qFg2VqKn3O3Hw3sbjYP6T0WrgQ=;
 b=FMXDHuaDf9ckZsgDeuaGbfVMvQN52RVCONTiqsT0eC5MuXS2UbkFG74aft0afjcs0e
 M85sjiyK1JaHVidoSeTw+jlxMmQkfArv3B9ppTsBwPC8Tng5FmtsEukACCR7L0B1GwWG
 bvimXUT/S6LfG0VONxl99+xr8SgPayfgAGXBGWzA8nQXMwrQhmpbfdbZ3+ZHXjv6Q0D8
 MZzApIdH66UHs25MWipVZIBud6uZWo/vDBooXAHc5jE7mYyoG+CCFhaZFGty+P9UnLPR
 KaEzAmegzcRBCea5s4LUH6OAaa6uK6+qf7L/AULsqdTPqjf35C6tVb+ueWQWKkE8KdgB
 PURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686820925; x=1689412925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEHITo7+8H3wYsbs6qFg2VqKn3O3Hw3sbjYP6T0WrgQ=;
 b=RIVKYIAo03IwHeaK1FSYMqUYsnpBivDC7GYxQz8rpReh6zjdY3Vj5ylolQWlwzXWm/
 Na+BZfNbgkgEQ0wfry4PqEtfpwMK9RqJEtEb+c/paodrzbqQmsMkFq/5iWZ2TgZyxpp9
 hmnrarayf/BjNPmapR12rAIStMmxlmLsEQlw3ZBqZrWuAfPVkposGYWZdooMCjky9ODK
 MbivyZ8i4g1oISlhuv2vVRQtwjcvFuNlvDObv37apizHkSfr6yWLOBXBUZTNYdNlAjtW
 Bkbn6880E8+AEMkUBOBdvzqhZL3m0z6wSHstGCuPbRtmRjlfn6CwMSVzJWOYGOv8aQfw
 UEKg==
X-Gm-Message-State: AC+VfDxZe2Bo86lIz7hvvG5xpZyyXaNiYFc4EsJqbqB5QL+b+0u6z3sc
 k9QgmpV2jo5rwZ9E/5yhlIuTuQ==
X-Google-Smtp-Source: ACHHUZ6WIiXZmCoYcUPHLRA6l97UE19vdEXWaJZQ/Gbk107hUnx4q4y9OIkbCT3g3SDnB4W35Nij5g==
X-Received: by 2002:a05:6808:13c6:b0:39b:f548:3f6 with SMTP id
 d6-20020a05680813c600b0039bf54803f6mr14744065oiw.13.1686820924792; 
 Thu, 15 Jun 2023 02:22:04 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 e10-20020acab50a000000b003942036439dsm7214279oif.46.2023.06.15.02.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 02:22:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] hw/riscv/virt.c: fix typo in 'aia' description
Date: Thu, 15 Jun 2023 06:21:48 -0300
Message-Id: <20230615092148.612875-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Cc: qemu-trivial@nongnu.org
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 95708d890e..3464abd226 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1690,7 +1690,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
-                                          "conttoller. Valid values are "
+                                          "controller. Valid values are "
                                           "none, aplic, and aplic-imsic.");
 
     object_class_property_add_str(oc, "aia-guests",
-- 
2.40.1


