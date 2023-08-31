Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB731C83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhJ3-0003hI-QB; Thu, 31 Aug 2023 09:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFU-0003DR-4b
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:13 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFO-0005Uw-Kc
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fee8af9cb9so7632145e9.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486685; x=1694091485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sO6ZIHVbK+18/xJUsh8T6zEIqxOQUhu4K3Jic6wZRnQ=;
 b=eAfEucj3tx5MHS8XSt0+Y5gnfFbBdtRonS/X6q3aeIuLsFSDo1nkfYrLjdf7JJ3F1d
 xezkHhByE8Wg28C0Wf64ZDYSmVNnG1FOpefo4A8m69NWOxkuc8YmAS63NmzDuMkF6zOF
 zkPU21UcWRZH/rggjJf/+8P+225bbEHW0vX7E26779QET0/n7YDECEaw2ciKV0tVtRlV
 2gTgv3/dSNEfyESNBsjFnudzeeI65pDKCb+ahff9DraPb0P6ZlwgJ23I13Qly2rVJd1h
 +m1iixHtWHvU6peP+vNa29vJIY96SdYOgJBQx3w0cg9MqJB6ePxfRhkIoSCEZ1xOp/mu
 kxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486685; x=1694091485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sO6ZIHVbK+18/xJUsh8T6zEIqxOQUhu4K3Jic6wZRnQ=;
 b=LBwVWIjKwWzKdVMdWUUXzL823xbQN6jq4J0O+Cfp957j7mLxE+QHaUKDVC34GH4EGM
 AZFZ9uLhjT0vdqhnsyh15iqcVHj2//WDJ9WIRzX2gZJ1nFUJfVinYKundMvPuWdlIKC9
 1bpx7Dp62EyqJOonjSjB1wwtdyozsNCGxhgk9KZpAqGX5Z59MMFsAYcJMnDB7oKNl/XY
 L/377zKxWWmIbNBhbTDIqTYlSe9IioB4zhJdvtfcs9KwXtEfBPG5UHBYHUU0nW3ZKCZ/
 ACxi9HhI6vjp9q3ueIB11NgVcdIgnEkjB9ee/8bZuI5Q9gUrAKq0sBkrN8Wks8KYaQMt
 GS0w==
X-Gm-Message-State: AOJu0YyWCNOnyjmpwruP5PlqfzhHOqks0fI4wEdQBQsT9kXg79+HIyqe
 3EsQh/RlNRvvOCi15NtR6XWyxA==
X-Google-Smtp-Source: AGHT+IEm+SuDqgTbS1yZNwTu6hF6uRicfOULaORbf9jp4vcHf3wEA6xYNjdsWBIS9eyE0v4IaCr3xg==
X-Received: by 2002:a7b:cd0a:0:b0:401:cc0f:f866 with SMTP id
 f10-20020a7bcd0a000000b00401cc0ff866mr4839520wmj.12.1693486685237; 
 Thu, 31 Aug 2023 05:58:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a7bcd97000000b003fbc9d178a8sm5168090wmj.4.2023.08.31.05.58.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 13/41] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Thu, 31 Aug 2023 14:56:15 +0200
Message-ID: <20230831125646.67855-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

These files don't use the CPU ld/st API, remove the unnecessary
"exec/cpu_ldst.h" header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230828221314.18435-7-philmd@linaro.org>
---
 target/riscv/pmu.h                   | 1 -
 target/cris/op_helper.c              | 1 -
 target/mips/tcg/fpu_helper.c         | 1 -
 target/mips/tcg/sysemu/lcsr_helper.c | 1 -
 target/s390x/tcg/excp_helper.c       | 1 -
 target/s390x/tcg/fpu_helper.c        | 1 -
 target/xtensa/mmu_helper.c           | 1 -
 target/xtensa/op_helper.c            | 1 -
 8 files changed, 8 deletions(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index d2be06a133..60fdd6f42c 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -18,7 +18,6 @@
 
 #include "cpu.h"
 #include "qemu/main-loop.h"
-#include "exec/exec-all.h"
 
 bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
diff --git a/target/cris/op_helper.c b/target/cris/op_helper.c
index 40cb74ce73..98a9aaf504 100644
--- a/target/cris/op_helper.c
+++ b/target/cris/op_helper.c
@@ -24,7 +24,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 //#define CRIS_OP_HELPER_DEBUG
 
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 8ce56ed7c8..45d593de48 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -25,7 +25,6 @@
 #include "internal.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index 942143d209..8f97d04313 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -13,7 +13,6 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index b7116d0577..b875bf14e5 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index c329b31261..d8bd5748fa 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index fa66e8e867..57b75882c4 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -34,7 +34,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 #define XTENSA_MPU_SEGMENT_MASK 0x0000001f
 #define XTENSA_MPU_ACC_RIGHTS_MASK 0x00000f00
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 1af7becc54..10a2b51f91 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -31,7 +31,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "qemu/timer.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0


