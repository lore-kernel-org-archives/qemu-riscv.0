Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D51ACDB484
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImO-0003vF-3F; Fri, 13 Oct 2023 10:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkp-00081P-VZ
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:11 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkj-0002QQ-TH
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo3597189a12.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205776; x=1697810576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qQPmY7CjfjcpTejSUl9tIgNfX8ASpiti+kcpc3Y4dk=;
 b=fPkzqsegTNyOgC2xdfbVFCkf3zrkJ9P2Lg9OWwL5eKOu4OzG4H4mgohVvUGRhXTRDt
 v8C7dEJgoUZ6LPEZ/d2dbiuDvJtrvUP4L/W0ot6WHjUbmv56fYfwoURR00tdzuGwKtoD
 HedGI91dnc5oTME1M8RTrSP9KiUCNuCZ2WCN/cJmiNt/E/jcY3CTx1fRcbMe1jiyldDd
 IMU0N4a9ZE/RNubMfUbnHKHv7TeK64BKDZ8MG5X5wa4feMoqX34iX9OSKBJesBDADHzj
 ZEDvryhd9wA4cwjpFdhD+vvIvjyPuCBG7AcVAZpB4P0oqrcTSpqAnC19Am9zBXAYxq6M
 SeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205776; x=1697810576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qQPmY7CjfjcpTejSUl9tIgNfX8ASpiti+kcpc3Y4dk=;
 b=Ii6XJjlbAP6lA8fgZXQ3U2nM/GjZwTz/9Khf/ytbCMGeYLLA7LEzIFk04xIiBqUteo
 O3ptQBxSC0gJ4Z4tIHsLfmWrX/jXnDZszA0Kh96J9CM79fTdBwf1TTFyfREL0KiMOkBT
 3i9V4fynqdrz3TmsYr5yLTz2GruZQ9sVkw9HszUFRFJuN+Qt5HNWU667WRhlzoxHklyq
 J/YvNmD450KPdlC2+0eZNaLjezux1j/aNdApnLO3f9V2z/H1IpgYt9gCEcohd+uKozSi
 ulx6g2jGCVXin2rXIdewSxvaLW9FNKlfZR1pMHjfGhm3k72+7JYarHRbr9KFFu/Xw7gp
 8V0g==
X-Gm-Message-State: AOJu0YxCSXBIs8szQvKLStKpUrUXWnuq4ypTjCoGnDBD5Wv8g1v8Kug9
 GvJjzdrCVrMxBBVaujzAagN7Xg==
X-Google-Smtp-Source: AGHT+IH62Mir+fxaKntidtHVm8yYxVSZjrUeHRJD+CnIw5qRwaZz/g3DrDu7lCJdipPNuySxl19DIw==
X-Received: by 2002:a05:6402:3213:b0:53d:eb53:4d0c with SMTP id
 g19-20020a056402321300b0053deb534d0cmr7396964eda.37.1697205776496; 
 Fri, 13 Oct 2023 07:02:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa7d652000000b00533dad8a9c5sm11514331edr.38.2023.10.13.07.02.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:56 -0700 (PDT)
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
Subject: [PATCH v2 10/16] target/openrisc: Declare QOM definitions in
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:09 +0200
Message-ID: <20231013140116.255-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/openrisc/cpu-qom.h | 22 ++++++++++++++++++++++
 target/openrisc/cpu.h     | 10 +---------
 2 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 target/openrisc/cpu-qom.h

diff --git a/target/openrisc/cpu-qom.h b/target/openrisc/cpu-qom.h
new file mode 100644
index 0000000000..1ba9fb0a4c
--- /dev/null
+++ b/target/openrisc/cpu-qom.h
@@ -0,0 +1,22 @@
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
+#endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 29cda7279c..dedeb89f8e 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -20,17 +20,12 @@
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
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -304,7 +299,6 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -339,8 +333,6 @@ void cpu_openrisc_count_start(OpenRISCCPU *cpu);
 void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #endif
 
-#define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
-#define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
 #include "exec/cpu-all.h"
-- 
2.41.0


