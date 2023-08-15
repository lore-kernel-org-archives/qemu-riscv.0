Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE63C41513
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:38:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2g7-00053W-Uy; Tue, 15 Aug 2023 18:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g6-0004xK-GF
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:18 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g2-0006FW-Ct
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:18 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a44cccbd96so4485326b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139092; x=1692743892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBT3xPmW4aLd290yWQMEvBlcruF1kLAk2oFCE88UVBQ=;
 b=nso7y5GY/rZYBgLZTkjBR1EQW/uSFZwnLy2mL1Ebs+XVojAXg4/VdYknWjNzxKhGmQ
 HdIZ41VtgSFnmLKGed6LKC5hZWbpSwhx1UAnN3Kdc23F5RpMMTblVqaN6sye2mY6C/qO
 OQgApCb5JNLCfQz7PQBQ6datA1gDVOw4lY0Jdy34oO3+1unXgxD24qs8e6bGrtuu3nsk
 bwak86G/tGROH5OJvKpN7Fd23pvuhLq2CgYcOgqLzcrJDInTwGAUPJyMcb+ejFn/bBZl
 9PtEOYeiTlirZLAZoMG4g8eW+0M8pI4dx2AfBVkFcvPhfL7XvLz1ZLmlclw6+LWtDFUY
 C7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139092; x=1692743892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBT3xPmW4aLd290yWQMEvBlcruF1kLAk2oFCE88UVBQ=;
 b=S4Ce6dTRRaqGNvoTV2hPfQv3cRN8KPOsOQQv+f1Cix3JHky0VCdRobpq6yYRhR9ZG5
 mcCQlTcz7k47u4Lcu+TfGkc+YaczhV6WsczYB74f+P8Ti2s5U4L/HHxQcbajuqJ21RKY
 TrzpH/Oo9JuoPyozBu+kVknWggDwd1/JGMXTjpbPufnMqJBynwzI2v0byiOXmsKABm20
 AzzfRlHKT8FrNLwiRjQ7fx0W6Pb0hVed9jNSurwBpzFJ8zhOAw5jx+Y/1sZRhrwvZi0/
 ziLdsUQ0d7or8KOJkfpjadT3+3Z+VYwOMy4SJMoYwV73nQ7iwVK6xOUKJOPSFuYP9XNx
 p+Gg==
X-Gm-Message-State: AOJu0Yz2vldaUad47xajHvS4NiTCsNL7LizgSEYaN5HGfPh6aY0ZxEVA
 Hd0+f4njW5f7h4YlnpxfNsaugA==
X-Google-Smtp-Source: AGHT+IEFOYm/eojdn+ocGQ9ZgNpyBHFlBhWh1I/ym4wWuGtNw9qz4afzVSprMP700cXWg+fqPH3ntA==
X-Received: by 2002:a05:6808:bd2:b0:3a7:44a1:512c with SMTP id
 o18-20020a0568080bd200b003a744a1512cmr69382oik.5.1692139092784; 
 Tue, 15 Aug 2023 15:38:12 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:38:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 08/12] target/riscv/cpu.c: add
 riscv_cpu_add_kvm_unavail_prop_array()
Date: Tue, 15 Aug 2023 19:37:37 -0300
Message-ID: <20230815223741.433763-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815223741.433763-1-dbarboza@ventanamicro.com>
References: <20230815223741.433763-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
---
 target/riscv/cpu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a0c14d1a0c..3636cfaf2f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1908,6 +1908,14 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
                         NULL, (void *)prop_name);
 }
 
+static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
+                                                 Property *array)
+{
+    for (Property *prop = array; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+}
+
 static void riscv_cpu_add_kvm_properties(Object *obj)
 {
     Property *prop;
@@ -1916,17 +1924,9 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
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


