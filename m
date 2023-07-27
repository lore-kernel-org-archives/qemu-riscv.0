Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE97FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9BF-0001NM-Tq; Thu, 27 Jul 2023 18:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BD-0001Ml-Vj
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:56 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BC-0004vV-ED
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:55 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56597d949b1so1089104eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495793; x=1691100593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iuey/+ud8lCVZSrBfFSHOKRgV5c7Mqn96fr5/rKtORQ=;
 b=UMKLNt4VIqQhX+m23AROFsmB90aJ9oUrf5/kU/kEhME8egBN7XUWGzDtfDvZfiCNdt
 7twEi/u/OnrcJyFURN4NUNAJ9M4TNbCj/8dp1bFZLlwLNEMUY4mwi27MkGFMJdd7CdjX
 2N3aLSCkYhPpmSFIbd+7mPHPTfEuwASWgZRQCYnV6fwUnOBgX7MekUf8hFctU8VUa7So
 MtFsI460gFSclW/FP3wkxybFSczUvh8zqSkJBe2y3MR03Xb4E6OaxmjBo3+/ydcWL/z7
 WL7I/WXqjkSNxtUe6/DVB+IYjv+5mGrN13aKJNeo0KWSzrBRU0UTvC8lA1ry354UWxbp
 XYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495793; x=1691100593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iuey/+ud8lCVZSrBfFSHOKRgV5c7Mqn96fr5/rKtORQ=;
 b=QT7HeSjn+TTCj0MkQtFT88PeyI1cCuFvmcwdxyqyFUR1+GhxIK8rFbT7eRytStFDtS
 01W6AG7DX39q9KsUnuOOCAHZZo0rHNgqzNS0Tamwjqon18WxGjC6z7IqPxJ/57AWOEFd
 1pqsb4v0I77ng8v2Gu69/BC4h6RSuA3u4vfky/AQfBjhpjs0EZ7AZp/tvZKxDvNxKJv4
 lCbdPHgmkUBffP8dnUy+fUbcNErr2e8JPSbKyB4Zj7IeAcYMj9zULBrGZ/HkA03yKRB/
 SAiI2zzNIehAW9joZE7frolI/McVQEIb9bV2Z1U0nuTR/+nhoQVDJkwPfQnt/Iu8JSHj
 LBHg==
X-Gm-Message-State: ABy/qLZXmeCqed71XBb8l6HrfMGjf8wI4qRS4x2Rlkjx50e9yXrxvV0F
 IAi5IzTWErZHiHSxoIDPeDTa8A==
X-Google-Smtp-Source: APBJJlEy7tOXR4Hzs1I1uXUwsiXU3RmxNOs9123L0gZMfsuPkH8yBxEt773EhKGxC2ZXSc0cF/rb2A==
X-Received: by 2002:a4a:6219:0:b0:567:8412:7fc8 with SMTP id
 x25-20020a4a6219000000b0056784127fc8mr803255ooc.1.1690495793124; 
 Thu, 27 Jul 2023 15:09:53 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:09:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 08/12] target/riscv/cpu.c: add ADD_UNAVAIL_KVM_PROP_ARRAY()
 macro
Date: Thu, 27 Jul 2023 19:09:23 -0300
Message-ID: <20230727220927.62950-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727220927.62950-1-dbarboza@ventanamicro.com>
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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

Use a macro in riscv_cpu_add_kvm_properties() to eliminate some of its
code repetition, similar to what we're already doing with
ADD_CPU_QDEV_PROPERTIES_ARRAY().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 971dcb2aec..08f61ed051 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1907,6 +1907,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
                         NULL, (void *)prop_name);
 }
 
+#define ADD_UNAVAIL_KVM_PROP_ARRAY(_obj, _array) \
+    do { \
+        for (int i = 0; i < ARRAY_SIZE(_array); i++) { \
+            riscv_cpu_add_kvm_unavail_prop(_obj, _array[i].name); \
+        } \
+    } while (0)
+
 static void riscv_cpu_add_kvm_properties(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
@@ -1914,18 +1921,9 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
     kvm_riscv_init_user_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_extensions[i].name);
-    }
-
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_vendor_exts[i].name);
-    }
-
-    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
-        riscv_cpu_add_kvm_unavail_prop(obj,
-                                       riscv_cpu_experimental_exts[i].name);
-    }
+    ADD_UNAVAIL_KVM_PROP_ARRAY(obj, riscv_cpu_extensions);
+    ADD_UNAVAIL_KVM_PROP_ARRAY(obj, riscv_cpu_vendor_exts);
+    ADD_UNAVAIL_KVM_PROP_ARRAY(obj, riscv_cpu_experimental_exts);
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
         /* Check if KVM created the property already */
-- 
2.41.0


