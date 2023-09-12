Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872F4CA0ECA
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3OE-0002sQ-81; Tue, 12 Sep 2023 09:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3O1-0002gZ-7D
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:01 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Nx-0003Yu-H2
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:00 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bdacc5ed66so2973586a34.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525095; x=1695129895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/+8OhgFIU3gLGWTCwQO/5HwWO22OAQG7y7TH74axdc=;
 b=IdFpndro+mqWbdAusb/HnBLNtTFLy/MqDMGtr0VW7sX9r9+YvtjhM7DCEUrJad/8A3
 fo/1Ed6wv/uzS8HlxrzP3YPYBba8PETS5U8l+YfJBbAukUo1J4c3hb7nVdjygHI1ybRu
 1fDQ1Zy0W3i82pd6fw7KukJ34q3kPujKVWxDT1wFLCtxxxJsbDqYZ9VRMh8TLvywcFWp
 IB0BbSSi8kv0uoWck19jwgioFEYVm08PxASJs4TYIsWmL5rlDaalKGCokHrMoxTO4IRn
 In+7cF9lHmDYkBYgtGYsmKEaJ0fsgU8VeCVFsvK94S4x4cG3VKs2CV2wTfhAKFKrjHAj
 iMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525095; x=1695129895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/+8OhgFIU3gLGWTCwQO/5HwWO22OAQG7y7TH74axdc=;
 b=ERUcRZl4rnlizTbyqkcuqk4A8htO1/lTHdzbqMkpyjOP2M7yTa9EDVNhUIkZ7CkYq6
 +lohwhVq6fKljoujANypjs+Cy0z4vT3Eaq2jElxIrtb+V6CbICqFB/4hcq2U5EkQRLdK
 1xVUorcAw5SgJuu16ju0x3ukpI2z3kMCo8rTpVBo1TAnFfAzrkMrdEZ5CBBuSyeUf5kt
 /ZjGBEBYGzU75QKrPD4REWEAvZhKVAN1mCTk63Lj8qxIwUVKl/OAhe/V7EiX7mXoWYuM
 fjzCUKFW3EDcCYuhbeZR5sJ1aiP4lT5LVmDwl/fKbIhcBZ6QaCd87YEZW9UFPTN5RyS/
 90xw==
X-Gm-Message-State: AOJu0Yx9bbni/+NhJHbkQJVjwH9wz7XT0eYhUeMN4ZfIk0PtZnVPBlpT
 1Yy/vRpK/0wMvMhyWjA2mkUTqQ==
X-Google-Smtp-Source: AGHT+IHmc92Cip9dZAs/7P14CKt1abxkyGGE1UVpSwwKmDS9FD8tHEh/1t9GsymTXrlMhWo9ptJFjg==
X-Received: by 2002:a05:6830:1347:b0:6bc:cde2:3038 with SMTP id
 r7-20020a056830134700b006bccde23038mr1559259otq.11.1694525094826; 
 Tue, 12 Sep 2023 06:24:54 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:24:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Date: Tue, 12 Sep 2023 10:24:10 -0300
Message-ID: <20230912132423.268494-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9111a83a02..66c2183f20 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1932,6 +1932,15 @@ static Property riscv_cpu_options[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
+{
+    g_assert(array);
+
+    for (Property *prop = array; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
+
 #ifdef CONFIG_KVM
 static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
                                     const char *name,
@@ -2005,7 +2014,6 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -2019,21 +2027,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
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


