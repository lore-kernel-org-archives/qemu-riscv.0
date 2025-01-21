Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E159C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:29:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFEA-00063F-Kq; Tue, 21 Jan 2025 09:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCD-0002Mq-0q
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:41 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFC9-0003Zn-Lb
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso40969745e9.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469528; x=1738074328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLtjxkwdz6L1VGr45Id+Wfm3w9Chh81Y/cb2LCx94qE=;
 b=G9NCpxCkXb7KaCQ/IPs055hnOPgDAQKTXS147FrPUPJZEDwuRmWsw8dZeYFL50hhMn
 uTRR7cjbmR+Y1utadxek5uxcLgET2vjG1QD0O2W9Ec6Kf9b5Qp+z5cx4TD/iVfR/9LSm
 YzZZl4VwHz0qbxf9LWxeFTf/e/dbldDcELLxe96rQjBHsOPIiLgh2TpHf9iUW9YKq6sW
 nINPuW0qgw1vn0/JvsLmE5e5eWmV4IOlUoeNEc4m8JGGkkaiVvxicX1Me63LwDaMEk0H
 y4yo75TRVnBlDhz0+ewA1Rk6Zy6VF8nzDU7cIFu2doGHKjMrxsgvgygvLM+RPAlj/GDu
 4L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469528; x=1738074328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLtjxkwdz6L1VGr45Id+Wfm3w9Chh81Y/cb2LCx94qE=;
 b=FwH2wIKCzEcu8R7D89/kiuL5QQeBGhsL5wUq/mLILI2+JSCMkOKUrwZ9v8QP0W9yY7
 rmXhqKmuO26WkAx/9cjNvYHyAEEXzD/CrQVBuazwSE4tguXTmPy8nGUhzx2y3xJ/+5cm
 wUNZV+jcivmgaWiIshFD++So4pFiGyMTxTmMxA4iyvy/rAwRMzg7rpkqpOabI5MuUI+H
 aSWCr0e9hy/lYNCf4eUY1iMsTohGvfj7MSatySWeBYohRFN9UqqOF0t5R6z38SY/osUn
 ELOFXV40jCqMOhQRtGbDSn3E+BEOASqX+ZiWIuiIvI389gkM27RaXPnRZGujhAWJgzbC
 bSkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiNRracfYQOQDTkzWpTGYrcfkD042hrtj8qCBPjSOhUlJT5o4Y5Jr5tUdQhv8ODbqkSZge9hn/eaBs@nongnu.org
X-Gm-Message-State: AOJu0YxYR6wpw26F8WFeUh6rIVPO/N4ccCtJCryRBZKJ0hkmWIdjZBzb
 AxdSSiyGt5Kohfv7Istqup08rb8gwWRo3ChmC9KaE0x4fxY2xeHcVg1NOXJjtjDeeasn7UY2YRP
 3hhM=
X-Gm-Gg: ASbGncvxPX0MZoeY8TixFqJ2PfRlP8L9gTsb0+uJEV7qjbapuZVQhFkDuH4SoIFcvPR
 c+zvUbinjmitqB9jYLtof/2n5ZqWlkctYWu8Yecae6LGBftRpfIrCdz3U4LwKrOtwtPEp73Sede
 FX6icProzAYFMudW5X6zqlXRxErE1T/PiTZ0O04F30+b1vUtTeKpxwCWD9jSvDhj8IARRrJVykl
 mVvgNWIfAHm8vupcqTm9Uq0OBGP5fAdtRfc8sg7KSQw1xtRO1/YAF5c3lc2H7thIIMsHrSY3fcJ
 LkgEkQiIi56fXUVBTRUW6q4ktNhJ9ynjxMFlrN81WoNH
X-Google-Smtp-Source: AGHT+IFl/O4MKtba9v34wpsx1JISKH5fHpqun99JFLA44cDthFrGsVsrvg7dwbDEcTwqpfpZD1Dg9A==
X-Received: by 2002:a05:600c:4e08:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-438912d5426mr194266845e9.0.1737469528605; 
 Tue, 21 Jan 2025 06:25:28 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890420412sm184694965e9.18.2025.01.21.06.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 22/28] target/s390x: Restrict I/O handler installers to system
 emulation
Date: Tue, 21 Jan 2025 15:23:35 +0100
Message-ID: <20250121142341.17001-23-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index a750e7a343a..6e2c98de97a 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -356,6 +356,7 @@ void cpu_inject_stop(S390CPU *cpu);
 
 
 /* ioinst.c */
+#ifndef CONFIG_USER_ONLY
 void ioinst_handle_xsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_csch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_hsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
@@ -373,6 +374,7 @@ void ioinst_handle_schm(S390CPU *cpu, uint64_t reg1, uint64_t reg2,
 void ioinst_handle_rsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_rchp(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_sal(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
+#endif /* CONFIG_USER_ONLY */
 
 
 /* mem_helper.c */
-- 
2.47.1


