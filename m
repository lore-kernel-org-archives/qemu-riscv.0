Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303BCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:16:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL9h-0006d6-FR; Mon, 27 Oct 2025 07:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9Y-0006FZ-BW
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:44 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9A-0007cB-3T
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:44 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b50645ecfbbso945911166b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563534; x=1762168334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99wY+4qgow5/XXKtFXSxRzQjqRZizwoEw9ERNRXbkf0=;
 b=y1s9NCkigk50JZDbj1DlK2PjS3XKZabSJqRNhbKz7LQrbY1oFI/VPBr2Y3MpI9E4mL
 wu9GvMvtZvpVONga522a3tqFAaLckYygoe10mN8ZYUnjhovDKVs1sR7J/VUagYAUm+FX
 L0fugHo51Q7uabBN4aYDzMGjIm48GhyzeSfXuI49v2KficbK8M4h3luhmmMBbySTUdqJ
 FKxlPkcqV467fAd+lXSFdpy3DNOmzSXFGAWYl8dj5T6OpkNg9QPgePPOBocdbRRcF0j1
 Ge4PsFCwPFp2N+5Z+L7r/ozuej3q4RUJXMezvG9p3r6mWr0sw1KD0h1f07EjNYyh4vvg
 1Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563534; x=1762168334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99wY+4qgow5/XXKtFXSxRzQjqRZizwoEw9ERNRXbkf0=;
 b=ugjSa1a5Ps8cNKgcv0K29vYMDosuqzEMVb3AAyyNtfbzbKpoxB3YwXScZYrpjwYXXz
 pS4fsvmEU5ERv0cK3UccmP7LObj1kx1ikpPPtiUHR935APC6oHyoti/HOXL0gkVk66yv
 R8Sc3rLuhs7C/N9cJuUN+fydXjT9+W9CI7HaKCmBtJY3JDsGP7oBUyTTeE76YdUHBkZE
 mwD4ow4UcVSFgqB/q6Fx2EURm4BuNrU46ONFiCwsaRRgKcpPkTBB02o/S79rvZOhLjTy
 /S5HTCvdF7nhVYlICx59do/Aj7ZwWgoc2cZos/Bmc82bpYpLcXmHqNgW98sZsCj4vO0H
 1+xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbXRwZmWFBRf0GgXaM7TbPxbX8NrsRAz/+roiXjQjy3OzBbpkDZYxbVR+KMbtfk88Zs4ke8QKiDJWt@nongnu.org
X-Gm-Message-State: AOJu0YxVED7ojiKBDYEaT6Gcz8vEzUy/OaJcaLdSENsuNxwiFM/0hAJL
 vQsEEKLLZOzt4pckaeJSAJkIyhA7wk/FVjAWuAQrd4ea5x9XRnoj0RRRvezrShffvc0=
X-Gm-Gg: ASbGnctYKfkVS4nmWlmVRzzLWYpXbyXMyembs2O90JTfRAzLV+bV2M1WH9JPGZy4s82
 DIStLDwghImddvjxZvapO61SRixB5HsWYDGfuhdj5NdadPT8uPjTkos+3IsJ4KumHG/CFOgbVuw
 3kptqheRcEuyMgdpCBRnsT9u8xf/GkqvsVPI5s+aO6XrEfMHS0hifWLKhMdza0nHVqfwZBWtXDi
 lIMrkLW1i/69L4qRqnjHAxOWLQ9NPQbVqBRJHs2UGptXrDvOlm0UjrnprYu+GCKMyLZZvzyNDpZ
 LyH5fKXY7ZhKe/CQh9ijZgkwR/U1JH262ax7HzWyIF+dD6jSVGo4b+dWWgatibeaB47VftnZgrz
 dRQyusdznKP3ysOYUp3qqLN2jPRjW0OdSSzgAAw+9oe9gy5uYEtS1+9Nnqfk72vSEbhAmxOztwO
 9d
X-Google-Smtp-Source: AGHT+IFAsNEZ+YI0fTj3+OVyMqueS8NODeiYMhkciUB7twUSrCCRe95Tk7Kfy7cqzVEbD+wz6+XjSg==
X-Received: by 2002:a17:906:fe4b:b0:b0b:f228:25a with SMTP id
 a640c23a62f3a-b6475a0347bmr3777669866b.64.1761563534193; 
 Mon, 27 Oct 2025 04:12:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853386casm723218466b.15.2025.10.27.04.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6FF7F60F51;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
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
Subject: [PATCH 25/35] target/sh4: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:32 +0000
Message-ID: <20251027110344.2289945-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

This change places hooks for SuperH targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <yoshinori.sato@nifty.com>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/sh4/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 3b18a320b86..5d6295618f5 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -24,6 +24,7 @@
 #include "exec/page-protection.h"
 #include "exec/target_page.h"
 #include "exec/log.h"
+#include "qemu/plugin.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/sh4/sh_intc.h"
@@ -60,6 +61,7 @@ void superh_cpu_do_interrupt(CPUState *cs)
     CPUSH4State *env = cpu_env(cs);
     int do_irq = cpu_test_interrupt(cs, CPU_INTERRUPT_HARD);
     int do_exp, irq_vector = cs->exception_index;
+    uint64_t last_pc = env->pc;
 
     /* prioritize exceptions over interrupts */
 
@@ -176,12 +178,14 @@ void superh_cpu_do_interrupt(CPUState *cs)
             env->pc = env->vbr + 0x100;
             break;
         }
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
         return;
     }
 
     if (do_irq) {
         env->intevt = irq_vector;
         env->pc = env->vbr + 0x600;
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         return;
     }
 }
-- 
2.47.3


