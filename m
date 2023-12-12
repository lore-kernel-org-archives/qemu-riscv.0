Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B896EC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:38:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1z7-0000XG-UQ; Tue, 12 Dec 2023 07:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1z0-0000BK-IM
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:30 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yv-000778-1Z
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:30 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1da1017a09so681679366b.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384523; x=1702989323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
 b=V2bpmBkd48t+UNKRlIcWMrYDCzWi9/sx4EivLf4EzGcId4inn1eEis/vsvfpsWE7VW
 RRD6f3vjqweDXjze4iftHpqyQoEa91DlJJdRnxHmTROxuBbDQtXsioyqZt9F0gxsiXA9
 3hy0UE7ztkaZ5oTyXxojBYxVEdyoaFzdpexlDsXMP4XA97A+I4oc0zpUtypNaJ9XAojp
 mC64unLKsC9D8/clJ9aaXBxrNjXXKCTaKnRIqZIXE2Gm+mXH+9ghlnWO3g8vaB8evDaV
 rRQETwMBlS6316OcaqUfjot1KMnlwxflCPV6vSrcF3G2NLn8bLBBCYeiNAdVKRLXdY91
 livA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384523; x=1702989323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
 b=ejjv2ReW6an7CsU0phyF9xehRYHxlCGlyitfJbk1AWIDwKr3jZk1v4UfVRz/9kKjup
 LoyjZ96eyxNXqhqBPLwfg9n9geTL9d1Xygcym2WwOW0c5uglwAco1/hV5JniPHr50gsl
 lTYdI8MBii3fCsvG5voZdIsStAZGXbJFvyxPS/nHkt5T9Xb6w77tY+HbNalKK3zCd2d1
 /vzzwj+Kv0RHndmC5O1XabFVxgtbk7m/mbkkK+0IS/M4EpBunHfVjj/sBK/QOzAIlWyk
 teb5/3fWhCaa2izD1tZenlJ6CNM9/T6eVg8Wv6P4ZY7eEmkzKyqld9SsyMk0QJtz7pHK
 ex+Q==
X-Gm-Message-State: AOJu0YwvVVFoDePpHjxrfelc5tsSef/u8cCSSDqIcioBCPyKKN6y0SKc
 u9utFKEU9miaL2jAzITBkO5Ksw==
X-Google-Smtp-Source: AGHT+IF60peqW5k/uhTLNgW5AZ0aUrcQ3SinmlWCqRPnEUhcmf7p7Z/G/HBTRVlN8Ug2DgZM/V4wzQ==
X-Received: by 2002:a17:906:e0c6:b0:a19:a19b:78b1 with SMTP id
 gl6-20020a170906e0c600b00a19a19b78b1mr3781322ejb.116.1702384523264; 
 Tue, 12 Dec 2023 04:35:23 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tl12-20020a170907c30c00b009fd585a2155sm6134678ejc.0.2023.12.12.04.35.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/23] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Tue, 12 Dec 2023 13:33:47 +0100
Message-ID: <20231212123401.37493-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

tcg_cpu_init_cflags() accesses CPUState fields, so requires
"hw/core/cpu.h" to get its structure definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1b57290682..58806e2d7f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -37,6 +37,8 @@
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
+#include "hw/core/cpu.h"
+
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 #include "tcg-accel-ops-rr.h"
-- 
2.41.0


