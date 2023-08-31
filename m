Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AEFC83F33
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhID-0001QM-Cv; Thu, 31 Aug 2023 09:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFL-00036Z-8u
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFI-0005SH-VH
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so7648965e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486679; x=1694091479; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckF3KMkPZoMJE539B3wi9BjBQFsmfr+Lf+8EhQQKEuk=;
 b=w3BDIGHi0jtA1JGF+WnjEKOUXj3SSbAAMMuWB5/xoS9Yt1LNAHb/z/0YL7+iDsuPeO
 uh9Ve8fGlesKcq/SRxH8JdmnvbLu399WZXFa3nq8tfw5PLkz6Z82Pi+6dmjAcJqW58l6
 u/HpHOnsDXR4fN+NFLkAYSzAaZ4yj1PSxAsSPLXULSxVZ0mwpWAlHlYqJrlkQYl8raBd
 tFxLzvBvd9x5xNbEJRWw+Git5t/DdHMQ73vuSv6XQjZPQGG3MyMq2Ib00xedCaECYBO6
 44rQv1bCSlcYoCvX0db8AygZy3MfJZZ2/A8sb3L42SN+9vnX5u9PZnz/hyDc4PvHaShf
 rBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486679; x=1694091479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckF3KMkPZoMJE539B3wi9BjBQFsmfr+Lf+8EhQQKEuk=;
 b=l9fK7PjMeciAIDxMIgxzxWopApbsLmTYbmhpJI9TdajpwS6FW+3KynzC8mfoX5XH0F
 QhSceLEVcHumQI6dVzYDTeW0NMmlqOmpek5BcpmuXEahqbGoddgqR7FoGrhMHXfCbina
 Svym88NJ3eIoVkPX1yzLvaHwRCUsb6gucfC3AZSluRei0rCbIwhFZX9Ffq1HNwSPQZGi
 aClnEetuVHcdT1iw4r/tFS6xzZWByPnKdcoubKIf00m4Wp3f2yjDWFN7JsqaR3c+64Ms
 Lc3cPHC2NoJ+/QECx1Y9mBmpVLj+d4tqCm++zNO0+guVbUN4FcvEhmRNwRtXO0FFMdKj
 eLhg==
X-Gm-Message-State: AOJu0YzQX4L7h2HnIvUU9nFE4m16zO0kLFiqAmazKE854/ldr9tR6l18
 6hxjpiZp1P8ghHFVH95Q9Eacog==
X-Google-Smtp-Source: AGHT+IEkZQvpqNh8IXLa6Dn0acV+IH/PFtnCo7D9oIisD7eTWS8VOFNeB5x2omzYB+WJYPh9yhdpmw==
X-Received: by 2002:a05:600c:11c1:b0:3fe:90f:8496 with SMTP id
 b1-20020a05600c11c100b003fe090f8496mr3959276wmi.1.1693486679232; 
 Thu, 31 Aug 2023 05:57:59 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003fe1fe56202sm1908227wmi.33.2023.08.31.05.57.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 12/41] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Date: Thu, 31 Aug 2023 14:56:14 +0200
Message-ID: <20230831125646.67855-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Only handle_sigsegv_accerr_write(), declared with user
emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
typedef).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-6-philmd@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d02517e95f..b2f5cd4c2a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,7 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#ifdef CONFIG_TCG
+#if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
-- 
2.41.0


