Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A221EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:15:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGSE-0003lw-Ta; Mon, 03 Jul 2023 06:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRf-000373-R5
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRO-0005xt-VO
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so3122870f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378753; x=1690970753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=CyHtq4SuWKPtI0enq0XMRv9MmHffCsVArxB+WqMcFwOePyiyBKr7+ngSf1TchOnl7X
 LAqaN0+c+/DRVoHb/6FWoHCUqhtI3erVZ1zldHnSwOtPJogJOPn5n/SvLV02nvYRQAup
 eqk3dr/aeKoIAZ24Fc17rnpqo4Fm7LdzbbPTVaVobK4ChNXqmfe8mv5z2PSZdQPGGnrs
 mnnOIodGxXKI0z4TkWpUBARUaAN+osWtHDhiVZblyUDzRyWWzZBzizm1q6leYKPtXV/4
 RuUv+bV0wvN93xyfNrL7D3vRlQg6UjO4dAQViMJA/6+vDLith9OlnljFy3HrvZOJ5d6c
 38Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378753; x=1690970753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=lsjpj3KtViMWmi6xn4xj8sjOBWHbjr/F+or6UWqluAOEI4cSpLgN04wxCQWAiawi4Q
 MVSbfCQwsS5TYkvf1cxwqpYKM/8hW+Yw13h503QIeSgN97pEa9e/td+E5dZMgRnRFj0s
 L7nPUwTgbV3cBqUSgAg+rm0JQFkbuIydHZ+5qO3vYalBrogYzOSEn9wgmgL7/1fZRYfd
 xEx2MRorY6gRNqQgiVTHfhSVej7rMNTpHhgSd/Q6X0RaxVDzIsYvsaI0txkZmcgR7QN+
 OBmca7R4oNtgy14xr2xooSHwPpfGO5jovwkONLxKWNLEBIKj6zIJOM6M2sTneeXeuuMl
 oVew==
X-Gm-Message-State: ABy/qLaNoAC/IomGpKXcRYzJcNeGLQywBuqNprDNlkDrpLjJr5pBfP0x
 bw9UuyKQq18B9CypSVwsIboxeg==
X-Google-Smtp-Source: APBJJlE7vUUpB9o9nv2Mz2UGo5rcPzTxUgRtjdi6gFx85Q3YHWJyCBQfkHMqCLvPTk/GPLphZlrbng==
X-Received: by 2002:a5d:54c1:0:b0:314:3b78:da77 with SMTP id
 x1-20020a5d54c1000000b003143b78da77mr430121wrv.29.1688378753715; 
 Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 30/37] target/riscv: Use aesdec_ISB_ISR_AK
Date: Mon,  3 Jul 2023 12:05:13 +0200
Message-Id: <20230703100520.68224-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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


