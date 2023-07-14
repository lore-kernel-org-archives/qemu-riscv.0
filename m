Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067A0C00528
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpL-0004Z0-Q0; Fri, 14 Jul 2023 13:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpK-0004Ws-RY
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:34 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpJ-0003rz-CJ
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:34 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b8b6f7399aso1740332a34.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356612; x=1691948612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPVVJfGCYr54DMQh33GpPrRrymsNLjq2oQBg9L1UZeI=;
 b=ikT97e6A//Lf0QfhEcKqGTeaL1SLFm5SNdjM5oUtsPRbs42+y2Yx1Nyk2sBb6ZQs9g
 rpA9RHkPGntwEmwr++OZdNonMF92RZpOWbnxPD1xxgey6Aq8UwBnk2qqC+SekB8JwHlp
 qR4KggxEvov9JrE9h777o5RbrQnoFCkkoO3hvWzdveiBpxshFmoRQ9Dm+6gIqoBvTcsk
 0u6h8DhmeE5P3MlaczAK7JwJ5FuSi/7cFFL70lea4bSaKH386Dm8iKyq/f1iwaXoZ+TQ
 a63cLc/glQFaY03PmiIqQQtWvTzd+7gUrl7531pqmjC6WPsRkcWQTH7BWpv5wpdE2b4c
 T8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356612; x=1691948612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPVVJfGCYr54DMQh33GpPrRrymsNLjq2oQBg9L1UZeI=;
 b=j667gM5EPcvqNuDI4XKcgngye5IyynC/FppvcUjpuuvsG57NRob8ng4T9hfKj6XDe7
 cCwHZ5h7PLrCEwdgDM1a/4PxHxUuYdY0VS2REjjOKZs7afxeysS01YiNqWQm3+X70XPr
 LjfMP+znjGqO+eh1mRu9vHa+IvOV/6nXzQXywQwi5HTMzQRNlIzbSJibpbUbLt20t4xg
 Uo2HWV2kBZ+t2GSI1qO65euBH6BU/KnQchXtTZ81uywlLXTblaDxO4mjjw/j7xKeyWzL
 nK0aM4R8VPUZHGMGcwLGQ84u2b2+e7G5CsfetFA8tEfF5ipyvxTfknt6/1zGwMoFpenn
 bZxg==
X-Gm-Message-State: ABy/qLagk/AgWmZ7wsQZItDLHjv1rT0VxtWg2DcGTWgyhi16rX5lMpey
 VC1abD1GxFCNiY1p21/0Z4UTqQ==
X-Google-Smtp-Source: APBJJlESW07IE2QHWQMwEHT+OIcQb7jVL8YaVcaeYAJhHSbkiFiWjXpKEYBVrpaDERIPf/9P3Ux/Mg==
X-Received: by 2002:a05:6870:c38a:b0:1b4:7191:6d62 with SMTP id
 g10-20020a056870c38a00b001b471916d62mr6752692oao.35.1689356612178; 
 Fri, 14 Jul 2023 10:43:32 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 5/8] target/riscv/cpu.c: add a
 ADD_CPU_PROPERTIES_ARRAY() macro
Date: Fri, 14 Jul 2023 14:43:08 -0300
Message-ID: <20230714174311.672359-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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

The code inside riscv_cpu_add_user_properties() became quite repetitive
after recent changes. Add a macro to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5689368f02..f7083b2d5c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1875,6 +1875,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
+    do { \
+        for (int i = 0; i < ARRAY_SIZE(_array); i++) { \
+            qdev_property_add_static(_dev, &_array[i]); \
+        } \
+    } while (0)
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1918,17 +1925,9 @@ static void riscv_cpu_add_user_properties(Object *obj)
         qdev_property_add_static(dev, prop);
     }
 
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
-        qdev_property_add_static(dev, &riscv_cpu_options[i]);
-    }
-
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
-        qdev_property_add_static(dev, &riscv_cpu_vendor_exts[i]);
-    }
-
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
-        qdev_property_add_static(dev, &riscv_cpu_experimental_exts[i]);
-    }
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_options);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


