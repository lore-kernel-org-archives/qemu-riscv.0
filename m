Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A53CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA6n-0007vP-KY; Fri, 01 Sep 2023 15:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6m-0007ut-BE
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:08 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6a-00033W-S2
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:08 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-573675e6b43so1486583eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597615; x=1694202415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlbGyX5m6KtgrJVMCPdMtGmiqD1bES604h+IzM7DCvA=;
 b=ccL+n7phnDi+S5xNAsT0CNaMK5Cr8KqJaxYpDmFtyWg26bnE9nEhPgEh5mEbUnNEbs
 vCuYkwhrL+Pyyo4zq9GRM9WqtzVq8kw79l1CIi8mrJswLdlnLwQKZFE12jEKix98n95T
 dLe4wut3gB5BgMjRvEjHTxa781DUncsr/Hl4JbpwH84KL6jq4IiHObuaIpmo151GqM9L
 Wfl4Og3hgk9BXEJkOCubPCZjVzCZh+pI7vTIR7W7/18L0ZkocG15idtwy3HJSH5ybS03
 0BoEn2Qr765aRpcsrbJawZfvKhZLoIj4UQDHAzxx6zkE83nChmbaV7wO0SrypyNco65K
 JGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597615; x=1694202415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VlbGyX5m6KtgrJVMCPdMtGmiqD1bES604h+IzM7DCvA=;
 b=OnzUGwnwjhrARvz9NGyfIShqCPOlJoI5gM0WWyrK3HilgA3poP9lnzuI6rrD/fpZ+L
 9n8rjNQ2Bje6iQb4nS8RgCdxNWBnh8gmtMenbAG3b7297j9srdxsg01o2RSC/3OHnfMk
 qs1kV1G3kiD16rnYyP56C2Qn8WCQcKeBw4c22WWN/VDG9teAZo2lIXTiPQcOyE8eb1Yk
 3l3Jd8Wuh433QqZEBhmbU0XR6Nq6My9Y5ibKjHWrkiLsnTBOlw4ZrGyJE7AnY5lIBBKo
 1PFQvwyjQFnwxdsAbSP84cifjtChGkZaZFF6EGSwSmOa7EUtOPUJ6pPd/g283tcGbyFe
 KQJQ==
X-Gm-Message-State: AOJu0YyfkRr/w77XQiWsTvEhJhMVEgIGDiRPTurPhTnC6lVpfN0/524R
 18tqUwWOfVXmHQcXWUT9BbvuvZ2WwzR6XlVH6+s=
X-Google-Smtp-Source: AGHT+IH44mryeYRuEWy93olBG9vKcgXh44ING2P3GjvKWFcjh8lR352c6056Z6AnRT4cHZfY2n4DPg==
X-Received: by 2002:a4a:d1cc:0:b0:571:2b59:d697 with SMTP id
 a12-20020a4ad1cc000000b005712b59d697mr3387307oos.0.1693597615724; 
 Fri, 01 Sep 2023 12:46:55 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:46:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Date: Fri,  1 Sep 2023 16:46:13 -0300
Message-ID: <20230901194627.1214811-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
---
 target/riscv/cpu.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86d536f242..d484d63bcd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1951,6 +1951,15 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
+{
+    g_assert(array);
+
+    for (Property *prop = array; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 {
@@ -2007,7 +2016,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -2021,21 +2029,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
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


