Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E99EC7113B
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIbT-0007hQ-5y; Thu, 24 Aug 2023 18:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbS-0007hA-5o
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:14:58 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbP-0005xI-Rq
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:14:57 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a88ff732aeso597739b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915294; x=1693520094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7GGhsp+GgEZfjKLvw+LVSBGm5g6O/+fRFcmgmdrOO8=;
 b=L2G5m8802YOAZ9rqmSiMQEGI6RxmRULInNJZbOYhSxAUq1r4R0xqXPQZMAtuIvSrot
 lGfPiRRPYu3dFfNvtltxQjx2Z2MkucUXaspNXAuCQJ8ZtKTALVQSjr3RXr4Y3F4q6TX2
 2uP4VRR5JZL8kKzKDV2D8lXqVcnhnjkdqS9EOgYXsKssvAwdWXviRYnCjZOrrmfcjVir
 mGyH/jklgk3Z/XAKryP6VFWNQKkXXn1bMoW57g6nLFdYe+jDWKx/1fXraHlXGJBLX7UH
 NBgh2KEZhXLnyEGZjtGk+3uWtckpcEhN4Q+bcApYV+GO7uT1VMt/m9YYrTaB/ce6r7y7
 lShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915294; x=1693520094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7GGhsp+GgEZfjKLvw+LVSBGm5g6O/+fRFcmgmdrOO8=;
 b=HSPfBQUcKXIDnubc8on8myWpIw3jr/VnZvlhAXtg6QC5zmHIuaXkoPGH1h3/B96DMm
 y/nvxlRdGBs01MKb3YIdk7h8atQg4ZE7GVos/ljhd1NnTuA2onpNnwO9wbUbtZ7kc432
 aBaDYRQ1qyYCJAYEELYRFT9zNqjR4L9gMQnGjBlBEHqhzUagUIt+ZdTbJkwahQToBStd
 6ppMVjxgXqQNGzfdUKq7Mr9FAATMei0BwrO3FYP6AgjTPB3FD5ktYLAuzHEGXt5/7BwA
 BhkOTT3ZY0tMbtJqP1FD5zl8omFLLHCn63hxHDpZOAqdaCZwxvZ0THLE3U9AcEWofazX
 IGyw==
X-Gm-Message-State: AOJu0YzgYqaTF0sKPdgTTiu+6anSD5WwR3HnRV1ohi7aZNwDS3fSl5UW
 yKAFy3vsCYlOj/MFTgBrRcXZxg==
X-Google-Smtp-Source: AGHT+IHS7xr6bS2Xe8yrds+3d0meGMph8xLaBkYB0wnYFGfLZpf31rEDaqtCysW0DpZH0DM0GRVVOA==
X-Received: by 2002:a05:6808:8d1:b0:3a4:8e62:d9f1 with SMTP id
 k17-20020a05680808d100b003a48e62d9f1mr596390oij.1.1692915294600; 
 Thu, 24 Aug 2023 15:14:54 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:14:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 03/20] target/riscv/cpu.c: split kvm prop handling
 to its own helper
Date: Thu, 24 Aug 2023 19:14:23 -0300
Message-ID: <20230824221440.484675-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Future patches will split the existing Property arrays even further, and
the existing code in riscv_cpu_add_user_properties() will start to scale
bad with it because it's dealing with KVM constraints mixed in with TCG
constraints. We're going to pay a high price to share a couple of common
lines of code between the two.

Create a new riscv_cpu_add_kvm_properties() that will be forked from
riscv_cpu_add_user_properties() if we're running KVM. The helper
includes all properties that a KVM CPU will add. The rest of
riscv_cpu_add_user_properties() body will then be relieved from having
to deal with KVM constraints.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6aac3ba1d1..a51b946804 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1937,6 +1937,46 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
+{
+    /* Check if KVM created the property already */
+    if (object_property_find(obj, prop_name)) {
+        return;
+    }
+
+    /*
+     * Set the default to disabled for every extension
+     * unknown to KVM and error out if the user attempts
+     * to enable any of them.
+     */
+    object_property_add(obj, prop_name, "bool",
+                        NULL, cpu_set_cfg_unavailable,
+                        NULL, (void *)prop_name);
+}
+
+static void riscv_cpu_add_kvm_properties(Object *obj)
+{
+    Property *prop;
+    DeviceState *dev = DEVICE(obj);
+
+    kvm_riscv_init_user_properties(obj);
+    riscv_cpu_add_misa_properties(obj);
+
+    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
+        /* Check if KVM created the property already */
+        if (object_property_find(obj, riscv_cpu_options[i].name)) {
+            continue;
+        }
+        qdev_property_add_static(dev, &riscv_cpu_options[i]);
+    }
+}
+#endif
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1952,39 +1992,18 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_add_satp_mode_properties(obj);
 
     if (kvm_enabled()) {
-        kvm_riscv_init_user_properties(obj);
+        riscv_cpu_add_kvm_properties(obj);
+        return;
     }
 #endif
 
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-#ifndef CONFIG_USER_ONLY
-        if (kvm_enabled()) {
-            /* Check if KVM created the property already */
-            if (object_property_find(obj, prop->name)) {
-                continue;
-            }
-
-            /*
-             * Set the default to disabled for every extension
-             * unknown to KVM and error out if the user attempts
-             * to enable any of them.
-             */
-            object_property_add(obj, prop->name, "bool",
-                                NULL, cpu_set_cfg_unavailable,
-                                NULL, (void *)prop->name);
-            continue;
-        }
-#endif
         qdev_property_add_static(dev, prop);
     }
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
-        /* Check if KVM created the property already */
-        if (object_property_find(obj, riscv_cpu_options[i].name)) {
-            continue;
-        }
         qdev_property_add_static(dev, &riscv_cpu_options[i]);
     }
 }
-- 
2.41.0


