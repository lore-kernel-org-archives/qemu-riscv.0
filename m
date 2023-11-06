Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F2C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxSP-00053D-Uz; Mon, 06 Nov 2023 06:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSO-0004xe-Fk
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSM-0004nX-Hr
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso30531625e9.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268865; x=1699873665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95fjXxwoCEM5MPpLzleCUNmgt+EGYy9i69c6BsnNRfk=;
 b=kERgngPfzLr+WVZnHNuV8FB/4VhXK2sIKy6Z1w4OBpLpmkzh6UQjABs2JT4ReH/42a
 CtozWKHH6GfDCpAZpYyosuV7Y4pcLhDOEvAdiIMRewQ+e6i2DLChWDRzZvRnPpadgVyB
 RvVrMj6bmDrlH0orddAi0D8MpWBxd6Sv8L8XRAYEjkZDMMYddBx4KT2XmT7qklUKK9hO
 CUZf5j6furb962uoz/9X/pO3CFOXhSnRhIt7vl2RGqa1ujGYzJs0gZpTYEB0ilMNizfI
 4jXAR1+ECfLCz8/6v7g4FLkbdHmUlEiezSRL/P+WRGYVMqspAOrtf/7Pn/eG9F4Y18+a
 KyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268865; x=1699873665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95fjXxwoCEM5MPpLzleCUNmgt+EGYy9i69c6BsnNRfk=;
 b=Vo//9tDvXhHhml6fnN9oYUnhVKW9I/RgfRGWw5u/7995t2CV0vuLLW8H4RJKQ7Szp+
 KCKmsXWXwUet5IvEcuLvFfU4jgBUrQMHIAaOM+7jrnq7iFi3b+SdKaskV7MSiqVhlFYw
 YuFMw8ZLwmvBbdcytdCxEurPzkbETigrjm0DlYbpzJi84cmt+XBkYWRr49b/yWxX6Tv3
 mXgHEYi9iHCyDCQIfUg7Vl8c7sr1+Dd9Y1+E6xe5aoOmxDxIWFfEayEiIZAOckgkNNLB
 UEgD6YTqTIihOoVjZVqEKx0Pq+chiSmhESKZBCFNDmlyJWgkILNtzRAjTUL5YElkEcqo
 HaGg==
X-Gm-Message-State: AOJu0Yw05HRodbhrZdmx/d0nCuUHVz5nxlqxouYU7tZTCxyBLa0SCH3K
 P+RmJstJfzwzYM/lEWNYVCmKQA==
X-Google-Smtp-Source: AGHT+IFA2chfzU/RG3fUnF9L1zuwbrR/mZ3//aX7n36RLMNo0C4jCT70SUW9S7M0scEuKtQWCV9uyw==
X-Received: by 2002:a05:600c:4c9a:b0:409:57ec:9d7e with SMTP id
 g26-20020a05600c4c9a00b0040957ec9d7emr13786805wmp.21.1699268865155; 
 Mon, 06 Nov 2023 03:07:45 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c43d400b003fbe4cecc3bsm11518827wmn.16.2023.11.06.03.07.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:07:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PULL 36/60] target/nios2: Create IRQs *after* accelerator vCPU is
 realized
Date: Mon,  6 Nov 2023 12:03:08 +0100
Message-ID: <20231106110336.358-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918160257.30127-12-philmd@linaro.org>
---
 target/nios2/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 15e499f828..a27732bf2b 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -199,14 +199,6 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->eic_present) {
-        qdev_init_gpio_in_named(DEVICE(cpu), eic_set_irq, "EIC", 1);
-    } else {
-        qdev_init_gpio_in_named(DEVICE(cpu), iic_set_irq, "IRQ", 32);
-    }
-#endif
-
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -220,6 +212,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     /* We have reserved storage for cpuid; might as well use it. */
     cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->eic_present) {
+        qdev_init_gpio_in_named(DEVICE(cpu), eic_set_irq, "EIC", 1);
+    } else {
+        qdev_init_gpio_in_named(DEVICE(cpu), iic_set_irq, "IRQ", 32);
+    }
+#endif
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.41.0


