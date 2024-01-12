Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C50C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPEw-0004Ez-Si; Fri, 12 Jan 2024 16:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEp-00044o-Ru
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:53 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEn-0001k1-FF
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:51 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d409bcb0e7so41147725ad.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095524; x=1705700324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BSvwcHytUhi+gukNO3SeEljDmwi1llbqwJ2kpVHVWk=;
 b=dygwhBW0h9SJ99lnKhLmscZdJ3W/XzjnnQJycnT9aFNg0dLY9sQKb8/IT2K6xrM0wO
 9aP08fxfURLJVdT9KG8Tv2VgNUFZjie2bG0rpcRY/5wdGYMCLFNr5wgLhJS+UPJPmvle
 uJUblPlKzCUWzyyYCHsBNmrAABBzttW3GzB3qmN+eEtjW5QUQlnD+hst7bcUdn0EN3Oe
 1ObhCkjJi4MdroCGHYLvZb5QZ+zO6uwU7uJy6Wac/5xY2r5GduUWxjkQtqn/jQ/3sv5R
 MLZqqpC0fK8O7LVlJBf9u6ilhcjf7ioKIcSxbE0rhQNCFLkFwxxewQB7nVYzZyLiBB78
 5/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095524; x=1705700324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BSvwcHytUhi+gukNO3SeEljDmwi1llbqwJ2kpVHVWk=;
 b=ub1KfBWalztLtSSmlRNE2tGJ4Bg2m6Z0gdJRTG3iI66nBDfLQY1Yt5ZTOKabX1Lewc
 QUjLNxK/HAvPt53p4Zun8AHUivve0omRxjHhwVEYsBoYXACkM5eP6gJHGC8cBtnF3uIf
 gPm7Iy8zndQtDcXR3KLgs+9BV1RGWgYvm2OXfK8/5RapHOJ3Cr/qMPBil/cTcXBj4XCO
 VxMaYPPVEzTsKARxUbw5VGWill5sx4+LnwWBOqAqOxnzr8pWNdsSbL494dSoLgBClTvl
 TpBt9DjM3KSCPrKoTQdY9hIdrfgTZz0QTLahlYAAf0Y8OjiRMB3p6/mwihZPDOS/PR74
 Yqwg==
X-Gm-Message-State: AOJu0Yz7mW8NwBxPoSBH4jCdfr2XNBPR+qTaX0zTiI0Vh2v5s0aDdAGl
 bLKaNH8Vs2KIs0BHRPWZQ3V5v+qKLYChHQ==
X-Google-Smtp-Source: AGHT+IEYG2IpItE7RCQoLKgiWCdop28n01d6IrEO0yPuLPk6vmx1+YKploiOas15gIif7LFCj7aL4Q==
X-Received: by 2002:a17:902:b283:b0:1d4:1dac:9fa9 with SMTP id
 u3-20020a170902b28300b001d41dac9fa9mr1339019plr.72.1705095524744; 
 Fri, 12 Jan 2024 13:38:44 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 08/13] target/riscv/vector_helper.c: use vlenb in
 HELPER(vsetvl)
Date: Fri, 12 Jan 2024 18:38:07 -0300
Message-ID: <20240112213812.173521-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112213812.173521-1-dbarboza@ventanamicro.com>
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

Use the new 'vlenb' CPU config to validate fractional LMUL. The original
comparison is done with 'vlen' and 'sew', both in bits. Use sew/8, or
sew in bytes, to do a direct comparison with vlenb.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cb944229b0..0c1a485d1e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -45,9 +45,12 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
                                             xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if (lmul & 4) {
-        /* Fractional LMUL - check LMUL * VLEN >= SEW */
-        if (lmul == 4 ||
-            cpu->cfg.vlen >> (8 - lmul) < sew) {
+        /*
+         * Fractional LMUL - check LMUL * VLEN >= SEW, or
+         * vlen >> (8 - lmul) < sew. We have 'vlenb', so
+         * compare it with sew in bytes.
+         */
+        if (lmul == 4 || cpu->cfg.vlenb >> (8 - lmul) < (sew << 3)) {
             vill = true;
         }
     }
-- 
2.43.0


