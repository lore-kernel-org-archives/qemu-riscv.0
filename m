Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE83EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:13:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDi-000662-Js; Tue, 20 Jun 2023 07:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDg-00063X-99
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:20 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDd-0004Fy-3M
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:19 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9881b9d8cbdso546301866b.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259295; x=1689851295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=xQ02urybD0UdA7ZrUaaXUhEzGh88jpXvfJ4bqeLFN+cv/AZTfVvFBgAs40ZbNouhtF
 KruIR5F5pGhxd/+X7ELeBIsCnZekbWQIWH+MK6vlRYYd+KFoOY0QWIhwfw9hTI3k3kJX
 CT/u+U2r5++PyO7JnqukFNrJ7txWYNIEjmVtZmaOjYYA3hG8+pb3o18D4O3P9OLSSdTf
 Tip1zEb0v4Ef5f9LjclgwYq6uw3+CLkivVEDIg8bf5UaMvCU3Vrl21TSBd3QomIP83Px
 Fjzf0Q9M5P95/sYOIflYRL8JF4vB8eUeHo4HEED1TWolihUhJzQd52//UEurhOSgViKE
 lVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259295; x=1689851295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=Djfxcps7grVs2isE9214E5CglKsZr3OFcA+rCdC2dJuFEqTT6wAyBXfUa7QWB7Lb8x
 xn8s4SauUzYvA6/EICBPzmcdFSEBh3oPhQjuuw4i43uQfOXNl3aHMm72WiwgJ30+JbCC
 QawLklveJmZ2izClx9OLV8CnFHZhMqWbjRGVUwx3NjSQhV1lcaiTsx3aaCUL4nqq9wni
 XjXHrkXGz5Ajsdq59a6gFvlAsRAZAawlEWV8e3XL0jWEE3xrTn2OhUIHNhBDO2H1SGa+
 nhaC7uxjzSKo/uhwSaXJ/TV175HgMZTjGP+P9zPK8d/Z2O4tadhdpWh9n8QogcYsQVBx
 mWKA==
X-Gm-Message-State: AC+VfDyPkcC+X9mr0Ogp/N+Pk3C4sWKuvPkdtUIJ1GfYbrJQdicO7zjP
 GNF9jmZUTjLzxfSiQY3R0fu0L6w1pqyR9xv3wklgu6E6
X-Google-Smtp-Source: ACHHUZ7JXZ7Se3DAEAfVwLoDrYMqRiiSX8aHj2f1GOPM6p/BpaQmvL60wMwuaTj3kltsKO3yTngltA==
X-Received: by 2002:a17:907:6d25:b0:970:28c:f960 with SMTP id
 sa37-20020a1709076d2500b00970028cf960mr16104251ejc.17.1687259295724; 
 Tue, 20 Jun 2023 04:08:15 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 10/37] target/riscv: Use aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:31 +0200
Message-Id: <20230620110758.787479-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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

This implements the AES64ES instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 2ef30281b1..b072fed3e2 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 
 #define AES_XTIME(a) \
@@ -136,6 +137,8 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
     AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
 
+static const AESState aes_zero = { };
+
 static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
                                            bool enc, bool mix)
 {
@@ -200,7 +203,12 @@ target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


