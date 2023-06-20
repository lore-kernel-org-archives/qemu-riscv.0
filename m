Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D3FEB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:10:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDw-0006P0-1q; Tue, 20 Jun 2023 07:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDu-0006N2-Nm
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:34 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDr-0004Pq-0e
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:34 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51a426e4f4bso5420323a12.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259309; x=1689851309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=hYiqw96JSEdcqpEPp3u5DEbaGKLEdjTy+QYbCk4Zo6bvKleWnKhKLFc+MQ/8O1pc/h
 SpnCzIsLz3NzW9mM5r4MipbYOb+a0t5PV+sWRxBdwEHNz4MPDyLulOTLkqC5dTxPk1pC
 e1SXfkgOppUTo05lShREFAmak8QM092AXruxsz6sJSJQR/zwiNKMyI7k3XTbAirO6y/L
 uk/pRe2kpoDcWxuR0GNl30FUlEkTtN0pNndgrP3DuOHWA/zncnJOt+il3WUMhmEWMAhn
 8B1099REepqbrXsSRQGEbZ04UF+++VM7TJb1CTB4Q1hjw0EH6/A5WP0d2f3i8/KAlVXu
 eGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259309; x=1689851309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=Ydcfk3jvf1W56xcLo3HlUmdP/qWoOT0OG9tGO7Fo/hMkjpYejg1/hb5yFjTPHvylv/
 YQYEmPmNv9YwH1tUG6xYV41h2giFuuS15qfHU4lNikbomXcxc+paaKtK79UUEKV0PcnH
 eQIm2ZnRCuji5MRoCT7PdUbnQxgG1aE2YB3rZbxM26OlDWVFUaZ9eFS3iyXtHxwiGJsn
 V9Kw382A9P0yfNXY+yhlV0cRYd4Z6hXO3PAaol4FtgxlQaG4aLEKkDsW5FhNXsTfkZFp
 LXERD+UqlzEGH9AGBxfxGFiQpWODVh7CAT4aIW5vpS7Y5PqnsGiGoZexATPsqnNRxue7
 /0Pw==
X-Gm-Message-State: AC+VfDy243QlYEac5u7UJ6a/ooAX3lNeWTHOhuKuUxo6/Z+xWFDRR0Fw
 NC7VP1bZKLsEhgdUdpjTxtmq1g==
X-Google-Smtp-Source: ACHHUZ42M/56/3yquz9F7YXB8z7Kodfy9TBKfVBk0xYPoZC0PrnycJvruu67J99JezN20HxSKoz9qA==
X-Received: by 2002:a17:907:72c1:b0:96f:a891:36cb with SMTP id
 du1-20020a17090772c100b0096fa89136cbmr11715525ejc.0.1687259309674; 
 Tue, 20 Jun 2023 04:08:29 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 21/37] target/riscv: Use aesdec_IMC
Date: Tue, 20 Jun 2023 13:07:42 +0200
Message-Id: <20230620110758.787479-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
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

This implements the AES64IM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index e61f7fe1e5..505166ce5a 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -272,17 +272,12 @@ target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
 
 target_ulong HELPER(aes64im)(target_ulong rs1)
 {
-    uint64_t RS1 = rs1;
-    uint32_t col_0 = RS1 & 0xFFFFFFFF;
-    uint32_t col_1 = RS1 >> 32;
-    target_ulong result;
+    AESState t;
 
-    col_0 = AES_INVMIXCOLUMN(col_0);
-    col_1 = AES_INVMIXCOLUMN(col_1);
-
-    result = ((uint64_t)col_1 << 32) | col_0;
-
-    return result;
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = 0;
+    aesdec_IMC(&t, &t, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
-- 
2.34.1


