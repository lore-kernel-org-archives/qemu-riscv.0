Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264EFEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 20:59:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJgub-0000FY-Ai; Wed, 12 Jul 2023 16:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgua-0000El-Gl
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:12 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJguY-0005Te-6C
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:12 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b5d1498670so6221857a34.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689195489; x=1691787489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nS2W9UaH9gghVm/aiRhSGBwZOy7l91Ih/qPzigWpPY=;
 b=TUKiyCjt1nKZ6PJmI7aUPWoZPXNrPSNh0fC/9jKP2UHnpQQQPeMFBdrpTHPG9nNCK8
 LDlsfN8eGtnnRhHU8UcNVjHWPtqJ3t7dCmKsYik45FjZTnALEXeW1T/IAQYm2uHYMT8z
 909aO14nOs6cbIWBMa7G2qUb2FFhzVPrP1JXGucekHfWJFDyB+5ZKdFH6B0PZspN7HzZ
 Hakx85NdZdKRiJQJZC/BaR2YCW4WQxy50uWfQkYEIwf1YGzlOfIEUeHPpJr1BvUyEiDz
 67feHqwiQJeS11fh2ZrRu++TKtojOUO47jpkttnLn9NKrSIDRdsiadgn5tluDaTUIWis
 bXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689195489; x=1691787489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nS2W9UaH9gghVm/aiRhSGBwZOy7l91Ih/qPzigWpPY=;
 b=ihaxL2sRX5OBjJ9h+V1HJ8d2exnYSlWmhpXWYna3nN4XKXCg6OJhQ/FMpI2YdzXkAI
 KJxXq0S0RpxoKv5T6ZkUqid1s8Z7CFAu4oy+ACtv/HKlMxheymAHr20N6V45/kgD6wMJ
 DFP6IVnBxu83G1Luou6iJKK7nSf8RdZMnugxAkbfABPKbCJxyBKfl1GHnfkQNJypAl4S
 Iw7IxbsamHbgLDB1DiEUdJIPFBqx5jvQvU2T9mG8nEfzTnjuFeJiaWJkLEpE36YxW1L5
 DkM+Q1j8gn5inFVLV/5ckEECf4rzQtT+QI7v6bJL1ST26uPNUPHaz1Boj7KmNae5eo7q
 opYA==
X-Gm-Message-State: ABy/qLZVNUlQI1/dB6JveVhxYNFV1AHlIvOM5cxw3eQ4IARO4OgaEroN
 5XQUdiM74kz2SndiKjbHfi+MYw==
X-Google-Smtp-Source: APBJJlFfGhPZzKcZ5pGkI2oesvfOC7HPco7Qzh7iLjNHWBQX7TkwOGpBwHHZNj5c4wvyf85v3jgceg==
X-Received: by 2002:a05:6870:1714:b0:1b7:16f3:d37f with SMTP id
 h20-20020a056870171400b001b716f3d37fmr11456777oae.17.1689195488921; 
 Wed, 12 Jul 2023 13:58:08 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056870344200b001a9911765efsm2359904oah.40.2023.07.12.13.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 13:58:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v2 2/7] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Wed, 12 Jul 2023 17:57:43 -0300
Message-ID: <20230712205748.446931-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712205748.446931-1-dbarboza@ventanamicro.com>
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cdf9eeeb6b..735e0ed793 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1907,17 +1907,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
              * Set the default to disabled for every extension
              * unknown to KVM and error out if the user attempts
              * to enable any of them.
-             *
-             * We're giving a pass for non-bool properties since they're
-             * not related to the availability of extensions and can be
-             * safely ignored as is.
              */
-            if (prop->info == &qdev_prop_bool) {
-                object_property_add(obj, prop->name, "bool",
-                                    NULL, cpu_set_cfg_unavailable,
-                                    NULL, (void *)prop->name);
-                continue;
-            }
+            object_property_add(obj, prop->name, "bool",
+                                NULL, cpu_set_cfg_unavailable,
+                                NULL, (void *)prop->name);
+            continue;
         }
 #endif
         qdev_property_add_static(dev, prop);
-- 
2.41.0


