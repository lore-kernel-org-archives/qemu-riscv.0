Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99876EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMXKR-0008Qk-2F; Thu, 20 Jul 2023 13:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJu-0007lH-Gc
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:20:07 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJs-0004jv-Tv
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:20:06 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b038d7a5faso808798fac.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689873603; x=1690478403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQF+9SP8CkK5LKa2mDG+PRrucl4AFzrOqCCyKHU51/o=;
 b=WGFDXVOl6i+Ymi0vllyir1AM8hyLp6rFp4gIL0g13nNhSZlc91xvnYMJkBIRBbxZj8
 D/3shBs/4usDo30se09AKvLxXntqiVBF11rqTH7sbxE5Tm4nSbj7jpu2PGnRtq+lpEl4
 PwVc2fJVxj65Gl235fHQ5tZcoqw23ykSei2zgOWsiiZvnaMDdTwNpcj8IF7SZYiR0bm1
 Rlj5gvFeMzjxv4aW4iIGKm6UKI3fdxEyy2xKs+E47G5vL39uCxCSJcP2SuDLwXo9JtBg
 tddWnTmTukGfUUFD+ebROn7t7HpGwpR4QKFAAnHgMPLRySz5OSLmdxG2/oDB81bz7ylr
 XWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873603; x=1690478403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQF+9SP8CkK5LKa2mDG+PRrucl4AFzrOqCCyKHU51/o=;
 b=TDhEhZwpeG2z01Aajlv399zUaqoQm7OnEfI9nwBPPNBvF0aOxEbSDpYEtGUCBJI7A5
 kxWgR91mobQ7R/L8Y/JOKx6XAAOxDZAR8wNTDzybdVwlFCoZkMhTC/Unl0/7Oi8bIq8v
 Hd06fmu6RxKrH1d6vPdgnPGmYaqWzTz7BeEEymen8nngBYwAtTarXdjdzzDMWT3qqT92
 xbZ420B4z5CbypbjkxEXKrzwTuxkVI6WE5P05HJUn5UFdEupiO/5XFg3aegY/dFOA5H8
 zgU4ngV1VQ0quMbHtW7/4VY1TEuKuJQtXyzP2lBWHgddrrIR4sVx9pZndruS1iQq/5x+
 RYLQ==
X-Gm-Message-State: ABy/qLa0SDSrrCQqn74DnhQeR284l6ZsYimXEdrGMBALhc6Ggld+G6ai
 rUH+IVx8Mwvy1FWIO8pKSlaF7w==
X-Google-Smtp-Source: APBJJlHnI2NzOyJraWKYMIt5XaSosoZYnwnWLm3mXze1egNkmOkClA003qKcZ7dMHZSKz+PO0WqRYw==
X-Received: by 2002:a05:6870:f10f:b0:1b7:6158:621a with SMTP id
 k15-20020a056870f10f00b001b76158621amr122754oac.47.1689873603244; 
 Thu, 20 Jul 2023 10:20:03 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a4aab02000000b0055975f57993sm582564oon.42.2023.07.20.10.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 10:20:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v5 08/11] target/riscv/cpu.c: add
 ADD_UNAVAIL_KVM_PROP_ARRAY() macro
Date: Thu, 20 Jul 2023 14:19:30 -0300
Message-ID: <20230720171933.404398-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720171933.404398-1-dbarboza@ventanamicro.com>
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/cpu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 23169a606f..8675839cb4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1900,6 +1900,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
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
@@ -1907,18 +1914,9 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
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


