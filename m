Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B4EC4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:26:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXOp-0007tb-5A; Thu, 18 Apr 2024 15:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOW-0007lK-NI
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:07 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOT-0007Kg-RO
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:04 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso2087397a12.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468359; x=1714073159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5AN2zfNkbZgNzq4yMXaRJrNHQuv3As8IXVhhvnN+gY=;
 b=kWfD3cqyKXkpJywFm4hz1taUSWiPgaOQYBWpLgXQVQj0bWi+YeQgPvJ+WLCJHiIX0N
 grwLsEFVrGWzc7ambiU7upeH+e1uujDt9a2EPAC0HXplilD8BdYmP+aLjWs+vorzCoiX
 +VjcyFPk01i0vtgHWioVZgyXfGrWIRk0s8g01FMAbjpwT6NogsoVraEONx7F+RCs1GqU
 EwjzHus+71ToGm0Ql2ALRzYJc1dL5J9dniYs/wiy77ocyonO8D31o+KeeWKXhejU+nPm
 dThiL3kaSD+uqU8d74EjZ/JCb/vClEVrFRYqdwNXp46ITQLshCIQ4ti0tgtjrYJs9iW8
 fCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468359; x=1714073159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5AN2zfNkbZgNzq4yMXaRJrNHQuv3As8IXVhhvnN+gY=;
 b=UQb2t7xvVG1wGRquEouNBpYKxs2IZ1Wje39hiJgkrdNGqbNrUPJWrbPdyovUiE7fxT
 U0OC4/2Mj52Nt7ht4YFx1CnboQo4dtvUnif7vLJ3CgdAIu63FKzV7Uhk6gKF52rbocJo
 bQMnwK1aJGUJnAav41bRl3I8pG9IyCXsWuQEMViRfXb2RcbGGbHx9Xq+FicatQiz0oBN
 10X550HoLqdYvECa0n2c1qzlC0n7AreXvqAYwDoaPZLMrF8KD/2eviap2CLWiyMYU1mO
 8RBpJecKnAaygaq5oYP2Qc6ChDQiV+jvGvHsznm2AfsAz+BPigWy42VutVoacW6JYfHZ
 Yg1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW49Z4KNEeveu5G1s6UNTY8664zXOl8jUPkMqbfXhlbwofZmomjs1U5U9gCDTsZmxWrXj1zQeh8YFqALqoz/YnaO06zIT8=
X-Gm-Message-State: AOJu0YzCPWgi1W2/jw4xFwOy0P/oSbWMLQJlgJmjpMkyMBGYipWIPZeO
 AseA7JdhrupQsOtwSI1bxORHVocB4usyakNmhav97eYJjGpGHeMoNYwGw4CNvJA=
X-Google-Smtp-Source: AGHT+IFLSLQi8pDowoTVpwvSQYRuYn13I7Tn86X4cb0qyEAJ8RLgeCtpawdlVQYvcABi9MDTksrlmA==
X-Received: by 2002:a17:906:1949:b0:a52:5925:1f76 with SMTP id
 b9-20020a170906194900b00a5259251f76mr47729eje.47.1713468359292; 
 Thu, 18 Apr 2024 12:25:59 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170906435200b00a4e657a5f1asm1259445ejm.112.2024.04.18.12.25.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:25:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] exec: Restrict 'cpu_ldst.h' to TCG accelerator
Date: Thu, 18 Apr 2024 21:25:04 +0200
Message-ID: <20240418192525.97451-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"exec/cpu_ldst.h" is specific to TCG, do not allow its
inclusion from other accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5b99666702..f3c2a3ca74 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -1,5 +1,5 @@
 /*
- *  Software MMU support
+ *  Software MMU support (per-target)
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -62,6 +62,10 @@
 #ifndef CPU_LDST_H
 #define CPU_LDST_H
 
+#ifndef CONFIG_TCG
+#error Can only include this header with TCG
+#endif
+
 #include "exec/memopidx.h"
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
-- 
2.41.0


