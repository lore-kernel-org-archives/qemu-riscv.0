Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75167C10F15
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 11:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzwsa-0008F0-4T; Thu, 25 Apr 2024 07:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzws5-0007ro-8H
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:02:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzws3-0008El-5W
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:02:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so1781545e9.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2024 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042949; x=1714647749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/DaGtvlqhC1nG0WRRs696RzTAGLW5V48G1JnVnt1qc=;
 b=qDsNuyso8EAIa1u2Bmlv2bVFIvJwqUkA0b3keiTrsJYp1M+wmLxVEFk0eOi/c1I49x
 y/j9Spnv5W2cFVH3W/JMtNSXSnEB1t/WoFawPUsR/0y2OOBq+RLT+GxcvViAsDjt3ZCE
 MuT0xhwNUf+21c3gtc6B/m828+TBcBxCqWWxofoo5VL0DF2ohZgi9rEUzO1B+5YIIhcW
 Y2KEY0/LurwxZBmWySOpgPeLd/XSp1VvFUC/K+qwWOW3UpKD6W/fp4Dd+zIdZIHuLiQM
 IRg5or8377kSgoLSe99VZs+blbioxdAaRbATG8a9H86sUvWnU6Now7aMW7hDHGtw8NXW
 +Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042949; x=1714647749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/DaGtvlqhC1nG0WRRs696RzTAGLW5V48G1JnVnt1qc=;
 b=OYlJzmUz/bl4YNJCx+gWJaVQI7WbTNW8QF2N33SknnguUt+sI+vN+UNZEwhZehtM90
 0oCOhq437hZN+NOdl24PYNzL/suAsCmE5EioLBy06+ajeYboLAyYi3Qf35QIi5tIZvY4
 pVRsa4hpmVZ0oC8Wn6ApJn7vLwghDdho8pmlwjkoI+B+rFXkGODlEPrXaRybxYRc8zgp
 06D6D/6ax6py336WD7/eSGFCuE3eqvsjhIT6Xrfyz962zNwRXSLtgyYCCmUzM3bswmA1
 zEkHEItk+JZcqdm41cZgHVB4n4jXe0krbzhzTEj3Zxdemdf1vW7eqjwP1UUBLdaivhLL
 e6fQ==
X-Gm-Message-State: AOJu0Yy4MxwSbJ+Vd3vsr7JbpFWEkPoDakSAqAfvSVEhhK7hbBK8b8Td
 HwE10vp4Xacjv+3/22w9yylGniwDNoO3xMtjgWx+KqO0NE+JXwb+jRY3VAkqogz2QUOT+k5bJqy
 y
X-Google-Smtp-Source: AGHT+IGxA0fp45S5TMqgqmXhQYaNVa3QNit+EQ7R21X8NbKdw/H6ughSa+c5LgPpgdOWh3hwMMfjnQ==
X-Received: by 2002:a05:600c:4f03:b0:418:ed13:315e with SMTP id
 l3-20020a05600c4f0300b00418ed13315emr3752068wmq.2.1714042949561; 
 Thu, 25 Apr 2024 04:02:29 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b00418db9e4228sm27280045wmg.29.2024.04.25.04.02.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 05/22] hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
Date: Thu, 25 Apr 2024 13:01:38 +0200
Message-ID: <20240425110157.20328-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
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

Commit fd3f7d24d4 ("include/hw/core: Remove i386 conditional
on fake_user_interrupt") remove the need to check on NEED_CPU_H.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240321154838.95771-3-philmd@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index bf8ff8e3ee..dc1f16a977 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -49,7 +49,6 @@ struct TCGCPUOps {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
-#ifdef NEED_CPU_H
 #ifdef CONFIG_USER_ONLY
     /**
      * @fake_user_interrupt: Callback for 'fake exception' handling.
@@ -174,8 +173,6 @@ struct TCGCPUOps {
      */
     bool (*need_replay_interrupt)(int interrupt_request);
 #endif /* !CONFIG_USER_ONLY */
-#endif /* NEED_CPU_H */
-
 };
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.41.0


