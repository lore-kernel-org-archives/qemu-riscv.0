Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E10EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 20:59:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJguk-0000Jz-5F; Wed, 12 Jul 2023 16:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgui-0000Ji-Qw
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:20 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJguh-0005VZ-E8
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:20 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b8a6ca994eso6508593a34.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689195498; x=1691787498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISGp9WhmlakO4roPRO9/GdVvd2qgHOTCTKibkwihSgI=;
 b=Gc2GcR7nLluyhXshVVdJDUmOiUmvU7PjkIioThKiRVXMpj8dtSKZgNWoqPgcxwXvpP
 6pN8I9+CmwV9ipJL8NDNtDlTTkGjcbDe0Zs/BhlJ7U11xnctSxCQqrW7MHUPoEQEcQfQ
 M+ZuZ7e/Q+O0A9Kq7ahrLLECWPZljuaYCffqJKpMEzpadKTy8aWgF1tSKYkFe3pbMX50
 XsZ1nhnSK6UUf1IpcZ+7JFo+5CMp87n0Mgfr6Pmv2RHLX2YZ+ZG4RAbla7IzQh4KH9sm
 hqSIdz2h7e+nGe561rfq2TGcQ41MZM02gSpc+J783JhTfhgDXu2rwqh2VJ3GQmNHNlqH
 RUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689195498; x=1691787498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISGp9WhmlakO4roPRO9/GdVvd2qgHOTCTKibkwihSgI=;
 b=gXsVTYNKaXVnC7SKcEF1aVBvRqaVUsklFn9H1uEo9sNGExW5WcwNPNf8BqcL2P1eS+
 tepbSPAYSSno6aM176Zm8JtLDlsgJMW77moCx3JgQncI/ckddp1YCxMHPGOACf8vuJzt
 Eu0flq/wW2ZHDE0PfmrKAR+S2CJ/kl+hyTyllasc3k748akx8DCF/xAvvMCOLtQVonVp
 EAZHhmXKHq/eqGfwVuiBJzVAi5XCvjLx5zJofSuYmj0IG584yKQjp7CZOxYvlGe5+t4n
 QzIUNkBMoextEQDYBYYZTjZkMDHjN6qy4b0BdKrf1GcFN/DK2OljSRRZnIvmpgqy7bTG
 jHDg==
X-Gm-Message-State: ABy/qLb9nnIcw6INZhPBPOLBweFG7nc2mqaKa6sMa3m69OCJcontPrpM
 PJZpgWS6TZ8bTWLOUgC6ni8jFg==
X-Google-Smtp-Source: APBJJlGH7FvDLF1LVRoFijzNwq+l3AFh9wSJMmGpgNkGWdnL3IeacfR9nKcm/EmuaxjKILVy19R0dQ==
X-Received: by 2002:a05:6871:b2a:b0:19f:9495:95ff with SMTP id
 fq42-20020a0568710b2a00b0019f949595ffmr25104798oab.27.1689195498176; 
 Wed, 12 Jul 2023 13:58:18 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056870344200b001a9911765efsm2359904oah.40.2023.07.12.13.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 13:58:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v2 5/7] target/riscv/cpu.c: add a
 ADD_CPU_PROPERTIES_ARRAY() macro
Date: Wed, 12 Jul 2023 17:57:46 -0300
Message-ID: <20230712205748.446931-6-dbarboza@ventanamicro.com>
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

The code inside riscv_cpu_add_user_properties() became quite repetitive
after recent changes. Add a macro to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0826b449d..b61465c8c4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1881,6 +1881,11 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
+    for (prop = _array; prop && prop->name; prop++) { \
+        qdev_property_add_static(_dev, prop); \
+    } \
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1924,17 +1929,9 @@ static void riscv_cpu_add_user_properties(Object *obj)
         qdev_property_add_static(dev, prop);
     }
 
-    for (prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_options);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


