Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98ACCCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDLA3-0007HB-5j; Mon, 27 Oct 2025 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9m-0006tw-IE
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:59 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9D-0007dW-6v
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63c3d7e2217so8634528a12.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563536; x=1762168336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0z28648v5upStp3goElPTngqMFpsAWHgbwxGLXuRw+Q=;
 b=xDt0juC3FhSkM2G8QWu34cACJfUUH5PywrVchPt08lXsbt33JjavVn05QGhvkzWjf2
 bv4Ksgi0cuRoZBGeOUcSj32ckJ/OSAOQDX2KQFWTSrtGpjI3QnLV9nNNh5KXSJDX0M/1
 mncLpmM3o5UuLEeJtB7p1sCNHVJGaKuDgEX7RqEhN7qXUw1qZJePliW3GggZqi/1oOce
 2E4RNX6oJPrZNenEHSR8q8ECB7CWK3H/xLyWBNrmdFulxQ58hff5DhBG5XgexganfT8T
 qz4mXiIshX+Cks3wr1v6tSSkLfQYjzGLCtcH1CB0/CbvxoTzZRQ6BU//7zbnyPsF7eux
 FBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563536; x=1762168336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0z28648v5upStp3goElPTngqMFpsAWHgbwxGLXuRw+Q=;
 b=ket1U+oemT+RCf/hdpTvWUY+9r6av5tY06yJfx/viU4a4ySUNJEKf4+vefVzvQvyse
 B7GK8mitzFw7h2u1A8E3K2DdsuJ848BYlmjVA4cQCL2IpQTilRIAp4r1AmgF44K8gvSV
 LS/xFrHxiIJqdlG6bkV7CHb4GAlkUDQEREvHFIGBmyf2dagGTHnnwoXIQzQLLWJXAu+K
 jd+M9bBB5IJ6HP5I8BgK2QNE4AJ46sABaKqXjLent3bpERmkncuZ85K7LpNMSy2vHKdK
 84XsIoS1vh5dS56GXZtmROrgGFODXVukhPML4AHqWvtedAZWtDVhvurfWpeaLc2RQ2KD
 HpqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNQkyaFqveyVJUuViePr55XB1HkuU/BXpuqIIzvu4KSJaTeQLgCAo/JBDLZG5EiRXhTizq+w9g2AJt@nongnu.org
X-Gm-Message-State: AOJu0Yz9EM8SSD7Qh952f6hsXS8Lm4GE5wtw10Ep6dPVMaQqwM/3iJHY
 5l2eM77UHuwO0rYpFk6xSMEaMQborsEIRdbDHG1V4dPIqwYHdtxTSnLby91cmgpH9oY=
X-Gm-Gg: ASbGnctsfRI+aAceTyFRdF8HIcQlAaLBAwThPN6DfSq6RuvleVkAO93b1uU80P+rAUI
 oRHMm/FpfNWPZwVi9g9pgSUwBGlfIDzXH5qgn7XTisywYGvocIX2PDKzYAvpJ29E+J6weUEi5jg
 AjcOy5IlPoRgFnaQS+3FvPXBOy/PQdyypGhuCQVVA6/ioWfPhNsSXQPCRJj38lPVPP5SQ4K77px
 QC2gfQTPanWwegR/WQpbY4qgjys3fC80yNhQrmS1t88+C3sOG/Ogp28Qn0us+2xS+42efR8R1ih
 IlJ5LqWwYSwcdx+499bHIprgC29hsxn5WGR1C1OTGrAStaxUcP6Pta0TswW9LAfoIg58+cMOr/r
 rppp4odJ+0vGPo7FZ2OVt/bNDhiCV8QXaF0WOoSZDkLx3shikEKF0dGUKsW13N3NlM8OrzcFq9y
 6G
X-Google-Smtp-Source: AGHT+IGtXcILpFjNKjHSXNgWZhHZOhoowu/Ap3Pe4wTW27bBFXzroSN+iJ+/t9zMqaCjNKOlNCR34g==
X-Received: by 2002:a05:6402:1d53:b0:631:cc4f:2ff5 with SMTP id
 4fb4d7f45d1cf-63e600e9980mr8555052a12.25.1761563535726; 
 Mon, 27 Oct 2025 04:12:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e86c6d7d3sm5603164a12.27.2025.10.27.04.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EBA425F8CD;
 Mon, 27 Oct 2025 11:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 20/35] target/openrisc: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:27 +0000
Message-ID: <20251027110344.2289945-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for OpenRISC targets. We treat anything other
than resets, timer and device interrupts as exceptions.

Signed-off-by: Julian Ganz <neither@nut.email>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/openrisc/interrupt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 486823094c8..d357aaa7da1 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -25,11 +25,13 @@
 #ifndef CONFIG_USER_ONLY
 #include "hw/loader.h"
 #endif
+#include "qemu/plugin.h"
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
     CPUOpenRISCState *env = cpu_env(cs);
     int exception = cs->exception_index;
+    uint64_t last_pc = env->pc;
 
     env->epcr = env->pc;
 
@@ -98,6 +100,19 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
         cpu_abort(cs, "Unhandled exception 0x%x\n", exception);
     }
 
+    switch (exception) {
+    case EXCP_RESET:
+        /* Resets are already exposed to plugins through a dedicated callback */
+        break;
+    case EXCP_TICK:
+    case EXCP_INT:
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
+        break;
+    }
+
     cs->exception_index = -1;
 }
 
-- 
2.47.3


