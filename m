Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903CCC7EE37
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:29:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Roh-00048T-G3; Thu, 08 Jun 2023 22:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnu-0002sC-0l
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnY-0005eM-Hz
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:41 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-654f8b56807so1293700b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277458; x=1688869458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=jTZ1GdnuaVJ/K9msc/E4nzU9PPq7Ifnw3S7658EFXGNtEaBhIoTQNrs2vSeowMjVHa
 DNjSxUo3gqIhCcdXCnHNI1UG5276w6vvHiOY87WVW/gfAi2vbHzjX1oeiUIBUjyL7PtH
 Dq0La4s7K+6+1ik0J66iAP/Q9v7VfEFjFRQ9d7gVYMZx1X6PKrLk1gsEOELSYXzPIknu
 DW/Mi9KszF+LmdqJGxll1rGhcr7KgIqzR47ZR+Pic5IzeBi8jNAmrUdsW+Bk+oPlOsg9
 3gwy0jeB8q/YUqlaolh/3jQ+ziwDUWvw3Wz+34lDGtT5/kMUOhrbdJdkvE+OR18Y1oDz
 Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277458; x=1688869458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=Wf/2f25AaFg3zSvPbTEj0y7omopkqsUCQiYwVnnl52bvhKs0VQDpx5OWDoO/eDfAvg
 4srPqknERb7XbCVlJqdAzpQwZctCH2kNP7LODFc57KPmyzhKj+m5PUOdce9/VgP9VdYe
 VhcbtuJo4+y41aLQBOZzm5cUtbfwNKxcZrs/gVjQEhdP70NMew+PwnICx7+rG4khuLAP
 BdfZdCk4v1va+J5VQg/OA5WH8jKhh96gClQHrMhkRtj7dAHNs7AKj034ht8hx6RY7H1C
 PvER6kTO1IMzPutdSbkUXlvRa3/gtO1vtI1RtHRl4VVK/FDXvOPEYE9gOn2pXeXjeMqu
 5P/Q==
X-Gm-Message-State: AC+VfDwXzz7mk5XHVRVq35l8mWroEP6Do8POIvi17i316KnazIqxOXRU
 mYvzqD6Rqzf+CudnY8xoero+nw==
X-Google-Smtp-Source: ACHHUZ5ahTZeKSRjV4yF5dfQARGmSl/5nar5EgANY6dYjtjRIazT9M6taKsJQ5vxR2R/ppgT/hQSgA==
X-Received: by 2002:a05:6a20:3cab:b0:10b:7400:cef7 with SMTP id
 b43-20020a056a203cab00b0010b7400cef7mr73162pzj.17.1686277458070; 
 Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 16/38] target/riscv: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:39 -0700
Message-Id: <20230609022401.684157-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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


