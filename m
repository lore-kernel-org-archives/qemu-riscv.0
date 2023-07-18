Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D229EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 21:05:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLrrn-0002iD-Bw; Tue, 18 Jul 2023 17:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrrU-0002ZV-LU
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:04:02 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrrS-0007NS-Rl
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:04:00 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6b9defb36a2so1457349a34.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689714237; x=1692306237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HY7pDNszFtan2CM1rV0lkqgjVjDDObnFnQjxCzN5jiM=;
 b=nGoTsg69IOtq1YBW3HIqHZZ5vpCwwFIFkDU8WR8yp1JUIjv7VVRwtgPjMV5xPF0ilP
 e+4YKDtsLKM6GaUCXSqncHQmCsk6/sVxpLmD28LGpkZB96bh4f1LcmSCfITMn6tlESTy
 cIMh1YajCigoNdFiNFRYGDAs2OCpHhUYOtAzMpuY+goVvVcmsF9vzGn/49vOTDP9h4Vf
 H3IYu9EGLusCSuJ20+tRyhyLt8QHwT4OAZPBgkw8aAuxgmF6/Algh/Sk79MkgjVJXcJ2
 8Iybba541EO0wC7waku68paK37geHKwQU4//vC4QOttyjc035Dkwn08ydCyWhgF2dxFV
 XGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689714237; x=1692306237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HY7pDNszFtan2CM1rV0lkqgjVjDDObnFnQjxCzN5jiM=;
 b=MJ+ZgRJiyuf1LDajZvWTRTIlBFWgKDOsmnbz4pCc4IFFTbdJ+4C9zGGI3s7tKvgnFh
 WARFwm3Bt3GPyNB++zx6Q9MHvZTGwJ2icZrzJ1YtRITzW1IacTLrj6I7OuNABC8VAr1k
 esVp1F3LA3jI/bxv4YcXTGvVED8XGGsnGvE6qILMlwxSsHfv4jugxAugpy1mOHd4LBEg
 s+wH96fKeQfWdBXunL453XKPcW1XyGzaLIIagZIa8Mp/hfy+LdFdbs4E3XeUe7Oxxw4c
 WIQLB5NZLOEw+6epre5yGhpmNRMkmY786fIOstgbq3lBCK4XhnET93xu6B0eJHhIGtsi
 uskQ==
X-Gm-Message-State: ABy/qLat5OejKWsrPB80jcp1lgh6xRRQp//pvairGpm1oSSv5tDS4JOe
 0yvv8lO3E1dw6k8wXclnTzQ6qQ==
X-Google-Smtp-Source: APBJJlGCsaubt25oHgImsuPonMAomXFejS2imItNlHVk9s7aDd5bXTKiCj0FzX1w68U4D0qYWTBvXQ==
X-Received: by 2002:a05:6870:a2ca:b0:1b7:5ee0:bd50 with SMTP id
 w10-20020a056870a2ca00b001b75ee0bd50mr17221938oak.1.1689714237385; 
 Tue, 18 Jul 2023 14:03:57 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006b96384ba1csm1160657otp.77.2023.07.18.14.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 14:03:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v4 08/11] target/riscv/cpu.c: add
 ADD_UNAVAIL_KVM_PROP_ARRAY() macro
Date: Tue, 18 Jul 2023 18:03:26 -0300
Message-ID: <20230718210329.200404-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718210329.200404-1-dbarboza@ventanamicro.com>
References: <20230718210329.200404-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
---
 target/riscv/cpu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 58cbe410e2..7f79585bd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1898,6 +1898,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
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
@@ -1905,18 +1912,9 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
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


