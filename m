Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307B7C77B7F
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 May 2023 05:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q0FPU-0007OJ-9e; Sat, 20 May 2023 01:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPS-0007Ni-H1
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPM-0007dN-MV
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso39042475e9.2
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 22:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684561535; x=1687153535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RyvUr1lBMxRBlxutUWdrrmWw/Nx1e27AsLVC25y0F4=;
 b=PKELuvhix3C+uVNxCIR8DvVIH2Yt+Ib+Vzmkog7WpfbrdAojUOlmjgCbrklPZ2y4Fe
 vZ4M1Bmhj3NE0JgJnPEbhQb4rmV9wPevKq20o8wHnaajeW3kJv224xJiTdQHs/6egrsl
 VoNumvN/q8EyZekG29cbMjPCkI5uaKO7UkbzxsoSSls3edKdMTYWt9yH0MhEnqOMxXxk
 xpFQ5qMi4Bbc1T3KlfTL5Dcc5CUgGIBteypjqR4zllWwuO2CtIuCgYSgL1gVfno5AQCi
 irnDNunFBORvfSku4lo8wv0XPepcGx6zj+1+12DCdopoDcHlXIA5cgBVL/vC9E8o7rPE
 UMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684561535; x=1687153535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RyvUr1lBMxRBlxutUWdrrmWw/Nx1e27AsLVC25y0F4=;
 b=FgBrPp3A9cULuLcbdY+iUXUb1e57BEJXimOWtHTiheFxQ0QiaPLtdHd5th80ZY+TQ+
 hbRiGXuFq+jBGDTtmQurY8VX8XN6qMrPBfKc7wbpHk78DnMA5PQ58Dx/yfnIU9rje7yE
 8tJB4JhoWCS+6liISwgkj3f6O+mFy0Ocy/281AmN3OV9midtq+q57cTYJm5+ybZ8hhbJ
 WBHKx8/GJy53lf8fcPgGTuH87/2yJD3e+BmQ/8PDU6vAxTiLpcXsncD/rlnbge0aqBeA
 iqavuhRU7IYgvpd15fVmEdHHNxHD3daEBrraE4N9JyfNqEyPJQLjDEIYkDqfF7+wEDGe
 1uRA==
X-Gm-Message-State: AC+VfDwRNrVfCWQN7BVe7oEbYa7nulvZwx+F6iIhvesbgH8buTfflduw
 IN+bBSYPVjWPuY9CCg5EMuQT8g==
X-Google-Smtp-Source: ACHHUZ5indZZtlhR4htSlNxfXZ69jjfj5/lLARRLYmoUQWRVX6L9s0yNgpxOZSMEpp/OXlDFMspxyQ==
X-Received: by 2002:a7b:cc11:0:b0:3f0:9564:f4f6 with SMTP id
 f17-20020a7bcc11000000b003f09564f4f6mr2980027wmh.1.1684561534942; 
 Fri, 19 May 2023 22:45:34 -0700 (PDT)
Received: from localhost.localdomain
 (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a7bc3c1000000b003f42158288dsm4377319wmj.20.2023.05.19.22.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 May 2023 22:45:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/riscv/opentitan: Explicit machine type definition
Date: Sat, 20 May 2023 07:45:09 +0200
Message-Id: <20230520054510.68822-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230520054510.68822-1-philmd@linaro.org>
References: <20230520054510.68822-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Expand the DEFINE_MACHINE() macro, converting the class_init()
handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/riscv/opentitan.h |  3 ++-
 hw/riscv/opentitan.c         | 10 +++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index fd70226ed8..806ff73528 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -24,6 +24,7 @@
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
 #include "hw/ssi/ibex_spi_host.h"
+#include "hw/boards.h"
 #include "qom/object.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
@@ -53,7 +54,7 @@ struct LowRISCIbexSoCState {
     MemoryRegion flash_alias;
 };
 
-#define TYPE_OPENTITAN_MACHINE "opentitan"
+#define TYPE_OPENTITAN_MACHINE MACHINE_TYPE_NAME("opentitan")
 
 typedef struct OpenTitanState {
     /*< private >*/
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7d7159ea30..9535308197 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -108,8 +108,10 @@ static void opentitan_machine_init(MachineState *machine)
     }
 }
 
-static void opentitan_machine_class_init(MachineClass *mc)
+static void opentitan_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "RISC-V Board compatible with OpenTitan";
     mc->init = opentitan_machine_init;
     mc->max_cpus = 1;
@@ -118,8 +120,6 @@ static void opentitan_machine_class_init(MachineClass *mc)
     mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
 }
 
-DEFINE_MACHINE(TYPE_OPENTITAN_MACHINE, opentitan_machine_class_init)
-
 static void lowrisc_ibex_soc_init(Object *obj)
 {
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(obj);
@@ -327,6 +327,10 @@ static const TypeInfo open_titan_types[] = {
         .instance_size  = sizeof(LowRISCIbexSoCState),
         .instance_init  = lowrisc_ibex_soc_init,
         .class_init     = lowrisc_ibex_soc_class_init,
+    }, {
+        .name           = TYPE_OPENTITAN_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .class_init     = opentitan_machine_class_init,
     }
 };
 
-- 
2.38.1


