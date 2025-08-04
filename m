Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A4FC87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:33:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0vr-0003RF-5r; Mon, 04 Aug 2025 15:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06R-00018T-1s
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:09 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06M-0000vZ-2d
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:06 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7682560a2f2so4679585b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332800; x=1754937600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q4dcWPl9MBqqc8IwHAkUcZ6ENPKqu7XF6ON8ISL2zo=;
 b=UidgLR5DaTqqVXqBxwqy3og5YtWUwHJEv+1FtRcg/+di3jZo9hj135eJxJhHHj+p6H
 9RKx7xk2s8qlVJZxJUtcDMnNKh3rP7MQzQkQV8/j0XpcmPqs723VTZ8LRn0slaj1UMQ3
 x03mqW6zmnQeFBJfHEdJwS9wpna2MnbvsbHE7oVAJNjyAuKoL9tZDIeK29EO8lr46CjK
 K+SZ7Y5SsAMLDiFLJHnWfZozkBvy9R/ebs7c4CNMDlY3v1grfhjcdM6is8Bj3gKzYTh/
 GmCsEetcqnXiCyuAem++zcMoJMJEb+GIysm7x/pJ/SsKDrThqkcOH7a6yH6cPagb+Ajr
 1JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332800; x=1754937600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Q4dcWPl9MBqqc8IwHAkUcZ6ENPKqu7XF6ON8ISL2zo=;
 b=DE5T/xw+Z22T3YoU6rhNJ02jJ2e/tWZKvMlBlZyY9wVWtll1qGYnFCD/B042JD8iO3
 FWpLR6VlET509w0uyXgiLX8letxxOySnkPHWqoEaT+vGM/Z1RhYhqxEiEKudMbwkVHqW
 wd6hU9QkYkVSXM9OevpQbxYzgQNp4aOkxC3K8LBOV0gFgABAYQCbrYCkOfWV/z9SuARM
 SdmFmiCxTGjaEbTXa9QmzPvUH7vk2bT6yIXZdDfOPhzYxyj4Twal0E9twbUNbOY+T8yB
 xXY3Fc8cFC8C/Kw0yXzTFHFHmLak+K29TQBby3vIP9a76HgIeBCaIQkdHHe39u6XAv7S
 JWmA==
X-Gm-Message-State: AOJu0Yz/SQJuRm80XH+40X4xnZAbjp3ehIeseG9bQxOc2uDp2IBvTXcw
 gA8Pm5ejMyrsxBzqdF8xqzcjyMm+O+KVbuom3W9Px7izR2Al4xzViCApZ95KBTVUBEE=
X-Gm-Gg: ASbGncuv0P43vakJMEbVRC2Y9LGW3E4bo4DCrGL7Z9bhjNEhOJpMZAWz09IERAkhdQL
 eOhFRMkGwQfpSkG90GRXj4U/1gM2kAG1XQWbWk6TcleicSeBO4mXGXb09U9iQ6rF7CTqnT20o58
 4P/yCWDOSGLqVZBAcD8kj1FP2Ze5iqvGesbYyzO0CYIZZGC22v2VAJnP42Wiza76rC/oQDSiVFy
 1ylNYoik3KxDBP4TyV0tvRMfXfsja29hcrIhkhqoNn00eTU8/HUE1mzNXgNRuTTiZLI2Oa5bEWd
 uGhOaSx1QPwlPZMyyf10TCItGMotZRNbNp6vjlDOp/uoMEyDNk1Sr6l76JNk04+S9GhUW0WEw7v
 Ym9cs52EU8NaiS6aJWgVT2w==
X-Google-Smtp-Source: AGHT+IFhIzYzyLyq54TrG5CiHKFw1ZxpDWNpDOgO8eEtf99d5440BU3vSVekKo+UB3Dhk/l6LOBA6g==
X-Received: by 2002:a05:6a00:3909:b0:748:a0b9:f873 with SMTP id
 d2e1a72fcca58-76c1939300dmr676548b3a.9.1754332800423; 
 Mon, 04 Aug 2025 11:40:00 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 04/12] semihosting/arm-compat-semi: change
 common_semi_sys_exit_extended
Date: Mon,  4 Aug 2025 11:39:42 -0700
Message-ID: <20250804183950.3147154-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

We now check only is sys_exit is extended.
This allows to break dependency to TARGET_SYS_EXIT_EXTENDED which will
not be available anymore from this code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/common-semi-target.h   | 4 ++--
 target/riscv/common-semi-target.h | 4 ++--
 semihosting/arm-compat-semi.c     | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index da51f2d7f54..7bb442f24ca 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -34,9 +34,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     }
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cpu_env(cs));
+    return is_a64(cpu_env(cs));
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7c8a59e0cc3..ba40e794dcc 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,9 +25,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+    return sizeof(target_ulong) == 8;
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3f653c6e7a9..1c593d5e0dc 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -755,7 +755,8 @@ void do_common_semihosting(CPUState *cs)
     {
         uint32_t ret;
 
-        if (common_semi_sys_exit_extended(cs, nr)) {
+        if (nr == TARGET_SYS_EXIT_EXTENDED ||
+            common_semi_sys_exit_is_extended(cs)) {
             /*
              * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
-- 
2.47.2


