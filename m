Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D020C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:13:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxQC-0000IE-3a; Mon, 06 Nov 2023 06:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQ7-0000EE-Lv
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQ5-0004FK-TP
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32f9268bf8cso2602556f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268724; x=1699873524; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXuP88BtphoINz4Bov6u/pkpdXdezQqYli4OVAIpAZI=;
 b=E6sFIdPbRUgtedzhm31+W27IgBnLNqA870oNNPo7xpe2Epet+mWfdOg0Ozzfm/AeGZ
 8xnBNQQUHMZ0cSAZMIhp9Os5+jL8+vdnSJ0LRguG3tiBnrZrVq+0EmA1LoCyGMwqO4td
 1n7+ukVgLh2RSJSh/G2c9AP1R5Lh6wRtkz9J+s0NP7U0afk3lyn4S6/cZUY/s+OeBWIX
 9M6KLaCjTloEWlurqMztSiXJDvD9Xo9Vzt/1aGG9WB5U+IzJVItIAKMWL8Lyuwsoa0ck
 vicMop8uV3SNmsW69MgTWUsjRWwjFPBkfeoAPK+W9W7s6JagXP0yclD9bpQ9juGR1Amy
 6JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268724; x=1699873524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXuP88BtphoINz4Bov6u/pkpdXdezQqYli4OVAIpAZI=;
 b=tJajRrGLZ1PDj4ZyBGizzogpaOhOhaqqC99C0xsgt59emdbqrIwkK9OUtf4l7rEiAR
 etJEAq3MFKxShWnkM9IDM3lsTnQbHUqILZ4VZaVcB2VxhJKSshR6Abm/u0CeLAkoc0T+
 KOhZy8yQMgd6X05DXv53EbvInQQ+2r4pTaxhdVSfoqhsohLEPd87QQ7UYvdLvZ4PT0YK
 K0XUj76kzBz3bGE1TqKg0wQZyZXQqjYT+HqCwo5VxvRdW8TQezsnP8fAY4+OCS6tnDeG
 evQL5EhVC8hxZ3HMQ5ZaKem0CMfZEtSikb1Ikle3Bch/RMd9eNbPHl0huVfmaDNqFQdo
 sjtQ==
X-Gm-Message-State: AOJu0YwNRc/6xp1eu2deyntPr9wWlYfxBBBZSj3tR9ZBgI59UuZl8o91
 EvBEoRFQUlFoVYzlalLw5m4BKeTBMin3p6Kib3Y=
X-Google-Smtp-Source: AGHT+IHaBHUQklVP9Pu5QT4vT7r66jTjw7Yf4RVyFH1CKsmkdCj1+2Bfzei9MwaofGzJpViR1lgQOw==
X-Received: by 2002:adf:e6c4:0:b0:32f:adaf:be86 with SMTP id
 y4-20020adfe6c4000000b0032fadafbe86mr8820884wrm.16.1699268724027; 
 Mon, 06 Nov 2023 03:05:24 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d5686000000b0032f7eaa6e43sm9161653wrv.79.2023.11.06.03.05.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:05:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/60] target/loongarch: Declare QOM definitions in 'cpu-qom.h'
Date: Mon,  6 Nov 2023 12:02:47 +0100
Message-ID: <20231106110336.358-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.
Add a comment clarifying that in the header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-9-philmd@linaro.org>
---
 target/loongarch/cpu-qom.h | 24 ++++++++++++++++++++++++
 target/loongarch/cpu.h     | 10 +---------
 2 files changed, 25 insertions(+), 9 deletions(-)
 create mode 100644 target/loongarch/cpu-qom.h

diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
new file mode 100644
index 0000000000..82c86d146d
--- /dev/null
+++ b/target/loongarch/cpu-qom.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_QOM_H
+#define LOONGARCH_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGARCH_CPU "loongarch-cpu"
+#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
+#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
+                        LOONGARCH_CPU)
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+
+#endif
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 8f0e9f0182..c8839f4cff 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -17,6 +17,7 @@
 #include "exec/memory.h"
 #endif
 #include "cpu-csr.h"
+#include "cpu-qom.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -381,13 +382,6 @@ struct ArchCPU {
     const char *dtb_compatible;
 };
 
-#define TYPE_LOONGARCH_CPU "loongarch-cpu"
-#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
-#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
-                        LOONGARCH_CPU)
-
 /**
  * LoongArchCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -478,8 +472,6 @@ void loongarch_cpu_list(void);
 
 #include "exec/cpu-all.h"
 
-#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
-#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
 #endif /* LOONGARCH_CPU_H */
-- 
2.41.0


