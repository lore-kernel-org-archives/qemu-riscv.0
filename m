Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31980C04FFE
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:49:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RV7-00085B-5n; Fri, 26 Apr 2024 15:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RV5-0007v0-J7
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:44:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RV2-0003zN-D0
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:44:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a58772187d8so303539666b.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160687; x=1714765487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQMRED2mjhykafQx2tnnAWOSRm9bpyuzeSKJlhGVxZw=;
 b=kLCeSw48jzbLw6FmZf9QirNjOA8veHZkAjtOoXIxMqUjLZwWRBMDrmzv7/aQArBYOD
 a4NmYjIrROvBakxedvSY9Lrb9yc+QuYCUidiJxgXFtpcR7G3uxy1ZLltvO/4bpJrvBDM
 r9mpYCLaflT3RRWPZmDXa+ZbCeowHW4q9GTOri1F55Za1ECKUARQJVjKoYK78QnfxcAo
 zVQrbEd6hsfZRR/pAdCx85h75v37vlCvEH5SUyED0N+Blt9J/ckpg9sPi2umpQAzY+jr
 Nzo6uozJUPp8CW7Ok2pa6UK/smTUBoBeped+bQXTlN1ZT5AMY0neV65wLBEOvgwA61XK
 6kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160687; x=1714765487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQMRED2mjhykafQx2tnnAWOSRm9bpyuzeSKJlhGVxZw=;
 b=UjUaxJOhc+h+cSGnMjI+HcnYXhjdnqz3XmgrFq7ANnlfe/la1TJRrLnXnvP43f2kC2
 xzkPxkSmr2UCR4lMLCjKNZY86dYKZTBn1SjYKYs0DdFGgyXYAiyZJ+3HdiJlJW9MYfWA
 L4aeN5owW/ftpdWp37YIHZ0ln4NAJYzQMaK0aIweCt8tCk4yWaRlZhayIHmchXV6AFQl
 EowguBOVYD6dfDFplciITZkQuN3y0I7jeeg+BzkacbRDezSmVnRFxUlDK00T5EfylRp6
 HIb763+XZkl9os4kOMNzWmQ26y9f5PnyskSa+8jD3VkAys734Ys8Xzm4zO6UmxsbUttI
 trYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXwZqXOiOyrGC35ghOPLZU6xCnZAL+RYE6+fVEiR02JrTEANJC1Sg8gKWb0KBIlLW9OIGHvjg+lRsHlNEtibaj92zF0NQ=
X-Gm-Message-State: AOJu0YzMXTfu+f+ELZzB+6P/EJKqIzMSKad6trzR+nvULJfw5nDfT4iQ
 UaWHKQUZLgfuz2C/xMwhwwXQfc3cL3AdTBlmOf12q7LXPT+IwNkLFhAbk7Eofwk=
X-Google-Smtp-Source: AGHT+IGkSBbrj4EQnB+bQwF/zO/uHNI5Yjc5v9Hyllb4ajEgqEXjcYE1EGW33SEqmw4JoQy+YxNjJQ==
X-Received: by 2002:a17:906:f748:b0:a55:6602:e3a9 with SMTP id
 jp8-20020a170906f74800b00a556602e3a9mr3903164ejb.1.1714160686795; 
 Fri, 26 Apr 2024 12:44:46 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 qt11-20020a170906eceb00b00a55ab2630c3sm7155905ejb.38.2024.04.26.12.44.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>
Subject: [PULL 28/38] exec/user: Do not include 'cpu.h' in 'abitypes.h'
Date: Fri, 26 Apr 2024 21:41:48 +0200
Message-ID: <20240426194200.43723-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

"exec/user/abitypes.h" requires:

 - "exec/cpu-defs.h"           (TARGET_LONG_BITS)
 - "exec/tswap.h"              (tswap32)

In order to avoid "cpu.h", pick the minimum required headers.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231212123401.37493-20-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/user/abitypes.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
index 731f345ff5..3ec1969368 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -1,7 +1,12 @@
 #ifndef EXEC_USER_ABITYPES_H
 #define EXEC_USER_ABITYPES_H
 
-#include "cpu.h"
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+#include "exec/cpu-defs.h"
+#include "exec/tswap.h"
 #include "user/tswap-target.h"
 
 #ifdef TARGET_ABI32
-- 
2.41.0


