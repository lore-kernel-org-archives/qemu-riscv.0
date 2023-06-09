Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAFBC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:25:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Rnm-0002lx-Qw; Thu, 08 Jun 2023 22:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnf-0002du-CZ
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:29 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnS-0005bU-U6
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:27 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-653f9c7b3e4so1008765b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277453; x=1688869453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=Q2j94Mv+e7Zpjw1sM4pKwrTS4TSbaliX1MWs+rVCYyPore6uwpj6Xbu9DD7l9ytDKp
 Me+fnnQcE0sCPAi45ggfMD2g8FwkCN9L/4k2tokPse0NmKur8nT1uvYPkLhy57NqN+L0
 +j48YxWVRRAB9WRs37bUARbn/4JCdxr/vb8+Q+IAczSGGXwgDHieveGTlykeq+HrCbua
 BczPH12fvt5sGvPscDZPL7DWa25i1XhnaWG9WbGos28YXZ7v1tozstybz82gW5vOAE+X
 I76toN/6s5CuKDQq4HqUnMlOE+kBxYxGQuyLkPixKLQ+/pMf5uyC7BEymBE+6m88O8oz
 rZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277453; x=1688869453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=RLiLNGhWKKpxyGOnc/qnbo0KGrfRrfct9rmoF9QCMe9LcbKjVBLAFvIcw+WtFx2Duo
 khN9QFMZsCzdz9JefNMVU3r8tlwPJLW8wOkClGoscQHdoI+LpbjYXz63zx3MERe5MYQ7
 41PbM6oWClf0c8bLoH95tHKIHRGJk6fc9DqMyXQRbqK0RxfLNZut7Wa1Rl/RCF83N35k
 FSG06KcJNnGlMUJIE5sDDvq8B2gLo/nYnr8SvJklhaR7aXFoxE+5++oxKJ2KKiWLFIQp
 Y3gDy8ZEyw4fCAB/mY4DXLZI5IKbcPKyxBZiKvIZlBTZuWc4HMa+Ec5njBM5EfkaOZ8r
 RcEw==
X-Gm-Message-State: AC+VfDwKDGOWwnbMbybz2StpnumNeGFKMz9tjIlTZQMau23wkdfo2dGr
 OXh2Ifn7Vu9mJJeSP1x5+NOKwA==
X-Google-Smtp-Source: ACHHUZ4J88hO98ur8noOOWkkU19RYjeL7slcH+swWcpeENAUx8ZyKLWebUFFJJsXF+wOqg6tSTYzPQ==
X-Received: by 2002:a05:6a00:1911:b0:663:8255:8cc3 with SMTP id
 y17-20020a056a00191100b0066382558cc3mr29055pfi.7.1686277453528; 
 Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 11/38] target/riscv: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:34 -0700
Message-Id: <20230609022401.684157-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


