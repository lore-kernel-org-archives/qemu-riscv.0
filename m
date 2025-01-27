Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB47C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:57:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNiY-0007nd-IK; Mon, 27 Jan 2025 06:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhr-0006rh-VZ
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:55:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhn-0006z2-Oz
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:55:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43635796b48so27497095e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978902; x=1738583702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4IS3z5t6aeYLZ7NAuHNel+nPJsLHRUkUZSl5ZYMkwc=;
 b=knJHu9SyuiZHxjrTdCFTk5xLIAODPj6854jIhzC/TQhm2RzIu/EE0qY+fnHPRekzuw
 BypN6mGXmoxhwK3Oyf4HDwyYWoSUPGNIYe9PPLOWuqGa7Un2ez2+vGTHUwlE1Hj/Cd61
 80YSTPOEL1cqRhSbTtE9XTgjIIbVAeWJdU4oRGyFMnUK7PxqGiur5FwxhQY+d4xqcv75
 bnZe6ZcMeiEfkBg0JqgByxje+sixQ7n7zQbgo+vcR9vMgM0p8Hi4Ado4YlUiUE7iYTZz
 zroleyWXpcKe8NJdl8O7/8IO6zugb7MUulvdM/vEEjNeHsjOgUCddqj7fvQ5vmBSwgSF
 p6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978902; x=1738583702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4IS3z5t6aeYLZ7NAuHNel+nPJsLHRUkUZSl5ZYMkwc=;
 b=jKh6EWGvNFgmU7XgU+ASNmvPOi+s54WZX2N7+eyycgkVVqzDaHJkDPq1OhV/vNKQOg
 Gkwb8etLIe459qPNHVcXBv08GpWWQJqgwd+UHC9yk/fxNnCxRLshAVQr0e+1gx6L4PUg
 +dbIz3rvUiUMT/0uT9oSa+xT2mlpPJDRspmPquf6D5aBcwjO9d/NsjS2syy28nEShNyY
 NxSLnkd6Pv5iyYCxzjHgvsWr8HuaPOkJXWds+0vHPsycgwf8NLLzksjpki2/NHgxUgaM
 u5zbycDLUpDKvNPmaSyyjO8DjmCoAVKveeKgmxQ+gsxhgjxKtUBUavw5hgcoSOOZk3U9
 /gdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6lMLWvf4jW05MhMxtxdIyukIFzXlZ3QYkkl1D1micMY0C0Vvwo4MGZmWKceDsKcokvlhfYi26Ys2x@nongnu.org
X-Gm-Message-State: AOJu0Yy4V4X4lK1S3w/wQp3ZVrpWdUDvHtBT/57iczogReHfEbITRyeF
 c2j8yyvTQml6Kl1SaPgNllrqrrVxWnDQ6YsV6ZwSvuWYCwggk7iUB3BvcOXGBNk=
X-Gm-Gg: ASbGnctNGMlpRx5gZYDu9IYmw3JEQYaoU6M4aGFDcJco7RJS8o8UHwvMQytzBCzE/Cg
 0wWcQMoPaQ1v07MNYi/EhubryTG3HPzmjsp5a+UYI8GLpPNKwtxadhjGmyDcUqJKP0dDks8hSdQ
 MCzkSMzCDPQfxZXIDLoNh0b6SaPG54T06jPVji9qmKkDKVTCxvVKaA+aCdfFrY6S9c5uK5jEL7V
 fNS1hiTO6p+cwXjB9PGqQ0IFyDbv9FMbFGw/9rj76hN0FZ+rV0BFjsdJQ5K4GfrhCARk5lu5YpU
 hVYD7qfQtM76KWf+jY13150yNkl3iwlWe/uxJyQpKw7mMCfhuHYAJF4=
X-Google-Smtp-Source: AGHT+IHET3rqSbR9s6dSwCNjBB9cODBqyhqFPWhEqy/MaP3DAHoJvFDTTKe8eo5it+0lahivn9T4jQ==
X-Received: by 2002:a05:600c:3546:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438b885f8ebmr162465155e9.13.1737978901751; 
 Mon, 27 Jan 2025 03:55:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48574csm130454235e9.9.2025.01.27.03.55.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:55:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] target/riscv: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 27 Jan 2025 12:54:23 +0100
Message-ID: <20250127115426.51355-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..b39a701d751 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1156,6 +1156,15 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     CPURISCVState *env = &cpu->env;
     info->target_info = &cpu->cfg;
 
+    /*
+     * A couple of bits in MSTATUS set the endianness:
+     *  - MSTATUS_UBE (User-mode),
+     *  - MSTATUS_SBE (Supervisor-mode),
+     *  - MSTATUS_MBE (Machine-mode)
+     * but we don't implement that yet.
+     */
+    info->endian = BFD_ENDIAN_LITTLE;
+
     switch (env->xl) {
     case MXL_RV32:
         info->print_insn = print_insn_riscv32;
-- 
2.47.1


