Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF2C83F14
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUl-0006AQ-Rh; Mon, 28 Aug 2023 18:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUk-00063b-9T
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUf-0004Eb-TU
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31dcd553fecso1050318f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260836; x=1693865636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFie4e5LMyCNfAjlAs6VDkMreh5h1iDKK7cod2ZiiFQ=;
 b=gDjAWI8/JSVW8Phd2NrVTwBldvnUm7CP+tV2lTeJqs1EJ7OV2+IaOGrRpoIQGN+WPu
 GQiGS7YrdNkYOL1MaBno4f88roqcnrGWQkOrujEG3AQ7Y9vv3wLZ6lFZ/S1EL8D01Dor
 aKrDrF2rdt0fw6RIXNrJc9MUmS9cTEdHe64Ll8yTQP4/fysu9uBc7qd1pCmN+urlmr9s
 V7CJlr+U67TQubnlYuSJ/urpBpC+RC9lx7SV7KSwpBV2aV4xiwetYp6QLbGiw6wdcTOS
 fq+DOtmT1GdsVrF5j1GAHUTkI4IRNu3lDhtOrYZrFc7Iw/lT6+6eVX3OBN/lRJ0TiYhC
 nbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260836; x=1693865636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFie4e5LMyCNfAjlAs6VDkMreh5h1iDKK7cod2ZiiFQ=;
 b=c9RzSfP6l4vfhrmztExi5jdTiBU+wl4WwusEO4WAhsMl+6nuJBGKUTJK1XoFZhdLTc
 c5oE5SYgDWZPKQJM7hNm2imYsMBzVodB+gc/tYXMDeJnXvAPTNlZQkRdWBkAbB52wDJJ
 ww5pZgN8H/4MK1Heuj6CuBzH2wjg5720pG9mCKj+66URTJdW3lftumoRl33C+ZqnWMjU
 yKcbTUfw7W84mq0i5jGgpTjL7h0MHC4vyqg1QZK2SOtHk1BJDr9YwOYrGVuBN4vctAJ7
 96v7GCZh07cdqed8CUNFfBckGrtpA3HorfmuI1+gQ7aSAQ1ZRO/aqM63N5jJ4zFQKsiy
 oeSA==
X-Gm-Message-State: AOJu0Yw2/ST3YP/RMvIRRetLzcmMxGiTq30IMrLldEtYLqZIzfOyI6Pb
 NYDgivNwfHUQ8MM5KCC8x9B9svZqA0Kx4R+Drbk=
X-Google-Smtp-Source: AGHT+IFoPMMipn1rH8nYfiFenMc8oPaJK/A6aGU6HxAmoOZgt4Os3fKrhqnrW9TqyMFkEqQa05kUwA==
X-Received: by 2002:adf:ffc9:0:b0:319:52da:8f0b with SMTP id
 x9-20020adfffc9000000b0031952da8f0bmr19894754wrs.17.1693260836611; 
 Mon, 28 Aug 2023 15:13:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a7bcd17000000b003feef82bbefsm11885542wmj.29.2023.08.28.15.13.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/11] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Tue, 29 Aug 2023 00:13:09 +0200
Message-ID: <20230828221314.18435-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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


