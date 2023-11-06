Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD89FC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxQK-0000gJ-E5; Mon, 06 Nov 2023 06:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQF-0000N0-Oz
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQC-0004Gm-FX
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40853c639abso32197815e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268731; x=1699873531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3038rtVd/3WYQydMHaBWtXOqOEbAhMugZOF+LS9h+c=;
 b=tnXy+ljfqN/bFaqgguFy2kkMlkWY85zE0Ury7NcBz0Lt/hK5npWtZ2e6jiYjf84+Yj
 TbZoMVC04XGVL1uvXgMeKQPd/1jrUErAo4RavOkUCPlv7EtILVpig/L570C9XlBJt8i7
 TXfXa5AFkAYqD1jjYxlJgfcKUt5AkSwtZ9Y9lXgIPogIfXRbfnD09xnnTg5Hoej0MRkh
 7rS9WOtPt8wk98OKrAtivaPFb2uvGfto2IH0lOTrSVQKtVbMTjFEedBNkMxOyWshtDqm
 fvCj2Mu2jvSZw3cgWtwHd5g+WZoK3a0KFx9sPHeqiToZxAwM2OqePDHVYYjeKiGRH3CP
 2P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268731; x=1699873531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3038rtVd/3WYQydMHaBWtXOqOEbAhMugZOF+LS9h+c=;
 b=Gyyr3wq4W4rYct2nqF5X1xUwn+v9qEpSlbFU7RrK3trX8qwcAvIp1ADEzL0HWNGkUD
 avHqT1rWEcl9pqwqmMlwHHb6tN62UP3om/VkIXud1LEPW9+9gMG5oYPeb0p65jeQiOPu
 /P4OE2izG10baXwoKMvWwIgCWfRgOU/7IBGG0MaqQ7oWBuy2n0pjeFnPG3AdS14vYq+E
 +wkb9olmTEVfIbDWmSIBbMJGKIWoi8m6acTpl9+ZMv6NeWc84t4DISHmJxl7pxX19vZ+
 Ua5/xvIRWbdXyYx7QUu/Ml0HoVlhEcLTz87LQAprWzqca1QWiVvbJoAZSJrQ3zPTBN1R
 CqDg==
X-Gm-Message-State: AOJu0YztCUwzRNXp5x+RKskjZ5b/9uQQxPQc+sBVTw5d9oEtuHHo/HqT
 8RDChLFC26LxGFdd2D3GkBkvcA==
X-Google-Smtp-Source: AGHT+IEmOjZD5v1Cylghy37IhDMNKkapCYPdrPhk6W27hiP8WG5JpxCt9Mc0gI0+angLDuM2K899rw==
X-Received: by 2002:a05:600c:4897:b0:401:38dc:8916 with SMTP id
 j23-20020a05600c489700b0040138dc8916mr23234105wmp.10.1699268731199; 
 Mon, 06 Nov 2023 03:05:31 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b00407752f5ab6sm12025312wms.6.2023.11.06.03.05.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:05:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PULL 16/60] target/nios2: Declare QOM definitions in 'cpu-qom.h'
Date: Mon,  6 Nov 2023 12:02:48 +0100
Message-ID: <20231106110336.358-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-10-philmd@linaro.org>
---
 target/nios2/cpu-qom.h | 19 +++++++++++++++++++
 target/nios2/cpu.h     |  7 +------
 2 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 target/nios2/cpu-qom.h

diff --git a/target/nios2/cpu-qom.h b/target/nios2/cpu-qom.h
new file mode 100644
index 0000000000..931bc69b10
--- /dev/null
+++ b/target/nios2/cpu-qom.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU Nios II CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2012 Chris Wulff <crwulff@gmail.com>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef QEMU_NIOS2_CPU_QOM_H
+#define QEMU_NIOS2_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_NIOS2_CPU "nios2-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
+
+#endif
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ede1ba2140..2d79b5b298 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -21,20 +21,15 @@
 #ifndef NIOS2_CPU_H
 #define NIOS2_CPU_H
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "hw/core/cpu.h"
 #include "hw/registerfields.h"
-#include "qom/object.h"
 
 typedef struct CPUArchState CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
 #include "mmu.h"
 #endif
 
-#define TYPE_NIOS2_CPU "nios2-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
-
 /**
  * Nios2CPUClass:
  * @parent_phases: The parent class' reset phase handlers.
-- 
2.41.0


