Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A265C2BD09
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 03:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRO0d-00019c-9s; Tue, 09 Jul 2024 23:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0c-00017h-68
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:46 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0K-0003oF-37
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:45 -0400
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-380deeb250eso20793265ab.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2024 20:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582107; x=1721186907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58kkK6wdwKfqQgQ7rCeYXt0gAI3/Luy3O1KMAnd3I2Y=;
 b=exjV27dcGEKyxDKU87mNPd9cTNcnH5x1vNsz/EPFsxUbQ9mzeY4Wwuh3zf1o4FPGmm
 YNd9ZYqk1UVFiaBaCrNmJhVhTd8lvtGiuZnCU3Ek6OYZ4zdlJx6DwTPeo7J8ZH+GHWG1
 0MDp5uNraGw8g8jG6dWOK19A2cwmiWL2YYfd8MOJfunebhGoqxYNX4fSL3Iv61FDcGMz
 E6e9p+VF/MfA1NCVeNGvtWwBNfRilMExJiVWZABSpJxJeJk3+5xe6U0acU4rcUH7IW9a
 ga6lVTZietyP9AP/JQDpLF6PDENezElLax2x9LJrwnhqYOLxtWCJ+TFtFxOvsaD2caXH
 qsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582107; x=1721186907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58kkK6wdwKfqQgQ7rCeYXt0gAI3/Luy3O1KMAnd3I2Y=;
 b=m+8TxxXi9wKtkVzxUoFd24nspE7GYrmiIAmMZrX/MmpMtANffDjVgwOEjs7A0ZMpGo
 UZsk4kRKYfcP4dBsif8MM4VUEgjp1FlNqKogJe/7ZzuywQt2srtSEve6UAbDM28ZJb3F
 kT2hU4m1yVkGVOnRXXpE9/YB7Wp3LsAmBhJlrc3+5Ang4+2mNj2dNmCm+suIcUSuMxdL
 LLNAkcb9Vumwp18bZPo1lXr/Ge9WTU3dCF7bzgKWcTJqOXkhwfLzMlg9SmRciU3Ca9lD
 LOiXcD0jHAkt9Gn4nJUx13zF5SJvUvk/Cfg3z0BOOV8hOL8VsCI0QYH3ChdIYPGWqPbD
 NJeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJH+U+w+WSWEbw8wTkQR0wF8sdnVXfFwec+FNl/KKMTK2q0fhBoH6EswvYfPtz7WaY1qhrmPP1JxC52CuidYho1SjLo8=
X-Gm-Message-State: AOJu0Yzfks7LO+Mjke+1frDn0C+E3Fm24jS/gcYpz/GVUIC7MlmGa6cP
 10b1ezdfHxD+7q0t8879ddfEN7uof/kSlfvRfaDvXZG49Pl/vnDtDAzEtesMPkM=
X-Google-Smtp-Source: AGHT+IFBae8GX5XIygcnsRmbRmPQae2k+cIo4jbEhE517qfthhCcMHfhWFkB2DyRsd6v/zYpj8rdgA==
X-Received: by 2002:a92:cdab:0:b0:375:a3d8:97be with SMTP id
 e9e14a558f8ab-38a57213d0amr52860625ab.9.1720582106761; 
 Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 11/13] target/s390x: Use user_or_likely in access_memmove
Date: Tue,  9 Jul 2024 20:28:12 -0700
Message-ID: <20240710032814.104643-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Invert the conditional, indent the block, and use the macro
that expands to true for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 54 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 5311a15a09..a76eb6182f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -296,41 +296,39 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
                            S390Access *srca, uintptr_t ra)
 {
     int len = desta->size1 + desta->size2;
-    int diff;
 
     assert(len == srca->size1 + srca->size2);
 
     /* Fallback to slow access in case we don't have access to all host pages */
-    if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
-                 !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
-        int i;
+    if (user_or_likely(desta->haddr &&
+                       srca->haddr &&
+                       (!desta->size2 || desta->haddr2) &&
+                       (!srca->size2 || srca->haddr2))) {
+        int diff = desta->size1 - srca->size1;
 
-        for (i = 0; i < len; i++) {
-            uint8_t byte = access_get_byte(env, srca, i, ra);
-
-            access_set_byte(env, desta, i, byte, ra);
-        }
-        return;
-    }
-
-    diff = desta->size1 - srca->size1;
-    if (likely(diff == 0)) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        if (unlikely(srca->size2)) {
-            memmove(desta->haddr2, srca->haddr2, srca->size2);
-        }
-    } else if (diff > 0) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
-        if (likely(desta->size2)) {
-            memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+        if (likely(diff == 0)) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            if (unlikely(srca->size2)) {
+                memmove(desta->haddr2, srca->haddr2, srca->size2);
+            }
+        } else if (diff > 0) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
+            if (likely(desta->size2)) {
+                memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+            }
+        } else {
+            diff = -diff;
+            memmove(desta->haddr1, srca->haddr1, desta->size1);
+            memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
+            if (likely(srca->size2)) {
+                memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+            }
         }
     } else {
-        diff = -diff;
-        memmove(desta->haddr1, srca->haddr1, desta->size1);
-        memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
-        if (likely(srca->size2)) {
-            memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+        for (int i = 0; i < len; i++) {
+            uint8_t byte = access_get_byte(env, srca, i, ra);
+            access_set_byte(env, desta, i, byte, ra);
         }
     }
 }
-- 
2.43.0


