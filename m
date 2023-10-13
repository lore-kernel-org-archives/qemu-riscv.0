Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA9FCDB482
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:04:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrIlw-0001oN-MP; Fri, 13 Oct 2023 10:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkm-0007xF-Tk
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:04 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkc-0002PF-0c
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so354206566b.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205768; x=1697810568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07DFvbHkZiBMbxAaSmNu0dQsKVUwAhLuuLPTQQVTtt0=;
 b=OCkIlB5RGSCHe071andYqFdVb9ogjsaDXvF/7LQxPRSnO9we7hUVvhVx3/3nsrMNcC
 QPKO69OZKPA50TM+G766N7tTOQRyudfsQpafFVUWyjqSZDt6PcAY8bxw11FMO8Nk/Prw
 +0L+VI0HTdL6emtoNPh3WEgAYuV6+wqfgA3VLvyEK4r2ogHDhHXpAtMXwiRSI8jO0QpT
 +miGQbCfzxA4f6OfsSqMPKelqAhQU9mQc9tI7V8+cS60ehl2/fuFqx2cpZaC4eSrrPW7
 bKhvGMdkI4kkMtfPAvDAoE2Wpuc08AnUYyWcY3CpvinrGlzrlTE1M2xS9NVjKQPQc9Ws
 4LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205768; x=1697810568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07DFvbHkZiBMbxAaSmNu0dQsKVUwAhLuuLPTQQVTtt0=;
 b=DlQ+cbPXrjnCF3+FdXObGjhkW2CQJzWZbwOw7dKl1xTa7utsEk/QOqeb9cZgoc6JEz
 FSlZoQFIoNeKeKSuWkgfCODMQEcQH2HDHRHPvg3bsGAIwHr5NNmkNc7uku7Y4vt0G9kK
 d875JXXm9evO4wshF5SJ2UaMCM+1LYxVysbqGHE3bxDgNw6pIfymLYuB91ICh1jeLwQK
 BwvUs1TBkdxU7FmgaXzyypPTElC39bniQETv1xFTtdRG6gmzjn9sdJDK6xesUs4Ug+O9
 bIXvt/XkxCBvZpY8YpzIK4ztxOZ4wxXUjgV8xuTwgU2xT9sHL2V82Z/whSeqvqEDHfPB
 yoTA==
X-Gm-Message-State: AOJu0YyrHIFQxxSIBrSMxkKwSGNE+QJV2yZzxmh0+9JaSAwkvxsMx0eE
 nt3kHtmQHmDurq+DXxpAEItEJA==
X-Google-Smtp-Source: AGHT+IF0MgTuffSuLQf+8mWdRN0EMmwPLc18I8H23/s25LL3At91zxn8IRztVrSLYvfR9OFMWDKnfA==
X-Received: by 2002:a17:906:8a47:b0:9b8:9b30:aff with SMTP id
 gx7-20020a1709068a4700b009b89b300affmr22902546ejc.1.1697205767691; 
 Fri, 13 Oct 2023 07:02:47 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a1709063c1100b009b94a8150d8sm12508110ejg.199.2023.10.13.07.02.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 09/16] target/nios2: Declare QOM definitions in 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:08 +0200
Message-ID: <20231013140116.255-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


