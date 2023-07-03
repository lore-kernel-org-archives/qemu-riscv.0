Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8CEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGS7-0003eO-Fn; Mon, 03 Jul 2023 06:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRf-00036X-IM
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRO-0005xN-3m
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fba545d743so56889825e9.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=eRaO08ZrDSuzrYp5BuQ8239RqbroaXpv62TZftzya4xyfWZ/pv3a/OfQIK1aCcwJZ3
 yCXfLyGJm9p2USDzqFkHExVZ7/j9Ei6Vj4hUxLFughLgCj8kVtVn+uv+onAPbhGcQfMH
 XA3dJnemVe1rFO+5/pEaBcgGbWBWIh+ax1qvLhr7t0W/Gi6Z8x867zxMVwy3UPbL/2Ce
 LglqD9dgoDoTH2IKrzDvQ+Lrm868YEIN3Fiqh+Urgml1XnUphGlEqtSs1aj8THRHduu8
 akt7plmLkGEAW2sDV/odopa6KIDyZIUYuJGnlYDxmbtOGjD9ufsWRFt0J1ByD7lnQ+lU
 bpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=kSlhV1Bzqxt2CZZcCHJP+Svhp0EmHmgAsr+0tq3ZrJOTyiWUdPzc3ZFK2UHd2V0lkw
 riGPkOzcQZnohemOUeQ2JIwti8oovN8k41zm19mTtXtK4WiPtGGMhZokIAROifOrA70q
 DNRoISDbs+tV0Wk0ygm4fK2YHgxicY3HRLYmrn26uqEUDJB4bYn3W+oIxrz7hW1mGj+4
 /j20DVKLO+IHGZGoQP1AUhulj7JPSwWdcOCvQSlTIeBZwiLAotpihcM95GPUVM1JsvC1
 ra5zBcJD1dusQQeMQp0OAKObg7EP8WRRuhfMIkkAdO7gUeNdxcjEIO+oL8+HUxeNKu8N
 c7Ew==
X-Gm-Message-State: AC+VfDwtcs5egWZ6K1LH79usVbCJOcrXrJXZ4n4eeyl0G3gNDeQfl/yl
 FoDDOCiXSTNlsfic9G9VNOzgEA==
X-Google-Smtp-Source: ACHHUZ54TQr3KHjx3kUgsMExtgYRezoDG4hOV35YxOFbMzO8obAmcBz06m3y4qk2YbX4WPodFu5Phg==
X-Received: by 2002:a7b:cb4d:0:b0:3f9:b17a:cb61 with SMTP id
 v13-20020a7bcb4d000000b003f9b17acb61mr9585654wmj.13.1688378752763; 
 Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 29/37] target/riscv: Use aesenc_SB_SR_AK
Date: Mon,  3 Jul 2023 12:05:12 +0200
Message-Id: <20230703100520.68224-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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


