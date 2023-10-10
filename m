Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E473CCD6914
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:32:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq95D-0001sE-8D; Tue, 10 Oct 2023 05:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94U-0000sj-De
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94O-00087K-VN
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-533f193fc8dso9509623a12.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930227; x=1697535027; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ty5A8kcVGZ5VAZ2hfMU3PH9M5Fs6Xopxrwnt8GKnicA=;
 b=zniWLfBANnCE1t8Yfh3k6j4lfrxCepBXZ8o0THtRaLla7edeeH1NbFkAte48JKXidT
 lFISkWVdlGV4ixVxmpqk5OOBY8JGNhDLEprMlfRdaUbIY/iqU1mJ48/cunEfwE3Toh8a
 olmu/vXAj9wAh3JeJTpfg8Z1zuvqI/9TaPq4biTXtfCBO3wrFLOAW4ZIF6PNqu8qDNCy
 F2BhidOWJzIw1ntRq1skTYg5mLWNgA3ZoEEtQh7r83XI8+/pESeYfMjlES5qNznT4PTk
 CslgH7olw7qAxGw0QjQJjzMCaaKXJdvXLoA216yqS8wriWDgFG0s6p663Wl9PCcSbMgM
 svBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930227; x=1697535027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ty5A8kcVGZ5VAZ2hfMU3PH9M5Fs6Xopxrwnt8GKnicA=;
 b=q3+1L04cXIYkZRMe9ucKPBRzfXjNui6qUchjVdfysI/jxA8qy52BEEIIuXzNu+WOsY
 od/YapZqztfK/UuhRh4WqoW6viBNAH+vN935V6Vs2d2c+CbgIoLCy8sKU1fC0rt8/ZKg
 rrHMKMC/YDO6W/ICi+EM1cOwGIHlI1Ia5dGMSImwQ/23taHqVLL+FO0LNd0jlmXYsaWe
 +eF3QP7fJS6jZyUcrkVuh05z2tiVSrd+JM80YUvsz7hf7HLAmxGH/D9ppkBms8EClG5R
 hxPNeZUBVQRR461Sn6GOsnC5rsaNsM9WEO0g2a4El9TaIsUqfqJXABz65sj0CFVdXyRE
 +VaA==
X-Gm-Message-State: AOJu0YzJ+RAr2f96TDeAD52NINbufPrOgLW7IKs+1/UHEn4jS+PI50W4
 P6pTtNIQsvKQyviIJItkRig8GA==
X-Google-Smtp-Source: AGHT+IEenp8xBxzKdWj19lDU52il/RpaW16cYHh0GWNjWrzcaBKpCXQClHFW5YIYG6MSWfbY8WdgeQ==
X-Received: by 2002:aa7:c55a:0:b0:532:c81b:99b1 with SMTP id
 s26-20020aa7c55a000000b00532c81b99b1mr15462000edr.18.1696930227507; 
 Tue, 10 Oct 2023 02:30:27 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c59a000000b00530ccd180a3sm7276170edq.97.2023.10.10.02.30.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:27 -0700 (PDT)
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
Subject: [PATCH 10/18] target/riscv: Inline target specific
 TYPE_RISCV_CPU_BASE definition
Date: Tue, 10 Oct 2023 11:28:52 +0200
Message-ID: <20231010092901.99189-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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

TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
definitions which are target specific. Such target specific
definition taints "cpu-qom.h".

Since "cpu-qom.h" must be target agnostic, remove its target
specific definition uses by inlining TYPE_RISCV_CPU_BASE in the
two machines using it.

"target/riscv/cpu-qom.h" is now fully target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu-qom.h | 8 +-------
 hw/riscv/spike.c       | 8 +++++++-
 hw/riscv/virt.c        | 8 +++++++-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 8cb67b84a4..f607687384 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU RISC-V CPU QOM header
+ * QEMU RISC-V CPU QOM header (target agnostic)
  *
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  *
@@ -43,12 +43,6 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 typedef struct CPUArchState CPURISCVState;
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 81f7e53aed..eae49da6d6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -349,7 +349,13 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spike_board_init;
     mc->max_cpus = SPIKE_CPUS_MAX;
     mc->is_default = true;
-    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+#if defined(TARGET_RISCV32)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
+#elif defined(TARGET_RISCV64)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
+#else
+#error unsupported target
+#endif
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5edc1d98d2..620a4e5f07 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1685,7 +1685,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
-    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+#if defined(TARGET_RISCV32)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
+#elif defined(TARGET_RISCV64)
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
+#else
+#error unsupported target
+#endif
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.41.0


