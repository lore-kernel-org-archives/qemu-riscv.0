Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60551C00528
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:20:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMXJo-0007jW-LR; Thu, 20 Jul 2023 13:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJd-0007h9-17
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:19:49 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJb-0004YI-KF
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:19:48 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1b449890ef5so745520fac.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689873586; x=1690478386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9lSDeBryekDaWv/Vc78YEkpFPDXZkfJPoxtpTCKUds=;
 b=X5qPg5Plsg4//wi6oqpcxILsdWPAtGEfgcTcZQprPppRHuCd6tZqcbt0CagV4f2amT
 1csEmCoMC1qPxw73o7KX045+hn9MnFkhO5c/s7Sr8l0NsfQQXz2qffo2CXojhAGB/5IW
 PUN6KkRl8l0nWulnw+ISfKC0QkfDHUOff6mxIjCjataQ0QB0ZbvXzH7LCXLZ0+lcv58q
 8/VEhRuBVhvf4ZKHOizkcuCYD3oNqOax0XQPDXt5SeYDI1Lu2xkyLErJ51TA8qVnupEB
 ejU+AC/yBh4Q7XHPzc/0SWzPItx0LM993FY/DyJHGgx+xDZvgMiyCs1LtrKaYmzhSCPB
 erKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873586; x=1690478386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9lSDeBryekDaWv/Vc78YEkpFPDXZkfJPoxtpTCKUds=;
 b=PE2rVr1V+1uGGQIbfZHjFfPSL45l5oBcfRZKrUKBoo52DHOnEmVC8Ie/+C8aJkjEoM
 guVottTAePYEHaEKy9jQccjaJtOYNtEORT6VWUGbrYKA2eHvo3mxElHzHC7o0SAM0GZY
 xuH+cjrw0UUM7zhAraeIM6q1/GWX6pHrlkDSJQ5wsUPPnbtjVkOQWTKlTQJXqpsTwH6Z
 ih01mFRk+dVSgpFGqT+/Z6JMvBcTOipp+fvHQxvpgtVoE1NSkUkk1MEEDqcKTJ52wPWl
 Yk57pG1WpLIKsOd88HSEZrcpmQOpe9vdbef7cbU/uTxFQE4iywHUtscKewi6fI4Y2sBB
 vgBg==
X-Gm-Message-State: ABy/qLalXDhfvpMeizA5/ZBxE7j52C6Wl3T6OS4zYq2TXBmTdg5/o2ys
 +FS/KBYIckE8Ipsulsy5U9oPag==
X-Google-Smtp-Source: APBJJlE9q5kTOkqA+oT1x+Vdn/T0ylKiX0hiljbWqLOrEKvO7eAbeuF+y6JP8JQ1G5VKMjbgAESqlQ==
X-Received: by 2002:a05:6871:829:b0:1a5:4e57:e5d1 with SMTP id
 q41-20020a056871082900b001a54e57e5d1mr105362oap.49.1689873586545; 
 Thu, 20 Jul 2023 10:19:46 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a4aab02000000b0055975f57993sm582564oon.42.2023.07.20.10.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 10:19:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v5 02/11] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Thu, 20 Jul 2023 14:19:24 -0300
Message-ID: <20230720171933.404398-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720171933.404398-1-dbarboza@ventanamicro.com>
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9a3afc0482..f10d40733a 100644
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


