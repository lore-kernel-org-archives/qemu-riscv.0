Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED00C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:44:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmM8-0004S6-70; Fri, 05 Jan 2024 10:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmM1-0004IG-AA
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmLy-0002yy-J9
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:23 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3374c693f92so1221872f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469401; x=1705074201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZrhO0fF/4wCYRBDkij/JpNIZFZJdEux3joJ/5vLZ4GY=;
 b=bwi3kpzGGNXCOg+20oW7rcdO6hXQlCRbkxobFttj7cxuRBleMFixnF2Ffg1G7TqmrC
 zyWrEFwzJZGrK8EdQzJLdfazNeoKvWs7HZK2MNvl+tD56VzMbScGxjlhxq6K0NZAIP3H
 GIt1Fq4zu/EwWdj/2oNgAA9VaZWUBLEADJkyV34Oyt+MtzQ+plYOnI4DGDXL8SentVz0
 upHwkNMV60xGHNiqhX1Bq7nmm3M+3eanaKYgES8SO3B+eS6NqQ5jw0UFfxIL8aa6EwxO
 YHBPIxJlKa+zxEEMbe4jnbi4w2Oy/+63Hkwin2DLwSWNVdOesNH0kVhn7t2w5Pc9YWgd
 Q7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469401; x=1705074201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZrhO0fF/4wCYRBDkij/JpNIZFZJdEux3joJ/5vLZ4GY=;
 b=BjyKrjhnx6JPYgexdQZnxR06JOgKVNZsD9fOQeh4jNugK3Eh7XYCeapKdIinrrTJPM
 Eej+CbBI6GJ/+30HE9BUdf5ktInTb1mJldjiKHMb7+oqlV7yKpBeQDZ+lp0hkQQ82aHQ
 m+/Qq1MDIWb9IuG7W6b3kGomYo49FJ+9XuhJGy+GJi9Tq5L81z0GJYn0Fq7CFl86qgh9
 Z5aeVjpqjpgNUW+hctNKbCpN9yJjXq3FBDfQM6eUgH+GOh8L4MANQRqGv1pzaAGu7pLf
 a4GLWy8B5Pe/iizTT6xJLKRYoh+ghSYB+z0IU2Ptun9TnCDbMEumsAUEY1cKzkz6aq0a
 GbmA==
X-Gm-Message-State: AOJu0YxtZoSnNx8M23LxVQP7Mv0JA8UxJ5wpfHvcQU9iJh8WlrkkwHpX
 aFaLsCvdHpULLPJTtXFvXSv/hfW+9UOgow==
X-Google-Smtp-Source: AGHT+IHxztSSE/NnhY4IOTid4JhG7CbAzUhLc9/SoRCe3oHUBTcxxyGJGlHE4o66X9PU5RD/GKJPIw==
X-Received: by 2002:adf:f282:0:b0:337:39e3:3b71 with SMTP id
 k2-20020adff282000000b0033739e33b71mr1335279wro.74.1704469401108; 
 Fri, 05 Jan 2024 07:43:21 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b00336ebf27d59sm1602952wrt.78.2024.01.05.07.43.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/71] target/alpha: Remove fallback to ev67 cpu class
Date: Fri,  5 Jan 2024 16:41:55 +0100
Message-ID: <20240105154307.21385-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

From: Gavin Shan <gshan@redhat.com>

'ev67' CPU class will be returned to match everything, which makes
no sense as mentioned in the comments. Remove the logic to fall
back to 'ev67' CPU class to match everything.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-2-gshan@redhat.com>
[PMD: Reword subject, replace 'any' -> 'ev67' on linux-user]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/alpha/target_elf.h | 2 +-
 target/alpha/cpu.c            | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/alpha/target_elf.h b/linux-user/alpha/target_elf.h
index 344e9f4d39..b77d638f6d 100644
--- a/linux-user/alpha/target_elf.h
+++ b/linux-user/alpha/target_elf.h
@@ -9,6 +9,6 @@
 #define ALPHA_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "any";
+    return "ev67";
 }
 #endif
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 39cf841b3e..91fe8ae095 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -141,11 +141,8 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-
-    /* TODO: remove match everything nonsense */
-    if (!oc || object_class_is_abstract(oc)) {
-        /* Default to ev67; no reason not to emulate insns by default. */
-        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
+        return NULL;
     }
 
     return oc;
-- 
2.41.0


