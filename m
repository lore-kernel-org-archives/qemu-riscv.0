Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED66EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGRG-0002cO-PJ; Mon, 03 Jul 2023 06:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR5-0002Zc-VC
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR3-0005hc-6o
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3143b70d6easo206247f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378726; x=1690970726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLgfXZyf9aATX9TfQItUdKukGg6cdQDyWQ8EagJh33A=;
 b=Pwm1FCcYBssMW/ZiMKlkhySlLJ1mlbpGNDpDn0wMiC1glwRLjTVaHH5ifjW0ad/CTO
 dmjyRLekq5GnQulOD4U0B64r1TEy2U9/MsnRdDF/9K+PMzUILSxT6lpzqf/uNZkxXQw/
 zEcLPGcSosKYDMAYX0fR93xfgsnUk+RnaFdteNtVKMM7vUNsjp6nXpG0CKbaULIT/38f
 VCcUHEuuc02lxjrJtyPKN500p/rncfFXHcRJai93ycWui8xs70S52fOYUcQG+o4PBbRL
 j7Dtx51SSC1KA7ek+TFm0dY9QMdigg6lTjcZLefKOHHUtQaTRaN9yFAKpyLuguaUiZZF
 Eliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378726; x=1690970726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLgfXZyf9aATX9TfQItUdKukGg6cdQDyWQ8EagJh33A=;
 b=bWyVXCn8qenVaDzv9eLA3ihY4tLUg/DM+FjMrTNhJcC8iMWPr7wWOwDciTMldk0JrM
 EefHra2EOQS0/cwcJEoNc/ppxgAj9IStu4lUrCel/B6azmbZAaUdYaI7mYg3bM/K6qiH
 08JtmAZtqf6cmJjY+JI5IRo/E+DMw8C5VBhOhyXPjE9Gl26+kB9qCtNgdGfQJZwL2fmZ
 f4ngacNmxSdYkg3fqMP0lyFWMdHs2V/P4UhKuFlI0HbGZSH16RYaADxTvm3TBHS+DRMj
 JqhP345/o2lPbJ0R9Wqk6izI0gNu11JTrv8LAV9GDbyGPaQ5FiJ/xh5QEMPqp/ZdB2ux
 7VMA==
X-Gm-Message-State: ABy/qLb3DsaoeweJQWElwgV5sR5CV1sKCznefgHwig+J1FNfgvJJfZ0m
 mTRoQKz7MEsulluME3RnLipcBQ==
X-Google-Smtp-Source: APBJJlHMNvRgBMS2fdkLtQKX6G6EpezDfKcM92HoF6jyhXre/KAsfcyCZNhyk8cdeD5KrOorow4BuQ==
X-Received: by 2002:adf:f7c9:0:b0:311:162a:ce2a with SMTP id
 a9-20020adff7c9000000b00311162ace2amr7620806wrq.29.1688378726642; 
 Mon, 03 Jul 2023 03:05:26 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 04/37] crypto/aes: Add AES_SH, AES_ISH macros
Date: Mon,  3 Jul 2023 12:04:47 +0200
Message-Id: <20230703100520.68224-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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

These macros will constant fold and avoid the indirection through
memory when fully unrolling some new primitives.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 67bb74b8e3..e65c97e0c1 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -108,12 +108,24 @@ const uint8_t AES_isbox[256] = {
     0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D,
 };
 
+/* AES ShiftRows, for complete unrolling. */
+#define AES_SH(X)   (((X) * 5) & 15)
+
 const uint8_t AES_shifts[16] = {
-    0, 5, 10, 15, 4, 9, 14, 3, 8, 13, 2, 7, 12, 1, 6, 11
+    AES_SH(0x0), AES_SH(0x1), AES_SH(0x2), AES_SH(0x3),
+    AES_SH(0x4), AES_SH(0x5), AES_SH(0x6), AES_SH(0x7),
+    AES_SH(0x8), AES_SH(0x9), AES_SH(0xA), AES_SH(0xB),
+    AES_SH(0xC), AES_SH(0xD), AES_SH(0xE), AES_SH(0xF),
 };
 
+/* AES InvShiftRows, for complete unrolling. */
+#define AES_ISH(X)  (((X) * 13) & 15)
+
 const uint8_t AES_ishifts[16] = {
-    0, 13, 10, 7, 4, 1, 14, 11, 8, 5, 2, 15, 12, 9, 6, 3
+    AES_ISH(0x0), AES_ISH(0x1), AES_ISH(0x2), AES_ISH(0x3),
+    AES_ISH(0x4), AES_ISH(0x5), AES_ISH(0x6), AES_ISH(0x7),
+    AES_ISH(0x8), AES_ISH(0x9), AES_ISH(0xA), AES_ISH(0xB),
+    AES_ISH(0xC), AES_ISH(0xD), AES_ISH(0xE), AES_ISH(0xF),
 };
 
 /*
-- 
2.34.1


