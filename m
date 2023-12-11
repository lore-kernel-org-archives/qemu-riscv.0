Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AE8C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnjE-0003ki-4c; Mon, 11 Dec 2023 16:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjD-0003gs-9P
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:15 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniw-0005ea-UD
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:15 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50be58a751cso5664569e87.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329717; x=1702934517; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
 b=PSIdCiEyGl+JOEJWqcEgbPqXz7U43FDIOWiJ8wNku7wJVrg6+PaFPkTfVB2iV7f0mS
 U/Cumm6EOxRSTkhhJdoIh1PmLaDic5DnNrpiXRYpQ547VbGOZ9KeHzux+xFLx653fSly
 kxISniXZjBYeAghvb01BVnOXsGTJyRp6Sm4b5Awim1NJxAMlGt3VcLz8IEQDCW2Ek/+O
 xVeFd9cj5hpF0YVyAPYUjg0eaov34N5i5W4oBEpmcdAzz5fA359FIYLmpoceCHMXHTGs
 LWhHkHpRrOwiz/WV/Ix4S9tL3cIdWiDczrz61qFmobKpGmWFPUjfEIuxWMy4isFHIQ2b
 LzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329717; x=1702934517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
 b=FapJyVPntMRsaCnUfeNAHiJBBLu+Cy8IvEaYls4p7F0h3YN9RAEEwVEFckiufidW9Y
 Uu71vyxectPGNBEqz6FzjAnPtBnXB6VJoqWODwV6pohmDkkrc0vzqKx8cyHUgViiw5zW
 Ix9AcMSsmgdtYKrqxLV4aX6hxpgYmlV536T1CwYnQscGkoe7OZZpLrBZHGqVxZ7i1cSs
 8hTW9Abx8YFxM3mqXwI+/S6/qjo/4IZt6Er8eDUODSmB/oRl3wLNP97VSSZll/Pk9ta4
 mwJZtiZYa8pkroaZoAP5dMnqpROKk5FaCqj6boNKLQV/PfmzQXCto1p3fbgd0Y8+eGaJ
 8gJg==
X-Gm-Message-State: AOJu0YyikhuFfc4OxN6eodqbhN+zBz+flxBxwlxlDW4MhHybiVtjKvKY
 4K64+dPqkLHDBphHbXIr1XNHVQ==
X-Google-Smtp-Source: AGHT+IHDtXevlZvMNcceTNwUeCFzqJEEEwa7JQhvUomywLsfSZUsIRjfVyrIBQtVafs/CsiHw3FjpA==
X-Received: by 2002:a05:6512:b22:b0:50c:c8b8:6689 with SMTP id
 w34-20020a0565120b2200b0050cc8b86689mr2383978lfu.12.1702329717143; 
 Mon, 11 Dec 2023 13:21:57 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 vh2-20020a170907d38200b00a1be80a0b69sm5333806ejc.58.2023.12.11.13.21.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/24] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Mon, 11 Dec 2023 22:19:50 +0100
Message-ID: <20231211212003.21686-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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


