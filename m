Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C2C77B73
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 22:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Icw-0008Kh-A8; Mon, 05 Jun 2023 18:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Icv-0008KJ-Px
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 18:24:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ict-0005zm-4g
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 18:24:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30d5931d17aso2283967f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003873; x=1688595873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7qE+XF1sdC5qKTLQBPA7J0xIVj1iHbCF/ZSK/gcraw=;
 b=TkiOyJWvy3drsZuKtR3vKHprfSuGo0NZQHJKgB/5PIEzC3gKiRx+RCaJuBjBkv2Wz2
 jUaSJz9HpBTLxHrlCEy+JJAsYQd+voXJdLD4vYSSX28BeI2SzhBMU9b5oH6hYkYAooPl
 Gq7a6idcPbtQHnSpqocTfSdiIZyu0FLiYKqyojX0oX4fDNOC8eFoW8zxXJ0tPEnsVKQV
 3KjERfYQhEXhbaWIncID/h1n3Ntn0sctR71FuOyvMTAWxZorMyc4JnCkrRPJR6uAUXdz
 yrhrLyzUW1OarRKrAW7mDzb/MnZ1uB6e/H/OtkM8GS1FmTtwU/Wd/htlXYRhDTYb1bWw
 A5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003873; x=1688595873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7qE+XF1sdC5qKTLQBPA7J0xIVj1iHbCF/ZSK/gcraw=;
 b=caxyN/MjCxHWoo5L+j/kf8FzzzXUWymspNZMnyCEDpoDFmSdaE2Pgf89GkiTBGyo7s
 /rgqtEyeA0ySAUMXQXi3Zy5lVHLo7LiKb3MX4eQ8ahaOpoc0Ygecntp1EXwXTMUFxwge
 b2RSgUk+4i5WOHHiFz2wHL/se9O6MRIywVz/YmjJVvpk/cnvROs+GayPscywEncYlnZ7
 q0cj7m+hKh0HlF8Iiq+kcqQVOAXNmOV+mfR0ru4W5IkNj7nSzW6QgmMMgncOiZ58ctXu
 yM9gqUFNrHH3MOCqCq85aH6WNKfbDQhMELVxUjGBge+2jxGL9kco9Zt/A71ab4b3xHWg
 YIog==
X-Gm-Message-State: AC+VfDzZJWVDaownM12CVk4DuOIIP3vKb8j/eirs0Lz6Tkg09otayb0y
 qB+f6qdAHYxE3LaOrAn4/0eJkg==
X-Google-Smtp-Source: ACHHUZ4FVKtshHeXy8xSUhySjci2Rf84Ng8DD/izGVrrfqSLuPui+NcZwVpgCIOLxjdirlntrzCApg==
X-Received: by 2002:adf:fccb:0:b0:30c:2bbf:bf75 with SMTP id
 f11-20020adffccb000000b0030c2bbfbf75mr159034wrs.26.1686003873750; 
 Mon, 05 Jun 2023 15:24:33 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b002fda1b12a0bsm10850321wrt.2.2023.06.05.15.24.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:24:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 2/9] target/i386: Check for USER_ONLY definition
 instead of SOFTMMU one
Date: Tue,  6 Jun 2023 00:24:13 +0200
Message-Id: <20230605222420.14776-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
References: <20230605222420.14776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..750253e679 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6915,7 +6915,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->popl_esp_hack = 0;
     /* select memory access functions */
     dc->mem_index = 0;
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
     dc->mem_index = cpu_mmu_index(env, false);
 #endif
     dc->cpuid_features = env->features[FEAT_1_EDX];
-- 
2.38.1


