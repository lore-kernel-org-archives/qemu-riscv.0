Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546EACDB482
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImH-0003L1-7p; Fri, 13 Oct 2023 10:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkP-0007VZ-NW
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:40 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkJ-0002Ly-L8
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:34 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so333003466b.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205750; x=1697810550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkqit7if0np+hOPuR/lmFr1Vsbe3YApoPUZEdcDy8j8=;
 b=wp7IVVd0MoQDS/YwweUZ19//bP0+yjaq7MxBRZeyxSBAZhSHH1eSl8XCnISKSLwHP8
 ziYpQICPoCm4+jZupLd16UsLPCM64+yNa2VfSrhx+jpYVsn/iHON158ogGMrrR6SaOQT
 aKOEL3hP81p3e8O1bRmVQ2CgfaZ5SIWsoRQCeRt7kTSoyP0UsNlOQLFLDfdsN7Sd8Ya1
 KVi1tJkX/+x6C3COxb8Loy0wQmh2D8ApkfnqgmrYpu4E3SQMJC5vt5qFE2Al/VKxtXfO
 zpG8ChYQgndeuzmIANiW0fveHBo/PgGXs9iMjQYK5DtSQQsyxKuqhQW0ei/pRCjGxJs6
 AAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205750; x=1697810550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkqit7if0np+hOPuR/lmFr1Vsbe3YApoPUZEdcDy8j8=;
 b=KFnzZpRlExGkXAw6WxH4VNruiLn+ewPbDXkDn2BucOnKJS3cPpPDOJ05GqIFdMsZOo
 UO0ImFfzuwmXsiaMopA6VI4zvEoDbZ0seykXaxHOP8EymvCwJ3g/4qSXG5rrN/GXjqmA
 IkEHRWlUMqojpiOyqx3GCyycb0xRZ39PVnLUygAFmnZEV3WSJjPRJ+Wz/836En2mQUuI
 i2uLMlXM1HDMRPf4NxmFUiHXXNA0IFzfvF6YFUPgWxgtNwIl1RyEokNg3umvOz+Jtgnn
 shIryPIPsE7ZPbuyXA/G0i2o7ENBfUp8xUlXcAhpGct8DI2L9HTwyL9v7q7xnVViPEi1
 A3cQ==
X-Gm-Message-State: AOJu0YzxotHQeX4cCvYwYr+mCtc79sWGIJnIk/6kzCXDjxo7SkLfE5sw
 rijPpmiCDFCjnOrEsN4EAaCxrA==
X-Google-Smtp-Source: AGHT+IE9vhGWnqZ8fU0EqTsNYKVTuFnnsA0Qd42Sfgp+6Czba9iohQLiizJLJ3jW5r+RThXOPh1usw==
X-Received: by 2002:a17:907:9282:b0:9bd:bbc1:1c65 with SMTP id
 bw2-20020a170907928200b009bdbbc11c65mr1241200ejc.13.1697205749739; 
 Fri, 13 Oct 2023 07:02:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 st12-20020a170907c08c00b009b9f87b34b6sm11026896ejc.189.2023.10.13.07.02.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:29 -0700 (PDT)
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
Subject: [PATCH v2 07/16] target/hexagon: Declare QOM definitions in
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:06 +0200
Message-ID: <20231013140116.255-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
 target/hexagon/cpu-qom.h | 28 ++++++++++++++++++++++++++++
 target/hexagon/cpu.h     | 15 +--------------
 2 files changed, 29 insertions(+), 14 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h

diff --git a/target/hexagon/cpu-qom.h b/target/hexagon/cpu-qom.h
new file mode 100644
index 0000000000..f02df7ee6f
--- /dev/null
+++ b/target/hexagon/cpu-qom.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU Hexagon CPU QOM header (target agnostic)
+ *
+ * Copyright(c) 2019-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_HEXAGON_CPU_QOM_H
+#define QEMU_HEXAGON_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_HEXAGON_CPU "hexagon-cpu"
+
+#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
+#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
+
+#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
+#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
+#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
+#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
+#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
+
+OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
+
+#endif
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 035ac4fb6d..7d16083c6a 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -20,11 +20,10 @@
 
 #include "fpu/softfloat-types.h"
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
-#include "qom/object.h"
-#include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 
 #define NUM_PREGS 4
@@ -36,18 +35,8 @@
 #define PRED_WRITES_MAX 5                   /* 4 insns + endloop */
 #define VSTORES_MAX 2
 
-#define TYPE_HEXAGON_CPU "hexagon-cpu"
-
-#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
-#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
 
-#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
-#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
-#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
-#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
-#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
-
 void hexagon_cpu_list(void);
 #define cpu_list hexagon_cpu_list
 
@@ -127,8 +116,6 @@ typedef struct CPUArchState {
     VTCMStoreLog vtcm_log;
 } CPUHexagonState;
 
-OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
-
 typedef struct HexagonCPUClass {
     CPUClass parent_class;
 
-- 
2.41.0


