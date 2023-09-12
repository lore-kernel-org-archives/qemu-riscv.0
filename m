Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D841CA0EC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:33:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3OE-0002sd-GB; Tue, 12 Sep 2023 09:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3O3-0002i8-Qa
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:04 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3O0-0003b8-EG
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:02 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3aa14d8641cso4191706b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525098; x=1695129898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+gk0kBBAHtrEuYiKX1fINvhZTVbZN3vla4ocCML9Go=;
 b=liWpQbPjj4TkzCN/miw95HYY0LHao5CGXmre1XGg4X7NNMlDDSG2yYy4nW5n9qqozh
 8JcgEIKu88J77TV/iLsQ7JVD2UMfIJCGzwpOQ64dTfYxmiWcKQVfWZQrD1Vpu0AA5+Ew
 wkrPJqXAWEccjs+AWJH5fz5gXPpm5TqLErsMBOQUW14JpAXyv+rE92AB654JNlEZhUrz
 D1aAOB44/jHST7RswZCWESmB1/DJjDqD42e+x9BR3RwEcYe43sMw4hm/SkhHNtfDghA1
 dw1Xrk5/R4uDoE8infOOlnyy2o95GlkR49YSt2ccCKjmsyERDG+TZ4zyQgaXS6E6XjS8
 JD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525098; x=1695129898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+gk0kBBAHtrEuYiKX1fINvhZTVbZN3vla4ocCML9Go=;
 b=CTsOcnNb596Nxxour838w/Qondlb6iPLQjMpP9NqatOa1yBXIGhCH2aWBq4Un6cd7l
 seo3gniICuEoQts6eSm+BHucdyAh0cbpgrLzmWqEbPu81BhHoG+zvNkfDhW8cs6xzW6M
 aeO6mTYzs0SgFeIo2Hn/80z2zU2jBxdaMtiapMhO6gkSUZ5NWKA6lIfSPOBV879LlMcy
 Mdd/I/2SMwmq3UJvtiAwRRpL3jxAFTcvmq8Cbmz4mdjTFIoGrZ7h51KxtgRYeNstj/sH
 +/LFLZMOt1weNGmECYSfcFo5x8QWHDbSv/vP0vndK7wjCOHnF7apt2YfYsNZjQyse2yE
 /P2w==
X-Gm-Message-State: AOJu0YyxtWwyDDwPExCmncf4OIH9dhZC72MqbRkc8dCdWn5VMqa77yrj
 kB3WimJlbs+aUdDRD4MmbgfBrg==
X-Google-Smtp-Source: AGHT+IGYNYKDZE5lqeYcK30gPFbI2jPLbOMf0iP9XjnPbedTj8dp/4lLvpe7NXyd/YpsE9302SdCBw==
X-Received: by 2002:aca:1c10:0:b0:3a7:46d2:5203 with SMTP id
 c16-20020aca1c10000000b003a746d25203mr14178307oic.51.1694525098721; 
 Tue, 12 Sep 2023 06:24:58 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:24:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 08/20] target/riscv/cpu.c: add
 riscv_cpu_add_kvm_unavail_prop_array()
Date: Tue, 12 Sep 2023 10:24:11 -0300
Message-ID: <20230912132423.268494-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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

Use a helper in riscv_cpu_add_kvm_properties() to eliminate some of its
code repetition.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66c2183f20..15df29580c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1976,6 +1976,16 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
                         NULL, (void *)prop_name);
 }
 
+static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
+                                                 Property *array)
+{
+    g_assert(array);
+
+    for (Property *prop = array; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+}
+
 void kvm_riscv_cpu_add_kvm_properties(Object *obj)
 {
     Property *prop;
@@ -1984,17 +1994,9 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
     kvm_riscv_init_user_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
-
-    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
-
-    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
 
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if KVM created the property already */
-- 
2.41.0


