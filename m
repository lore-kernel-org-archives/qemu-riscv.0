Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D570EB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDo-0006Eq-Qb; Tue, 20 Jun 2023 07:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDl-00069O-IO
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDj-0004LA-HT
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988e6fc41ccso192316366b.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259302; x=1689851302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=aWp/iwoxUbkQolVQKW6qGvPmtiWB/WaMvGJvQaoaJUJXr2aRSCbSXU/LPxwFV8lLTS
 /M5D3laZG6F95r6RJP7kHJ2jYlEBCxIKHLWS+Dl+cxq+ETau5ofZaeadoskTY7rT63mp
 OclFYSl6GK9j/JvgLaEN15/zR607mB6L+FIePPygL4P5kSG7rDAJEIsZ2ji/iDVlZuAm
 B+ZAm4fAPBB0ChlkMzsoTBQpRQ2lcrtTCfqX9boJADTspm6d0aiYkNGiOAOY+zNtFv8W
 ocPabNcOjMN5pCSJv4ROaMtI32+6HwZK/hTKH4y+pBNsT7UaNLywZIxBanBIQqz02sXx
 OBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259302; x=1689851302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=ashrp7GMCd7Fbn1adCb0Lva/KmQk0Ejp39TdcOqUmXpgqhGuzSQgmgjakL7lKrt+YV
 Y2DOF/tSRyrDxDBwUQ0JZw30AGvrxeOe6PZN6o33mJmi24QCqLeklWVMARki/fTxXo6T
 gkAybwPUEiVxhlKYe3+uBjr9kcJ6Yu6GO5A3b1Go4/1pGJURnDwWZCL9ndRs7MIY33uU
 nG5/3XwlQVaw7gCmYqkxIFE43JJkGOhLRmvBQajMwVhS8B60E+4u5ZmLh7C6/cBtEPKa
 +3zbCrKR5LLKu26kHeV+cLKBcUebUcuQtjynpYe/SIpmAibDZPuMJoRbD951fnK7tRz3
 vYwg==
X-Gm-Message-State: AC+VfDwNqkDYNBTjLKRWcM6kxbBzd+qRrY6qjkVvm4Kax8yxdtc9nEJ9
 PAom4ghlmozWQrpewClF2IFO4Q==
X-Google-Smtp-Source: ACHHUZ6xEJBVsjCBPBWExUp7zwTzg0dYwRqynJcvJa25xTkc7oqmpjD5QfxJpZbpY7vlh6l/owd62A==
X-Received: by 2002:a17:906:f84d:b0:965:6a32:7de6 with SMTP id
 ks13-20020a170906f84d00b009656a327de6mr7917240ejb.30.1687259302192; 
 Tue, 20 Jun 2023 04:08:22 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 15/37] target/riscv: Use aesdec_ISB_ISR_AK
Date: Tue, 20 Jun 2023 13:07:36 +0200
Message-Id: <20230620110758.787479-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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

This implements the AES64DS instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index b072fed3e2..e61f7fe1e5 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


