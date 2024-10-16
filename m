Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E762D2A544
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:34:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t19kO-0002gw-2N; Wed, 16 Oct 2024 15:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kK-0002da-Ba
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:48 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kG-0003ne-Ju
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:47 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-20c77459558so1573845ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 12:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729107103; x=1729711903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9pm4mmiOJ3ePRNfWoDr3osUdbmj8mTSaBfTsfRhvEA=;
 b=H2mYNCwIjh2gWxzIwji23kcmFroPqhHUIbXVhEcdmYjmKHeEZKpXEPcXt3qSM50dUl
 VyPd5OefxqqwzesB0vOZOOrnqM4r37bqgu2rfqgwVXWNG3OT5vmy63bQ1KtkPoMFiTMJ
 zPODQEKln1nfN2OeLyUw+MZAF17ryT+KlD8R3QFH5JwheSeQepUuXwPU4w8q6gHkfKyR
 lb+d0tvy2LG6GnbmVl5GlMtYapRrnkD0y01NGsmqHALicH2Rw4Bb3Wlv+PHpIbw5y5pI
 sbZ+G6OTIGYeERAKqMfnKVGc0w9Z5vT7WDaFvwdr+TzJlQIwhdBg1M9qvqQMYFaWRZh5
 Trtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729107103; x=1729711903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9pm4mmiOJ3ePRNfWoDr3osUdbmj8mTSaBfTsfRhvEA=;
 b=erKQoLT9qozkOaxsnG59/wX5aXft+TnDF8ADmyfkeR4f2mEA8/NUMQhIVSemFSZ7e3
 c6+XeVw79mSzLYhAIBy4Upr3gPMqe0ri7g92ztrCzCEuurgUUl2jJgg7KH49P5DM07vr
 6TjeC3NGMPykAye9Pws+tqxu6NoFWYXRrDPSAlTMU98gDKczPJtT40BK4LBCIJ+9WGIf
 Qp9rOQqC7qIV210rwYod0aHUylRJZcF/mBF/5tu8kLV/okMvPnoDpv7lChALmtlMmBY2
 0ntEBD37rIbuXInPRY7msCkbdLWQg8mW3o0kHrpPm7wG0mhLHdRiOnztna+pCgpXhPwN
 mzkg==
X-Gm-Message-State: AOJu0YzphO3iZlD8fREqa2Z++6KsfYjbFT/X2cLI83lEo/4GGbcyORST
 usslcowqI4Itu+CHDLMiF0rd/nzw8gwiU2j5zBu94wKqC+IOSrLz+lXDj5W9u3E=
X-Google-Smtp-Source: AGHT+IEbxcJArg42k++Rr7k+42e+j+oxbTriW9eALQDzvP4g5pI/++j0U7VbgwUs5VFYQIIE3bYwWg==
X-Received: by 2002:a17:903:2309:b0:20b:8907:b597 with SMTP id
 d9443c01a7336-20ca1682ab9mr258903615ad.28.1729107103360; 
 Wed, 16 Oct 2024 12:31:43 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b6b1sm32323945ad.189.2024.10.16.12.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:31:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 zhiwei_liu@linux.alibaba.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
Subject: [PATCH v6 03/14] util: Add RISC-V vector extension probe in cpuinfo
Date: Wed, 16 Oct 2024 12:31:29 -0700
Message-ID: <20241016193140.2206352-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016193140.2206352-1-richard.henderson@linaro.org>
References: <20241016193140.2206352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>

Add support for probing RISC-V vector extension availability in
the backend. This information will be used when deciding whether
to use vector instructions in code generation.

Cache lg2(vlenb) for the backend. The storing of lg2(vlenb) means
we can convert all of the division into subtraction.

While the compiler doesn't support RISCV_HWPROBE_EXT_ZVE64X,
we use RISCV_HWPROBE_IMA_V instead. RISCV_HWPROBE_IMA_V is more
strictly constrainted than RISCV_HWPROBE_EXT_ZVE64X. At least in
current QEMU implemenation, the V vector extension depends on the
zve64d extension.

Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20241007025700.47259-2-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/riscv/host/cpuinfo.h |  2 ++
 util/cpuinfo-riscv.c              | 24 ++++++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/host/include/riscv/host/cpuinfo.h b/host/include/riscv/host/cpuinfo.h
index 2b00660e36..cdc784e7b6 100644
--- a/host/include/riscv/host/cpuinfo.h
+++ b/host/include/riscv/host/cpuinfo.h
@@ -10,9 +10,11 @@
 #define CPUINFO_ZBA             (1u << 1)
 #define CPUINFO_ZBB             (1u << 2)
 #define CPUINFO_ZICOND          (1u << 3)
+#define CPUINFO_ZVE64X          (1u << 4)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
+extern unsigned riscv_lg2_vlenb;
 
 /*
  * We cannot rely on constructor ordering, so other constructors must
diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
index 8cacc67645..16114ffd32 100644
--- a/util/cpuinfo-riscv.c
+++ b/util/cpuinfo-riscv.c
@@ -4,6 +4,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "host/cpuinfo.h"
 
 #ifdef CONFIG_ASM_HWPROBE_H
@@ -13,6 +14,7 @@
 #endif
 
 unsigned cpuinfo;
+unsigned riscv_lg2_vlenb;
 static volatile sig_atomic_t got_sigill;
 
 static void sigill_handler(int signo, siginfo_t *si, void *data)
@@ -34,7 +36,7 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
 /* Called both as constructor and (possibly) via other constructors. */
 unsigned __attribute__((constructor)) cpuinfo_init(void)
 {
-    unsigned left = CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZICOND;
+    unsigned left = CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZICOND | CPUINFO_ZVE64X;
     unsigned info = cpuinfo;
 
     if (info) {
@@ -50,6 +52,9 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
 #endif
 #if defined(__riscv_arch_test) && defined(__riscv_zicond)
     info |= CPUINFO_ZICOND;
+#endif
+#if defined(__riscv_arch_test) && defined(__riscv_zve64x)
+    info |= CPUINFO_ZVE64X;
 #endif
     left &= ~info;
 
@@ -65,7 +70,8 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
             && pair.key >= 0) {
             info |= pair.value & RISCV_HWPROBE_EXT_ZBA ? CPUINFO_ZBA : 0;
             info |= pair.value & RISCV_HWPROBE_EXT_ZBB ? CPUINFO_ZBB : 0;
-            left &= ~(CPUINFO_ZBA | CPUINFO_ZBB);
+            info |= pair.value & RISCV_HWPROBE_IMA_V ? CPUINFO_ZVE64X : 0;
+            left &= ~(CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZVE64X);
 #ifdef RISCV_HWPROBE_EXT_ZICOND
             info |= pair.value & RISCV_HWPROBE_EXT_ZICOND ? CPUINFO_ZICOND : 0;
             left &= ~CPUINFO_ZICOND;
@@ -113,6 +119,20 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
         assert(left == 0);
     }
 
+    if (info & CPUINFO_ZVE64X) {
+        /*
+         * We are guaranteed by RVV-1.0 that VLEN is a power of 2.
+         * We are guaranteed by Zve64x that VLEN >= 64, and that
+         * EEW of {8,16,32,64} are supported.
+         *
+         * Cache VLEN in a convenient form.
+         */
+        unsigned long vlenb;
+        /* Read csr "vlenb" with "csrr %0, vlenb" : "=r"(vlenb) */
+        asm volatile(".insn i 0x73, 0x2, %0, zero, -990" : "=r"(vlenb));
+        riscv_lg2_vlenb = ctz32(vlenb);
+    }
+
     info |= CPUINFO_ALWAYS;
     cpuinfo = info;
     return info;
-- 
2.43.0


