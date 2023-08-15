Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A0C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2g5-0004wh-De; Tue, 15 Aug 2023 18:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g4-0004wY-Fz
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:16 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g0-0006F6-66
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:14 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a7781225b4so4802289b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139089; x=1692743889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ijcnw0rMIsKYXNXEvhEuvRumM2r6rsE7c0XzS7gCaHg=;
 b=DtVGE+mLabqVmDycHoVn79gzSgGqukBsAts6o+ue4DjGcJM1Z4AkYf16WvrZ/ws7Z4
 xMhkqSpkF1X/DLw1SlHBdU1x7Qlxsm8/11qV//93rxsh+VwVKTFgsiICO3UB/9e/Lb4H
 Xw5MSwgRKNEshSEssHkLUA4dexxDrtXZpg5BXN7U/UKTnEWrT1w+BFgnZxluIU9fXpGa
 kS5nvphlEXSUUA5l+ZL5U2sbigm0rbac2KNnmbad9xRY9zhrLDBsyenylXVFUKoHHM8r
 7JbQGuAsG2q4QhIsIv7atBHQHggQFizLOeFTd4ACni+5+QGPZhmREXBhtE22xLgfjMpV
 75zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139089; x=1692743889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ijcnw0rMIsKYXNXEvhEuvRumM2r6rsE7c0XzS7gCaHg=;
 b=ePI40PHkRYAuoD/wX8u19EsY+3JVYjTXmjF4d3VZpecaUi6nYqxeXRHLA9xPZhM+2S
 bfD2mQSIhjaHdAPfhcFn7kJylH3NMLzO01zI+Qywlu5QM4PP82h81qQIhWEtQqzUxhne
 d+QiK0GkQbLZd1zj2WY9faZ1xE9Md3mJhTDmGppqg4JDqtYoXxCPWRIMkRtcTUp/+dkn
 uKb4jNN78r3gFswDrFTqXz5hHHXASaQVIbGhYZPMnle5vuHCf+7CVU92GzgPisyMoGNG
 ZTi8WXPmZ5+SyhS/6/K7IkAJMOU/pg0YSutxo6dSWSXoppFJHysqryoOuv13pbVgGcx4
 e70w==
X-Gm-Message-State: AOJu0YzvJrFUJu7kasO4UZVJc/QZUiL4/TA/Rn7n77R0sZBFbRSyo2W7
 KaJ0MP2rHM6l1lHIRi1BfKdJsw==
X-Google-Smtp-Source: AGHT+IFbdTJ27FOLUrzs9ga7Qp9PZL1hC79zrqiuWxsD+ATyuOthaStDJdKK+XJ4XjSl4LfBpVFvuQ==
X-Received: by 2002:a05:6808:11c5:b0:3a4:317d:eb7c with SMTP id
 p5-20020a05680811c500b003a4317deb7cmr116747oiv.0.1692139089645; 
 Tue, 15 Aug 2023 15:38:09 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:38:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 07/12] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Date: Tue, 15 Aug 2023 19:37:36 -0300
Message-ID: <20230815223741.433763-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815223741.433763-1-dbarboza@ventanamicro.com>
References: <20230815223741.433763-1-dbarboza@ventanamicro.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
after recent changes. Add a helper to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 520c5c9f96..a0c14d1a0c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1883,6 +1883,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
+{
+    for (Property *prop = array; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
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
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_extensions);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_options);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_vendor_exts);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


