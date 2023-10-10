Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F7FCD6911
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq94D-0000kV-Ml; Tue, 10 Oct 2023 05:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq946-0000c9-LL
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq941-0007u9-0X
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso941543566b.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930202; x=1697535002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nwvgJq8V3A4EcSBga8/aE9oI0VJyJynq/QeqcrvxjMA=;
 b=M/FBDsV3WEJI1A2p7uD+1WX1INrQn74vsji79O3GzNBLd5NxGjckQwL2nQW4LNdcK+
 JhX/5mkw60VTHUphOuVX8EzKukuFoEXbFtLmajNwVqt9We1amZbgYTlK1ljtTrvbA3Rb
 svxMHhw2VsaKbUOrQ2QRLKQVadpNk+7oVDD3i5zdEl+5ZMhE7qUrkRSKDQd3UOerHJQb
 MqHErIuRuDmkoLc2MuJOVjrVi1lv4FiYc+Jqc3m0C7x0qUh51cAvOTV/4JyDi3ZGnnuX
 5KDmSfmU8UAjLPmXDqORq9t6cEpSumxiVkb3YfegWbwcblTWWvjfLQAJaymhj0XMmrxE
 vt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930202; x=1697535002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwvgJq8V3A4EcSBga8/aE9oI0VJyJynq/QeqcrvxjMA=;
 b=kq1NDh/4XMeDL4TvjYTYLuTtIT1EbkjaufRlcpHTjhaEbF/l3cV4wsevoF/QssC0Gb
 xj6znPnEINXrhm0ba1VdXdjx/8TGvyCQbWC+XQDPILUyprbZFzkieLKcSjANy9KNs2pC
 aDbFfZD5XTqJ0kv8TOSlNarNJF3NPEkxlZOPPhSwgoh3GOx0xONU+70Lpvjfg0eY52iV
 ItW5+FeL3WOJbCHGk20LcM6XUm1YKvr/IptsVFS7XN3GIaM6Byy/yVNvl5wWRcS8fNiG
 qLhB1Ikq+DpdJgDUNtaMKm1R9vlyflv2G6dc7PAmpNsBVKquBkiBbQ1AJnzVb3lLmaX4
 KeWQ==
X-Gm-Message-State: AOJu0YxNBvAChhIaYkgUzWoHDPDvmvZmypD58OnWraXWJiN0puFkShmo
 NaeOH9JseJrX9jyKauMcVNa+kQ==
X-Google-Smtp-Source: AGHT+IH4/C4D6JfPun4dMXVKZAGAn9crmf37YYJDsdbEGK20EOz0gS74xCscGbGx9qvPr9SAuMR6ww==
X-Received: by 2002:a17:907:7790:b0:9b9:facb:d950 with SMTP id
 ky16-20020a170907779000b009b9facbd950mr9601202ejc.72.1696930202689; 
 Tue, 10 Oct 2023 02:30:02 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 v19-20020a1709064e9300b00988e953a586sm8108187eju.61.2023.10.10.02.29.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 07/18] target/nios2: Declare QOM definitions in 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:49 +0200
Message-ID: <20231010092901.99189-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
 target/nios2/cpu-qom.h | 32 ++++++++++++++++++++++++++++++++
 target/nios2/cpu.h     | 22 +---------------------
 2 files changed, 33 insertions(+), 21 deletions(-)
 create mode 100644 target/nios2/cpu-qom.h

diff --git a/target/nios2/cpu-qom.h b/target/nios2/cpu-qom.h
new file mode 100644
index 0000000000..0bcf2c724f
--- /dev/null
+++ b/target/nios2/cpu-qom.h
@@ -0,0 +1,32 @@
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
+/**
+ * Nios2CPUClass:
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A Nios2 CPU model.
+ */
+struct Nios2CPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#endif
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 70b6377a4f..e19e12b2a6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -21,35 +21,15 @@
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
-/**
- * Nios2CPUClass:
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A Nios2 CPU model.
- */
-struct Nios2CPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 #define TARGET_HAS_ICE 1
 
 /* Configuration options for Nios II */
-- 
2.41.0


