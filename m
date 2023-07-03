Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CCC001B0
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGSQ-0003sy-H0; Mon, 03 Jul 2023 06:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRi-00039T-2E
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRQ-0005yz-VZ
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc244d3a8so42903235e9.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378755; x=1690970755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=sSkSvHAzE6szy2s/YZKLXOrmV/DNOM/hfJliwDO20+aCK5yfPlQuvJIK4Ny/+DSezF
 lGthRG6DVgO6RJDs1l6J6D/txgyszoFL7D/IRwPP9GZiNg9vb2+/B5vLNbG0ci2Rqk/u
 CoSAlCGp8IwCzYiMp6CI6CsNm9wBojnqcFq0rPtrs1AstbZYBp/8ZK/W+g+7J9weBxUz
 UZ6wM4yre1SkNLH+gJVD/jlEKHqS3iLWQKEyEXbe4PhtIAVuQ4gcHLb2AhsA7Zuu4fcB
 gUX1A2XvacoPC5FHFKQnpS2+chQysOE2lofnOAzOzkQ8D6nBnxmKgNzzkZX/rCeUCWAQ
 BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378755; x=1690970755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=TS2dyfsn7oJe+AwUKtVDw8q5rvh8rGbiuK/idKawSkKqyQq/cg0RlPY/InHMJsp+OD
 E9Hm6TGcQprxX3kWSnOs5dtj7Yi+kEttSevYui4Vr5RRaSudcCI29xGlZW8xOzovDgER
 5JQtTd8bCvme5zkymqryKX+hz2qAsIgoBu7OWLVrYXCSYOGSN2oF/kVnYuEangQzqIIF
 T73Dylh9WrcplhNQP0lXX//ib5zZuMLSDLrae4b8xUwp5LqrhV7hEDYvSQWTrVWF9m/B
 UOq5Hnm1oh/nx+jGuPxZIqAFd+D/FYk/oPUo4L+oMdduaLt8CuwmEv9ct75/j9EgrQgt
 ieJA==
X-Gm-Message-State: ABy/qLbI86PZDIkVJJYHBQ4G4A2YFgoasRlCcr+Qe5zugdozbVkhcpBv
 lLsDS1HPO1LuePvxl+M6OjNRPQ==
X-Google-Smtp-Source: APBJJlE6r93sX1n9KRDNNAOWMCpOMNGHnRdTwDH/XU8rPqNGSaSYCxjebVbwiQw6r/ni3VsEZq0ITA==
X-Received: by 2002:a1c:7207:0:b0:3fb:d1db:545c with SMTP id
 n7-20020a1c7207000000b003fbd1db545cmr4893277wmc.21.1688378755590; 
 Mon, 03 Jul 2023 03:05:55 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 32/37] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:05:15 +0200
Message-Id: <20230703100520.68224-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 505166ce5a..c036fe8632 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -198,7 +198,12 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


