Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98818C0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:17:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0Su-0001ZW-PZ; Tue, 15 Aug 2023 16:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0St-0001ZE-8z
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:31 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0Sq-00052U-VF
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:31 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5607cdb0959so3174493eaf.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692130587; x=1692735387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCOWjm+U/PUrL3cAWmcaZPHqvp8GhXWkgFHPJPAiHMQ=;
 b=I2DtZW/Xk3rN8GN8E6Ply8IPgwK1JirNED5XaplYABPbF3DTioJpxovKYO7suTCvK8
 elCmQyboXkJp5k019SC3W7+mr2kh1FomO5HDhyWagNykrMlQkzrXvzeRY3Nt9sxLFzil
 2x0x3jFO+b85uSgjbVc/Uq9Jed/vHuHPmFxbH5i0zvyvxX8SGYcghg0Isa1nAEJ7rLiN
 yzENQ7xI8bQWKpAOJlzNjQB0kc410+9M9sWKzXJQslYYbHB5zA1CSgwZTd9eLX8AIFk/
 BWuUwgOZPTCWPJkOftKQSLK7VX6Pi0TEMTY1bUx036zHv9ruvNND5dzbNXkyCQ7ASjIn
 VbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692130587; x=1692735387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCOWjm+U/PUrL3cAWmcaZPHqvp8GhXWkgFHPJPAiHMQ=;
 b=azLIF3iLQk/zyIeK8G4cUhug+h9QzhDaHtJtFSli4mrVCmiUTJ1VC4gH940d2wiYSa
 /+7AKGty0h54apazxne60XviQG2wIjif2qnSEhN0hNxJYpAvyfAkx98jXGvZ9JK+doFW
 D9BEN5cuiiR9BAnCtiuVSTXNlPAUxqjt7IYRrQsQa65rtk3NeZNN4e0EF3AZkb2gMnG9
 zD3rbC6cvt+mvW0Mk09kgzM+V71DOMl7n+P7VJz/h6MzvwWd5i896nfaXkLdfsMF3zys
 NACmXQDIif0SDWi5creeOvBkD/4pm8QUEemi8mESFz3DuJPMQl2HzroMyeYGQfhciXtw
 TjnQ==
X-Gm-Message-State: AOJu0YzE7RxEk4xFNPcPQB5W7v2stp4zgqzRpQjKJ1DYzunTqZJa7weY
 TTfz/Yg1y2o7o/cN0gItxlh3MQ==
X-Google-Smtp-Source: AGHT+IGsx4pJnIaMi8mnGGMk2EfftxzHUKnbUT+22sm7bgrDSc5AUY22CFLhROLzXbGRAUXdWv1acA==
X-Received: by 2002:a05:6870:ac2b:b0:1ba:3ff0:4934 with SMTP id
 kw43-20020a056870ac2b00b001ba3ff04934mr11971961oab.12.1692130587576; 
 Tue, 15 Aug 2023 13:16:27 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a056870e80e00b001bb5b2a958csm6658203oan.23.2023.08.15.13.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:16:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 07/12] target/riscv/cpu.c: add
 ADD_CPU_QDEV_PROPERTIES_ARRAY() macro
Date: Tue, 15 Aug 2023 17:15:54 -0300
Message-ID: <20230815201559.398643-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815201559.398643-1-dbarboza@ventanamicro.com>
References: <20230815201559.398643-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

The code inside riscv_cpu_add_user_properties() became quite repetitive
after recent changes. Add a macro to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 520c5c9f96..8e1d944957 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1883,6 +1883,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+#define ADD_CPU_QDEV_PROPERTIES_ARRAY(_dev, _array) \
+    do { \
+        for (Property *prop = _array; prop && prop->name; prop++) { \
+            qdev_property_add_static(_dev, prop); \
+        } \
+    } while (0)
+
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 {
@@ -1939,7 +1946,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -1953,21 +1959,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
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
+    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_extensions);
+    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_options);
+    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
+    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


