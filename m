Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D7DCD6911
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:31:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq94n-0001Bf-CO; Tue, 10 Oct 2023 05:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94F-0000kx-D9
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94B-00083a-8w
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:19 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9adca291f99so920169766b.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930211; x=1697535011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/Dazi2VzLCUVkcADynMQnmNFinEpKaq76+gzFIU2vQ=;
 b=dFh3/cNe+On7xhRCW8nuZ6RCMK46Ax5YXxIYv8IepPwWGll2phVbZL1lwX3fwSwFLF
 xjudtckYYeoqxE6hVpJqNbVXj8klHG5Ouh8TDp8hCXdPlRW13IyVMYrUvNr/BYyEOjI2
 QL7OS3stmrQ63c+syx/e0FrQRDQ5EE1Te5isVHGG/Z6Kzd6rl40Cuo5O/tX9ApxovvhR
 A5sD1XX2m5Go6t7XfauS9xfMQ0tUtSpYJKrsr2VRsVrEVGFZe9k4BUct4SnaZLm7qIHw
 8zZv94AXXErcyAwbUM2Hl+ex1zlDdA8msxG6GkW2DwRMn2WLByjHbb6h2N33/ZFFUwdo
 2DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930211; x=1697535011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/Dazi2VzLCUVkcADynMQnmNFinEpKaq76+gzFIU2vQ=;
 b=YmIOz96MoBjMsKLt0vx2dfB+Tkdw/0GO98ehcvEAMDOCNpciXnNswiU8vh8+lg+mBr
 mFT+vOrfrdeBwJDuMYqY+x7CwBFcNU7FDQbIMsulRoRfbHJl0vC4hXqdo7xTdYssUKZh
 22xcKnaIjxScfj97Li1TL1TZrY5HMbbLxb/Ki6s+l8yxj1iJoN6/EA6Nm4BHwftHcyKN
 WwjYw2xdWpj+bTXksGHZRIRJDDO4noJCKnRLrRmggJOstCyQXeCDZfi/ceFnAss69d6Q
 XzctIOSyP9kDeovPIVtlYsV5vyz+iOclZPtAINM9hzk2UZLIl2shr7fy/L5btGyNjkkH
 Q1zg==
X-Gm-Message-State: AOJu0YwDO7Ffa6O9Rt3W7nAMx+nwduGWtQscpj0HKkCj+xoducacXi/M
 hqhi7rsI33aGR5aqTSxNabnHxg==
X-Google-Smtp-Source: AGHT+IFHssq17A3NQW5cP9e5gb+hqJWg8Jf9CvZJzbj+LSlF9LhUBGLXRGpVvOxMbr2W1pGU22EbtQ==
X-Received: by 2002:a17:907:2704:b0:9ae:961a:de81 with SMTP id
 w4-20020a170907270400b009ae961ade81mr14194859ejk.27.1696930210993; 
 Tue, 10 Oct 2023 02:30:10 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 n12-20020a170906378c00b009ade1a4f795sm8142642ejc.168.2023.10.10.02.30.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:10 -0700 (PDT)
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
Subject: [PATCH 08/18] target/openrisc: Declare QOM definitions in 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:50 +0200
Message-ID: <20231010092901.99189-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
 target/openrisc/cpu-qom.h | 36 ++++++++++++++++++++++++++++++++++++
 target/openrisc/cpu.h     | 26 +-------------------------
 2 files changed, 37 insertions(+), 25 deletions(-)
 create mode 100644 target/openrisc/cpu-qom.h

diff --git a/target/openrisc/cpu-qom.h b/target/openrisc/cpu-qom.h
new file mode 100644
index 0000000000..d1930acb74
--- /dev/null
+++ b/target/openrisc/cpu-qom.h
@@ -0,0 +1,36 @@
+/*
+ * QEMU OpenRISC CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef QEMU_OPENRISC_CPU_QOM_H
+#define QEMU_OPENRISC_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_OPENRISC_CPU "or1k-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
+
+#define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
+#define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
+
+/**
+ * OpenRISCCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A OpenRISC CPU model.
+ */
+struct OpenRISCCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 334997e9a1..2dccd67378 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -20,33 +20,12 @@
 #ifndef OPENRISC_CPU_H
 #define OPENRISC_CPU_H
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
-#include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
-#define TYPE_OPENRISC_CPU "or1k-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
-
-/**
- * OpenRISCCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A OpenRISC CPU model.
- */
-struct OpenRISCCPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
 enum {
@@ -308,7 +287,6 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -343,8 +321,6 @@ void cpu_openrisc_count_start(OpenRISCCPU *cpu);
 void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #endif
 
-#define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
-#define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
 #include "exec/cpu-all.h"
-- 
2.41.0


